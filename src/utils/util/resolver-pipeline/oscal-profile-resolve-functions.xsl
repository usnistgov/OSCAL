<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math o"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <!-- XSD regex metacharacters except '*' and '?' https://www.w3.org/TR/xmlschema11-2/#regex-char-metachar -->
    <xsl:variable name="metachars" select="('.', '\', '+', '{', '}', '(', ')', '|', '[', ']')"/>
    <xsl:variable name="metachar-match" select="'(' || string-join( ($metachars ! ('\' || .)),'|') || ')'"/>

    <xsl:function name="o:glob-as-regex">
        <xsl:param name="glob" as="xs:string"/>
        <xsl:variable name="escaped" select="replace($glob,$metachar-match,'\\$1')"/>
        <!-- replace ? with . and * with .* -->
        <xsl:sequence select="'^' || ($escaped => replace('\?','.') => replace('\*','.*') ) || '$'"/>
        <!--<xsl:sequence select="$escaped"/>-->
    </xsl:function>

</xsl:stylesheet>
