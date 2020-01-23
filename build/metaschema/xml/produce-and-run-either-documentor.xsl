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
    <xsl:param name="target-format" as="xs:string">xml</xsl:param>
    <xsl:param name="output-path"   as="xs:string">../../../docs/layouts/partials/generated</xsl:param>
    <xsl:param name="schema-path">
    <!-- TODO: confirm this value is passed from the calling script, then this can be ripped out -->
        <xsl:choose>
            <xsl:when test="$target-format = 'xml'">
                <xsl:choose>
                    <xsl:when test="/METASCHEMA/short-name='oscal-catalog'">https://github.com/usnistgov/OSCAL/blob/master/xml/schema/oscal_catalog_schema.xsd</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-profile'">https://github.com/usnistgov/OSCAL/blob/master/xml/schema/oscal_profile_schema.xsd</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-component'">https://github.com/usnistgov/OSCAL/blob/master/xml/schema/oscal_component_schema.xsd</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-ssp'">https://github.com/usnistgov/OSCAL/blob/master/xml/schema/oscal_component_ssp.xsd</xsl:when>
                    <xsl:otherwise expand-text="true">NO XML SCHEMA PATH GIVEN FOR SCHEMA { /METASCHEMA/short-name }</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$target-format = 'json'">
                <xsl:choose>
                    <xsl:when test="/METASCHEMA/short-name='oscal-catalog'">https://github.com/usnistgov/OSCAL/blob/master/json/schema/oscal_catalog_schema.json</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-profile'">https://github.com/usnistgov/OSCAL/blob/master/json/schema/oscal_profile_schema.json</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-component'">https://github.com/usnistgov/OSCAL/blob/master/json/schema/oscal_component_schema.json</xsl:when>
                    <xsl:when test="/METASCHEMA/short-name='oscal-ssp'">https://github.com/usnistgov/OSCAL/blob/master/json/schema/oscal_ssp_schema.json</xsl:when>
                    <xsl:otherwise expand-text="true">NO XML SCHEMA PATH GIVEN FOR SCHEMA { /METASCHEMA/short-name }</xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>NO SCHEMA PATH - FORMAT NOT RECOGNIZED</xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xsl:import href="../lib/metaschema-compose.xsl"/>
    <xsl:variable name="source" select="$composed-metaschema"/>

    <xsl:variable name="metaschema-code" select="$source/*/short-name"/>

    <xsl:param name="example-converter-xslt-path" as="xs:string" required="yes"/>
    
    <!-- This template produces an XSLT dynamically by running an XSLT with a parameter set. -->
    <xsl:variable name="xslt">
        <xsl:variable name="runtime"   select="map {
            'xslt-version'                    : 3.0,
            'stylesheet-location'             : 'produce-either-documentor.xsl',
            'source-node'                     : $source,
            'stylesheet-params'               : map { xs:QName('target-format'): $target-format,
                                                      xs:QName('schema-path')           : $schema-path,
                                                      xs:QName('example-converter-xslt'): $example-converter-xslt-path
            } }" />

        <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->

        <xsl:sequence select="transform($runtime)?output"/>
    </xsl:variable>

    <xsl:variable name="map-xslts" as="element()+">
        <xslt target="xml"  href="../lib/metaschema-xmlelement-map.xsl"/>
        <xslt target="json" href="../lib/metaschema-jsonobject-map.xsl"/>
    </xsl:variable>

    <xsl:variable name="schema-map">
        <xsl:variable name="runtime"   select="map {
            'xslt-version'               : 3.0,
            'stylesheet-location'        : $map-xslts[@target = $target-format]/@href,
            'source-node'                : $source,
            'stylesheet-params'          : map { xs:QName('model-label'): ($metaschema-code || '-' || $target-format) } }" />
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
        <xsl:variable name="schema-docs-file" as="xs:string" expand-text="true">{$output-path}/{$metaschema-code}-{$target-format}-schema.html</xsl:variable>
        <xsl:variable name="schema-map-file"  as="xs:string" expand-text="true">{$output-path}/{$metaschema-code}-{$target-format}-map.html</xsl:variable>
        
        <xsl:result-document exclude-result-prefixes="#all" href="{$schema-docs-file}" method="html" indent="yes">
            <xsl:message expand-text="yes">writing to {$schema-docs-file}</xsl:message>
            <!--<xsl:call-template name="yaml-header">
                <xsl:with-param name="overview" select="true()"/>
            </xsl:call-template>-->

            <!--<xsl:apply-templates mode="cleanup" select="$html-docs/*/html:body/(* except child::html:div[contains-token(@class,'definition')])"/>-->
            <xsl:apply-templates mode="cleanup" select="$html-docs/*/html:body/*"/>
        </xsl:result-document>

        <xsl:result-document exclude-result-prefixes="#all" href="{$schema-map-file}" method="html" indent="yes">
            <xsl:message expand-text="yes">writing to {$schema-map-file}</xsl:message>
            <!--<xsl:call-template name="map-header"/>-->

            <xsl:for-each select="$schema-map">
                <xsl:apply-templates mode="cleanup" select="."/>
            </xsl:for-each>
        </xsl:result-document>

        <!--<xsl:for-each select="$html-docs/*/html:body/html:div[contains-token(@class,'definition')]">
            <xsl:result-document exclude-result-prefixes="#all" href="{$result-path}/{ $metaschema-code }_{@id}.html"
               method="html">
                <xsl:message expand-text="yes">{$result-path}/{ $metaschema-code }_{@id}.html</xsl:message>

                <xsl:call-template name="yaml-header">
                    <xsl:with-param name="tagname" select="string(@id)"/>
                    <xsl:with-param name="root"    select="starts-with(html:h5[1],(@id || ' is the root' ))"/>
                    <xsl:with-param name="model-type" select="tokenize(@class,'\s+')[starts-with(.,'define-')] ! replace(.,'^define-','')"/>
                </xsl:call-template>
                <xsl:apply-templates select="." mode="cleanup"/>
            </xsl:result-document>
        </xsl:for-each>-->
    </xsl:template>

    <!--<xsl:template name="yaml-header">
        <xsl:param name="tagname"  select="()"/>
        <xsl:param name="root"     as="xs:boolean" select="false()"/>
        <xsl:param name="overview" as="xs:boolean" select="false()"/>
        <xsl:param name="model-type"/>
        <xsl:text>-\-\-&#xA;</xsl:text>
        <xsl:text expand-text="true">title: Schema Documentation - { $metaschema-code }{ $tagname ! (' - ' || .) }&#xA;</xsl:text>
        <xsl:text expand-text="true">description: { $metaschema-code } schema documentation{ $tagname ! (' - ' || .) }&#xA;</xsl:text>
        <xsl:if test="exists($tagname)">
            <xsl:text expand-text="true">tagname: { $tagname }&#xA;</xsl:text>
        </xsl:if>
        <!-\-When $tagname is missing, the last step is omitted -\->
        <xsl:text expand-text="true">permalink: /docs/schemas/{ $metaschema-code }-{$target-format}/{ $tagname ! ($metaschema-code || '_' || .) }/&#xA;</xsl:text>
        <xsl:text expand-text="true">layout: schemas&#xA;</xsl:text>
        <xsl:text expand-text="true">model: { $metaschema-code }-{ $target-format }&#xA;</xsl:text>
        <xsl:if test="$root">root: true&#xA;</xsl:if>
        <xsl:if test="$overview">overview: true&#xA;</xsl:if>
        <xsl:if test="boolean($model-type)" expand-text="yes">model-type: { $model-type }&#xA;</xsl:if>
        <xsl:text>-\-\-&#xA;</xsl:text>
    </xsl:template>

    <xsl:template name="map-header">
        <xsl:text>-\-\-&#xA;</xsl:text>
        <xsl:text expand-text="true">title: { upper-case($target-format) } model map - { $source/METASCHEMA/schema-name/string() }&#xA;</xsl:text>
        <xsl:text expand-text="true">description: { $source/METASCHEMA/schema-name/string() } Map&#xA;</xsl:text>
        <xsl:text expand-text="true">permalink: /docs/maps/{ $metaschema-code }-{$target-format}/&#xA;</xsl:text>
        <xsl:text expand-text="true">layout: post&#xA;</xsl:text>
        <xsl:text expand-text="true">topnav: schemareference&#xA;</xsl:text>
        <xsl:text expand-text="true">sidenav: schemas&#xA;</xsl:text>
        <!-\-<xsl:text expand-text="true">stickysidenav: true&#xA;</xsl:text>-\->
        <xsl:text expand-text="true">subnav: true&#xA;</xsl:text>
        <!-\-<xsl:text expand-text="true">model: { $metaschema-code }-{ $target-format }&#xA;</xsl:text>-\->
        <xsl:text>-\-\-&#xA;</xsl:text>
    </xsl:template>-->

