<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/specml"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml" version="3.0">

    <xsl:output indent="yes"/>

    <!-- This XSLT produces a set of file-oriented XSpecs binding to files named in the Specification document
//req/@eg values -->

    <xsl:output method="text"/>


    <xsl:template match="SPECIFICATION" expand-text="true">
        <xsl:variable name="items" as="element()*">
            <xsl:apply-templates select="//req" mode="line-item"/>
        </xsl:variable>
        <xsl:apply-templates select="$items" mode="md"/>
    </xsl:template>

    <xsl:template match="item" mode="md">
        <xsl:text expand-text="true">&#xA;- [{ if (eg/@href != '') then 'x' else ' ' }] </xsl:text>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <xsl:template match="eg" mode="md">
        <xsl:text expand-text="true"> [test { @href ! ('`' || . || '`')} </xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="@id" mode="md" expand-text="true">`{.}`</xsl:template>

    <xsl:mode name="line-item" on-no-match="shallow-copy"/>

    <xsl:template match="req" mode="line-item">
        <item>
            <xsl:text expand-text="true">`{ @id }`</xsl:text>
            <xsl:apply-templates select="." mode="test-header"/>
            <xsl:apply-templates mode="#current"/>
            <xsl:copy-of select="eg"/>
        </item>
    </xsl:template>

    <xsl:template match="eg" mode="line-item"/>

    <xsl:template match="head" mode="make-file-scenario"/>

    <xsl:template match="section" mode="test-header">
        <!--<xsl:apply-templates select="parent::section" mode="#current"/>-->
        <xsl:text> *</xsl:text>
        <xsl:number level="multiple" format="1.1"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="head"/>
        <xsl:text>* </xsl:text>

    </xsl:template>

    <xsl:template match="req" mode="test-header">
        <xsl:apply-templates select="ancestor::section[1]" mode="#current"/>
    </xsl:template>

    <xsl:template match="text()" mode="#all">
        <xsl:text expand-text="true">{ replace(.,'\s+',' ') }</xsl:text>
    </xsl:template>

    <xsl:template match="xref" expand-text="true">
        <xsl:text>[Section {@rid}]</xsl:text>
    </xsl:template>

</xsl:stylesheet>
