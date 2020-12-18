<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- Adjustments to link model M3-RC1 require some changes to content wrt link usage
     -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/comment()">
        <xsl:next-match/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="/*">
        <xsl:comment expand-text="yes"> Modified again { current-date() } to conform with RC1 schema with updated link representations. </xsl:comment>
        <xsl:text>&#xA;</xsl:text>
        <xsl:next-match/>
    </xsl:template>
    
    <!-- remove 'inactive' mode (which is never used) to keep present link text contents in a 'text' element child -->
        
    <xsl:template match="link[matches(.,'\S')]" mode="inactive">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <text>
                <xsl:apply-templates/>
            </text>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template priority="3" match="link">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>