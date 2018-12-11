<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    
    >
    
<!-- Purpose: Produce an XSLT offering structural validation of JSON
        against containment constraints declared in metaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting validation. When a JSON file is provided,
        a set of validation messages is emitted. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>
    
    
    <xsl:key name="callers-by-flags" match="define-field | define-assembly" use="flag/@name"/>
    
    <xsl:template match="METASCHEMA">
        <xslt:stylesheet version="3.0"
            xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
            exclude-result-prefixes="#all">
            
            <xslt:output indent="yes" method="xml"/>
            
            <xsl:comment> METASCHEMA validation stylesheet supports validation of JSON against metaschema constraints </xsl:comment>
            
            <xsl:comment> HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
    </xsl:template>
    
    <xsl:template match="title"/>
    
    <xsl:template match="/METASCHEMA/*" priority="-0.2"/>
    
    <!--<xsl:template match="define-flag" expand-text="true">
        <!-\- Flags won't be producing elements in the regular traversal -\->
        <xsl:comment> HHH Handling flag "{ @name }" 000 </xsl:comment>
        
        <xslt:template match="*[@key='{@name}']" mode="json2xml"/>
        <xsl:variable name="match-step" expand-text="yes" as="xs:string">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="match-patterns" as="xs:string*">
            <xsl:for-each select="key('callers-by-flags',@name)">
                <xsl:value-of>
                    <xsl:text>*[@key='{@name}']/{$match-step}</xsl:text>
                    <xsl:if test="matches(@group-as, '\i\c*')">
                        <xsl:text> | *[@key='{@group-as}']/*/{$match-step}</xsl:text>
                    </xsl:if>
                </xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
        <xslt:template match="{string-join($match-patterns,' | ')}" mode="as-attribute">
            <xslt:attribute name="{@name}">
                <xslt:apply-templates mode="#current"/>
            </xslt:attribute>
        </xslt:template>
    </xsl:template>-->
        
    
    
    <xsl:template match="define-assembly | define-field | define-flag" expand-text="true">
        <xsl:variable name="match" as="xs:string">*[@key='{@name}']{ @group-as/(' | *[@key=''' || . || ''']') }{ @group-as/(' | array[@key=''' || . || ''']/map') }</xsl:variable>
        <xslt:template match="{$match}" priority="2" mode="proof">
            
            <!-- Having matched, we know we have a matching declaration; next is to see
            whether everything else is okay -->
          <!-- do we have a corresponding mention in a content model? -->
            <xslt:call-template name="check-for-declaration"/>
            <xslt:apply-templates mode="proof"/>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-assembly[exists(@address)] | define-field[exists(@address)]" expand-text="true">
        <xsl:next-match/>
        
<!-- By writing into 'matchmake' mode we make it possible to match declarations against nodes
        with specialized (@address) labels -->
        
        <xslt:template match="*[@key='{@group-as}']/map" priority="2" mode="proof">
            <xslt:call-template name="check-for-declaration"/>
            <xslt:apply-templates mode="proof"/>
        </xslt:template>
        
<!-- Next, special casing the match paths for declarations of things related to addressable maps
        (used as proxies for array members) -->
        <xslt:template match="map[@key='{@group-as}']/map" mode="matchmake">
            <xslt:sequence select="../../../@key || '/' || parent::map/@key"/>
        </xslt:template>
        
        <xslt:template match="map[@key='{@group-as}']/map/*" mode="matchmake">
            <xslt:sequence select="../parent::map/@key || '/' || @key"/>
        </xslt:template>
        <xslt:template match="map[@key='{@group-as}']/map/*/map" priority="10" mode="matchmake">
            <xslt:sequence select="../../parent::map/@key || '/' || ../@key"/>
        </xslt:template>
        
    </xsl:template>
    
    <!--
    <xsl:template name="drop-address">
        <!-\- When a flag is promoted as an address, it appears in the JSON as a label, so no attribute should be made in the regular traversal. -\->
        <xsl:if test="matches(@address, '\i\c*')">
            <xslt:template mode="as-attribute" priority="2"
                match="*[@key='{@name}']/string[@key='{@address}']{ @group-as/(' | ' || '*[@key=''' || . || ''']/*/string[@key=''{@address}'']') }"
            />
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="define-flag/* | define-field/* | define-assembly/*"/>
    
    
    <xsl:template match="model | choice" priority="2">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="model//*">
        <xslt:apply-templates mode="#current" select="*[@key=({string-join((@named/('''' ||. || ''''),@group-as/('''' || . || '''')),', ')})]"/>    
    </xsl:template>
    
    <xsl:template match="model/prose" priority="2">
        <xslt:apply-templates mode="#current" select="*[@key='prose']"/>    
    </xsl:template>
    
    <xsl:template match="define-field" expand-text="true">
        <xsl:variable name="field-match" as="xs:string">*[@key='{@name}']{ @group-as/(' | *[@key=''' || . || ''']/*') }{ if (@name=../@root) then ' | /map[empty(@key)]' else ''}</xsl:variable>
        <xsl:comment> 000 Handling field "{ @name }" 000 </xsl:comment>
        <xslt:template match="{$field-match}" priority="2" mode="json2xml">
            <xslt:element name="{@name}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
                <xsl:for-each select="@address">
                    <xslt:attribute name="{.}" select="../@key"/>
                </xsl:for-each>
                <xslt:apply-templates mode="as-attribute"/>
                <xsl:apply-templates/>
                <xslt:apply-templates mode="json2xml" select="*[@key={ if (@as='mixed') then '''TEXT''' else '''VALUE''' }]"/>
            </xslt:element>
        </xslt:template>
        <xsl:call-template name="drop-address"/>
    </xsl:template>-->
    
    <xsl:template match="formal-name | description | remarks | example | @show-docs" mode="schematic"/>
    
    <xsl:template match="model" mode="schematic">
        <xsl:apply-templates mode="schematic"/>
    </xsl:template>
    
    <xsl:mode name="schematic" on-no-match="shallow-copy"/>
    
    <xsl:template name="furniture">
        
        <xslt:output indent="yes"/>
        
        <xslt:strip-space elements="*"/>
        <xslt:preserve-space elements="string"/>
        
        <xslt:param name="json-file" as="xs:string?"/>
        
        <xslt:variable name="schematic">
            <xsl:apply-templates select="/*" mode="schematic"/>
        </xslt:variable>
        
        <xslt:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/>
        
        <xslt:key name="declaration-references"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            match="flag"
            use="(../@name || '/' || @name), (../@group-as || '/' || @name)"/>
        <xslt:key name="declaration-references"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            match="field | assembly | fields | assemblies"
            use="parent::choice/../@name || ../@named || '/' || @named"/>
        <xslt:key name="declaration-references"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            match="field | assembly | fields | assemblies"
            use="parent::choice/../@group-as || ../@group-as || '/' || @named"/>
        <xslt:key name="declaration-references"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            match="fields | assemblies"
            use="parent::choice/../@name || ../@name || '/' || @group-as"/>
        <xslt:key name="declaration-references"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            match="fields | assemblies"
            use="parent::choice/../@group-as || ../@group-as || '/' || @group-as"/>
        
        <xslt:template match="*" mode="matchmake">
            <xslt:sequence select="../@key || '/' || @key"/>
        </xslt:template>
        
        <xslt:template match="array/map" mode="matchmake">
            <xslt:sequence select="../../parent::array/@key || '/' || ../@key"/>
        </xslt:template>
        
        <xslt:template match="array/map/*" mode="matchmake">
            <xslt:sequence select="../parent::array/@key || '/' || @key"/>
        </xslt:template>

        <xslt:template match="array/map/array/map" priority="10" mode="matchmake">
            <xslt:sequence select="../../parent::array/@key || '/' || parent::*/@key"/>
        </xslt:template>
        
        
        <xslt:template name="check-for-declaration" expand-text="true">
            <xslt:variable name="matches">
                <xslt:apply-templates mode="matchmake" select="."/>
            </xslt:variable>
            <!-- need to extend match for when @key is commandeered by @address     -->
            <xslt:variable name="references"
                select="key('declaration-references',$matches,$schematic)"/>
            <xslt:if test="empty($references)">
                <message>{ name() }[{ @key/('@key=''' || string(.) || '''') }] is not expected here - $matches={ $matches }</message>
            </xslt:if>
        </xslt:template>
        
       <xslt:template match="/">
            <xslt:choose>
                <xslt:when test="exists($json-xml/map)">
                    <xslt:apply-templates select="$json-xml" mode="proof"/>
                </xslt:when>
                <xslt:otherwise>
                    <xslt:apply-templates mode="proof"/>
                </xslt:otherwise>
            </xslt:choose>
        </xslt:template>
        
        <xslt:template match="*" mode="proof" expand-text="yes">
            <message>No declaration found for { name() }[{ @key/('@key=''' || string(.) || '''') }]</message>
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template match="array[@key='prose'] | array[@key='prose']/string " mode="proof">
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template match="string[@key='STRVALUE'] | string[@key='RICHTEXT']" mode="proof">
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template match="text()" mode="proof"/>
    </xsl:template>
    
        <!--<xslt:template match="array" mode="json2xml">
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template match="array[@key='prose']/*" priority="5" mode="json2xml">
            <xsl:comment> This will have to be post-processed to render markdown into markup </xsl:comment>
            <xslt:element name="p" namespace="http://csrc.nist.gov/ns/oscal/1.0">
                <xslt:apply-templates mode="#current"/>
            </xslt:element>
        </xslt:template>
        
        <xslt:template match="string[@key='RICHTEXT']" mode="json2xml">
            <xslt:comment> Not yet handling markdown </xslt:comment>
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template match="string[@key='STRVALUE']" mode="json2xml">
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        
        <xslt:template mode="as-attribute" match="*"/>
        
        <xslt:template mode="as-attribute" match="map">
            <xslt:apply-templates mode="#current"/>
        </xslt:template>
        
        <xslt:template mode="as-attribute"  match="string[@key='id']" priority="0.4">
            <xslt:attribute name="id">
                <xslt:apply-templates mode="#current"/>
            </xslt:attribute>
        </xslt:template>-->
        
    
</xsl:stylesheet>