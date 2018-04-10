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
    
    <xsl:param name="module" as="xs:string" select="'taglib'"/>
    
    
    
    <xsl:variable name="known-schemas" select="document(//prop[contains-token(@class,'xsd')] )"/>
    
    <xsl:variable name="this-schema" select="$known-schemas[matches(document-uri(/),'filter')]"/>
    
    
    
    <xsl:template match="/*/title"/>
    
    <xsl:template priority="2" match="/*" expand-text="true">
        <!--<xsl:message>Module is { $module }</xsl:message>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="title"/>
            <xsl:copy-of select="//prop[contains-token(@class,'xsd')]"/>
            <xsl:apply-templates select="* except title"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/*" expand-text="true">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <title>XML Schema { $module }{ if (exists($this-schema)) then replace(document-uri($this-schema),'.*/','') else ' : Full Tag Library' }</title>
            <xsl:apply-templates select="group"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template priority="2" match="group[$module='taglib']" expand-text="true">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
<!-- Toss any group whose 'xsd' property doesn't match the given $module as a regexp   -->
    <xsl:template match="group[empty(prop[contains-token(@class,'xsd')][matches(.,$module)])]"/>
    
    <xsl:template match="section"/>
    
    <!--        <xsl:message>{ resolve-uri(prop[@class='xsd']) } : { $full-schema-path }</xsl:message>
        <xsl:next-match/>
    </xsl:template>
    <xsl:template match="group[not(resolve-uri(prop[@class='xsd']) = $schema-path)]"/>-->
    
</xsl:stylesheet>