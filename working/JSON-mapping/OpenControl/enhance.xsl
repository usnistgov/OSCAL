<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!--<xsl:template match="component/*[empty(node())]"/>-->
    
    <!-- Logic borrowed from XSweet 
    -->
    
    <xsl:template match="/">
        <!--<xsl:call-template name="diagnostic"/>-->
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template match="/map">
        <implementation>
            <xsl:apply-templates/>
        </implementation>
    </xsl:template>
    
    <xsl:template match="name">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="param">
        <set-param>
            <xsl:apply-templates/>
        </set-param>
    </xsl:template>
    
    <xsl:template match="description | responsibleRoles">
        <p class="{name()}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="part[matches(id,'\S')]">
        <part id="{id}">
            <xsl:apply-templates/>
        </part>
    </xsl:template>
    
    <xsl:template match="part/id"/>
    
    <xsl:template match="url">
        <link><xsl:apply-templates/></link>
    </xsl:template>

    <!--<xsl:template match="p[@class='narrative']/text()">
        <xsl:value-of select="replace(.,'^''','') => replace('''\s*$','')"/>
    </xsl:template>-->
    
    <xsl:variable name="tlds"         as="xs:string" expand-text="true">(com|org|net|gov|mil|edu|io|foundation)</xsl:variable>
    <xsl:variable name="urlchar"      as="xs:string" expand-text="true">[\w\-_\.]</xsl:variable>
    <xsl:variable name="extraURLchar" as="xs:string">[\w\-\$:;/:@&amp;=+,_]</xsl:variable>
    
    <xsl:variable name="domain"    as="xs:string" expand-text="true">({$urlchar}+\.)</xsl:variable>
    
    <xsl:variable name="tail"      as="xs:string" expand-text="true">(/|(\.(xml|html|htm|gif|jpg|jpeg|pdf|png|svg)))?</xsl:variable>
    <xsl:variable name="pathstep"  as="xs:string" expand-text="true">(/{$urlchar}+)</xsl:variable>
    
    <xsl:variable name="url-match" as="xs:string" expand-text="true">((http|ftp|https):/?/?)?{$domain}+{$tlds}{$pathstep}*{$tail}(\?{$extraURLchar}+)?</xsl:variable>

   <!-- <xsl:template match="text()">
        
        <xsl:analyze-string select="." regex="{$url-match}">
            <!-\-(https?:)?(\w+\.)?(\w+)\.(\w\w\w)-\->
            <xsl:matching-substring>
                <xsl:variable name="has-protocol" select="matches(.,'^https?://')"/>
                <a href="{'http://'[not($has-protocol)]}{regex-group(0)}">
                    <xsl:value-of select="."/>
                </a>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>-->
    
    <xsl:template name="diagnostic">
        <xsl:comment expand-text="true">
            
Children of 'component': { string-join(distinct-values(//component/*/name(.)), ',') }            

        </xsl:comment>
    </xsl:template>
</xsl:stylesheet>