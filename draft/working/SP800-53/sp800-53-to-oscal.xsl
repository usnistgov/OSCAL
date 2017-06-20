<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet   version="2.0"
  
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:feed="http://scap.nist.gov/schema/sp800-53/feed/1.0"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:xlink="https://www.w3.org/TR/xlink/"
  xpath-default-namespace="http://scap.nist.gov/schema/sp800-53/1.0"
  xmlns="http://scap.nist.gov/schema/oscal"
  exclude-result-prefixes="#all"
  >

  <xsl:strip-space elements="feed:controls feed:control description html:div html:ol supplemental-guidance references control-enhancements control-enhancement"/>
  
  <xsl:output indent="yes"/>
  
  <xsl:template match="feed:controls">
    <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="../lib/oscal.css"</xsl:processing-instruction>
    <xsl:processing-instruction name="xml-model">href="../lib/oscal-working.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
    <!--<xsl:processing-instruction name="xml-model">href="strawman.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>-->
    
    <xsl:text>&#xA;</xsl:text>
    <catalog>
      <title>NIST SP800-53</title>
      
      <declarations>
        
        <property role="control-class" where="SP800-53">
              <required/>
              <value>Technical</value>
              <value>Operational</value>
              <value>Management</value>
            </property>
        <property role="number" where="SP800-53">
              <required/>
              <identifier/>
              <regex>^(AC|AT|AU|CA|CM|CP|IA|IR|MA|MP|PE|PL|PM|PS|RA|SA|SC|SI)\-\d+$</regex>
            </property>
        <property role="priority" where="SP800-53">
              <regex>P[0-3]</regex>
            </property>
        <property role="baseline-impact" where="SP800-53">
              <value>MODERATE</value><value>HIGH</value>
            </property>
        <!--<statement name="supplemental-guidance" where="SP800-53"/>
              <title>Supplemental guidance</title>
            </statement>-->
        <!-- statement types to be supported? 
        'purpose' ("Objective"), 'guidance' ("Supplemental Guidance"), 'decision'
        
        -->
        
          <!--<required><property name="number"><id/></property></required>-->
        <property role="baseline-impact" where="SP800-53-enhancement">
              <value>MODERATE</value><value>HIGH</value>
            </property>
        
        
      </declarations>
      
      
      <xsl:for-each-group select="feed:control" group-by="family">
        <group type="family">
          <title><xsl:value-of select="current-grouping-key()"/></title>
          <xsl:apply-templates select="current-group()"/>
        </group>
      </xsl:for-each-group>
    </catalog>
  </xsl:template>
  
  <xsl:template match="feed:control">
    <control type="SP800-53">
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="* except title"/>
    </control>
  </xsl:template>
  
  <xsl:template match="title">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>
  
  <!-- Accounted for by 'div' grouping. -->
  <xsl:template match="family"/>
  
  <xsl:template match="control-class | number">
    <prop role="{name()}">
      <xsl:apply-templates/>
    </prop>
  </xsl:template>
  
  <!--<xsl:template match="family">
    <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
  
  <xsl:template match="number">
    <xsl:attribute name="no"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>-->
  
  <xsl:template match="descriptions | decisions | objectives | potential-assessments">
    <!--<xsl:message>
      <xsl:text>Matched </xsl:text>
      <xsl:value-of select="local-name()"/>
    </xsl:message>-->
    <group type="{ local-name(.) }">
      <!--<xsl:apply-templates select="." mode="group-label"/>-->
      <xsl:apply-templates/>
    </group>
  </xsl:template>
  
  <xsl:template match="references">
    <references>
      <!--<xsl:apply-templates select="." mode="group-label"/>-->
      <xsl:apply-templates/>
    </references>
  </xsl:template>
  
  <xsl:template match="control-enhancements">
    <group type="control-enhancements">
      <!--<xsl:apply-templates select="." mode="group-label"/>-->
      <xsl:apply-templates/>
    </group>
  </xsl:template>
  
  <xsl:template match="description">
    <description>
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </description>
  </xsl:template>
  
  <xsl:template match="objective">
    <control type="objective">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </control>
  </xsl:template>
  
  <xsl:template match="supplemental-guidance">
    <guidance>
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </guidance>
  </xsl:template>
  
  <xsl:template match="decision">
    <control type="decision">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <description>
        <xsl:apply-templates/>
      </description>
    </control>
  </xsl:template>
  
  <!--<xsl:template match="potential-assessment">
    <stmt type="{name()}">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <group>
      <xsl:apply-templates/>
      </group>
    </stmt>
  </xsl:template>-->
  
  <xsl:template match="control-enhancement">
    <control type="SP800-53-enhancement">
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="@* except @sequence" mode="asElement"/>
      <xsl:apply-templates select="* except title"/>
    </control>
  </xsl:template>
  
  <xsl:template match="@*" mode="asElement">
    <prop role="{name()}"><xsl:value-of select="."/></prop>
  </xsl:template>
  
  <xsl:template match="@sequence" mode="asElement"/>
  
  <xsl:template match="potential-assessment">
    <control type="assessment">
      <xsl:apply-templates select="@* except @sequence" mode="asElement"/>
      <description>
        <ul>
        <xsl:apply-templates/>
        </ul>
      </description>
    </control>
  </xsl:template>
  
  <xsl:template match="object">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="priority | baseline-impact">
    <prop role="{name()}">
      <xsl:apply-templates/>
    </prop>  
  </xsl:template>

  <xsl:template match="reference">
    <ref>
      <std>
        <!-- NISO STS -->
        <xsl:apply-templates select="@href"/>
        <!--<xsl:comment> or STS &lt;std> ... </xsl:comment>-->
        <xsl:apply-templates/>
      </std>
    </ref>
  </xsl:template>
  
  <xsl:template match="@href">
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="html:div">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="html:div[exists(child::text()[matches(.,'\S')])]">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  
  <xsl:template match="html:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!--<xsl:template match="html:ol">
    <list list-type="ordered">
      <xsl:apply-templates/>
    </list>
  </xsl:template>
  
  
  <xsl:template match="html:li">
    <list-item>
      <p>
        <!-\-<xsl:copy-of select="@class"/>-\->
        <xsl:apply-templates select="node() except html:ol"/>
      </p>
      <!-\- safe since in the input, nested html lists are always at the ends of their items. -\->
      <xsl:apply-templates select="html:ol"/>
    </list-item>
  </xsl:template>

  <!-\- Sorry ... -\->
  <xsl:template match="html:em">
    <italic>
      <xsl:apply-templates/>
    </italic>
  </xsl:template>-->
  
  <xsl:template match="html:*">
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:message terminate="no">
      <xsl:value-of select="name()"/>
      <xsl:text> NOT MATCHED </xsl:text>
    </xsl:message>
    <xsl:next-match/>
  </xsl:template>
  
</xsl:stylesheet>