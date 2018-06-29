<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0" xmlns="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" expand-text="true">

    <xsl:strip-space elements="METASCHEMA define-assembly define-field model"/>
    
    <xsl:output indent="yes" method="text" use-character-maps="safe"/>
    
    <xsl:import href="json-schema-metamap.xsl"/>
    
    <xsl:character-map name="safe">
        <!--<xsl:output-character character="&lt;" string="\u003c"/>
        <xsl:output-character character="&gt;" string="\u003e"/>-->
        <!-- Force unescaping       -->
        <xsl:output-character character="\" string=""/>
    </xsl:character-map>
    <!-- <xsl:variable name="metaschema" select="document('implementation-metaschema.xml')"/>-->

    <xsl:variable name="write-options" as="map(*)">
        <xsl:map>
            <xsl:map-entry key="'indent'">true</xsl:map-entry>
        </xsl:map>
    </xsl:variable>

    
    <xsl:template match="/">
        <xsl:variable name="xpath-json">
            <xsl:apply-templates/>
        </xsl:variable>
        <json>
            <xsl:value-of select="xml-to-json($xpath-json, $write-options)"/>
        </json>
    </xsl:template>

    
</xsl:stylesheet>