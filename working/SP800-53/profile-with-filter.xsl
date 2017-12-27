<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:uuid="java:java.util.UUID"

    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math uuid"
    version="3.0">

    <!-- Pulls a profile from a catalog, representing controls
         and subcontrols that contain a property matching runtime parameters:
       $property is the property name (@class)
       $value is the property value.
    -->
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="property" as="xs:string">baseline-impact</xsl:param>
    <xsl:param name="value"    as="xs:string">LOW</xsl:param>
    
    <xsl:template match="/">
        <xsl:comment expand-text="true"> Produced by profile-with-filter.xsl applied to
        {document-uri(/)} { current-date() }
        runtime parameter settings: $property='{ $property }' $value='{ $value }'</xsl:comment>
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:template match="catalog">
                <profile id="uuid-{uuid:randomUUID()}">
            <title xsl:expand-text="true">SP800-53 { $value } BASELINE IMPACT</title>
            <import href="{replace(document-uri(/),'.*/','')}">
                <include>
                    <xsl:apply-templates select="//control | //subcontrol" mode="write-call"/>
                </include>
            </import>
            <xsl:for-each-group select="//control/param | //subcontrol/param" group-by="true()">
                <modify>
                    <xsl:apply-templates select="current-group()" mode="param"/>
                </modify>
            </xsl:for-each-group>
        </profile>
    </xsl:template>
    
    <!--<xsl:variable name="catalog" select="document('../SP800-53/SP800-53-OSCAL-refined.xml')"/>-->
    
    <xsl:key name="sp800-53-control-object-by-name" match="group|control|subcontrol" use="prop[@class='name']"/>
    
    <xsl:template match="control | subcontrol" mode="write-call"/>
    
    <xsl:template match="control[prop[@class=$property]=$value]" mode="write-call">
        <call control-id="{@id}"/>
    </xsl:template>
    
    <xsl:template match="subcontrol[prop[@class=$property]=$value]" mode="write-call">
        <call subcontrol-id="{@id}"/>
    </xsl:template>

    <xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>
    
    <xsl:template match="param" mode="param"/>
    
    <xsl:template match="control[prop[@class=$property]=$value]/param |
                         subcontrol[prop[@class=$property]=$value]/param" mode="param">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
        <set-param param-id="{@id}">
            <xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>
            <xsl:copy-of select="desc, value"/>
        </set-param>
    </xsl:template>
    
    
</xsl:stylesheet>