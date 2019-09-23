#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"

# Option defaults
WORKING_DIR="${OSCALDIR}"
VERBOSE=false
HELP=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options] [metaschema paths]

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

echo ""
echo "${P_INFO}Generating XML <-> JSON Content Converters${P_END}"
echo "${P_INFO}==========================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

declare -a paths
declare -a formats
if [ "$#" -ne 0 ]; then
  paths=("$@")
  for i in "${!paths[@]}"; do
    formats[$i]="xml,json"
  done
else
  while IFS="|" read path gen_schema gen_converter gen_docs || [[ -n "$path" ]]; do
    [[ "$path" =~ ^[[:space:]]*# ]] && continue
    # remove leading space
    path="${path##+([[:space:]])}"

    ([ -z "$path" ] || [ -z "$gen_converter" ]) && continue;

    path_absolute="$OSCALDIR"/"$path"

    IFS_OLD=$IFS
    IFS= # disable word splitting
    for metaschema in $path_absolute
    do
      paths+=("$metaschema")
      formats+=("$gen_converter")
    done
    IFS=$IFS_OLD
  done < "$OSCALDIR/build/ci-cd/config/metaschema"
fi

exitcode=0
for i in "${!paths[@]}"; do
  metaschema="${paths[$i]}"
  gen_converter="${formats[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  model="${filename/_metaschema/}"
  metaschema_relative=$(realpath --relative-to="${OSCALDIR}" "$metaschema")

  #split on commas
  IFS_OLD=$IFS
  IFS=, #read -a formats <<< "$gen_schema"
  for target_format in ${gen_converter}; do
    if [ -z "$target_format" ]; then
      # skip blanks
      continue;
    fi

    # Run the XSL template for the format
    case $target_format in
    xml)
      source_format="json"
      ;;
    json)
      source_format="xml"
      ;;
    *)
      echo "${P_WARN}Generating converter from '${source_format^^}' to '${target_format^^}' is unsupported for '${P_END}${metaschema_relative}${P_WARN}'.${P_END}"
      continue;
      ;;
    esac

    converter="$WORKING_DIR/${target_format}/convert/${model}_${source_format}-to-${target_format}-converter.xsl"
    converter_relative=$(realpath --relative-to="${WORKING_DIR}" "$converter")

    if [ "$VERBOSE" = "true" ]; then
      echo "${P_INFO}Generating ${source_format^^} to ${target_format^^} converter for '${P_END}${metaschema_relative}${P_INFO}' as '${P_END}${converter_relative}${P_INFO}'.${P_END}"
    fi

    result=$(xsl_transform "$OSCALDIR/build/metaschema/$source_format/produce-${source_format}-converter.xsl" "$metaschema" "$converter" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo "${P_ERROR}Generating ${source_format^^} to ${target_format^^} converter failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo "${P_ERROR}${result}${P_END}"
      exitcode=1
    else
      echo "${P_OK}Generating ${source_format^^} to ${target_format^^} converter passed for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"
    fi
  done
  IFS=$IFS_OLD
done

exit $exitcode
