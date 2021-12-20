<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <!--

    
    XSLT provides utility functionality for testing OSCAL profile resolution.
    
    Function opr:scrub-document returns an OSCAL catalog or profile with 'cosmetic' whitespace removed,
    for clean comparison.
    
    -->

    <xsl:output method="xml" indent="yes"/>

    <xsl:strip-space
        elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include exclude set alter add"/>


    <!--All assemblies defined in the profile model:
        
        https://raw.githubusercontent.com/wendellpiez/OSCAL/profile-resolution-update-v1a/xml/schema/oscal_catalog_schema.xsd
        //xs:element[ends-with(@type,'ASSEMBLY')]/@name => distinct-values() => string-join(' | ')
        
        profile | metadata | import | merge | modify | back-matter | include-all | include-controls | exclude-controls | combine | custom | group | insert-controls | param | prop | link | part | constraint | guideline | select | alter | remove | add | revision | role | location | party | responsible-party | address
       
       catalog | metadata | param | control | group | back-matter | prop | link | part | constraint | guideline | select | revision | role | location | party | responsible-party | address
    -->
    
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

    <xsl:template mode="scrubbing" match="last-modified">
        <xsl:copy>...</xsl:copy>
    </xsl:template>
    
    <xsl:template mode="scrubbing" match="catalog/@uuid">
        <xsl:attribute name="uuid">...</xsl:attribute>
    </xsl:template>
    
    <xsl:template mode="scrubbing" match="catalog | metadata | param | control | group | back-matter | prop | link | part | constraint | guideline | select | revision | role | location | party | responsible-party | address |
        profile | import | merge | modify | include-all | include-controls | exclude-controls | combine | custom | insert-controls | alter | remove | add">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <!-- strips comments and PIs too!  -->
            <xsl:apply-templates mode="#current" select="child::*"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
