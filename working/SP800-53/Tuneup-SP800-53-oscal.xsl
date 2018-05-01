<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="3.0">
  
<!-- For further tweaking SP800-53 OSCAL -->

<!--  silencing noisy Saxon ... -->
  <xsl:template match="/*">
    <xsl:next-match/>
  </xsl:template>
  
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
      <xsl:apply-templates select=".//(assign|selection) except subcontrol//(assign|selection)" mode="make-param"/>
      <xsl:apply-templates select="* except title"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="assign" mode="make-param">
    <param>
      <xsl:attribute name="id">
        <xsl:apply-templates select="." mode="make-id"/>
      </xsl:attribute>
      <xsl:for-each select="ancestor::selection">
        <xsl:attribute name="depends-on">
          <xsl:apply-templates select="." mode="make-id"/>
        </xsl:attribute>
      </xsl:for-each>
      <desc>
        <xsl:apply-templates/>
      </desc>
      <label>
        <xsl:apply-templates/>
      </label>
    </param>
  </xsl:template>
  
  <xsl:template match="selection" mode="make-param">
    <param>
      <xsl:attribute name="id">
        <xsl:apply-templates select="." mode="make-id"/>
      </xsl:attribute>
      <desc>SELECT</desc>
      <select>
        <xsl:if test="starts-with(.,'(one or more)')">
          <xsl:attribute name="how-many">one or more</xsl:attribute>
        </xsl:if>
        <xsl:apply-templates mode="#default"/>
      </select>
    </param>
  </xsl:template>
  
  <xsl:template match="selection/text()[.='(one or more)']" mode="#default"/>
  
  <xsl:template match="assign | selection">
    <insert>
      <xsl:attribute name="param-id">
        <xsl:apply-templates select="." mode="make-id"/>
      </xsl:attribute>
    </insert>
  </xsl:template>
  
  <xsl:template match="assign | selection" mode="make-id">
    <xsl:value-of select="ancestor::control/@id"/>
    <xsl:text>_prm_</xsl:text>
    <xsl:number count="assign | selection" from="control" level="any" format="1"/>
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
  
  <xsl:template match="part[@class='objective']">
    <xsl:copy>
      <xsl:attribute name="id">
        <xsl:apply-templates select="." mode="munge-id"/>
      </xsl:attribute>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <!-- @id munging modified for rev5 not including SP800-53A  -->
  <xsl:template as="xs:string" mode="munge-id" match="control | subcontrol | part">
    <!-- id leads with element class or name code, plus @id value stripped of punctuation -->
    <xsl:value-of select="replace(@id,'\p{P}\p{P}*','.') => replace('\.$','')"/>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  <xsl:template as="xs:string" mode="munge-id" match="part[@class='item']">
    <xsl:value-of>
      <xsl:apply-templates select="(ancestor::control | ancestor::subcontrol)[last()]" mode="munge-id"/>
      <xsl:text>_smt_</xsl:text>
      <xsl:number format="a.1.a.1" level="multiple" count="part" from="control | subcontrol"/>
    </xsl:value-of>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  <xsl:template as="xs:string" mode="munge-id" match="part[@class='objective']">
    <xsl:value-of>
      <xsl:apply-templates select="(ancestor::control | ancestor::subcontrol)[last()]" mode="munge-id"/>
      <xsl:text>_obj_</xsl:text>
      <xsl:number format="a.1.a.1" level="multiple" count="part" from="control | subcontrol"/>
    </xsl:value-of>
    <!-- Note outputs only happen to be valid in the result -->
  </xsl:template>
  
  <!--<xsl:template as="xs:string" mode="munge-id" match="part">
    <!-\- id leads with element class or name code, plus @id value stripped of punctuation -\->
    <!-\-<xsl:value-of select="( 's_'[exists(current()/ancestor::subcontrol)] || (current()/@class/string(),name(..))[1] => translate('ectani-','') => substring(1,3)) || '_' || replace(@id,'\p{P}($|\p{P}+)','.')"/>-\->
    <!-\- Note outputs only happen to be valid in the result -\->
  </xsl:template>-->
  
</xsl:stylesheet>