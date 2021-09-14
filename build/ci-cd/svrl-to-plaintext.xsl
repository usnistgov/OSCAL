<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xhtml="http://www.w3.org/1999/xhtml"
  xmlns:schold="http://www.ascc.net/xml/schematron"
  xmlns:saxon="http://saxon.sf.net/"
  xmlns:s="http://lmnl-markup.org/ns/luminescent/tags"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns:iso="http://purl.oclc.org/dsdl/schematron"
  xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
  exclude-result-prefixes="xs xhtml schold saxon s xsd iso svrl" version="1.0">

  <xsl:output method="text" indent="no"/>
  <!-- when embedded in XProc, serialize as plain text to
       avoid XML markup in the results -->

  <xsl:variable name="incidents"
    select="//svrl:failed-assert | //svrl:successful-report"/>

  <xsl:template match="/">
    <report>
      <xsl:if test="not($incidents)">You are well formed</xsl:if>
      <xsl:apply-templates select="$incidents"/>
    </report>
  </xsl:template>

  <xsl:template match="svrl:failed-assert | svrl:successful-report">
    <incident>
      <xsl:text>&#xA;</xsl:text>
      <xsl:variable name="code">
        <xsl:value-of select="@role"/>
        <xsl:if test="@role and @id">:</xsl:if>
        <xsl:value-of select="@id"/>
      </xsl:variable>
      <xsl:if test="normalize-space($code)">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="$code"/>
        <xsl:text>] </xsl:text>
      </xsl:if>
      <xsl:value-of select="normalize-space(.)"/>
    </incident>
  </xsl:template>

</xsl:stylesheet>
