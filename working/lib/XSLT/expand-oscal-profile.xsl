<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xpath-default-namespace="http://scap.nist.gov/schema/oscal"
  xmlns="http://scap.nist.gov/schema/oscal"
  xmlns:oscal="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="#all"
  version="3.0">
  
<!--
     
  Matching a profile: converts include/all to (series of) include/call
  loading with param settings.
    include/call is copied
    exclude/call resolved by ...?
  
  Matching a catalog: a 'stub' (identity)
  profile including all controls, subcontrols and parameters -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:output indent="yes"/>
  
  <xsl:template match="/processing-instruction()"/>
  
  <xsl:template match="/">
    <xsl:processing-instruction name="xml-model">href="../lib/oscal-profile-working.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:processing-instruction name="xml-model">href="../lib/Schematron/.sch"  type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="catalog">
    <profile>
      <invoke href="{replace(document-uri(/),'.*/','')}">
        <include>
          <xsl:apply-templates select="//control | //subcontrol | //param"/>
        </include>
      </invoke>
    </profile>
  </xsl:template>
  
  <xsl:template match="control">
    <call control-id="{@id}">
      <xsl:apply-templates select="title"/>
    </call>
  </xsl:template>
  
  <xsl:template match="subcontrol">
    <call subcontrol-id="{@id}">      <xsl:apply-templates select="title"/>
    </call>
  </xsl:template>
  
  <xsl:template match="param">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xsl:template match="title">
    <xsl:comment>
      <xsl:apply-templates mode="plain"/>
    </xsl:comment>
  </xsl:template>
  
  <xsl:template match="*" mode="plain">
    <xsl:apply-templates/>
  </xsl:template>
</xsl:stylesheet>