<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:produce-directory-manifest" name="produce-directory-manifest">
  
  <p:input port="parameters" kind="parameter"/>
  
  <p:option name="dirpath" required="true"/>
  
  <p:output port="_html" primary="false">
    <p:pipe port="result" step="produce-manifest-html"/>
  </p:output>
  <p:output port="_html-sorted" primary="false">
    <p:pipe port="result" step="organize-manifest"/>
  </p:output>
  <p:output port="manifest-file" primary="true">
    <p:pipe port="result" step="render-markdown"/>
  </p:output>

  <p:serialization port="_html"        method="html" omit-xml-declaration="true" indent="true"/>
  <p:serialization port="_html-sorted" method="html" omit-xml-declaration="true" indent="true"/>
  <p:serialization port="manifest-file"    method="text" omit-xml-declaration="true"/>
  
  <p:xslt name="produce-manifest-html">
    <p:input port="source">
      <p:inline><oscal:empty/></p:inline>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="directory-manifest.xsl"/>
    </p:input>
    <p:with-param name="dirpath" select="$dirpath"/>
  </p:xslt>
  
  <p:xslt name="organize-manifest">
    <p:input port="stylesheet">
      <p:document href="manifest-reorder.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="render-markdown">
    <p:input port="stylesheet">
      <p:document href="../XSLT/html-to-markdown.xsl"/>
    </p:input>
  </p:xslt>
  
</p:declare-step>