<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:oscal="http://scap.nist.gov/schema/oscal"
  
  exclude-result-prefixes="xs"
  version="2.0">

<!-- Translates an OSCAL document by converting
  
- statements (stmt) become (named) elements
- properties (prop) become attributes on their parent.

Constraints on inputs:

- @name values always satisfy matches(@name,'\i\c*') i.e. XML NAME production
- No prop/@name is duplicated within the prop element's parent (only one is captured)
  
The results of this XSLT (on arbitrary OSCAL) can be validated against
a stricter (profile-specific) schema than generic OSCAL.
  
Note that this transformation is reversible with prior knowledge of which
elements become properties (prop) and which becomes statements.
(With such prior knowledge we can produce blank OSCAL but can we be
sure it conforms to the profile?)
  
  -->

  <xsl:output indent="yes"/>
  
  <xsl:strip-space elements="oscal:control"/>

  <xsl:template match="* | @*">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:apply-templates select="oscal:prop"/>
      <xsl:apply-templates select="node() except oscal:prop"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="oscal:prop">
    <xsl:attribute name="{@name}">
      <xsl:apply-templates/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="oscal:stmt | oscal:group/oscal:prop">
    <xsl:element name="{@name}" namespace="http://scap.nist.gov/schema/oscal">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
</xsl:stylesheet>