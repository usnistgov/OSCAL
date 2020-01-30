<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- This XSLT, applied to an XML document valid to the Milestone 2 OSCAL schema version for Catalog or Profile,
     will produce a similar XML document, valid or closer to valid to the Milestone 3 OSCAL schema.
    We say 'closer to valid' in this case because we implement only necessary mappings we have seen, not all conceivable, given Issue ; plus of course we depend on valid inputs. -->
    
    <xsl:strip-space elements="catalog group control subcontrol part param resource
        metadata back-matter revision annotation location party person org rlink address biblio resource citation role responsible-party
        profile import merge custom group modify include exclude set alter add"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:mode name="copy" on-no-match="shallow-copy"/>
    
    <xsl:template match="/*">
        <xsl:comment expand-text="true"> Modified by conversion XSLT { current-dateTime() } - Milestone 2 OSCAL becomes Milestone 3 OSCAL  - </xsl:comment>
        <xsl:next-match/>
    </xsl:template>
    
    <!-- Rewriting top-level @id -->
    <xsl:template match="/*/@id[function-available('uuid:randomUUID')]" xmlns:uuid="java:java.util.UUID">
        <xsl:attribute name="id" select="'uuid-' || uuid:randomUUID()"/>
    </xsl:template>
    
    <!-- copy metadata, mostly -->
    <xsl:template match="metadata">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="title"/>
            <!-- time stamp it at runtime -->
            <xsl:apply-templates select="child::*[1]" mode="ws"/>
            <last-modified xsl:expand-text="true">{ current-dateTime() }</last-modified>
            <xsl:apply-templates select="* except title | version"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="last-modified" priority="6"/>
    
    <xsl:template match="oscal-version" priority="6">
        <xsl:apply-templates select="." mode="ws"/>
        <oscal-version>1.0.0-milestone3</oscal-version>
    </xsl:template>
    
    <xsl:template match="metadata/*" priority="5">
        <xsl:apply-templates select="." mode="ws"/>
        <xsl:next-match/>
        <xsl:if test="empty(following-sibling::*)">
            <xsl:apply-templates select=".." mode="ws"/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="*" mode="ws">
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="ancestor::*">
            <xsl:text>    </xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="set | set-param">
        <set-parameter>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </set-parameter>
    </xsl:template>
    
    <xsl:template match="citation">
        <resource id="{@id}">
            <xsl:apply-templates select="title" mode="copy"/>
            <xsl:next-match/>
            <rlink href="{ target }"/>
        </resource>
    </xsl:template>
    
    <xsl:template match="citation/title">
        <text>
            <xsl:apply-templates/>
        </text>
    </xsl:template>
    
    <xsl:template match="citation/@id | citation/target | citation/text()"/>
    
    
</xsl:stylesheet>