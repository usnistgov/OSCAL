<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="xs"
  version="3.0">

<!-- Translates an OSCAL document by converting
  
- anything with a @class is renamed after that class
- its old name becomes @data-oscal-type

Constraints on inputs:

- @class values are singles and always satisfy matches(@name,'\i\c*') i.e. XML NAME production
  
The results of this XSLT (on arbitrary OSCAL) can be validated against
a stricter (profile-specific) schema than generic OSCAL.
  
Note that this transformation is reversible with prior knowledge of which
elements become properties (prop) and which becomes statements.
(With such prior knowledge we can produce blank OSCAL but can we be
sure it conforms to the profile?)
  
  -->

  <xsl:output indent="yes"/>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="processing-instruction() | comment()"/>
  
  <xsl:template match="/">
    <xsl:comment> OSCAL LITERALIZATION happened here </xsl:comment>
    <xsl:text>&#xA;</xsl:text>
    <xsl:next-match/>  
  </xsl:template>
  
 
  <xsl:template match="p[matches(@class,'\S')] | prop[matches(@class,'\S')] | part[matches(@class,'\S')]">
    <xsl:element name="{@class}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:copy-of select="@* except @class"/>
      <!--<xsl:attribute name="class" select="local-name()"/>-->
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>