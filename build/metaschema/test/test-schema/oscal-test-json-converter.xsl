<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- METASCHEMA conversion stylesheet supports JSON->XML conversion -->
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:preserve-space elements="string"/>
   <xsl:param name="json-file" as="xs:string"/>
   <xsl:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/>
   <xsl:template match="/">
      <xsl:choose>
         <xsl:when test="exists($json-xml/map)">
            <xsl:apply-templates select="$json-xml" mode="json2xml"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="json2xml"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="array" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="array[@key='prose']/*" priority="5" mode="json2xml"><!-- This will have to be post-processed to render markdown into markup -->
      <xsl:element name="p" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="string[@key='RICHTEXT']" mode="json2xml">
      <xsl:comment> Not yet handling markdown </xsl:comment>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="string[@key='STRVALUE']" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="*"/>
   <xsl:template mode="as-attribute" match="map">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="string[@key='id']" priority="0.4">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- 000 Handling assembly "base" 000 -->
   <xsl:template match="*[@key='base'] | *[@key='base-contructs']/* | /map[empty(@key)]"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="base" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string-required')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-mixed')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('plural', 'plurals')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('plural-mixed', 'plurals-mixed')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('chunk')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('block', 'block')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('tweedledee')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('tweedledum')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "single-string-required" 000 -->
   <xsl:template match="*[@key='single-string-required']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="single-string-required"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "single-string" 000 -->
   <xsl:template match="*[@key='single-string']" priority="2" mode="json2xml">
      <xsl:element name="single-string" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "single-mixed" 000 -->
   <xsl:template match="*[@key='single-mixed']" priority="2" mode="json2xml">
      <xsl:element name="single-mixed" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "plural" 000 -->
   <xsl:template match="*[@key='plural'] | *[@key='plurals']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="plural" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "plural-mixed" 000 -->
   <xsl:template match="*[@key='plural-mixed'] | *[@key='plurals-mixed']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="plural-mixed" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "plural-flagged-mixed" 000 -->
   <xsl:template match="*[@key='plural-flagged-mixed'] | *[@key='plurals']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="plural-flagged-mixed"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "chunk" 000 -->
   <xsl:template match="*[@key='chunk']" priority="2" mode="json2xml">
      <xsl:element name="chunk" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string-required')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "block" 000 -->
   <xsl:template match="*[@key='block']" priority="2" mode="json2xml">
      <xsl:element name="block" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string-required')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "tweedledee" 000 -->
   <xsl:template match="*[@key='tweedledee']" priority="2" mode="json2xml">
      <xsl:element name="tweedledee" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string-required')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "tweedledum" 000 -->
   <xsl:template match="*[@key='tweedledum']" priority="2" mode="json2xml">
      <xsl:element name="tweedledum" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-string-required')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "some_string" 000 -->
   <xsl:template match="*[@key='some_string']" mode="json2xml"/>
   <xsl:template match="*[@key='base']/*[@key='some_string'] | *[@key='base-contructs']/*/*[@key='some_string']"
                 mode="as-attribute">
      <xsl:attribute name="some_string">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='base']/*[@key='id'] | *[@key='base-contructs']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
</xsl:stylesheet>
