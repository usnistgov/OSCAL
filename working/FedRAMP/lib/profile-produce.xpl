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
  <p:output port="_A_WORKSHEET" primary="false">
    <p:pipe port="result" step="oscalized"/>
  </p:output>
  <p:output port="_B_PROFILE_SIMPLE" primary="false">
    <p:pipe port="result" step="profiled"/>
  </p:output>
  <p:output port="_C_PROFILE_ALLOCATED" primary="false">
    <p:pipe port="result" step="allocated"/>
  </p:output>
  <p:output port="_D_PROFILE_ENHANCED" primary="false">
    <p:pipe port="result" step="enhanced"/>
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
  
  <p:serialization port="_0_input"              indent="true"/>
  <p:serialization port="_A_WORKSHEET"          indent="true"/>
  <p:serialization port="_B_PROFILE_SIMPLE"     indent="true"/>
  <p:serialization port="_C_PROFILE_ALLOCATED"  indent="true"/>
  <p:serialization port="_D_PROFILE_ENHANCED"  indent="true"/>
  
  <p:variable name="sourceURI" select="document-uri(/)"/>
  
  <p:identity name="input"/>
  
  <!-- Expands the profile into a nominal framework -->
  <!--<p:identity name="resolved"/>-->
  <p:xslt name="oscalized">
    <p:input port="stylesheet">
      <p:document href="worksheet-from-xls-export.xsl"/>
    </p:input>
  </p:xslt>
  
  <!--<p:identity name="profiled"/>-->
  <p:xslt name="profiled">
    <p:input port="stylesheet">
      <p:document href="simple-profile-from-worksheet.xsl"/>
    </p:input>
  </p:xslt>

  <!-- The results should be valid OSCAL profiles that resolve with no errors or ambiguities. -->
  <!-- (To be checked via Schematron and other means.) -->
  
  <!-- The next transformation splits the calls in the profile into separate invocations into
       actual catalogs (profiles). The XSLT indicates which profile(s) to examine for making
       matches. -->
  <p:xslt name="allocated">
    <p:input port="stylesheet">
      <p:document href="profile-baseline-allocator.xsl"/>
    </p:input>
  </p:xslt>
  <!--<p:identity name="allocated"/>-->
  
  <!-- Adds parameters from catalog or (resolved) profile sources. -->
  <p:xslt name="enhanced">
    <p:input port="stylesheet">
      <p:document href="profile-amend.xsl"/>
    </p:input>
  </p:xslt>
  <!--<p:identity name="enhanced"/>-->
  
  
  <!-- Last chance for comments, PIs etc. -->
  <!--<p:identity name="final"/>-->
  <p:xslt name="final">
    <p:with-param name="source-uri" select="$sourceURI"/>
    <p:input port="stylesheet">
      <p:inline>
        <xsl:stylesheet version="3.0" exclude-result-prefixes="#all">
          <xsl:param name="source-uri"/>
          <!-- Framework enhancement XSLT   -->
          
          <!--<xsl:mode on-no-match="shallow-copy"/>-->
          
          <!-- Cleaning up namespaces -->
          <xsl:template match="node() | @*">
            <xsl:copy copy-namespaces="no">
              <xsl:apply-templates select="node() | @*"/>
            </xsl:copy>
          </xsl:template>
          
          <xsl:template match="/comment() | /text()"/>
          
          <xsl:template match="/*">
            <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="../lib/CSS/oscal.css"</xsl:processing-instruction>
            <xsl:text>&#xA;</xsl:text>
            <xsl:comment expand-text="true"> Produced by running profile-produce.xpl on { $source-uri } { current-date()} </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:next-match/>
          </xsl:template>
          
          <xsl:template match="oscal:invoke/@href">
            <xsl:attribute name="href" select="replace(.,'.*examples','..')"/>
          </xsl:template>
        </xsl:stylesheet>
        
      </p:inline>
    </p:input>
  </p:xslt>
 
</p:declare-step>