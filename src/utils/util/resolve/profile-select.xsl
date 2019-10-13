<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        
        xmlns="http://csrc.nist.gov/ns/oscal/1.0"
        xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
        
        xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
        xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
        exclude-result-prefixes="#all"
        default-mode="oscal:filter">
        
     
    <xsl:mode name="oscal:filter"       on-no-match="shallow-copy"/>
    <xsl:mode name="oscal:copy-control" on-no-match="shallow-copy"/>
    <xsl:mode name="oscal:copy-branch"  on-no-match="deep-copy"/>
    
    <xsl:strip-space elements="catalog metadata group requirement control part param"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="catalog" mode="oscal:filter">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
 
    <xsl:template match="/*/@id" mode="oscal:filter">
        <xsl:attribute name="id" expand-text="true">PROFILERESULTS-{.}</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="metadata" mode="oscal:filter"/>
    
    <xsl:template priority="2" match="group" mode="oscal:filter">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template priority="3" match="control" mode="oscal:filter">
        <xsl:apply-templates select="." mode="oscal:copy-control"/>
    </xsl:template>
    
    <xsl:template match="control" mode="oscal:copy-control">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="group/*" mode="oscal:filter"/>
    
</xsl:stylesheet>