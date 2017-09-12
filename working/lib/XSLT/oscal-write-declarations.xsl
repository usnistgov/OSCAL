<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"

  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
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
  
  <xsl:template match="insert">
    <xsl:copy>
      <xsl:attribute name="id" select="(@id,generate-id(.))[1]"/>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="/*">
    <declarations>
    <xsl:for-each-group select="//control | //group | //subcontrol | //part" group-by="@class">
      <xsl:variable name="who" select="current-group()"/>
      <xsl:variable name="control-type" select="current-grouping-key()"/>
        
      <xsl:for-each-group select="$who/(* except (control|subcontrol|title|group|link|references))" group-by="(@class[matches(.,'\S')],local-name(.))[1]">
        <xsl:variable name="always" select="empty($who except current-group()/..)"/>
        <xsl:variable name="never-two" select="count(current-group()) eq count(current-group()/..)"/>
        
        <xsl:element name="{if (self::prop) then 'declare-prop' else
          if (self::link) then 'declare-link' else 'declare-part'}">
          <xsl:attribute name="context" select="(../@class,name(..))[1]"/>
          <xsl:attribute name="class" select="current-grouping-key()"/>
          <xsl:if test="$never-two"><singleton/></xsl:if>
          <xsl:if test="$always"><required/></xsl:if>
          <!-- only for values -->
          <xsl:for-each-group select="current-group()/self::prop" group-by="string(.)">
          <xsl:if test="count(current-group()) gt 1 or true()">
                <value>
                  <xsl:value-of select="current-grouping-key()"/>
                </value>
          </xsl:if>
          </xsl:for-each-group>
            </xsl:element>
          </xsl:for-each-group>
        <!--</control-spec>-->
        
        
    </xsl:for-each-group>
    </declarations>
  </xsl:template>
  
  <xsl:template match="insert" mode="parameter">
    <value>AT LEAST ONCE EVERY FULL MOON</value>
  </xsl:template>
  
  <xsl:template match="choice" mode="parameter">
    <xsl:copy>MOON</xsl:copy>
  </xsl:template>
  
</xsl:stylesheet>