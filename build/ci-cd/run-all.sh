#!/bin/bash
# determines the OSCAL directory path
if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

# Option defaults
PERFORM_VALIDATION=YES
PERFORM_CONTENT_GENERATION=YES
PERFORM_SITE_GENERATION=NO
PERFORM_CONTENT_CONVERSION=YES
RUN_UNITTESTS=YES
KEEP_TEMP_SCRATCH_DIR=false
WORKING_DIR="${OSCALDIR}"

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options]
Run all build scripts

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
-v                                Provide verbose output
--scratch-dir DIR                 Generate temporary artifacts in DIR
                                  If not provided a new directory will be
                                  created under \$TMPDIR if set or in /tmp.
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
--perform-validation              Validate all content and metaschema
--no-validation                   Do not validate all content and metaschema
--generate-content                Generate all content
--no-generate-content             Do not generate all content
--generate-site                   Generate all website content
--no-generate-site                Do not generate all website content
--convert-content                 Convert content to alternate formats
--no-convert-content              Do not convert content to alternate formats
--run-unittests                   Run unit tests
--no-run-unittests                Do not run unit tests
EOF
}

if ! OPTS=$(getopt -o w:vh --long scratch-dir:,keep-temp-scratch-dir,working-dir:,help,perform-validation,no-validation,generate-content,no-generate-content,generate-site,no-generate-site,convert-content,no-convert-content -n "$0" -- "$@"); then echo "Failed parsing options." >&2 ; usage ; exit 1 ; fi

# Process arguments
eval set -- "$OPTS"
while [ $# -gt 0 ]; do
  arg="$1"
  case "$arg" in
    --perform-validation)
      PERFORM_VALIDATION=YES
      ;;
    --no-validation)
      PERFORM_VALIDATION=NO
      ;;
    --generate-content)
      PERFORM_CONTENT_GENERATION=YES
      ;;
    --no-generate-content)
      PERFORM_CONTENT_GENERATION=NO
      ;;
    --generate-site)
      PERFORM_SITE_GENERATION=YES
      ;;
    --no-generate-site)
      PERFORM_SITE_GENERATION=NO
      ;;
    --convert-content)
      PERFORM_CONTENT_CONVERSION=YES
      ;;
    --no-convert-content)
      PERFORM_CONTENT_CONVERSION=NO
      ;;
    --run-unittests)
      RUN_UNITTESTS=YES
      ;;
    --no-run-unittests)
      RUN_UNITTESTS=NO
      ;;
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

echo "${OTHER_ARGS[@]}"

if [ -z "${SCRATCH_DIR+x}" ]; then
  SCRATCH_DIR="$(mktemp -d)"
  if [ "$KEEP_TEMP_SCRATCH_DIR" != "true" ]; then
    function CleanupScratchDir() {
      rc=$?
      if [ "$VERBOSE" = "true" ]; then
        echo ""
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

extra_params=()

if [ "$VERBOSE" = "true" ]; then
  extra_params+=('-v')
  echo -e "${P_INFO}Using scratch directory:${P_END}    ${SCRATCH_DIR}"
  echo -e "${P_INFO}Using working directory:${P_END}    ${WORKING_DIR}"
  echo -e "${P_INFO}Perform Validation:${P_END}         ${PERFORM_VALIDATION}"
  echo -e "${P_INFO}Perform Content Generation:${P_END} ${PERFORM_CONTENT_GENERATION}"
  echo -e "${P_INFO}Perform Content Conversion:${P_END} ${PERFORM_CONTENT_CONVERSION}"
  echo -e "${P_INFO}Perform Site Generation:${P_END}    ${PERFORM_SITE_GENERATION}"
  echo -e "${P_INFO}Run unit tests:${P_END}             ${RUN_UNITTESTS}"
fi

extra_args=$( IFS=" "; echo "${extra_params[*]}" )

script_path="${OSCALDIR}/build/ci-cd"

# runs all of the scripts to test locally
if [ "$PERFORM_VALIDATION" == "YES" ] && "${script_path}/validate-metaschema.sh" -w "$WORKING_DIR" --scratch-dir "$SCRATCH_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to validate all Metaschema${P_END}"
    exit 1
  fi
fi
if [ "$PERFORM_CONTENT_GENERATION" == "YES" ] && "${script_path}/generate-schema.sh" -w "$WORKING_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to generate schema files${P_END}"
    exit 2
  fi
fi
#if [ "$PERFORM_VALIDATION" == "YES" ] && "${script_path}/validate-content.sh" ${extra_args}; then
#  if [ $? -ne 0 ]; then
#    echo "${P_ERROR}*** Failed to validate all content${P_END}"
#    exit 3
#  fi
#fi
if [ "$PERFORM_CONTENT_GENERATION" == "YES" ] && "${script_path}/generate-content-converters.sh" -w "$WORKING_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to generate content converters${P_END}"
    exit 4
  fi
fi
if [ "$PERFORM_SITE_GENERATION" == "YES" ] && "${script_path}/generate-model-documentation.sh" -w "$WORKING_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to generate website schema model content${P_END}"
    exit 7
  fi
fi
if [ "$RUN_UNITTESTS" == "YES" ] && "${script_path}/run-unittests.sh" -w "$WORKING_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to run all unit tests${P_END}"
    exit 8
  fi
fi
if [ "$RUN_UNITTESTS" == "YES" ] && "${script_path}/test-profile-resolution.sh" -w "$WORKING_DIR" ${extra_args}; then
  if [ $? -ne 0 ]; then
    echo "${P_ERROR}*** Failed to run all unit tests${P_END}"
    exit 8
  fi
fi
