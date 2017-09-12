<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="2.0">
  
  <xsl:function name="oscal:classes" as="xs:string*">
    <xsl:param name="who" as="element()"/>
    <xsl:for-each select="distinct-values(tokenize(normalize-space($who/lower-case(@class)),'&#32;') )">
      <xsl:sequence select="lower-case(.)"/>
    </xsl:for-each>
  </xsl:function>
  
  <xsl:function name="oscal:sequence">
    <xsl:param name="strings" as="xs:string*"/>
    <xsl:value-of select="string-join(for $s in $strings return (concat('''',$s,'''') ),', ')"/>
  </xsl:function>
  
      
</xsl:stylesheet>