<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
<!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="profile">
        <catalog>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="id" select="concat(@id,'-RESOLVED')"/>
            <xsl:apply-templates/>
        </catalog>
    </xsl:template>
    
    <xsl:template match="catalog">
        <xsl:apply-templates/>
    </xsl:template>

    <!-- discard groups with no parameters, controls or groups -->
    <xsl:template match="group[empty(control|param|group)]"/>

    <!-- dropped from regular traversal -->
    <xsl:template match="modify"/>
    
</xsl:stylesheet>