# Catalog round trip from XML -> JSON -> XML

#!/bin/bash
#source common-environment.sh

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

# default to test passed at zero
exitcode=0

if [ -z "$1" ]; then
  working_dir=$OSCALDIR
else
  working_dir=$1
fi

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format type converttoformats || [ -n "$path" ]; do
  shopt -s extglob
  # skip if line starts with comment
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR/$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      printf 'Validating %s file %s as %s\n' "$format" "$file" "$type"
      printf 'format: %s\n' "$format"
      printf 'type: %s\n' "$type"
      printf 'convert-to: %s\n' "$converttoformats"

      case $format in
      xml)
          schema="$working_dir/xml/schema/oscal-$type-schema.xsd"
          printf 'Schema Name: %s\n' "$schema"
          #xmllint --noout --schema "$schema" "$file"
          #cmd_exitcode=$?
          #if [ $cmd_exitcode -ne 0 ]; then
          #  printf 'XML schema validation failed for %s\n' "$file"
          #  exitcode=1
          #fi
        ;;
      json)
          schema="$working_dir/json/schema/oscal-$type-schema.json"
          printf 'Schema Name: %s\n' "$schema"
          #ajv validate -s "$schema" -d "$file" --extend-refs=true --verbose
          #cmd_exitcode=$?
          #if [ $cmd_exitcode -ne 0 ]; then
          #  printf 'JSON schema validation failed for %s\n' "$file"
          #  exitcode=1
          #fi
        ;;
      esac
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"
shopt -u nullglob
shopt -u globstar

#exit $exitcode

# transformation from source XML to target XML
java -jar saxon9he.jar -s:${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml -xsl:${OSCALDIR}/json/convert/oscal-catalog-xml-to-json-converter.xsl -o:composedJSON.json
# check the exit code for the conversion
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
    printf 'XML->JSON conversion failed for %s\n' "$file"
    exitcode=1
else
    echo "XML converted to JSON"
fi

# transformation of JSON back to XML
java -jar saxon9he.jar  -o:composedXML.xml -it:start -xsl:${OSCALDIR}/xml/convert/oscal-catalog-json-to-xml-converter.xsl json-file=${OSCALDIR}/build/ci-cd/python/composedJSON.json
# check the exit code for the conversion
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
    printf 'JSON->XML conversion failed for %s\n' "$file"
    exitcode=1
else
    printf "JSON converted back to XML. \n"
fi


# compare the XML files to see if there is data loss
echo "Checking XML->JSON->XML conversion for the NIST 800-53 rev4 catalog"
python python/xmlComparison.py ${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml ${OSCALDIR}/build/ci-cd/python/composedXML.xml
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
    printf 'XML roundtrip comparison failed.\n'
    exitcode=1
else
    echo "XML round trip comparison was successful.\n"
fi

#validate JSON schemas
ajv validate -s ${OSCALDIR}/json/schema/oscal-catalog-schema.json -d ${OSCALDIR}/content/nist.gov/SP800-53/rev4/json/NIST_SP-800-53_rev4_catalog.json --extend-refs=true --verbose
cmd_exitcode=$?
if [ $cmd_exitcode -ne 0 ]; then
    printf 'Comparison of the converted JSON file to the original failed.\n'
    exitcode=1
else
    echo "Comparison of the converted JSON file to the original was successful.\n"
fi

exit $exitcode