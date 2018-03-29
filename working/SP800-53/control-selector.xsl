<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
    <!-- This version copies the three controls from the catalog that are most linked-to by others. -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:key name="controls-for-link" match="control" use="'#' || @id"/>
    
    <xsl:template match="/*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <title>Three Controls from SP800-53</title>
            <xsl:for-each-group select="//link[starts-with(@href,'#')]" group-by="@href">
                <xsl:sort select="count(current-group())" order="descending"/>
                <links href="{current-grouping-key()}" count="{count(current-group())}"/>
                <!--<xsl:if test="position() le 3">
                    <xsl:apply-templates select="key('controls-for-link',current-grouping-key())"/>
                </xsl:if>-->
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>