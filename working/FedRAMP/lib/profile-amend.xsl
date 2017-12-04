<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:uuid="java:java.util.UUID"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math uuid"
    version="3.0">
    
    <xsl:import href="../../lib/XSLT/profile-resolver.xsl"/>
    
    <xsl:output indent="yes"/>

    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:mode name="filter" on-no-match="shallow-copy"/>
   
<!-- Assumes input is a valid profile.
    
    For controls and subcontrols successfully called by the profile:
      Parameters are copied into the invocation (for later editing)
      
      Alterations are modified as follows
        (filterd via semantic checks):
        
    -->
    <xsl:template match="profile">
        <xsl:comment expand-text="true"> XML produced by running { document('')/document-uri(.) } on { document-uri(/) } { current-date() } </xsl:comment> 
        <xsl:text>&#xA;</xsl:text>
        <profile id="uuid-{uuid:randomUUID()}">
            <title>FedRAMP PROFILE enhancement</title>
            <xsl:apply-templates/>
        </profile>
        
    </xsl:template>
    
    <!--<xsl:key name="call-by-id" match="call | alter" use="@control-id | @subcontrol-id"/>-->
    <xsl:key name="component-by-id" match="control | subcontrol | component" use="@id"/>
    
    <xsl:template match="invoke">
            <xsl:if test="exists(* except include[empty(*)])">
                <xsl:variable name="resolved" select="oscal:resolve(document(@href,.))"/>
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:copy-of select="include|exclude"/>
                    
                    <!-- picking up parameters with alter specs -->
                    <xsl:for-each select="alter">
                        <xsl:comment> ----- </xsl:comment>
                        <xsl:variable name="who" select="key('component-by-id',(@control-id|@subcontrol-id),$resolved)"/>
                        <xsl:apply-templates select="$who/param" mode="params"/>
                        <xsl:apply-templates select="." mode="filter">
                            <xsl:with-param tunnel="yes" name="controlObj" select="$who"/>
                        </xsl:apply-templates>
                    </xsl:for-each>
                    
                    <xsl:comment> ===== </xsl:comment>
                    <!-- now remaining parameters -->
                    <!--<xsl:copy-of select="$resolved//param except key('component-by-id',alter/(@control-id|@subcontrol-id),$resolved)//param"/>-->
                </xsl:copy>
            </xsl:if>
        
    </xsl:template>
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
        <set-param param-id="{@id}">
            <xsl:copy-of select="@* except @id"/>
            <!--<xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>-->
            <xsl:copy-of select="desc, value"/>
        </set-param>
    </xsl:template>
    
    <!--<prop class="profile-title">REVIEWS AND UPDATES</prop>
        <prop class="family">CONFIGURATION MANAGEMENT</prop>
        <prop class="fedramp-name">CM-2 (1)</prop>
    -->
    
   
    <xsl:template match="p" mode="filter">
        <xsl:for-each select="tokenize(.,'&#xA;\s*&#xA;')[matches(.,'\S')]">
            <p>
                <xsl:copy-of select="normalize-space(.)"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="prop[@class='fedramp-name']" mode="filter">
        <xsl:param name="controlObj" tunnel="yes"/>
        <xsl:if test="not(. = $controlObj/prop[@class='name'])">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <!--<group class="family">
        <title>MAINTENANCE</title>
        -->
    
    <xsl:template match="prop[@class='family']" mode="filter">
        <xsl:param name="controlObj" tunnel="yes"/>
        <xsl:if test="not(. = $controlObj/ancestor::group[@class='family']/title/upper-case(.))">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="prop[@class='profile-title']" mode="filter">
        <xsl:param name="controlObj" tunnel="yes"/>
        <xsl:if test="not((upper-case(.) ! normalize-space(.)) = $controlObj/title/(upper-case(.) ! normalize-space(.)) )">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>