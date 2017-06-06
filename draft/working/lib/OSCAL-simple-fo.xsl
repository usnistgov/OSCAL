<?xml version="1.0" encoding="utf-8"?>

<!-- NOT YET AN OSCAL XSL! 2017-06-06 -->

<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simple" page-height="11in"
          page-width="8.5in" margin-top="0.5in" margin-bottom="0.5in"
          margin-left="1in" margin-right="1in">
          <fo:region-body region-name="content" margin-top="1in"
            margin-bottom="0.5in"/>
          <fo:region-before region-name="header" extent="1in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>

      <xsl:apply-templates select="paper"/>
    </fo:root>
  </xsl:template>

  <xsl:template match="paper">
    <fo:page-sequence master-reference="simple">
      <fo:static-content flow-name="header">
        <fo:block text-align="right" font-size="9pt">
          <xsl:apply-templates select="author | date"/>
          <fo:block>
            <xsl:text>page </xsl:text>
            <fo:page-number/>
          </fo:block>
        </fo:block>
      </fo:static-content>
      <fo:static-content flow-name="xsl-footnote-separator">
        <fo:block end-indent="4in" margin-top="12pt" margin-bottom="8pt"
          border-width="0.5pt" border-bottom-style="solid"/>
      </fo:static-content>
      <fo:flow flow-name="content">
        <fo:block font-family="sans-serif">
          <xsl:apply-templates select="title"/>
        </fo:block>
        <fo:block space-before="20pt" font-family="serif" font-size="11pt"
          line-height="13pt" line-height-shift-adjustment="disregard-shifts"
          start-indent="2em" end-indent="2em">
          <xsl:apply-templates select="paragraph"/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <xsl:template match="title">
    <fo:block font-size="16pt" font-weight="bold">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="author | date">
    <fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="paragraph">
    <fo:block text-indent="2em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="mention">
    <fo:inline font-weight="bold">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="stress">
    <fo:inline font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="note">
    <fo:footnote>
      <fo:inline baseline-shift="super" font-size="65%">
        <xsl:number level="any"/>
      </fo:inline>
      <fo:footnote-body space-before="12pt" font-size="10pt" line-height="13pt">
        <fo:block text-indent="-1em" start-indent="1em" end-indent="0em">
          <xsl:number level="any"/>
          <xsl:text>. </xsl:text>
          <xsl:apply-templates/>
        </fo:block>
      </fo:footnote-body>
    </fo:footnote>
  </xsl:template>

</xsl:stylesheet>
