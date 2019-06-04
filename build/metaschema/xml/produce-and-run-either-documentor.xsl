<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <!-- Controls indenting -->
    <xsl:output method="xml" omit-xml-declaration="true" indent="no"/>

    <!-- for development -->
    <!--<xsl:param name="target-format" select="()"/>-->
    <xsl:param name="target-format" as="xs:string">json</xsl:param>
    <xsl:param name="output-path"   as="xs:string">docs/content/documentation/schemas</xsl:param>

    <xsl:import href="../lib/metaschema-compose.xsl"/>
    <xsl:variable name="source" select="$composed-metaschema"/>
    
    <xsl:variable name="metaschema-code" select="$source/*/short-name"/>
   
    <xsl:param name="example-converter-xslt-path" as="xs:string" required="yes"/>
    <!--"C:\Users\wap1\Documents\OSCAL\docs_jekyll_uswds\content\documentation\schemas\oscal-catalog\catalog.md"-->
    
    <xsl:variable name="result-path" select="($output-path || '/_' || $metaschema-code || '-' || $target-format)"/>

    <!-- This template produces an XSLT dynamically by running an XSLT with a parameter set. -->
    <xsl:variable name="xslt">
        <xsl:variable name="runtime"   select="map {
            'xslt-version'               : 3.0,
            'stylesheet-location'        : 'produce-either-documentor.xsl',
            'source-node'                : $source,
            'stylesheet-params'          : map { xs:QName('target-format'): $target-format,
                                                 xs:QName('schema-path'):   document-uri(/),
                                                 xs:QName('example-converter-xslt'): $example-converter-xslt-path
                                                 } }" />

        <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->
        
        <xsl:sequence select="transform($runtime)?output"/>
    </xsl:variable>
    
    <!-- XPath 3.1 transform() is documented here: https://www.w3.org/TR/xpath-functions-31/#func-transform   -->
    <xsl:variable name="html-docs">
        <!-- to assign a base URI for the XSLT in memory -->
        <xsl:variable name="xslt-uri" select="resolve-uri(( $metaschema-code || '-metaschema-' || $target-format || '-documentor.xsl'))"/>
        <xsl:variable name="runtime"   select="map {
            'xslt-version'       : 3.0,
            'stylesheet-base-uri': $xslt-uri,
            'stylesheet-node'    : $xslt,
            'source-node'        : $source }" />
        <xsl:sequence select="transform($runtime)?output"/>        
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:result-document href="{$result-path}/{ $metaschema-code }.html" method="xhtml">
              
            <xsl:call-template name="yaml-header">
                <xsl:with-param name="overview" select="true()"></xsl:with-param>
            </xsl:call-template>
            
            <xsl:sequence select="$html-docs/*/html:body/(* except child::html:div[contains-token(@class,'definition')])"/>
        </xsl:result-document>
        <xsl:for-each select="$html-docs/*/html:body/html:div[contains-token(@class,'definition')]">
            <xsl:result-document href="{$result-path}/{ $metaschema-code }_{@id}.html"
               method="xhtml">
                <xsl:call-template name="yaml-header">
                    <xsl:with-param name="tagname" select="string(@id)"/>
                    <xsl:with-param name="root"    select="starts-with(html:h5[1],(@id || ' is the root' ))"/>
                </xsl:call-template>
                <xsl:apply-templates select="." mode="unescape"/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template name="yaml-header">
        <xsl:param name="tagname"  select="()"/>
        <xsl:param name="root"     as="xs:boolean" select="false()"/>
        <xsl:param name="overview" as="xs:boolean" select="false()"/>
        <xsl:text>---&#xA;</xsl:text>
        <xsl:text expand-text="true">title: Schema Documentation - { $metaschema-code }{ $tagname ! (' - ' || .) }&#xA;</xsl:text>
        <xsl:text expand-text="true">description: { $metaschema-code } schema documentation{ $tagname ! (' - ' || .) }&#xA;</xsl:text>
        <xsl:if test="exists($tagname)">
          <xsl:text expand-text="true">tagname: { $tagname }&#xA;</xsl:text>
        </xsl:if>
        <!--When $tagname is missing, the last step is omitted -->
        <xsl:text expand-text="true">permalink: /docs/schemas/{ $metaschema-code }-{$target-format}/{ $tagname ! ($metaschema-code || '_' || .) }&#xA;</xsl:text>
        <xsl:text expand-text="true">layout: schemas&#xA;</xsl:text>
        <xsl:text expand-text="true">model: { $metaschema-code }-{ $target-format }&#xA;</xsl:text>
        <xsl:if test="$root">root: true&#xA;</xsl:if>
        <xsl:if test="$overview">overview: true&#xA;</xsl:if>
        <xsl:text>---&#xA;</xsl:text>
    </xsl:template>
            
    <xsl:mode name="unescape" on-no-match="shallow-copy"/>
    
    <!-- XML examples have to be written out live for Jekyll's macro -->
    <xsl:template mode="unescape" match="li[button='XML']//text()" xpath-default-namespace="http://www.w3.org/1999/xhtml">
        <xsl:value-of disable-output-escaping="yes" select="."/>
    </xsl:template>
    
</xsl:stylesheet>
