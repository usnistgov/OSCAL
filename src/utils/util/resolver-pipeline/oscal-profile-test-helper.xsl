<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    default-mode="scrubbing">

    <!--

    
    XSLT provides utility functionality for testing OSCAL profile resolution.
    
    Function opr:scrub-document returns an OSCAL catalog or profile with 'cosmetic' whitespace removed,
    for clean comparison.
    
    -->

    <xsl:output method="xml"/>
    
    <xsl:strip-space
        elements="catalog metadata param control group back-matter prop link part usage constraint guideline select remarks description test revisions revision role location party responsible-party address external-id resource citation rlink base64"/>


    <!--All assemblies defined in the catalog model:
        
        https://raw.githubusercontent.com/wendellpiez/OSCAL/profile-resolution-update-v1a/xml/schema/oscal_catalog_schema.xsd
        
        //xs:element[ends-with(@type,'ASSEMBLY') or exists(xs:complexType[not(@mixed='true')])]/@name => distinct-values() => string-join(' | ')
        
        
        catalog | metadata | param | control | group | back-matter | prop | link | part | usage | constraint | guideline | select | remarks | description | test | revisions | revision | role | location | party | responsible-party | address | external-id | resource | citation | rlink | base64
        
        
    -->
    <xsl:template match="/">
        <xsl:param name="source" select="." as="document-node()"/>
        <xsl:document>
          <xsl:apply-templates select="$source" mode="scrubbing"/>
        </xsl:document>
    </xsl:template>

    <xsl:function name="opr:scrub" as="document-node()">
        <xsl:param name="n" as="node()"/>
        <xsl:document>
          <xsl:apply-templates select="$n" mode="scrubbing"/>
        </xsl:document>
    </xsl:function>
    
    <xsl:template mode="scrubbing" match="* | text() | @*">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <!-- defends against whitespace/indentation glitches -->
    <xsl:template mode="scrubbing" match="text()[matches(.,'\S') => not()]">
        <xsl:variable name="wrapper" select="ancestor::p[1] | ancestor::li[1]"/>
        <xsl:if test="not(. is $wrapper/descendant::text()[1]) and not(. is $wrapper/descendant::text()[last()])">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>

    <xsl:template mode="scrubbing" match="catalog/metadata/prop[@name='resolution-tool']/@value">
        <xsl:attribute name="value">...</xsl:attribute>
    </xsl:template>

    <xsl:template mode="scrubbing" match="catalog/metadata/link[@rel='source-profile']/@href">
        <xsl:attribute name="href">...</xsl:attribute>
    </xsl:template>

    <xsl:template mode="scrubbing" match="last-modified">
        <xsl:copy>...</xsl:copy>
    </xsl:template>
    
    <xsl:template mode="scrubbing" match="catalog/@uuid">
        <xsl:attribute name="uuid">...</xsl:attribute>
    </xsl:template>
    
    <xsl:template mode="scrubbing" match="catalog | metadata | param | control | group | back-matter | prop | link | part | usage | constraint | guideline | select | remarks | description | test | revisions | revision | role | location | party | responsible-party | address | external-id | resource | citation | rlink | base64">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <!-- strips comments and PIs too!  -->
            <xsl:apply-templates mode="#current" select="child::*"/>
        </xsl:copy>
    </xsl:template>

    
</xsl:stylesheet>
