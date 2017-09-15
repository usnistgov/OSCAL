<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all"
  version="3.0">
  
  <xsl:param name="with-subcontrols" as="xs:string">no</xsl:param>
  <xsl:param name="with-params"      as="xs:string">no</xsl:param>
  
  
<!--
     
  Matching a profile: converts include/all to (series of) include/call
  loading with param settings.
    include/call is copied
    exclude/call resolved by ... (test this)
  
  Matching a catalog: a 'stub' (identity)
  profile including all controls, subcontrols and parameters -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:output indent="yes"/>
  
  <xsl:variable name="include-subcontrols" select="not($with-subcontrols = ('no','false','0','none'))"/>
  <xsl:variable name="include-params"      select="not($with-params      = ('no','false','0','none'))"/>
  
  <xsl:template match="/processing-instruction()"/>
  
  <xsl:template match="/">
    <xsl:processing-instruction name="xml-model">href="../lib/oscal-profile-working.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:processing-instruction name="xml-model">href="../lib/Schematron/.sch"  type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:variable name="source" select="/"/>

  <!-- excludes are resolved into includes -->
  <xsl:template match="profile/invoke/exclude"/>
    
  <xsl:template match="profile/invoke/include">
    <xsl:variable name="catalog" select="document(../@href,$source)"/>
    
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="$catalog//control" mode="include-if-invoked">
        <xsl:with-param name="invocation" tunnel="yes" select="parent::invoke"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="catalog">
    <profile>
      <invoke href="{replace(document-uri(/),'.*/','')}">
        <include>
          <xsl:apply-templates select="//control" mode="include"/>
        </include>
        <!-- move params to 'set' grouping element? -->
      </invoke>
    </profile>
  </xsl:template>
  
  <xsl:template match="control | subcontrol" mode="include-if-invoked">
    <xsl:param name="invocation" tunnel="yes" required="yes"/>
    
    <xsl:variable name="called"
      select="exists($invocation/include/all) or @id =
      ( self::control/$invocation/include/call/@control-id | self::subcontrol/$invocation/include/call/@subcontrol-id |
        self::subcontrol/parent::control/$invocation/include/call/@control-id[$include-subcontrols])"/>
<!-- exclusion logic   -->
    <xsl:variable name="excluded" select="@id =
      ( self::control/$invocation/exclude/call/@control-id | self::subcontrol/$invocation/exclude/call/@subcontrol-id )"/>
    <xsl:if test="$called and not($excluded)">
      <xsl:apply-templates mode="include" select="."/>
      <xsl:apply-templates mode="include"            select="descendant::param[$include-params] except subcontrol//param"/>
      <xsl:apply-templates mode="include-if-invoked" select="subcontrol[$include-subcontrols]"/>
    </xsl:if>
      

  </xsl:template>
  
  
  <xsl:template match="control" mode="include">
    <call control-id="{@id}">
      <xsl:apply-templates select="title"/>
    </call>
  </xsl:template>
  
  <xsl:template match="subcontrol" mode="include">
    <call subcontrol-id="{@id}">
      <xsl:apply-templates select="title"/>
    </call>
  </xsl:template>
  
  <xsl:template match="param" mode="include">
    <xsl:copy>
    <xsl:copy-of select="@*, value"/>
    </xsl:copy>
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