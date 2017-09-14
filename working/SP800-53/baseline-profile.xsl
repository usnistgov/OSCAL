<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="property" as="xs:string">baseline-impact</xsl:param>
    <xsl:param name="value" as="xs:string">HIGH</xsl:param>
    
    <xsl:template match="/">
        <xsl:comment expand-text="true"> Produced by baseline-profile.xsl applied to
        {document-uri(/)} { current-date() }
        runtime parameter settings: $property='{ $property }' $value='{ $value }'</xsl:comment>
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <xsl:template match="catalog">
        <profile>
            <invoke href="{document-uri(/)}">
              <xsl:apply-templates select="//control" mode="write-call"/>
            </invoke>
        </profile>
    </xsl:template>
    
    <xsl:variable name="catalog" select="document('../SP800-53/SP800-53-OSCAL-refined.xml')"/>
    
    <xsl:key name="sp800-53-control-object-by-name" match="group|control|subcontrol" use="prop[@class='name']"/>
    
    <xsl:template match="control | subcontrol" mode="write-call"/>
    
    <xsl:template match="control[prop[@class=$property]=$value]" mode="write-call">
            
        <xsl:text>&#xA;&#xA;</xsl:text>
        <call control-id="{@id}"/>
        <xsl:apply-templates select=".//param except ..//subcontrol//param" mode="params"/>
        <xsl:apply-templates select="subcontrol" mode="write-call"/>
        
    </xsl:template>
    
    <xsl:template match="subcontrol[prop[@class=$property]=$value]" mode="write-call">
        
        <xsl:text>&#xA;&#xA;</xsl:text>
        <call subcontrol-id="{@id}"/>
        <xsl:apply-templates select=".//param" mode="params"/>
        
    </xsl:template>
    <xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
       <xsl:copy>
           <xsl:copy-of select="@*"/>
           <xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>
           <xsl:copy-of select="value"/>
       </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>