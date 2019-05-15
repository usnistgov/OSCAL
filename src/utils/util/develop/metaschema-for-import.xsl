<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0">
    
    
<!-- Run this on an OSCAL metaschema to produce a list of definition references
     in an external module. -->
    
    <xsl:param as="xs:string" name="module">catalog</xsl:param>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="comment() | processing-instruction()"/>
    
    <xsl:template match="/*/*"/>
    
    <xsl:template match="*[@acquire-from]" priority="5"/>
    
    <xsl:template priority="2" match="define-assembly | define-field | define-flag">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="acquire-from" select="$module"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>