<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all">
  
<!-- Produces an HTML report describing OSCAL inputs. -->

<!-- TO DO: 
  
  skip declarations
  sort properties and statements (and title and descriptions)
  list counts as (9/10)
  provide (some) styling e.g. boxes around controls
  -->

  <xsl:template match="/">
    <xsl:call-template name="page">
      <xsl:with-param name="contents">
        <xsl:call-template name="analysis"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="analysis">
    <!--<div>
      <h2>Elements by signature <code style="font-size: smaller">name(#type|@role)</code></h2>
      <ul>
      <xsl:for-each-group select="//*" group-by="oscal:signature(.)">
        <xsl:sort select="count(current-group())" order="descending"/>
          <li>
            <span class="e"><xsl:value-of select="current-grouping-key()"/></span>
            <span class="count"><xsl:value-of select="count(current-group())"/></span>
          </li>
      </xsl:for-each-group>
      </ul>
    </div>-->
    <div>
      <h2>Abstract tree hierarchy (by signature)</h2>
      <xsl:call-template name="element-hierarchy"/>
    </div>
    
  </xsl:template>
  
  <xsl:template name="element-hierarchy">
    <xsl:param name="n" select="/*"/>
    <xsl:if test="exists($n)">
      <ul>
        <xsl:for-each-group select="$n" group-by="oscal:signature(.)">
          <li>
            <span class="e">
              <xsl:value-of select="current-grouping-key()"/>
            </span>
            <span class="count">
              <xsl:value-of select="count(current-group())"/>
            </span>
            <xsl:call-template name="element-hierarchy">
              <xsl:with-param name="n" select="current-group()[not(self::stmt|self::desc)]/*"/>
            </xsl:call-template>
          </li>
        </xsl:for-each-group>
      </ul>
    </xsl:if>
  </xsl:template>
  
  <xsl:function name="oscal:signature" as="xs:string">
    <xsl:param name="n" as="element()"/>
    <xsl:value-of>
      <xsl:value-of select="name($n)"/>
      <xsl:for-each select="$n/@type">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="."/>
      </xsl:for-each>
      <xsl:for-each select="$n/@role">
        <xsl:text>@</xsl:text>
        <xsl:value-of select="."/>
      </xsl:for-each>
    </xsl:value-of>
  </xsl:function>
  
  <xsl:template name="page">
    <xsl:param name="contents">
      <xsl:apply-templates/>
    </xsl:param>
    <html>
      <head>
        <meta charset="UTF-8"><!-- comment me --></meta>
        <style type="text/css">
.e { color: darkgreen; font-weight: bold }
.count { color: darkred; font-style: italic; padding-left: 1em }
          
        </style>
      </head>
      <body>
        <xsl:copy-of select="$contents"/>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>