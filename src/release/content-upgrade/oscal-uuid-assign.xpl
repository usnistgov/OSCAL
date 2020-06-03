<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:resolve-profile" name="oscal-resolve-profile">
  
  <!-- &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& -->
  <!-- Ports -->
  
  <p:input port="source" primary="true"/>
  <p:input port="parameters" kind="parameter"/>
  
  <p:serialization port="a.echo-input" indent="true"/>
  <p:output        port="a.echo-input" primary="false">
    <p:pipe        port="result"       step="input"/>
  </p:output>
  
  <p:serialization port="b.add-uuids" indent="true"/>
  <p:output        port="b.add-uuids" primary="false">
    <p:pipe        port="result"      step="add-uuids"/>
  </p:output>
  
  <p:serialization port="c.rewrite-links" indent="true"/>
  <p:output        port="c.rewrite-links" primary="false">
    <p:pipe        port="result"          step="rewrite-links"/>
  </p:output>
  
  <p:serialization port="f.finish" indent="true"/>
  <p:output        port="f.finish" primary="false">
    <p:pipe        port="result"   step="final"/>
  </p:output>
  
  <!--
  <opr:transform version="2.0">oscal-profile-resolve-select.xsl</opr:transform>
  <opr:transform version="2.0">oscal-profile-resolve-metadata.xsl</opr:transform>
  <opr:transform version="2.0">oscal-profile-resolve-merge.xsl</opr:transform>
  <opr:transform version="2.0">oscal-profile-resolve-modify.xsl</opr:transform>
  <opr:transform version="2.0">oscal-profile-resolve-finish.xsl</opr:transform>-->  
  
  
  <!--<p:serialization port="z.final" indent="true" method="xml" omit-xml-declaration="false"/>
  <p:output        port="z.final" primary="true">
    <p:pipe        port="result" step="final"/>
  </p:output>-->
  
  <!-- &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& &&& -->
  <!-- Pipeline -->
  
  <p:identity name="input"/>
  
  <p:xslt name="add-uuids">
    <p:input port="stylesheet">
      <p:document href="add-uuids.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="rewrite-links">
    <p:input port="stylesheet">
      <p:document href="rewrite-links.xsl"/>
    </p:input>
  </p:xslt>
  
  
  
  <!--<p:xslt name="finish">
    <p:input port="stylesheet">
      <p:document href="oscal-profile-resolve-finish.xsl"/>
    </p:input>
  </p:xslt>-->
  
  <p:identity name="final"/>
 
</p:declare-step>