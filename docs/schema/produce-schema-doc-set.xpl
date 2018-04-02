<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    
   
    
    <p:input port="parameters" kind="parameter"/>
    
    <!-- Wrapper XProc pipeline reads three "blank" XSD files (w/o embedded documentation)
         and rewrites them into a directory up, with documentation injected.   -->
    
    <p:input port="source" primary="true">
        <p:document href="oscal-oscal.xml"/>
    </p:input>
   
    <p:import href="produce-schema-docs.xpl"/>
    
    
    <p:identity name="oscal-docs"/>
    
    <p:for-each>
        <p:iteration-source>
            <p:document href="../../schema/xml/XSD/_catalog.xsd"/>
            <p:document href="../../schema/xml/XSD/_declarations.xsd"/>
            <p:document href="../../schema/xml/XSD/_profile.xsd"/>
        </p:iteration-source>

        <p:variable name="schemaURI" select="document-uri(/)"/>

        <!-- catalog_xsd becomes ../oscal-catalog.xsd etc -->
        <p:variable name="resultURI"
            select="replace($schemaURI,'.*/(.+)\.xsd','$1XML.md')"/>

        <!-- subpipeline produces the annotated XSD -->
        <oscal:produce-schema-docs name="produce-docs">
            <p:input port="schema-docs">
                <p:pipe port="result" step="oscal-docs"/>
            </p:input>
            <p:with-option name="schema" select="$schemaURI"/>
        </oscal:produce-schema-docs>
        
<!--        <p:xslt>
            <p:input port="stylesheet">
                <p:inline>
                    <xsl:stylesheet version="2.0">
                        <xsl:template
                    </xsl:stylesheet>
                </p:inline>
            </p:input>
-->            
        <p:store method="text" indent="true">
            <p:input port="source">
                <p:pipe port="markdown-docs" step="produce-docs"/>
            </p:input>
            <p:with-option name="href" select="$resultURI"/>
        </p:store>

        <!-- pick up here to write md docs file? -->
    </p:for-each>
    
            
</p:declare-step>