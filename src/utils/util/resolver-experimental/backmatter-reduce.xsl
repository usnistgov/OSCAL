<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
    
    <!-- profile resolution post-processor -->
    
    <!-- filters back matter; also cleans up whitespace, namespaces -->
    
    <xsl:output indent="yes"/>
    
    <xsl:strip-space elements="metadata back-matter catalog group control 
        param guideline select part annotation
        party person org rlink address resource role responsible-party citation
        profile import merge custom group modify include exclude set alter add"/>
    
    <!--string-join(distinct-values(//text()[matches(.,'\S')]/name(..)),' ') -->
    <!--<xsl:preserve-space elements="title last-modified version oscal-version label prop p link choice value target doc-id
        th td li pre em strong i b code a insert"/>-->

    <!-- Query a resolved metaschema to see elements with element-only contents: //define-assembly/@name -->
    
    <xsl:template match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Don't copy back-matter wrapper if it has no contents in result -->
    <xsl:template match="back-matter">
        <xsl:where-populated>
            <xsl:next-match/>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:key name="cross-reference" match="*[starts-with(@href,'#')]" use="substring-after(@href,'#')"/>
    
    <xsl:template match="citation[empty(key('cross-reference',@id))]"/>
    
    <xsl:template match="resource[empty(key('cross-reference',@id))]"/>
    
</xsl:stylesheet>