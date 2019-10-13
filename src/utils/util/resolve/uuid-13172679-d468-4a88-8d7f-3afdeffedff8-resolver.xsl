<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                default-mode="oscal:filter">
   <xsl:strip-space elements="catalog metadata group requirement control part param"/>
   <xsl:output indent="yes"/>
   <xsl:mode name="oscal:filter" on-no-match="shallow-copy"/>
   <xsl:mode name="oscal:propagate" on-no-match="shallow-copy"/>
   <xsl:mode name="oscal:copy-branch" on-no-match="deep-copy"/>
   <xsl:template match="profile" mode="oscal:filter">
      <xsl:apply-templates select="import" mode="#current"/>
   </xsl:template>
   <xsl:key name="resource-fetch" match="resource" use="'#' || @id"/>
   <xsl:template match="resource[rlink/@href castable as xs:anyURI]" mode="oscal:fetch">
      <xsl:apply-templates select="document(rlink/@href,/)" mode="oscal:filter"/>
   </xsl:template>
   <xsl:template match="import" mode="oscal:filter">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:if test="starts-with(@href,'#')">
            <xsl:apply-templates select="key('resource-fetch',@href)" mode="oscal:fetch"/>
         </xsl:if>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="catalog" mode="oscal:filter">
      <xsl:copy>
         <xsl:apply-templates mode="#current" select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="/*/@id" mode="oscal:filter">
      <xsl:attribute name="id" expand-text="true">PROFILE-RESULTS-{.}</xsl:attribute>
   </xsl:template>
   <xsl:template match="metadata" mode="oscal:filter"/>
   <xsl:template priority="2" match="group" mode="oscal:filter">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3" match="control" mode="oscal:filter">
      <xsl:apply-templates select="." mode="oscal:propagate"/>
   </xsl:template>
   <xsl:template match="control" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template match="group/*" mode="oscal:filter"/>
      <xsl:template priority="10" match="control" mode="oscal:propagate"/>
         <xsl:template priority="11" match="control[@id='ac-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-14']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-17']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-18']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-19']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-20']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ac-22']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='at-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='at-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='at-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='at-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-9']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-11']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='au-12']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ca-9']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-10']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cm-11']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-9']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='cp-10']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-2.1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-2.12']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-5.1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-5.11']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-8.1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-8.2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-8.3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ia-8.4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ir-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ma-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ma-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ma-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ma-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='mp-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='mp-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='mp-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='mp-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-12']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-13']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-14']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-15']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pe-16']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pl-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pl-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='pl-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-6']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ps-8']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ra-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ra-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ra-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='ra-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-4.10']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sa-9']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-7']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-12']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-13']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-15']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-20']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-21']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-22']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='sc-39']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-1']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-2']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-3']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-4']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-5']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
         <xsl:template priority="11" match="control[@id='si-12']" mode="oscal:propagate">
      <xsl:copy>
         <xsl:apply-templates select="@* | node()" mode="oscal:filter"/>
      </xsl:copy>
   </xsl:template>
      
   </xsl:stylesheet>
