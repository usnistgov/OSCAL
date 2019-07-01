<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" 
    xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0" 
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Converts and old-style metaschema (up to Sprint 21) into a new-style metaschema (Sprint 22) -->
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/comment() | /processing-instruction() | /*">
        <xsl:text>&#xA;</xsl:text>
        <xsl:next-match/>
    </xsl:template>
    
    <!--https://github.com/usnistgov/OSCAL/issues/442-->
    <xsl:template match="@named">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <!--https://github.com/usnistgov/OSCAL/issues/442-->
    <xsl:template match="flag/@name">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="define-assembly | define-field |define-flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="formal-name | description"/>
            <xsl:apply-templates select="* except (formal-name | description | remarks | example)"/>
            <xsl:apply-templates select="remarks | example"/>
        </xsl:copy>
        
    </xsl:template>

    <xsl:template match="field[@required='yes'] | assembly[@required='yes']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="min-occurs">1</xsl:attribute>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="fields">
        <field>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="max-occurs">unbounded</xsl:attribute>
        </field>
    </xsl:template>
    
    <xsl:template match="assemblies">
        <assembly>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="max-occurs">unbounded</xsl:attribute>
        </assembly>
    </xsl:template>
    
    <xsl:template match="field/@required | fields/@required | assembly/@required | assemblies/@required">
        <xsl:attribute name="min-occurs">1</xsl:attribute>
    </xsl:template>
    
</xsl:stylesheet>