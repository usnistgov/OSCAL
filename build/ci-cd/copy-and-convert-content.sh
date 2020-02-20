#!/bin/bash


if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-validate-content.sh"
source "$OSCALDIR/build/ci-cd/include/convert-and-validate-content.sh"

# Option defaults

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
EOF
}

OPTS=`getopt -o w:vh --long working-dir:,help -n "$0" -- "$@"`
if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    -w|--working-dir)
      WORKING_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -v)
      VERBOSE=true
      ;;
    -h|--help)
      usage
      exit 0
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
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

# check for perl
result=$(which perl 2>&1)
if [ $? -ne 0 ]; then
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

  path_absolute="$OSCALDIR"/"$path_glob"

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
done < "${OSCALDIR}/build/ci-cd/config/content"
IFS="$IFS_OLD"

#echo "Paths: ${paths[@]}"
#echo "Formats: ${formats[@]}"
#echo "Models: ${models[@]}"
#echo "Convert To: ${conversion_formats[@]}"

shopt -s nullglob
shopt -s globstar

exitcode=0
for i in ${!paths[@]}; do
#  echo "Index: $i"
  source_file="${paths[$i]}"
  source_format="${formats[$i]}"
  model="${models[$i]}"
  converttoformats="${conversion_formats[$i]}"

  # get the base file name
  source_file_basename=$(basename $source_file)
  source_file_relative=$(get_rel_path "$OSCALDIR" "$source_file")

  # debuggging statements, shows what is processing
#  printf 'path: %s\n' "$file"
#  printf 'file name: %s\n' "$file_basename"
#  printf 'Source format: %s\n' "$source_format"
#  printf 'model: %s\n' "$model"
#  printf 'convert-to: %s\n' "$converttoformats"

  source_schema="$WORKING_DIR/$source_format/schema/oscal_${model}_schema.xsd"

  # copy source to destination
  # --------------------------
  target_file="$WORKING_DIR/${source_file/$OSCALDIR\/src\//}"
  target_dir=${target_file%/*} # remove filename
  mkdir -p "$target_dir"
  target_file_relative=$(get_rel_path "${WORKING_DIR}" "$target_file")

  result=$(cp "$source_file" "$target_file" 2>&1)
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "${P_ERROR}Unable to copy '${P_END}${source_file_relative}${P_ERROR}' to '${P_END}${target_file_relative}${P_ERROR}'.${P_END}"
    echo -e "${P_ERROR}${result}${P_END}"
  else
    echo -e "${P_OK}Copied '${P_END}${source_file_relative}${P_OK}' to '${P_END}${target_file_relative}${P_OK}'.${P_END}"
  fi

  #split on commas
  IFS_OLD="$IFS"
  IFS=, to_formats=($converttoformats)
  IFS="$IFS_OLD"
  for target_format in ${to_formats[@]}; do
    if [ -z "$target_format" ]; then
      # skip blanks
      continue;
    fi

    # convert to target format
    # ------------------------
    newpath="${source_file/$OSCALDIR\/src\//}" # strip off src
    newpath="${newpath/\/$source_format\///$target_format/}" # change path from old to new format dir
    newpath="${newpath%.*}" # strip extension

    case $target_format in
    xml)
      target_file="$WORKING_DIR/${newpath}-min.${target_format}"
      ;;
    json)
      target_file="$WORKING_DIR/${newpath}-min.${target_format}"
      ;;
    *)
      echo -e "${P_WARN}Conversion from '${source_format} to '${target_format^^}' is unsupported for '${P_END}${source_file_relative}${P_OK}'.${P_END}"
      continue;
    esac

    target_dir=${target_file%/*} # remove filename
    mkdir -p "$target_dir"

    target_file_relative=$(get_rel_path "${WORKING_DIR}" "$target_file")
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Performing ${source_format^^}->${target_format^^} conversion of '${P_END}${source_file_relative}${P_INFO}' to '${P_END}${target_file_relative}${P_INFO}'.${P_END}"
    fi
    
    result=$(convert_to_format_and_validate "$source_file" "$target_file" "$source_format" "$target_format" "$model")
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi
    cmd_exitcode=$?
    if [ $cmd_exitcode != 0 ]; then
        exitcode=1
        continue;
    else
      echo -e "${P_OK}Converted ${source_format^^} '${P_END}${source_file_relative}${P_OK}' to ${target_format^^} as '${P_END}${target_file_relative}${P_OK}'.${P_END}"
    fi

    # Format specific post-processing
    case $target_format in
    json)
      # Remove extra slashes
      # perl -pi -e 's,\\/,/,g' "${dest}"
      # translate OSCAL mime types
      perl -pi -e 's,(application/oscal\.[a-z]+\+)xml\",\1json\",g' "${target_file}"
      # relative content paths
      # translate path names, starting first with the xml directory, then the filename
      perl -pi -e 's,(\.\./[^\"]+(?=/xml/))/xml/,\1/json/,g' "${target_file}"
      perl -pi -e 's,(\.\./[^\"]+(?=/json/)[^\"]+(?=.xml\")).xml\",\1.json\",g' "${target_file}"
      perl -pi -e 's,(\"[^/\"]+(?=\.xml\")).xml\",\1.json\",g' "${target_file}"

      # produce pretty JSON
      target_file_pretty="$WORKING_DIR/${newpath}.${target_format}"
      target_file_pretty_relative=$(get_rel_path "${WORKING_DIR}" "$target_file_pretty")
      result=$(jq . "$target_file" > "$target_file_pretty" 2>&1)
      if [ $? -ne 0 ]; then
        echo -e "${P_ERROR}${result}${P_END}"
        echo -e "${P_ERROR}Unable to execute jq on '${P_END}${target_file_pretty_relative}${P_ERROR}'.${P_END}"
        exitcode=1
        continue
      fi

      # remove carriage returns
      perl -pi -e 's,\r,,g' "$target_file_pretty"

      result=$(validate_content "$target_file_pretty" "json" "$model")
      if [ $? -ne 0 ]; then
        echo -e "${P_ERROR}${result}${P_END}"
        echo -e "${P_ERROR}Unable to execute jq on '${P_END}${target_file_pretty_relative}${P_ERROR}'.${P_END}"
        exitcode=1
        continue
      fi

      # produce yaml
      newpath="${newpath/\/json\///yaml/}" # change path
      target_file_yaml="$WORKING_DIR/${newpath}.yaml"
      target_file_yaml_dir=${target_file_yaml%/*} # remove filename
      mkdir -p "$target_file_yaml_dir"
      prettyjson --nocolor=1 --indent=2 --inline-arrays=1 "$target_file" > "$target_file_yaml"
      ;;
    xml)
      # do nothing
      ;;
    *)
      echo -e "${P_WARN}Post processing of '${altformat^^}' is unsupported for '${P_END}${dest_relative}${P_OK}'.${P_END}"
      continue;
    esac
  done
done

exit $exitcode
