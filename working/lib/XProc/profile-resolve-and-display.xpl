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
  <p:output port="_A_resolved" primary="false">
    <p:pipe port="result" step="resolved"/>
  </p:output>
  <p:output port="_B_rendered" primary="false">
    <p:pipe port="result" step="rendered"/>
  </p:output>
  <p:output port="final" primary="true">
    <p:pipe port="result" step="final"/>
  </p:output>
  
  <p:serialization port="final"        indent="true" method="html" version="5.0"/>
  
  <p:serialization port="_0_input"     indent="true"/>
  <p:serialization port="_A_resolved"  indent="true"/>
  <p:serialization port="_B_rendered"  indent="true"/>
  
  <p:identity name="input"/>
  
  <p:xslt name="resolved">
    <p:input port="stylesheet">
      <p:document href="../XSLT/profile-resolver.xsl"/>
    </p:input>
  </p:xslt>
  <!-- Delivers a 'collection' rendering of the catalog(s) -->
  
  
 <p:xslt name="rendered">
    <p:input port="stylesheet">
      <p:document href="../XSLT/HTML/oscal-basic-display.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="final">
    <p:with-param name="xslt-process" select="'OSCAL PROFILE RESOLUTION AND RENDERING '"/>
    <p:input port="stylesheet">
      <p:document href="../XSLT/HTML/html-finalize.xsl"/>
    </p:input>
    <!--<p:input port="parameters" kind="parameter"/>-->
      
  </p:xslt>
  
 
</p:declare-step>