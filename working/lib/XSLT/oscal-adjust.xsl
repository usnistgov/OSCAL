<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  version="3.0">
  
<!-- For tweaking OSCAL documents eg SP800-53A
     (Add ids, normalize values?) -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="control[prop/@name='number']">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:for-each select="prop[@name='number']">
        <xsl:attribute name="id" select="replace(.,'\C','') ! lower-case(.)"/>
      </xsl:for-each>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="control-enhancement">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="id">
        <xsl:for-each select="ancestor::control">
          <xsl:value-of select="replace(prop[@name = 'number'], '\C', '') ! lower-case(.)"/>
        </xsl:for-each>
        <xsl:number format="-a-i" count="control-enhancement" level="multiple"
          from="control"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="xref">
    <xsl:copy>
      <xsl:attribute name="href" select="'#' || replace(@href,'\C','') ! lower-case(.)"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
      
  <xsl:template match="assign | select">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:attribute name="role">
        <xsl:for-each select="ancestor::control[prop/@role='number'][1]/prop[@role = 'number']">
          <xsl:value-of select="replace(., '\C', '') ! lower-case(.)"/>
        </xsl:for-each>
        <xsl:number format="_a" count="assign | select" level="any" from="control[prop/@role='number']"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>