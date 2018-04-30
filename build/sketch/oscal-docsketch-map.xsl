<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:dsk="http://wendellpiez.com/docsketch/xslt/util"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all"
  version="2.0">

<!--<xsl:import href="docsketch-map.xsl"/>-->
<!--  
  
  ==== Generic document sketch map discriminates between textual (including mixed) content,
       and element only content.
       Extents are calculated for text-bearing elements, while the sizing of element containers
       is expected to "wrap" these.
       
       So, not for making bows indicating relative position, but boxes or containers indicating structure.
       
       <e gi="div">
         <e gi="p" extent="101"/>
         <e gi="p" extent="102"/>
       </e>

  -->
  <!--<xsl:variable name="squeeze"    select="0.005"/>
  <xsl:variable name="inter"      select="2"/>
  <xsl:variable name="headExtent" select="15"/>
  <xsl:variable name="indent"     select="15"/>-->
  
  <!--<xsl:variable name="squeeze"    select="0.005"/>-->
  <!--<xsl:variable name="inter"      select="2"/>-->
  
  <xsl:variable name="headExtent" select="80"/>
  
  <xsl:output indent="yes"/>
    <!--doctype-public="-//W3C//DTD SVG 1.0//EN"
    doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>-->

  <!--<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">-->


  <xsl:template match="/">
    <dsk:hierarchy>
      <xsl:apply-templates/>
    </dsk:hierarchy>
  </xsl:template>
  
  
  <!-- 'box' mode specifies the dimensions of the nested boxes.
     Override these templates from an importing stylesheet to get
     behavior customized to a document type. -->
  
  <!-- By default, an element that has only element content will specify
       a box including contained boxes. -->
  <xsl:template match="*">
    <dsk:e gi="{name()}">
      <xsl:apply-templates select="." mode="label"/>
      <xsl:apply-templates select="*"/>
    </dsk:e>
  </xsl:template>
  
  <xsl:template match="p | ul | ol | pre | li">
    <dsk:e gi="{name()}">
      <xsl:apply-templates select="." mode="extent"/>
      <xsl:apply-templates select="li"/>
    </dsk:e>
  </xsl:template>
  
  <xsl:template match="title" mode="label">
    <dsk:label extent="{$headExtent}">
      <xsl:apply-templates/>
    </dsk:label>
  </xsl:template>
  
  <xsl:template match="call" mode="label">
    <dsk:label extent="{$headExtent}">
      <xsl:text>call </xsl:text><xsl:apply-templates select="@control-id | @subcontrol-id"/>
    </dsk:label>
  </xsl:template>
  
  <xsl:template match="all" mode="label">
    <dsk:label>
      <xsl:text>all</xsl:text>
    </dsk:label>
  </xsl:template>
  
  <xsl:template match="*" mode="label">
    <dsk:label>
      <xsl:value-of select="local-name()"/>
    </dsk:label>
  </xsl:template>
  
  <xsl:template match="import" mode="label">
    <dsk:label>
      <xsl:text>import </xsl:text>
      <xsl:value-of select="@href"/>
    </dsk:label>
  </xsl:template>
  
  <xsl:template match="p | ul | ol | pre" mode="label"/>
  
  <xsl:template match="p | ul | ol | li | pre" mode="extent">
    <xsl:value-of select="string-length(.)"/>
  </xsl:template>
  
</xsl:stylesheet>