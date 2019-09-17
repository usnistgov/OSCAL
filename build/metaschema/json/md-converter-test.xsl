<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs o"
    version="3.0">

    <xsl:output indent="yes"/>

    <xsl:param name="target-ns" as="xs:string?">http://csrc.nist.gov/ns/oscal/1.0</xsl:param>
    
    <!--<xsl:template match="/">
        <xsl:element name="examples" namespace="{$target-ns}">
            <xsl:apply-templates select="$examples/*" mode="parse"/>
        </xsl:element>
    </xsl:template>-->
    
    <xsl:template match="markdown">
        <xsl:element name="{ local-name(.) }" namespace="{$target-ns}">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="text()">
        <!--<xsl:value-of select="."/>-->
        <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
        </xsl:call-template><!--
        <xsl:apply-templates select="." mode="parse"/>-->
    </xsl:template>
    
    <xsl:import href="md-oscal-converter.xsl"/>
</xsl:stylesheet>