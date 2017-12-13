<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0"
  xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" 
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  type="oscal:sp800-53-rev4-extraction" name="sp800-53-rev4-extraction">
  
  <p:option name="json-file"/>
  
  <!-- We have no source document since the XML is produced by Saxon. -->
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="_100_exposed" primary="false">
    <p:pipe port="result" step="xpath-results"/>
  </p:output>
  <p:output port="_200_mapped" primary="false">
    <p:pipe port="result" step="mapped"/>
  </p:output>
  <p:output port="_300_refined" primary="false">
    <p:pipe port="result" step="refined"/>
  </p:output>
  <p:output port="_400_enhanced" primary="false">
    <p:pipe port="result" step="enhanced"/>
  </p:output>
  <p:output port="_500_analyzed" primary="false">
    <p:pipe port="result" step="analyzed"/>
  </p:output>
  
  <!--<p:output port="final" primary="true">
    <p:pipe port="result" step="final"/>
  </p:output>-->
  <!--<p:output port="markdown" primary="false">
    <p:pipe port="result" step="Markdown"/>
  </p:output>-->
  
  <!--<p:serialization port="final"        indent="true"/>-->
  <!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">-->
  <!--<p:serialization port="markdown"     indent="false" method="text"/>-->
  
  <p:serialization port="_100_exposed"  indent="true"/>
  <p:serialization port="_200_mapped"   indent="true"/>
  <p:serialization port="_300_refined"  indent="true"/>
  <p:serialization port="_400_enhanced" indent="true"/>
  <p:serialization port="_500_analyzed" indent="true"/>
  
  <!-- Expands the profile into a nominal framework -->
  <!--<p:identity name="resolved"/>-->
  <p:xslt name="xpath-results">
    <p:input port="source">
      <p:inline><stub/></p:inline>
    </p:input>
    <p:input port="stylesheet">
      <p:document href="json-reader.xsl"/>
    </p:input>
    <p:with-param name="json-file" select="$json-file"/>
  </p:xslt>
  
  <!--<p:identity name="mapped"/>-->
  <p:xslt name="mapped">
    <p:input port="stylesheet">
      <p:document href="json-abstract-map.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="refined">
    <p:input port="stylesheet">
      <p:document href="map-refine.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="enhanced">
    <p:input port="stylesheet">
      <p:document href="enhance.xsl"/>
    </p:input>
  </p:xslt>
  
  <p:xslt name="analyzed">
    <p:input port="stylesheet">
      <p:document href="analysis.xsl"/>
    </p:input>
    <p:with-param name="json-file" select="$json-file"/>
  </p:xslt>
  
  <!-- Adds IDs -->
  <!--<p:xslt name="with-IDs">
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet version="3.0">
          
          <!-\- Framework enhancement XSLT   -\->
          
          <xsl:mode on-no-match="shallow-copy"/>
          
          <xsl:template match="oscal:group">
            <xsl:copy>
              <xsl:attribute name="id" select="oscal:prop[@class=('function-id','category-id')]"/>
              <xsl:copy-of select="@*"/>
              <xsl:apply-templates/>
            </xsl:copy>
          </xsl:template>
          
          <xsl:template match="oscal:component">
            <xsl:copy>
              <xsl:attribute name="id" select="../oscal:prop[@class=('function-id','category-id')] || '.' || oscal:prop[@class='number']"/>
              <xsl:copy-of select="@*"/>
              <xsl:apply-templates/>
            </xsl:copy>
          </xsl:template>
          
        </xsl:stylesheet>
        
      </p:inline>
    </p:input>
  </p:xslt>-->
  
  
  <!-- Last chance for comments, PIs etc. -->
  <!--<p:identity name="final"/>-->
  
 
</p:declare-step>