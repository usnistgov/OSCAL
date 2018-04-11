<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
        <xsl:output use-character-maps="delimiters" method="text"/>
        
        <xsl:character-map name="delimiters">
            <xsl:output-character character="&lt;" string="\u003c"/>
            <xsl:output-character character="&gt;" string="\u003e"/>
        </xsl:character-map>
        
        <xsl:variable name="write-options" as="map(*)">
            <xsl:map>
                <xsl:map-entry key="'indent'">true</xsl:map-entry>
            </xsl:map>
        </xsl:variable>
        
        <xsl:template match="/">
            <json>
                <xsl:value-of select="xml-to-json(/, $write-options)"/>
            </json>
        </xsl:template>
        
    <!--<xsl:template match="/">
        <json>
            <xsl:value-of select="json-to-xml($jsonish)"/>
        </json>
    </xsl:template>
        <xsl:variable name="jsonish" as="xs:string">
            {
            "class": "assessment",
            "prose": [
            "\u003cp class=\"object\"\u003eSecurity awareness and training policy\u003c/p\u003e",
            "\u003cp class=\"object\"\u003eprocedures addressing security awareness training implementation\u003c/p\u003e",
            "\u003cp class=\"object\"\u003eappropriate codes of federal regulations\u003c/p\u003e",
            "\u003cp class=\"object\"\u003esecurity awareness training curriculum\u003c/p\u003e",
            "\u003cp class=\"object\"\u003esecurity awareness training materials\u003c/p\u003e",
            "\u003cp class=\"object\"\u003esecurity plan\u003c/p\u003e",
            "\u003cp class=\"object\"\u003etraining records\u003c/p\u003e",
            "\u003cp class=\"object\"\u003eother relevant documents or records\u003c/p\u003e"
            ],
            "props": [
            {
            "class": "method",
            "value": "EXAMINE"
            }
            ]
            }
        </xsl:variable>-->
</xsl:stylesheet>