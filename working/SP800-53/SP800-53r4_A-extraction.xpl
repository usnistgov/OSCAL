<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:sp800-53-rev4-extraction" name="sp800-53-rev4-extraction">
  
  
  <p:input port="source" primary="true">
    <p:document href="../../sources/800-53/rev4/800-53-controls.xml"/>
  </p:input>
  
  
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="_0_input" primary="false">
    <p:pipe port="result" step="input"/>
  </p:output>
  <p:output port="_A_corrected" primary="false">
    <p:pipe port="result" step="corrected"/>
  </p:output>
  <p:output port="_B_converted" primary="false">
    <p:pipe port="result" step="converted"/>
  </p:output>
  <p:output port="_C_enhanced" primary="false">
    <p:pipe port="result" step="enhanced"/>
  </p:output>
  <p:output port="_D_tuned" primary="false">
    <p:pipe port="result" step="tuned"/>
  </p:output>
  <p:output port="final" primary="true">
    <p:pipe port="result" step="final"/>
  </p:output>
  
  <p:serialization port="final"        indent="true"/>
  
  <p:serialization port="_0_input"     indent="true"/>
  <p:serialization port="_A_corrected" indent="true"/>
  <p:serialization port="_B_converted" indent="true"/>
  <p:serialization port="_C_enhanced"  indent="true"/>
  <p:serialization port="_D_tuned"     indent="true"/>
  
  <p:identity name="input"/>
  
  <!--<p:identity name="corrected"/>-->
  <p:xslt name="corrected">
    <p:input port="stylesheet">
      <p:document href="SP800-53-corrections.xsl"/>
    </p:input>
  </p:xslt>
  
  <!--<p:identity name="converted"/>-->
  <p:xslt name="converted">
    <p:input port="stylesheet">
      <p:document href="SP800-53-convert-to-oscal.xsl"/>
    </p:input>
  </p:xslt>
  
  
  <!--<p:identity name="enhanced"/>-->
  <p:xslt name="enhanced">
    <p:input port="stylesheet">
      <p:document href="SP800-53-param-detect.xsl"/>
    </p:input>
  </p:xslt>
  
  <!--<p:identity name="tuned"/>-->
  <p:xslt name="tuned">
    <p:input port="stylesheet">
      <p:document href="SP800-53-params-and-ids.xsl"/>
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