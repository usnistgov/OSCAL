<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- 
        Run this stylesheet to replace 'uuid' with an actual uuid.
      Wherever there is an id or uuid, a fresh uuid is added. -->
    
    <xsl:strip-space elements="catalog group control subcontrol part param resource
        metadata back-matter revision annotation location party person org rlink address biblio resource citation role responsible-party
        profile import merge custom group modify include exclude set alter add"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - UUIDs refreshed </xsl:comment>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Copying and adding uuid -->
    <xsl:template match="@id" xmlns:uuid="java:java.util.UUID">
        <xsl:copy-of select="."/>
        <xsl:call-template name="uuid"/>
    </xsl:template>
    
    <!-- Fresh uuid -->
    <xsl:template match="*[empty(@id)]/@uuid" name="uuid" xmlns:uuid="java:java.util.UUID">
        <xsl:attribute name="uuid" select="uuid:randomUUID()"/>
    </xsl:template>

</xsl:stylesheet>