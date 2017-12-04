<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes"/>

    <xsl:template match="comment() | processing-instruction()">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="worksheet">
        <xsl:comment expand-text="true"> XML produced by running { document('')/document-uri(.) } on { document-uri(/) } { current-date() } </xsl:comment> 
        <xsl:text>&#xA;</xsl:text>
        <profile>
            <invoke href="catalog.xml">
                <include>
                  <xsl:apply-templates select="//component" mode="write-call"/>
                </include>
                <xsl:apply-templates select="//component"   mode="write-patch"/>
            </invoke>
        </profile>
    </xsl:template>
    
    
    <xsl:template match="component" mode="write-call">
        <xsl:variable name="new-id" select="replace(prop[@class='name'] ! lower-case(.),'[\p{P}\s]+','.')"/>
        <call control-id="{$new-id}"/>
    </xsl:template>
    
    <xsl:template match="component/component" mode="write-call">
        <xsl:variable name="new-id" select="replace(prop[@class='name'] ! lower-case(.),'[\p{P}\s]+','.')"/>
        <call subcontrol-id="{$new-id}"/>
    </xsl:template>
    
    <xsl:template match="component" mode="write-patch">
        <xsl:variable name="new-id" select="replace(prop[@class='name'] ! lower-case(.),'[\p{P}\s]+','.')"/>
        <alter control-id="{$new-id}">
            <augment>
              <xsl:apply-templates select="* except component" mode="write-patch"/>
            </augment>
        </alter>
    </xsl:template>
    
    <xsl:template match="component/component" mode="write-patch">
        <xsl:variable name="new-id" select="replace(prop[@class='name'] ! lower-case(.),'[\p{P}\s]+','.')"/>
        <alter subcontrol-id="{$new-id}">
            <augment>
                <xsl:apply-templates select="* except component" mode="write-patch"/>
            </augment>
        </alter>
    </xsl:template>
    
    <xsl:template match="component/*" mode="write-patch" priority="-0.3">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="p" mode="write-patch">
        <part>
            <xsl:copy-of select="@*"/>
            <xsl:copy>
                <xsl:apply-templates/>
            </xsl:copy>
        </part>
    </xsl:template>
    
    <xsl:template match="title" mode="write-patch">
        <prop class="profile-title">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </prop>
    </xsl:template>
    
    <!--<xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>-->
    
    
    
</xsl:stylesheet>