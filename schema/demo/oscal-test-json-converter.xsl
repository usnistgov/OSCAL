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
   <xsl:template match="/map[empty(@key)]" priority="10" mode="json2xml">
      <xsl:apply-templates mode="#current" select="*[@key=('')]"/>
   </xsl:template>
   <xsl:template match="array" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="array[@key='prose']/*" priority="5" mode="json2xml"><!-- This will have to be post-processed to render markdown into markup -->
      <xsl:element name="p" namespace="urn:fakeup">
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
   <!-- 000 Handling assembly "kit" 000 -->
   <xsl:template match="*[@key='kit'] | *[@key='thing-kit']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="kit" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('thing', 'things')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "thing" 000 -->
   <xsl:template match="*[@key='thing'] | *[@key='things']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="thing" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-required-field')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('acquired-model')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-mixed-field')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('plural-field', 'plurals')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('plural-mixed-field', 'plurals-mixed')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-chunk')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('chunk-among-chunks', 'chunks-together')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('vanilla')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('chocolate')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "single-required-field" 000 -->
   <xsl:template match="*[@key='single-required-field']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="single-required-field" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "acquired-model" 000 -->
   <xsl:template match="*[@key='acquired-model']" priority="2" mode="json2xml">
      <xsl:element name="acquired-model" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "single-mixed-field" 000 -->
   <xsl:template match="*[@key='single-mixed-field']" priority="2" mode="json2xml">
      <xsl:element name="single-mixed-field" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "plural-field" 000 -->
   <xsl:template match="*[@key='plural-field'] | *[@key='plurals']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="plural-field" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "plural-mixed-field" 000 -->
   <xsl:template match="*[@key='plural-mixed-field'] | *[@key='plurals-mixed']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="plural-mixed-field" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "single-chunk" 000 -->
   <xsl:template match="*[@key='single-chunk']" priority="2" mode="json2xml">
      <xsl:element name="single-chunk" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-required-field')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "chunk-among-chunks" 000 -->
   <xsl:template match="*[@key='chunk-among-chunks']" priority="2" mode="json2xml">
      <xsl:element name="chunk-among-chunks" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-required-field')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "vanilla" 000 -->
   <xsl:template match="*[@key='vanilla']" priority="2" mode="json2xml">
      <xsl:element name="vanilla" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-required-field')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "chocolate" 000 -->
   <xsl:template match="*[@key='chocolate']" priority="2" mode="json2xml">
      <xsl:element name="chocolate" namespace="urn:fakeup">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('single-required-field')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "some_string" 000 -->
   <xsl:template match="*[@key='some_string']" mode="json2xml"/>
   <xsl:template match="*[@key='kit']/*[@key='some_string'] | *[@key='thing-kit']/*/*[@key='some_string'] | *[@key='thing']/*[@key='some_string'] | *[@key='things']/*/*[@key='some_string']"
                 mode="as-attribute">
      <xsl:attribute name="some_string">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='kit']/*[@key='id'] | *[@key='thing-kit']/*/*[@key='id'] | *[@key='thing']/*[@key='id'] | *[@key='things']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
</xsl:stylesheet>
