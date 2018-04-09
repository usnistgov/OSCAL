<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:produce-schema-module-docs" name="produce-schema-module-docs">
  
  <!-- Expects a keyword identifying a schema
    'taglib' (default) or unrecognized creates a full file
    'catalog','profile','declarations' creates subsets (so far)
  -->
  <p:option name="module" select="'taglib'"/>
  
<!--
    
  Inputs: An XSD schema; an OSCAL document containing elements declared from/in that schema
  
  Results: (HTML documentation); Markdown documentation
  
  -->
  
  <p:input port="schema-docs" primary="true"/>
  <p:input port="parameters"  kind="parameter"/>
  
  <!--<p:output port="_a_OSCAL_docs" primary="false">
    <p:pipe port="result" step="input"/>
  </p:output>
  <p:output port="_b_reduced" primary="false">
    <p:pipe port="result" step="reduce"/>
  </p:output>
  <p:output port="_c_with-english" primary="false">
    <p:pipe port="result" step="inject-englishing"/>
  </p:output>
  <p:output port="_d_mapped" primary="false">
    <p:pipe port="result" step="produce-html-docs"/>
  </p:output>
  <p:output port="_e_enhanced" primary="false">
    <p:pipe port="result" step="enhance-html-docs"/>
  </p:output>
  <p:output port="_f_linked" primary="false">
    <p:pipe port="result" step="linkup-html-docs"/>
  </p:output>-->
  <p:output port="html-docs" primary="false">
    <p:pipe port="result" step="linkup-html-docs"/>
  </p:output>
  <p:output port="markdown-docs" primary="true">
    <p:pipe port="result" step="produce-markdown-docs"/>
  </p:output>
  
  <!--<p:serialization port="_a_OSCAL_docs"   indent="true"/>
  <p:serialization port="_b_reduced"      indent="true"/>
  <p:serialization port="_c_with-english" indent="true"/>
  <p:serialization port="_d_mapped"       indent="true"/>
  <p:serialization port="_e_enhanced"     indent="true"/>
  <p:serialization port="_f_linked"       indent="true"/>-->
  
  <p:serialization port="html-docs"   indent="true" method="html"/>
  <p:serialization port="markdown-docs"             method="text"/>
  
  <p:identity name="input"/>
  
  <p:xslt name="reduce">
    <p:input port="stylesheet">
      <p:document href="oscaloscal-reduce.xsl"/>
    </p:input>
    <p:with-param name="module" select="$module"/>
  </p:xslt>
  
  <p:xslt name="inject-englishing">
    <p:input port="stylesheet">
      <p:document href="schema-doc.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="produce-html-docs">
    <p:input port="stylesheet">
      <p:document href="oscaldocs-html-map.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="enhance-html-docs">
    <p:input port="stylesheet">
      <p:document href="oscaldocs-html-enhance.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="linkup-html-docs">
    <p:input port="stylesheet">
      <p:document href="oscaldocs-html-linkup.xsl"/>
    </p:input>
  </p:xslt>
  
  <!--<p:identity name="produce-markdown-docs"/>-->
  <p:xslt name="produce-markdown-docs">
    <p:input port="stylesheet">
      <p:document href="../../../lib/XSLT/html-to-markdown.xsl"/>
    </p:input>
  </p:xslt>
 
</p:declare-step>