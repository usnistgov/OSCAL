<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="3.0">
  
<!-- Translates a simple HTML (for OSCAL docs) into Github Markdown -->
  
  <xsl:mode name="md" default-mode="md" on-no-match="shallow-skip"/>
  
  <xsl:template match="/" mode="md">
    <!-- Ensures XML output for XProc. Strip this element (or simply serialize using @method='text') to get your Markdown! -->
    <md>
      <xsl:apply-templates mode="#current"/>
    </md>
  </xsl:template>

  <xsl:variable name="lf1" xml:space="preserve"><xsl:text>&#xA;</xsl:text></xsl:variable>
  <xsl:variable name="lf2" xml:space="preserve"><xsl:text>&#xA;&#xA;</xsl:text></xsl:variable>

  <xsl:template mode="md" match="head"/>
  
  <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6" mode="md">
    <xsl:value-of select="$lf2"/>
    <xsl:for-each select="1 to (replace(local-name(),'^h','') cast as xs:integer)">#</xsl:for-each>
    <xsl:text xml:space="preserve"> </xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="p[@class='toc-line']" mode="md">
    <xsl:value-of select="$lf1"/>
    <xsl:text>> </xsl:text>
    <xsl:for-each select="ancestor::div[@class='toc']" xml:space="preserve">  </xsl:for-each>
    <xsl:text>* </xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="blockquote" mode="md">
    <xsl:value-of select="$lf1"/>
    <xsl:if test="empty(*)">> </xsl:if>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="blockquote/p" mode="md">
    <xsl:value-of select="$lf1"/>
    <xsl:text>> </xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="p" mode="md">
    <xsl:value-of select="$lf2"/>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]" mode="md">
    <!-- double escaped! -->
    <xsl:text>&amp;lt;</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <!-- Heh -->
    <xsl:text>></xsl:text>
  </xsl:template>
  
  <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]" mode="md">
    <xsl:text>@</xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="code | span[contains(@class,'code')]" mode="md">
    <xsl:text>`</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>`</xsl:text>
  </xsl:template>
  
  <xsl:template match="em | i" mode="md">
    <xsl:text>*</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>*</xsl:text>
  </xsl:template>
  
  <xsl:template match="strong | b" mode="md">
    <xsl:text>**</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>**</xsl:text>
  </xsl:template>
  
  <xsl:template match="q" mode="md">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  
  <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/>
  
  
  <xsl:template match="a[starts-with(@href,'#')]" mode="md">
    <xsl:variable name="link-target" select="key('element-by-id',substring-after(@href,'#'))"/>
    <xsl:text>[</xsl:text>
    <xsl:value-of select="replace(.,'&lt;','&amp;lt;')"/>
    <xsl:text>]</xsl:text>
    <xsl:text>(#</xsl:text>
    <xsl:value-of select="$link-target/*[1] => normalize-space() => lower-case() => replace('\s+','-') => replace('[^a-z\-\d]','')"/>
    <xsl:text>)</xsl:text>
  </xsl:template>
  
  <xsl:template match="pre" mode="md">
    <xsl:text xml:space="preserve">&#xA;&#xA;```</xsl:text>
    <xsl:value-of select="@class[.=('xml','json')]"/>
    <xsl:text xml:space="preserve">&#xA;</xsl:text>
    <xsl:value-of select="replace(.,'(^\n+|\n+$)','')"/>
    <xsl:text xml:space="preserve">&#xA;```&#xA;</xsl:text>
  </xsl:template>
  
  <xsl:template match="pre//text()" mode="md">
    <xsl:value-of select="."/>
  </xsl:template>
  
  <xsl:template match="text()" mode="md">
    <xsl:value-of select="replace(.,'\s+',' ')"/>
  </xsl:template>
  
  <xsl:template match="ul" mode="md">
    <xsl:text xml:space="preserve">&#xA;</xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="ul//ul" mode="md">
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="li" mode="md">
    <xsl:text xml:space="preserve">&#xA;</xsl:text>
    <xsl:for-each select="../ancestor::ul"><xsl:text xml:space="preserve">&#32;&#32;</xsl:text></xsl:for-each>
    <xsl:text>* </xsl:text>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
</xsl:stylesheet>