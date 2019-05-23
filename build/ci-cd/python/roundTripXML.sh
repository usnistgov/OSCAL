# Catalog round trip from XML -> JSON -> XML

#!/bin/bash
source ../common-environment.sh

###################################################################################################################
#   NIST 800-53 Rev4 Catalog conversions tests
###################################################################################################################

# transformation from source XML to target XML
java -jar saxon9he.jar -s:${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml -xsl:${OSCALDIR}/json/convert/oscal-catalog-xml-to-json-converter.xsl -o:composedJSON.json
echo "XML converted to JSON"

# transformation of JSON back to XML
java -jar saxon9he.jar  -o:composedXML.xml -it:start -xsl:${OSCALDIR}/xml/convert/oscal-catalog-json-to-xml-converter.xsl json-file=${OSCALDIR}/build/ci-cd/python/composedJSON.json
echo "JSON converted back to XML"

# compare the XML files to see if there is data loss
echo "Checking XML->JSON->XML conversion for the NIST 800-53 rev4 catalog"
python xmlComparison.py ${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml ${OSCALDIR}/build/ci-cd/python/composedXML.xml

#use the XMLDIFF tool to see differences
echo ${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml
echo ${OSCALDIR}/build/ci-cd/python/composedXML.xml
#xmldiff composedXML.xml composedXML2.xml
#xmldiff ${OSCALDIR}/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml ${OSCALDIR}/build/ci-cd/python/composedXML.xml
#xmldiff ${OSCALDIR}/build/ci-cd/python/composedXML.xml ${OSCALDIR}/build/ci-cd/python/composedXML.xml

#validate JSON schemas
ajv validate -s ${OSCALDIR}/json/schema/oscal-catalog-schema.json -d ${OSCALDIR}/content/nist.gov/SP800-53/rev4/json/NIST_SP-800-53_rev4_catalog.json --extend-refs=true --verbose