<!-- 'cleanup' mode strips namespaces and disables output escaping inside code blocks for HTMLish target  -->
    <xsl:mode name="cleanup" on-no-match="shallow-copy"/>

    <xsl:template match="*" mode="cleanup">
        <xsl:element name="{ local-name() }">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node() | @*" mode="cleanup"/>
        </xsl:element>
    </xsl:template>

    <xsl:variable name="suspend-link-checks" as="element()*">
        <href>http://www.w3.org/TR/xmlsec-algorithms/#digest-method</href>
    </xsl:variable>

    <!-- External links in the docs should not be link checked  -->
    <xsl:template match="a[@href=$suspend-link-checks]" mode="cleanup" xpath-default-namespace="">
        <xsl:element name="{ local-name() }">
            <xsl:attribute name="data-proofer-ignore">yes</xsl:attribute>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="node() | @*" mode="cleanup"/>
        </xsl:element>
    </xsl:template>

    <!-- directives for Hugo are wrapped in 'doe' so they emit (unescaped) literal syntax -->
    <!-- at present they are dropping the directives, until we have syntax that works -->
    <xsl:template mode="cleanup" match="span[@class='doe']"  xpath-default-namespace="">
        <!--<xsl:value-of disable-output-escaping="yes" select="."/>-->
    </xsl:template>

</xsl:stylesheet>
