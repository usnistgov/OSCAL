<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  type="oscal:produce-schema-doc-md" name="produce-schema-doc-md">
  
<!-- $source should be oscal-oscal.xml -->
  <p:input port="source" primary="true"/>
  <p:input port="parameters"  kind="parameter"/>
  
  <!--<p:output port="result">
    <p:pipe port="markdown-docs" step="module-docs"/>
  </p:output>-->
  
  <!--<p:output port="Z">
    <p:pipe port="result" step="schema-documentation"/>
  </p:output>-->
  
  <p:import href="produce-schema-module-docs.xpl"/>
  
  <p:identity name="schema-documentation"/>
  
  <p:sink/>
  
  <p:for-each>
    <p:iteration-source select="*/*">
      <p:inline>
        <oscal:schema-set>
          <oscal:catalog/>
          <oscal:profile/>
          <oscal:declarations/>
        </oscal:schema-set>
      </p:inline>
    </p:iteration-source>
    
    <p:identity name="proxy"/>
    
    <p:group>
      <p:variable name="module" select="local-name(/*)">
        <p:pipe step="proxy" port="result"/>
      </p:variable>

      <p:variable name="md-resultfile" select=" '../_' || $module || 'XML.md' "/>

      <oscal:produce-schema-module-docs name="module-docs">
        <p:input port="schema-docs">
          <p:pipe step="schema-documentation" port="result"/>
        </p:input>
        <p:with-option name="module" select="$module"/>
      </oscal:produce-schema-module-docs>

      <p:store method="text">
        <p:input port="source">
          <p:pipe port="markdown-docs" step="module-docs"/>
        </p:input>
        <p:with-option name="href" select="$md-resultfile"/>
      </p:store>
    </p:group>
  </p:for-each>
  
</p:declare-step>