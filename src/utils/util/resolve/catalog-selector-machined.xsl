<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                default-mode="oscal:filter">
   <xsl:strip-space elements="catalog metadata group requirement control part param"/>
   <xsl:output indent="yes"/>
   <xsl:mode name="oscal:filter" on-no-match="shallow-copy"/>
   <xsl:mode name="oscal:propagate" on-no-match="shallow-copy"/>
   <xsl:mode name="oscal:copy-branch" on-no-match="deep-copy"/>
   <xsl:template match="profile" mode="oscal:filter">
      <xsl:apply-templates select="import" mode="#current"/>
   </xsl:template>
   <xsl:key name="resource-fetch" match="resource" use="'#' || @id"/>
   <xsl:template match="resource[rlink/@href castable as xs:anyURI]" mode="oscal:fetch">
      <xsl:apply-templates select="document(rlink/@href,/)" mode="oscal:filter"/>
   </xsl:template>
   <xsl:template match="import" mode="oscal:filter">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:if test="starts-with(@href,'#')">
            <xsl:apply-templates select="key('resource-fetch',@href)" mode="oscal:fetch"/>
         </xsl:if>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="catalog" mode="oscal:filter">
      <xsl:copy>
         <xsl:apply-templates mode="#current" select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="/*/@id" mode="oscal:filter">
      <xsl:attribute name="id" expand-text="true">PROFILE-RESULTS-{.}</xsl:attribute>
   </xsl:template>
   <xsl:template match="metadata" mode="oscal:filter"/>
   <xsl:template priority="2" match="group" mode="oscal:filter">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3" match="control" mode="oscal:filter">
      <xsl:apply-templates select="." mode="oscal:propagate"/>
   </xsl:template>
   <xsl:template match="control" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="group/*" mode="oscal:filter"/>
</xsl:stylesheet>
