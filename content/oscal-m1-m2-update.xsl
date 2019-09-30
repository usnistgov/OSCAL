<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- This XSLT, applied to an XML document valid to the Milestone1 OSCAL schema version for Catalog or Profile,
     will produce a similar XML document valid to the Milestone2 OSCAL schema. -->
    
    <xsl:strip-space elements="catalog group control subcontrol part param"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/*">
        <xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - Milestone 1 OSCAL becomes Milestone 2 OSCAL  - </xsl:comment>
        <xsl:next-match/>
    </xsl:template>
    
    <!-- Rewriting top-level @id -->
    <xsl:template match="/*/@id[function-available('uuid:randomUUID')]" xmlns:uuid="java:java.util.UUID">
        <xsl:attribute name="id" select="'uuid-' || uuid:randomUUID()"/>
    </xsl:template>
    
    <!-- copy metadata, mostly -->
    <xsl:template match="metadata">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="title"/>
            <!-- time stamp it at runtime -->
            <last-modified xsl:expand-text="true">{ current-dateTime() }</last-modified>
            <xsl:apply-templates select="* except title"/>
        </xsl:copy>
    </xsl:template>

    <!-- remove the old modification date, no longer valid or applicable -->
    <xsl:template match="last-modified-date"/>
    
    <!-- rename subcontrol to control, keeping its attributes -->
    <xsl:template match="subcontrol">
        <control>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </control>
    </xsl:template>
    
    <!-- add role-id elements to party -->
    <xsl:template match="party">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="tokenize(@role-id,'\s+')">
                <role-id xsl:expand-text="true">{ . }</role-id>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- but drop the party/@role-id -->
    <xsl:template match="party/@role-id"/>
    
    <!-- rewrite subcontrol-id as control-id -->
    <xsl:template match="@subcontrol-id">
        <xsl:attribute name="control-id">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
</xsl:stylesheet>