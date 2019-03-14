<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- Controls indenting -->
    <xsl:output method="xhtml" omit-xml-declaration="true" indent="no"/>
    
    <xsl:variable name="source" select="/"/>
    <xsl:variable name="metaschema-code" select="$source/*/short-name"/>
    
    <!--"C:\Users\wap1\Documents\OSCAL\docs_jekyll_uswds\content\documentation\schemas\oscal-catalog\catalog.md"-->
    <xsl:variable name="result-path" select="'../../../docs/content/documentation/schemas/_' || $metaschema-code"/>
    
    <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->
    <xsl:variable name="xslt">
        <xsl:variable name="runtime"   select="map {
            'xslt-version'        : 3.0,
            'stylesheet-location' : 'produce-metaschema-documentor.xsl',
            'source-node'         : $source }" />
        
        <xsl:sequence select="transform($runtime)?output"/>
    </xsl:variable>
    
    <!-- XPath 3.1 transform() is documented here: https://www.w3.org/TR/xpath-functions-31/#func-transform   -->
    <xsl:variable name="html-docs">
        <!-- to assign a base URI for the XSLT in memory -->
        <xsl:variable name="xslt-uri" select="resolve-uri(( $metaschema-code || '-metaschema-documentor.xsl'))"/>
        <xsl:variable name="runtime"   select="map {
            'xslt-version'       : 3.0,
            'stylesheet-base-uri': $xslt-uri,
            'stylesheet-node'    : $xslt,
            'source-node'        : $source }" />
        <xsl:sequence select="transform($runtime)?output"/>
        
    </xsl:variable>
    
    <xsl:template match="/">
        <!--<xsl:message expand-text="true"> { resolve-uri($result-path, document-uri(/)) }</xsl:message>-->
        <xsl:result-document href="{$result-path}/{ $metaschema-code }.html">
            <xsl:text>---&#xA;</xsl:text>
            <xsl:text expand-text="true">title: { $metaschema-code } schema documentation &#xA;</xsl:text>
            <xsl:text expand-text="true">description: { $metaschema-code } schema documentation &#xA;</xsl:text>
            <!--<xsl:text expand-text="true">permalink: /documentation/schemas/{ $metaschema-code }/&#xA;</xsl:text>-->
            <xsl:text expand-text="true">permalink: /docs/schemas/_{ $metaschema-code }/&#xA;</xsl:text>
            <xsl:text expand-text="true">layout: post&#xA;</xsl:text>
            <xsl:text expand-text="true">schema: { $metaschema-code }&#xA;</xsl:text>
            <xsl:text>---&#xA;</xsl:text>
            <xsl:sequence select="$html-docs/*/html:body/(* except child::html:div[contains-token(@class,'definition')])"/>
        </xsl:result-document>
        <xsl:for-each select="$html-docs/*/html:body/html:div[contains-token(@class,'definition')]">
            <xsl:result-document href="{$result-path}/{ $metaschema-code }_{@id}.html"
               method="html">
                <xsl:call-template name="yaml-header"/>
                <xsl:apply-templates select="." mode="unescape"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="yaml-header">
        <xsl:text>---&#xA;</xsl:text>
        <xsl:text expand-text="true">title: { $metaschema-code } { @id } documentation &#xA;</xsl:text>
        <xsl:text expand-text="true">tagname: { @id }&#xA;</xsl:text>
        <xsl:text expand-text="true">description: { @id } element/object description | { $metaschema-code } schema &#xA;</xsl:text>
        <xsl:text expand-text="true">permalink: /docs/schemas/_{ $metaschema-code }/{ $metaschema-code }_{ @id }/&#xA;</xsl:text>
        <xsl:text expand-text="true">layout: post&#xA;</xsl:text>
        <xsl:text expand-text="true">schema: { $metaschema-code }&#xA;</xsl:text>
        <xsl:text>---&#xA;</xsl:text>
    </xsl:template>
            
    <xsl:mode name="unescape" on-no-match="shallow-copy"/>
    
    <!-- XML examples have to be written out live for Jekyll's macro -->
    <xsl:template mode="unescape" match="li[button='XML']//text()" xpath-default-namespace="http://www.w3.org/1999/xhtml">
        <xsl:value-of disable-output-escaping="yes" select="."/>
    </xsl:template>
    
</xsl:stylesheet>