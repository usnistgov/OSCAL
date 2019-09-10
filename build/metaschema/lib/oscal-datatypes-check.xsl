<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                version="3.0">
   <xsl:function name="m:datatype-validate" as="xs:boolean">
      <xsl:param name="value" as="item()"/>
      <xsl:param name="nominal-type" as="item()?"/>
      <xsl:variable name="test-type" as="xs:string">
         <xsl:choose>
            <xsl:when test="empty($nominal-type)">string</xsl:when>
            <xsl:when test="$nominal-type = ('IDREFS', 'NMTOKENS')">string</xsl:when>
            <xsl:when test="$nominal-type = ('ID', 'IDREF')">NCName</xsl:when>
            <xsl:otherwise expand-text="yes">{ $nominal-type }</xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:variable name="proxy" as="element()">
         <xsl:element namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                      name="{$test-type}"
                      expand-text="true">{$value}</xsl:element>
      </xsl:variable>
      <xsl:apply-templates select="$proxy" mode="m:validate-type"/>
   </xsl:function>
   <xsl:template match="m:boolean" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:boolean"/>
   </xsl:template>
   <xsl:template match="m:string" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:string"/>
   </xsl:template>
   <xsl:template match="m:NCName" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:NCName"/>
   </xsl:template>
   <xsl:template match="m:NMTOKENS" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:NMTOKENS"/>
   </xsl:template>
   <xsl:template match="m:decimal" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:decimal"/>
   </xsl:template>
   <xsl:template match="m:integer" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:integer"/>
   </xsl:template>
   <xsl:template match="m:nonNegativeInteger" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:nonNegativeInteger"/>
   </xsl:template>
   <xsl:template match="m:positiveInteger" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:positiveInteger"/>
   </xsl:template>
   <xsl:template match="m:ID" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:ID"/>
   </xsl:template>
   <xsl:template match="m:IDREF" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:IDREF"/>
   </xsl:template>
   <xsl:template match="m:IDREFS" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:IDREFS"/>
   </xsl:template>
   <xsl:template match="m:date" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:date"/>
   </xsl:template>
   <xsl:template match="m:dateTime" mode="m:validate-type" as="xs:boolean">
      <xsl:sequence select=". castable as xs:dateTime"/>
   </xsl:template>
   <xsl:template match="m:ip-v4-address" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]).){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:string) and $extra"/>
   </xsl:template>
   <xsl:template match="m:ip-v6-address" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|[fF][eE]80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::([fF]{4}(:0{1,4}){0,1}:){0,1}((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]).){3,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]).){3,3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9]))$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:string) and $extra"/>
   </xsl:template>
   <xsl:template match="m:dateTime-with-timezone"
                 mode="m:validate-type"
                 as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^.+T.+(Z|[+-].+)$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:dateTime) and $extra"/>
   </xsl:template>
   <xsl:template match="m:date-with-timezone" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^.+[:Z].*$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:date) and $extra"/>
   </xsl:template>
   <xsl:template match="m:email" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^.+@.+$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:string) and $extra"/>
   </xsl:template>
   <xsl:template match="m:hostname" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^.+$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:string) and $extra"/>
   </xsl:template>
   <xsl:template match="m:uri" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra">
         <xsl:sequence select="matches(.,'^\p{L}[\p{L}\d+\-\.]*:.+$')"/>
      </xsl:variable>
      <xsl:sequence select="(. castable as xs:anyURI) and $extra"/>
   </xsl:template>
   <xsl:template match="m:uri-reference" mode="m:validate-type" as="xs:boolean">
      <xsl:variable name="extra"/>
      <xsl:sequence select="(. castable as xs:anyURI) and $extra"/>
   </xsl:template>
</xsl:stylesheet>
