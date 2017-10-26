<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="3.0">

  <!-- Finalize OSCAL format:
    Add initial PIs
    Tweak / fix up whitespace
  -->

  <!-- Keeping whitespace but removing it from value, where it is significant (and we don't want it added) -->
  <xsl:strip-space elements="value"/>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:output indent="no"/>

  <xsl:param name="xslt-process" as="xs:string">finalize</xsl:param>
  
  <xsl:template match="/">
    
    <!--<?xml-stylesheet type="text/css" href="../lib/CSS/oscal.css" title="Basic" alternate="yes"?>
    <?xml-model href="../lib/oscal-core.rnc" type="application/relax-ng-compact-syntax"?>
    <?xml-stylesheet type="text/css" href="../lib/CSS/oscal-ui.css" title="Wiring" alternate="yes"?>-->
    
    <xsl:processing-instruction name="xml-model">href="../lib/oscal-core.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="../lib/CSS/oscal.css"     title="Basic" alternate="yes"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="../lib/CSS/oscal-ui.css"  title="Wiring" alternate="yes"</xsl:processing-instruction>
    <xsl:text>&#xA;</xsl:text>
    <xsl:comment expand-text="true"> XML touched by transformation '{ $xslt-process }' :{ current-dateTime() } </xsl:comment>
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="/node()">
    <xsl:text>&#xA;</xsl:text>
    <xsl:next-match/>
  </xsl:template>
  
</xsl:stylesheet>
