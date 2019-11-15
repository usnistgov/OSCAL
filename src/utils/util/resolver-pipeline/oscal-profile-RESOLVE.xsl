<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">


    <xsl:output method="xml" indent="yes"/>

    <xsl:strip-space elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include exclude set alter add"/>
    
    
    <!--
        
    This XSLT orchestrates a sequence of transformations over its input.
    
    The first transformation, "selection", aggregates the source with external (referenced) contents.
    
    Subsequent transformations are self-contained.
    
    -->
    
    <xsl:variable name="transformation-sequence">
        <o:transform version="2.0">oscal-profile-resolve-select.xsl</o:transform>
        <o:transform version="2.0">oscal-profile-resolve-merge.xsl</o:transform>
        <o:transform version="2.0">oscal-profile-resolve-modify.xsl</o:transform>
        <o:finalize/>
    </xsl:variable>

    <!-- traps the root node of the source and passes it down the chain of transformation references -->
    <xsl:template match="/">
        <xsl:variable name="source" select="."/>
        <xsl:iterate select="$transformation-sequence/*">
            <xsl:param name="doc" select="$source" as="document-node()"/>
            <xsl:on-completion select="$doc"/>
            <xsl:next-iteration>
                <xsl:with-param name="doc">
                    <xsl:apply-templates mode="o:execute" select=".">
                        <xsl:with-param name="sourcedoc" select="$doc"/>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:next-iteration>
        </xsl:iterate>
    </xsl:template>

    <xsl:template mode="o:execute" match="o:transform">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:variable name="xslt-spec" select="."/>
        <xsl:variable name="runtime"
            select="
                map {
                    'xslt-version': xs:decimal($xslt-spec/@version),
                    'stylesheet-location': string($xslt-spec),
                    'source-node': $sourcedoc
                }"/>
        <!-- The function returns a map; primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->
        <xsl:sequence select="transform($runtime)?output"/>
    </xsl:template>

    <!-- the finalize directive performs any last cleanup -->
    <xsl:template mode="o:execute" match="o:finalize">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:apply-templates select="$sourcedoc" mode="o:finalize"/>
    </xsl:template>
    
    <!-- not knowing any better, any other execution directive passes along its source. -->
    <xsl:template  mode="o:execute"match="*">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:sequence select="$sourcedoc"/>
    </xsl:template>
    
    <!-- mode 'o:finalize' makes final adjustments -->

    <!-- wiping traces of XSD   -->
    <xsl:template mode="o:finalize" match="@xsi:*"/>
    
    <!-- IDs with leading '#' should be stripped as an artifact of resolution  -->
    <xsl:template mode="o:finalize" match="@id[starts-with(.,'#')]"/>
    
    <!-- copying everything else without namespaces -->
    <xsl:template mode="o:finalize" match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>