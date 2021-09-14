<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="xs math"
    version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0" xmlns:x="http://www.jenitennison.com/xslt/xspec"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:namespace name="opr">http://csrc.nist.gov/ns/oscal/profile-resolution</xsl:namespace>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="x:expect//control | x:expect//param">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="opr:id" expand-text="true">{ancestor::selection/@id}#{@id}</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
