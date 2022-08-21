<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:javaUUID="java.util.UUID"
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:r="http://csrc.nist.gov/ns/random"
    xmlns:u="http://csrc.nist.gov/ns/uuid"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">

    <xsl:import href="random-util.xsl"/>
    <xsl:import href="message-handler.xsl"/>

    <!-- Select an approach for assigning the top-level UUID for the 
        result catalog. Supported values:
        - 'random-xslt'    No parameters.
        - 'random-java'    No parameters.
        - 'user-provided'  Parameter $top-uuid is required in this case.
        - 'web-service'    Parameter $uuid-service is optional.
        - 'fixed'          No parameters.
        -->
    <xsl:param name="uuid-method" as="xs:string" select="'fixed'"/>
    
    <!-- Explicit top-level UUID for the result catalog. -->
    <xsl:param name="top-uuid" as="xs:string?"/>
    
    <!-- Alternatively, call a web service if the processor supports it -->
    <xsl:param name="uuid-service" select="'https://www.uuidgenerator.net/api/version4'"/>

    <xsl:template name="u:determine-uuid" as="item()+">
        <!-- Return value is xs:string, in addition to a processing instruction
            if there is a warning situation. -->
        <xsl:param name="uuid-method" select="$uuid-method" as="xs:string"/>
        <xsl:param name="uuid-service" select="$uuid-service" as="xs:string"/>
        <xsl:param name="top-uuid" select="$top-uuid" as="xs:string?"/>
        
        <xsl:variable name="uuid-v4-regex" as="xs:string">^[0-9A-Fa-f]{8}-[0-9A-Fa-f]{4}-4[0-9A-Fa-f]{3}-[89ABab][0-9A-Fa-f]{3}-[0-9A-Fa-f]{12}$</xsl:variable>
        <xsl:variable name="fixed-uuid" as="xs:string">00000000-0000-4000-B000-000000000000</xsl:variable>
        <xsl:choose>
            <xsl:when test="$uuid-method eq 'user-provided' and
                matches($top-uuid,$uuid-v4-regex)">
                <xsl:sequence select="$top-uuid"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'user-provided'">
                <!-- If we reach this block, the provided value does not match the regex. -->
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="message-type">Warning</xsl:with-param>
                    <xsl:with-param name="text" expand-text="yes">top-uuid value, '{$top-uuid}', does not meet UUID requirements. Using default UUID instead.</xsl:with-param>
                </xsl:call-template>
                <xsl:sequence select="$fixed-uuid"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'random-xslt'" use-when="function-available('random-number-generator')">
                <!-- seed splices a timestamp with a given @uuid -->
                <xsl:sequence select="r:make-uuid( /*/@uuid || '-' || replace( string(current-dateTime()),'\D','') )"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'random-java'" use-when="function-available('javaUUID:randomUUID')">
                <xsl:sequence select="javaUUID:randomUUID()"/>
            </xsl:when>
            <xsl:when test="$uuid-method = ('random-xslt','random-java')">
                <!-- If we reach this block, the requested random method is not available. -->
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="message-type">Warning</xsl:with-param>
                    <xsl:with-param name="text" expand-text="yes">uuid-method, '{$uuid-method}', is not available. Using default UUID instead.</xsl:with-param>
                </xsl:call-template>
                <xsl:sequence select="$fixed-uuid"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'web-service' and unparsed-text-available($uuid-service)">
                <xsl:sequence select="unparsed-text($uuid-service)"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'web-service'">
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="message-type">Warning</xsl:with-param>
                    <xsl:with-param name="text" expand-text="yes">uuid-service, '{$uuid-service}', is not available. Using default UUID instead.</xsl:with-param>
                </xsl:call-template>
                <xsl:sequence select="$fixed-uuid"/>
            </xsl:when>
            <xsl:when test="$uuid-method eq 'fixed'">
                <xsl:sequence select="$fixed-uuid"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="message-type">Warning</xsl:with-param>
                    <xsl:with-param name="text" expand-text="yes">uuid-method, '{$uuid-method}', is not recognized. Using default UUID instead.</xsl:with-param>
                </xsl:call-template>
                <xsl:sequence select="$fixed-uuid"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>