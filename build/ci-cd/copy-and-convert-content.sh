#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

# also inits saxon
source "$OSCALDIR/build/metaschema/scripts/include/init-validate-content.sh"
source "$OSCALDIR/build/ci-cd/include/convert-and-validate-content.sh"

# Option defaults
RESOLVE_PROFILES=false
ARTIFACT_DIR="${OSCALDIR}"
OSCAL_DIR="${OSCALDIR}"
CONFIG_FILE="${OSCALDIR}/build/ci-cd/config/content"
WORKING_DIR="${OSCALDIR}"

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

--resolve-profiles                Resolve profiles
-a DIR, --artifact-dir DIR        Build source artifacts are stored in DIR.
-o DIR, --oscal-dir DIR           OSCAL schema are located in DIR.
-w DIR, --working-dir DIR         Generate artifacts in DIR
-c FILE, --config-file FILE       The config file location is FILE.
-h, --help                        Display help
-v                                Provide verbose output
EOF
}


if ! OPTS=$(getopt -o a:o:w:c:hv --long resolve-profiles,artifact-dir:,oscal-dir:,working-dir:,config-file:,help -n "$0" -- "$@"); then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    --resolve-profiles)
      RESOLVE_PROFILES=true
      shift # past path
      ;;
    -a|--artifact-dir)
      ARTIFACT_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -o|--oscal-dir)
      OSCAL_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -w|--working-dir)
      WORKING_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -c|--config-file)
      CONFIG_FILE="$(realpath "$2")"
      shift # past path
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -v)
      VERBOSE=true
      ;;
    --) # end of options
      shift
      break;
      ;;
    *)    # unknown option
      echo "Unhandled option: $1"
      exit 1
      ;;
  esac
  shift # past argument
done

OTHER_ARGS=$@ # save the remaining args

echo -e ""
echo -e "${P_INFO}Copying and Converting Content${P_END}"
echo -e "${P_INFO}==============================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using config file:${P_END} ${CONFIG_FILE}"
  echo -e "${P_INFO}Using OSCAL directory:${P_END} ${OSCAL_DIR}"
  echo -e "${P_INFO}Using artifact directory:${P_END} ${ARTIFACT_DIR}"
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

# configuration
PROFILE_RESOLVER="$(get_abs_path "${OSCAL_DIR}/src/utils/util/resolver-pipeline/oscal-profile-RESOLVE.xsl")"
CATALOG_SCHEMA="$(get_abs_path "${OSCAL_DIR}/xml/schema/oscal_catalog_schema.xsd")"

# check for perl
result=$(which perl 2>&1)
cmd_exitcode=$?
if [ $cmd_exitcode != 0 ]; then
  echo -e "${P_ERROR}Perl is not installed. Perl is needed by this script.${P_END}"
  exit 1
fi

