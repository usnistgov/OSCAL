<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:profile-resolve-and-display" name="profile-resolve-and-display">
  
  
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
  <!--<p:output port="markdown" primary="false">
    <p:pipe port="result" step="Markdown"/>
  </p:output>-->
  
  <p:serialization port="final"        indent="true"  method="xml"
    doctype-public="-//W3C//DTD XHTML 1.1//EN"
    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
   />
  <!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">-->
  <!--<p:serialization port="markdown"     indent="false" method="text"/>-->
  
  <p:serialization port="_0_input"     indent="true"/>
  <p:serialization port="_A_resolved"  indent="true"/>
  <p:serialization port="_B_rendered"  indent="true"/>
  
  <p:identity name="input"/>
  
  <!-- Expands the profile into a nominal framework -->
  <!--<p:identity name="resolved"/>-->
  <p:xslt name="resolved">
    <p:input port="stylesheet">
      <p:document href="../XSLT/profile-resolver.xsl"/>
    </p:input>
  </p:xslt>
  
  <!-- Making HTML out of it -->
  <p:xslt name="rendered" version="1.0">
    <p:input port="stylesheet">
      <!--<p:document href="../XSLT/HTML/oscal-basic-display.xsl"/>-->
      <p:document href="../XSLT/HTML/oscal-with-nav-display.xsl"/>
    </p:input>
  </p:xslt>
  
  <!-- Last chance for comments, PIs etc. -->
  <p:xslt name="final">
    <p:with-param name="xslt-process" select="' OSCAL PROFILE RESOLUTION AND RENDERING pipeline -profile-resolve-and-display.xpl- '"/>
    <p:input port="stylesheet">
      <p:document href="../XSLT/HTML/html-finalize.xsl"/>
    </p:input>
    <!--<p:input port="parameters" kind="parameter"/>-->
      
  </p:xslt>
  
  <!--<p:sink/>
  
  <p:xslt name="Markdown">
    <p:input port="source">
      <p:pipe port="result" step="rendered"/>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="../XSLT/html-to-markdown.xsl"/>
    </p:input>
    <!-\-<p:input port="parameters" kind="parameter"/>-\->
    
  </p:xslt>-->
  
  
 
</p:declare-step>