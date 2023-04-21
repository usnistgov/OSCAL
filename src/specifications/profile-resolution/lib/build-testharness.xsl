<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
    exclude-result-prefixes="#all"
    version="3.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:text>&#xA;</xsl:text>
        
        <!--<xsl:processing-instruction name="xml-model">href="lib/xspec-test-dev.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="lib/xspec-oxygen.css"</xsl:processing-instruction>-->
        <!--<xsl:processing-instruction name="specification" expand-text="true">{ replace(document-uri(/),'.*/','') }</xsl:processing-instruction>-->
        <test-suite xmlns="http://csrc.nist.gov/ns/metaschema/test-suite/1.0"
            xsi:schemaLocation="http://csrc.nist.gov/ns/metaschema/test-suite/1.0 unit-tests.xsd">
            <xsl:apply-templates/>
        </test-suite>
        
    </xsl:template>

    <xsl:template match="/*/head"/>
    
    <xsl:template priority="22" match="section[empty(.//eg/@href)]"/>
    
    <xsl:template match="section" mode="test-header">
        <!--<xsl:apply-templates select="parent::section" mode="#current"/>-->
        <!--<xsl:text> </xsl:text>-->
        <xsl:number level="multiple" format="1.1"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="head"/>
        <xsl:text> | </xsl:text>
    </xsl:template>
    
    
    <xsl:template match="req" mode="test-header">
        <xsl:apply-templates select="ancestor::section[1]" mode="#current"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="eg"/>
        
    
    
    <xsl:template match="SPECIFICATION/section">
        <test-collection name="{head/normalize-space(.)}" location="requirement-tests/">
            <xsl:for-each-group select=".//eg[@href]" group-by="@href">
                
       
        <xsl:variable name="basename" as="xs:string" select="current-grouping-key() => substring-after('requirement-tests/') => replace('\.xml$','')"/>
        
        <test-scenario name="{ $basename }">
            <xsl:if test="matches(.,'\S')">
            <example-description>
                <xsl:apply-templates/>
            </example-description>
            </xsl:if>
            <xsl:for-each select="current-group()/parent::req">
            <addresses-requirement requirement-id="{ @id }">
                <xsl:apply-templates select="."/> <!-- note no mode -->
            </addresses-requirement>
            </xsl:for-each>
                <resolve-profile>
                    <profile-source source-format="XML" location="{ @href/replace(.,'.*/','') }"/>
                </resolve-profile>
            <expected-resolution source-format="XML" location="output-expected/{ @href/replace(.,'.*/','') }"/>
            </test-scenario>
            </xsl:for-each-group>
            
        <!--<x:scenario label="Example TBD - {.}">
            <xsl:if test="not(matches(@href,'\S')) or starts-with(.,'PENDING')">
                <xsl:attribute name="pending">{ replace(.,'^PENDING:?\s*','') }</xsl:attribute>
            </xsl:if>
                
            <xsl:if test="matches(@href,'\S')">
                    <xsl:attribute name="label">Example { $basename }.xml - {.}</xsl:attribute>
                    <xsl:processing-instruction name="requirement">{ ancestor::req[1]/@id } </xsl:processing-instruction>
                    <x:context href="{ @href }"/>
                    <x:expect label="Resolution of { $basename }.xml" select="opr:scrub(.)"
                        href="requirement-tests/output-expected/{$basename}_RESOLVED.xml"/>
                </xsl:if>
                
            
        </x:scenario>-->
        </test-collection>
    </xsl:template>
    
    <xsl:template match="xref" expand-text="true">
        <xsl:text>[Section {@rid}]</xsl:text>
    </xsl:template>
</xsl:stylesheet>
