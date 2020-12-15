<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!-- reassign uuids:
    
    build a map from every @uuid (string value) to a new UUID
    rewrite UUIDs and references to them by reference to it
    
    -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="/">
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:variable name="new-uuids" as="map(xs:string, xs:string)">
        <xsl:map>
            <!-- only contains entries if every @uuid is distinct -->
            <xsl:if test="count(//@uuid) eq count(//@uuid => distinct-values())">
                <xsl:apply-templates mode="make-map" select="//@uuid"/>
            </xsl:if>
        </xsl:map>
    </xsl:variable>
    
    <xsl:template mode="make-map" match="@uuid" expand-text="true">
        <xsl:map-entry key="string(.)" xmlns:uuid="java:java.util.UUID">{ uuid:randomUUID() }</xsl:map-entry>
    </xsl:template>

    <!-- to drop certain uuids from the map:
      <xsl:template mode="make-map" match="back-matter/resource/@uuid"/>-->

    <!-- scrubbing initial comments -->
    <xsl:template match="/comment()"/>

    <!-- time stamping last-modified date -->
    <xsl:template match="last-modified" priority="2" expand-text="true">
        <last-modified>{ current-dateTime() }</last-modified>
    </xsl:template>
    
    <!-- adding a new UUID -->
    <xsl:template match="@uuid">
        <xsl:attribute name="uuid" select="$new-uuids(string(.))"/>
    </xsl:template>

   <!-- Match a text-only element or any attribute whose string value
        corresponds to a UUID elsewhere in the (same) document with the corresponding
        entry from the $new-uuids. -->
    <xsl:template match="*[empty(*)][exists($new-uuids(string(.)))] | @*[exists($new-uuids(string(.)))]">
        <xsl:message expand-text="true">UPDATING { name() } POINTING TO { . } WITH { $new-uuids(string(.)) } </xsl:message>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:value-of select="$new-uuids(string(.))"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>