<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:uuid="java:java.util.UUID"
    exclude-result-prefixes="#all"
    version="3.0">

<!-- This XSLT, applied to an XML document valid to the Milestone 3 OSCAL schema version for Catalog, Profile, SSP or Component,
     will produce a similar XML document, valid or closer to valid to the Release Candidate 1 OSCAL schema. -->

    <xsl:output indent="yes"/>

    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:mode name="copy" on-no-match="shallow-copy"/>

    <xsl:variable select="uuid:randomUUID()" name="new-document-uuid"/>
    <xsl:variable select="uuid:randomUUID()" name="new-this-system-component-uuid"/>

    <!-- Grabbing the old UUID or the new UUID if there is no old one. -->
    <xsl:variable name="this-system-component-uuid" select="(/*/system-implementation/component[(@type|@component-type='this-system')]/@uuid,$new-this-system-component-uuid)[1]"/>

    <xsl:template match="/comment()"/>

    <xsl:template match="/*">
        <xsl:comment expand-text="true"> Modified by the OSCAL 1.0.0 RC1 to OSCAL 1.0.0 RC2 conversion XSLT on { current-dateTime() } </xsl:comment>
        <xsl:copy>
            <xsl:apply-templates select="@* except @id"/>
            <xsl:attribute name="uuid" select="$new-document-uuid"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="oscal-version">
        <oscal-version>1.0.0-rc2</oscal-version>
    </xsl:template>

    <xsl:template match="last-modified" expand-text="true">
        <last-modified>{ current-dateTime() }</last-modified>
    </xsl:template>

    <xsl:template match="add-objectives-and-methods">
        <objectives-and-methods>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </objectives-and-methods>
    </xsl:template>

    <xsl:template match="prop">
        <xsl:copy>
            <xsl:apply-templates select="@ns,@name,@value,(@* except (@ns,@name,@value))"/>
            <xsl:if test="empty(@value)">
                <xsl:attribute name="value">
                    <xsl:apply-templates/>
                </xsl:attribute>
            </xsl:if>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="annotation">
        <prop>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </prop>
    </xsl:template>

    <xsl:template match="import/include[exists(all)]" priority="10">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="import/include">
        <include-controls>
            <!-- any becomes every -->
            <xsl:copy select="child::*/@with-child-controls[.='yes']"/>
            <xsl:apply-templates/>
        </include-controls>
    </xsl:template>

    <xsl:template match="import/exclude">
        <exclude-controls>
            <!-- any becomes every -->
            <xsl:copy select="child::*/@with-child-controls[.='yes']"/>
            <xsl:apply-templates/>
        </exclude-controls>
    </xsl:template>

    <xsl:template match="import/include/call | import/exclude/call">
        <with-id>
            <xsl:apply-templates select="@*"/>
            <xsl:text expand-text="true">{ @control-id }</xsl:text>
        </with-id>
    </xsl:template>

    <xsl:template match="import/include/call/@control-id | import/exclude/call/@control-id"/>

    <xsl:template match="import/include/all/@with-child-controls | import/include/call/@with-child-controls"/>

    <xsl:template match="import/exclude/all/@with-child-controls | import/exclude/call/@with-child-controls"/>

    <xsl:template match="import/include/match | import/exclude/match">
        <matching>
            <xsl:apply-templates select="@*"/>
            <!--<xsl:text expand-text="true">{ @pattern }</xsl:text>-->
        </matching>
    </xsl:template>

    <!-- assumption is made that all inserts are type param given rc1 @param-id -->
    <xsl:template match="insert">
        <insert type="param" id-ref="{ @param-id }">
            <!-- so as not to mess up when already updated -->
            <xsl:apply-templates select="@*"/>
        </insert>
    </xsl:template>

    <xsl:template match="insert/@param-id"/>

</xsl:stylesheet>
