<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet   version="2.0"
  
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:feed="http://scap.nist.gov/schema/sp800-53/feed/1.0"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:xlink="https://www.w3.org/TR/xlink/"
  xpath-default-namespace="http://scap.nist.gov/schema/sp800-53/1.0"
  xmlns="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="#all"
  >

  <xsl:strip-space elements="feed:controls feed:control description html:div html:ol supplemental-guidance references control-enhancements control-enhancement"/>
  
  <xsl:output indent="yes"/>
  <xsl:template match="feed:controls">
    <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="test.css"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <control-set>
      <xsl:namespace name="xlink">https://www.w3.org/TR/xlink/</xsl:namespace>
      <xsl:apply-templates/>
    </control-set>
  </xsl:template>
  
  <xsl:template match="feed:control">
    <control>
      <xsl:variable name="toAttrs" select="(control-class | family | number)[false()]"/>
      <xsl:apply-templates select="$toAttrs"/>
      <xsl:apply-templates select="* except $toAttrs"/>
    </control>
  </xsl:template>
  
  <xsl:template match="title">
    <xsl:element name="{name()}">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="control-class | family | number">
    <prp name="{name()}">
      <xsl:apply-templates/>
    </prp>
  </xsl:template>
  
  <!--<xsl:template match="family">
    <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="number">
    <xsl:attribute name="no"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>-->
  
  <xsl:template match="descriptions | decisions | objectives | potential-assessments | references | control-enhancements">
    <group>
      <!--<xsl:apply-templates select="." mode="group-label"/>-->
      <xsl:apply-templates/>
    </group>
  </xsl:template>
  
  <xsl:template match="description | supplemental-guidance | objective | decision">
    <nb flag="{name()}">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </nb>
  </xsl:template>
  
  <xsl:template match="potential-assessment">
    <nb flag="{name()}">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <group>
      <xsl:apply-templates/>
      </group>
    </nb>
  </xsl:template>
  
  <xsl:template match="control-enhancement">
    <control>
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </control>
  </xsl:template>
  
  <xsl:template match="@*" mode="asElement">
    <prp name="{name()}"><xsl:value-of select="."/></prp>
  </xsl:template>
  
  <xsl:template match="object">
    <prp name="object">
      <xsl:apply-templates/>
    </prp>
  </xsl:template>
  
  <xsl:template match="priority | baseline-impact">
    <prp name="{name()}">
      <xsl:apply-templates/>
    </prp>  
  </xsl:template>

  <xsl:template match="reference">
    <std><!-- NISO STS -->
      <xsl:apply-templates select="@href"/>
      <!--<xsl:comment> or STS &lt;std> ... </xsl:comment>-->
      <xsl:apply-templates/>
    </std>
  </xsl:template>
  
  <xsl:template match="@href">
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="html:div">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="html:div[exists(child::text()[matches(.,'\S')])]">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  
  <xsl:template match="html:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="html:ol">
    <list list-type="ordered">
      <xsl:apply-templates/>
    </list>
  </xsl:template>
  
  
  <xsl:template match="html:li">
    <list-item>
      <p>
        <!--<xsl:copy-of select="@class"/>-->
        <xsl:apply-templates select="node() except html:ol"/>
      </p>
      <!-- safe since in the input, nested html lists are always at the ends of their items. -->
      <xsl:apply-templates select="html:ol"/>
    </list-item>
  </xsl:template>

  <!-- Sorry ... -->
  <xsl:template match="html:em">
    <italic>
      <xsl:apply-templates/>
    </italic>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:message>
      <xsl:value-of select="name()"/>
      <xsl:text> NOT MATCHED </xsl:text>
    </xsl:message>
    <xsl:next-match/>
  </xsl:template>
  
</xsl:stylesheet>