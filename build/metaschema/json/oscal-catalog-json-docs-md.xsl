<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml" xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs m"
    version="3.0">
    
    <xsl:import href="../../../util/convert/oscal-catalog-xml-converter.xsl"/>
    <xsl:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
    <xsl:import href="metaschema-json-html.xsl"/>
    
<!-- output method must be text for good markdown including unescaped code snips   -->
    <xsl:output method="text"/>
    
    <xsl:param name="json-file" as="xs:string?" select="()"/>
    <xsl:param name="json-indent" as="xs:string">yes</xsl:param>
    <xsl:template match="/">
        <xsl:variable name="html">
            <xsl:apply-imports/>
        </xsl:variable>
        <!--<xsl:copy-of select="$html"/>-->
        <xsl:apply-templates select="$html" mode="md"/>
    </xsl:template>
    
    <xsl:template match="m:example">
        <div class="example">
            <xsl:variable name="json-xml">
                <xsl:apply-templates select="* except m:*" mode="xml2json"/>
            </xsl:variable>
            <!-- mode 'rectified' scrubs unwanted labels from JSON -->
            <xsl:variable name="rectified">
                <xsl:apply-templates select="$json-xml" mode="rectify"/>
            </xsl:variable>
            
            <xsl:apply-templates select="m:description"/>
            
            <pre class="json">
                
           <xsl:value-of select="xml-to-json($rectified,$write-options)"/>
         </pre>
            <xsl:apply-templates select="m:remarks"/>
        </div>
    </xsl:template>
    
</xsl:stylesheet>