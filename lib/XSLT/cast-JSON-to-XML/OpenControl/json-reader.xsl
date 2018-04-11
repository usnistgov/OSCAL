<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes"/>
        
    <xsl:param name="json-file" as="xs:string">file:/home/wendell/Documents/OSCAL/vault/docker-ee-opencontrol-oscal.json</xsl:param>
    
    <xsl:template match="/">
        <xsl:sequence select="unparsed-text($json-file) => json-to-xml()"/>
    </xsl:template>
    
    
</xsl:stylesheet>