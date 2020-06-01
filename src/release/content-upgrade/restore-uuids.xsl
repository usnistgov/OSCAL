<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- Working XSLT rewrites links to uuids -->
    
    
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
        <!--<xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - UUIDs refreshed </xsl:comment>-->
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- Removing resource/@id -->
    <xsl:template match="resource/@id | party/@id | resource/@uuid | party/@uuid"/>
    
    <xsl:template match="@new-uuid">
        <xsl:attribute name="uuid" select="."/>
    </xsl:template>
    <!-- Wherever a link or anchor points to a resource, it will point to its UUID -->
    
    <xsl:key name="resource-as-internal-link" match="back-matter/resource" use="(@id | @uuid)/('#' || .)"/>
    
    <xsl:template match="import[exists(key('resource-as-internal-link',@href))]/@href |
        link[exists(key('resource-as-internal-link',@href))]/@href |
        a[exists(key('resource-as-internal-link',@href))]/@href">
        <xsl:variable name="target" select="key('resource-as-internal-link',.)"/>
        <xsl:attribute name="href" select="'#' || $target/@new-uuid"/>
    </xsl:template>

</xsl:stylesheet>