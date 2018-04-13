<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="xs"
  version="2.0">
  
  <xsl:output indent="yes"/>
  
  <!-- Purpose: produce a blank (initial) OSCAL document from a schema, listing elements and attributes in that schema. -->
<!-- Note: you shouldn't need this XSLT unless you are starting to write schema documentation for a new schema, and wish to poll its element/attribute set. -->
  
  <xsl:template match="/">
    <worksheet>
      <xsl:apply-templates select="*/xs:element[@name][not(@abstract='true')]"/>
      <xsl:for-each-group select="//xs:attribute[exists(@name)]" group-by="@name">
        <component class="attribute-description">
          <prop class="tag"><xsl:value-of select="current-grouping-key()"/></prop>
          <prop class="full_name">
            <xsl:value-of select="@name"/> -- attribute</prop>
          <part class="description"/>
          <part class="remarks"/>
          
        </component>
        
      </xsl:for-each-group>
    </worksheet>
  </xsl:template>
  
  <xsl:template match="xs:element">
    <control class="element-description">
      <prop class="tag"><xsl:value-of select="@name"/></prop>
      <prop class="full_name">
        <xsl:value-of select="@name"/> -- element</prop>
      <part class="description"/>
      <part class="remarks"/>
    </control>
  </xsl:template>
</xsl:stylesheet>