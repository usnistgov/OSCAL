<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="3.0">
  
<!-- For further tweaking SP800-53 OSCAL -->

  <xsl:mode on-no-match="shallow-copy"/>
  
<!-- For whatever reason the source contains empty elements mapping to p elements... -->
  <xsl:template match="p[not(matches(.,'\S'))]"/>
  
  <!-- We produce param elements and insert them into controls, for any .//assign
       elements found herein.
  
  Note 'assign' is a temporary (placeholder) element from an earlier step; it
  marks where 'assignment' syntax has been used in the source. In the result,
  it produces a param|insert pair. -->
  <xsl:template match="control | subcontrol">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select=".//assign except subcontrol//assign" mode="make-param"/>
      <xsl:apply-templates select="* except title"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="assign" mode="make-param">
    <param>
      <xsl:attribute name="id">
        <xsl:apply-templates select="." mode="make-id"/>
      </xsl:attribute>
      <desc>
        <xsl:apply-templates/>
      </desc>
      <value>
        <xsl:apply-templates/>
      </value>
    </param>
  </xsl:template>
  
  <xsl:template match="assign">
    <insert>
      <xsl:attribute name="param-id">
        <xsl:apply-templates select="." mode="make-id"/>
      </xsl:attribute>
    </insert>
  </xsl:template>
  
  <xsl:template match="assign" mode="make-id">
    <xsl:value-of select="ancestor::control/@id"/>
    <xsl:number from="control" level="any" format="_a"/>
  </xsl:template>

  <xsl:template match="link[starts-with(@href,'#')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <!-- display string should be acquired from the link target -->
    </xsl:copy>
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
  
  
  <!-- @id munging modified for rev5 not including SP800-53A  -->
  <xsl:template as="xs:string" mode="munge-id" match="control | subcontrol | part">
    <!-- id leads with element class or name code, plus @id value stripped of punctuation -->
    <xsl:value-of select="replace(@id,'\p{P}\p{P}*','.') => replace('\.$','')"/>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  <!--<xsl:template as="xs:string" mode="munge-id" match="part">
    <!-\- id leads with element class or name code, plus @id value stripped of punctuation -\->
    <!-\-<xsl:value-of select="( 's_'[exists(current()/ancestor::subcontrol)] || (current()/@class/string(),name(..))[1] => translate('ectani-','') => substring(1,3)) || '_' || replace(@id,'\p{P}($|\p{P}+)','.')"/>-\->
    <!-\- Note outputs only happen to be valid in the result -\->
  </xsl:template>-->
  
</xsl:stylesheet>