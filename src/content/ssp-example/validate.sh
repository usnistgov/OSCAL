#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/../../../build/ci-cd/include/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/init-validate-json.sh"
source "$OSCALDIR/build/ci-cd/include/schematron-init.sh"

shopt -s nullglob
shopt -s globstar

# compile the schematron
compiled_schematron="compiled-schematron.xsl"
build_schematron "$OSCALDIR/src/content/ssp-draft/ssp.sch" "$compiled_schematron"
cmd_exitcode=$?
if [ $? -ne 0 ]; then
  echo "${P_ERROR}Compilation of Schematron failed.${P_END}"
  exit 1
fi

input="$1"
input="$(realpath "${input}" )"
output="${input}-to-xml.json"
transform="${OSCALDIR}/build/metaschema/json/json-to-xml.xsl"
svrl="${input}-to-xml.svrl"

#input-relative="$(realpath --relative-to="$transform" "$input")"

xsl_transform "${transform}" "" "${output}" "-it" "json-file=${input}"
if [ $? -ne 0 ]; then
  echo "${P_ERROR}Conversion of JSON file to XML failed.${P_END}"
  exit 1
fi

validate_with_schematron "$compiled_schematron" "${output}" "${svrl}"
exit $?
