<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">

  <p:input port="source"/>
  
  <p:input port="parameters" kind="parameter"/>
  
  
  <p:output port="result" primary="true"/>
  
  <p:output port="mapped" 
    primary="false">
    <p:pipe port="result" step="docsketch-map"/>
  </p:output>
  
  <p:serialization port="result" indent="true" encoding="utf-8"/>
  <p:serialization port="mapped" indent="true" encoding="utf-8"/>
  
  <p:xslt name="docsketch-map">
    <p:input port="stylesheet">
      <p:document href="oscal-docsketch-map.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="produce-svg">
    <p:input port="stylesheet">
      <p:document href="oscal-docsketch-svg.xsl"/>
    </p:input>
  </p:xslt>


</p:declare-step>