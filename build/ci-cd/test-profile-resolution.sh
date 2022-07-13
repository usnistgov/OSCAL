#!/bin/bash

if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then
    source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/include/init-oscal.sh"
fi

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/../metaschema/scripts/include/init-saxon.sh"
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/../metaschema/scripts/include/init-validate-content.sh"

# Option defaults
KEEP_TEMP_SCRATCH_DIR=false

usage() {                                      # Function: Print a help message.
  cat << EOF
Usage: $0 [options] [metaschema paths]

-h, --help                        Display help
-w DIR, --working-dir DIR         Generate artifacts in DIR
--scratch-dir DIR                 Generate temporary artifacts in DIR
                                  If not provided a new directory will be
                                  created under \$TMPDIR if set or in /tmp.
--keep-temp-scratch-dir           If a scratch directory is automatically
                                  created, it will not be automatically removed.
-v                                Provide verbose output
EOF
}


if ! OPTS=$(getopt -o w:vh --long working-dir:,scratch-dir:,keep-temp-scratch-dir,help -n "$0" -- "$@"); then echo -e "Failed parsing options." >&2 ; usage ; exit 1 ; fi

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
      shift # past unit_test_dir
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

OTHER_ARGS=$@ # save the remaining args

# configuration
UNIT_TESTS_DIR="$(get_abs_path "${OSCALDIR}/src/specifications/profile-resolution/profile-resolution-examples")"
EXPECTED_DIR="$(get_abs_path "${OSCALDIR}/src/specifications/profile-resolution/profile-resolution-examples/output-expected")"
PROFILE_RESOLVER="$(get_abs_path "${OSCALDIR}/src/utils/util/resolver-pipeline/oscal-profile-RESOLVE.xsl")"
CATALOG_SCHEMA="$(get_abs_path "${WORKING_DIR}/xml/schema/oscal_catalog_schema.xsd")"

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
echo -e "${P_INFO}Testing Profile Resolution${P_END}"
echo -e "${P_INFO}==============================${P_END}"

if [ "$VERBOSE" = "true" ] || [ "$KEEP_TEMP_SCRATCH_DIR" = "true" ]; then
  echo -e "${P_INFO}Using scratch directory:${P_END} ${SCRATCH_DIR}"
fi

if [ "$VERBOSE" = "true" ]; then
  echo -e "${P_INFO}Using working directory:${P_END} ${WORKING_DIR}"
fi

test_files=()
while read -r -d $'\0' file; do
  test_files+=("$file")
done < <(find "$UNIT_TESTS_DIR" -mindepth 1 -maxdepth 1 -type f -name "*_profile.xml" -print0)

unit_test_scratch_dir="$SCRATCH_DIR/profile-resolution"
mkdir -p "$unit_test_scratch_dir"

for file in ${test_files[@]}; do
  filename="$(basename -- "$file")"
  extension="${filename##*.}"
  filename_minus_extension="${filename%.*}"
#  echo "${extension}"
#  echo "${filename_minus_extension}"

  echo -e "${P_INFO}Resolving profile '${P_END}${filename}${P_INFO}'.${P_END}"

  resolved_profile="${unit_test_scratch_dir}/${filename_minus_extension}_RESOLVED.${extension}"
#  echo "${resolved_profile}"

  result=$(xsl_transform "${PROFILE_RESOLVER}" "$file" "${resolved_profile}" 2>&1)
  cmd_exitcode=$?
  if [ -n "$result" ]; then
    echo -e "${result}"
  fi
  if [ $cmd_exitcode -ne 0 ]; then
    echo -e "  ${P_ERROR}Failed to resolve profile '${P_END}${filename}${P_ERROR}'.${P_END}"
    exitcode=1
    continue;
  fi

  result=$(validate_xml "$CATALOG_SCHEMA" "${resolved_profile}")
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi
    echo -e "  ${P_ERROR}Resolved profile '${P_END}${filename}${P_ERROR}' is not a valid OSCAL catalog.${P_END}"
    exitcode=1
    continue;
  fi

  expected_resolved_profile="${EXPECTED_DIR}/${filename_minus_extension}_RESOLVED.${extension}"

  if [[ -z "$expected_resolved_profile" ]]; then
    echo -e "  ${P_ERROR}The expected resolved profile '${P_END}${expected_resolved_profile}${P_ERROR}' does not exist.${P_END}"
    exitcode=1
    continue;
  fi

  echo "Resolved: ${resolved_profile}"
  echo "Expected: ${expected_resolved_profile}"
  result=$(diff -u -Z "${resolved_profile}" "${expected_resolved_profile}")
  cmd_exitcode=$?
  if [ $cmd_exitcode -ne 0 ]; then
    if [ -n "$result" ]; then
      echo -e "${result}"
    fi
    echo -e "  ${P_ERROR}Resolved profile '${P_END}${filename}${P_ERROR}' does not match the expected resolved profile.${P_END}"
    exitcode=1
    continue;
  else
    echo -e "  ${P_OK}Profile '${P_END}${filename}${P_OK}' resolved successfully.${P_END}"
  fi
done

exit $exitcode
