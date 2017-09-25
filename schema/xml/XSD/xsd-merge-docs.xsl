<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="xs"
  version="3.0">
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="p li"/>
  <xsl:output indent="yes"/>
  
  <!-- Delivers an XSD with documentation merged in.
  
  Run on an interim XSD (without the documentation) to produce a new XSD
  
  Pass in $docs-file to point to the documentation,
  or the documentation XML itself as $docs
  
  -->
  
<!-- Documentation looks like this (it's OSCAL):
  
  <control class="element-description">
      <prop class="tag">control</prop>
      <prop class="full_name">Control</prop>
      <part class="description">
        <p>A structured information object representing a security control.</p>
      </part>
      <part class="remarks"/>
    </control>
  
  -->
  
  <xsl:param name="docs-file" as="xs:string">../../../docs/schema/oscal-oscal.xml</xsl:param>
  
  <xsl:param name="docs"      select="document($docs-file,/)"/>
  
  <xsl:key name="documentation" match="component" use="prop[@class='tag']"/>

  <!-- Nix the comments -->
  <xsl:template match="comment()"/>
  
  <xsl:template match="xs:element[@name]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:variable name="element-description" select="key('documentation',@name,$docs)"/>
      <xsl:if test="empty($element-description)">
        <xsl:comment expand-text="true">No description found for {@name}</xsl:comment>
      </xsl:if>
      
      <xsl:apply-templates select="$element-description"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="component">
    <xs:annotation>
      <xs:documentation>
        <xsl:apply-templates/>
      </xs:documentation>
    </xs:annotation>
  </xsl:template>
  
  <xsl:template match="component/*" priority="0"/>
  
  <xsl:template match="prop[@class='full_name']">
    <b>
      <xsl:apply-templates/>
    </b>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="part[@class='description']">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <xsl:template match="p">
    <xsl:apply-templates/>
  </xsl:template>
  
</xsl:stylesheet>