IFS_OLD="$IFS"
while IFS="|" read path_glob format model converttoformats || [[ -n "$path_glob" ]]; do
  shopt -s extglob
  [[ "$path_glob" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path_glo="${path_glob##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  [ -z "$path_glob" ] && continue;

  path_absolute="$ARTIFACT_DIR"/"$path_glob"

  for path in $path_absolute; do
#    echo "Path: $path"
#    echo "Format: $format"
#    echo "Model: $model"
#    echo "Convert to: $converttoformats"

    paths+=("$path")
    formats+=("$format")
    models+=("$model")
    conversion_formats+=("$converttoformats")
  done
done < "${CONFIG_FILE}"
IFS="$IFS_OLD"

#echo "Paths: ${paths[@]}"
#echo "Formats: ${formats[@]}"
#echo "Models: ${models[@]}"
#echo "Convert To: ${conversion_formats[@]}"

post_process_content() {
  local source_format="$1"; shift
  local target_format="$1"; shift
  local target_file="$1"; shift
  local working_dir="$1"; shift
  local oscal_dir="$1"; shift

  local result

  local target_dir=${target_file%/*} # remove filename
  local target_filename=${target_file##*/} # remove dir
  local target_file_relative=$(get_rel_path "${working_dir}" "$target_file")

  # Format specific post-processing
  case $target_format in
  json)
    if [ "$source_format" = "xml" ]; then
      if [ "$VERBOSE" = "true" ]; then
        echo -e "${P_INFO}Translating relative XML paths to JSON paths in '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
      fi
      if ! python3 "$OSCALDIR/build/ci-cd/python/convert_filetypes.py" --old-extension xml --new-extension json "${target_file}"; then echo "Failed running conversion of file extensions in content URIs" >&2 ; exit 1 ; fi
    fi

    # produce pretty JSON
    local target_file_pretty="${target_file%-min.json}.json"
    local target_file_pretty_relative="$(get_rel_path "${working_dir}" "$target_file_pretty")"
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Producing pretty JSON '${P_END}${target_file_pretty_relative}${P_INFO}'.${P_END}"
    fi
    result=$(jq . "$target_file" > "$target_file_pretty" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode != 0 ]; then
      echo -e "${P_ERROR}${result}${P_END}"
      echo -e "${P_ERROR}Unable to execute jq on '${P_END}${target_file_pretty_relative}${P_ERROR}'.${P_END}"
      return 1;
    fi

    # remove carriage returns
    perl -pi -e 's,\r,,g' "$target_file_pretty"

    result=$(validate_content "$target_file_pretty" "json" "$model" "$oscal_dir")
    cmd_exitcode=$?
    if [ $cmd_exitcode != 0 ]; then
      echo -e "${P_ERROR}${result}${P_END}"
      echo -e "${P_ERROR}Unable to validate content '${P_END}${target_file_pretty_relative}${P_ERROR}'.${P_END}"
      return 1;
    else
      echo -e "${P_OK}JSON '${P_END}${target_file_pretty_relative}${P_OK}' is valid.${P_END}"
    fi

    # produce yaml
    local yaml_file="${target_file/\/json\///yaml/}" # change path
    yaml_file="${yaml_file%-min.json}.yaml"
    local yaml_dir="${yaml_file%/*}" # remove filename
#    printf 'yaml dir: %s\n' "$yaml_dir"
    mkdir -p "$yaml_dir"
    yaml_file_relative="$(get_rel_path "${working_dir}" "$yaml_file")"
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Producing YAML '${P_END}${yaml_file_relative}${P_INFO}'.${P_END}"
    fi
    yaml-convert -y "$target_file" | (echo "---" && cat) > "$yaml_file"

    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Translating relative paths in '${P_END}${yaml_file_relative}${P_INFO}'.${P_END}"
    fi
    python3 "$OSCALDIR/build/ci-cd/python/convert_filetypes.py" --old-extension json --new-extension yaml "${yaml_file}"
    echo -e "${P_OK}Created YAML '${P_END}${yaml_file_relative}${P_OK}'.${P_END}"
    ;;
  xml)
    if [ "$source_format" = "json" ]; then
      echo -e "${P_INFO}Translating relative paths in '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
      # translate OSCAL mime types
      perl -pi -e 's,(application/oscal\.[a-z]+\+)json\",\1xml\",g' "${target_file}"
      # relative content paths
      # translate path names for local references
      perl -pi -e 's,((?:\.\./)+(?:(?!json/)[^\s/"'']+/)+)json/((?:(?!.json)[^\s"'']+)+).json,\1xml/\2.xml,g' "${target_file}"
    fi
    ;;
  *)
    echo -e "${P_WARN}Post processing of '${target_format^^}' is unsupported for '${P_END}${target_file_relative}${P_WARN}'.${P_END}"
    return 2;
  esac
  return 0;
}

