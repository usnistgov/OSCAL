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
    
    
    
    <xsl:template match="/">
        <xsl:comment expand-text="true"> Produced by baseline-profile.xsl applied to
        {document-uri(/)} { current-date() }
        </xsl:comment>
        <xsl:apply-templates select="*"/>
    </xsl:template>
    
    <xsl:template match="catalog">
        <profile>
            <invoke href="{document-uri(/)}">
                <include>
                    <xsl:apply-templates select="//control | //subcontrol" mode="write-call"/>
                </include>
            </invoke>
        </profile>
    </xsl:template>
    
    <xsl:variable name="catalog" select="document('../SP800-53/SP800-53-OSCAL-refined.xml')"/>
    
    <xsl:key name="sp800-53-control-object-by-name" match="group|control|subcontrol" use="prop[@class='name']"/>
    
    <xsl:template match="control" mode="write-call">
            
        <xsl:text>&#xA;&#xA;</xsl:text>
        <call control-id="{@id}"/>
        <xsl:apply-templates select=".//param except ..//subcontrol//param" mode="params"/>
        
    </xsl:template>
    
    <xsl:template match="subcontrol" mode="write-call">
        
        <xsl:text>&#xA;&#xA;</xsl:text>
        <call subcontrol-id="{@id}"/>
        <xsl:apply-templates select=".//param" mode="params"/>
        
    </xsl:template>
    <xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
       <xsl:copy copy-namespaces="no">
           <xsl:copy-of select="@*"/>
           <!--<xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>-->
           <xsl:copy-of select="desc, value" copy-namespaces="no"/>
       </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>