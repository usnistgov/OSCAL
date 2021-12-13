<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="xs math o opr"
    xmlns:javaUUID="java.util.UUID"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    <!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->

    <xsl:param name="profile-origin-uri">urn:UNKNOWN</xsl:param>

    <xsl:param name="uuid-service" select="'https://www.uuidgenerator.net/api/version4'"/>
    <xsl:param name="assign-uuid"  as="xs:string?"/>
    
    <xsl:variable name="uuid-v4-regex" as="xs:string">^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-4[0-9A-Fa-f]{3}-[89ABab][0-9A-Fa-f]{3}-[0-9A-Fa-f]{12}$</xsl:variable>
    
    <xsl:variable name="use-uuid" as="xs:string">
        <xsl:choose>
            <xsl:when test="matches($assign-uuid,$uuid-v4-regex)">
                 <xsl:sequence select="$assign-uuid"/>
            </xsl:when>
            <xsl:when test="function-available('javaUUID:randomUUID')">
                <xsl:sequence select="javaUUID:randomUUID()"/>
            </xsl:when>
            <xsl:when test="unparsed-text-available($uuid-service)">
                <xsl:sequence select="unparsed-text($uuid-service)"/>
            </xsl:when>
            <xsl:otherwise>00000000-0000-4000-B000-000000000000</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="* | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="profile" priority="1">
        <catalog uuid="{ $use-uuid }">
            <!-- Rewriting top-level @id -->
            <!--<xsl:if test="function-available('uuid:randomUUID')" xmlns:uuid="java:java.util.UUID">
                <xsl:attribute name="uuid" select="uuid:randomUUID()"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </catalog>
    </xsl:template>

    <xsl:template match="profile/metadata">
        <xsl:variable name="leaders" select="(title | published | last-modified | version | oscal-version | doc-id)"/>
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="$leaders"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <link href="{$profile-origin-uri}" rel="resolution-source"/>
            <xsl:apply-templates mode="#current" select="* except ($leaders | prop)"/>
            <!--<xsl:apply-templates select="../selection" mode="imported-metadata"/>-->
        </xsl:copy>
    </xsl:template>

    <xsl:template match="last-modified">
        <xsl:copy>
            <xsl:value-of select="current-dateTime()"/>
        </xsl:copy>
    </xsl:template>

    <!--<xsl:template match="selection" mode="imported-metadata">
        <resource id="{@id}-RESOURCE" rel="imported">
            <xsl:copy-of select="metadata/title" copy-namespaces="no"/>
            <rlink href="{@opr:src}"/>
        </resource>
    </xsl:template>-->

    <xsl:template match="selection/metadata"/>

</xsl:stylesheet>
