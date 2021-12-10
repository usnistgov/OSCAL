<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
    version="3.0">

    <xsl:import href="specml-html-xslt1.xsl"/>

    <xsl:output method="xml"/>

    <xsl:template name="yaml-header">
        <xsl:text>---</xsl:text>
        <xsl:text>&#xA;title: OSCAL Profile Resolution</xsl:text>
        <xsl:text>&#xA;description: Transforming a profile into the tailored catalog it represents</xsl:text>
        <!--<xsl:text>&#xA;custom_css:</xsl:text>
        <xsl:text>&#xA;  - /css/oscal-specs.css</xsl:text>-->
        <xsl:text>&#xA;toc:</xsl:text>
        <xsl:text>&#xA;  enabled: true</xsl:text>
        <xsl:text>&#xA;  headingselectors: "h1, h2, h3, h4, h5"</xsl:text>
        <xsl:text>&#xA;---&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="SPECIFICATION">
        <xsl:call-template name="yaml-header"/>
        <xsl:variable name="page">
          <xsl:apply-templates/>
        </xsl:variable>
        <xsl:apply-templates select="$page" mode="for-serialization"/>
        <!--</div>-->
    </xsl:template>

    <xsl:template match="tagging">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="tagging" mode="for-serialization">
        <xsl:text disable-output-escaping="true">{{&lt; highlight xml>}}</xsl:text>
        <xsl:value-of select="string(.)" disable-output-escaping="yes"/>
        <xsl:text disable-output-escaping="true">{{&lt;/highlight>}}</xsl:text>
    </xsl:template>

    <xsl:template match="* | @*" mode="for-serialization">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node()" mode="#current"/>
        </xsl:element>
    </xsl:template>





</xsl:stylesheet>
