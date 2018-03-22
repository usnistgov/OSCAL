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
  
  <xsl:template match="div[contains-token(@class,'schema-docs')][.//li/tokenize(.,'\s+') = 'ref:oscal:asProp']">
    <!--<div class="part schema-docs">
      <h5>Content declaration (reduced)</h5>
      <ul class="ul">
        <li class="li">fallback</li>
        <li class="li">xs:attributeGroup ref:oscal:asProp</li>
        <li class="li">text content</li>
      </ul>
    </div>-->
    <div class="part schema-docs">
      <h5>Content declaration (reduced)</h5>
      <ul class="ul">
        <li class="li">text content <em>only</em> (and potentially further constrained)</li>
      </ul>
    </div>
  </xsl:template>
  
  <xsl:template match="li[starts-with(.,'as needed:')][starts-with(../parent::li,'text content, possibly mixed with')]">
    <xsl:apply-templates select="ul/li"/>
  </xsl:template>
  
  <!--<li class="li">text content, possibly mixed with
    <ul class="ul">
      <li class="li">as needed:
        <ul class="ul">
          <li class="li">element <a href="#d81e2085" class="code">q</a></li>
          <li class="li">element <a href="#d81e2147" class="code">code</a></li>
          <li class="li">element <a href="#d81e1732" class="code">em</a></li>
          <li class="li">element <a href="#d81e1816" class="code">i</a></li>
          <li class="li">element <a href="#d81e1893" class="code">b</a></li>
          <li class="li">element <a href="#d81e2242" class="code">sub</a></li>
          <li class="li">element <a href="#d81e2220" class="code">sup</a></li>
          <li class="li">element <a href="#d81e2264" class="code">span</a></li>
        </ul>
      </li>
    </ul>
  </li>-->
  
  
  
  <!--<xsl:template match="div[contains-token(@class,'schema-docs')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
        <h5>Content declaration (reduced)</h5>
        <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>-->
        
</xsl:stylesheet>