<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    
    exclude-result-prefixes="xs math m"
    version="3.0">
    
    <xsl:output indent="yes"/>
<!-- Utility stylesheet for Metascheme docs generation.   -->
    
    <xsl:template match="/">
        <ul>
          <xsl:apply-templates select="$tests/*" mode="test"/>
        </ul>
    </xsl:template>
    
    <xsl:variable name="tests">
        <field name="implicit-required" min-occurs="1"/>
        <field name="optional-one-only" min-occurs="0" max-occurs="1"/>
        <field name="optional-unbounded" min-occurs="0" max-occurs="unbounded"/>
        <field name="at-least-three-unbounded" min-occurs="3" max-occurs="unbounded"/>
        <field name="required-one-only" min-occurs="1" max-occurs="1"/>
        <field name="one-or-two" min-occurs="1" max-occurs="2"/>
        <field name="required-ten-or-less" min-occurs="1" max-occurs="10"/>
        <field name="exactly-five" min-occurs="5" max-occurs="5"/>
        <field name="a-myriad-at-most" min-occurs="0" max-occurs="10000"/>
    </xsl:variable>
    
    <xsl:template match="*" mode="test">
        <li xsl:expand-text="true">{ @name } -- <xsl:apply-templates select="." mode="occurrence-requirements"/></li>
    </xsl:template>
    
    <!-- Returns true when a field must become an object, not a string, due to having
     flags that must be properties. -->
    <xsl:function name="m:has-properties" as="xs:boolean">
        <xsl:param name="who" as="element(m:field)"/>
        <xsl:sequence select="exists($who/flag[not((@name|@ref)=../(json-key | json-value-key)/@flag-name)])"/>
    </xsl:function>
    
    
    <xsl:template mode="occurrence-requirements" match="*">
            <xsl:text>(</xsl:text>
            <xsl:apply-templates select="@min-occurs" mode="#current"/>
            <xsl:if test="empty(@min-occurs)">optional</xsl:if>
            <xsl:text>, </xsl:text>
            <xsl:apply-templates select="@max-occurs" mode="#current"/>
            <xsl:if test="empty(@max-occurs)">one only</xsl:if>
            <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" priority="2" match="*[@max-occurs='1' and @min-occurs='1']">
        <xsl:text>required, one (1) only</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" priority="1" match="*[@max-occurs=@min-occurs]">
        <xsl:text expand-text="true">required, exactly { m:spell-number(@min-occurs) }</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@min-occurs[.='0']">
        <xsl:text>optional</xsl:text>
    </xsl:template>
    
    <!--<xsl:template mode="occurrence-requirements" match="@min-occurs[empty(../@max-occurs) or ../@max-occurs='1']">
        <xsl:text>required</xsl:text>
    </xsl:template>-->
    
    <xsl:template mode="occurrence-requirements" match="@min-occurs">
        <xsl:text>required, at least </xsl:text>
        <xsl:value-of select="m:spell-number(.)"/>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@max-occurs[.='unbounded']">
        <xsl:text>as many as needed</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@max-occurs[.='1']"> one only</xsl:template>
        
    <xsl:template mode="occurrence-requirements" match="@max-occurs">
        <xsl:text expand-text="true">{ m:spell-number(.)} at most</xsl:text>
    </xsl:template>

    <xsl:function name="m:spell-number" as="xs:string">
        <xsl:param name="no" as="xs:integer"/>
        <xsl:variable name="num-year-string" select="format-number($no,'0001') || '-01-01'"/>
        <xsl:value-of>
            <xsl:sequence select="format-date(xs:date($num-year-string), '[Yw]')"/>
            <xsl:text expand-text="true"> ({ $no })</xsl:text>
        </xsl:value-of>
    </xsl:function>

</xsl:stylesheet>