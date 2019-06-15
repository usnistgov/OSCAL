<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0" xmlns="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" expand-text="true">

    <xsl:strip-space elements="METASCHEMA define-assembly define-field model"/>
    
    <xsl:output indent="yes" method="text"/>
    
    <xsl:import href="json-schema-metamap.xsl"/>
    
    <xsl:variable name="write-options" as="map(*)">
        <xsl:map>
            <xsl:map-entry key="'indent'">true</xsl:map-entry>
        </xsl:map>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:variable name="xpath-json">
            <xsl:apply-templates/>
        </xsl:variable>
        <!-- Running through a filter for specialized string handling -->
        <!--<xsl:copy-of select="$xpath-json"/>-->
        <json>
        <!-- Then post-processing the JSON to un-double-escape ... -->
            <xsl:value-of select="xml-to-json($xpath-json, $write-options) => replace('\\\\\\&quot;','\\&quot;') => replace('\\/','/')"/>
        </json>
    </xsl:template>
    
    <xsl:template match="string">
        <xsl:value-of select=". ! replace(.,'\\&quot;','\\\\\\&quot;')"/>
    </xsl:template>
</xsl:stylesheet>