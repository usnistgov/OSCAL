<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0"
  xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" 
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  type="oscal:sp800-53oscal-digest" name="sp800-53oscal-digest">
  
<!-- Purpose: From XML OSCAL, produces equivalent JSON OSCAL. -->
<!-- Input: OSCAL XML -->
<!-- Output: JSON rendition of same (*except*) -->
<!-- Limitations - doesn't achieve clean escaping of < and > delimiters in results w/o an external process. -->
<!-- One workaround: save out and run the result of port `xpath-json-xml` through `json-write.xsl` (outside this XProc) -->
  
  <p:input port="source"     primary="true"/>
  <p:input port="parameters" kind="parameter"/>
  
  <!-- Diagnostic <p:output port="_input_XML" primary="false">
    <p:pipe port="result" step="catalog"/>
  </p:output>
  <p:serialization port="_input_XML"       indent="true"/>-->
  
  
  <p:output port="xpath-json-xml" primary="false">
    <p:pipe port="result" step="reduced"/>
  </p:output>
  <p:serialization port="xpath-json-xml" indent="true"/>
  
  <!-- Not capturing presently <p:output port="JSON" primary="false">
    <p:pipe port="result" step="json-out"/>
  </p:output>
  <p:serialization port="JSON"           indent="true" method="text"/>-->
  
  
  <!-- Hard-code a catalog here (and remove 'source' input pipe)
    <p:load name="catalog">
    <p:with-option name="href" select="'file:/home/wendell/Documents/OSCAL/examples/SP800-53/SP800-53-rev4-catalog.xml'"/>
  </p:load>-->
  
  <p:identity name="catalog"/>
  
  <p:xslt name="reduced">
    
      <p:input port="stylesheet">
        <p:document href="oscal-json-map.xsl"/>
      </p:input>
    
  </p:xslt>
  
  <!-- Last chance for comments, PIs etc. -->
  <!--<p:identity name="json-out"/>-->
  <p:xslt name="json-out">
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet version="3.0" exclude-result-prefixes="#all">
          
          <xsl:variable name="write-options" as="map(*)">
            <xsl:map>
              <xsl:map-entry key="'indent'">true</xsl:map-entry>
            </xsl:map>
          </xsl:variable>
          
          <xsl:template match="/">
            <json>
              <xsl:value-of select="xml-to-json(/, $write-options)"/>
            </json>
          </xsl:template>
          
        </xsl:stylesheet>
      </p:inline>
    </p:input>
  </p:xslt>
  
 
 
</p:declare-step>