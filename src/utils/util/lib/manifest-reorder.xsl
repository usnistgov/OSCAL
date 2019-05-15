<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs math"
  version="3.0">
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="body">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:variable name="divs" select="*"/>
      <xsl:variable name="families" select="'xsl','xpl'"/>
      <xsl:for-each select="$families">
        <xsl:variable name="family" select="."/>
        <xsl:apply-templates select="$divs[h3=$family]"/>
      </xsl:for-each>
      <xsl:apply-templates select="$divs[not(h3=$families)]"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="div[h3]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="div[exists(p[starts-with(.,'XSweet')][matches(.,'\[')])]">
        <xsl:sort select="p[starts-with(., 'XSweet')] ! replace(., '.*\[', '')"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="div[empty(p[starts-with(.,'XSweet')][matches(.,'\[')])]"/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>