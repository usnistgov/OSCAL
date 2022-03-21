#!/bin/bash

# Setup OSCAL environment

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi
source "$OSCALDIR/build/metaschema/scripts/include/init-validate-content.sh"

# Option defaults
ARTIFACT_DIR="${OSCALDIR}"
OSCAL_DIR="${OSCALDIR}"
CONFIG_FILE="${OSCALDIR}/build/ci-cd/config/content"
#VERBOSE=false
#HELP=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]

-a DIR, --artifact-dir            Build source artifacts are stored in DIR.
-c FILE, --config-file FILE       The config file location is FILE.
-o DIR, --oscal-dir DIR           OSCAL schema are located in DIR.
-h, --help                        Display help
-v                                Provide verbose output
EOF
}

OPTS=`getopt -o o:vhc:a: --long artifact-dir:,oscal-dir:,help,config-file: -n "$0" -- "$@"`
if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    -o|--oscal-dir)
      OSCAL_DIR="$(realpath "$2")"
      shift # past path
      ;;
    -c|--config-file)
      CONFIG_FILE="$(realpath "$2")"
      shift # past path
      ;;
    -a|--artifact-dir)
      ARTIFACT_DIR="$(realpath "$2")"
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
echo -e "${P_INFO}Validating Content${P_END}"
echo -e "${P_INFO}==================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using OSCAL directory:${P_END} ${OSCAL_DIR}"
  echo -e "${P_INFO}Using artifact directory:${P_END} ${ARTIFACT_DIR}"
  echo -e "${P_INFO}Using config file:${P_END} ${CONFIG_FILE}"
fi

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format model converttoformats || [ -n "$path" ]; do
  shopt -s extglob
  # skip if line starts with comment
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="${ARTIFACT_DIR}/${path}"

    IFS= # disable word splitting
    for file in $files_to_process
    do
      file_relative=$(realpath --relative-to="$ARTIFACT_DIR" "$file")
      if [ "$VERBOSE" = "true" ]; then
        echo -e "${P_INFO}Validating $model $format file '${P_END}${file_relative}${P_INFO}'.${P_END}"
      fi

      case $format in
      xml)
          schema="$OSCAL_DIR/xml/schema/oscal_${model}_schema.xsd"
          schema_relative=$(realpath --relative-to="${OSCAL_DIR}" "$schema")
          result=$(xmllint --noout --schema "$schema" "$file" 2>&1)
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "${P_ERROR}XML Schema validation failed for '${P_END}${file_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
          else
            echo -e "${P_OK}XML Schema validation passed for '${P_END}${file_relative}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi
        ;;
      json)
          schema="$WORKING_DIR/json/schema/oscal_${model}_schema.json"
          schema_relative=$(realpath --relative-to="${OSCAL_DIR}" "$schema")
          result=$(validate_json "$schema" "$file")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo -e "${P_ERROR}JSON Schema validation failed for '${P_END}${file_relative}${P_ERROR}' using schema '${P_END}${schema_relative}${P_ERROR}'.${P_END}"
            echo -e "${P_ERROR}${result}${P_END}"
            exitcode=1
          else
            echo -e "${P_OK}JSON Schema validation passed for '${P_END}${file_relative}${P_OK}' using schema '${P_END}${schema_relative}${P_OK}'.${P_END}"
          fi
        ;;
      esac
    done
  fi
done < "${CONFIG_FILE}"
shopt -u nullglob
shopt -u globstar

exit $exitcode
