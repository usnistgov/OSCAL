<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- OSCAL system-security-plan conversion stylesheet supports JSON->XML conversion -->
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
      <xsl:apply-templates mode="#current" select="*[@key=('system-security-plan')]"/>
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='metadata']" priority="4" mode="json2xml">
      <xsl:element name="metadata" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('last-modified-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('oscal-version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party', 'parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='back-matter']" priority="4" mode="json2xml">
      <xsl:element name="back-matter" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('citation', 'citations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "link" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='link'] | *[@key='links']  | array[@key='links']/*-->
   <xsl:template match="*[@key='link'] | *[@key='links']  | array[@key='links']/*"
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
   <!-- 000 Handling field "last-modified-date" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='last-modified-date']-->
   <xsl:template match="*[@key='last-modified-date']" priority="5" mode="json2xml">
      <xsl:element name="last-modified-date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "version" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='version']-->
   <xsl:template match="*[@key='version']" priority="5" mode="json2xml">
      <xsl:element name="version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "oscal-version" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='oscal-version']-->
   <xsl:template match="*[@key='oscal-version']" priority="5" mode="json2xml">
      <xsl:element name="oscal-version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "doc-id" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='doc-id'] | *[@key='document-ids']  | array[@key='document-ids']/*-->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-ids']  | array[@key='document-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'document-ids']/array[@key = 'STRVALUE'] | array[@key = 'document-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="document-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'document-ids']/array[@key = 'STRVALUE']/string | array[@key = 'document-ids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling flag @type 000 -->
   <xsl:template match="*[@key='type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='doc-id']/*[@key='type'] | *[@key='document-ids']/*[@key='type'] | array[@key='document-ids']/*/*[@key='type'] | *[@key='person-id']/*[@key='type'] | *[@key='person-ids']/*[@key='type'] | array[@key='person-ids']/*/*[@key='type'] | *[@key='org-id']/*[@key='type'] | *[@key='organization-ids']/*[@key='type'] | array[@key='organization-ids']/*/*[@key='type'] | *[@key='address']/*[@key='type'] | *[@key='addresses']/*[@key='type'] | array[@key='addresses']/*/*[@key='type'] | *[@key='phone']/*[@key='type'] | *[@key='telephone-numbers']/*[@key='type'] | array[@key='telephone-numbers']/*/*[@key='type'] | *[@key='notes']/*[@key='type'] | *[@key='argument']/*[@key='type'] | *[@key='arguments']/*[@key='type'] | array[@key='arguments']/*/*[@key='type'] | *[@key='system-id']/*[@key='type'] | *[@key='deployment-model']/*[@key='type'] | *[@key='service-model']/*[@key='type'] | *[@key='service-models']/*[@key='type'] | array[@key='service-models']/*/*[@key='type'] | *[@key='vendor']/*[@key='type'] | *[@key='vendors']/*[@key='type'] | array[@key='vendors']/*/*[@key='type'] | *[@key='ip-address']/*[@key='type'] | *[@key='ip-addresses']/*[@key='type'] | array[@key='ip-addresses']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='prop'] | *[@key='properties']  | array[@key='properties']/*-->
   <xsl:template match="*[@key='prop'] | *[@key='properties']  | array[@key='properties']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[not(@key=('id','ns','class'))]" mode="json2xml"/>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="6"
                 match="(*[@key='prop'] | *[@key='properties']  | array[@key='properties']/*)/string[not(@key=('id','ns','class','STRVALUE','RICHTEXT'))]"
                 mode="json2xml">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="(*[@key='prop'] | *[@key='properties']  | array[@key='properties']/*)/string[not(@key=('id','ns','class','STRVALUE','RICHTEXT'))]"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:value-of select="@key"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @name 000 -->
   <xsl:template match="*[@key='name']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='with-argument']/*[@key='name'] | *[@key='with-arguments']/*[@key='name'] | array[@key='with-arguments']/*/*[@key='name'] | *[@key='argument']/*[@key='name'] | *[@key='arguments']/*[@key='name'] | array[@key='arguments']/*/*[@key='name'] | *[@key='designation']/*[@key='name'] | *[@key='designations']/*[@key='name'] | array[@key='designations']/*/*[@key='name'] | *[@key='system-role']/*[@key='name'] | *[@key='system-roles']/*[@key='name'] | array[@key='system-roles']/*/*[@key='name'] | *[@key='component']/*[@key='name'] | *[@key='components']/*[@key='name'] | array[@key='components']/*/*[@key='name'] | *[@key='capability']/*[@key='name'] | *[@key='capabilities']/*[@key='name'] | array[@key='capabilities']/*/*[@key='name'] | *[@key='service']/*[@key='name'] | *[@key='services']/*[@key='name'] | array[@key='services']/*/*[@key='name'] | *[@key='protocol']/*[@key='name'] | *[@key='ssp-protocol']/*[@key='name'] | array[@key='ssp-protocol']/*/*[@key='name']"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @ns 000 -->
   <xsl:template match="*[@key='ns']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='ns'] | *[@key='properties']/*[@key='ns'] | array[@key='properties']/*/*[@key='ns']"
                 mode="as-attribute">
      <xsl:attribute name="ns">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @class 000 -->
   <xsl:template match="*[@key='class']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*[@key='class'] | array[@key='properties']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='party'] | array[@key='parties']/* | map[@key='parties']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="party" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person', 'persons')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @party-id 000 -->
   <xsl:template match="*[@key='party-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='supplier']/*[@key='party-id'] | *[@key='asset-owner']/*[@key='party-id'] | *[@key='asset-owners']/*[@key='party-id'] | array[@key='asset-owners']/*/*[@key='party-id'] | *[@key='asset-administrator']/*[@key='party-id'] | *[@key='asset-administrators']/*[@key='party-id'] | array[@key='asset-administrators']/*/*[@key='party-id']"
                 mode="as-attribute">
      <xsl:attribute name="party-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
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
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='org']" priority="4" mode="json2xml">
      <xsl:element name="org" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address', 'addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "person-id" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='person-id'] | *[@key='person-ids']  | array[@key='person-ids']/*-->
   <xsl:template match="*[@key='person-id'] | *[@key='person-ids']  | array[@key='person-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="person-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'person-ids']/array[@key = 'STRVALUE'] | array[@key = 'person-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="person-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'person-ids']/array[@key = 'STRVALUE']/string | array[@key = 'person-ids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "org-id" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='org-id'] | *[@key='organization-ids']  | array[@key='organization-ids']/*-->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-ids']  | array[@key='organization-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'organization-ids']/array[@key = 'STRVALUE'] | array[@key = 'organization-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="organization-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'organization-ids']/array[@key = 'STRVALUE']/string | array[@key = 'organization-ids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='rlink'] | array[@key='rlinks']/* | map[@key='rlinks']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="rlink" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hash', 'hashes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @rel 000 -->
   <xsl:template match="*[@key='rel']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='rel'] | *[@key='links']/*[@key='rel'] | array[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @media-type 000 -->
   <xsl:template match="*[@key='media-type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='media-type'] | *[@key='links']/*[@key='media-type'] | array[@key='links']/*/*[@key='media-type'] | *[@key='rlink']/*[@key='media-type'] | *[@key='rlinks']/*[@key='media-type'] | array[@key='rlinks']/*/*[@key='media-type'] | *[@key='base64']/*[@key='media-type']"
                 mode="as-attribute">
      <xsl:attribute name="media-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "person-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='person-name']-->
   <xsl:template match="*[@key='person-name']" priority="5" mode="json2xml">
      <xsl:element name="person-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='org-name']-->
   <xsl:template match="*[@key='org-name']" priority="5" mode="json2xml">
      <xsl:element name="org-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "short-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='short-name']-->
   <xsl:template match="*[@key='short-name']" priority="5" mode="json2xml">
      <xsl:element name="short-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
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
   <!-- 000 Handling field "addr-line" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='addr-line'] | *[@key='postal-address']  | array[@key='postal-address']/*-->
   <xsl:template match="*[@key='addr-line'] | *[@key='postal-address']  | array[@key='postal-address']/*"
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
   <!-- 000 Handling field "city" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='city']-->
   <xsl:template match="*[@key='city']" priority="5" mode="json2xml">
      <xsl:element name="city" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "state" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='state']-->
   <xsl:template match="*[@key='state']" priority="5" mode="json2xml">
      <xsl:element name="state" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "postal-code" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='postal-code']-->
   <xsl:template match="*[@key='postal-code']" priority="5" mode="json2xml">
      <xsl:element name="postal-code" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "country" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='country']-->
   <xsl:template match="*[@key='country']" priority="5" mode="json2xml">
      <xsl:element name="country" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "email" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='email'] | *[@key='email-addresses']  | array[@key='email-addresses']/*-->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']  | array[@key='email-addresses']/*"
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
   <!-- 000 Handling field "phone" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='phone'] | *[@key='telephone-numbers']  | array[@key='telephone-numbers']/*-->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']  | array[@key='telephone-numbers']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="phone" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'telephone-numbers']/array[@key = 'STRVALUE'] | array[@key = 'telephone-numbers']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="telephone-numbers">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'telephone-numbers']/array[@key = 'STRVALUE']/string | array[@key = 'telephone-numbers']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "url" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='url'] | *[@key='URLs']  | array[@key='URLs']/*-->
   <xsl:template match="*[@key='url'] | *[@key='URLs']  | array[@key='URLs']/*"
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='notes']" priority="4" mode="json2xml">
      <xsl:element name="notes" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('note')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='desc']-->
   <xsl:template match="*[@key='desc']" priority="5" mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='resource'] | array[@key='resources']/* | map[@key='resources']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="resource" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('rlink', 'rlinks')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base64')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "hash" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='hash'] | *[@key='hashes']  | array[@key='hashes']/*-->
   <xsl:template match="*[@key='hash'] | *[@key='hashes']  | array[@key='hashes']/*"
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
   <!-- 000 Handling flag @algorithm 000 -->
   <xsl:template match="*[@key='algorithm']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='hash']/*[@key='algorithm'] | *[@key='hashes']/*[@key='algorithm'] | array[@key='hashes']/*/*[@key='algorithm']"
                 mode="as-attribute">
      <xsl:attribute name="algorithm">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='role'] | array[@key='roles']/* | map[@key='roles']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @href 000 -->
   <xsl:template match="*[@key='href']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='link']/*[@key='href'] | *[@key='links']/*[@key='href'] | array[@key='links']/*/*[@key='href'] | *[@key='rlink']/*[@key='href'] | *[@key='rlinks']/*[@key='href'] | array[@key='rlinks']/*/*[@key='href'] | *[@key='implementation-source']/*[@key='href'] | *[@key='verification-process']/*[@key='href'] | *[@key='import-profile']/*[@key='href'] | *[@key='diagram']/*[@key='href'] | *[@key='diagrams']/*[@key='href'] | array[@key='diagrams']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @id 000 -->
   <xsl:template match="*[@key='id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='prop']/*[@key='id'] | *[@key='properties']/*[@key='id'] | array[@key='properties']/*/*[@key='id'] | *[@key='party']/*[@key='id'] | *[@key='parties']/*[@key='id'] | array[@key='parties']/*/*[@key='id'] | *[@key='resource']/*[@key='id'] | *[@key='resources']/*[@key='id'] | array[@key='resources']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*[@key='id'] | array[@key='roles']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*[@key='id'] | array[@key='citations']/*/*[@key='id'] | *[@key='implemented-requirement']/*[@key='id'] | *[@key='implemented-requirements']/*[@key='id'] | array[@key='implemented-requirements']/*/*[@key='id'] | *[@key='configuration']/*[@key='id'] | *[@key='configurations']/*[@key='id'] | array[@key='configurations']/*/*[@key='id'] | *[@key='mechanism']/*[@key='id'] | *[@key='mechanisms']/*[@key='id'] | array[@key='mechanisms']/*/*[@key='id'] | *[@key='artifact']/*[@key='id'] | *[@key='artifacts']/*[@key='id'] | array[@key='artifacts']/*/*[@key='id'] | *[@key='system-security-plan']/*[@key='id'] | *[@key='qualifier']/*[@key='id'] | *[@key='ssp-qualifiers']/*[@key='id'] | array[@key='ssp-qualifiers']/*/*[@key='id'] | *[@key='information-type']/*[@key='id'] | *[@key='ssp-information-type']/*[@key='id'] | array[@key='ssp-information-type']/*/*[@key='id'] | *[@key='leveraged-authorization']/*[@key='id'] | *[@key='leveraged-authorizations']/*[@key='id'] | array[@key='leveraged-authorizations']/*/*[@key='id'] | *[@key='diagram']/*[@key='id'] | *[@key='diagrams']/*[@key='id'] | array[@key='diagrams']/*/*[@key='id'] | *[@key='system-role']/*[@key='id'] | *[@key='system-roles']/*[@key='id'] | array[@key='system-roles']/*/*[@key='id'] | *[@key='component']/*[@key='id'] | *[@key='components']/*[@key='id'] | array[@key='components']/*/*[@key='id'] | *[@key='capability']/*[@key='id'] | *[@key='capabilities']/*[@key='id'] | array[@key='capabilities']/*/*[@key='id'] | *[@key='service']/*[@key='id'] | *[@key='services']/*[@key='id'] | array[@key='services']/*/*[@key='id'] | *[@key='interconnection']/*[@key='id'] | *[@key='ssp-interconnection']/*[@key='id'] | array[@key='ssp-interconnection']/*/*[@key='id'] | *[@key='vendor']/*[@key='id'] | *[@key='vendors']/*[@key='id'] | array[@key='vendors']/*/*[@key='id'] | *[@key='inventory-item']/*[@key='id'] | *[@key='inventory-items']/*[@key='id'] | array[@key='inventory-items']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @role-id 000 -->
   <xsl:template match="*[@key='role-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='party']/*[@key='role-id'] | *[@key='parties']/*[@key='role-id'] | array[@key='parties']/*/*[@key='role-id'] | *[@key='supplier']/*[@key='role-id'] | *[@key='system-role']/*[@key='role-id'] | *[@key='system-roles']/*[@key='role-id'] | array[@key='system-roles']/*/*[@key='role-id'] | *[@key='responsible-role']/*[@key='role-id'] | *[@key='ssp-responsible-role']/*[@key='role-id'] | array[@key='ssp-responsible-role']/*/*[@key='role-id']"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "title" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='title']-->
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
   <!-- 000 Handling field "base64" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='base64']-->
   <xsl:template match="*[@key='base64']" priority="5" mode="json2xml">
      <xsl:element name="base64" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @filename 000 -->
   <xsl:template match="*[@key='filename']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='base64']/*[@key='filename']"
                 mode="as-attribute">
      <xsl:attribute name="filename">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='citation'] | array[@key='citations']/* | map[@key='citations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="citation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('target', 'targets')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "target" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='target'] | *[@key='targets']  | array[@key='targets']/*-->
   <xsl:template match="*[@key='target'] | *[@key='targets']  | array[@key='targets']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="target" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'targets']/array[@key = 'STRVALUE'] | array[@key = 'targets']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="targets">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'targets']/array[@key = 'STRVALUE']/string | array[@key = 'targets']/map/array[@key = 'STRVALUE']/string">
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
   <!--*[@key='note']-->
   <xsl:template match="*[@key='note']" priority="5" mode="json2xml">
      <xsl:for-each select="string[@key='note'], self::string">
         <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!-- 000 Handling flag @component-type 000 -->
   <xsl:template match="*[@key='component-type']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='component']/*[@key='component-type'] | *[@key='components']/*[@key='component-type'] | array[@key='components']/*/*[@key='component-type']"
                 mode="as-attribute">
      <xsl:attribute name="component-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!--*[@key='description']-->
   <xsl:template match="*[@key='description']" priority="5" mode="json2xml">
      <xsl:for-each select="string[@key='description'], self::string">
         <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!--*[@key='remarks']-->
   <xsl:template match="*[@key='remarks']" priority="5" mode="json2xml">
      <xsl:for-each select="string[@key='remarks'], self::string">
         <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='supplier']" priority="4" mode="json2xml">
      <xsl:element name="supplier" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='implemented-requirement'] | array[@key='implemented-requirements']/* | map[@key='implemented-requirements']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="implemented-requirement"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('using')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @control-id 000 -->
   <xsl:template match="*[@key='control-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='implemented-requirement']/*[@key='control-id'] | *[@key='implemented-requirements']/*[@key='control-id'] | array[@key='implemented-requirements']/*/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @subcontrol-id 000 -->
   <xsl:template match="*[@key='subcontrol-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='implemented-requirement']/*[@key='subcontrol-id'] | *[@key='implemented-requirements']/*[@key='subcontrol-id'] | array[@key='implemented-requirements']/*/*[@key='subcontrol-id']"
                 mode="as-attribute">
      <xsl:attribute name="subcontrol-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @statement-id 000 -->
   <xsl:template match="*[@key='statement-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='implementation']/*[@key='statement-id'] | *[@key='implementations']/*[@key='statement-id'] | array[@key='implementations']/*/*[@key='statement-id']"
                 mode="as-attribute">
      <xsl:attribute name="statement-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='using']" priority="4" mode="json2xml">
      <xsl:element name="using" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation', 'implementations')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='implementation'] | array[@key='implementations']/* | map[@key='implementations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="implementation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('with-argument', 'with-arguments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='with-argument'] | array[@key='with-arguments']/* | map[@key='with-arguments']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="with-argument" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('use-param')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('with-arguments')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('with-arguments')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('with-arguments')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="with-argument" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('use-param')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "use-param" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='use-param']-->
   <xsl:template match="*[@key='use-param']" priority="5" mode="json2xml">
      <xsl:element name="use-param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @configuration-id 000 -->
   <xsl:template match="*[@key='configuration-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='implementation']/*[@key='configuration-id'] | *[@key='implementations']/*[@key='configuration-id'] | array[@key='implementations']/*/*[@key='configuration-id']"
                 mode="as-attribute">
      <xsl:attribute name="configuration-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @artifact-id 000 -->
   <xsl:template match="*[@key='artifact-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='implementation']/*[@key='artifact-id'] | *[@key='implementations']/*[@key='artifact-id'] | array[@key='implementations']/*/*[@key='artifact-id']"
                 mode="as-attribute">
      <xsl:attribute name="artifact-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='configuration'] | array[@key='configurations']/* | map[@key='configurations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="configuration" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('argument', 'arguments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('mechanism', 'mechanisms')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('configurations')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('configurations')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('configurations')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="configuration" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('argument', 'arguments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('mechanism', 'mechanisms')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='mechanism'] | array[@key='mechanisms']/* | map[@key='mechanisms']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="mechanism" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('configuration-method')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('verification-method')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='configuration-method']" priority="4" mode="json2xml">
      <xsl:element name="configuration-method"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('script')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='verification-method']" priority="4" mode="json2xml">
      <xsl:element name="verification-method"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('script')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "script" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='script']-->
   <xsl:template match="*[@key='script']" priority="5" mode="json2xml">
      <xsl:element name="script" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @system 000 -->
   <xsl:template match="*[@key='system']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='script']/*[@key='system']"
                 mode="as-attribute">
      <xsl:attribute name="system">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='argument'] | array[@key='arguments']/* | map[@key='arguments']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="argument" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('arguments')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('arguments')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('arguments')]/map" priority="3" mode="json2xml">
      <xsl:element name="argument" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='artifact'] | array[@key='artifacts']/* | map[@key='artifacts']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="artifact" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation-source')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('verification-process')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('artifacts')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('artifacts')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('artifacts')]/map" priority="3" mode="json2xml">
      <xsl:element name="artifact" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('implementation-source')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('verification-process')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='implementation-source']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="implementation-source"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='verification-process']" priority="4" mode="json2xml">
      <xsl:element name="verification-process"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @component-id 000 -->
   <xsl:template match="*[@key='component-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='incorporates-component']/*[@key='component-id'] | *[@key='incorporates-components']/*[@key='component-id'] | array[@key='incorporates-components']/*/*[@key='component-id'] | *[@key='used-by-component']/*[@key='component-id'] | *[@key='used-by-components']/*[@key='component-id'] | array[@key='used-by-components']/*/*[@key='component-id'] | *[@key='inventory-item']/*[@key='component-id'] | *[@key='inventory-items']/*[@key='component-id'] | array[@key='inventory-items']/*/*[@key='component-id'] | *[@key='by-component']/*[@key='component-id'] | *[@key='by-components']/*[@key='component-id'] | array[@key='by-components']/*/*[@key='component-id']"
                 mode="as-attribute">
      <xsl:attribute name="component-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @capability-id 000 -->
   <xsl:template match="*[@key='capability-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='incorporates-capability']/*[@key='capability-id'] | *[@key='incorporates-capabilities']/*[@key='capability-id'] | array[@key='incorporates-capabilities']/*/*[@key='capability-id'] | *[@key='by-capability']/*[@key='capability-id'] | *[@key='by-capabilities']/*[@key='capability-id'] | array[@key='by-capabilities']/*/*[@key='capability-id']"
                 mode="as-attribute">
      <xsl:attribute name="capability-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='incorporates-component'] | array[@key='incorporates-components']/* | map[@key='incorporates-components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="incorporates-component"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('incorporates-components')]"
                 priority="5"
                 mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('incorporates-components')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="component-id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('incorporates-components')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="incorporates-component"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='incorporates-capability'] | array[@key='incorporates-capabilities']/* | map[@key='incorporates-capabilities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="incorporates-capability"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('incorporates-capabilities')]"
                 priority="5"
                 mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('incorporates-capabilities')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="capability-id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('incorporates-capabilities')]/map"
                 priority="3"
                 mode="json2xml">
      <xsl:element name="incorporates-capability"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-security-plan'] | /map[empty(@key)]"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="system-security-plan"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import-profile')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-characteristics', 'ssp-system-characteristics')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-implementation', 'ssp-system-implementation')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('control-implementation', 'ssp-control-implementation')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('back-matter')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='import-profile']" priority="4" mode="json2xml">
      <xsl:element name="import-profile" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-characteristics'] | array[@key='ssp-system-characteristics']/* | map[@key='ssp-system-characteristics']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="system-characteristics"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-id')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-name-short')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-sensitivity-level')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-information', 'ssp-system-information')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-impact-level')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-eauth', 'security-eauths')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('deployment-model')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('service-model', 'service-models')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization', 'leveraged-authorizations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('authorization-boundary')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('network-architecture', 'ssp-network-architecture')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('data-flow', 'ssp-data-flow')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-role', 'system-roles')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-id" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='system-id']-->
   <xsl:template match="*[@key='system-id']" priority="5" mode="json2xml">
      <xsl:element name="system-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='system-name']-->
   <xsl:template match="*[@key='system-name']" priority="5" mode="json2xml">
      <xsl:element name="system-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-name-short" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='system-name-short']-->
   <xsl:template match="*[@key='system-name-short']" priority="5" mode="json2xml">
      <xsl:element name="system-name-short" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-sensitivity-level" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-sensitivity-level']-->
   <xsl:template match="*[@key='security-sensitivity-level']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="security-sensitivity-level"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @impact-level 000 -->
   <xsl:template match="*[@key='impact-level']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='base']/*[@key='impact-level'] | *[@key='security-objective-confidentiality']/*[@key='impact-level'] | *[@key='security-objective-integrity']/*[@key='impact-level'] | *[@key='security-objective-availability']/*[@key='impact-level']"
                 mode="as-attribute">
      <xsl:attribute name="impact-level">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-information'] | array[@key='ssp-system-information']/* | map[@key='ssp-system-information']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="system-information" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('information-type', 'ssp-information-type')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('designation', 'designations')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='designation'] | array[@key='designations']/* | map[@key='designations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="designation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('declaration')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qualifiers', 'ssp-qualifiers')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "declaration" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='declaration']-->
   <xsl:template match="*[@key='declaration']" priority="5" mode="json2xml">
      <xsl:element name="declaration" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='qualifiers'] | array[@key='ssp-qualifiers']/* | map[@key='ssp-qualifiers']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="qualifiers" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qualifier', 'ssp-qualifiers')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='qualifier'] | array[@key='ssp-qualifiers']/* | map[@key='ssp-qualifiers']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="qualifier" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-question')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-response')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-question" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='qual-question']-->
   <xsl:template match="*[@key='qual-question']" priority="5" mode="json2xml">
      <xsl:element name="qual-question" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-response" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='qual-response']-->
   <xsl:template match="*[@key='qual-response']" priority="5" mode="json2xml">
      <xsl:element name="qual-response" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-notes" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='qual-notes']-->
   <xsl:template match="*[@key='qual-notes']" priority="5" mode="json2xml">
      <xsl:element name="qual-notes" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='information-type'] | array[@key='ssp-information-type']/* | map[@key='ssp-information-type']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="information-type" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('confidentiality-impact', 'ssp-confidentiality-impact')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('integrity-impact', 'ssp-integrity-impact')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('availability-impact', 'ssp-availability-impact')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='confidentiality-impact'] | array[@key='ssp-confidentiality-impact']/* | map[@key='ssp-confidentiality-impact']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="confidentiality-impact"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='integrity-impact'] | array[@key='ssp-integrity-impact']/* | map[@key='ssp-integrity-impact']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="integrity-impact" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='availability-impact'] | array[@key='ssp-availability-impact']/* | map[@key='ssp-availability-impact']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="availability-impact"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "base" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='base']-->
   <xsl:template match="*[@key='base']" priority="5" mode="json2xml">
      <xsl:element name="base" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "selected" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='selected']-->
   <xsl:template match="*[@key='selected']" priority="5" mode="json2xml">
      <xsl:element name="selected" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!--*[@key='adjustment-justification']-->
   <xsl:template match="*[@key='adjustment-justification']"
                 priority="5"
                 mode="json2xml">
      <xsl:for-each select="string[@key='adjustment-justification'], self::string">
         <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:for-each>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='security-impact-level']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="security-impact-level"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-confidentiality')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-integrity')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-availability')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-confidentiality" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-objective-confidentiality']-->
   <xsl:template match="*[@key='security-objective-confidentiality']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="security-objective-confidentiality"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-integrity" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-objective-integrity']-->
   <xsl:template match="*[@key='security-objective-integrity']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="security-objective-integrity"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-availability" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-objective-availability']-->
   <xsl:template match="*[@key='security-objective-availability']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="security-objective-availability"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='security-eauth'] | array[@key='security-eauths']/* | map[@key='security-eauths']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="security-eauth" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-ial')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-aal')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-fal')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-eauth-level')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-ial" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-auth-ial']-->
   <xsl:template match="*[@key='security-auth-ial']" priority="5" mode="json2xml">
      <xsl:element name="security-auth-ial" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-aal" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-auth-aal']-->
   <xsl:template match="*[@key='security-auth-aal']" priority="5" mode="json2xml">
      <xsl:element name="security-auth-aal" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-fal" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-auth-fal']-->
   <xsl:template match="*[@key='security-auth-fal']" priority="5" mode="json2xml">
      <xsl:element name="security-auth-fal" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-eauth-level" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='security-eauth-level']-->
   <xsl:template match="*[@key='security-eauth-level']" priority="5" mode="json2xml">
      <xsl:element name="security-eauth-level"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='status']" priority="4" mode="json2xml">
      <xsl:element name="status" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='deployment-model']" priority="4" mode="json2xml">
      <xsl:element name="deployment-model" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='service-model'] | array[@key='service-models']/* | map[@key='service-models']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="service-model" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='leveraged-authorization'] | array[@key='leveraged-authorizations']/* | map[@key='leveraged-authorizations']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('leveraged-authorization-name')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization-service-provider')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization-date-granted')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='leveraged-authorization-name']-->
   <xsl:template match="*[@key='leveraged-authorization-name']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-name"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-service-provider" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='leveraged-authorization-service-provider']-->
   <xsl:template match="*[@key='leveraged-authorization-service-provider']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-service-provider"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-date-granted" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='leveraged-authorization-date-granted']-->
   <xsl:template match="*[@key='leveraged-authorization-date-granted']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-date-granted"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='authorization-boundary']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="authorization-boundary"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('diagram', 'diagrams')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='diagram'] | array[@key='diagrams']/* | map[@key='diagrams']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="diagram" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('diagrams')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('diagrams')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('diagrams')]/map" priority="3" mode="json2xml">
      <xsl:element name="diagram" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='network-architecture'] | array[@key='ssp-network-architecture']/* | map[@key='ssp-network-architecture']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="network-architecture"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('diagram', 'diagrams')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='data-flow'] | array[@key='ssp-data-flow']/* | map[@key='ssp-data-flow']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="data-flow" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('diagram', 'diagrams')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-role'] | array[@key='system-roles']/* | map[@key='system-roles']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="system-role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('privilege', 'privileges')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('responsibility', 'responsibilities')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('statistics')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('system-roles')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('system-roles')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('system-roles')]/map" priority="3" mode="json2xml">
      <xsl:element name="system-role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('privilege', 'privileges')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('responsibility', 'responsibilities')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('statistics')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "privilege" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='privilege'] | *[@key='privileges']  | array[@key='privileges']/*-->
   <xsl:template match="*[@key='privilege'] | *[@key='privileges']  | array[@key='privileges']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="privilege" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'privileges']/array[@key = 'STRVALUE'] | array[@key = 'privileges']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="privileges">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'privileges']/array[@key = 'STRVALUE']/string | array[@key = 'privileges']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "responsibility" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='responsibility'] | *[@key='responsibilities']  | array[@key='responsibilities']/*-->
   <xsl:template match="*[@key='responsibility'] | *[@key='responsibilities']  | array[@key='responsibilities']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="responsibility" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'responsibilities']/array[@key = 'STRVALUE'] | array[@key = 'responsibilities']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="responsibilities">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'responsibilities']/array[@key = 'STRVALUE']/string | array[@key = 'responsibilities']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='statistics']" priority="4" mode="json2xml">
      <xsl:element name="statistics" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('internal-user-total-current')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('internal-user-total-future')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-user-total-current')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-user-total-future')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "internal-user-total-current" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='internal-user-total-current']-->
   <xsl:template match="*[@key='internal-user-total-current']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="internal-user-total-current"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "internal-user-total-future" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='internal-user-total-future']-->
   <xsl:template match="*[@key='internal-user-total-future']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="internal-user-total-future"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-user-total-current" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='external-user-total-current']-->
   <xsl:template match="*[@key='external-user-total-current']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="external-user-total-current"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-user-total-future" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='external-user-total-future']-->
   <xsl:template match="*[@key='external-user-total-future']"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="external-user-total-future"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-implementation'] | array[@key='ssp-system-implementation']/* | map[@key='ssp-system-implementation']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="system-implementation"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('component', 'components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('capability', 'capabilities')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('service', 'services')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('interconnection', 'ssp-interconnection')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-inventory')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='component'] | array[@key='components']/* | map[@key='components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('supplier')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('configuration', 'configurations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('artifact', 'artifacts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('components')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('components')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('components')]/map" priority="3" mode="json2xml">
      <xsl:element name="component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('supplier')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('configuration', 'configurations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('artifact', 'artifacts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='capability'] | array[@key='capabilities']/* | map[@key='capabilities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="capability" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('incorporates-capability', 'incorporates-capabilities')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('incorporates-component', 'incorporates-components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- Mapping object with key to element with attribute -->
   <xsl:template match="map[@key=('capabilities')]" priority="5" mode="json2xml">
      <xsl:apply-templates mode="json2xml"/>
   </xsl:template>
   <xsl:template priority="2"
                 match="map[@key=('capabilities')]/*/@key"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template match="map[@key=('capabilities')]/map" priority="3" mode="json2xml">
      <xsl:element name="capability" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="@key" mode="as-attribute"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('incorporates-capability', 'incorporates-capabilities')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('incorporates-component', 'incorporates-components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remarks')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='service'] | array[@key='services']/* | map[@key='services']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="service" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('protocol', 'ssp-protocol')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('purpose')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('used-by-component', 'used-by-components')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='protocol'] | array[@key='ssp-protocol']/* | map[@key='ssp-protocol']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="protocol" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('port-range', 'port-ranges')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "port-range" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='port-range'] | *[@key='port-ranges']  | array[@key='port-ranges']/*-->
   <xsl:template match="*[@key='port-range'] | *[@key='port-ranges']  | array[@key='port-ranges']/*"
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
   <!-- 000 Handling field "purpose" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='purpose']-->
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='used-by-component'] | array[@key='used-by-components']/* | map[@key='used-by-components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="used-by-component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='interconnection'] | array[@key='ssp-interconnection']/* | map[@key='ssp-interconnection']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="interconnection" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-system-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-system-org')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('isa-authorization', 'isa-authorizations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('isa-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('isa-date')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-system-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='external-system-name']-->
   <xsl:template match="*[@key='external-system-name']" priority="5" mode="json2xml">
      <xsl:element name="external-system-name"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-system-org" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='external-system-org']-->
   <xsl:template match="*[@key='external-system-org']" priority="5" mode="json2xml">
      <xsl:element name="external-system-org"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "isa-authorization" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='isa-authorization'] | *[@key='isa-authorizations']  | array[@key='isa-authorizations']/*-->
   <xsl:template match="*[@key='isa-authorization'] | *[@key='isa-authorizations']  | array[@key='isa-authorizations']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="isa-authorization" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'isa-authorizations']/array[@key = 'STRVALUE'] | array[@key = 'isa-authorizations']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="isa-authorizations">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'isa-authorizations']/array[@key = 'STRVALUE']/string | array[@key = 'isa-authorizations']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "isa-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='isa-name']-->
   <xsl:template match="*[@key='isa-name']" priority="5" mode="json2xml">
      <xsl:element name="isa-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "isa-date" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='isa-date']-->
   <xsl:template match="*[@key='isa-date']" priority="5" mode="json2xml">
      <xsl:element name="isa-date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "vendor" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='vendor'] | *[@key='vendors']  | array[@key='vendors']/*-->
   <xsl:template match="*[@key='vendor'] | *[@key='vendors']  | array[@key='vendors']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="vendor" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'vendors']/array[@key = 'STRVALUE'] | array[@key = 'vendors']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="vendors">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'vendors']/array[@key = 'STRVALUE']/string | array[@key = 'vendors']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "ip-address" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='ip-address'] | *[@key='ip-addresses']  | array[@key='ip-addresses']/*-->
   <xsl:template match="*[@key='ip-address'] | *[@key='ip-addresses']  | array[@key='ip-addresses']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="ip-address" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'ip-addresses']/array[@key = 'STRVALUE'] | array[@key = 'ip-addresses']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="ip-addresses">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'ip-addresses']/array[@key = 'STRVALUE']/string | array[@key = 'ip-addresses']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='system-inventory']" priority="4" mode="json2xml">
      <xsl:element name="system-inventory" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('inventory-item', 'inventory-items')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='inventory-item'] | array[@key='inventory-items']/* | map[@key='inventory-items']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="inventory-item" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ip-address', 'ip-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('dns-name', 'dns-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('host-item', 'ssp-host-item')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('software-item', 'ssp-software-item')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('comments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('serial-no')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('network-id', 'network-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('asset-owner', 'asset-owners')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('asset-administrator', 'asset-administrators')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "dns-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='dns-name'] | *[@key='dns-names']  | array[@key='dns-names']/*-->
   <xsl:template match="*[@key='dns-name'] | *[@key='dns-names']  | array[@key='dns-names']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="dns-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'dns-names']/array[@key = 'STRVALUE'] | array[@key = 'dns-names']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="dns-names">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'dns-names']/array[@key = 'STRVALUE']/string | array[@key = 'dns-names']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='host-item'] | array[@key='ssp-host-item']/* | map[@key='ssp-host-item']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="host-item" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('netbios-name', 'netbios-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('mac-address', 'mac-addresses')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('authenticated-scan', 'authenticated-scans')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('baseline-template', 'baseline-templates')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('os-name', 'os-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('os-version', 'os-versions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location', 'locations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('asset-type', 'asset-types')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('vendor', 'vendors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hardware-model', 'hardware-models')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('scanned', 'ssp-scanned')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "netbios-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='netbios-name'] | *[@key='netbios-names']  | array[@key='netbios-names']/*-->
   <xsl:template match="*[@key='netbios-name'] | *[@key='netbios-names']  | array[@key='netbios-names']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="netbios-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'netbios-names']/array[@key = 'STRVALUE'] | array[@key = 'netbios-names']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="netbios-names">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'netbios-names']/array[@key = 'STRVALUE']/string | array[@key = 'netbios-names']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "mac-address" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='mac-address'] | *[@key='mac-addresses']  | array[@key='mac-addresses']/*-->
   <xsl:template match="*[@key='mac-address'] | *[@key='mac-addresses']  | array[@key='mac-addresses']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="mac-address" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'mac-addresses']/array[@key = 'STRVALUE'] | array[@key = 'mac-addresses']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="mac-addresses">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'mac-addresses']/array[@key = 'STRVALUE']/string | array[@key = 'mac-addresses']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "os-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='os-name'] | *[@key='os-names']  | array[@key='os-names']/*-->
   <xsl:template match="*[@key='os-name'] | *[@key='os-names']  | array[@key='os-names']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="os-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'os-names']/array[@key = 'STRVALUE'] | array[@key = 'os-names']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="os-names">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'os-names']/array[@key = 'STRVALUE']/string | array[@key = 'os-names']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "os-version" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='os-version'] | *[@key='os-versions']  | array[@key='os-versions']/*-->
   <xsl:template match="*[@key='os-version'] | *[@key='os-versions']  | array[@key='os-versions']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="os-version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'os-versions']/array[@key = 'STRVALUE'] | array[@key = 'os-versions']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="os-versions">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'os-versions']/array[@key = 'STRVALUE']/string | array[@key = 'os-versions']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "location" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='location'] | *[@key='locations']  | array[@key='locations']/*-->
   <xsl:template match="*[@key='location'] | *[@key='locations']  | array[@key='locations']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="location" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'locations']/array[@key = 'STRVALUE'] | array[@key = 'locations']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="locations">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'locations']/array[@key = 'STRVALUE']/string | array[@key = 'locations']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "asset-type" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='asset-type'] | *[@key='asset-types']  | array[@key='asset-types']/*-->
   <xsl:template match="*[@key='asset-type'] | *[@key='asset-types']  | array[@key='asset-types']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="asset-type" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'asset-types']/array[@key = 'STRVALUE'] | array[@key = 'asset-types']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="asset-types">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'asset-types']/array[@key = 'STRVALUE']/string | array[@key = 'asset-types']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "hardware-model" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='hardware-model'] | *[@key='hardware-models']  | array[@key='hardware-models']/*-->
   <xsl:template match="*[@key='hardware-model'] | *[@key='hardware-models']  | array[@key='hardware-models']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="hardware-model" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'hardware-models']/array[@key = 'STRVALUE'] | array[@key = 'hardware-models']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="hardware-models">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'hardware-models']/array[@key = 'STRVALUE']/string | array[@key = 'hardware-models']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "authenticated-scan" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='authenticated-scan'] | *[@key='authenticated-scans']  | array[@key='authenticated-scans']/*-->
   <xsl:template match="*[@key='authenticated-scan'] | *[@key='authenticated-scans']  | array[@key='authenticated-scans']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="authenticated-scan" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'authenticated-scans']/array[@key = 'STRVALUE'] | array[@key = 'authenticated-scans']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="authenticated-scans">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'authenticated-scans']/array[@key = 'STRVALUE']/string | array[@key = 'authenticated-scans']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='software-item'] | array[@key='ssp-software-item']/* | map[@key='ssp-software-item']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="software-item" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('vendor', 'vendors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('software-name', 'software-names')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('software-version', 'software-versions')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('software-patch-level', 'software-patch-levels')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('function', 'functions')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "software-name" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='software-name'] | *[@key='software-names']  | array[@key='software-names']/*-->
   <xsl:template match="*[@key='software-name'] | *[@key='software-names']  | array[@key='software-names']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="software-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'software-names']/array[@key = 'STRVALUE'] | array[@key = 'software-names']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="software-names">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'software-names']/array[@key = 'STRVALUE']/string | array[@key = 'software-names']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "software-version" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='software-version'] | *[@key='software-versions']  | array[@key='software-versions']/*-->
   <xsl:template match="*[@key='software-version'] | *[@key='software-versions']  | array[@key='software-versions']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="software-version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'software-versions']/array[@key = 'STRVALUE'] | array[@key = 'software-versions']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="software-versions">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'software-versions']/array[@key = 'STRVALUE']/string | array[@key = 'software-versions']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "software-patch-level" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='software-patch-level'] | *[@key='software-patch-levels']  | array[@key='software-patch-levels']/*-->
   <xsl:template match="*[@key='software-patch-level'] | *[@key='software-patch-levels']  | array[@key='software-patch-levels']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="software-patch-level"
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
                 match="map[@key = 'software-patch-levels']/array[@key = 'STRVALUE'] | array[@key = 'software-patch-levels']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="software-patch-levels">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'software-patch-levels']/array[@key = 'STRVALUE']/string | array[@key = 'software-patch-levels']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "function" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='function'] | *[@key='functions']  | array[@key='functions']/*-->
   <xsl:template match="*[@key='function'] | *[@key='functions']  | array[@key='functions']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="function" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'functions']/array[@key = 'STRVALUE'] | array[@key = 'functions']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="functions">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'functions']/array[@key = 'STRVALUE']/string | array[@key = 'functions']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "comments" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='comments']-->
   <xsl:template match="*[@key='comments']" priority="5" mode="json2xml">
      <xsl:element name="comments" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "serial-no" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='serial-no']-->
   <xsl:template match="*[@key='serial-no']" priority="5" mode="json2xml">
      <xsl:element name="serial-no" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "network-id" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='network-id'] | *[@key='network-ids']  | array[@key='network-ids']/*-->
   <xsl:template match="*[@key='network-id'] | *[@key='network-ids']  | array[@key='network-ids']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="network-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'network-ids']/array[@key = 'STRVALUE'] | array[@key = 'network-ids']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="network-ids">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'network-ids']/array[@key = 'STRVALUE']/string | array[@key = 'network-ids']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "asset-owner" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='asset-owner'] | *[@key='asset-owners']  | array[@key='asset-owners']/*-->
   <xsl:template match="*[@key='asset-owner'] | *[@key='asset-owners']  | array[@key='asset-owners']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="asset-owner" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'asset-owners']/array[@key = 'STRVALUE'] | array[@key = 'asset-owners']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="asset-owners">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'asset-owners']/array[@key = 'STRVALUE']/string | array[@key = 'asset-owners']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "asset-administrator" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='asset-administrator'] | *[@key='asset-administrators']  | array[@key='asset-administrators']/*-->
   <xsl:template match="*[@key='asset-administrator'] | *[@key='asset-administrators']  | array[@key='asset-administrators']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="asset-administrator"
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
                 match="map[@key = 'asset-administrators']/array[@key = 'STRVALUE'] | array[@key = 'asset-administrators']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="asset-administrators">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'asset-administrators']/array[@key = 'STRVALUE']/string | array[@key = 'asset-administrators']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='control-implementation'] | array[@key='ssp-control-implementation']/* | map[@key='ssp-control-implementation']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="control-implementation"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('meets-requirement-set', 'meets-requirement-sets')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('by-component', 'by-components')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('by-capability', 'by-capabilities')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='by-component'] | array[@key='by-components']/* | map[@key='by-components']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="by-component" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('meets-requirement-set', 'meets-requirement-sets')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='by-capability'] | array[@key='by-capabilities']/* | map[@key='by-capabilities']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="by-capability" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('meets-requirement-set', 'meets-requirement-sets')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='meets-requirement-set'] | array[@key='meets-requirement-sets']/* | map[@key='meets-requirement-sets']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="meets-requirement-set"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-role', 'ssp-responsible-role')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('set-param', 'parameter-settings')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('implemented-requirement', 'implemented-requirements')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "responsible-role" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='responsible-role'] | *[@key='ssp-responsible-role']  | array[@key='ssp-responsible-role']/*-->
   <xsl:template match="*[@key='responsible-role'] | *[@key='ssp-responsible-role']  | array[@key='ssp-responsible-role']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="responsible-role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'ssp-responsible-role']/array[@key = 'STRVALUE'] | array[@key = 'ssp-responsible-role']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="ssp-responsible-role">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'ssp-responsible-role']/array[@key = 'STRVALUE']/string | array[@key = 'ssp-responsible-role']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling assembly "{ @name }" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <xsl:template match="*[@key='set-param'] | array[@key='parameter-settings']/* | map[@key='parameter-settings']"
                 priority="4"
                 mode="json2xml">
      <xsl:element name="set-param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "value" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='value']-->
   <xsl:template match="*[@key='value']" priority="5" mode="json2xml">
      <xsl:element name="value" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag @nist-id 000 -->
   <xsl:template match="*[@key='nist-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='information-type']/*[@key='nist-id'] | *[@key='ssp-information-type']/*[@key='nist-id'] | array[@key='ssp-information-type']/*/*[@key='nist-id']"
                 mode="as-attribute">
      <xsl:attribute name="nist-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @param-id 000 -->
   <xsl:template match="*[@key='param-id']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='set-param']/*[@key='param-id'] | *[@key='parameter-settings']/*[@key='param-id'] | array[@key='parameter-settings']/*/*[@key='param-id']"
                 mode="as-attribute">
      <xsl:attribute name="param-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @start 000 -->
   <xsl:template match="*[@key='start']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='port-range']/*[@key='start'] | *[@key='port-ranges']/*[@key='start'] | array[@key='port-ranges']/*/*[@key='start']"
                 mode="as-attribute">
      <xsl:attribute name="start">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @end 000 -->
   <xsl:template match="*[@key='end']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='port-range']/*[@key='end'] | *[@key='port-ranges']/*[@key='end'] | array[@key='port-ranges']/*/*[@key='end']"
                 mode="as-attribute">
      <xsl:attribute name="end">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @transport 000 -->
   <xsl:template match="*[@key='transport']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='port-range']/*[@key='transport'] | *[@key='port-ranges']/*[@key='transport'] | array[@key='port-ranges']/*/*[@key='transport']"
                 mode="as-attribute">
      <xsl:attribute name="transport">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @public 000 -->
   <xsl:template match="*[@key='public']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='inventory-item']/*[@key='public'] | *[@key='inventory-items']/*[@key='public'] | array[@key='inventory-items']/*/*[@key='public']"
                 mode="as-attribute">
      <xsl:attribute name="public">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @virtual 000 -->
   <xsl:template match="*[@key='virtual']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='inventory-item']/*[@key='virtual'] | *[@key='inventory-items']/*[@key='virtual'] | array[@key='inventory-items']/*/*[@key='virtual']"
                 mode="as-attribute">
      <xsl:attribute name="virtual">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @external 000 -->
   <xsl:template match="*[@key='external']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='system-role']/*[@key='external'] | *[@key='system-roles']/*[@key='external'] | array[@key='system-roles']/*/*[@key='external']"
                 mode="as-attribute">
      <xsl:attribute name="external">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @access 000 -->
   <xsl:template match="*[@key='access']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='system-role']/*[@key='access'] | *[@key='system-roles']/*[@key='access'] | array[@key='system-roles']/*/*[@key='access']"
                 mode="as-attribute">
      <xsl:attribute name="access">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag @sensitivity-level 000 -->
   <xsl:template match="*[@key='sensitivity-level']" priority="6" mode="json2xml"/>
   <xsl:template priority="2"
                 match="*[@key='system-role']/*[@key='sensitivity-level'] | *[@key='system-roles']/*[@key='sensitivity-level'] | array[@key='system-roles']/*/*[@key='sensitivity-level']"
                 mode="as-attribute">
      <xsl:attribute name="sensitivity-level">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "baseline-template" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='baseline-template'] | *[@key='baseline-templates']  | array[@key='baseline-templates']/*-->
   <xsl:template match="*[@key='baseline-template'] | *[@key='baseline-templates']  | array[@key='baseline-templates']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="baseline-template" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'baseline-templates']/array[@key = 'STRVALUE'] | array[@key = 'baseline-templates']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="baseline-templates">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'baseline-templates']/array[@key = 'STRVALUE']/string | array[@key = 'baseline-templates']/map/array[@key = 'STRVALUE']/string">
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
   <!-- 000 Handling field "scanned" 000 -->
   <!-- 000 NB - template matching 'array' overrides this one 000 -->
   <!--*[@key='scanned'] | *[@key='ssp-scanned']  | array[@key='ssp-scanned']/*-->
   <xsl:template match="*[@key='scanned'] | *[@key='ssp-scanned']  | array[@key='ssp-scanned']/*"
                 priority="5"
                 mode="json2xml">
      <xsl:element name="scanned" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates select="*" mode="as-attribute"/>
         <xsl:apply-templates select="string[@key='STRVALUE']" mode="json2xml"/>
         <xsl:for-each select="self::string | self::boolean | self::number">
            <xsl:apply-templates mode="json2xml"/>
         </xsl:for-each>
      </xsl:element>
   </xsl:template>
   <xsl:template priority="3"
                 mode="json2xml"
                 match="map[@key = 'ssp-scanned']/array[@key = 'STRVALUE'] | array[@key = 'ssp-scanned']/map/array[@key = 'STRVALUE']">
      <xsl:variable name="expanded" as="element()*">
         <array xmlns="http://www.w3.org/2005/xpath-functions" key="ssp-scanned">
            <xsl:apply-templates mode="expand" select="array[@key = 'STRVALUE']/string"/>
         </array>
      </xsl:variable>
      <xsl:apply-templates select="$expanded" mode="json2xml"/>
   </xsl:template>
   <xsl:template mode="expand"
                 match="map[@key = 'ssp-scanned']/array[@key = 'STRVALUE']/string | array[@key = 'ssp-scanned']/map/array[@key = 'STRVALUE']/string">
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
      <rules><!-- first, literal replacements --><!--<replace match="&amp;"  >&amp;amp;</replace>-->
         <replace match="&lt;">&amp;lt;</replace>
         <!-- next, explicit escape sequences -->
         <replace match="\\&#34;">&amp;quot;</replace>
         <replace match="\\'">&amp;apos;</replace>
         <replace match="\\\*">&amp;#2A;</replace>
         <replace match="\\`">&amp;#60;</replace>
         <replace match="\\~">&amp;#7E;</replace>
         <replace match="\\^">&amp;#5E;</replace>
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
