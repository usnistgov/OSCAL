<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"

  xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  xmlns="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="xs"
  version="3.0">
  
<!-- Produces a set of declarations for properties and statements
     found in an OSCAL document. -->
  
  <xsl:output indent="yes"/>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="assign">
    <xsl:copy>
      <xsl:attribute name="id" select="(@id,generate-id(.))[1]"/>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="/*">
    <declarations>
    <xsl:for-each-group select="//control | //group" group-by="@type">
      <xsl:variable name="who" select="current-group()"/>
      <xsl:variable name="control-type" select="current-grouping-key()"/>
      <!--<xsl:for-each select="$who//(assign|select)">
          <parameter id="{(@id,generate-id(.))[1]}">
            <title>
              <xsl:value-of select="normalize-space(.)"/>
            </title>
            <xsl:apply-templates select="." mode="parameter"/>
          </parameter>
        </xsl:for-each>-->
        <!--<control-spec type="{$control-type}"
          match="{string-join(ancestor-or-self::control/name(.),'//')}">-->
        
      <xsl:for-each-group select="$who/(* except (control|title|group|description))" group-by="(@role[matches(.,'\S')],local-name(.))[1]">
            <xsl:variable name="always" select="count(current-group()) = count($who)"/>
            
        <xsl:element name="{if (self::prop) then 'property' else 'statement'}">
              <xsl:attribute name="role" select="current-grouping-key()"/>
              <xsl:attribute name="context" select="(../@type,name(..))[1]"/>
              <xsl:if test="$always"><required/></xsl:if>
              <!-- only for values -->
              <xsl:for-each select="distinct-values(current-group()/self::prop)">
                <value>
                  <xsl:value-of select="."/>
                </value>
              </xsl:for-each>
            </xsl:element>
          </xsl:for-each-group>
        <!--</control-spec>-->
        
        
    </xsl:for-each-group>
    </declarations>
  </xsl:template>
  
  <xsl:template match="assign" mode="parameter">
    <value>AT LEAST ONCE EVERY FULL MOON</value>
  </xsl:template>
  
  <xsl:template match="choice" mode="parameter">
    <xsl:copy>MOON</xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>