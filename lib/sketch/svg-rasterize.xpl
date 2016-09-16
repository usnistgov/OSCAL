<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0">
  
  <!-- By Tony Graham. See
       http://www.oxygenxml.com/pipermail/oxygen-user/2011-June/003681.html
    -->
  <p:option name="cfd" required="true"/>
  <p:option name="cfn" required="true"/>
  <p:option name="cfne" required="true"/>
  <p:option name="oxygenInstallDir" required="true"/>
  
  <p:exec result-is-xml="false" arg-separator="#">
    <p:input port="source">
      <p:empty/>
    </p:input>
    <p:with-option
      name="command"
      select="concat($oxygenInstallDir,'/jre/bin/java')"/>
    <p:with-option
      name="args"
      select="concat('-cp#',$oxygenInstallDir,'/lib/batik-all-1.7.jar;',$oxygenInstallDir,'/lib/xml-apis-ext.jar#org.apache.batik.apps.rasterizer.Main#-scriptSecurityOff#-m#image/jpeg#-d#',$cfd,'/',$cfn,'.jpg#',$cfne)"/>
    <p:with-option
      name="cwd"
      select="$cfd"/>
  </p:exec>
  <p:sink/>
</p:declare-step>