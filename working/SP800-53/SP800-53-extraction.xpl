<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:sp800-53-rev4-extraction" name="sp800-53-rev4-extraction">
  
  
  <p:input port="source" primary="true"/>
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="_0_input" primary="false">
    <p:pipe port="result" step="input"/>
  </p:output>
  <p:output port="_A_converted" primary="false">
    <p:pipe port="result" step="converted"/>
  </p:output>
  <p:output port="_B_enhanced" primary="false">
    <p:pipe port="result" step="enhanced"/>
  </p:output>
  <p:output port="_C_tuned" primary="false">
    <p:pipe port="result" step="tuned"/>
  </p:output>
  <p:output port="final" primary="true">
    <p:pipe port="result" step="final"/>
  </p:output>
  
  <p:serialization port="final"        indent="true"/>
  
  <p:serialization port="_0_input"     indent="true"/>
  <p:serialization port="_A_converted" indent="true"/>
  <p:serialization port="_B_enhanced"  indent="true"/>
  <p:serialization port="_C_tuned"     indent="true"/>
  
  <p:identity name="input"/>
  
  <p:xslt name="converted">
    <p:input port="stylesheet">
      <p:document href="Convert-SP800-53-to-oscal.xsl"/>
    </p:input>
  </p:xslt>
  
  
  <p:xslt name="enhanced">
    <p:input port="stylesheet">
      <p:document href="Enhance-SP800-53-oscal.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="tuned">
    <p:input port="stylesheet">
      <p:document href="Tuneup-SP800-53-oscal.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="final">
    <p:with-param name="xslt-process" select="'SP800-53 OSCAL EXTRACTION'"/>
    <p:input port="stylesheet">
      <p:document href="../lib/XSLT/OSCAL-finalize.xsl"/>
    </p:input>
    <!--<p:input port="parameters" kind="parameter"/>-->
      
  </p:xslt>
  
 
</p:declare-step>