<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step version="1.0"
  xmlns:p="http://www.w3.org/ns/xproc"
  xmlns:c="http://www.w3.org/ns/xproc-step" 
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  type="oscal:sp800-53-rev4-extraction" name="sp800-53-rev4-extraction">
  
  
  <p:input port="source" primary="true"/>
  <p:input port="parameters" kind="parameter"/>
  
  <p:output port="_0_input" primary="false">
    <p:pipe port="result" step="input"/>
  </p:output>
  <p:output port="_A_OSCALIZED" primary="false">
    <p:pipe port="result" step="oscalized"/>
  </p:output>
  <p:output port="_B_enhanced" primary="false">
    <p:pipe port="result" step="enhanced"/>
  </p:output>
  <p:output port="_C_csf-enhanced" primary="false">
    <p:pipe port="result" step="with-IDs"/>
  </p:output>
  <p:output port="final" primary="true">
    <p:pipe port="result" step="final"/>
  </p:output>
  <!--<p:output port="markdown" primary="false">
    <p:pipe port="result" step="Markdown"/>
  </p:output>-->
  
  <p:serialization port="final"        indent="true"/>
  <!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" 
   "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">-->
  <!--<p:serialization port="markdown"     indent="false" method="text"/>-->
  
  <p:serialization port="_0_input"     indent="true"/>
  <p:serialization port="_A_OSCALIZED" indent="true"/>
  <p:serialization port="_B_enhanced"  indent="true"/>
  <p:serialization port="_C_csf-enhanced"  indent="true"/>
  
  <p:variable name="frameworkURI" select="document-uri(/)"/>
  
  <p:identity name="input"/>
  
  <!-- Expands the profile into a nominal framework -->
  <!--<p:identity name="resolved"/>-->
  <p:xslt name="oscalized">
    <p:input port="stylesheet">
      <p:document href="csf-flat-to-framework.xsl"/>
    </p:input>
  </p:xslt>
  
  <!-- Adds IDs -->
  <p:xslt name="with-IDs">
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet version="3.0">
          
          <!-- Framework enhancement XSLT   -->
          
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
  </p:xslt>
  
  <!-- Enhancing with catalog hyperlinks -->
  <p:xslt name="enhanced">
    <p:with-param name="catalog-path" select="'../SP800-53/SP800-53-OSCAL-refined.xml'"/>
    <p:with-param name="frameworkURI" select="$frameworkURI"/>
    <p:with-param name="key-property" select="'name'"/>
    <p:input port="stylesheet">
      <!--<p:document href="../lib/XSLT/HTML/oscal-basic-display.xsl"/>-->
      <p:document href="../lib/XSLT/framework-enhance.xsl"/>
    </p:input>
  </p:xslt>
 
  <!-- We could produce a profile calling the catalog
       except we haven't analyzed the catalog for multiple calls on controls -->
  <!--<p:xslt name="profiled">
    <p:input port="stylesheet">
      <!-\-<p:document href="../lib/XSLT/HTML/oscal-basic-display.xsl"/>-\->
      <p:document href="../XSLT/framework-enhance.xsl"/>
    </p:input>
  </p:xslt>-->
  
  
  <!-- Last chance for comments, PIs etc. -->
  <p:identity name="final"/>
  <!--<p:xslt name="final">
    <p:with-param name="xslt-process" select="' OSCAL PROFILE RESOLUTION AND RENDERING '"/>
    <p:input port="stylesheet">
      <p:document href="../lib/XSLT/HTML/html-finalize.xsl"/>
    </p:input>
    <!-\-<p:input port="parameters" kind="parameter"/>-\->
      
  </p:xslt>-->
  
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