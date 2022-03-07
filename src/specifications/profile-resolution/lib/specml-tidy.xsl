<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://csrc.nist.gov/ns/oscal/specml"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml">
    
    <!-- Greedy stripper from everything but 'tagging' -->
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="tagging"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:output indent="no" cdata-section-elements="tagging"/>
    
    <!-- element-only elements        
  let $all := //*/name() => distinct-values()
  let $mixed := //text()[normalize-space(.)]/name(..) => distinct-values()
  let $empties := //*[empty(*) and not(normalize-space()]/name() => distinct-values()
  return ($all[not(.=($mixed,$empty))] ! (. || '/*') ) => string-join(' | ')

-->  
    
    <xsl:template
        match="SPECIFICATION/* | section/* | ul/* | li/* | mapping/*">
        <!--LF before start tag if no one has given an LF before us -->
        
        <xsl:call-template name="leading-indent"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <!-- indent for end tag *only* for element-only, not their children -->
            <xsl:apply-templates select="." mode="end-tag-ws"/>
        </xsl:copy>
        <!--LF after end tag-->
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template name="leading-indent">
        <xsl:if test="empty(preceding-sibling::*)">
            <xsl:text>&#xA;</xsl:text>
        </xsl:if>
        <!-- indent -->
        <xsl:for-each select="ancestor::*">
            <xsl:text>  </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <!-- will match any element not element-only -->
    <xsl:template match="*" mode="end-tag-ws"/>
    
    <!--this time matching element-only, but not their children -->
    <xsl:template
        match="SPECIFICATION | section | ul | li | mapping" mode="end-tag-ws">
        <xsl:for-each select="ancestor::*">
            <xsl:text>  </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template priority="101" match="tagging">
        <xsl:call-template name="leading-indent"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:text>&#xA;</xsl:text>
            <!-- trimming leading and trailing whitespace only -->
            <xsl:value-of select="replace(string(),'^\s+|\s$','','s')"/>
        </xsl:copy>
        <!--LF after end tag-->
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="p//text()">
        <xsl:variable name="soonest" select="ancestor::p/descendant::text()[normalize-space(.)][1]"/>
        <xsl:variable name="latest"  select="ancestor::p/descendant::text()[normalize-space(.)][last()]"/>
        <xsl:choose>
            <!-- A text node after this paragraph's last interesting text node is discarded -->
            <xsl:when test=". >> $latest"/>
            <!-- Also a text node before this paragraph's first interesting text node -->
            <xsl:when test="$soonest >> ."/>
            <xsl:otherwise>
                <xsl:next-match/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Adds extra whitespace padding to inline markup -->
    <xsl:template match="p//*">
        <xsl:variable name="first" as="text()" select="ancestor::p/descendant::text()[normalize-space(.)][1]"/>
        <xsl:variable name="last"  as="text()" select="ancestor::p/descendant::text()[normalize-space(.)][last()]"/>
        <xsl:variable name="next"  as="xs:string?" select="following-sibling::node()[1]/normalize-space(.)"/>
        <!-- pad if something interesting has appeared first -->
        <xsl:if test=". >> $first">
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:next-match/>
        <!-- pad again to replace trimmed space -->
        <xsl:if test="$last >> . and ($next ! matches(.,'^[\s\w]'))">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>
    
</xsl:stylesheet>