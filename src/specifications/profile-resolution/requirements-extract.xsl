<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
   version="3.0">
    
    <xsl:output indent="true"/>
    
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="//req"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="req" >
        <requirement>
            <xsl:copy-of select="@*"/>
            <xsl:where-populated>
                <text>
                    <xsl:apply-templates/>
                </text>
            </xsl:where-populated>
            <xsl:apply-templates select="eg" mode="eg"/>
        </requirement>
    </xsl:template>
    
    <xsl:template match="eg"/>
        
    
    <xsl:template match="eg" mode="eg">
        <xsl:variable name="status" select="ready"/>
        <test>
            <xsl:apply-templates select="@href"/>
            <xsl:if test="starts-with(.,'PENDING')">
                <xsl:attribute name="status">pending</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </test>
    </xsl:template>
    
    <xsl:template match="@href">
        <xsl:attribute name="file" select="."/>
    </xsl:template>
    
    <xsl:template match="xref">
        <xsl:apply-templates select="key('by-id',@rid)" mode="title"/>
    </xsl:template>
    
    <xsl:key name="by-id" match="*" use="@id"/>
    
    <xsl:template match="*" mode="title">
        <xsl:value-of select="head"/>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="replace(.,'\s+',' ')"/>
    </xsl:template>
    
</xsl:stylesheet>