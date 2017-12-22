<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math oscal xsi"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/> 
    
    <xsl:template match="@xsi:*"/>
    
    <xsl:template match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/comment() | /processing-instruction()">
        <xsl:text>&#xA;</xsl:text>
        <xsl:next-match/>
    </xsl:template>
    
    <xsl:template match="profile">
        <xsl:text>&#xA;</xsl:text>
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@*"/>
            <xsl:attribute xmlns:uuid="java:java.util.UUID" name="id" select="'uuid-' || uuid:randomUUID()"/>
            <xsl:apply-templates/>
            <xsl:if test="exists(invoke/(set-param | alter))">
                <modify>
                    <xsl:apply-templates select="invoke" mode="modifications"/>
                </modify>
            </xsl:if>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="invoke">
        <import>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </import>
    </xsl:template>
    
    <xsl:template match="invoke/set-param | invoke/alter"/>
    
    <xsl:template match="invoke/comment() | invoke/text()">
        <xsl:if test="exists(following-sibling::include | following-sibling::exclude)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="invoke" mode="modifications">
        <xsl:copy-of select="(include|exclude)[last()]/following-sibling::node()" copy-namespaces="no"/>
    </xsl:template>
    
</xsl:stylesheet>