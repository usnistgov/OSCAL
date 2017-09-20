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
    
    <xsl:comment expand-text="true"> HTML produced by '{ $xslt-process }' :{ format-date(current-date(),' [Y] [MNn] [D]') => replace('([^\d\s]{3})[^\d\s]*','$1') } { format-time(current-time(),'[h]:[m] [P]') } </xsl:comment>
    
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="/node()">
    <xsl:text>&#xA;</xsl:text>
    <xsl:next-match/>
  </xsl:template>
  
</xsl:stylesheet>
