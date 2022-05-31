<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output cdata-section-elements="tagging"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="*">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="node() | @*"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="/html">
        <xsl:apply-templates select="body"/>
    </xsl:template>

    <xsl:template match="body">
        <SPECIFICATION>
            <xsl:apply-templates/>
        </SPECIFICATION>
    </xsl:template>

    <xsl:template match="pre">
        <tagging>
            <xsl:apply-templates/>
        </tagging>
    </xsl:template>

    <xsl:template match="pre/code">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="h6 | h5 | h4 |h3 | h2">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>

</xsl:stylesheet>
