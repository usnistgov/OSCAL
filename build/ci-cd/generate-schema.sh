#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"
source "$OSCALDIR/build/ci-cd/include/init-validate-json.sh"

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
echo "${P_INFO}Generating XML and JSON Schema${P_END}"
echo "${P_INFO}==============================${P_END}"

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

    ([ -z "$path" ] || [ -z "$gen_schema" ]) && continue;

    path_absolute="$OSCALDIR"/"$path"

    IFS_OLD=$IFS
    IFS= # disable word splitting
    for metaschema in $path_absolute
    do
      paths+=("$metaschema")
      formats+=("$gen_schema")
    done
    IFS=$IFS_OLD
  done < "$OSCALDIR/build/ci-cd/config/metaschema"
fi

exitcode=0
for i in "${!paths[@]}"; do
  metaschema="${paths[$i]}"
  gen_schema="${formats[$i]}"

  filename=$(basename -- "$metaschema")
  extension="${filename##*.}"
  filename="${filename%.*}"
  base="${filename/_metaschema/}"
  metaschema_relative=$(realpath --relative-to="${OSCALDIR}" "$metaschema")

  #split on commas
  IFS_OLD=$IFS
  IFS=, #read -a formats <<< "$gen_schema"
  for format in ${gen_schema}; do
    if [ -z "$format" ]; then
      # skip blanks
      continue;
    fi

    # Run the XSL template for the format
    case $format in
    xml)
      transform="$OSCALDIR/build/metaschema/$format/produce-xsd.xsl"
      schema="$WORKING_DIR/$format/schema/${base}_schema.xsd"
      ;;
    json)
      transform="$OSCALDIR/build/metaschema/$format/produce-json-schema.xsl"
      schema="$WORKING_DIR/$format/schema/${base}_schema.json"
      ;;
    *)
      echo "${P_WARN}Unsupported schema format '${format^^}' schema for '$metaschema'.${P_END}"
      continue;
      ;;
    esac
    schema_relative=$(realpath --relative-to="${WORKING_DIR}" "$schema")

    if [ "$VERBOSE" = "true" ]; then
      echo "${P_INFO}Generating ${format^^} schema for '${P_END}${metaschema_relative}${P_INFO}' as '${P_END}${schema_relative}${P_INFO}'.${P_END}"
    fi

    result=$(xsl_transform "$transform" "$metaschema" "$schema" 2>&1)
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
      echo "${P_ERROR}Generation of ${format^^} schema failed for '${P_END}${metaschema_relative}${P_ERROR}'.${P_END}"
      echo "${P_ERROR}${result}${P_END}"
      exitcode=1
    else
      if [ "$VERBOSE" = "true" ]; then
        echo "${P_OK}Generation of ${format^^} schema passed for '${P_END}${metaschema_relative}${P_OK}'.${P_END}"
      fi
    fi

    # validate generated schema
    case $format in
    xml)
      result=$(xmllint --noout --schema "$OSCALDIR/build/ci-cd/support/XMLSchema.xsd" "$schema" 2>&1)
      cmd_exitcode=$?
      ;;
    json)
      result=$(validate_json "$OSCALDIR/build/ci-cd/support/json-schema-schema.json" "$schema")
      cmd_exitcode=$?
      ;;
    *)
      echo "${P_WARN}Unsupported validation of ${format^^} schema for '${P_END}${schema_relative}${P_WARN}'.${P_END}"
      cmd_exitcode=0
      ;;
    esac

    if [ $cmd_exitcode -ne 0 ]; then
      echo "${P_ERROR}Schema validation failed for '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
      echo "${P_ERROR}${result}${P_END}"
      exitcode=1
    else
      if [ "$VERBOSE" = "true" ]; then
        echo "${P_OK}Schema validation passed for '${P_END}${schema_relative}${P_OK}'.${P_END}"
      else
        echo "${P_OK}Schema generation passed for '${P_END}${metaschema_relative}${P_OK}' as '${P_END}${schema_relative}${P_OK}', which is valid.${P_END}"
      fi
    fi
  done
  IFS=$IFS_OLD
done < "$OSCALDIR/build/ci-cd/config/metaschema"

exit $exitcode