copy_or_convert_content() {
  local source_dir="$1"; shift
  local source_file="$1"; shift
  local source_base_dir="$1"; shift
  local source_format="$1"; shift
  local model="$1"; shift
  local target_format="$1"; shift
  local working_dir="$1"; shift
  local oscal_dir="$1"; shift
  local result

#  printf 'source file: %s\n' "$source_file"
#  printf 'source dir: %s\n' "$source_dir"
#  printf 'source base dir: %s\n' "$source_base_dir"
#  printf 'source format: %s\n' "$source_format"
#  printf 'model: %s\n' "$model"
#  printf 'target format: %s\n' "$target_format"
#  printf 'working dir: %s\n' "$working_dir"

  local source_path="${source_file/$source_base_dir\//}"
  local source_filename="${source_file##*/}"
  local source_file_relative="$(get_rel_path "${source_dir}" "$source_file")"

  local target_dir_prefix="${source_path%/${source_format}/*}" # remove format dir, extra path, and filename
  local target_dir_suffix="${source_path#${target_dir_prefix}/${source_format}/}" # prefix and source format
  target_dir_suffix="${target_dir_suffix%${source_filename}}" # remove the filename
  target_dir_suffix="${target_dir_suffix%/}" # remove the trailing slash

  local target_dir="${working_dir}/${target_dir_prefix}/${target_format}" # build target
  if [ ! -z "$target_dir_suffix" ]; then
    target_dir="${target_dir}/${target_dir_suffix}" # append suffix
  fi

  mkdir -p "$target_dir"

#  printf 'source path: %s\n' "$source_path"
#  printf 'source filename: %s\n' "$source_filename"
#  printf 'source file (rel): %s\n' "$source_file_relative"
#  printf 'target dir: %s\n' "$target_dir"

  local target_filename;
  case $target_format in
  xml)
    target_filename="${source_filename%.${source_format}}.${target_format}"
    ;;
  json)
    target_filename="${source_filename%.${source_format}}-min.${target_format}"
    ;;
  *)
    echo -e "${P_WARN}Conversion from '${source_format^^} to '${target_format^^}' is unsupported for '${P_END}${source_file_relative}${P_OK}'.${P_END}"
    return 1;
  esac
  local target_file="${target_dir}/${target_filename}"
  local target_file_relative="$(get_rel_path "${working_dir}" "$target_file")";

#  printf 'target file: %s\n' "$target_file"
#  printf 'target file (rel): %s\n' "$target_file_relative"

  if [ "$source_format" = "$target_format" ]; then
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Copying ${source_format^^} ${model} from '${P_END}${source_file_relative}${P_INFO}' to '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
    fi
    result=$(cp "$source_file" "$target_file" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode != 0 ]; then
      echo -e "${P_ERROR}${result}${P_END}"
      echo -e "${P_ERROR}Unable to copy '${P_END}${source_file_relative}${P_ERROR}' to '${P_END}${target_file_relative}${P_ERROR}'.${P_END}"
      return 1;
    else
      echo -e "${P_OK}Copied '${P_END}${source_file_relative}${P_OK}' to '${P_END}${target_file_relative}${P_OK}'.${P_END}"
    fi
  else
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Converting ${source_format^^} ${model} '${P_END}${source_file_relative}${P_INFO}' to ${target_format^^} as '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
    fi

    result=$(convert_to_format_and_validate "$source_file" "$target_file" "$source_format" "$target_format" "$model" "$oscal_dir")
    cmd_exitcode=$?
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi
    if [ $cmd_exitcode != 0 ]; then
      return 1;
    else
      echo -e "${P_OK}Converted ${source_format^^} ${model} '${P_END}${source_file_relative}${P_OK}' to ${target_format^^} as '${P_END}${target_file_relative}${P_OK}'.${P_END}"
    fi
  fi

  # post process copied/converted file
  if [ "$VERBOSE" = "true" ]; then
    echo -e "${P_INFO}Post processing ${target_format^^} content '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
  fi
  result=$(post_process_content $source_format $target_format $target_file $working_dir $oscal_dir)
  cmd_exitcode=$?
  if [ -n "$result" ]; then
    echo -e "${result}"
  fi
  if [ $cmd_exitcode != 0 ]; then
    return 1;
  fi

  # Perform model-specific conversions
  case $model in
  profile)
    if [ "$RESOLVE_PROFILES" = "true" ]; then
      # handle profile resolution
      if [ "$source_format" = "xml" ] && [ "$target_format" = "xml" ]; then
        if [ "$VERBOSE" = "true" ]; then
          echo -e "${P_INFO}Resolving profile '${P_END}${source_file_relative}${P_INFO}'.${P_END}"
        fi
        resolved_profile="${target_dir}/${source_filename%_profile.xml}-resolved-profile_catalog.xml"
