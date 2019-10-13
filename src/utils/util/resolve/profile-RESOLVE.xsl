<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0"
    
    xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
        
        <xsl:output indent="yes"/>
    
        <!-- Purpose: from OSCAL profile input, produce a representation of all controls called with insertions, alterations, modifications and settings applied. -->
        <!-- Primary input: an OSCAL profile -->
        <!-- Secondary inputs: control catalogs referenced from profile import statements. -->
        
        <!-- A higher-order transformation works by producing a template set and then applying them
            together as a filter over the imported catalogs -->
        
    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>
    <xsl:param name="write-xslt" as="xs:string">yes</xsl:param>
    <xsl:param name="tracing"    as="xs:boolean" select="$write-xslt='yes'"/>
    
    <xsl:variable name="filter-location" select="/*/@id || '-resolver.xsl'"/>
    
    <xsl:template match="profile">
        <xsl:param tunnel="yes" name="visited" select="()"/>
        
        <xsl:variable name="resolution-xslt">
            <xsl:apply-templates select="." mode="make-resolver"/>
        </xsl:variable>
        
        <xsl:variable name="resolution-result">
            <xsl:variable name="runtime" select="map {
                'xslt-version'                    : 3.0,
                'source-node'                     : (.),
                'default-mode'                    : xs:QName('oscal:filter'),
                'stylesheet-node'                 : $resolution-xslt,
                'stylesheet-params'               : map { xs:QName('visited'): $visited } }" />
            
            <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->
            
            <xsl:sequence select="transform($runtime)?output"/>
            
        </xsl:variable>  
        <xsl:sequence select="$resolution-result"/>
        <xsl:if test="$tracing">
            <xsl:result-document  href="{$filter-location}" indent="yes">
                <xsl:sequence select="$resolution-xslt"/>
            </xsl:result-document>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="profile" mode="make-resolver">
        <XSLT:stylesheet version="3.0"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
            default-mode="oscal:filter">
            
            <xsl:call-template name="profile-base"/>
            
            <xsl:call-template name="catalog-base"/>
            
            <xsl:apply-templates select="import" mode="make-selector"/>
        </XSLT:stylesheet>
    </xsl:template>
    
    <xsl:template match="import" mode="make-selector">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
<!-- Given by itself, an include statement has the effect of suppressing everything
     nb this is necessary b/c the default behavior is to include everything, which
     we have templates to support when no include statement appears at all
    only an exclude or just a bare import (which ends up including everything) -->
    <xsl:template match="import/include" mode="make-selector">
        <XSLT:template priority="10" match="control" mode="oscal:propagate"/>
        <!-- but by applying templates inside, we produce templates to copy
             whatever we are including after all -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="import/include/all" mode="make-selector">
        <XSLT:template priority="11" match="control" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:filter"/>
            </XSLT:copy>
        </XSLT:template>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="import/include/call" mode="make-selector">
        <xsl:variable name="control-matcher" expand-text="true">control[@id='{@control-id}']</xsl:variable>
        <xsl:variable name="include-subcontrols" select="@with-child-controls=('true','1')"/>
        <xsl:variable name="matcher" expand-text="true">{$control-matcher}{
            (' | '||$control-matcher||'/control')[$include-subcontrols] }</xsl:variable>
        
        <XSLT:template priority="11" match="{$matcher}" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:filter"/>
            </XSLT:copy>
        </XSLT:template>
    </xsl:template>
    
    
    
    <xsl:template name="catalog-base">
        <XSLT:template match="catalog" mode="oscal:filter">
            <XSLT:copy>
                <XSLT:apply-templates mode="#current" select="@*"/>
                <XSLT:apply-templates mode="#current"/>
            </XSLT:copy>
        </XSLT:template>

        <XSLT:template match="/*/@id" mode="oscal:filter">
            <XSLT:attribute name="id" expand-text="true">PROFILE-RESULTS-{.}</XSLT:attribute>
        </XSLT:template>

        <XSLT:template match="metadata" mode="oscal:filter"/>

        <XSLT:template priority="2" match="group" mode="oscal:filter">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>

        <XSLT:template priority="3" match="control" mode="oscal:filter">
            <XSLT:apply-templates select="." mode="oscal:propagate"/>
        </XSLT:template>

        <XSLT:template match="control" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:filter"/>
            </XSLT:copy>
        </XSLT:template>

        <XSLT:template match="group/*" mode="oscal:filter"/>
    </xsl:template>
    
    <xsl:template name="profile-base">
        <XSLT:strip-space elements="catalog metadata group requirement control part param"/>

        <XSLT:output indent="yes"/>

        <XSLT:mode name="oscal:filter" on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:propagate" on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:copy-branch" on-no-match="deep-copy"/>

        <XSLT:template match="profile" mode="oscal:filter">
            <XSLT:apply-templates select="import" mode="#current"/>
        </XSLT:template>

        <XSLT:key name="resource-fetch" match="resource" use="'#' || @id"/>

        <XSLT:template match="resource[rlink/@href castable as xs:anyURI]" mode="oscal:fetch">
            <XSLT:apply-templates select="document(rlink/@href,/)" mode="oscal:filter"/>
        </XSLT:template>
        
        <XSLT:template match="import" mode="oscal:filter">
            <XSLT:copy>
                <XSLT:copy-of select="@*"/>
                <XSLT:if test="starts-with(@href,'#')">
                    <XSLT:apply-templates select="key('resource-fetch',@href)" mode="oscal:fetch"/>
                </XSLT:if>
            </XSLT:copy>
        </XSLT:template>
    </xsl:template>
    
</xsl:stylesheet>