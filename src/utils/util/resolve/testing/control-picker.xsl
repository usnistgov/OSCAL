<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
<!--  Select X controls with the most incoming links  -->
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:key name="controls-by-links" match="control" use="part[@name='guidance']/link[@rel='related']/@href"/>
    
    <xsl:template match="/">
        <profile>
            <import>
                <include>
                    <xsl:apply-templates select="/catalog/group"/>
                </include>
            </import>
        </profile>
    </xsl:template>
    
    <xsl:template match="control">
        <xsl:variable name="incoming" select="key('controls-by-links',('#' || @id))"/>
        <xsl:if test="count($incoming) ge 20">
            <call control-id="{@id}"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="group">
       <xsl:apply-templates select="control"/>
    </xsl:template>
    
</xsl:stylesheet>