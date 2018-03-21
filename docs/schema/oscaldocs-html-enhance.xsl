<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="oscal"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml">
  
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="div[contains-token(@class,'description')]">
    <blockquote>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </blockquote>
  </xsl:template>
        
  <!--<xsl:template match="div[contains-token(@class,'schema-docs')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
        <h5>Content declaration (reduced)</h5>
        <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>-->
        
</xsl:stylesheet>