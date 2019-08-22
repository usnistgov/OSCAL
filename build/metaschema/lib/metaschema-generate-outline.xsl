<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nl "&#xa;">
]>
<!-- this template outputs a textual outline for a Metaschema model -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text" omit-xml-declaration="yes" indent="no"/>
    
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    <xsl:variable name="source" select="$composed-metaschema"/>
    
    <xsl:key name="definitions" match="$composed-metaschema//(define-assembly | define-field | define-flag)" use="@name"/>
    
    
    <xsl:template match="/">
        <xsl:value-of select="METASCHEMA/@root"/>
        <xsl:variable name="target" select="$composed-metaschema/METASCHEMA/define-assembly[@name = /METASCHEMA/@root]"/>
        
        <xsl:apply-templates select="$target" mode="type-and-flags"/>
        
        <xsl:text> - </xsl:text><xsl:value-of select="normalize-space($target/description)"/>
        <xsl:text>&nl;</xsl:text>
        
        <xsl:apply-templates select="$target/model/*">
            <xsl:with-param name="padding"><xsl:text>&#x20;&#x20;</xsl:text></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="define-assembly | define-field" mode="type-and-flags">
        <xsl:if test="@as-type and @as-type != 'string'"><xsl:text>:</xsl:text><xsl:value-of select="@as-type"/></xsl:if>

        <xsl:if test="flag">
            <xsl:text> (</xsl:text>
            <xsl:apply-templates select="flag"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="flag">
        <xsl:variable name="target" select="if (@ref) then key('definitions',@ref) else ."/>
        <xsl:value-of select="$target/@name"/>
        <xsl:if test="$target/@as-type and $target/@as-type != 'string'"><xsl:text>:</xsl:text><xsl:value-of select="$target/@as-type"/></xsl:if>
        <xsl:if test="not(@required) or @required=('no','false')"><xsl:text>?</xsl:text></xsl:if>
        <xsl:if test="following-sibling::flag"><xsl:text>,</xsl:text></xsl:if>
    </xsl:template>

    <xsl:template match="assembly | field">
        <xsl:param name="padding" required="yes"/>

        <xsl:variable name="target" select="if (@ref) then key('definitions',@ref) else ."/>
        <xsl:value-of select="$padding"/>
        <xsl:value-of select="$target/@name"/>

        <!-- handle cardinality -->
        <xsl:choose>
            <xsl:when test="(not(@min-occurs) or @min-occurs=0) and @max-occurs='unbounded'"><xsl:text>*</xsl:text></xsl:when>
            <xsl:when test="(@min-occurs=1) and @max-occurs='unbounded'"><xsl:text>+</xsl:text></xsl:when>
            <xsl:when test="(not(@min-occurs) or @min-occurs=0) and not(@maz-occurs) or @max-occurs=1"><xsl:text>?</xsl:text></xsl:when>
            <xsl:when test="(@min-occurs=1) and not(@maz-occurs) or @max-occurs=1"><!-- do nothing --></xsl:when>
            <xsl:otherwise><xsl:value-of select="concat('[',if (@min-occurs) then @min-occurs else '0','..',if (@msx-occurs) then @max-occurs else '0')"></xsl:value-of></xsl:otherwise>
        </xsl:choose>

        <xsl:apply-templates select="$target" mode="type-and-flags"/>

        <xsl:text> - </xsl:text><xsl:value-of select="normalize-space(if (description) then description else $target/description)"/>
        <xsl:text>&nl;</xsl:text>
        
        <xsl:apply-templates select="$target/model/*">
            <xsl:with-param name="padding"><xsl:value-of select="$padding"/><xsl:text>&#x20;&#x20;</xsl:text></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>  

    <xsl:template match="*"/>
</xsl:stylesheet>