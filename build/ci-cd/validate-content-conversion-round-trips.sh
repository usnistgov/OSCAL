#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$OSCALDIR/build/metaschema/scripts/include/init-validate-content.sh"
source "$OSCALDIR/build/ci-cd/include/convert-and-validate-content.sh"

# Catalog round trip from XML -> JSON -> XML
MSYS_NO_PATHCONV=1

# Option defaults
KEEP_TEMP_SCRATCH_DIR=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
--scratch-dir DIR                 Generate temporary artifacts in DIR
                                  If not provided a new directory will be
                                  created under \$TMPDIR if set or in /tmp.
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
EOF
}

OPTS=`getopt -o w:vh --long scratch-dir:,keep-temp-scratch-dir,working-dir:,help -n "$0" -- "$@"`
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
    --scratch-dir)
      SCRATCH_DIR="$(realpath "$2")"
      shift # past path
      ;;
    --keep-temp-scratch-dir)
      KEEP_TEMP_SCRATCH_DIR=true
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

OTHER_ARGS=$@ # save the arg

if [ -z "${SCRATCH_DIR+x}" ]; then
  SCRATCH_DIR="$(mktemp -d)"
  if [ "$KEEP_TEMP_SCRATCH_DIR" != "true" ]; then
    function CleanupScratchDir() {
      rc=$?
      if [ "$VERBOSE" = "true" ]; then
        echo -e ""
        echo -e "${P_INFO}Cleanup${P_END}"
        echo -e "${P_INFO}=======${P_END}"
        echo -e "${P_INFO}Deleting scratch directory:${P_END} ${SCRATCH_DIR}"
      fi
      rm -rf "${SCRATCH_DIR}"
      exit $rc
    }
    trap CleanupScratchDir EXIT
  fi
fi

echo -e ""
echo -e "${P_INFO}Validating Content Conversions Using Round-Trips${P_END}"
echo -e "${P_INFO}================================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using scratch directory:${P_END} ${SCRATCH_DIR}"
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

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
    target_file="${SCRATCH_DIR}/roundtrip/${source_file_basename}-to.${target_format}"
    result=$(convert_to_format_and_validate "$source_file" "$target_file" "$source_format" "$target_format" "$model")
    cmd_exitcode=$?
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi

    if [ $cmd_exitcode != 0 ]; then
      exitcode=1
      continue;
    else
      echo -e "${P_OK}Converted ${source_format^^} '${P_END}${source_file_relative}${P_OK}' to ${target_format^^} as '${P_END}${target_file}${P_OK}'.${P_END}"
    fi

    # convert back to source format
    roundtrip_file="${SCRATCH_DIR}/roundtrip/${source_file_basename}-to-${target_format}-back-to.${source_format}"
    result=$(convert_to_format_and_validate "$target_file" "$roundtrip_file" "$target_format" "$source_format" "$model")
    cmd_exitcode=$?
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi

    if [ $cmd_exitcode != 0 ]; then
      exitcode=1
      continue;
    else
      echo -e "${P_OK}Converted ${source_format^^} '${P_END}${target_file}${P_OK}' to ${target_format^^} as '${P_END}${roundtrip_file}${P_OK}'.${P_END}"
    fi

    # compare the XML files to see if there is data loss
    if [ "$VERBOSE" = "true" ]; then
      echo -e "${P_INFO}Checking ${source_format^^}->${target_format^^}->${source_format^^} conversion for '${P_END}${source_file_relative}${P_INFO}'.${P_END}"
    fi

    case $source_format in
    xml)
      result=$(python ${OSCALDIR}/build/ci-cd/python/xmlComparison.py "$roundtrip_file" "$source_file" 2>&1)
      ;;
    json)
      result=$(json-diff "$source_file" "$roundtrip_file" 2>&1)
      ;;
    *)
      echo -e "${P_WARN}Unsupported source compairison format '${source_format^^}'.${P_END}"
      return 4;
      ;;
    esac
    cmd_exitcode=$?
    if [ $cmd_exitcode != 0 ]; then
        echo -e "${P_ERROR}${result}${P_END}"
        echo -e "${P_ERROR}${source_format^^}->${target_format^^}->${source_format^^} round-trip comparison failed for '${P_END}${source_file_relative}${P_ERROR}' against '${P_END}${roundtrip_file}${P_ERROR}'.${P_END}"
        if [ "$VERBOSE" != "true" ]; then
          echo -e "  ${P_ERROR}Using interim file '${P_END}${target_file}${P_ERROR}'.${P_END}"
        fi
        exitcode=1
    else
      echo -e "${P_OK}${source_format^^}->${target_format^^}->${source_format^^} round-trip comparison succeeded for '${P_END}${source_file_relative}${P_OK}' against '${P_END}${roundtrip_file}${P_OK}'.${P_END}"
    fi
  done
done

exit $exitcode
