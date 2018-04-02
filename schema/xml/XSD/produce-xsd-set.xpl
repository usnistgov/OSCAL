<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
    
   
    
    <p:input port="parameters" kind="parameter"/>
    
    <!-- Wrapper XProc pipeline reads three "blank" XSD files (w/o embedded documentation)
         and rewrites them into a directory up, with documentation injected.   -->
    
    <p:input port="source" sequence="true">
        <p:document href="_catalog.xsd"/>
        <p:document href="_declarations.xsd"/>
        <p:document href="_profile.xsd"/>
    </p:input>
    
    <p:import href="produce-schema-module.xpl"/>
    
    <p:for-each>

        <p:variable name="docURI" select="document-uri(/)"/>

        <!-- catalog_xsd becomes ../oscal-catalog.xsd etc -->
        <p:variable name="resultURI"
            select="replace($docURI,'(.*/)_(.*)(.xsd)','$1../oscal-$2.xsd')"/>

        <!-- subpipeline produces the annotated XSD -->
        <oscal:produce-schema-module/>
        
        <p:store>
            <p:with-option name="href" select="$resultURI"/>
            <p:with-option name="indent" select="true()"/>
        </p:store>

        <!-- pick up here to write md docs file? -->
    </p:for-each>
    
            
</p:declare-step>