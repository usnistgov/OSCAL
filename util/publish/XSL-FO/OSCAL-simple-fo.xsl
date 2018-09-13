<?xml version="1.0" encoding="utf-8"?>

<!-- NOT YET AN OSCAL XSL! 2017-06-06 -->

<xsl:stylesheet version="2.0" xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

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

      <xsl:apply-templates select="catalog"/>
    </fo:root>
  </xsl:template>

  <xsl:template match="catalog">
    <fo:page-sequence master-reference="simple" font-family="serif">
      <fo:static-content flow-name="header">
        <fo:block text-align="right" font-size="9pt">
          <xsl:apply-templates select="title"/>
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
        <xsl:apply-templates/>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <xsl:template match="title">
    <fo:block font-size="16pt" font-weight="bold" keep-with-next="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="group/title">
    <fo:block font-size="14pt" font-weight="bold" font-style="italic" keep-with-next="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="group/group/title" priority="2">
    <fo:block font-size="12pt" font-weight="bold" keep-with-next="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="control/title">
    <fo:block font-size="14pt" font-family="sans-serif" font-weight="bold" font-style="italic" keep-with-next="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  

  <xsl:template match="p">
    <fo:block space-before="0.5em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <!--<xsl:template match="mention">
    <fo:inline font-weight="bold">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>-->

  <!--<xsl:template match="note">
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
  </xsl:template>-->

  <xsl:template match="control">
    <fo:block space-before="1em" padding="0.5em" border-style="thin">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="prop">
    <fo:block font-family="sans-serif" space-before="0.5m" font-size="80%">
      <fo:inline font-weight="bold">
        <xsl:apply-templates select="@class"/>
      <xsl:text>: </xsl:text>
      </fo:inline>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="desc">
    <fo:block space-before="1em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="part">
    <fo:block space-before="1em">
      <xsl:apply-templates select="." mode="label"/>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="part" mode="label">
    <fo:block font-size="12pt" font-family="sans-serif">
      <xsl:apply-templates select="@class"/>
    </fo:block>
  </xsl:template>
  
  
  <xsl:template match="references">
    <fo:block space-before="1em">
      <fo:block font-size="12pt" font-family="sans-serif">References</fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  
  <xsl:template match="ol">
    <fo:list-block provisional-distance-between-starts="2em"
      provisional-label-separation="1em"  space-before="0.5em">
      <xsl:apply-templates/>
    </fo:list-block>
  </xsl:template>
  
  <xsl:template match="li">
    <fo:list-item space-before="0.5em">
      <xsl:apply-templates select="." mode="item-no"/>
      <fo:list-item-body start-indent="body-start()">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:list-item-body>
    </fo:list-item>
  </xsl:template>
  
  <xsl:template match="li" mode="item-no">
    <fo:list-item-label end-indent="label-end()">
      <fo:block>
        <xsl:number format="a"/>
        <xsl:text>.</xsl:text>
      </fo:block>
    </fo:list-item-label>
  </xsl:template>
  
  <xsl:template match="li//li" mode="item-no">
    <fo:list-item-label end-indent="label-end()">
      <fo:block>
        <xsl:number format="1"/>
      </fo:block>
    </fo:list-item-label>
  </xsl:template>
  
  <xsl:template match="em | i">
    <fo:inline font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>
  
  
  <xsl:template match="ref">
      <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="std | citation">
    <fo:block padding-left="3em" text-indent="-3em">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="extensions">
    <fo:block space-before="1em">
      <fo:block font-size="12pt" font-family="sans-serif">Extensions</fo:block>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>
  
  <xsl:template match="xref">
    <fo:inline font-style="italic">
      <xsl:apply-templates/>
    </fo:inline>
  </xsl:template>

  
</xsl:stylesheet>
