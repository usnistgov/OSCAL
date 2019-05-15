#Rebuilds JSON files from the XML Master

#import config
#!/bin/bash
source testingConfig.sh

# transformation from source XML to target XML
echo "Starting NIST 800-53 Rev 4 Catalog conversion from XML -> JSON"
java -jar saxon9he.jar -s:$var80053Rev4CatalogXML -xsl:$varCatalogXMLConverter -o:$var80053Rev4CatalogJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting NIST 800-53 Rev 4 Low Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$var80053Rev4ProfileLow -xsl:$varProfileXMLConverter -o:$var80053Rev4ProfileLowJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting NIST 800-53 Rev 4 Moderate Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$var80053Rev4ProfileModerate -xsl:$varProfileXMLConverter -o:$var80053Rev4ProfileModerateJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting NIST 800-53 Rev 4 High Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$var80053Rev4ProfileHigh -xsl:$varProfileXMLConverter -o:$var80053Rev4ProfileHighJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting FedRAMP Low Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$varFedRAMPProfileLow -xsl:$varProfileXMLConverter -o:$varFedRAMPProfileLowJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting FedRAMP Moderate Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$varFedRAMPProfileModerate -xsl:$varProfileXMLConverter -o:$varFedRAMPProfileModerateJSON
echo "XML converted to JSON"

# transformation from source XML to target XML
echo "Starting FedRAMP High Profile conversion from XML -> JSON"
java -jar saxon9he.jar -s:$varFedRAMPProfileHigh -xsl:$varProfileXMLConverter -o:$varFedRAMPProfileHighJSON
echo "XML converted to JSON"