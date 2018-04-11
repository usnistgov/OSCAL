<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math oscal"
    version="3.0">
    
    <xsl:import href="../lib/XSLT/profile-resolver.xsl"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="resource-file" as="xs:string">file:/home/wendell/Documents/OSCAL/examples/SP800-53/SP800-53-rev4-catalog.xml</xsl:param>
    
    <!--file:/home/wendell/Documents/OSCAL/examples/SP800-53/SP800-53-MODERATE-baseline.xml-->
    <!--file:/home/wendell/Documents/OSCAL/examples/FedRAMP/FedRAMP-MODERATE-crude.xml-->
    
    <!--file:/home/wendell/Documents/OSCAL/examples/SP800-53/SP800-53-rev4-catalog.xml-->
    
    <xsl:variable name="resource">
        <xsl:apply-templates mode="oscal:resolve" select="document($resource-file)"/>
    </xsl:variable>
    
    <xsl:key name="component-by-key" match="control | subcontrol | component" use="prop[@class='name']"/>
    
    <xsl:template match="profiles">
        <xsl:copy>
            <link rel="{$resource/name(*)}" href="{$resource-file}">
                <xsl:value-of select="$resource/descendant::title[1]"/>
            </link>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="part[@class='satisfies']">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:for-each select="prop[@class='control-name']">
                <xsl:variable name="target" select="key('component-by-key',string(.),$resource)"/>
                <link rel="satisfies" href="#{$target/@id}">
                    <xsl:value-of select="$target/title"/>
                </link>
                <!--<prop class="{name($target)}-name">
                    <xsl:value-of select="."/>
                </prop>-->
            </xsl:for-each>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="prop[@class='control-name']"/>
    
</xsl:stylesheet>