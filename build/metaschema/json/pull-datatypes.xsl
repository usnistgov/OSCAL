<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.w3.org/2001/XMLSchema"
    version="3.0" xmlns="http://www.w3.org/2005/xpath-functions"
     expand-text="true">
    
    <xsl:output indent="yes"/>
        
    <xsl:strip-space elements="*"/>
    
    <xsl:preserve-space elements="documentation"/>
    
    <!-- Utility XSLT -->
    <!-- converts XSD from ../xml/oscal-datatypes.xsd into JSON Schema notation-->
    
    <xsl:template match="schema">
        <map>
            <xsl:apply-templates/>
        </map>
    </xsl:template>
    
    <xsl:template match="simpleType">
        <map key="{@name}">
            <xsl:apply-templates select="." mode="cast-type"/>
            <xsl:apply-templates/>
        </map>
    </xsl:template>
    
    <xsl:template match="annotation">
        <xsl:comment>
            <xsl:apply-templates/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="restriction">
        <xsl:apply-templates/>    
    </xsl:template>
    
    <xsl:template match="*" mode="cast-type">
        <string key="type">string</string>
    </xsl:template>
    
<!-- types shared by Metaschema and JSON Schema (format) -->
    <xsl:variable name="known-types" as="element()*">
        <type>date</type>
        <type>date-time</type>
        <type>email</type>
        <type>ipv4</type>
        <type>ipv6</type>
        <type>uri</type>
        <type>uri-reference</type>
    </xsl:variable>
    
    <xsl:template match="simpleType[@name=$known-types]" mode="cast-type">
        <string key="type">{ @name }</string>
    </xsl:template>
    
    <xsl:template match="simpleType[@name='hostname']" mode="cast-type">
        <string key="type">idn-hostname</string>
    </xsl:template>
    
    <xsl:template match="simpleType[@name='base64']">
        <string key="type">string</string>
    </xsl:template>
    
    <xsl:template match="whiteSpace"/>
        
    <xsl:template match="pattern">
        <string key="pattern">{ @value }</string>
    </xsl:template>
    
    <!--<xsl:template match="simpleType[@name=$known-types]" mode="cast-type">
        <string key="pattern">((2000|2400|2800|(19|2[0-9](0[48]|[2468][048]|[13579][26])))-02-29)|(((19|2[0-9])[0-9]{2})-02-(0[1-9]|1[0-9]|2[0-8]))|(((19|2[0-9])[0-9]{2})-(0[13578]|10|12)-(0[1-9]|[12][0-9]|3[01]))|(((19|2[0-9])[0-9]{2})-(0[469]|11)-(0[1-9]|[12][0-9]|30))(Z|[+-][0-9]{2}:[0-9]{2})</string>
    </xsl:template>-->
</xsl:stylesheet>