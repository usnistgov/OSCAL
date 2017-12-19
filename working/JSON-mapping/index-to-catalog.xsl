<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math oscal"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="catalog-file" as="xs:string">file:/home/wendell/Documents/OSCAL/working/SP800-53/rev4/SP800-53-OSCAL-refined.xml</xsl:param>
    
    <xsl:variable name="catalog" select="document($catalog-file)"/>
    
    <xsl:key name="component-by-key" match="control | subcontrol" use="prop[@class='name']"/>
    
    <xsl:template match="part[@class='satisfies']">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:for-each select="prop[@class='control-name']">
                <xsl:variable name="target" select="key('component-by-key',string(.),$catalog)"/>
                <link rel="satisfies" href="#{$target/@id}">
                    <xsl:value-of select="$target/title"/>
                </link>
                <prop class="{name($target)}-name">
                    <xsl:value-of select="."/>
                </prop>
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="part[@class='satisfies']/prop[@class='control-name']"/>
    
    <xsl:template match="set-param">
        <xsl:variable name="key" select="prop[@class='param-key']"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="param-id" select="$catalog//*[starts-with($key,prop[@class='name'])]/param/@id"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>