<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  expand-text="true"
  version="3.0">
  
<!-- Enhances ISO 27002 OSCAL:
  * Adds @id to controls and subcontrols
  * Adds @href for internal cross-references to 'a' elements when the target is present
  
  Assumes all controls and subcontrols have a prop[@class='number'] (which is used for the ID)
  
  -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <!--<xsl:template match="/node()">
    <xsl:text>&#xA;</xsl:text>
    <xsl:next-match/>
  </xsl:template>-->
   
  <xsl:template match="group | control | subcontrol">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="id">
        <xsl:apply-templates select="." mode="id"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="group | control | subcontrol" mode="id">
    <xsl:value-of select="replace(name(.), '[^gsc]', '') || replace(prop[@class = 'number'], '\.', '-')"/>
  </xsl:template>
  
  <xsl:key name="by-number" match="group | control | subcontrol" use="prop[@class = 'number']"/>
    
  <xsl:template match="a">
    <a>
      <xsl:copy-of select="@*"/>
      <xsl:for-each select="key('by-number',normalize-space(.))">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:apply-templates select="." mode="id"/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
</xsl:stylesheet>