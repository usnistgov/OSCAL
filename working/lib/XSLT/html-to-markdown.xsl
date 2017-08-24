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
  
  <xsl:template match="p">
    <xsl:value-of select="$lf2"/>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="span[contains(@class,'tag')]">
    <!-- double escaped! -->
    <xsl:text>&amp;lt;</xsl:text>
    <xsl:apply-templates/>
    <!-- Heh -->
    <xsl:text>></xsl:text>
  </xsl:template>
  
  <xsl:template match="span[contains(@class,'code')]">
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
  
  <xsl:key name="control-by-id" match="div[starts-with(@class,'control')]" use="@id"/>
  
  <!-- How quaint -->
  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  
  <xsl:template match="a[starts-with(@href,'#tag')]">
    <xsl:variable name="link-target" select="key('control-by-id',substring-after(@href,'#'))"/>
    <xsl:variable name="text">
      <xsl:value-of select="$link-target/h3/span[contains(@class,'tag')]"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="translate($link-target/h3/span[contains(@class,'full_name')],$upper,$lower)"/>
    </xsl:variable>
    <xsl:text>[&amp;lt;</xsl:text>
    <xsl:value-of select="$link-target/h3/span[contains(@class,'tag')]"/>
    <xsl:text>>]</xsl:text>
    <xsl:text>(#</xsl:text>
    
    <xsl:value-of select="translate($text,' ','-')"/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  
    <xsl:template match="pre//text()">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="text()">
    <xsl:value-of select="replace(.,'\s+',' ')"/>
  </xsl:template>
  
</xsl:stylesheet>