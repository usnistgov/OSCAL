<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"

  xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  xmlns="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="xs"
  version="2.0">
  
<!-- Produces a set of declarations for properties and statements
     found in an OSCAL document. -->
  
  <xsl:output indent="yes"/>
  
  
  
  <xsl:template match="/*">
    <declarations>
    <xsl:for-each-group select="//control" group-by="@type">
      <control-spec type="{current-grouping-key()}">
        <xsl:variable name="who" select="current-group()"/>
        <required>
          <xsl:for-each-group select="$who/(prop,stmt[matches(@name,'\S')])" group-by="@name">
            <xsl:if test="count(current-group()) = count($who)">
              <xsl:call-template name="declaration"/><!--
                <xsl:with-param select="current-group()"/>
              </xsl:call-template>-->
            </xsl:if>
          </xsl:for-each-group>
        </required>
        <optional>
          <!-- again for the others -->
          <xsl:for-each-group select="$who/(prop,stmt[matches(@name,'\S')])" group-by="@name">
            <xsl:if test="not(count(current-group()) = count($who))">
              <xsl:call-template name="declaration"/><!--
                <xsl:with-param select="current-group()"/>
              </xsl:call-template>-->
            </xsl:if>
          </xsl:for-each-group>
        </optional>
      </control-spec>
    </xsl:for-each-group>
    </declarations>
  </xsl:template>
  
  <xsl:template name="declaration">
    <xsl:param name="who" select="current-group()"/>
    <xsl:element name="{if ($who/self::prop) then 'property' else 'statement'}">
      <xsl:copy-of select="$who[1]/@name"/>
      <xsl:for-each select="distinct-values($who/self::prop)">
        <value>
          <xsl:value-of select="."/>
        </value>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
  
  
</xsl:stylesheet>