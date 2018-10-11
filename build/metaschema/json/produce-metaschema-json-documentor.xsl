<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    
    xmlns="http://www.w3.org/2005/xpath-functions"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    
    >
    
<!-- Purpose: Produce an XSLT supporting production of JSON-oriented metaschema documentation pertaining
        to a particular catalog type.
        
        In the case of the JSON docs production XSLT, the particular XML->JSON for that catalog type
        must be bound in, for those element to be converted (XMl->JSON) for display. This is done by
        wiring in the *expected* file name of the converter XSLT to a parameter, whose value can be
        overridden at runtime.
        
        
        In doing so, external pointers (to sample files) are resolved to templates that may be executed in schema production. -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting production of metaschema documentation, in HTML format. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>
    
    <xsl:param name="example-converter-xslt-path" as="xs:string" expand-text="true">../../../util/convert/{/METASCHEMA/short-name}-xml-converter.xsl</xsl:param>
    
    <xsl:variable name="example-converter-xslt" select="resolve-uri($example-converter-xslt-path,document-uri(/))"/>
    
    <xsl:template match="METASCHEMA">
        <xslt:stylesheet version="3.0"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
            exclude-result-prefixes="#all">
            
            <xslt:output indent="yes" method="text" use-character-maps="delimiters"/>
            
            <xsl:comment> METASCHEMA docs production </xsl:comment>
            
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
    </xsl:template>

    
    <xsl:template name="furniture">
        
        <xslt:import href="{$example-converter-xslt}"/>
        <!--<xslt:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>-->
        <xslt:import href="metaschema-json-html.xsl"/>
        
        <!-- output method must be text for good markdown including unescaped code snips   -->
        <xslt:output method="text"/>
        
        <xslt:param name="json-file" as="xs:string?" select="()"/>
        <xslt:param name="json-indent" as="xs:string">yes</xslt:param>
        <xslt:template match="/">
            <xslt:variable name="html">
                <xslt:apply-imports/>
            </xslt:variable>
            <!--<xslt:copy-of select="$html"/>-->
            <xslt:apply-templates select="$html" mode="md"/>
        </xslt:template>
        
        <xslt:template match="m:example">
            <div class="example">
                <xslt:variable name="json-xml">
                    <xslt:apply-templates select="* except m:*" mode="xml2json"/>
                </xslt:variable>
                <!-- mode 'rectified' scrubs unwanted labels from JSON -->
                <xslt:variable name="rectified">
                    <xslt:apply-templates select="$json-xml" mode="rectify"/>
                </xslt:variable>
                
                <xslt:apply-templates select="m:description"/>
                
                <pre class="json">
                
           <xslt:value-of select="xml-to-json($rectified,$write-options)"/>
         </pre>
                <xslt:apply-templates select="m:remarks"/>
            </div>
        </xslt:template>
        
    </xsl:template>
</xsl:stylesheet>