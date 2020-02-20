#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR  (default: ${WORKING_DIR})
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
echo -e "${P_INFO}Generating XML and JSON Schema${P_END}"
echo -e "${P_INFO}==============================${P_END}"

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

    ([ -z "$path" ] || [ -z "$gen_schema" ]) && continue;

    path_absolute="$OSCALDIR"/"$path"

    IFS= # disable word splitting
    for metaschema in $path_absolute
    do
      paths+=($metaschema)
      formats+=($gen_schema)
    done
  done < "$OSCALDIR/build/ci-cd/config/metaschema"
  IFS="$IFS_OLD"
fi

exitcode=0
for i in ${!paths[@]}; do
  metaschema="${paths[$i]}"
  gen_schema="${formats[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  base="${filename/_metaschema/}"
  metaschema_relative=$(get_rel_path "${OSCALDIR}" "${metaschema}")

  #split on commas
  IFS_OLD="$IFS"
  IFS=, gen_formats=($gen_schema)
  IFS="$IFS_OLD"
  for format in ${gen_formats[@]}; do
    if [ -z "$format" ]; then
      # skip blanks
      continue;
    fi

    case $format in
    xml)
      generator_arg="--xml"
      schema="$WORKING_DIR/$format/schema/${base}_schema.xsd"
      ;;
    json)
      generator_arg="--json"
      schema="$WORKING_DIR/$format/schema/${base}_schema.json"
      ;;
    *)
      echo -e "${P_WARN}Unsupported schema format '${format^^}' schema for '$metaschema'.${P_END}"
      continue;
      ;;
    esac

    # ensure the schema directory exists before calling realpath
    mkdir -p "$(dirname "$schema")"
    schema_relative=$(get_rel_path "${WORKING_DIR}" "${schema}")

    if [ "$VERBOSE" == "true" ]; then
      echo -e "${P_INFO}Generating ${format^^} schema for '${P_END}${metaschema_relative}${P_INFO}' as '${P_END}${schema_relative}${P_INFO}'.${P_END}"
    fi

    args=()
    args+=("${generator_arg}")
    args+=("$metaschema")
    args+=("$schema")
    args+=("--validate")

    if [ "$VERBOSE" == "true" ]; then
      args+=("-v")
    fi    

    result=$("$OSCALDIR/build/metaschema/scripts/generate-schema.sh" "${args[@]}" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo -e "${P_ERROR}Generation of ${format^^} schema failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo -e "${P_ERROR}${result}${P_END}"
      exitcode=1
    else
      echo -e "${result}"
      if [ "$VERBOSE" == "true" ]; then
        echo -e "${P_OK}Generation of ${format^^} schema passed for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"
      fi
    fi
  done
done

exit $exitcode
