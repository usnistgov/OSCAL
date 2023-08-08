#!/usr/bin/env bash
# XSLT Transform Runner Utility

set -Eeuo pipefail

usage() {
    cat <<EOF
Usage: $(basename "${BASH_SOURCE[0]}") ENTRY_STYLESHEET SOURCE OUTPUT [ADDITIONAL_ARGS]

Runs an XSLT transform using Saxon, optionally with provided arguments.

Additional arguments should be specified in the `key=value` format.
EOF
}

if ! [ -x "$(command -v mvn)" ]; then
  echo 'Error: Maven (mvn) is not in the PATH, is it installed?' >&2
  exit 1
fi

[[ -z "${1-}" ]] && { echo "Error: SOURCE not specified"; usage; exit 1; }
ENTRY_STYLESHEET=$1

[[ -z "${2-}" ]] && { echo "Error: SOURCE not specified"; usage; exit 1; }
SOURCE=$2
[[ -z "${3-}" ]] && { echo "Error: OUTPUT not specified"; usage; exit 1; }
OUTPUT=$3

ADDITIONAL_ARGS=$(shift 3; echo $@)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
POM_FILE="${SCRIPT_DIR}/pom.xml"

mvn \
    -f $POM_FILE \
    exec:java \
    -Dexec.mainClass="net.sf.saxon.Transform" \
    -Dexec.args="-t -xsl:$ENTRY_STYLESHEET -s:$SOURCE -o:$OUTPUT $ADDITIONAL_ARGS"
