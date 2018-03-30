<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="oscal"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml">
  
  
  <xsl:key name="element-by-id" match="*[@id]" use="@id"/>
  
  <xsl:mode  on-no-match="shallow-copy"/>
  
  <xsl:key name="desc-by-tag" match="div[contains-token(@class,'element-description')]"
    use="h3/code[contains-token(@class,'tag')]"/>
  
  <xsl:key name="desc-by-tag" match="div[contains-token(@class,'attribute-description')]"
    use="h3/code[contains-token(@class,'tag')]/('@' || .)"/>
  
  <!--<div class="control attribute-description" id="d81e859">
    <h4 class="attribute-description">
      <span class="run-in subst tag">param-id</span> -->
  
  <!-- these are cross-references to elements -->
  <xsl:template match="code[exists(key('desc-by-tag',.))]">
    <xsl:variable name="target" select="key('desc-by-tag',.)"/>
    <a href="#{$target[1]/@id}" class="code">
      <xsl:if test="contains-token($target/@class,'element-description')">&lt;</xsl:if>
      <xsl:apply-templates/>
      <xsl:if test="contains-token($target/@class,'element-description')">&gt;</xsl:if>
    </a>
  </xsl:template>
  
  
</xsl:stylesheet>