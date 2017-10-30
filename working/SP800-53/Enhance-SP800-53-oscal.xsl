<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="3.0">
  
<!-- For tweaking OSCAL documents eg SP800-53/A -->

<!-- 
    1. Provide @id to all controls, subcontrols and features with prop[@class='name']
    2. Infer and install 'assign' and 'withdrawn' elements where appropriate
       (string matching) nb 'assign' is a placeholder to be picked up by a next step;
       it is not valid in the target (where it will be 'insert', along with a parameter 
       declaration elsewhere)
  -->
  
  <xsl:mode on-no-match="shallow-copy"/>
   
  <xsl:template match="control | subcontrol | part" mode="id" as="xs:string">
    <xsl:for-each select="prop[@class='name']">
      <xsl:attribute name="id" select="translate(.,'()[]','..--') ! replace(.,'\C','.') ! lower-case(.)"/>
    </xsl:for-each>
    <xsl:if test="not(prop/@class='name')">OOPS</xsl:if>
  </xsl:template>
  
  <xsl:template match="control | subcontrol | part">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:if test="prop/@class = 'name'">
        <xsl:attribute name="id">
          <xsl:apply-templates select="." mode="id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:key name="control-by-name" match="control | subcontrol" use="prop[@class='name']"/>
  
  <xsl:template match="link">
    <xsl:copy>
      <xsl:for-each select="key('control-by-name',.)">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:apply-templates select="." mode="id"/>
      </xsl:attribute>
      </xsl:for-each>
     
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
      
  <xsl:template match="text()">
    <xsl:analyze-string select="." regex="\[(Assignment|Withdrawn)[^\]]*\]">
      <xsl:matching-substring>
        <xsl:choose>
          <xsl:when test="regex-group(1)='Withdrawn'">
            <withdrawn>
            <xsl:value-of select="replace(.,'Withdrawn:\s*','') => replace('[\[\]]','')"/>
          </withdrawn>
          </xsl:when>
          <xsl:otherwise>
        <assign>
          <xsl:value-of select="replace(.,'Assignment:\s*','') => replace('[\[\]]','')"/>
        </assign>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
</xsl:stylesheet>