# transformation from source XML to target XML
java -jar saxon9he.jar -s:../schema/metaschema/oscal-catalog-metaschema.xml -xsl:../build/metaschema/lib/metaschema-xml-html.xsl -o:composedXML.xml