<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:schema-production" name="schema-production">
  
<!--
    
  Inputs:
  
  XSD 'skeleton' OSCAL schema produced by Trang from RNC/RNG
  An OSCAL document describing the schema (oscal-oscal.xml, valid to oscal-docs.sch as well as the OSCAL schema)
  
  Outputs:
  
  HTML documentation
  Markdown documentation
  
  -->
  
  <p:input port="source"     primary="true"/>
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="_OSCAL_docs" primary="false">
    <p:pipe port="result" step="input"/>
  </p:output>
  <p:output port="html-docs" primary="false">
    <p:pipe port="result" step="produce-html-docs"/>
  </p:output>
  <p:output port="markdown-docs" primary="false">
    <p:pipe port="result" step="produce-markdown-docs"/>
  </p:output>
  
  <p:serialization port="_OSCAL_docs"    indent="true"/>
  <p:serialization port="html-docs"      indent="true" method="html"/>
  <p:serialization port="markdown-docs"  method="text"/>
  
  <p:identity name="input"/>
  
  <p:xslt name="produce-html-docs">
    <p:input port="stylesheet">
      <!-- XSLT 1.0 so it also runs in a browser -->
      <p:document href="oscal-docs-html.xsl"/>
    </p:input>
  </p:xslt>
  
  <!--<p:identity name="produce-markdown-docs"/>-->
  <p:xslt name="produce-markdown-docs">
    <p:input port="stylesheet">
      <p:document href="../../working/lib/XSLT/html-to-markdown.xsl"/>
    </p:input>
  </p:xslt>
 
</p:declare-step>