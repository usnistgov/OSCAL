<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0">
    
    <xsl:output method="text"/>
    
    <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->
    <xsl:variable name="xslt">
        <xsl:variable name="runtime"   select="map {
            'xslt-version'        : 3.0,
            'stylesheet-location' : 'produce-xml-documentor.xsl',
            'source-node'         : / }" />
        
        <xsl:sequence select="transform($runtime)?output"/>
    </xsl:variable>
    
    <!-- XPath 3.1 transform() is documented here: https://www.w3.org/TR/xpath-functions-31/#func-transform   -->
    <xsl:template match="/">
        <xsl:variable name="xslt-uri" select="resolve-uri((/METASCHEMA/short-name || '-xml-documentor.xsl'))"/>
        <xsl:variable name="runtime"   select="map {
            'xslt-version'       : 3.0,
            'stylesheet-base-uri': $xslt-uri,
            'stylesheet-node'    : $xslt,
            'source-node'        : / }" />
        <xsl:sequence select="transform($runtime)?output"/>
        
    </xsl:template>
    
            
</xsl:stylesheet>