<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">

    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="value regex autonum"/>
    
    <xsl:variable name="context-doc" select="document('NIST_SP-800-53_rev4_catalog.xml')"/>
    
    <xsl:output indent="yes"/>
    <!--declarations
        
        declare-part
        declare-prop
        declare-p
        
        required
        
        singleton
        regex
        calc
          inherit
          autonum
        value-->
    
    <xsl:template match="/declarations">
        <sch:schema queryBinding="xslt2">

            <sch:ns prefix="o" uri="http://csrc.nist.gov/ns/oscal/1.0"/>

            <xsl:for-each-group select="*/required/.." group-by="true()">
                <sch:pattern id="required-items">
                    <!--<xsl:variable name="contexts" select="current-group()/@context"/>-->
                    <xsl:for-each-group select="current-group()" group-by="@context">

                        <xsl:variable name="context-name" select="current-grouping-key()"/>
                        <xsl:variable name="context-gi"
                            select="$context-doc/descendant::*[(@name | @class) = $context-name][1]/local-name()"/>
                        <sch:rule>
                            <xsl:attribute expand-text="true" name="context"
                                >o:{$context-gi}[@name='{$context-name}']</xsl:attribute>
                            <xsl:for-each-group select="current-group()"
                                group-by="substring-after(local-name(), 'declare-')">
                                <xsl:variable name="target-gi" select="current-grouping-key()"/>

                                <xsl:for-each-group select="current-group()" group-by="@class">
                                    <xsl:variable name="required-name"
                                        select="current-grouping-key()"/>
                                    <sch:assert test="o:{ $target-gi}/@name='{ $required-name }'">
                                        <xsl:text expand-text="yes">{$context-gi} with name='{$context-name}' must have a child '{ $target-gi }' with @name='{$required-name}'</xsl:text>
                                    </sch:assert>
                                </xsl:for-each-group>
                            </xsl:for-each-group>
                        </sch:rule>
                    </xsl:for-each-group>
                </sch:pattern>
            </xsl:for-each-group>

            <xsl:for-each-group select="*[exists(singleton | regex | calc | value)]" group-by="true()">
                <sch:pattern id="appearances">
                    <xsl:apply-templates select="current-group()" mode="as-appearing"/>
                </sch:pattern>
            </xsl:for-each-group>
        </sch:schema>
    </xsl:template>
    
    <xsl:template mode="as-appearing" match="declare-prop">
            <xsl:variable name="decl" select="."/>
            <xsl:for-each select="tokenize(@class, '\s+')">
                <xsl:variable name="target-name" select="."/>
                <xsl:variable name="contexts" select="tokenize($decl/@context,'\s+') !  ('''' || . || '''')"/>
                
                <xsl:variable name="assertions" as="element()*">
                    <xsl:apply-templates select="$decl/*" mode="#current">
                        <xsl:with-param name="target-name" select="$target-name"/>
                        <xsl:with-param name="contexts" select="$contexts"/>
                    </xsl:apply-templates>
                    
                    <xsl:if test="exists($decl/value)">
                        <xsl:variable name="value-strings" select="$decl/value ! ('''' || . || '''')"/>
                        <sch:assert xsl:expand-text="true"
                            test=". = ({ string-join($value-strings,',') })">prop name='{ $target-name
                            }' here must have a value { o:or-sequence( $value-strings) }</sch:assert>
                    </xsl:if>
                    
                </xsl:variable>
                <xsl:if test="exists($assertions)">
                    <sch:rule context="*[(@name|@class)=({string-join($contexts,',')})]/o:prop[@name='{ $target-name }']">
                      <xsl:sequence select="$assertions"/>
                </sch:rule>
                </xsl:if>
            </xsl:for-each>
    </xsl:template>

    <xsl:template mode="as-appearing" match="declare-prop/singleton">
        <xsl:param name="target-name"/>
        <xsl:param name="contexts"/>
        <sch:assert xsl:expand-text="true"
            test="empty(../o:prop[@name='{$target-name}'] except .)">prop with name='{$target-name}' must be a singleton: no other properties named '{$target-name}' may appear in the same context</sch:assert>
    </xsl:template>
    
    <xsl:template mode="as-appearing" match="declare-prop/regex">
        <xsl:param name="target-name"/>
        <sch:assert xsl:expand-text="true"
            test="matches(.,'{.}')">prop with name='{$target-name}' must match regular expression '{ . }'</sch:assert>
    </xsl:template>

    <xsl:template mode="as-appearing" match="declare-part | declare-p">
        <!--<xsl:apply-templates mode="#current"/>-->
    </xsl:template>
    
    <xsl:template mode="as-appearing" match="calc">
        
    </xsl:template>
    
    <xsl:template mode="as-appearing" match="value">
        
    </xsl:template>
    
    <xsl:function name="o:or-sequence" as="xs:string?">
        <xsl:param name="seq" as="item()*"/>
        <xsl:value-of>
        <xsl:for-each select="$seq">
            <xsl:if test="position() ne 1">
                <xsl:choose>
                    <xsl:when test="(position() eq 2 and last() eq 2)"> or </xsl:when>
                    <xsl:when test="position() = last()">, or </xsl:when>
                    <xsl:otherwise>, </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:value-of select="."/>
        </xsl:for-each>
        </xsl:value-of>
    </xsl:function>
    
<!-- Unfinished! implementation of calculation logic. (We have only one so far so we do it by hand.)  -->
    <!--<xsl:template match="calc" mode="calculate">
        <xsl:copy>
            <xsl:apply-templates mode="calculate"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="inherit" mode="calculate">
        <xsl:param name="who-cares" required="yes" tunnel="yes"/>
        <xsl:variable name="named-classes" select="tokenize(@from/normalize-space(string(.)),'\s')"/>
        <xsl:variable name="matching-classes" select="if (empty($named-classes))
            then parent::calc/parent::declare-prop/oscal:classes(.) else $named-classes"/>
        
        <xsl:variable name="forebear"
            select="$who-cares/../ancestor::*[prop/oscal:classes(.)=$matching-classes][1]/
            prop[oscal:classes(.)=$matching-classes]"/>
        <xsl:value-of select="normalize-space($forebear)"/>
        <xsl:if test="empty($forebear)">[RESOLUTIONFAIL]</xsl:if>
    </xsl:template>
    
    <xsl:template match="autonum" mode="calculate">
        <xsl:param name="who-cares" required="yes" tunnel="yes"/>
        <xsl:param name="call" select="."/>
        <xsl:variable name="expanded">
            <!-\- single level numbering of element among its siblings of the same name. -\->
            <xsl:for-each select="$who-cares/..">
                <xsl:variable name="among" select="oscal:classes(.)"/>
                <xsl:number format="{($call/string(.),'A')[1]}" count="*[oscal:classes(.)=$among]"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="normalize-space($expanded)"/>
    </xsl:template>-->
    
    
</xsl:stylesheet>