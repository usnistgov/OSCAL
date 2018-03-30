<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="3.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="oscal"
  xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml">
  
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="p[contains-token(@class,'xsd')]"/>
    
  <xsl:template match="h3[contains-token(@class,'element-description')]/span[contains-token(@class,'tag')]">
    <code class="tag">&lt;<xsl:apply-templates/>&gt;</code> element | <xsl:text/>  
  </xsl:template>
  
  <xsl:template match="h3[contains-token(@class,'attribute-description')]/span[contains-token(@class,'tag')]">
    <code class="tag">@<xsl:apply-templates/></code> attribute | <xsl:text/>  
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
  
  <xsl:template match="div[contains-token(@class,'schema-docs')][.//li/tokenize(.,'\s+') = 'base:oscal:decls']">
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
        <li>As many as wanted of:<ul>
        <li class="li"><code>declare-prop</code></li>
        <li class="li"><code>declare-part</code></li>
        <li class="li"><code>declare-p</code></li>
        <li class="li"><code>declare-link</code></li>
      </ul></li></ul>
    </div>
  </xsl:template>
  
  <xsl:template match="li[starts-with(.,'as needed:')][starts-with(../parent::li,'text content, possibly mixed with')]">
    <xsl:apply-templates select="ul/li"/>
  </xsl:template>
  
  
  <!--<component class="element-description">
    <part class="schema-docs">
      <ul>
        <li>as needed:<ul>
      -->
  <xsl:template match="div[h4/span[contains-token(@class,'tag')]='p']/div[contains-token(@class,'schema-docs')]//li[starts-with(.,'as needed:')]">
    <li><code>@class</code> and <code>@id</code>, optionally, as usual</li>
    <xsl:next-match/>
  </xsl:template>
  
  <xsl:template match="div[h4/span[contains-token(@class,'tag')]='p']/div[contains-token(@class,'schema-docs')]//li[starts-with(.,'as needed:')]/text()[starts-with(.,'as needed:')]">
    <xsl:text>as needed, mixed with text:</xsl:text>
  </xsl:template>
  
  
  <!--<xsl:template match="div[contains-token(@class,'schema-docs')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
        <h5>Content declaration (reduced)</h5>
        <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>-->
        
</xsl:stylesheet>