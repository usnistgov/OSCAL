<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="xs"
  version="2.0">
  
  <xsl:output indent="yes"/>
  <!-- Produced a set of blank controls for describing elements
       (and eventually attributes) for an XSD -->
  
  <xsl:template match="/">
    <collection>
      <xsl:apply-templates select="*/xs:element[@name]"/>
    </collection>
  </xsl:template>
  
  <xsl:template match="xs:element">
    <control class="element-description">
      <prop class="tag">&lt;<xsl:value-of select="@name"/></prop>
      <prop class="full_name">
        <xsl:value-of select="@name"/> -- element</prop>
      <stmt class="description"/>
      <stmt class="remarks"/>
    </control>
  </xsl:template>
</xsl:stylesheet>