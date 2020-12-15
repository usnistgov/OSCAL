<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- refresh uuids:
    
    1. Any attribute named 'uuid' gets a new (UUID) value
    2. Any attribute or element whose string value corresponds to an *extant* UUID value
         in the same document, is provided with the same value.
    We do this in two passes, with a @new-uuid flag holding an intermediate value
      (so this filter will break on data with this attribute)
    -->
    
    <xsl:mode name="modify" on-no-match="shallow-copy"/>
    <xsl:mode name="rewire" on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <xsl:variable name="with-new-uuids">
            <xsl:apply-templates mode="modify"/>
        </xsl:variable>
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="$with-new-uuids/*" mode="rewire"/>
    </xsl:template>

    <!-- scrubbing initial comments -->
    <xsl:template match="/comment()" mode="modify"/>

    <!-- time stamping last-modified date -->
    <xsl:template mode="modify" match="last-modified" priority="2" expand-text="true">
        <last-modified>{ current-dateTime() }</last-modified>
    </xsl:template>
    
    <!-- adding a new UUID -->
    <xsl:template match="@uuid" mode="modify">
        <xsl:copy-of select="."/>
        <xsl:attribute name="new-uuid" select="uuid:randomUUID()" xmlns:uuid="java:java.util.UUID"/>
    </xsl:template>

    <!-- a template like this will keep these UUIDs stable instead of rewriting them -->
    <!--<xsl:template match="back-matter/resource/@uuid" mode="modify">
        <xsl:copy-of select="."/>
    </xsl:template>-->
    
    <xsl:key name="by-uuid" match="*[exists(@uuid)]" use="@uuid"/>
    
    <!--Rewiring phase replaces the uuid and rewrites links that address it -->
    <xsl:template mode="rewire" match="@uuid[exists(../@new-uuid)]" priority="2"/>
    
    <xsl:template mode="rewire" match="@new-uuid" priority="2">
        <xsl:attribute name="uuid" select="."/>
        <xsl:message expand-text="true">UUID { ../@uuid } BECOMES { . } </xsl:message>
    </xsl:template>
    
    <!-- Match any empty element or any attribute whose string value
     corresponds to a UUID elsewhere in the (same) document with a (new) @new-uuid;
     and update it. -->
    <xsl:template mode="rewire"
        match="*[empty(*)][exists(key('by-uuid',.)/@new-uuid)] |
        @*[exists(key('by-uuid',.)/@new-uuid)]">
        <xsl:variable name="new-uuid" select="key('by-uuid',.)/(@new-uuid)[1]"/>
            <xsl:message expand-text="true">UPDATING { name() } POINTING TO { . } WITH { $new-uuid } </xsl:message>
        <xsl:copy>
            <xsl:apply-templates select="@*" mode="rewire"/>
            <xsl:value-of select="$new-uuid"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>