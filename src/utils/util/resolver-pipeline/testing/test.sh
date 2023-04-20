#!/usr/bin/env bash
# OSCAL XSLT resolver pipeline test suite helper
# Runs all XSpec suites in this folder.
# Inputs:
#   - The $XSPEC_COMMAND env var can override the XSpec command.
#     If not set, xspec/bin must be in the $PATH.
#   - The $TEST_DIR env var can override the XSpec output directory.
# Outputs:
#   - All XSpec output is redirected to STDERR.
#   - The final test status is pretty-printed to STDERR.
#   - The suite path and status (passed, failed, or compile_failed) is printed to STDOUT as a CSV.
#     ex: /oscal/src/utils/util/resolver-pipeline/testing/1_selected/select.xspec,passed
#   - Return code:
#     - 0 if all tests pass
#     - 1 if one or more tests fail
#     - 83 if one or more tests fail to compile (preferred over 1)

set -Eeuo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

# Default to running xspec.sh (xspec/bin must be in PATH)
#   with option to override using the XSPEC_COMMAND env var
XSPEC_COMMAND="${XSPEC_COMMAND:-xspec.sh}"
# The output directory to write to
#   with option to override using the TEST_DIR env var
export TEST_DIR="${TEST_DIR:-${SCRIPT_DIR}/xspec}"

# All .xspec files in the "testing" directory
TEST_SUITES=$(find "${SCRIPT_DIR}" -type f -name "*.xspec")

# Setup an "alias" fd for use in subshells,
#    which is used to capture the STDERR of the XSpec output
# (subshells capture STDOUT and STDERR, but not other descriptors)
exec 6>&2

# True if one or more test suites fail to run
SUITES_FAILURE=false
# True if one or more test suite fail to compile
SUITES_COMPILATION_FAILURE=false

# CSV header
printf "xspec_suite_path,status\n"

for TEST_SUITE in ${TEST_SUITES}; do
    # Run XSpec on the test suite, while:
    #   1) Redirecting STDOUT to STDERR (make XSpec less noisy)
    #   2) Capturing the output to a variable "stderr_output"
    # Then, if the suite failed, check "stderr_output" for compilation failures
    #   setting "SUITES_FAILURE" and "SUITES_COMPILATION_FAILURE" as appropriate

    printf "\n=== Testing Suite %s ===\n" "${TEST_SUITE}" 1>&2

    suite_passed=true
    stderr_output=$(${XSPEC_COMMAND} -e "${TEST_SUITE}" 2>&1 | tee /dev/fd/6) || suite_passed=false

    if [ "$suite_passed" = true ]; then
        printf "%s,passed\n" "${TEST_SUITE}"
    elif [[ $stderr_output == *"*** Error compiling the test suite"* ]]; then
        printf "%s,compile_failed\n" "${TEST_SUITE}"
        SUITES_COMPILATION_FAILURE=true
    else
        printf "%s,failed\n" "${TEST_SUITE}"
        SUITES_FAILURE=true
    fi
done

if [ "$SUITES_COMPILATION_FAILURE" = true ]; then
    printf "\nOne or more test suites failed to compile 🆘\n" 1>&2
    exit 83 # special status code to differentiate compilation failure
elif [ "$SUITES_FAILURE" = true ] ; then
    printf "\nOne or more test suites failed to run ❌\n" 1>&2
    exit 1
else
    printf "\nAll test suites passed ✅\n" 1>&2
fi
