<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="3.0"
  >
  
<!-- XSLT keeps any control or subcontrol that has value(s) of child::oscal:prop
     with @class value resolving to $selector and value resolving to $value
  
  So pass selector='baseline-impact' value='LOW' for baseline impact='LOW' in SP800-53.
  
  -->
  <xsl:include href="oscal-functions.xsl"/>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:param name="selector" required="yes" as="xs:string"/>
  <xsl:param name="value"    required="yes" as="xs:string"/>
  
  <xsl:template match="control | subcontrol">
    <xsl:if test="prop[oscal:classes(.)=$selector][normalize-space(.)=$value]">
      <xsl:next-match/>
    </xsl:if>
  </xsl:template>
  
</xsl:stylesheet>