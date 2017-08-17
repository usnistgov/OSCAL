<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://scap.nist.gov/schema/oscal"
  xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  version="3.0">
  
<!-- For further tweaking SP800-53 OSCAL -->


  <xsl:mode on-no-match="shallow-copy"/>
  
  <!--<xsl:template match="/processing-instruction() | /comment() | /*">
    <xsl:text>&#xA;</xsl:text>
    <xsl:next-match/>
  </xsl:template>-->
    
  <!-- DW doesn't consider them numbers because they're not really numeric
       being more like identifier codes or labels -->
  <xsl:template match="@class[.='number']">
    <xsl:attribute name="class">name</xsl:attribute>
  </xsl:template>
  
  <xsl:template match="declarations">
    <xsl:comment expand-text="true"> Adjustments are needed to declarations given in {@href} </xsl:comment>
  </xsl:template>
  
  <xsl:template match="link[starts-with(.,'#')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <!-- display string should be acquired from the link target -->
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="assign">
    <xsl:copy>
      <xsl:attribute name="id">
        <xsl:value-of select="ancestor::control/@id"/>
        <xsl:number from="control" level="any" format="_a"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
<!-- Remapping these - to do: pull these mappings into earlier pipeline steps -->
  
  <xsl:template match="feat | stmt">
    <comp>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </comp>
  </xsl:template>
  
  <xsl:template match="prop[@class='description']">
    <p class="description">
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="@class[.=('statement-item','statement-subitem')]">
    <xsl:attribute name="class">item</xsl:attribute>
  </xsl:template>
  
  <xsl:key name="by-id"           match="*[@id]" use="@id"/>
  <xsl:key name="cross-reference" match="*[@id]" use="'#' || @id"/>
  
  <xsl:template match="@id">
    <xsl:attribute name="id">
      <xsl:apply-templates select="key('by-id',string(.))" mode="munge-id"/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="@href[starts-with(.,'#')]">
    <xsl:attribute name="href">
      <xsl:text>#</xsl:text>
      <xsl:apply-templates select="key('cross-reference',string(.))" mode="munge-id"/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template as="xs:string" mode="munge-id" match="stmt | feat ">
    <!-- id leads with element class or name code, plus @id value stripped of punctuation -->
    <xsl:value-of select="( 's_'[exists(current()/ancestor::subcontrol)] || (current()/@class/string(),name(..))[1] => translate('ectani-','') => substring(1,3)) || '_' || replace(@id,'\p{P}($|\p{P}+)','.')"/>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  <xsl:template as="xs:string" mode="munge-id" match="control | subcontrol">
    <!-- id leads with element class or name code, plus @id value stripped of punctuation -->
    <xsl:value-of select="replace(@id,'\p{P}($|\p{P}*)','.')"/>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  
  
</xsl:stylesheet>