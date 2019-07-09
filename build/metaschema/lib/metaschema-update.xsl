<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" 
    xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0" 
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Converts and old-style metaschema (up to Sprint 21) into a new-style metaschema (Sprint 22) -->
    
    <xsl:output indent="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:preserve-space elements="formal-name description p pre"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:key name="definition-by-name" match="define-assembly | define-field | define-flag" use="@name"/>
    
    <xsl:template match="/*">
        <xsl:text>&#xA;</xsl:text>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            
            <xsl:if test="exists(//prose)">
                <define-field name="prose" as-type="markup-multiline">
                    <formal-name>Prose</formal-name>
                    <description>Prose permits multiple paragraphs, lists, tables etc.</description>
                </define-field>
            </xsl:if>
        </xsl:copy>
        
    </xsl:template>
    <xsl:template match="/comment() | /processing-instruction()">
        <xsl:text>&#xA;</xsl:text>
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template match="@datatype | @as">
        <xsl:attribute name="as-type">
            <xsl:apply-templates select="." mode="cast-type"/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@*" mode="cast-type">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="@*[.='anyURI']" mode="cast-type">uri-reference</xsl:template>
    
    <xsl:template match="@as[.='mixed']">
        <xsl:attribute name="as-type">markup-line</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="@named">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <!--https://github.com/usnistgov/OSCAL/issues/442-->
    <xsl:template match="flag/@name">
        <xsl:attribute name="ref">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    <xsl:template match="define-assembly | define-field |define-flag">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="formal-name | description"/>
            <xsl:apply-templates select="* except (formal-name | description | remarks | example)"/>
            <xsl:apply-templates select="remarks | example"/>
        </xsl:copy>
        
    </xsl:template>

    <xsl:template match="field[@required='yes'] | assembly[@required='yes']">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="min-occurs">1</xsl:attribute>
            <xsl:apply-templates select="." mode="group-as"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="*" mode="group-as">
        <xsl:for-each select="key('definition-by-name',(@named|@ref))/@group-as">
            <group-as name="{ . }"/>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="prose">
        <field ref="prose"/>
    </xsl:template>
    
    <xsl:template match="fields">
        <field>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="max-occurs">unbounded</xsl:attribute>
            <xsl:apply-templates select="." mode="group-as"/>
        </field>
    </xsl:template>
    
    <xsl:template match="assemblies">
        <assembly>
            <xsl:apply-templates select="@*"/>
            <xsl:attribute name="max-occurs">unbounded</xsl:attribute>
            <xsl:apply-templates select="." mode="group-as"/>
        </assembly>
    </xsl:template>
    
    <xsl:template match="field | assembly">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
            <xsl:apply-templates select="." mode="group-as"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="define-field/@group-as | define-assembly/@group-as"/>
    
    <xsl:template match="field/@required | fields/@required | assembly/@required | assemblies/@required">
        <xsl:attribute name="min-occurs">1</xsl:attribute>
    </xsl:template>
    
    <xsl:template match="flag">
        <xsl:for-each select="value-key">
            <json-value-key flag-name="{ ../(@name|@ref)}"/>
        </xsl:for-each>
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template match="key">
        <json-key flag-name="{@name}"/>
        <flag name="{@name}">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </flag>
    </xsl:template>
    
    <xsl:template match="define-field/value-key">
        <json-value-key>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </json-value-key>
    </xsl:template>
    
    <xsl:template match="flag/value-key"/>
    
    <xsl:template match="value-key/@name">
        <xsl:attribute name="flag-name">
            <xsl:value-of select="."/>
        </xsl:attribute>
    </xsl:template>
    
    
</xsl:stylesheet>