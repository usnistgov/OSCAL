<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:u="http://csrc.nist.gov/ns/uuid"
    exclude-result-prefixes="xs math o opr u"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
    <!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <!-- How to specify top-level UUID for result catalog:

        a) When oscal-profile-RESOLVE.xsl invokes this transform,
        it passes in a precomputed value for $top-uuid-computed.

        b) Any other caller of this transform should pass in
        $uuid-method and, if applicable, $top-uuid and $uuid-service,
        but not $top-uuid-computed. As a result, this transform
        will compute $top-uuid-computed.
        -->

    <!-- uuid-method-choice.xsl has global parameters
        $uuid-method, $top-uuid, and $uuid-service. -->
    <xsl:import href="uuid-method-choice.xsl"/>

    <!-- Top-level UUID for result catalog. -->
    <xsl:param name="top-uuid-computed"  as="xs:string">
        <xsl:call-template name="u:determine-uuid"/>
    </xsl:param>

    <xsl:param name="profile-origin-uri">urn:UNKNOWN</xsl:param>

    <!-- If true, do not record profile URI in output catalog's source-profile
        metadata, due to privacy or security concerns. This parameter is
        passed from oscal-profile-RESOLVE.xsl and the end user can override it. -->
    <xsl:param name="hide-source-profile-uri" as="xs:boolean" select="false()"/>
    
    <!-- Version of this resolution tool -->
    <xsl:variable name="tool-oscal-version" as="xs:string" select="'1.1.0'"/>

    <xsl:variable name="source-profile" as="xs:string"
        select="if ($hide-source-profile-uri) then 'profile' else $profile-origin-uri"/>

    <xsl:template match="/ | * | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="profile" priority="1">
        <catalog uuid="{ $top-uuid-computed }">
            <!-- Rewriting top-level @id -->
            <!--<xsl:if test="function-available('uuid:randomUUID')" xmlns:uuid="java:java.util.UUID">
                <xsl:attribute name="uuid" select="uuid:randomUUID()"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </catalog>
    </xsl:template>

    <xsl:template match="profile/metadata">
        <xsl:variable name="leaders" select="(title | published | last-modified | version | oscal-version | document-id)"/>
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="$leaders"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <prop name="resolution-tool" value="OSCAL Profile Resolver XSLT Pipeline OPRXP"/>
            <link href="{$source-profile}" rel="source-profile"/>
            <xsl:apply-templates mode="#current" select="* except ($leaders | prop)"/>
            <!--<xsl:apply-templates select="../selection" mode="imported-metadata"/>-->
        </xsl:copy>
    </xsl:template>

    <xsl:template match="last-modified">
        <xsl:copy>
            <xsl:value-of select="current-dateTime()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="profile/metadata/oscal-version">
        <xsl:copy>
            <xsl:sequence select="opr:oscal-version(
                .,
                ancestor::profile/selection/metadata/oscal-version/normalize-space(),
                $tool-oscal-version
                )"/>
        </xsl:copy>
    </xsl:template>

    <!-- If there is a common major version among all inputs,
        return the most recent minor version or the tool version,
        whichever is earlier.
        If there is no common major version, return fatal error. -->
    <xsl:function name="opr:oscal-version" as="xs:string">
        <xsl:param name="source" as="xs:string"/>
        <xsl:param name="imported" as="xs:string*"/>
        <xsl:param name="tool" as="xs:string"/>
        <xsl:value-of select="'TODO: Not implemented yet'"/>
    </xsl:function>

    <!--<xsl:template match="selection" mode="imported-metadata">
        <resource id="{@id}-RESOURCE" rel="imported">
            <xsl:copy-of select="metadata/title" copy-namespaces="no"/>
            <rlink href="{@opr:src}"/>
        </resource>
    </xsl:template>-->
    
    <xsl:template match="selection/metadata"/>
    
</xsl:stylesheet>
