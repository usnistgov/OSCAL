<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math oscal"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
    
<!-- Purpose: filter OSCAL schema documentation by referenced schema  -->
<!-- Input: An OSCAL document documenting OSCAL (oscal-oscal.xml) -->
<!-- Parameter: a path to an XSD file (an OSCAL schema module) -->
<!-- Output: a copy of the input containing only sections pertaining to the indicated schema. -->
<!-- Assumptions: oscal-oscal.xml is not only "correct" (as a set of element/attribute descriptions) but also links back (to the same schema) -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="schema-path" as="xs:anyURI" required="yes"/>
    <xsl:param name="full-schema-path" as="xs:anyURI" select="resolve-uri($schema-path)"/>
    
    <xsl:template match="/*" expand-text="true">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <title>XML Schema { replace($schema-path,'.*/','') }</title>
            <xsl:apply-templates select="group"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/*/title"/>
    
    <xsl:template match="group[not(resolve-uri(prop[@class='xsd']) = $full-schema-path)]" expand-text="true"/>
<!--        <xsl:message>{ resolve-uri(prop[@class='xsd']) } : { $full-schema-path }</xsl:message>
        <xsl:next-match/>
    </xsl:template>-->
    <!--<xsl:template match="group[not(resolve-uri(prop[@class='xsd']) = $schema-path)]"/>-->
    
</xsl:stylesheet>