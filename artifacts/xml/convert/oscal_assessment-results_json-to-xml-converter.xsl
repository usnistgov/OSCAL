<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- OSCAL assessment-results conversion stylesheet supports JSON->XML conversion -->
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
      <xsl:apply-templates mode="#current" select="*[@key=('assessment-results')]"/>
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
   <!--*[@key='prose']-->
   <xsl:template match="*[@key='prose']" priority="5" mode="json2xml">
      <xsl:for-each select="string[@key='prose'], self::string">
         <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
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
                 match="*[@key='doc-id']/*[@key='type'] | *[@key='document-ids']/*[@key='type'] | array[@key='document-ids']/*/*[@key='type'] | map[@key='document-ids']/*/*[@key='type'] | *[@key='party']/*[@key='type'] | *[@key='parties']/*[@key='type'] | array[@key='parties']/*/*[@key='type'] | map[@key='parties']/*/*[@key='type'] | *[@key='external-id']/*[@key='type'] | *[@key='external-ids']/*[@key='type'] | array[@key='external-ids']/*/*[@key='type'] | map[@key='external-ids']/*/*[@key='type'] | *[@key='address']/*[@key='type'] | *[@key='addresses']/*[@key='type'] | array[@key='addresses']/*/*[@key='type'] | map[@key='addresses']/*/*[@key='type'] | *[@key='phone']/*[@key='type'] | *[@key='telephone-numbers']/*[@key='type'] | array[@key='telephone-numbers']/*/*[@key='type'] | map[@key='telephone-numbers']/*/*[@key='type'] | *[@key='subject-reference']/*[@key='type'] | *[@key='subject-references']/*[@key='type'] | array[@key='subject-references']/*/*[@key='type'] | map[@key='subject-references']/*/*[@key='type'] | *[@key='origin']/*[@key='type'] | *[@key='origins']/*[@key='type'] | array[@key='origins']/*/*[@key='type'] | map[@key='origins']/*/*[@key='type'] | *[@key='tracking-entry']/*[@key='type'] | *[@key='tracking-entries']/*[@key='type'] | array[@key='tracking-entries']/*/*[@key='type'] | map[@key='tracking-entries']/*/*[@key='type'] | *[@key='remediation']/*[@key='type'] | *[@key='remediation-group']/*[@key='type'] | array[@key='remediation-group']/*/*[@key='type'] | map[@key='remediation-group']/*/*[@key='type'] | *[@key='remediation-origin']/*[@key='type'] | *[@key='origins']/*[@key='type'] | array[@key='origins']/*/*[@key='type'] | map[@key='origins']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "prop" *** -->
   <!--*[@key='prop'] | *[@key='properties']  | *[@key='properties']/* | *[@key='props']  | *[@key='props']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']  | *[@key='properties']/* | *[@key='props']  | *[@key='props']/*"
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
   <xsl:template match="(*[@key='prop'] | *[@key='properties']  | *[@key='properties']/* | *[@key='props']  | *[@key='props']/*)/string[@key='value']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='prop'] | *[@key='properties']  | *[@key='properties']/* | *[@key='props']  | *[@key='props']/*)/string[@key='value']"
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
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'props']/array[@key = 'value'] | array[@key = 'props']/map/array[@key = 'value']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="props">
            <xsl:apply-templates mode="expand" select="array[@key = 'value']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'props']/array[@key = 'value']/string | array[@key = 'props']/map/array[@key = 'value']/string">
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
                 match="*[@key='prop']/*[@key='name'] | *[@key='properties']/*[@key='name'] | array[@key='properties']/*/*[@key='name'] | map[@key='properties']/*/*[@key='name'] | *[@key='props']/*[@key='name'] | array[@key='props']/*/*[@key='name'] | map[@key='props']/*/*[@key='name'] | *[@key='annotation']/*[@key='name'] | *[@key='annotations']/*[@key='name'] | array[@key='annotations']/*/*[@key='name'] | map[@key='annotations']/*/*[@key='name'] | *[@key='protocol']/*[@key='name'] | *[@key='protocols']/*[@key='name'] | array[@key='protocols']/*/*[@key='name'] | map[@key='protocols']/*/*[@key='name'] | *[@key='include-subject']/*[@key='name'] | *[@key='includes']/*[@key='name'] | array[@key='includes']/*/*[@key='name'] | map[@key='includes']/*/*[@key='name'] | *[@key='exclude-subject']/*[@key='name'] | *[@key='excludes']/*[@key='name'] | array[@key='excludes']/*/*[@key='name'] | map[@key='excludes']/*/*[@key='name'] | *[@key='risk-metric']/*[@key='name'] | *[@key='risk-metrics']/*[@key='name'] | array[@key='risk-metrics']/*/*[@key='name'] | map[@key='risk-metrics']/*/*[@key='name'] | *[@key='part']/*[@key='name'] | *[@key='parts']/*[@key='name'] | array[@key='parts']/*/*[@key='name'] | map[@key='parts']/*/*[@key='name']"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @ns *** -->
   <xsl:template match="*[@key='ns']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='ns'] | *[@key='properties']/*[@key='ns'] | array[@key='properties']/*/*[@key='ns'] | map[@key='properties']/*/*[@key='ns'] | *[@key='props']/*[@key='ns'] | array[@key='props']/*/*[@key='ns'] | map[@key='props']/*/*[@key='ns'] | *[@key='annotation']/*[@key='ns'] | *[@key='annotations']/*[@key='ns'] | array[@key='annotations']/*/*[@key='ns'] | map[@key='annotations']/*/*[@key='ns'] | *[@key='part']/*[@key='ns'] | *[@key='parts']/*[@key='ns'] | array[@key='parts']/*/*[@key='ns'] | map[@key='parts']/*/*[@key='ns']"
                 mode="as-attribute">
      <xsl:attribute name="ns">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @class *** -->
   <xsl:template match="*[@key='class']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*[@key='class'] | array[@key='properties']/*/*[@key='class'] | map[@key='properties']/*/*[@key='class'] | *[@key='props']/*[@key='class'] | array[@key='props']/*/*[@key='class'] | map[@key='props']/*/*[@key='class'] | *[@key='include-subject']/*[@key='class'] | *[@key='includes']/*[@key='class'] | array[@key='includes']/*/*[@key='class'] | map[@key='includes']/*/*[@key='class'] | *[@key='exclude-subject']/*[@key='class'] | *[@key='excludes']/*[@key='class'] | array[@key='excludes']/*/*[@key='class'] | map[@key='excludes']/*/*[@key='class'] | *[@key='risk-metric']/*[@key='class'] | *[@key='risk-metrics']/*[@key='class'] | array[@key='risk-metrics']/*/*[@key='class'] | map[@key='risk-metrics']/*/*[@key='class'] | *[@key='part']/*[@key='class'] | *[@key='parts']/*[@key='class'] | array[@key='parts']/*/*[@key='class'] | map[@key='parts']/*/*[@key='class']"
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
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
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
   <!-- *** Handling field "location-uuid" *** -->
   <!--*[@key='location-uuid'] | *[@key='location-uuids']  | *[@key='location-uuids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='location-uuid'] | *[@key='location-uuids']  | *[@key='location-uuids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="location-uuid" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'location-uuids']/array[@key = 'STRVALUE'] | array[@key = 'location-uuids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="location-uuids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'location-uuids']/array[@key = 'STRVALUE']/string | array[@key = 'location-uuids']/map/array[@key = 'STRVALUE']/string">
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
         <xsl:apply-templates mode="#current" select="*[@key=('party-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-id', 'external-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address', 'addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('member-of-organization', 'member-of-organizations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-uuid', 'location-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "party/@type" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='party']/*[@key='type'] | *[@key='parties']/*[@key='type'] | *[@key='parties']/*/*[@key='type']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='party']/*[@key='type'] | *[@key='parties']/*[@key='type'] | *[@key='parties']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "party-uuid" *** -->
   <!--*[@key='party-uuid'] | *[@key='party-uuids']  | *[@key='party-uuids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='party-uuid'] | *[@key='party-uuids']  | *[@key='party-uuids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="party-uuid" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'party-uuids']/array[@key = 'STRVALUE'] | array[@key = 'party-uuids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="party-uuids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'party-uuids']/array[@key = 'STRVALUE']/string | array[@key = 'party-uuids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling field "external-id" *** -->
   <!--*[@key='external-id'] | *[@key='external-ids']  | *[@key='external-ids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='external-id'] | *[@key='external-ids']  | *[@key='external-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="external-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='id']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template match="(*[@key='external-id'] | *[@key='external-ids']  | *[@key='external-ids']/*)/string[@key='id']"
                 mode="as-attribute"/>
   <xsl:template priority="8"
                 match="(*[@key='external-id'] | *[@key='external-ids']  | *[@key='external-ids']/*)/string[@key='id']"
                 mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'external-ids']/array[@key = 'id'] | array[@key = 'external-ids']/map/array[@key = 'id']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="external-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'id']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'external-ids']/array[@key = 'id']/string | array[@key = 'external-ids']/map/array[@key = 'id']/string">
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
   <!-- *** Handling field "member-of-organization" *** -->
   <!--*[@key='member-of-organization'] | *[@key='member-of-organizations']  | *[@key='member-of-organizations']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='member-of-organization'] | *[@key='member-of-organizations']  | *[@key='member-of-organizations']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="member-of-organization"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'member-of-organizations']/array[@key = 'STRVALUE'] | array[@key = 'member-of-organizations']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions"
                key="member-of-organizations">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'member-of-organizations']/array[@key = 'STRVALUE']/string | array[@key = 'member-of-organizations']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag @rel *** -->
   <xsl:template match="*[@key='rel']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='rel'] | *[@key='links']/*[@key='rel'] | array[@key='links']/*/*[@key='rel'] | map[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
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
   <!-- *** Handling field "party-name" *** -->
   <!--*[@key='party-name']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='party-name']" priority="5" mode="json2xml">
      <xsl:element name="party-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
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
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
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
                 match="*[@key='link']/*[@key='href'] | *[@key='links']/*[@key='href'] | array[@key='links']/*/*[@key='href'] | map[@key='links']/*/*[@key='href'] | *[@key='rlink']/*[@key='href'] | *[@key='rlinks']/*[@key='href'] | array[@key='rlinks']/*/*[@key='href'] | map[@key='rlinks']/*/*[@key='href'] | *[@key='import-ap']/*[@key='href'] | *[@key='relevant-evidence']/*[@key='href'] | *[@key='evidence-group']/*[@key='href'] | array[@key='evidence-group']/*/*[@key='href'] | map[@key='evidence-group']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @id *** -->
   <xsl:template match="*[@key='id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='role']/*[@key='id'] | *[@key='roles']/*[@key='id'] | array[@key='roles']/*/*[@key='id'] | map[@key='roles']/*/*[@key='id'] | *[@key='objective']/*[@key='id'] | *[@key='objectives']/*[@key='id'] | array[@key='objectives']/*/*[@key='id'] | map[@key='objectives']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @uuid *** -->
   <xsl:template match="*[@key='uuid']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='uuid'] | *[@key='properties']/*[@key='uuid'] | array[@key='properties']/*/*[@key='uuid'] | map[@key='properties']/*/*[@key='uuid'] | *[@key='props']/*[@key='uuid'] | array[@key='props']/*/*[@key='uuid'] | map[@key='props']/*/*[@key='uuid'] | *[@key='annotation']/*[@key='uuid'] | *[@key='annotations']/*[@key='uuid'] | array[@key='annotations']/*/*[@key='uuid'] | map[@key='annotations']/*/*[@key='uuid'] | *[@key='location']/*[@key='uuid'] | *[@key='locations']/*[@key='uuid'] | array[@key='locations']/*/*[@key='uuid'] | map[@key='locations']/*/*[@key='uuid'] | *[@key='party']/*[@key='uuid'] | *[@key='parties']/*[@key='uuid'] | array[@key='parties']/*/*[@key='uuid'] | map[@key='parties']/*/*[@key='uuid'] | *[@key='resource']/*[@key='uuid'] | *[@key='resources']/*[@key='uuid'] | array[@key='resources']/*/*[@key='uuid'] | map[@key='resources']/*/*[@key='uuid'] | *[@key='user']/*[@key='uuid'] | *[@key='users']/*[@key='uuid'] | array[@key='users']/*/*[@key='uuid'] | map[@key='users']/*/*[@key='uuid'] | *[@key='component']/*[@key='uuid'] | *[@key='components']/*[@key='uuid'] | array[@key='components']/*/*[@key='uuid'] | map[@key='components']/*/*[@key='uuid'] | *[@key='protocol']/*[@key='uuid'] | *[@key='protocols']/*[@key='uuid'] | array[@key='protocols']/*/*[@key='uuid'] | map[@key='protocols']/*/*[@key='uuid'] | *[@key='inventory-item']/*[@key='uuid'] | *[@key='inventory-items']/*[@key='uuid'] | array[@key='inventory-items']/*/*[@key='uuid'] | map[@key='inventory-items']/*/*[@key='uuid'] | *[@key='method']/*[@key='uuid'] | *[@key='method-definitions']/*[@key='uuid'] | array[@key='method-definitions']/*/*[@key='uuid'] | map[@key='method-definitions']/*/*[@key='uuid'] | *[@key='test-method']/*[@key='uuid'] | *[@key='test-methods']/*[@key='uuid'] | array[@key='test-methods']/*/*[@key='uuid'] | map[@key='test-methods']/*/*[@key='uuid'] | *[@key='test-step']/*[@key='uuid'] | *[@key='test-steps']/*[@key='uuid'] | array[@key='test-steps']/*/*[@key='uuid'] | map[@key='test-steps']/*/*[@key='uuid'] | *[@key='schedule']/*[@key='uuid'] | *[@key='task']/*[@key='uuid'] | *[@key='tasks']/*[@key='uuid'] | array[@key='tasks']/*/*[@key='uuid'] | map[@key='tasks']/*/*[@key='uuid'] | *[@key='include-activity']/*[@key='uuid'] | *[@key='include-activities']/*[@key='uuid'] | array[@key='include-activities']/*/*[@key='uuid'] | map[@key='include-activities']/*/*[@key='uuid'] | *[@key='exclude-activity']/*[@key='uuid'] | *[@key='exclude-activities']/*[@key='uuid'] | array[@key='exclude-activities']/*/*[@key='uuid'] | map[@key='exclude-activities']/*/*[@key='uuid'] | *[@key='results']/*[@key='uuid'] | *[@key='results_group']/*[@key='uuid'] | array[@key='results_group']/*/*[@key='uuid'] | map[@key='results_group']/*/*[@key='uuid'] | *[@key='finding']/*[@key='uuid'] | *[@key='findings']/*[@key='uuid'] | array[@key='findings']/*/*[@key='uuid'] | map[@key='findings']/*/*[@key='uuid'] | *[@key='observation']/*[@key='uuid'] | *[@key='observations']/*[@key='uuid'] | array[@key='observations']/*/*[@key='uuid'] | map[@key='observations']/*/*[@key='uuid'] | *[@key='risk']/*[@key='uuid'] | *[@key='risks']/*[@key='uuid'] | array[@key='risks']/*/*[@key='uuid'] | map[@key='risks']/*/*[@key='uuid'] | *[@key='tracking-entry']/*[@key='uuid'] | *[@key='tracking-entries']/*[@key='uuid'] | array[@key='tracking-entries']/*/*[@key='uuid'] | map[@key='tracking-entries']/*/*[@key='uuid'] | *[@key='required']/*[@key='uuid'] | *[@key='requirements']/*[@key='uuid'] | array[@key='requirements']/*/*[@key='uuid'] | map[@key='requirements']/*/*[@key='uuid'] | *[@key='mitigating-factor']/*[@key='uuid'] | *[@key='mitigating-factors']/*[@key='uuid'] | array[@key='mitigating-factors']/*/*[@key='uuid'] | map[@key='mitigating-factors']/*/*[@key='uuid'] | *[@key='remediation']/*[@key='uuid'] | *[@key='remediation-group']/*[@key='uuid'] | array[@key='remediation-group']/*/*[@key='uuid'] | map[@key='remediation-group']/*/*[@key='uuid'] | *[@key='part']/*[@key='uuid'] | *[@key='parts']/*[@key='uuid'] | array[@key='parts']/*/*[@key='uuid'] | map[@key='parts']/*/*[@key='uuid'] | *[@key='assessment-results']/*[@key='uuid']"
                 mode="as-attribute">
      <xsl:attribute name="uuid">
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
   <!-- *** Handling flag @component-type *** -->
   <xsl:template match="*[@key='component-type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='component']/*[@key='component-type'] | *[@key='components']/*[@key='component-type'] | array[@key='components']/*/*[@key='component-type'] | map[@key='components']/*/*[@key='component-type']"
                 mode="as-attribute">
      <xsl:attribute name="component-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @control-id *** -->
   <xsl:template match="*[@key='control-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='include-control']/*[@key='control-id'] | *[@key='include-controls']/*[@key='control-id'] | array[@key='include-controls']/*/*[@key='control-id'] | map[@key='include-controls']/*/*[@key='control-id'] | *[@key='exclude-control']/*[@key='control-id'] | *[@key='exclude-controls']/*[@key='control-id'] | array[@key='exclude-controls']/*/*[@key='control-id'] | map[@key='exclude-controls']/*/*[@key='control-id'] | *[@key='objective']/*[@key='control-id'] | *[@key='objectives']/*[@key='control-id'] | array[@key='objectives']/*/*[@key='control-id'] | map[@key='objectives']/*/*[@key='control-id'] | *[@key='objective-status']/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "responsible-role" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='responsible-role'] | array[@key='responsible-roles']/* | map[@key='responsible-roles']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="responsible-role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('responsible-roles')]"
                 priority="5"
                 mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('responsible-roles')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('responsible-roles')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="responsible-role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "responsible-role/@role-id" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='responsible-role']/*[@key='role-id'] | *[@key='responsible-roles']/*[@key='role-id'] | *[@key='responsible-roles']/*/*[@key='role-id']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='responsible-role']/*[@key='role-id'] | *[@key='responsible-roles']/*[@key='role-id'] | *[@key='responsible-roles']/*/*[@key='role-id']"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "status" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='status']" priority="4" mode="json2xml">
      <xsl:element name="status" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "status/@state" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='status']/*[@key='state']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='status']/*[@key='state']"
                 mode="as-attribute">
      <xsl:attribute name="state">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "user" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='user'] | array[@key='users']/* | map[@key='users']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="user" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('authorized-privilege', 'authorized-privileges')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('users')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2" match="map[@key=('users')]/*/@key" mode="as-attribute">
      <xsl:attribute name="uuid">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('users')]/map" priority="3" mode="json2xml">
      <xsl:element name="user" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('authorized-privilege', 'authorized-privileges')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
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
   <!-- *** Handling assembly "authorized-privilege" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='authorized-privilege'] | array[@key='authorized-privileges']/* | map[@key='authorized-privileges']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="authorized-privilege"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('function-performed', 'functions-performed')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "function-performed" *** -->
   <!--*[@key='function-performed'] | *[@key='functions-performed']  | *[@key='functions-performed']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='function-performed'] | *[@key='functions-performed']  | *[@key='functions-performed']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="function-performed" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'functions-performed']/array[@key = 'STRVALUE'] | array[@key = 'functions-performed']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="functions-performed">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'functions-performed']/array[@key = 'STRVALUE']/string | array[@key = 'functions-performed']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling assembly "component" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='component'] | array[@key='components']/* | map[@key='components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('purpose')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('status')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-role', 'responsible-roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('protocol', 'protocols')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('components')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('components')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="uuid">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('components')]/map" priority="3" mode="json2xml">
      <xsl:element name="component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('purpose')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('status')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-role', 'responsible-roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('protocol', 'protocols')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "protocol" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='protocol'] | array[@key='protocols']/* | map[@key='protocols']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="protocol" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('port-range', 'port-ranges')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "port-range" *** -->
   <!--*[@key='port-range'] | *[@key='port-ranges']  | *[@key='port-ranges']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='port-range'] | *[@key='port-ranges']  | *[@key='port-ranges']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="port-range" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'port-ranges']/array[@key = 'STRVALUE'] | array[@key = 'port-ranges']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="port-ranges">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'port-ranges']/array[@key = 'STRVALUE']/string | array[@key = 'port-ranges']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag "port-range/@start" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='port-range']/*[@key='start'] | *[@key='port-ranges']/*[@key='start'] | *[@key='port-ranges']/*/*[@key='start']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='port-range']/*[@key='start'] | *[@key='port-ranges']/*[@key='start'] | *[@key='port-ranges']/*/*[@key='start']"
                 mode="as-attribute">
      <xsl:attribute name="start">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag "port-range/@end" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='port-range']/*[@key='end'] | *[@key='port-ranges']/*[@key='end'] | *[@key='port-ranges']/*/*[@key='end']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='port-range']/*[@key='end'] | *[@key='port-ranges']/*[@key='end'] | *[@key='port-ranges']/*/*[@key='end']"
                 mode="as-attribute">
      <xsl:attribute name="end">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag "port-range/@transport" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='port-range']/*[@key='transport'] | *[@key='port-ranges']/*[@key='transport'] | *[@key='port-ranges']/*/*[@key='transport']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='port-range']/*[@key='transport'] | *[@key='port-ranges']/*[@key='transport'] | *[@key='port-ranges']/*/*[@key='transport']"
                 mode="as-attribute">
      <xsl:attribute name="transport">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "purpose" *** -->
   <!--*[@key='purpose']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='purpose']" priority="5" mode="json2xml">
      <xsl:element name="purpose" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:for-each select="string[@key='RICHTEXT'], self::string">
            <xsl:variable name="markup">
               <xsl:apply-templates mode="infer-inlines"/>
            </xsl:variable>
            <xsl:apply-templates mode="cast-ns" select="$markup"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "inventory-item" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='inventory-item'] | array[@key='inventory-items']/* | map[@key='inventory-items']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="inventory-item" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-party', 'responsible-parties')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('implemented-component', 'implemented-components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('inventory-items')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('inventory-items')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="uuid">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('inventory-items')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="inventory-item" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-party', 'responsible-parties')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('implemented-component', 'implemented-components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "inventory-item/@asset-id" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='inventory-item']/*[@key='asset-id'] | *[@key='inventory-items']/*[@key='asset-id'] | *[@key='inventory-items']/*/*[@key='asset-id']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='inventory-item']/*[@key='asset-id'] | *[@key='inventory-items']/*[@key='asset-id'] | *[@key='inventory-items']/*/*[@key='asset-id']"
                 mode="as-attribute">
      <xsl:attribute name="asset-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "implemented-component" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='implemented-component'] | array[@key='implemented-components']/* | map[@key='implemented-components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="implemented-component"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-party', 'responsible-parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="map[@key=('implemented-components')]"
                 priority="5"
                 mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('implemented-components')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="component-uuid">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('implemented-components')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="implemented-component"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-party', 'responsible-parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "implemented-component/@component-uuid" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='implemented-component']/*[@key='component-uuid'] | *[@key='implemented-components']/*[@key='component-uuid'] | *[@key='implemented-components']/*/*[@key='component-uuid']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='implemented-component']/*[@key='component-uuid'] | *[@key='implemented-components']/*[@key='component-uuid'] | *[@key='implemented-components']/*/*[@key='component-uuid']"
                 mode="as-attribute">
      <xsl:attribute name="component-uuid">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag "implemented-component/@use" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='implemented-component']/*[@key='use'] | *[@key='implemented-components']/*[@key='use'] | *[@key='implemented-components']/*/*[@key='use']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='implemented-component']/*[@key='use'] | *[@key='implemented-components']/*[@key='use'] | *[@key='implemented-components']/*/*[@key='use']"
                 mode="as-attribute">
      <xsl:attribute name="use">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "import-ap" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='import-ap']" priority="4" mode="json2xml">
      <xsl:element name="import-ap" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "objectives" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='objectives']" priority="4" mode="json2xml">
      <xsl:element name="objectives" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('controls', 'control-group')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('control-objectives', 'control-objective-group')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('objective', 'objectives')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('method', 'method-definitions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "controls" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='controls'] | array[@key='control-group']/* | map[@key='control-group']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="controls" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('include-control', 'include-controls')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('exclude-control', 'exclude-controls')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "control-objectives" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='control-objectives'] | array[@key='control-objective-group']/* | map[@key='control-objective-group']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="control-objectives" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('include-objective', 'include-objectives')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('exclude-objective', 'exclude-objectives')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "include-control" *** -->
   <!--*[@key='include-control'] | *[@key='include-controls']  | *[@key='include-controls']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='include-control'] | *[@key='include-controls']  | *[@key='include-controls']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="include-control" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'include-controls']/array[@key = 'STRVALUE'] | array[@key = 'include-controls']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="include-controls">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'include-controls']/array[@key = 'STRVALUE']/string | array[@key = 'include-controls']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling field "exclude-control" *** -->
   <!--*[@key='exclude-control'] | *[@key='exclude-controls']  | *[@key='exclude-controls']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='exclude-control'] | *[@key='exclude-controls']  | *[@key='exclude-controls']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="exclude-control" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'exclude-controls']/array[@key = 'STRVALUE'] | array[@key = 'exclude-controls']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="exclude-controls">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'exclude-controls']/array[@key = 'STRVALUE']/string | array[@key = 'exclude-controls']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling field "include-objective" *** -->
   <!--*[@key='include-objective'] | *[@key='include-objectives']  | *[@key='include-objectives']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='include-objective'] | *[@key='include-objectives']  | *[@key='include-objectives']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="include-objective" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'include-objectives']/array[@key = 'STRVALUE'] | array[@key = 'include-objectives']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="include-objectives">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'include-objectives']/array[@key = 'STRVALUE']/string | array[@key = 'include-objectives']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling field "exclude-objective" *** -->
   <!--*[@key='exclude-objective'] | *[@key='exclude-objectives']  | *[@key='exclude-objectives']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='exclude-objective'] | *[@key='exclude-objectives']  | *[@key='exclude-objectives']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="exclude-objective" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'exclude-objectives']/array[@key = 'STRVALUE'] | array[@key = 'exclude-objectives']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="exclude-objectives">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'exclude-objectives']/array[@key = 'STRVALUE']/string | array[@key = 'exclude-objectives']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling assembly "objective" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='objective'] | array[@key='objectives']/* | map[@key='objectives']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="objective" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assessment-method', 'methods')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "assessment-method" *** -->
   <!--*[@key='assessment-method'] | *[@key='methods']  | *[@key='methods']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assessment-method'] | *[@key='methods']  | *[@key='methods']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="assessment-method" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'methods']/array[@key = 'STRVALUE'] | array[@key = 'methods']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="methods">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'methods']/array[@key = 'STRVALUE']/string | array[@key = 'methods']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag @method-uuid *** -->
   <xsl:template match="*[@key='method-uuid']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='assessment-method']/*[@key='method-uuid'] | *[@key='methods']/*[@key='method-uuid'] | array[@key='methods']/*/*[@key='method-uuid'] | map[@key='methods']/*/*[@key='method-uuid']"
                 mode="as-attribute">
      <xsl:attribute name="method-uuid">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "method" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='method'] | array[@key='method-definitions']/* | map[@key='method-definitions']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="method" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "include-subject" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='include-subject'] | array[@key='includes']/* | map[@key='includes']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="include-subject" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('subject-reference', 'subject-references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "exclude-subject" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='exclude-subject'] | array[@key='excludes']/* | map[@key='excludes']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="exclude-subject" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('subject-reference', 'subject-references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "subject-reference" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='subject-reference'] | array[@key='subject-references']/* | map[@key='subject-references']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="subject-reference" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling flag "subject-reference/@uuid-ref" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='subject-reference']/*[@key='uuid-ref'] | *[@key='subject-references']/*[@key='uuid-ref'] | *[@key='subject-references']/*/*[@key='uuid-ref']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='subject-reference']/*[@key='uuid-ref'] | *[@key='subject-references']/*[@key='uuid-ref'] | *[@key='subject-references']/*/*[@key='uuid-ref']"
                 mode="as-attribute">
      <xsl:attribute name="uuid-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "all" *** -->
   <!--*[@key='all']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='all']" priority="5" mode="json2xml">
      <xsl:element name="all" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "assets" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assets']" priority="4" mode="json2xml">
      <xsl:element name="assets" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('tools')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('origination')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "tools" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='tools']" priority="4" mode="json2xml">
      <xsl:element name="tools" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('component', 'components')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "origination" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='origination']" priority="4" mode="json2xml">
      <xsl:element name="origination" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "assessment-activities" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assessment-activities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="assessment-activities"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('test-method', 'test-methods')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('schedule')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('include-activity', 'include-activities')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('exclude-activity', 'exclude-activities')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "test-method" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='test-method'] | array[@key='test-methods']/* | map[@key='test-methods']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="test-method" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('test-step', 'test-steps')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('compare-to')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "compare-to" *** -->
   <!--*[@key='compare-to']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='compare-to']" priority="5" mode="json2xml">
      <xsl:element name="compare-to" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "test-step" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='test-step'] | array[@key='test-steps']/* | map[@key='test-steps']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="test-step" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('sequence')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('compare-to')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "sequence" *** -->
   <!--*[@key='sequence']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='sequence']" priority="5" mode="json2xml">
      <xsl:element name="sequence" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
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
         <xsl:apply-templates mode="#current" select="*[@key=('activity-uuid', 'activity-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-uuid', 'location-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('compare-to')]"/>
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
   <!-- *** Handling field "activity-uuid" *** -->
   <!--*[@key='activity-uuid'] | *[@key='activity-uuids']  | *[@key='activity-uuids']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='activity-uuid'] | *[@key='activity-uuids']  | *[@key='activity-uuids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="activity-uuid" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'activity-uuids']/array[@key = 'STRVALUE'] | array[@key = 'activity-uuids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="activity-uuids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'activity-uuids']/array[@key = 'STRVALUE']/string | array[@key = 'activity-uuids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling assembly "include-activity" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='include-activity'] | array[@key='include-activities']/* | map[@key='include-activities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="include-activity" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-uuid', 'location-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('compare-to')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "exclude-activity" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='exclude-activity'] | array[@key='exclude-activities']/* | map[@key='exclude-activities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="exclude-activity" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role-id', 'role-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location-uuid', 'location-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('compare-to')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "results" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='results'] | array[@key='results_group']/* | map[@key='results_group']"
                 priority="4"
                 mode="json2xml">
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
         <xsl:apply-templates mode="#current" select="*[@key=('collected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('expires')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('objective-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation-statement-uuid')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('observation', 'observations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('threat-id', 'threat-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk', 'risks')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "implementation-statement-uuid" *** -->
   <!--*[@key='implementation-statement-uuid']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='implementation-statement-uuid']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="implementation-statement-uuid"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
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
   <!-- *** Handling field "collected" *** -->
   <!--*[@key='collected']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='collected']" priority="5" mode="json2xml">
      <xsl:element name="collected" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "expires" *** -->
   <!--*[@key='expires']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='expires']" priority="5" mode="json2xml">
      <xsl:element name="expires" namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
         <xsl:apply-templates mode="#current" select="*[@key=('result')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "result" *** -->
   <!--*[@key='result']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='result']" priority="5" mode="json2xml">
      <xsl:element name="result" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
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
   <!-- *** Handling flag @system *** -->
   <xsl:template match="*[@key='system']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='result']/*[@key='system'] | *[@key='implementation-status']/*[@key='system'] | *[@key='threat-id']/*[@key='system'] | *[@key='threat-ids']/*[@key='system'] | array[@key='threat-ids']/*/*[@key='system'] | map[@key='threat-ids']/*/*[@key='system'] | *[@key='risk-metric']/*[@key='system'] | *[@key='risk-metrics']/*[@key='system'] | array[@key='risk-metrics']/*/*[@key='system'] | map[@key='risk-metrics']/*/*[@key='system']"
                 mode="as-attribute">
      <xsl:attribute name="system">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
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
                              select="*[@key=('observation-method', 'observation-methods')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('observation-type', 'observation-types')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assessor', 'assessors')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('subject-reference', 'subject-references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('origin', 'origins')]"/>
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
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('annotation', 'annotations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
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
   <!-- *** Handling flag "assessor/@party-uuid" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='assessor']/*[@key='party-uuid'] | *[@key='assessors']/*[@key='party-uuid'] | *[@key='assessors']/*/*[@key='party-uuid']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='assessor']/*[@key='party-uuid'] | *[@key='assessors']/*[@key='party-uuid'] | *[@key='assessors']/*/*[@key='party-uuid']"
                 mode="as-attribute">
      <xsl:attribute name="party-uuid">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "origin" *** -->
   <!--*[@key='origin'] | *[@key='origins']  | *[@key='origins']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='origin'] | *[@key='origins']  | *[@key='origins']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="origin" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'origins']/array[@key = 'STRVALUE'] | array[@key = 'origins']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="origins">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'origins']/array[@key = 'STRVALUE']/string | array[@key = 'origins']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag @uuid-ref *** -->
   <xsl:template match="*[@key='uuid-ref']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='subject-reference']/*[@key='uuid-ref'] | *[@key='subject-references']/*[@key='uuid-ref'] | array[@key='subject-references']/*/*[@key='uuid-ref'] | map[@key='subject-references']/*/*[@key='uuid-ref'] | *[@key='origin']/*[@key='uuid-ref'] | *[@key='origins']/*[@key='uuid-ref'] | array[@key='origins']/*/*[@key='uuid-ref'] | map[@key='origins']/*/*[@key='uuid-ref'] | *[@key='remediation-origin']/*[@key='uuid-ref'] | *[@key='origins']/*[@key='uuid-ref'] | array[@key='origins']/*/*[@key='uuid-ref'] | map[@key='origins']/*/*[@key='uuid-ref']"
                 mode="as-attribute">
      <xsl:attribute name="uuid-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling field "observation-method" *** -->
   <!--*[@key='observation-method'] | *[@key='observation-methods']  | *[@key='observation-methods']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='observation-method'] | *[@key='observation-methods']  | *[@key='observation-methods']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="observation-method" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'observation-methods']/array[@key = 'STRVALUE'] | array[@key = 'observation-methods']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="observation-methods">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'observation-methods']/array[@key = 'STRVALUE']/string | array[@key = 'observation-methods']/map/array[@key = 'STRVALUE']/string">
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
         <xsl:apply-templates mode="#current" select="*[@key=('risk-metric', 'risk-metrics')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk-statement')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('mitigating-factor', 'mitigating-factors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remediation-deadline')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remediation', 'remediation-group')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('risk-status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('closure-actions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remediation-tracking')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party-uuid', 'party-uuids')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "remediation-deadline" *** -->
   <!--*[@key='remediation-deadline']-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='remediation-deadline']" priority="5" mode="json2xml">
      <xsl:element name="remediation-deadline"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "risk-metric" *** -->
   <!--*[@key='risk-metric'] | *[@key='risk-metrics']  | *[@key='risk-metrics']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='risk-metric'] | *[@key='risk-metrics']  | *[@key='risk-metrics']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="risk-metric" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'risk-metrics']/array[@key = 'STRVALUE'] | array[@key = 'risk-metrics']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="risk-metrics">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'risk-metrics']/array[@key = 'STRVALUE']/string | array[@key = 'risk-metrics']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag "risk-metric/@system" *** -->
   <!-- suppressing when matched in json2xml traversal-->
   <xsl:template match="*[@key='risk-metric']/*[@key='system'] | *[@key='risk-metrics']/*[@key='system'] | *[@key='risk-metrics']/*/*[@key='system']"
                 priority="7"
                 mode="json2xml"/>
   <xsl:template priority="3"
                 match="*[@key='risk-metric']/*[@key='system'] | *[@key='risk-metrics']/*[@key='system'] | *[@key='risk-metrics']/*/*[@key='system']"
                 mode="as-attribute">
      <xsl:attribute name="system">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
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
   <!-- *** Handling assembly "required" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='required'] | array[@key='requirements']/* | map[@key='requirements']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="required" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('subject-reference', 'subject-references')]"/>
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
         <xsl:apply-templates mode="#current"
                              select="*[@key=('subject-reference', 'subject-references')]"/>
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
         <xsl:apply-templates mode="#current" select="*[@key=('remediation-origin', 'origins')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('required', 'requirements')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('schedule')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling field "remediation-origin" *** -->
   <!--*[@key='remediation-origin'] | *[@key='origins']  | *[@key='origins']/*-->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='remediation-origin'] | *[@key='origins']  | *[@key='origins']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="remediation-origin" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'origins']/array[@key = 'STRVALUE'] | array[@key = 'origins']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="origins">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'origins']/array[@key = 'STRVALUE']/string | array[@key = 'origins']/map/array[@key = 'STRVALUE']/string">
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
   <!-- *** Handling flag @implementation-uuid *** -->
   <xsl:template match="*[@key='implementation-uuid']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='mitigating-factor']/*[@key='implementation-uuid'] | *[@key='mitigating-factors']/*[@key='implementation-uuid'] | array[@key='mitigating-factors']/*/*[@key='implementation-uuid'] | map[@key='mitigating-factors']/*/*[@key='implementation-uuid']"
                 mode="as-attribute">
      <xsl:attribute name="implementation-uuid">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling flag @objective-id *** -->
   <xsl:template match="*[@key='objective-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='include-objective']/*[@key='objective-id'] | *[@key='include-objectives']/*[@key='objective-id'] | array[@key='include-objectives']/*/*[@key='objective-id'] | map[@key='include-objectives']/*/*[@key='objective-id'] | *[@key='exclude-objective']/*[@key='objective-id'] | *[@key='exclude-objectives']/*[@key='objective-id'] | array[@key='exclude-objectives']/*/*[@key='objective-id'] | map[@key='exclude-objectives']/*/*[@key='objective-id'] | *[@key='objective-status']/*[@key='objective-id']"
                 mode="as-attribute">
      <xsl:attribute name="objective-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- *** Handling assembly "part" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='part'] | array[@key='parts']/* | map[@key='parts']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="part" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prose')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "assessment-results" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assessment-results'] | /map[empty(@key)]"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="assessment-results" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import-ap')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('objectives')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assessment-subjects')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assets')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('assessment-activities')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('results', 'results_group')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('back-matter')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "assessment-subjects" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='assessment-subjects']" priority="4" mode="json2xml">
      <xsl:element name="assessment-subjects"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('include-subject', 'includes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('exclude-subject', 'excludes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('local-definitions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- *** Handling assembly "local-definitions" *** -->
   <!-- *** NB - template matching 'array' overrides this one *** -->
   <xsl:template match="*[@key='local-definitions']" priority="4" mode="json2xml">
      <xsl:element name="local-definitions" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('component', 'components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('inventory-item', 'inventory-items')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('user', 'users')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
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
      <!-- 's' sets dot-matches-all       -->
      <xsl:sequence select="replace($str, @match, string(.),'s')"/>
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
