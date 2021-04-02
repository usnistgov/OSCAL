<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:uuid="java:java.util.UUID" 
    exclude-result-prefixes="#all"
    version="3.0">
    
<!-- This XSLT, applied to an XML document valid to the Milestone 3 OSCAL schema version for Catalog, Profile, SSP or Component,
     will produce a similar XML document, valid or closer to valid to the Release Candidate 1 OSCAL schema. -->
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:mode name="copy" on-no-match="shallow-copy"/>
    
    <xsl:variable select="uuid:randomUUID()" name="new-document-uuid"/>
    <xsl:variable select="uuid:randomUUID()" name="new-this-system-component-uuid"/>
    
    <!-- Grabbing the old UUID or the new UUID if there is no old one. -->
    <xsl:variable name="this-system-component-uuid" select="(/*/system-implementation/component[(@type|@component-type='this-system')]/@uuid,$new-this-system-component-uuid)[1]"/>
    
<!-- 
In {top-level-element}/metadata:
x renamed "revision-history" to "revisions"
x renamed "doc-id" to "document-id"

In {top-level-element}/metadata/document-id:
x renamed "type" to "scheme"
a doc-id/@type 'doi' to document-id/@scheme 'https://www.doi.org/'

    -->

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="@* except @id"/>
            <xsl:attribute name="uuid" select="$new-document-uuid"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="add-objectives-and-methods">
        <objectives-and-methods>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </objectives-and-methods>
    </xsl:template>
    
   
</xsl:stylesheet>