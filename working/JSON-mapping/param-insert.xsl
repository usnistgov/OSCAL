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
    
    <xsl:template match="params">
        <xsl:copy>
        <xsl:variable name="resource-params" select="key('element-by-id',../components//link[@rel='satisfies']/replace(@href,'.*#',''),$resource)/param"/>
        <xsl:apply-templates select="set-param | $resource-params">
            <xsl:sort select="prop[@class='param-key'],../prop[@class='name']"/>
        </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="param">
        <set-param>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </set-param>
    </xsl:template>
    
    <xsl:template match="param/@id">
        <xsl:attribute name="param-id" select="."/>
    </xsl:template>
    
</xsl:stylesheet>