<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- OSCAL plan-of-action-and-milestones conversion stylesheet supports JSON->XML conversion -->
   <xsl:param name="target-ns"
              as="xs:string?"
              select="'http://csrc.nist.gov/ns/oscal/1.0'"/>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:preserve-space elements="string"/>
   <xsl:param name="json-file" as="xs:string?"/>
   <xsl:variable name="using-json-file"
                 select="replace($json-file,'^/','') ! ('file:///' || .)"/>
   <xsl:variable name="json-xml"
                 select="unparsed-text($using-json-file) ! json-to-xml(.)"/>
   <xsl:template name="xsl:initial-template" match="/">
      <xsl:choose>
         <xsl:when test="matches($json-file,'\S') and exists($json-xml/map)">
            <xsl:apply-templates select="$json-xml" mode="json2xml"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="json2xml"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/map[empty(@key)]" priority="10" mode="json2xml">
      <xsl:apply-templates mode="#current" select="*[@key=('plan-of-action-and-milestones')]"/>
   </xsl:template>
   <xsl:template match="array" priority="10" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="string[@key='RICHTEXT']" mode="json2xml">
      <xsl:call-template name="parse">
         <xsl:with-param name="markdown-str" select="string(.)"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="string[@key='STRVALUE']" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="*"/>
   <xsl:template mode="as-attribute" match="string[@key='id']" priority="0.4">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- *** Handling flag @control-id *** -->
   <xsl:template match="*[@key='control-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='objective-status']/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "role-id" *** -->
   <!--*[@key='role-id'] | *[@key='role-ids']  | *[@key='role-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='role-id'] | *[@key='role-ids']  | *[@key='role-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="role-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'role-ids']/array[@key = 'STRVALUE'] | array[@key = 'role-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="role-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'role-ids']/array[@key = 'STRVALUE']/string | array[@key = 'role-ids']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "metadata" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='metadata']" priority="4" mode="json2xml">
      <xsl:element name="metadata" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('published')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('last-modified')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('oscal-version')]"/>
         <xsl:for-each-group group-by="true()" select="*[@key=('revision', 'revision-history')]">
            <xsl:element name="revision-history" namespace="http://csrc.nist.gov/ns/oscal/1.0">
               <xsl:apply-templates mode="#current" select="current-group()"/>
            </xsl:element>
         </xsl:for-each-group>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location', 'locations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party', 'parties')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-party', 'responsible-parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "back-matter" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='back-matter']" priority="4" mode="json2xml">
      <xsl:element name="back-matter" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "revision" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='revision'] | array[@key='revision-history']/* | map[@key='revision-history']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="revision" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('published')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('last-modified')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('oscal-version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "link" *** -->
   <!--*[@key='link'] | *[@key='links']  | *[@key='links']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='link'] | *[@key='links']  | *[@key='links']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="link" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:for-each select="string[@key='text'], self::string">
            <xsl:variable name="markup">
               <xsl:apply-templates mode="infer-inlines"/>
            </xsl:variable>
            <xsl:apply-templates mode="cast-ns" select="$markup"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='link'] | *[@key='links']  | *[@key='links']/*)/string[@key='text']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='link'] | *[@key='links']  | *[@key='links']/*)/string[@key='text']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'links']/array[@key = 'text'] | array[@key = 'links']/map/array[@key = 'text']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="links">
            <xsl:apply-templates mode="expand" select="array[@key = 'text']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'links']/array[@key = 'text']/string | array[@key = 'links']/map/array[@key = 'text']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'text']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="text">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "published" *** -->
   <!--*[@key='published']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='published']" priority="5" mode="json2xml">
      <xsl:element name="published" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "last-modified" *** -->
   <!--*[@key='last-modified']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='last-modified']" priority="5" mode="json2xml">
      <xsl:element name="last-modified" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "version" *** -->
   <!--*[@key='version']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='version']" priority="5" mode="json2xml">
      <xsl:element name="version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "oscal-version" *** -->
   <!--*[@key='oscal-version']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='oscal-version']" priority="5" mode="json2xml">
      <xsl:element name="oscal-version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "doc-id" *** -->
   <!--*[@key='doc-id'] | *[@key='document-ids']  | *[@key='document-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-ids']  | *[@key='document-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='identifier']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='doc-id'] | *[@key='document-ids']  | *[@key='document-ids']/*)/string[@key='identifier']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='doc-id'] | *[@key='document-ids']  | *[@key='document-ids']/*)/string[@key='identifier']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'document-ids']/array[@key = 'identifier'] | array[@key = 'document-ids']/map/array[@key = 'identifier']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="document-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'identifier']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'document-ids']/array[@key = 'identifier']/string | array[@key = 'document-ids']/map/array[@key = 'identifier']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'identifier']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="identifier">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag @type *** -->
   <xsl:template match="*[@key='type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='doc-id']/*[@key='type'] | *[@key='document-ids']/*[@key='type'] | array[@key='document-ids']/*/*[@key='type'] | map[@key='document-ids']/*/*[@key='type'] | *[@key='person-id']/*[@key='type'] | *[@key='person-ids']/*[@key='type'] | array[@key='person-ids']/*/*[@key='type'] | map[@key='person-ids']/*/*[@key='type'] | *[@key='org-id']/*[@key='type'] | *[@key='organization-ids']/*[@key='type'] | array[@key='organization-ids']/*/*[@key='type'] | map[@key='organization-ids']/*/*[@key='type'] | *[@key='address']/*[@key='type'] | *[@key='addresses']/*[@key='type'] | array[@key='addresses']/*/*[@key='type'] | map[@key='addresses']/*/*[@key='type'] | *[@key='phone']/*[@key='type'] | *[@key='telephone-numbers']/*[@key='type'] | array[@key='telephone-numbers']/*/*[@key='type'] | map[@key='telephone-numbers']/*/*[@key='type'] | *[@key='id-ref']/*[@key='type'] | *[@key='id-refs']/*[@key='type'] | array[@key='id-refs']/*/*[@key='type'] | map[@key='id-refs']/*/*[@key='type'] | *[@key='relevant-evidence']/*[@key='type'] | *[@key='evidence-group']/*[@key='type'] | array[@key='evidence-group']/*/*[@key='type'] | map[@key='evidence-group']/*/*[@key='type'] | *[@key='reference']/*[@key='type'] | *[@key='references']/*[@key='type'] | array[@key='references']/*/*[@key='type'] | map[@key='references']/*/*[@key='type'] | *[@key='tracking-entry']/*[@key='type'] | *[@key='tracking-entries']/*[@key='type'] | array[@key='tracking-entries']/*/*[@key='type'] | map[@key='tracking-entries']/*/*[@key='type'] | *[@key='remediation']/*[@key='type'] | *[@key='remediation-group']/*[@key='type'] | array[@key='remediation-group']/*/*[@key='type'] | map[@key='remediation-group']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "prop" *** -->
   <!--*[@key='prop'] | *[@key='properties']  | *[@key='properties']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']  | *[@key='properties']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='value']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='prop'] | *[@key='properties']  | *[@key='properties']/*)/string[@key='value']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='prop'] | *[@key='properties']  | *[@key='properties']/*)/string[@key='value']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'properties']/array[@key = 'value'] | array[@key = 'properties']/map/array[@key = 'value']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="properties">
            <xsl:apply-templates mode="expand" select="array[@key = 'value']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'properties']/array[@key = 'value']/string | array[@key = 'properties']/map/array[@key = 'value']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'value']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="value">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "annotation" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='annotation'] | array[@key='annotations']/* | map[@key='annotations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="annotation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "annotation/@value" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='annotation']/*[@key='value'] | *[@key='annotations']/*[@key='value'] | *[@key='annotations']/*/*[@key='value']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='annotation']/*[@key='value'] | *[@key='annotations']/*[@key='value'] | *[@key='annotations']/*/*[@key='value']"
                 mode="as-attribute">
      <xsl:attribute name="value">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @name *** -->
   <xsl:template match="*[@key='name']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='name'] | *[@key='properties']/*[@key='name'] | array[@key='properties']/*/*[@key='name'] | map[@key='properties']/*/*[@key='name'] | *[@key='annotation']/*[@key='name'] | *[@key='annotations']/*[@key='name'] | array[@key='annotations']/*/*[@key='name'] | map[@key='annotations']/*/*[@key='name']"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @ns *** -->
   <xsl:template match="*[@key='ns']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='ns'] | *[@key='properties']/*[@key='ns'] | array[@key='properties']/*/*[@key='ns'] | map[@key='properties']/*/*[@key='ns'] | *[@key='annotation']/*[@key='ns'] | *[@key='annotations']/*[@key='ns'] | array[@key='annotations']/*/*[@key='ns'] | map[@key='annotations']/*/*[@key='ns']"
                 mode="as-attribute">
      <xsl:attribute name="ns">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @class *** -->
   <xsl:template match="*[@key='class']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*[@key='class'] | array[@key='properties']/*/*[@key='class'] | map[@key='properties']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "location" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='location'] | array[@key='locations']/* | map[@key='locations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="location" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "location-id" *** -->
   <!--*[@key='location-id'] | *[@key='location-ids']  | *[@key='location-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='location-id'] | *[@key='location-ids']  | *[@key='location-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="location-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'location-ids']/array[@key = 'STRVALUE'] | array[@key = 'location-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="location-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'location-ids']/array[@key = 'STRVALUE']/string | array[@key = 'location-ids']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "party" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='party'] | array[@key='parties']/* | map[@key='parties']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="party" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person', 'persons')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "party-id" *** -->
   <!--*[@key='party-id'] | *[@key='party-ids']  | *[@key='party-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='party-id'] | *[@key='party-ids']  | *[@key='party-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="party-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'party-ids']/array[@key = 'STRVALUE'] | array[@key = 'party-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="party-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'party-ids']/array[@key = 'STRVALUE']/string | array[@key = 'party-ids']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "person" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='person'] | array[@key='persons']/* | map[@key='persons']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="person" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person-id', 'person-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address', 'addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-id', 'location-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "org" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='org']" priority="4" mode="json2xml">
      <xsl:element name="org" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address', 'addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-id', 'location-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "person-id" *** -->
   <!--*[@key='person-id'] | *[@key='person-ids']  | *[@key='person-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='person-id'] | *[@key='person-ids']  | *[@key='person-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="person-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='id']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='person-id'] | *[@key='person-ids']  | *[@key='person-ids']/*)/string[@key='id']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='person-id'] | *[@key='person-ids']  | *[@key='person-ids']/*)/string[@key='id']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'person-ids']/array[@key = 'id'] | array[@key = 'person-ids']/map/array[@key = 'id']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="person-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'id']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'person-ids']/array[@key = 'id']/string | array[@key = 'person-ids']/map/array[@key = 'id']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'id']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="id">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "org-id" *** -->
   <!--*[@key='org-id'] | *[@key='organization-ids']  | *[@key='organization-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-ids']  | *[@key='organization-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='id']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='org-id'] | *[@key='organization-ids']  | *[@key='organization-ids']/*)/string[@key='id']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='org-id'] | *[@key='organization-ids']  | *[@key='organization-ids']/*)/string[@key='id']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'organization-ids']/array[@key = 'id'] | array[@key = 'organization-ids']/map/array[@key = 'id']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="organization-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'id']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'organization-ids']/array[@key = 'id']/string | array[@key = 'organization-ids']/map/array[@key = 'id']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'id']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="id">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "rlink" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='rlink'] | array[@key='rlinks']/* | map[@key='rlinks']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="rlink" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hash', 'hashes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag @media-type *** -->
   <xsl:template match="*[@key='media-type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='media-type'] | *[@key='links']/*[@key='media-type'] | array[@key='links']/*/*[@key='media-type'] | map[@key='links']/*/*[@key='media-type'] | *[@key='rlink']/*[@key='media-type'] | *[@key='rlinks']/*[@key='media-type'] | array[@key='rlinks']/*/*[@key='media-type'] | map[@key='rlinks']/*/*[@key='media-type'] | *[@key='base64']/*[@key='media-type'] | *[@key='attachments']/*[@key='media-type'] | array[@key='attachments']/*/*[@key='media-type'] | map[@key='attachments']/*/*[@key='media-type']"
                 mode="as-attribute">
      <xsl:attribute name="media-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "person-name" *** -->
   <!--*[@key='person-name']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='person-name']" priority="5" mode="json2xml">
      <xsl:element name="person-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "org-name" *** -->
   <!--*[@key='org-name']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='org-name']" priority="5" mode="json2xml">
      <xsl:element name="org-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "short-name" *** -->
   <!--*[@key='short-name']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='short-name']" priority="5" mode="json2xml">
      <xsl:element name="short-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "address" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='address'] | array[@key='addresses']/* | map[@key='addresses']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="address" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('addr-line', 'postal-address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('city')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('state')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('postal-code')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('country')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "addr-line" *** -->
   <!--*[@key='addr-line'] | *[@key='postal-address']  | *[@key='postal-address']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='addr-line'] | *[@key='postal-address']  | *[@key='postal-address']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="addr-line" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'postal-address']/array[@key = 'STRVALUE'] | array[@key = 'postal-address']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="postal-address">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'postal-address']/array[@key = 'STRVALUE']/string | array[@key = 'postal-address']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "city" *** -->
   <!--*[@key='city']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='city']" priority="5" mode="json2xml">
      <xsl:element name="city" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "state" *** -->
   <!--*[@key='state']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='state']" priority="5" mode="json2xml">
      <xsl:element name="state" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "postal-code" *** -->
   <!--*[@key='postal-code']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='postal-code']" priority="5" mode="json2xml">
      <xsl:element name="postal-code" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "country" *** -->
   <!--*[@key='country']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='country']" priority="5" mode="json2xml">
      <xsl:element name="country" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "email" *** -->
   <!--*[@key='email'] | *[@key='email-addresses']  | *[@key='email-addresses']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']  | *[@key='email-addresses']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="email" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'email-addresses']/array[@key = 'STRVALUE'] | array[@key = 'email-addresses']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="email-addresses">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'email-addresses']/array[@key = 'STRVALUE']/string | array[@key = 'email-addresses']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "phone" *** -->
   <!--*[@key='phone'] | *[@key='telephone-numbers']  | *[@key='telephone-numbers']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']  | *[@key='telephone-numbers']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="phone" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='number']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='phone'] | *[@key='telephone-numbers']  | *[@key='telephone-numbers']/*)/string[@key='number']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='phone'] | *[@key='telephone-numbers']  | *[@key='telephone-numbers']/*)/string[@key='number']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'telephone-numbers']/array[@key = 'number'] | array[@key = 'telephone-numbers']/map/array[@key = 'number']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="telephone-numbers">
            <xsl:apply-templates mode="expand" select="array[@key = 'number']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'telephone-numbers']/array[@key = 'number']/string | array[@key = 'telephone-numbers']/map/array[@key = 'number']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'number']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="number">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "url" *** -->
   <!--*[@key='url'] | *[@key='URLs']  | *[@key='URLs']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='url'] | *[@key='URLs']  | *[@key='URLs']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="url" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'URLs']/array[@key = 'STRVALUE'] | array[@key = 'URLs']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="URLs">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'URLs']/array[@key = 'STRVALUE']/string | array[@key = 'URLs']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "desc" *** -->
   <!--*[@key='desc']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='desc']" priority="5" mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "text" *** -->
   <!--*[@key='text']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='text']" priority="5" mode="json2xml">
      <xsl:element name="text" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:for-each select="string[@key='RICHTEXT'], self::string">
            <xsl:variable name="markup">
               <xsl:apply-templates mode="infer-inlines"/>
            </xsl:variable>
            <xsl:apply-templates mode="cast-ns" select="$markup"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "biblio" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='biblio']" priority="4" mode="json2xml">
      <xsl:element name="biblio" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "resource" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='resource'] | array[@key='resources']/* | map[@key='resources']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="resource" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('citation')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('rlink', 'rlinks')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base64', 'attachments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "citation" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='citation']" priority="4" mode="json2xml">
      <xsl:element name="citation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('text')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('biblio')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "hash" *** -->
   <!--*[@key='hash'] | *[@key='hashes']  | *[@key='hashes']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='hash'] | *[@key='hashes']  | *[@key='hashes']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="hash" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='value']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='hash'] | *[@key='hashes']  | *[@key='hashes']/*)/string[@key='value']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='hash'] | *[@key='hashes']  | *[@key='hashes']/*)/string[@key='value']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'hashes']/array[@key = 'value'] | array[@key = 'hashes']/map/array[@key = 'value']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="hashes">
            <xsl:apply-templates mode="expand" select="array[@key = 'value']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'hashes']/array[@key = 'value']/string | array[@key = 'hashes']/map/array[@key = 'value']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'value']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="value">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag @algorithm *** -->
   <xsl:template match="*[@key='algorithm']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='hash']/*[@key='algorithm'] | *[@key='hashes']/*[@key='algorithm'] | array[@key='hashes']/*/*[@key='algorithm'] | map[@key='hashes']/*/*[@key='algorithm']"
                 mode="as-attribute">
      <xsl:attribute name="algorithm">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "role" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='role'] | array[@key='roles']/* | map[@key='roles']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "responsible-party" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='responsible-party'] | array[@key='responsible-parties']/* | map[@key='responsible-parties']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="responsible-party" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-id', 'party-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('responsible-parties')]"
                 priority="5"
                 mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('responsible-parties')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('responsible-parties')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="responsible-party" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-id', 'party-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "responsible-party/@role-id" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='responsible-party']/*[@key='role-id'] | *[@key='responsible-parties']/*[@key='role-id'] | *[@key='responsible-parties']/*/*[@key='role-id']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='responsible-party']/*[@key='role-id'] | *[@key='responsible-parties']/*[@key='role-id'] | *[@key='responsible-parties']/*/*[@key='role-id']"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @href *** -->
   <xsl:template match="*[@key='href']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='href'] | *[@key='links']/*[@key='href'] | array[@key='links']/*/*[@key='href'] | map[@key='links']/*/*[@key='href'] | *[@key='rlink']/*[@key='href'] | *[@key='rlinks']/*[@key='href'] | array[@key='rlinks']/*/*[@key='href'] | map[@key='rlinks']/*/*[@key='href'] | *[@key='import-ssp']/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @id *** -->
   <xsl:template match="*[@key='id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='id'] | *[@key='properties']/*[@key='id'] | array[@key='properties']/*/*[@key='id'] | map[@key='properties']/*/*[@key='id'] | *[@key='annotation']/*[@key='id'] | *[@key='annotations']/*[@key='id'] | array[@key='annotations']/*/*[@key='id'] | map[@key='annotations']/*/*[@key='id'] | *[@key='location']/*[@key='id'] | *[@key='locations']/*[@key='id'] | array[@key='locations']/*/*[@key='id'] | map[@key='locations']/*/*[@key='id'] | *[@key='party']/*[@key='id'] | *[@key='parties']/*[@key='id'] | array[@key='parties']/*/*[@key='id'] | map[@key='parties']/*/*[@key='id'] | *[@key='resource']/*[@key='id'] | *[@key='resources']/*[@key='id'] | array[@key='resources']/*/*[@key='id'] | map[@key='resources']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*[@key='id'] | array[@key='roles']/*/*[@key='id'] | map[@key='roles']/*/*[@key='id'] | *[@key='id-ref']/*[@key='id'] | *[@key='id-refs']/*[@key='id'] | array[@key='id-refs']/*/*[@key='id'] | map[@key='id-refs']/*/*[@key='id'] | *[@key='schedule']/*[@key='id'] | *[@key='artifact']/*[@key='id'] | *[@key='artifacts']/*[@key='id'] | array[@key='artifacts']/*/*[@key='id'] | map[@key='artifacts']/*/*[@key='id'] | *[@key='results']/*[@key='id'] | *[@key='finding']/*[@key='id'] | *[@key='findings']/*[@key='id'] | array[@key='findings']/*/*[@key='id'] | map[@key='findings']/*/*[@key='id'] | *[@key='observation']/*[@key='id'] | *[@key='observations']/*[@key='id'] | array[@key='observations']/*/*[@key='id'] | map[@key='observations']/*/*[@key='id'] | *[@key='risk']/*[@key='id'] | *[@key='risks']/*[@key='id'] | array[@key='risks']/*/*[@key='id'] | map[@key='risks']/*/*[@key='id'] | *[@key='tracking-entry']/*[@key='id'] | *[@key='tracking-entries']/*[@key='id'] | array[@key='tracking-entries']/*/*[@key='id'] | map[@key='tracking-entries']/*/*[@key='id'] | *[@key='required-resource']/*[@key='id'] | *[@key='required-resources']/*[@key='id'] | array[@key='required-resources']/*/*[@key='id'] | map[@key='required-resources']/*/*[@key='id'] | *[@key='mitigating-factor']/*[@key='id'] | *[@key='mitigating-factors']/*[@key='id'] | array[@key='mitigating-factors']/*/*[@key='id'] | map[@key='mitigating-factors']/*/*[@key='id'] | *[@key='remediation']/*[@key='id'] | *[@key='remediation-group']/*[@key='id'] | array[@key='remediation-group']/*/*[@key='id'] | map[@key='remediation-group']/*/*[@key='id'] | *[@key='plan-of-action-and-milestones']/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "title" *** -->
   <!--*[@key='title']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='title']" priority="5" mode="json2xml">
      <xsl:element name="title" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:for-each select="string[@key='RICHTEXT'], self::string">
            <xsl:variable name="markup">
               <xsl:apply-templates mode="infer-inlines"/>
            </xsl:variable>
            <xsl:apply-templates mode="cast-ns" select="$markup"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "base64" *** -->
   <!--*[@key='base64'] | *[@key='attachments']  | *[@key='attachments']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='base64'] | *[@key='attachments']  | *[@key='attachments']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="base64" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='value']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='base64'] | *[@key='attachments']  | *[@key='attachments']/*)/string[@key='value']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='base64'] | *[@key='attachments']  | *[@key='attachments']/*)/string[@key='value']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'attachments']/array[@key = 'value'] | array[@key = 'attachments']/map/array[@key = 'value']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="attachments">
            <xsl:apply-templates mode="expand" select="array[@key = 'value']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'attachments']/array[@key = 'value']/string | array[@key = 'attachments']/map/array[@key = 'value']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'value']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="value">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag @filename *** -->
   <xsl:template match="*[@key='filename']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='base64']/*[@key='filename'] | *[@key='attachments']/*[@key='filename'] | array[@key='attachments']/*/*[@key='filename'] | map[@key='attachments']/*/*[@key='filename']"
                 mode="as-attribute">
      <xsl:attribute name="filename">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!--*[@key='description']-->
   <xsl:template match="*[@key='description']" priority="5" mode="json2xml">
      <xsl:element name="description" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:for-each select="string[@key='description'], self::string">
            <xsl:call-template name="parse">
               <xsl:with-param name="markdown-str" select="string(.)"/>
            </xsl:call-template>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!--*[@key='remarks']-->
   <xsl:template match="*[@key='remarks']" priority="5" mode="json2xml">
      <xsl:element name="remarks" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:for-each select="string[@key='remarks'], self::string">
            <xsl:call-template name="parse">
               <xsl:with-param name="markdown-str" select="string(.)"/>
            </xsl:call-template>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "import-ssp" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='import-ssp']" priority="4" mode="json2xml">
      <xsl:element name="import-ssp" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "id-ref" *** -->
   <!--*[@key='id-ref'] | *[@key='id-refs']  | *[@key='id-refs']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='id-ref'] | *[@key='id-refs']  | *[@key='id-refs']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="id-ref" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'id-refs']/array[@key = 'STRVALUE'] | array[@key = 'id-refs']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="id-refs">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'id-refs']/array[@key = 'STRVALUE']/string | array[@key = 'id-refs']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "schedule" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='schedule']" priority="4" mode="json2xml">
      <xsl:element name="schedule" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('task', 'tasks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "task" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='task'] | array[@key='tasks']/* | map[@key='tasks']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="task" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('start')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('end')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('activitiy-id', 'activity-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-id', 'party-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-id', 'location-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "start" *** -->
   <!--*[@key='start']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='start']" priority="5" mode="json2xml">
      <xsl:element name="start" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "end" *** -->
   <!--*[@key='end']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='end']" priority="5" mode="json2xml">
      <xsl:element name="end" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "activitiy-id" *** -->
   <!--*[@key='activitiy-id'] | *[@key='activity-ids']  | *[@key='activity-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='activitiy-id'] | *[@key='activity-ids']  | *[@key='activity-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="activitiy-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'activity-ids']/array[@key = 'STRVALUE'] | array[@key = 'activity-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="activity-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'activity-ids']/array[@key = 'STRVALUE']/string | array[@key = 'activity-ids']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling assembly "evidence-inventory" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='evidence-inventory']" priority="4" mode="json2xml">
      <xsl:element name="evidence-inventory" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('artifact', 'artifacts')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "artifact" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='artifact'] | array[@key='artifacts']/* | map[@key='artifacts']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="artifact" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag @rel *** -->
   <xsl:template match="*[@key='rel']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='rel'] | *[@key='links']/*[@key='rel'] | array[@key='links']/*/*[@key='rel'] | map[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "results" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='results']" priority="4" mode="json2xml">
      <xsl:element name="results" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('start')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('end')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('finding', 'findings')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "finding" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='finding'] | array[@key='findings']/* | map[@key='findings']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="finding" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('date-time-stamp')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('objective-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('observation', 'observations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('threat-id', 'threat-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk', 'risks')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-id', 'party-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "date-time-stamp" *** -->
   <!--*[@key='date-time-stamp']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='date-time-stamp']" priority="5" mode="json2xml">
      <xsl:element name="date-time-stamp" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "objective-status" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='objective-status']" priority="4" mode="json2xml">
      <xsl:element name="objective-status" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('satisfaction')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "satisfaction" *** -->
   <!--*[@key='satisfaction']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='satisfaction']" priority="5" mode="json2xml">
      <xsl:element name="satisfaction" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "satisfaction/@system" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='satisfaction']/*[@key='system']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='satisfaction']/*[@key='system']"
                 mode="as-attribute">
      <xsl:attribute name="system">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "implementation-status" *** -->
   <!--*[@key='implementation-status']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='implementation-status']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="implementation-status"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "observation" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='observation'] | array[@key='observations']/* | map[@key='observations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="observation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('observation-type', 'observation-types')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('reference', 'references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('target', 'targets')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assessor', 'assessors')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('relevant-evidence', 'evidence-group')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "relevant-evidence" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='relevant-evidence'] | array[@key='evidence-group']/* | map[@key='evidence-group']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="relevant-evidence" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "relevant-evidence/@type" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='relevant-evidence']/*[@key='type'] | *[@key='evidence-group']/*[@key='type'] | *[@key='evidence-group']/*/*[@key='type']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='relevant-evidence']/*[@key='type'] | *[@key='evidence-group']/*[@key='type'] | *[@key='evidence-group']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @evidence-id *** -->
   <xsl:template match="*[@key='evidence-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='relevant-evidence']/*[@key='evidence-id'] | *[@key='evidence-group']/*[@key='evidence-id'] | array[@key='evidence-group']/*/*[@key='evidence-id'] | map[@key='evidence-group']/*/*[@key='evidence-id']"
                 mode="as-attribute">
      <xsl:attribute name="evidence-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "assessor" *** -->
   <!--*[@key='assessor'] | *[@key='assessors']  | *[@key='assessors']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assessor'] | *[@key='assessors']  | *[@key='assessors']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="assessor" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'assessors']/array[@key = 'STRVALUE'] | array[@key = 'assessors']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="assessors">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'assessors']/array[@key = 'STRVALUE']/string | array[@key = 'assessors']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag "assessor/@party-id" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='assessor']/*[@key='party-id'] | *[@key='assessors']/*[@key='party-id'] | *[@key='assessors']/*/*[@key='party-id']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='assessor']/*[@key='party-id'] | *[@key='assessors']/*[@key='party-id'] | *[@key='assessors']/*/*[@key='party-id']"
                 mode="as-attribute">
      <xsl:attribute name="party-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "target" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='target'] | array[@key='targets']/* | map[@key='targets']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="target" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('component-id', 'components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('inventory-item-id', 'items')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "component-id" *** -->
   <!--*[@key='component-id'] | *[@key='components']  | *[@key='components']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='component-id'] | *[@key='components']  | *[@key='components']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="component-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'components']/array[@key = 'STRVALUE'] | array[@key = 'components']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="components">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'components']/array[@key = 'STRVALUE']/string | array[@key = 'components']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "inventory-item-id" *** -->
   <!--*[@key='inventory-item-id'] | *[@key='items']  | *[@key='items']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='inventory-item-id'] | *[@key='items']  | *[@key='items']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="inventory-item-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'items']/array[@key = 'STRVALUE'] | array[@key = 'items']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="items">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'items']/array[@key = 'STRVALUE']/string | array[@key = 'items']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "reference" *** -->
   <!--*[@key='reference'] | *[@key='references']  | *[@key='references']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='reference'] | *[@key='references']  | *[@key='references']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="reference" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'references']/array[@key = 'STRVALUE'] | array[@key = 'references']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="references">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'references']/array[@key = 'STRVALUE']/string | array[@key = 'references']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag "reference/@ref-id" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='reference']/*[@key='ref-id'] | *[@key='references']/*[@key='ref-id'] | *[@key='references']/*/*[@key='ref-id']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='reference']/*[@key='ref-id'] | *[@key='references']/*[@key='ref-id'] | *[@key='references']/*/*[@key='ref-id']"
                 mode="as-attribute">
      <xsl:attribute name="ref-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag "reference/@type" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='reference']/*[@key='type'] | *[@key='references']/*[@key='type'] | *[@key='references']/*/*[@key='type']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='reference']/*[@key='type'] | *[@key='references']/*[@key='type'] | *[@key='references']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "observation-type" *** -->
   <!--*[@key='observation-type'] | *[@key='observation-types']  | *[@key='observation-types']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='observation-type'] | *[@key='observation-types']  | *[@key='observation-types']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="observation-type" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'observation-types']/array[@key = 'STRVALUE'] | array[@key = 'observation-types']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="observation-types">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'observation-types']/array[@key = 'STRVALUE']/string | array[@key = 'observation-types']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling field "threat-id" *** -->
   <!--*[@key='threat-id'] | *[@key='threat-ids']  | *[@key='threat-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='threat-id'] | *[@key='threat-ids']  | *[@key='threat-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="threat-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'threat-ids']/array[@key = 'STRVALUE'] | array[@key = 'threat-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="threat-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'threat-ids']/array[@key = 'STRVALUE']/string | array[@key = 'threat-ids']/map/array[@key = 'STRVALUE']/string">
      <xsl:variable name="me" select="."/>
      <xsl:for-each select="parent::array/parent::map">
         <xsl:copy>
            <xsl:copy-of select="* except array[@key = 'STRVALUE']"/>
            <string xmlns="http://www.w3.org/2005/xpath-functions" key="STRVALUE">
               <xsl:value-of select="$me"/>
            </string>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <!-- *** Handling flag "threat-id/@system" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='threat-id']/*[@key='system'] | *[@key='threat-ids']/*[@key='system'] | *[@key='threat-ids']/*/*[@key='system']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='threat-id']/*[@key='system'] | *[@key='threat-ids']/*[@key='system'] | *[@key='threat-ids']/*/*[@key='system']"
                 mode="as-attribute">
      <xsl:attribute name="system">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag "threat-id/@uri" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='threat-id']/*[@key='uri'] | *[@key='threat-ids']/*[@key='uri'] | *[@key='threat-ids']/*/*[@key='uri']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='threat-id']/*[@key='uri'] | *[@key='threat-ids']/*[@key='uri'] | *[@key='threat-ids']/*/*[@key='uri']"
                 mode="as-attribute">
      <xsl:attribute name="uri">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "risk" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='risk'] | array[@key='risks']/* | map[@key='risks']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="risk" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk-statement')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('mitigating-factor', 'mitigating-factors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remediation', 'remediation-group')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('closure-actions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remediation-tracking')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-id', 'party-ids')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "remediation-tracking" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='remediation-tracking']" priority="4" mode="json2xml">
      <xsl:element name="remediation-tracking"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('tracking-entry', 'tracking-entries')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "tracking-entry" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='tracking-entry'] | array[@key='tracking-entries']/* | map[@key='tracking-entries']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="tracking-entry" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('date-time-stamp')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "required-resource" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='required-resource'] | array[@key='required-resources']/* | map[@key='required-resources']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="required-resource" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('id-ref', 'id-refs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "risk-status" *** -->
   <!--*[@key='risk-status']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='risk-status']" priority="5" mode="json2xml">
      <xsl:element name="risk-status" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!--*[@key='closure-actions']-->
   <xsl:template match="*[@key='closure-actions']" priority="5" mode="json2xml">
      <xsl:element name="closure-actions" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:for-each select="string[@key='closure-actions'], self::string">
            <xsl:call-template name="parse">
               <xsl:with-param name="markdown-str" select="string(.)"/>
            </xsl:call-template>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "mitigating-factor" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='mitigating-factor'] | array[@key='mitigating-factors']/* | map[@key='mitigating-factors']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="mitigating-factor" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('id-ref', 'id-refs')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "remediation" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='remediation'] | array[@key='remediation-group']/* | map[@key='remediation-group']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="remediation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('id-ref', 'id-refs')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('required-resource', 'required-resources')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('schedule')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!--*[@key='risk-statement']-->
   <xsl:template match="*[@key='risk-statement']" priority="5" mode="json2xml">
      <xsl:element name="risk-statement" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:for-each select="string[@key='risk-statement'], self::string">
            <xsl:call-template name="parse">
               <xsl:with-param name="markdown-str" select="string(.)"/>
            </xsl:call-template>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag @implementation-id *** -->
   <xsl:template match="*[@key='implementation-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='mitigating-factor']/*[@key='implementation-id'] | *[@key='mitigating-factors']/*[@key='implementation-id'] | array[@key='mitigating-factors']/*/*[@key='implementation-id'] | map[@key='mitigating-factors']/*/*[@key='implementation-id']"
                 mode="as-attribute">
      <xsl:attribute name="implementation-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @objective-id *** -->
   <xsl:template match="*[@key='objective-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='objective-status']/*[@key='objective-id']"
                 mode="as-attribute">
      <xsl:attribute name="objective-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "plan-of-action-and-milestones" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='plan-of-action-and-milestones'] | /map[empty(@key)]"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="plan-of-action-and-milestones"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import-ssp')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('evidence-inventory')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('results')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('back-matter')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- Markdown converter-->
   <xsl:output indent="yes"/>
   <xsl:template name="parse"><!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        --><!-- $str may be passed in, or we can process the current node -->
      <xsl:param name="markdown-str" as="xs:string" required="yes"/>
      <xsl:variable name="str" select="string($markdown-str) =&gt; replace('\\n','&#xA;')"/>
      <xsl:variable name="starts-with-code" select="matches($str,'^```')"/>
      <!-- Blocks is split between code blocks and everything else -->
      <xsl:variable name="blocks">
         <xsl:for-each-group select="tokenize($str, '\n')"
                             group-starting-with=".[matches(., '^```')]">
            <xsl:variable name="this-is-code"
                          select="not((position() mod 2) + number($starts-with-code))"/>
            <m:p><!-- Adding an attribute flag when this is a code block, code='code' -->
               <xsl:if test="$this-is-code">
                  <xsl:variable name="language"
                                expand-text="true"
                                select="(replace(.,'^```','') ! normalize-space(.))[matches(.,'\S')]"/>
                  <xsl:attribute name="code" select="if ($language) then $language else 'code'"/>
               </xsl:if>
               <xsl:value-of select="string-join(current-group()[not(matches(., '^```'))],'&#xA;')"/>
            </m:p>
         </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="rough-blocks">
         <xsl:apply-templates select="$blocks" mode="parse-block"/>
      </xsl:variable>
      <xsl:variable name="flat-structures">
         <xsl:apply-templates select="$rough-blocks" mode="mark-structures"/>
      </xsl:variable>
      <!-- for debugging <xsl:copy-of select="$flat-structures"/>-->
      <xsl:variable name="nested-structures">
         <xsl:apply-templates select="$flat-structures" mode="build-structures"/>
      </xsl:variable>
      <!-- for debugging <xsl:copy-of select="$nested-structures"/>-->
      <xsl:variable name="fully-marked">
         <xsl:apply-templates select="$nested-structures" mode="infer-inlines"/>
      </xsl:variable>
      <xsl:apply-templates select="$fully-marked" mode="cast-ns"/>
   </xsl:template>
   <xsl:template match="*" mode="copy mark-structures build-structures infer-inlines">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="parse-block"
                 priority="1"
                 match="m:p[exists(@code)]"
                 expand-text="true">
      <xsl:element name="m:pre" namespace="{ $target-ns }">
         <xsl:element name="code" namespace="{ $target-ns }">
            <xsl:for-each select="@code[not(.='code')]">
               <xsl:attribute name="class">language-{.}</xsl:attribute>
            </xsl:for-each>
            <xsl:value-of select="string(.)"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="parse-block" match="m:p" expand-text="true">
      <xsl:for-each select="tokenize(string(.),'\n\s*\n')[normalize-space(.)]">
         <m:p>
            <xsl:value-of select="replace(.,'^\s*\n','')"/>
         </m:p>
      </xsl:for-each>
   </xsl:template>
   <xsl:function name="m:is-table-row-demarcator" as="xs:boolean">
      <xsl:param name="line" as="xs:string"/>
      <xsl:sequence select="matches($line,'^[\|\-:\s]+$')"/>
   </xsl:function>
   <xsl:function name="m:is-table" as="xs:boolean">
      <xsl:param name="line" as="element(m:p)"/>
      <xsl:variable name="lines" select="tokenize($line,'\s*\n')[matches(.,'\S')]"/>
      <xsl:sequence select="(every $l in $lines satisfies matches($l,'^\|')) and (some $l in $lines satisfies m:is-table-row-demarcator($l))"/>
   </xsl:function>
   <xsl:template mode="mark-structures" priority="5" match="m:p[m:is-table(.)]">
      <xsl:variable name="rows">
         <xsl:for-each select="tokenize(string(.),'\s*\n')">
            <m:tr>
               <xsl:value-of select="."/>
            </m:tr>
         </xsl:for-each>
      </xsl:variable>
      <m:table>
         <xsl:apply-templates select="$rows/m:tr" mode="make-row"/>
      </m:table>
   </xsl:template>
   <xsl:template match="m:tr[m:is-table-row-demarcator(string(.))]"
                 priority="5"
                 mode="make-row"/>
   <xsl:template match="m:tr" mode="make-row">
      <m:tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <m:td>
               <xsl:value-of select="."/>
            </m:td>
         </xsl:for-each>
      </m:tr>
   </xsl:template>
   <xsl:template match="m:tr[some $f in (following-sibling::tr) satisfies m:is-table-row-demarcator(string($f))]"
                 mode="make-row">
      <m:tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <m:th>
               <xsl:value-of select="."/>
            </m:th>
         </xsl:for-each>
      </m:tr>
   </xsl:template>
   <xsl:template mode="mark-structures" match="m:p[matches(.,'^#')]"><!-- 's' flag is dot-matches-all, so \n does not impede -->
      <m:p header-level="{ replace(.,'[^#].*$','','s') ! string-length(.) }">
         <xsl:value-of select="replace(.,'^#+\s*','') ! replace(.,'\s+$','')"/>
      </m:p>
   </xsl:template>
   <xsl:variable name="li-regex" as="xs:string">^\s*(\*|\d+\.)\s</xsl:variable>
   <xsl:template mode="mark-structures" match="m:p[matches(.,$li-regex)]">
      <m:list>
         <xsl:for-each-group group-starting-with=".[matches(.,$li-regex)]"
                             select="tokenize(., '\n')">
            <m:li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}"
                  type="{ if (matches(.,'\s*\d')) then 'ol' else 'ul' }">
               <xsl:for-each select="current-group()[normalize-space(.)]">
                  <xsl:if test="not(position() eq 1)">
                     <m:br/>
                  </xsl:if>
                  <xsl:value-of select="replace(., $li-regex, '')"/>
               </xsl:for-each>
            </m:li>
         </xsl:for-each-group>
      </m:list>
   </xsl:template>
   <xsl:template mode="build-structures" match="m:p[@header-level]">
      <xsl:variable name="level" select="(@header-level[6 &gt;= .],6)[1]"/>
      <xsl:element name="m:h{$level}"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
         <xsl:value-of select="."/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="build-structures" match="m:list" name="nest-lists"><!-- Starting at level 0 and grouping  --><!--        -->
      <xsl:param name="level" select="0"/>
      <xsl:param name="group" select="m:li"/>
      <xsl:variable name="this-type" select="$group[1]/@type"/>
      <!--first, splitting ul from ol groups -->
      <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level and not(@type = preceding-sibling::*[1]/@type)]">-->
      <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level]">-->
      <xsl:element name="m:{ $group[1]/@type }"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
         <xsl:for-each-group select="$group"
                             group-starting-with="m:li[(@level = $level) or not(@type = preceding-sibling::*[1]/@type)]">
            <xsl:choose>
               <xsl:when test="@level = $level (: checking first item in group :)">
                  <m:li><!--<xsl:copy-of select="@level"/>-->
                     <xsl:apply-templates mode="copy"/>
                     <xsl:if test="current-group()/@level &gt; $level (: go deeper? :)">
                        <xsl:call-template name="nest-lists">
                           <xsl:with-param name="level" select="$level + 1"/>
                           <xsl:with-param name="group" select="current-group()[@level &gt; $level]"/>
                        </xsl:call-template>
                     </xsl:if>
                  </m:li>
               </xsl:when>
               <xsl:otherwise><!-- fallback for skipping levels -->
                  <m:li><!-- level="{$level}"-->
                     <xsl:call-template name="nest-lists">
                        <xsl:with-param name="level" select="$level + 1"/>
                        <xsl:with-param name="group" select="current-group()"/>
                     </xsl:call-template>
                  </m:li>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:element>
      <!--</xsl:for-each-group>-->
   </xsl:template>
   <xsl:template match="m:pre//text()" mode="infer-inlines">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:template match="text()" mode="infer-inlines">
      <xsl:variable name="markup">
         <xsl:apply-templates select="$tag-replacements/m:rules">
            <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
         </xsl:apply-templates>
      </xsl:variable>
      <xsl:try select="parse-xml-fragment($markup)">
         <xsl:catch select="."/>
      </xsl:try>
   </xsl:template>
   <xsl:template mode="cast-ns" match="*">
      <xsl:element name="{local-name()}" namespace="{ $target-ns }">
         <xsl:copy-of select="@*[matches(.,'\S')]"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="m:rules" as="xs:string"><!-- Original is only provided for processing text nodes -->
      <xsl:param name="original" as="text()?" tunnel="yes"/>
      <xsl:param name="starting" as="xs:string" select="string($original)"/>
      <xsl:iterate select="*">
         <xsl:param name="original" select="$original" as="text()?"/>
         <xsl:param name="str" select="$starting" as="xs:string"/>
         <xsl:on-completion select="$str"/>
         <xsl:next-iteration>
            <xsl:with-param name="str">
               <xsl:apply-templates select=".">
                  <xsl:with-param name="str" select="$str"/>
               </xsl:apply-templates>
            </xsl:with-param>
         </xsl:next-iteration>
      </xsl:iterate>
   </xsl:template>
   <xsl:template match="m:replace" expand-text="true">
      <xsl:param name="str" as="xs:string"/>
      <!--<xsl:value-of>replace({$str},{@match},{string(.)})</xsl:value-of>-->
      <xsl:sequence select="replace($str, @match, string(.))"/>
      <!--<xsl:copy-of select="."/>-->
   </xsl:template>
   <xsl:variable xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                 name="tag-replacements">
      <rules><!-- first, literal replacements -->
         <replace match="&amp;">&amp;amp;</replace>
         <replace match="&lt;">&amp;lt;</replace>
         <!-- next, explicit escape sequences -->
         <replace match="\\&#34;">&amp;quot;</replace>
         <!--<replace match="\\&#39;">&amp;apos;</replace>-->
         <replace match="\\\*">&amp;#x2A;</replace>
         <replace match="\\`">&amp;#x60;</replace>
         <replace match="\\~">&amp;#x7E;</replace>
         <replace match="\\^">&amp;#x5E;</replace>
         <!-- then, replacements based on $tag-specification -->
         <xsl:for-each select="$tag-specification/*">
            <xsl:variable name="match-expr">
               <xsl:apply-templates select="." mode="write-match"/>
            </xsl:variable>
            <xsl:variable name="repl-expr">
               <xsl:apply-templates select="." mode="write-replace"/>
            </xsl:variable>
            <replace match="{$match-expr}">
               <xsl:sequence select="$repl-expr"/>
            </replace>
         </xsl:for-each>
      </rules>
   </xsl:variable>
   <xsl:variable xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                 name="tag-specification"
                 as="element(m:tag-spec)">
      <tag-spec><!-- The XML notation represents the substitution by showing both delimiters and tags  --><!-- Note that text contents are regex notation for matching so * must be \* -->
         <q>"<text/>"</q>
         <img alt="!\[{{$noclosebracket}}\]" src="\({{$nocloseparen}}\)"/>
         <insert param-id="\{{\{{{{$nws}}\}}\}}"/>
         <a href="\[{{$nocloseparen}}\]">\(<text not="\)"/>\)</a>
         <code>`<text/>`</code>
         <strong>
            <em>\*\*\*<text/>\*\*\*</em>
         </strong>
         <strong>\*\*<text/>\*\*</strong>
         <em>\*<text/>\*</em>
         <sub>~<text/>~</sub>
         <sup>\^<text/>\^</sup>
      </tag-spec>
   </xsl:variable>
   <xsl:template match="*" mode="write-replace"><!-- we can write an open/close pair even for an empty element b/c
             it will be parsed and serialized -->
      <xsl:text>&lt;</xsl:text>
      <xsl:value-of select="local-name()"/>
      <!-- coercing the order to ensure correct formation of regegex       -->
      <xsl:apply-templates mode="#current" select="@*"/>
      <xsl:text>&gt;</xsl:text>
      <xsl:apply-templates mode="#current" select="*"/>
      <xsl:text>&lt;/</xsl:text>
      <xsl:value-of select="local-name()"/>
      <xsl:text>&gt;</xsl:text>
   </xsl:template>
   <xsl:template match="*" mode="write-match">
      <xsl:apply-templates select="@*, node()" mode="write-match"/>
   </xsl:template>
   <xsl:template match="@*[matches(., '\{\$text\}')]" mode="write-match">
      <xsl:value-of select="replace(., '\{\$text\}', '(.*)?')"/>
   </xsl:template>
   <xsl:template match="@*[matches(., '\{\$nocloseparen\}')]" mode="write-match">
      <xsl:value-of select="replace(., '\{\$nocloseparen\}', '([^\\(]*)?')"/>
   </xsl:template>
   <xsl:template match="@*[matches(., '\{\$noclosebracket\}')]" mode="write-match">
      <xsl:value-of select="replace(., '\{\$noclosebracket\}', '([^\\[]*)?')"/>
   </xsl:template>
   <xsl:template match="@*[matches(., '\{\$nws\}')]" mode="write-match"><!--<xsl:value-of select="."/>--><!--<xsl:value-of select="replace(., '\{\$nws\}', '(\S*)?')"/>-->
      <xsl:value-of select="replace(., '\{\$nws\}', '\\s*(\\S+)?\\s*')"/>
   </xsl:template>
   <xsl:template match="m:text" mode="write-replace">
      <xsl:text>$1</xsl:text>
   </xsl:template>
   <xsl:template match="m:insert/@param-id" mode="write-replace">
      <xsl:text> param-id='$1'</xsl:text>
   </xsl:template>
   <xsl:template match="m:a/@href" mode="write-replace">
      <xsl:text> href='$2'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@alt" mode="write-replace">
      <xsl:text> alt='$1'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@src" mode="write-replace">
      <xsl:text> src='$2'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:text" mode="write-match">
      <xsl:text>(.*?)</xsl:text>
   </xsl:template>
   <xsl:template match="m:text[@not]" mode="write-match">
      <xsl:text expand-text="true">([^{ @not }]*?)</xsl:text>
   </xsl:template>
   <xsl:variable name="line-example" xml:space="preserve"> { insertion } </xsl:variable>
</xsl:stylesheet>
