<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes"/>
<!-- To do:
    Work against a profile not only a catalog (invoking resolution XSLT)
    Produce an annotated copy of the framework, not a profile
    -->
    <xsl:template match="framework">
        <xsl:processing-instruction name="xml-model">href="../lib/Schematron/oscal-profile.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">href="../lib/oscal-profile-working.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
        
        <profile>
            <invoke href="{document-uri($catalog)}">
                <include>
                  <xsl:apply-templates select="//component" mode="write-call"/>
                </include>
            </invoke>
        </profile>
    </xsl:template>
    
    <xsl:variable name="catalog" select="document('../SP800-53/SP800-53-OSCAL-refined.xml')"/>
    
    <xsl:key name="sp800-53-control-object-by-name" match="group|control|subcontrol" use="prop[@class='name']"/>
    
    <xsl:template match="component" mode="write-call">
        <xsl:variable name="controlObj"
            select="key('sp800-53-control-object-by-name', link[@rel = ('control', 'subcontrol','component')], $catalog)"/>

        <xsl:text>&#xA;&#xA;</xsl:text>
        <call>
            <xsl:apply-templates select="$controlObj" mode="link"/>
           
            <!--<xsl:copy-of select="* except component"/>-->
        </call>
        <xsl:for-each select="p[@class = 'param_assigns'] | p[@class='remarks']">
          <xsl:comment><xsl:value-of select="."/></xsl:comment>
        </xsl:for-each>
        <xsl:apply-templates select="param"
            mode="params"/>
    </xsl:template>
    
    <xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
       <xsl:copy>
           <xsl:copy-of select="@*"/>
           <!--<xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>-->
           <xsl:copy-of select="value"/>
       </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>