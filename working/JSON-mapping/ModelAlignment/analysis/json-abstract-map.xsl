<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- From elements, stripping the xpath functions namespace -->
    <xsl:template match="*">
        <xsl:element name="{name()}">
            <xsl:apply-templates select="node() | @*"/>
        </xsl:element>
    </xsl:template>
    
    <!-- map, string, array, null, @key   -->
    
    <!-- When matches(@key,'^\i\c*$') (legal XML element name)   -->
    <xsl:template match="*[matches(@key,'^\i\c*$')]">
        <xsl:element name="{replace(@key,':','_')}">
            <xsl:attribute name="type" select="name()"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    
</xsl:stylesheet>