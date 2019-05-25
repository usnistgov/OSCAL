# Catalog round trip from XML -> JSON -> XML

#!/bin/bash
source ../common-environment.sh

###################################################################################################################
#   XML->JSON Roundtrip conversions tests
###################################################################################################################

# default to test passed at zero
exitcode=0

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
python xmlComparison.py ${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml ${OSCALDIR}/build/ci-cd/python/composedXML.xml
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