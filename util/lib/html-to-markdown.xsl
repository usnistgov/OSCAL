<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="3.0">
  
<!-- Translates a simple HTML (for OSCAL docs) into Github Markdown -->
  
  <xsl:template match="/">
    <!-- Ensures XML output for XProc. Strip this element (or simply serialize using @method='text') to get your Markdown! -->
    <md>
      <xsl:apply-templates/>
    </md>
  </xsl:template>

  <xsl:variable name="lf1"><xsl:text>&#xA;</xsl:text></xsl:variable>
  <xsl:variable name="lf2"><xsl:text>&#xA;&#xA;</xsl:text></xsl:variable>


  <xsl:template match="head"/>
  
  <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6">
    <xsl:value-of select="$lf2"/>
    <xsl:for-each select="1 to (replace(local-name(),'^h','') cast as xs:integer)">#</xsl:for-each>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="p[@class='toc-line']">
    <xsl:value-of select="$lf1"/>
    <xsl:text>> </xsl:text>
    <xsl:for-each select="ancestor::div[@class='toc']" xml:space="preserve">  </xsl:for-each>
    <xsl:text>* </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="blockquote/p">
    <xsl:value-of select="$lf1"/>
    <xsl:text>> </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
    
  <xsl:template match="p">
    <xsl:value-of select="$lf2"/>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]">
    <!-- double escaped! -->
    <xsl:text>&amp;lt;</xsl:text>
    <xsl:apply-templates/>
    <!-- Heh -->
    <xsl:text>></xsl:text>
  </xsl:template>
  
  <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]">
    <xsl:text>@</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="code | span[contains(@class,'code')]">
    <xsl:text>`</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>`</xsl:text>
  </xsl:template>
  
  <xsl:template match="em">
    <xsl:text>*</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>*</xsl:text>
  </xsl:template>
  
  <xsl:template match="q">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  
  <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/>
  
  
  <xsl:template match="a[starts-with(@href,'#')]">
    <xsl:variable name="link-target" select="key('element-by-id',substring-after(@href,'#'))"/>
    <xsl:text>[</xsl:text>
    <xsl:value-of select="replace(.,'&lt;','&amp;lt;')"/>
    <xsl:text>]</xsl:text>
    <xsl:text>(#</xsl:text>
    <xsl:value-of select="$link-target/*[1] => normalize-space() => lower-case() => replace('\s+','-') => replace('[^a-z\-\d]','')"/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  
  <xsl:template match="pre">
    <xsl:text>&#xA;&#xA;```&#xA;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&#xA;```&#xA;&#xA;</xsl:text>
  </xsl:template>
  
  <xsl:template match="pre//text()">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="text()">
    <xsl:value-of select="replace(.,'\s+',' ')"/>
  </xsl:template>
  
  <xsl:template match="ul">
    <xsl:text>&#xA;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="ul//ul">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="li">
    <xsl:text>&#xA;</xsl:text>
    <xsl:for-each select="../ancestor::ul"><xsl:text>&#32;&#32;</xsl:text></xsl:for-each>
    <xsl:text>* </xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>