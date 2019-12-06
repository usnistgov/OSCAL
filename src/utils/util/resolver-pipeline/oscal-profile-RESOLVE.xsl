<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <!--
        
    An XSLT 3.0 stylesheet using XPath 3.1 functions including transform()
        
    This XSLT orchestrates a sequence of transformations over its input.
    
    The first transformation, "selection", aggregates the source with external (referenced) contents.
    
    Subsequent transformations, "merge" and "modify", are self-contained: all inputs are included.
    
    -->

    <xsl:output method="xml" indent="yes"/>
    
    <xsl:strip-space elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include exclude set alter add"/>
    
    <xsl:variable name="home" select="/"/>
    
    <!-- The $transformation-sequence declares transformations to be applied in order. -->
    <xsl:variable name="transformation-sequence">
        <opr:transform version="2.0">oscal-profile-resolve-select.xsl</opr:transform>
        <opr:transform version="2.0">oscal-profile-resolve-metadata.xsl</opr:transform>
        <opr:transform version="2.0">oscal-profile-resolve-merge.xsl</opr:transform>
        <opr:transform version="2.0">oscal-profile-resolve-modify.xsl</opr:transform>
        <opr:transform version="2.0">oscal-profile-resolve-finish.xsl</opr:transform>
        <opr:finalize/>
    </xsl:variable>

    <!-- Entry point traps the root node of the source and passes it down the chain of transformation references -->
    <xsl:template match="/" name="profile-resolve">
        <xsl:param name="source" select="." as="document-node()"/>
        <!-- Each element inside $transformation-sequence is processed in turn.
             Each represents a stage in processing.
             The result of each processing step is passed to the next step as its input, until no steps are left. -->
        <xsl:iterate select="$transformation-sequence/*">
            <xsl:param name="doc" select="$source" as="document-node()"/>
            <xsl:on-completion select="$doc"/>
            <xsl:next-iteration>
                <xsl:with-param name="doc">
                    <xsl:apply-templates mode="opr:execute" select=".">
                        <xsl:with-param name="sourcedoc" select="$doc"/>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:next-iteration>
        </xsl:iterate>
    </xsl:template>

    <!-- for opr:transformation, the semantics are "apply this XSLT" -->
    <xsl:template mode="opr:execute" match="opr:transform">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:variable name="xslt-spec" select="."/>
        <xsl:variable name="runtime-params" select="map { QName('','source-uri'): document-uri($home) }"/>
        <xsl:variable name="runtime" select="map {
                    'xslt-version': xs:decimal($xslt-spec/@version),
                    'stylesheet-location': string($xslt-spec),
                    'source-node': $sourcedoc,
                    'stylesheet-params': $runtime-params
                    }"/>
        <!-- The function returns a map; primary results are under 'output'
             unless a base output URI is given
             https://www.w3.org/TR/xpath-functions-31/#func-transform -->
        <xsl:sequence select="transform($runtime)?output"/>
        <xsl:message expand-text="true"> ... applied step { count(.|preceding-sibling::*) }: XSLT { $xslt-spec } ...</xsl:message>
    </xsl:template>

    <!-- The finalize step performs any last cleanup. -->
    <xsl:template mode="opr:execute" match="opr:finalize">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:message expand-text="true"> ... applied step { count(.|preceding-sibling::*) }: finalize ...</xsl:message>
        <xsl:apply-templates select="$sourcedoc" mode="opr:finalize"/>
    </xsl:template>
    
    <!-- Not knowing any better, any other execution step passes through its source. -->
    <xsl:template mode="opr:execute" match="*">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:message expand-text="true"> ... applied step { count(.|preceding-sibling::*) }: { name() } ...</xsl:message>
        <xsl:sequence select="$sourcedoc"/>
    </xsl:template>
    
    <!-- Mode 'opr:finalize' makes final adjustments. -->

    <!-- Here we wipe traces of XSD.   -->
    <xsl:template mode="opr:finalize" match="@xsi:*"/>
    
    <!-- Likewise, intermediate processing directives. -->
    <xsl:template mode="opr:finalize" match="opr:* | @opr:*"/>
    
    <!-- In 'finalize' mode, copying everything else without namespaces. -->
    <xsl:template mode="opr:finalize" match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>