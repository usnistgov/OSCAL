#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/../metaschema/scripts/include/init-saxon.sh"

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
echo -e "${P_INFO}Generating OSCAL Specification Documentation${P_END}"
echo -e "${P_INFO}============================================${P_END}"

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

SPEC_SOURCE="${OSCALDIR}/src/specifications/profile-resolution/profile-resolution-specml.xml"
SPEC_OUTPUT="$WORKING_DIR/docs/content/concepts/processing/profile-resolution.html"

result=$(xsl_transform "$OSCALDIR/src/specifications/profile-resolution/specml-html-hugo-uswds.xsl" "${SPEC_SOURCE}" "${SPEC_OUTPUT}" 2>&1)
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
  echo -e "${P_ERROR}Generating specification '${P_END}${SPEC_SOURCE}${P_ERROR}' to '${P_END}${SPEC_OUTPUT}${P_ERROR}'.${P_END}"
  echo -e "${P_ERROR}${result}${P_END}"
  exitcode=1
else
  echo -e "${P_OK}Generating specification '${P_END}${SPEC_OUTPUT}${P_OK}' was successful for '${P_END}${SPEC_SOURCE}${P_OK}.${P_END}"
fi
