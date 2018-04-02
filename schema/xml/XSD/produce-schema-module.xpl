<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:produce-schema-module" name="produce-schema-module">
  
<!--
  For injecting schema documentation into a single XSD module.
  
  Called by produce-xsd-set.xpl
  
  Inputs:
  
  XSD 'skeleton' OSCAL schema produced by Trang from RNC/RNG
  An OSCAL document describing the schema (oscal-oscal.xml, valid to oscal-docs.sch as well as the OSCAL schema)
  
  Outputs:
  
  An XSD schema with embedded documentation
  
  -->
  
  <p:input  port="xsd-module"/>
  <p:option name="oscal-doc-file" select="'../../../docs/schema/oscal-oscal.xml'"/>
  
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="result" primary="true">
    <p:pipe port="result" step="merge-docs"/>
  </p:output>
  
  <p:serialization port="result" indent="true"/>
  
  <p:identity name="input"/>
  
  <p:xslt name="merge-docs">
    <p:input port="stylesheet">
      <p:document href="xsd-merge-docs.xsl"/>
    </p:input>
    <p:with-param name="docs-file" select="$oscal-doc-file"/>
  </p:xslt>

</p:declare-step>