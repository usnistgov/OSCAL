<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:dsk="http://wendellpiez.com/docsketch/xslt/util"
  exclude-result-prefixes="#all"
  version="2.0">
  
  <xsl:variable name="squeeze"    select="0.01"/>
  <xsl:variable name="inter"      select="4"/>
  <xsl:variable name="indent"       select="17"/>

  <xsl:variable name="fullWidth" select="240 + (max((//control/count(ancestor::*),0)) * 120)"/>
  
  
  <xsl:output indent="yes"/>
    <!--doctype-public="-//W3C//DTD SVG 1.0//EN"
    doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>-->

  <!--<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">-->

  <xsl:template match="/">
    <!--<xsl:copy-of select="$boxes"/>-->
    <xsl:variable as="element()" name="buffered">
      <xsl:apply-templates select="*" mode="buffer"/>
    </xsl:variable>
    <!--<test>-->
    <!--<xsl:copy-of select="$buffered"/>-->
    <xsl:apply-templates select="$buffered" mode="draw"/>
    <!--</test>-->
  </xsl:template>
  
  <!-- 'buffer' mode appends information to the tree for extra
       spacing; each box gets extra buffering for its descendant boxes.
       (This can be calculated dynamically, but it is expensive. We need this 
       not only for box sizing but for calculating the y position of subsequent boxes.) -->
  <xsl:template match="*" mode="buffer">
    <xsl:copy copy-namespaces="no">
      <xsl:copy-of select="@*"/>
       <xsl:attribute name="buffer" select="count(.|*)"/>
      <xsl:apply-templates mode="buffer"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="dsk:hierarchy" mode="draw">
    <!--<xsl:variable name="height" select="dsk:e/@height + (2 * $headExtent)"/>-->
    <xsl:variable name="svgContents">
      <xsl:apply-templates mode="#current"/>
    </xsl:variable>
    
    <!-- 800 or the maximum x bound, whicher is larger -->
    <xsl:variable name="width"
      select="max($svgContents//@dsk:xBound) + (2 * $inter)"/>
    <xsl:variable name="height" select="max($svgContents//@dsk:yBound) + (2 * $inter)"/>
    
    <!--<svg version="1.1"
      viewBox="0 0 800 {$height}" width="800" height="{$height}">-->
    <svg version="1.1"
      viewBox="0 0 {$width} {$height}" height="{$height}" width="{$width}">
      
      <!--<defs>
        <linearGradient id="fade-text" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%"   stop-opacity="0.8" stop-color="lightsteelblue"/>
          <stop offset="100%" stop-opacity="0"   stop-color="lightsteelblue"/>
        </linearGradient>
        <linearGradient id="fade-div" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%"   stop-opacity="0.8" stop-color="slateblue"/>
          <stop offset="100%" stop-opacity="0"   stop-color="slateblue"/>
        </linearGradient>
      </defs>-->
      
      <g transform="translate({$inter} {$inter})">
        <xsl:apply-templates select="$svgContents" mode="scrub"/>
      </g>
    </svg>
  </xsl:template>
  
  <!-- Scrub mode removes anything with dsk namespace from SVG results -->
  <xsl:template match="node() | @*" mode="scrub">
    <xsl:copy copy-namespaces="no">
      <xsl:apply-templates select="node() | @*" mode="scrub"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="dsk:*" mode="scrub">
    <xsl:apply-templates select="node() | @*" mode="scrub"/>
  </xsl:template>
  
  <xsl:template match="@dsk:*" mode="scrub"/>
    
  <xsl:template match="dsk:label" mode="draw">
    <xsl:param name="offset" required="yes"/>
    <xsl:param name="depth"  required="yes"/>
    <text font-size="10" fill="black" x="{$depth + 2}" y="{$offset - 2} ">
      <xsl:apply-templates mode="#current"/>
    </text>
  </xsl:template>
  
  <xsl:template match="dsk:e" mode="draw">
    <xsl:variable name="depth" select="count(ancestor::*) * $indent"/>
    <xsl:variable name="extent" select="$fullWidth - ($depth * 1.5)"/>
    <xsl:variable name="predecessors" select="ancestor::*|preceding::*"/>
    <xsl:variable name="offset"
      select="(sum(ancestor-or-self::*/preceding-sibling::*//@extent) * $squeeze) +
      (count(ancestor-or-self::*/(.|preceding-sibling::*)) * $inter) +
      (sum(preceding::*/@buffer) * $inter)"/>
    <xsl:variable name="breadth"
      select="(sum(.//@extent) * $squeeze) + (sum(.//@buffer) * $inter)"/>
    <rect y="{$offset}" x="{$depth}" width="{$extent}" height="{$breadth}"
      stroke="black" stroke-width="1" fill="white" title="{@gi}"
      dsk:yBound="{$offset + $breadth}" dsk:xBound="{$depth + $extent}">
      <xsl:apply-templates select="." mode="box-style"/>
    </rect>
    <xsl:apply-templates mode="#current">
      <xsl:with-param name="offset" select="$offset + 10"/>
      <xsl:with-param name="depth"  select="$depth"/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="dsk:e" priority="999" mode="box-style">
    <xsl:attribute name="stroke-width">1</xsl:attribute>
    <xsl:attribute name="stroke">black</xsl:attribute>
    <xsl:attribute name="stroke-opacity">1</xsl:attribute>
    <xsl:attribute name="fill">white</xsl:attribute>
    <xsl:attribute name="fill-opacity">1.0</xsl:attribute>
    <xsl:next-match/>
  </xsl:template>
  
  <!--<xsl:template match="dsk:text" priority="999" mode="box-style">
    <xsl:attribute name="stroke-width">1</xsl:attribute>
    <xsl:attribute name="stroke">peru</xsl:attribute>
    <xsl:attribute name="stroke-opacity">1</xsl:attribute>
    <xsl:attribute name="fill">burlywood</xsl:attribute>
    <xsl:attribute name="fill-opacity">1.0</xsl:attribute>
    <xsl:next-match/>
  </xsl:template>-->
  
  <xsl:template match="dsk:e[@gi='control']" mode="box-style">
    <xsl:attribute name="fill">gold</xsl:attribute>
    <xsl:attribute name="fill-opacity">0.5</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='subcontrol']" mode="box-style">
    <xsl:attribute name="fill">maroon</xsl:attribute>
    <xsl:attribute name="fill-opacity">0.3</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='profile']" mode="box-style">
    <xsl:attribute name="fill">skyblue</xsl:attribute>
    <xsl:attribute name="fill-opacity">0.3</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='import']" mode="box-style">
    <xsl:attribute name="fill">pink</xsl:attribute>
    <xsl:attribute name="fill-opacity">0.3</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='catalog']" mode="box-style">
    <xsl:attribute name="fill">lavender</xsl:attribute>
  </xsl:template>
  
 
  
  <xsl:template match="dsk:e[@gi='group']" mode="box-style">
    <xsl:attribute name="stroke-dasharray">2 1</xsl:attribute>
  </xsl:template>
  
  <!--<xsl:template match="dsk:e[@gi='quote']" mode="box-style">
    <xsl:attribute name="fill">purple</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='eg']" mode="box-style">
    <xsl:attribute name="fill">orange</xsl:attribute>
  </xsl:template> -->
  
  <xsl:template match="dsk:e[@gi='figure']" mode="box-style">
    <xsl:attribute name="fill">lightgreen</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e[@gi='graphic']" mode="box-style">
    <xsl:attribute name="fill">green</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="dsk:e" mode="box-style"/>
  
</xsl:stylesheet>