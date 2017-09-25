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
    
    
    <!-- Must be set at runtime -->
    <xsl:variable name="catalog-path" select="'file:/home/wendell/Documents/OSCAL/examples/SP800-53/'"/>

    <!-- First time through we will expand all four of the catalog sources
         in order of preference; in the second pass we remove the unwanted
         citations (those after the earliest) -->
    <xsl:variable name="catalogs" as="element()">
        <sequence>
            <invoke key="HIGH"    >SP800-53-HIGH-baseline.xml</invoke>
            <invoke key="MODERATE">SP800-53-MODERATE-baseline.xml</invoke>
            <invoke key="LOW"     >SP800-53-LOW-baseline.xml</invoke>
            <invoke key="sp800-53">SP800-53-rev4-catalog.xml</invoke>
        </sequence>
    </xsl:variable>
    
    <xsl:template match="profile">
        <xsl:comment expand-text="true"> XML produced by running { document('')/document-uri(.) } on { document-uri(/) } { current-date() } </xsl:comment> 
        <xsl:text>&#xA;</xsl:text>
        <xsl:comment expand-text="true"> Baseline allocation of calls (in order): { string-join($catalogs/invoke/@key,', ') } </xsl:comment> 
        <xsl:text>&#xA;</xsl:text>
        <!--<xsl:next-match/>-->
        <!--<profile id="uuid-{uuid:randomUUID()}">
            <title>FedRAMP PROFILE allocation</title>
            <xsl:apply-templates/>
        </profile>-->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:comment expand-text="true"> Baseline allocation of calls (in order): { string-join($catalogs/invoke/@key,', ') } </xsl:comment> 
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:key name="call-by-id" match="call | alter" use="@control-id | @subcontrol-id"/>
    
    <xsl:template match="invoke">
        <xsl:variable name="here" select="."/>
        <xsl:variable name="full-sequence">
            <xsl:for-each select="$catalogs/invoke">
                <xsl:variable name="source-path" select="$catalog-path || ."/>
                <xsl:message expand-text="true">{ $source-path }</xsl:message>
                <xsl:variable name="source" select="document($source-path,.)"/>
                <xsl:variable name="resolved" select="oscal:resolve($source)"/>
                <xsl:variable name="good-calls" select="$here/include/call[(@control-id|@subcontrol-id)=$resolved//(component|control|subcontrol)/@id]"/>
                <xsl:copy>
                    <xsl:attribute name="href" select="$catalog-path || string(.)"/>
                    <include>
                        <xsl:copy-of select="$good-calls"/>
                    </include>
                    <xsl:copy-of select="$here/alter[(@control-id|@subcontrol-id)=$good-calls/(@control-id|@subcontrol-id)]"/>
                </xsl:copy>
            </xsl:for-each>
        </xsl:variable>
        
        <!-- Unfortunately, parameters have to be added in a subsequent pass.
             But we propagate alterations. The filter prevents both calls on
             controls (subcontrols) or alterations from being called repeatedly,
             taking the includes in (document) order (i.e. first one wins).-->
        <xsl:apply-templates select="$full-sequence" mode="filter"/>
    </xsl:template>
    
    
   
    
    <xsl:template mode="filter" match="call">
        <xsl:if test=". is (key('call-by-id',(@control-id | @subcontrol-id))/self::call)[1]">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template mode="filter" match="alter">
        <xsl:if test=". is (key('call-by-id',(@control-id | @subcontrol-id))/self::alter)[1]">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
        
    <xsl:template match="prop[@class='name']" mode="filter">
        <prop class="fedramp-name">
            <xsl:apply-templates mode="#current"/>
        </prop>
    </xsl:template>
    
</xsl:stylesheet>