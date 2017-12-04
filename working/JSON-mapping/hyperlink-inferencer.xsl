<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all">
  
  <!-- XSLT borrowed from XSweet https://gitlab.coko.foundation/XSweet/XSweet/blob/master/applications/local-fixup/hyperlink-inferencer.xsl
       Thanks!
       
      -->
  <xsl:output method="xml" indent="no" omit-xml-declaration="yes"/>
  
  <xsl:template match="* | @* | processing-instruction() | comment()">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- Deprecating these ... since @style info is factored out ...
    
    <xsl:template match="span[@style='font-family: Helvetica'][empty(@class)]">
    <xsl:apply-templates/>
  </xsl:template>
  
  
  <xsl:template match="@style[.='font-family: Helvetica']"/> -->
  
  
  <xsl:variable name="tlds"         as="xs:string" expand-text="true">(com|org|net|gov|mil|edu|io|foundation)</xsl:variable>
  <xsl:variable name="urlchar"      as="xs:string" expand-text="true">[\w\-_\.]</xsl:variable>
  <xsl:variable name="extraURLchar" as="xs:string">[\w\-\$:;/:@&amp;=+,_]</xsl:variable>
  
  <xsl:variable name="domain"    as="xs:string" expand-text="true">({$urlchar}+\.)</xsl:variable>

  <xsl:variable name="tail"      as="xs:string" expand-text="true">(/|(\.(xml|html|htm|gif|jpg|jpeg|pdf|png|svg)))?</xsl:variable>
  <xsl:variable name="pathstep"  as="xs:string" expand-text="true">(/{$urlchar}+)</xsl:variable>
  
  <xsl:variable name="url-match" as="xs:string" expand-text="true">((http|ftp|https):/?/?)?{$domain}+{$tlds}{$pathstep}*{$tail}(\?{$extraURLchar}+)?</xsl:variable>
  
  <xsl:template match="text()">
    
    <xsl:analyze-string select="." regex="{$url-match}">
      <!--(https?:)?(\w+\.)?(\w+)\.(\w\w\w)-->
      <xsl:matching-substring>
        <xsl:variable name="has-protocol" select="matches(.,'^https?://')"/>
        <a href="{'http://'[not($has-protocol)]}{regex-group(0)}">
          <xsl:value-of select="."/>
        </a>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <!--<xsl:template match="text()[matches(.,'^https?:')][string(.) castable as xs:anyURI][empty(ancestor::a)]">
    <a href="{encode-for-uri(.)}">
      <xsl:value-of select="."/>
    </a>
  </xsl:template>-->
    
</xsl:stylesheet>