#        printf 'resolved profile: %s\n' "$resolved_profile"

        result=$(xsl_transform "${PROFILE_RESOLVER}" "$source_file" "${resolved_profile}" 2>&1)
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
          if [ -n "$result" ]; then
            echo -e "${P_ERROR}${result}${P_END}"
          fi
          echo -e "${P_ERROR}Failed to resolve profile '${P_END}${resolved_profile}${P_ERROR}'.${P_END}"
          return 1;
        fi

        result=$(validate_xml "$CATALOG_SCHEMA" "${resolved_profile}")
        cmd_exitcode=$?
        if [ $cmd_exitcode != 0 ]; then
          if [ -n "$result" ]; then
            echo -e "${P_ERROR}${result}${P_END}"
          fi
          echo -e "${P_ERROR}Resolved profile '${P_END}${resolved_profile}${P_ERROR}' is not a valid OSCAL catalog.${P_END}"
          return 1;
        else
          echo -e "${P_OK}Resolved profile '${P_END}${target_filename}${P_OK}' to '${P_END}${resolved_profile}${P_OK}'.${P_END}"
        fi
      elif [[ ! "$source_file" =~ -resolved-profile_catalog\.xml$ ]] && [ "$source_format" = "xml" ] && [ "$target_format" = "json" ]; then
        resolved_profile="${working_dir}/${source_path%_profile.xml}-resolved-profile_catalog.xml"
 #       printf 'resolved profile: %s\n' "$resolved_profile"
        if [ "$VERBOSE" = "true" ]; then
          echo -e "${P_INFO}Converting resolved profile '${P_END}${resolved_profile}${P_INFO}' to JSON.${P_END}"
        fi
        result="$(copy_or_convert_content "$source_dir" "$resolved_profile" "$working_dir" $src_format "catalog" $target_format "$working_dir" "$oscal_dir")"
        cmd_exitcode=$?
        if [ -n "$result" ]; then
          echo -e "${result}"
        fi
        if [ $cmd_exitcode != 0 ]; then
          return 1;
        fi
      fi
    fi
    ;;
  esac

  return 0;
}

process_paths() {
#  local -n paths=$1; shift
#  local -n formats=$1; shift
#  local -n models=$1; shift
#  local -n conversion_formats=$1; shift

#  printf 'paths: %s\n' "${paths[@]}"
#  printf 'formats: %s\n' "${formats[@]}"
#  printf 'models: %s\n' "${models[@]}"
#  printf 'converttoformats: %s\n' "${conversion_formats[@]}"

  local exitcode=0;
  #shopt -s nullglob
  #shopt -s globstar

  for i in ${!paths[@]}; do
  #  echo "Index: $i"
    local src_file="${paths[$i]}"
    local src_format="${formats[$i]}"
    local model="${models[$i]}"
    local converttoformats="${conversion_formats[$i]}"
    local result

#    printf 'source file: %s\n' "$src_file"
#    printf 'source format: %s\n' "$src_format"
#    printf 'model: %s\n' "$model"
#    printf 'converttoformats: %s\n' "${converttoformats[@]}"

    result="$(copy_or_convert_content "$ARTIFACT_DIR" "$src_file" "${ARTIFACT_DIR}/src" $src_format $model $src_format "$WORKING_DIR" "$OSCAL_DIR")"
    cmd_exitcode=$?
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi
    if [ $cmd_exitcode -ne 0 ]; then
        exitcode=1
        continue;
    fi

    #split on commas
    IFS_OLD="$IFS"
    IFS=, to_formats=($converttoformats)
    IFS="$IFS_OLD"
    for to_format in ${to_formats[@]}; do
      if [ -z "$to_format" ]; then
        # skip blanks
        continue;
      fi

      result="$(copy_or_convert_content "$ARTIFACT_DIR" "$src_file" "${ARTIFACT_DIR}/src" $src_format $model $to_format "$WORKING_DIR" "$OSCAL_DIR")"
      cmd_exitcode=$?
      if [ -n "$result" ]; then
        echo -e "${result}"
      fi
      if [ $cmd_exitcode -ne 0 ]; then
          exitcode=1
          continue;
      fi

    done
  done
  return $exitcode;
}

process_paths #"${paths[@]}" "${formats[@]}" "${models[@]}" "${conversion_formats[@]}"
exit $?
