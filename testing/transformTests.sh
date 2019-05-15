
# Catalog round trip from XML -> JSON -> XML

#import config
#!/bin/bash
source testingConfig.sh

###################################################################################################################
#   NIST 800-53 Rev4 Catalog conversions tests
###################################################################################################################

# transformation from source XML to target XML
java -jar saxon9he.jar -s:$var80053Rev4CatalogXML -xsl:$varCatalogXMLConverter -o:../util/convert/composedJSON.json
echo "XML converted to JSON"

# transformation of JSON back to XML
java -jar saxon9he.jar  -o:composedXML.xml -it:start -xsl:$varCatalogJSONConverter json-file=composedJSON.json
echo "JSON converted back to XML"

# compare the XML files to see if there is data loss
echo "Checking XML->JSON->XML conversion for the NIST 800-53 rev4 catalog"
python xmlComparison.py $var80053Rev4CatalogXML composedXML.xml

# delete the temp files after processing (no cleanup for now, validating XML)
source fileCleanUp.sh
