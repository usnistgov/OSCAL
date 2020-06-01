<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- 
        Run this stylesheet to replace 'uuid' with an actual uuid.
      Wherever there is an id or uuid, a fresh uuid is added. -->
    
    <!-- Catalog, M2 and M3   -->
    <xsl:strip-space elements="param guideline select part metadata back-matter revision annotation location party rlink address biblio resource citation role responsible-party catalog group control person org"/>
    
    <!-- Profile, M2 and M3   -->
    <xsl:strip-space elements="metadata back-matter revision annotation location party rlink address biblio resource citation role responsible-party param guideline select part profile import merge custom group modify include exclude set-parameter alter add person org set"/>
    
    <!-- SSP, M2 and M3   -->
    <xsl:strip-space elements="metadata back-matter revision annotation location party rlink address biblio resource citation role responsible-party system-security-plan import-profile system-characteristics system-information information-type confidentiality-impact integrity-impact availability-impact security-impact-level status leveraged-authorization authorization-boundary diagram network-architecture data-flow system-implementation user authorized-privilege component protocol system-inventory inventory-item implemented-component control-implementation implemented-requirement statement responsible-role by-component set-parameter person org service interconnection set-param"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - UUIDs refreshed </xsl:comment>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Copying and adding uuid -->
    <xsl:template match="resource/@uuid | party-id/@uuid" xmlns:uuid="java:java.util.UUID">
        <xsl:copy-of select="."/>
        <xsl:call-template name="new-uuid"/>
    </xsl:template>
    
    <!-- Fresh uuid -->
    <xsl:template name="new-uuid" xmlns:uuid="java:java.util.UUID">
        <xsl:attribute name="new-uuid" select="uuid:randomUUID()"/>
    </xsl:template>

</xsl:stylesheet>