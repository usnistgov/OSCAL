<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    >
    <!-- Running on HTML source such as file:/home/wendell/Documents/OSCAL/docs/prose/Merge-Diagrams.html   -->
    
    <!-- Producing OSCAL bits from the figures therein; given suitable control/enhancement, they might even be serviceable for unit tests.
         Initial goal is, however, only diagramming. -->

    <xsl:strip-space elements="*"/>
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <oscal>
            <xsl:apply-templates select="//figure/div"/>
        </oscal>
    </xsl:template>
    
    <!--profile import resolution error catalog group warning-->
    
    <xsl:template match="div[contains-token(@class,'profile')]">
        <profile>
            <xsl:apply-templates/>
            <xsl:call-template name="making-calls"/>
        </profile>
    </xsl:template>
    
    <xsl:template match="div[contains-token(@class,'import')]">
        <import>
            <xsl:apply-templates/>
            <xsl:call-template name="making-calls"/>
        </import>
    </xsl:template>
    
    <xsl:template match="div[contains-token(@class,'resolution')]">
        <resolution>
            <xsl:apply-templates/>
            <xsl:call-template name="making-calls"/>
        </resolution>
    </xsl:template>
    
    <xsl:template match="div[contains-token(@class,'catalog')]">
        <catalog>
            <xsl:apply-templates/>
            <xsl:call-template name="making-calls"/>
        </catalog>
    </xsl:template>
    
    <xsl:template match="div[contains-token(@class,'group')]">
        <group>
            <xsl:apply-templates/>
            <xsl:call-template name="making-calls"/>
        </group>
    </xsl:template>
    
    <xsl:template match="div/span">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template name="making-calls">
      <xsl:for-each-group select="p" group-by="contains-token(@class,'exclude')">
          <xsl:choose>
              <xsl:when test="current-grouping-key()">
                  <exclude>
                      <xsl:apply-templates select="current-group()" mode="called"/>
                  </exclude>
              </xsl:when>
              <xsl:otherwise>
                  <include>
                      <xsl:apply-templates select="current-group()" mode="called"/>
                  </include>
              </xsl:otherwise>
          </xsl:choose>
      </xsl:for-each-group>
        
    </xsl:template>
    
    <xsl:template match="p"/>
    
    <xsl:template match="p" mode="called">
        <call><xsl:apply-templates/></call>
    </xsl:template>
    
    
    <!--
    semantics of p
      plain p becomes include/all + comment
      
      
      
    include
    exclude
    warning
    error
    subcontrol
    ws - means with-subcontrol
    
    -->
</xsl:stylesheet>