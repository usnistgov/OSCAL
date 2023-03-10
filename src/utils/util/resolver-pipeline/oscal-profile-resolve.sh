#!/usr/bin/env bash
# OSCAL Profile Resolution Pipeline Wrapper

set -Eeuo pipefail

usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") TARGET_PROFILE OUTPUT_BASELINE [ADDITIONAL_ARGS]

Runs the OSCAL Profile Resolution Pipeline on the TARGET_PROFILE.

Additional arguments should be specified in the `key=value` format.
EOF
}

if ! [ -x "$(command -v mvn)" ]; then
  echo 'Error: Maven (mvn) is not in the PATH, is it installed?' >&2
  exit 1
fi

[[ -z "${1-}" ]] && { echo "Error: TARGET_PROFILE not specified"; usage; exit 1; }
TARGET_PROFILE=$1
[[ -z "${2-}" ]] && { echo "Error: OUTPUT_BASELINE not specified"; usage; exit 1; }
OUTPUT_BASELINE=$2

ADDITIONAL_ARGS=$(shift 2; echo $@)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
OSCAL_DIR="${SCRIPT_DIR}/../../../.."
POM_FILE="${OSCAL_DIR}/build/pom.xml"
ENTRY_STYLESHEET="${SCRIPT_DIR}/oscal-profile-RESOLVE.xsl"

mvn \
    -f $POM_FILE \
    exec:java \
    -Dexec.mainClass="net.sf.saxon.Transform" \
    -Dexec.args="-t -s:$TARGET_PROFILE -xsl:$ENTRY_STYLESHEET -o:$OUTPUT_BASELINE $ADDITIONAL_ARGS"
