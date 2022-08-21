<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:u="http://csrc.nist.gov/ns/uuid"
    xmlns:v="http://csrc.nist.gov/ns/version"
    exclude-result-prefixes="xs math o opr u v"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    
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

    <!-- version-util.xsl has semantic version comparison. -->
    <xsl:import href="version-util.xsl"/>
    
    <!-- Top-level UUID for result catalog. The typical case uses xs:string.
        The reason for using item()+ is that the template called to compute
        a default value might also return a warning message. -->
    <xsl:param name="top-uuid-computed"  as="item()+">
        <xsl:call-template name="u:determine-uuid"/>
    </xsl:param>

    <xsl:param name="profile-origin-uri">urn:UNKNOWN</xsl:param>

    <!-- If true, do not record profile URI in output catalog's source-profile
        metadata, due to privacy or security concerns. This parameter is
        passed from oscal-profile-RESOLVE.xsl and the end user can override it. -->
    <xsl:param name="hide-source-profile-uri" as="xs:boolean" select="false()"/>

    <xsl:variable name="source-profile" as="xs:string"
        select="if ($hide-source-profile-uri) then 'profile' else $profile-origin-uri"/>

    <xsl:template match="/ | * | @* | processing-instruction('message-handler')" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="profile" priority="1">
        <catalog uuid="{ $top-uuid-computed[. instance of xs:string] }">
            <!-- Rewriting top-level @id -->
            <!--<xsl:if test="function-available('uuid:randomUUID')" xmlns:uuid="java:java.util.UUID">
                <xsl:attribute name="uuid" select="uuid:randomUUID()"/>
            </xsl:if>-->
            <!-- If computation of top UUID included PIs with warning messages, pass them through. -->
            <xsl:sequence select="$top-uuid-computed[. instance of processing-instruction('message-handler')]"/>
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
                ancestor::profile/selection/metadata/oscal-version/normalize-space()
                )"/>
        </xsl:copy>
    </xsl:template>

    <!-- Return the oscal-version of the source profile.
        Perform error checking as in requirement
        "req-meta-oscalversion-error".
    -->
    <xsl:function name="opr:oscal-version" as="item()+" visibility="public">
        <!-- Without visiblity="public" the XSpec test returns
            XTDE0041: Cannot invoke function opr:oscal-version#2 externally, because it is not public
        -->
        <!-- Typical return value is xs:string, but use item()+ to accommodate possible error PIs. -->
        <xsl:param name="source" as="xs:string"/>
        <xsl:param name="imported" as="xs:string*"/>

        <xsl:variable name="options" as="map(*)"
            select="map{
            'normalize-space': true(),
            'supply-missing-zeros': true(),
            'remove-leading-zeros': true(),
            'allow-empty-string': true()
            }"/>
        <xsl:for-each select="$imported">
            <xsl:if test="v:compare($source, ., $options) eq xs:integer(-1)">
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="message-type" select="'Error'"/>
                    <xsl:with-param name="terminate" select="true()"/>
                    <xsl:with-param name="text" expand-text="yes">Import uses oscal-version of {.
                        }, which is newer than profile oscal-version of {
                        $source}.</xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        <!-- Return the version from the source parameter. -->
        <xsl:sequence select="$source"/>
    </xsl:function>

    <!--<xsl:template match="selection" mode="imported-metadata">
        <resource id="{@id}-RESOURCE" rel="imported">
            <xsl:copy-of select="metadata/title" copy-namespaces="no"/>
            <rlink href="{@opr:src}"/>
        </resource>
    </xsl:template>-->
    
    <xsl:template match="selection/metadata"/>
    
</xsl:stylesheet>
