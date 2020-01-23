<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
    version="3.0">
    
    <xsl:param name="json-indent" as="xs:string">no</xsl:param>
    
    <xsl:output method="text"/>
    
    <xsl:mode name="compact" on-no-match="shallow-copy"/>
    
    <xsl:mode name="promote" on-no-match="shallow-copy"/>
    
    <xsl:variable name="metaschema" select="document('../../../../src/metaschema/oscal_catalog_metaschema.xml')"/>
   
    <xsl:variable name="write-options" as="map(*)" expand-text="true">
        <xsl:map>
            <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
        </xsl:map>
    </xsl:variable>
    
    <xsl:template match="/" mode="debug">
        <xsl:apply-templates mode="compact"/>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:variable name="reduced-json">
            <xsl:apply-templates mode="compact"/>
        </xsl:variable>
        <json>
            <xsl:value-of select="xml-to-json($reduced-json, $write-options)"/>
        </json>
    </xsl:template>
    
    <xsl:key name="defs-for-group" xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
        match="define-assembly | define-field" use="@group-as"/>
    
    <xsl:template match="array[map]" mode="compact">
        <xsl:variable name="my-key" select="@key"/>
        <xsl:variable name="singles" as="element()*">
        <xsl:for-each-group select="map" group-by="string[@key='class']">
            <xsl:if test="count(current-group()) eq 1">
                <xsl:sequence select="current-group()"/>
            </xsl:if>
        </xsl:for-each-group>
        </xsl:variable>
        <xsl:apply-templates select="$singles" mode="promote"/>
        <xsl:for-each-group select="* except $singles" group-by="true()">
            <array key="{$my-key}">
                <xsl:apply-templates mode="compact" select="current-group()"/>
            </array>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template priority="2" match="map[empty(* except string[@key=('class','STRVALUE','RICHTEXT')])]" mode="promote">
        <string key="{string[@key='class']}">
            <xsl:for-each select="string[@key=('STRVALUE','RICHTEXT')]">
                <xsl:apply-templates mode="#current"/>
            </xsl:for-each>
        </string>
    </xsl:template>
    
    <xsl:template match="map" mode="promote">
        <map key="{string[@key='class']}">
            <xsl:apply-templates mode="compact" select="* except string[@key='class']"/>
        </map>
    </xsl:template>
    
    <xsl:template match="array/map[empty(* except string[@key = ('STRVALUE','RICHTEXT')] )]" mode="compact">
        <string>
            <xsl:for-each select="string[@key=('STRVALUE','RICHTEXT')]">
                <xsl:apply-templates/>
            </xsl:for-each>
        </string>
    </xsl:template>
    
    <!--<xsl:template mode="compact" priority="2"
        match="array[count(map) = 1]">
        <xsl:variable name="def" select="key('defs-for-group',@key,$metaschema)"/>
        <map key="{$def/@name}">
            <xsl:for-each select="map">
                <xsl:apply-templates mode="compact"/>
            </xsl:for-each>
        </map>
    </xsl:template>-->
    
<!-- Options:
      1. given prior knowledge re: 'class',
      promote anything that isn't duplicated (greedy promotion)
      - how to get back to XML in that case?
      - also how to model this so we can validate it via external spec?
        (i.e. w/o running the conversion and seeing)
      2. Support greedy conversions w/ 'sniffing' back the other way
          against metaschema and purported declarations file
      3. Support only conversions that are reversible given metaschema
           e.g. 'addressing' w/o reference to declarations...
           
           Other strategies for managing data bloat:
           
           1. Demonstrate other filters/reductions
              e.g. removing objectives/assessments
                Put a catalog on the web w/ an API?
           2. Publish cross-sections separately to help
           
    -->
   <!-- <xsl:template mode="compact" priority="3"
        match="map/map[empty(* except *[@key = ('STRVALUE','class')] )]">
        <xsl:variable name="def" select="key('defs-for-group',@key,$metaschema)"/>
        <string key="{*[@key='class']}">
            <xsl:for-each select="*[@key = 'STRVALUE']">
                <xsl:apply-templates mode="#current"/>
            </xsl:for-each>
        </string>
    </xsl:template>-->
    
    <!--<xsl:template mode="compact" priority="1"
        xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
        match="array[count(map) = 1]">
        <map key="{map/@key (: or use another address :)}">
            <xsl:for-each select="map">
                <xsl:apply-templates mode="#current"/>
            </xsl:for-each>
        </map>
    </xsl:template>-->
    
    <!--<xsl:template mode="compact" priority="2"
        xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
        match="map[not(*/@key != 'STRVALUE')] | map[not(*/@key != 'RICHTEXT')]">
        <string key="{@key (: or use another address :)}">
            <xsl:for-each select="*[@key = ('STRVALUE','RICHTEXT')]">
                <xsl:apply-templates mode="#current"/>
            </xsl:for-each>
        </string>
    </xsl:template>-->
</xsl:stylesheet>