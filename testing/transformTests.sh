
# Catalog round trip from XML -> JSON -> XML

#import config
#!/bin/bash
source testingConfig.sh

# transformation from source XML to target XML
java -jar saxon9he.jar -s:$var80053Rev4CatalogXML -xsl:$varCatalogXMLConverter -o:../util/convert/composedJSON.json
echo "XML converted to JSON"

# transformation of JSON back to XML
java -jar saxon9he.jar  -o:composedXML.xml -it:start -xsl:$varCatalogJSONConverter json-file=composedJSON.json
echo "JSON converted back to XML"

# delete the temp files after processing
source fileCleanUp.sh
