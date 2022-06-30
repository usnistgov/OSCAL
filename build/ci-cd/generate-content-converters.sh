#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
EOF
}

if ! OPTS=$(getopt -o w:vh --long working-dir:,help -n "$0" -- "$@"); then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

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
echo -e "${P_INFO}Generating XML <-> JSON Content Converters${P_END}"
echo -e "${P_INFO}==========================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

declare -a paths
declare -a formats
if [ "$#" -ne 0 ]; then
  paths=("$@")
  for i in "${!paths[@]}"; do
    formats[$i]="xml,json"
  done
else
  IFS_OLD="$IFS"
  while IFS="|" read path gen_schema gen_converter gen_docs || [[ -n "$path" ]]; do
    [[ "$path" =~ ^[[:space:]]*# ]] && continue
    # remove leading space
    path="${path##+([[:space:]])}"

    ([ -z "$path" ] || [ -z "$gen_converter" ]) && continue;

    path_absolute="$OSCALDIR"/"$path"

    IFS= # disable word splitting
    for metaschema in $path_absolute
    do
      paths+=($metaschema)
      formats+=($gen_converter)
    done
  done < "$OSCALDIR/build/ci-cd/config/metaschema"
  IFS="$IFS_OLD"
fi

exitcode=0
for i in ${!paths[@]}; do
  metaschema="${paths[$i]}"
  gen_converter="${formats[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  model="${filename/_metaschema/}"
  metaschema_relative=$(get_rel_path "${OSCALDIR}" "$metaschema")

  #split on commas
  IFS_OLD="$IFS"
  IFS=, gen_formats=($gen_converter)
  IFS="$IFS_OLD"
  for format in ${gen_formats[@]}; do
    if [ -z "$format" ]; then
      # skip blanks
      continue;
    fi

    # setup source and target formats
    case $format in
    xml)
      source_format="json"
      ;;
    json)
      source_format="xml"
      ;;
    *)
      >&2 echo -e "${P_ERROR}Generating converter from '${P_END}${source_format^^}${P_ERROR}' to '${P_END}${target_format^^}${P_ERROR}' is unsupported for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      continue;
      ;;
    esac
    target_format="$format"

    converter="$WORKING_DIR/${target_format}/convert/${model}_${source_format}-to-${target_format}-converter.xsl"
    # ensure the converter directory exists
    mkdir -p "$(dirname "$converter")"
    converter_relative=$(get_rel_path "${WORKING_DIR}" "$converter")


#    echo "source: ${source_format}"
#    echo "target: ${target_format}"
#    echo "metaschema: ${metaschema}"
#    echo "converter: ${converter}"
    args=()
    args+=("--source-format" "${source_format}")
    args+=("--target-format" "${target_format}")

    if [ "$VERBOSE" == "true" ]; then
      args+=("-v")
    fi

    args+=("$metaschema")
    args+=("$converter")

    result=$("$OSCALDIR/build/metaschema/scripts/generate-content-converter.sh" "${args[@]}" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "${P_ERROR}${result}${P_END}"
      echo -e "${P_ERROR}Generation of ${source_format^^} to ${target_format^^} converter failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      exitcode=1
    else
      echo -e "${result}"
    fi
  done
  IFS=$IFS_OLD
done

exit $exitcode
