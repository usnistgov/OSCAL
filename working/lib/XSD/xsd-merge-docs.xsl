<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="xs"
  version="3.0">
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="p li"/>
  <xsl:output indent="yes"/>
  
  <!-- Delivers an XSD with documentation merged in. -->
  
<!-- Documentation looks like this:
  
  <control class="element-description">
      <prop class="tag">control</prop>
      <prop class="full_name">Control</prop>
      <stmt class="description">
        <p>A structured information object representing a security control.</p>
      </stmt>
      <stmt class="remarks"/>
    </control>
  
  -->
  
  <xsl:variable name="docs" select="document('oscal-oscal.xml')"/>
  
  <xsl:key name="documentation" match="control" use="prop[@class='tag']"/>

  <!-- Nix the comments -->
  <xsl:template match="comment()"/>
  
  <xsl:template match="xs:element[@name]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:variable name="element-description" select="key('documentation',@name,$docs)"/>
      <xsl:if test="empty($element-description)">
        <xsl:message expand-text="true">No description found for {@name}</xsl:message>
      </xsl:if>
      
      <xsl:apply-templates select="$element-description"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="control">
    <xs:annotation>
      <xs:documentation>
        <xsl:apply-templates/>
      </xs:documentation>
    </xs:annotation>
  </xsl:template>
  
  <xsl:template match="control/*" priority="0"/>
  
  <xsl:template match="prop[@class='full_name']">
    <b>
      <xsl:apply-templates/>
    </b>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="stmt[@class='description']">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <xsl:template match="p">
    <xsl:apply-templates/>
  </xsl:template>
  
</xsl:stylesheet>