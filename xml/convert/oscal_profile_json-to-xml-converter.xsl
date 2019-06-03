<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- OSCAL profile conversion stylesheet supports JSON->XML conversion -->
   <xsl:param name="target-ns"
              as="xs:string?"
              select="'http://csrc.nist.gov/ns/oscal/1.0'"/>
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
      <xsl:apply-templates mode="#current" select="*[@key=('profile')]"/>
   </xsl:template>
   <xsl:template match="array" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="array[@key='prose']/*" priority="5" mode="json2xml">
      <xsl:element name="p" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:variable name="text-contents" select="string-join(string,'&#xA;')"/>
         <xsl:call-template name="parse">
            <xsl:with-param name="str" select="$text-contents"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template match="string[@key='RICHTEXT']" mode="json2xml">
      <xsl:call-template name="parse"/>
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
   <!-- 000 Handling assembly "metadata" 000 -->
   <xsl:template match="*[@key='metadata']" priority="2" mode="json2xml">
      <xsl:element name="metadata" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('publication-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party', 'parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('extra-meta')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "publication-date" 000 -->
   <xsl:template match="*[@key='publication-date']" priority="2" mode="json2xml">
      <xsl:element name="publication-date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "party" 000 -->
   <xsl:template match="*[@key='party'] | *[@key='parties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="party" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person', 'persons')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "person" 000 -->
   <xsl:template match="*[@key='person'] | *[@key='persons']/*"
                 priority="2"
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
   <!-- 000 Handling assembly "org" 000 -->
   <xsl:template match="*[@key='org']" priority="2" mode="json2xml">
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
   <xsl:template match="*[@key='person-id'] | *[@key='person-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="person-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-id" 000 -->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "person-name" 000 -->
   <xsl:template match="*[@key='person-name']" priority="2" mode="json2xml">
      <xsl:element name="person-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-name" 000 -->
   <xsl:template match="*[@key='org-name']" priority="2" mode="json2xml">
      <xsl:element name="org-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "short-name" 000 -->
   <xsl:template match="*[@key='short-name']" priority="2" mode="json2xml">
      <xsl:element name="short-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "address" 000 -->
   <xsl:template match="*[@key='address'] | *[@key='addresses']/*"
                 priority="2"
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
   <xsl:template match="*[@key='addr-line'] | *[@key='postal-address']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="addr-line" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "city" 000 -->
   <xsl:template match="*[@key='city']" priority="2" mode="json2xml">
      <xsl:element name="city" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "state" 000 -->
   <xsl:template match="*[@key='state']" priority="2" mode="json2xml">
      <xsl:element name="state" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "postal-code" 000 -->
   <xsl:template match="*[@key='postal-code']" priority="2" mode="json2xml">
      <xsl:element name="postal-code" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "country" 000 -->
   <xsl:template match="*[@key='country']" priority="2" mode="json2xml">
      <xsl:element name="country" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "email" 000 -->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="email" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "phone" 000 -->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="phone" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "url" 000 -->
   <xsl:template match="*[@key='url'] | *[@key='URLs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="url" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "role" 000 -->
   <xsl:template match="*[@key='role'] | *[@key='roles']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc', 'descriptions')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "extra-meta" 000 -->
   <xsl:template match="*[@key='extra-meta']" priority="2" mode="json2xml">
      <xsl:element name="extra-meta" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta-group', 'metadata-groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta', 'metadata-fields')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "meta-group" 000 -->
   <xsl:template match="*[@key='meta-group'] | *[@key='metadata-groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="meta-group" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta', 'metadata-fields')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta-group', 'metadata-groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "meta" 000 -->
   <xsl:template match="*[@key='meta'] | *[@key='metadata-fields']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="meta" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "term" 000 -->
   <xsl:template match="*[@key='term']" mode="json2xml"/>
   <xsl:template match="*[@key='meta-group']/*[@key='term'] | *[@key='metadata-groups']/*/*[@key='term'] | *[@key='meta']/*[@key='term'] | *[@key='metadata-fields']/*/*[@key='term']"
                 mode="as-attribute">
      <xsl:attribute name="term">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "role-id" 000 -->
   <xsl:template match="*[@key='role-id']" mode="json2xml"/>
   <xsl:template match="*[@key='party']/*[@key='role-id'] | *[@key='parties']/*/*[@key='role-id']"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "resource" 000 -->
   <xsl:template match="*[@key='resource'] | *[@key='resources']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="resource" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('format')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hlink', 'hashed-links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base64')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "author" 000 -->
   <xsl:template match="*[@key='author'] | *[@key='authors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="author" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "doc-id" 000 -->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "type" 000 -->
   <xsl:template match="*[@key='type']" mode="json2xml"/>
   <xsl:template match="*[@key='person-id']/*[@key='type'] | *[@key='person-ids']/*/*[@key='type'] | *[@key='org-id']/*[@key='type'] | *[@key='organization-ids']/*/*[@key='type'] | *[@key='address']/*[@key='type'] | *[@key='addresses']/*/*[@key='type'] | *[@key='email']/*[@key='type'] | *[@key='email-addresses']/*/*[@key='type'] | *[@key='phone']/*[@key='type'] | *[@key='telephone-numbers']/*/*[@key='type'] | *[@key='url']/*[@key='type'] | *[@key='URLs']/*/*[@key='type'] | *[@key='meta-group']/*[@key='type'] | *[@key='metadata-groups']/*/*[@key='type'] | *[@key='meta']/*[@key='type'] | *[@key='metadata-fields']/*/*[@key='type'] | *[@key='doc-id']/*[@key='type'] | *[@key='document-ids']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "notes" 000 -->
   <xsl:template match="*[@key='notes']" priority="2" mode="json2xml">
      <xsl:element name="notes" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "hlink" 000 -->
   <xsl:template match="*[@key='hlink'] | *[@key='hashed-links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hlink" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hash', 'hashes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "hash" 000 -->
   <xsl:template match="*[@key='hash'] | *[@key='hashes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hash" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "algorithm" 000 -->
   <xsl:template match="*[@key='algorithm']" mode="json2xml"/>
   <xsl:template match="*[@key='hash']/*[@key='algorithm'] | *[@key='hashes']/*/*[@key='algorithm']"
                 mode="as-attribute">
      <xsl:attribute name="algorithm">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "href" 000 -->
   <xsl:template match="*[@key='href']" mode="json2xml"/>
   <xsl:template match="*[@key='hlink']/*[@key='href'] | *[@key='hashed-links']/*/*[@key='href'] | *[@key='citation']/*[@key='href'] | *[@key='citations']/*/*[@key='href'] | *[@key='link']/*[@key='href'] | *[@key='links']/*/*[@key='href'] | *[@key='import']/*[@key='href'] | *[@key='imports']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "rel" 000 -->
   <xsl:template match="*[@key='rel']" mode="json2xml"/>
   <xsl:template match="*[@key='resource']/*[@key='rel'] | *[@key='resources']/*/*[@key='rel'] | *[@key='link']/*[@key='rel'] | *[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "media-type" 000 -->
   <xsl:template match="*[@key='media-type']" mode="json2xml"/>
   <xsl:template match="*[@key='resource']/*[@key='media-type'] | *[@key='resources']/*/*[@key='media-type'] | *[@key='hlink']/*[@key='media-type'] | *[@key='hashed-links']/*/*[@key='media-type']"
                 mode="as-attribute">
      <xsl:attribute name="media-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "description" 000 -->
   <xsl:template match="*[@key='description']" priority="2" mode="json2xml">
      <xsl:element name="description" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "version" 000 -->
   <xsl:template match="*[@key='version']" priority="2" mode="json2xml">
      <xsl:element name="version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "iso-date" 000 -->
   <xsl:template match="*[@key='iso-date']" mode="json2xml"/>
   <xsl:template match="*[@key='version']/*[@key='iso-date'] | *[@key='date']/*[@key='iso-date']"
                 mode="as-attribute">
      <xsl:attribute name="iso-date">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "format" 000 -->
   <xsl:template match="*[@key='format']" priority="2" mode="json2xml">
      <xsl:element name="format" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "date" 000 -->
   <xsl:template match="*[@key='date']" priority="2" mode="json2xml">
      <xsl:element name="date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "base64" 000 -->
   <xsl:template match="*[@key='base64']" priority="2" mode="json2xml">
      <xsl:element name="base64" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "filename" 000 -->
   <xsl:template match="*[@key='filename']" mode="json2xml"/>
   <xsl:template match="*[@key='base64']/*[@key='filename']" mode="as-attribute">
      <xsl:attribute name="filename">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "ref-list" 000 -->
   <xsl:template match="*[@key='ref-list'] | *[@key='reference-lists']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ref-list" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref', 'references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "ref" 000 -->
   <xsl:template match="*[@key='ref'] | *[@key='references']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ref" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('citation', 'citations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "citation" 000 -->
   <xsl:template match="*[@key='citation'] | *[@key='citations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="citation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "link" 000 -->
   <xsl:template match="*[@key='link'] | *[@key='links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="link" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "title" 000 -->
   <xsl:template match="*[@key='title']" priority="2" mode="json2xml">
      <xsl:element name="title" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "param" 000 -->
   <xsl:template match="*[@key='param'] | *[@key='parameters']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('label')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc', 'descriptions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('constraint', 'constraints')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('guideline', 'guidance')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('select')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='param']/string[@key='id'] | *[@key='parameters']/*/string[@key='{@address}']"/>
   <!-- 000 Handling field "label" 000 -->
   <xsl:template match="*[@key='label']" priority="2" mode="json2xml">
      <xsl:element name="label" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <xsl:template match="*[@key='desc'] | *[@key='descriptions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "constraint" 000 -->
   <xsl:template match="*[@key='constraint'] | *[@key='constraints']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="constraint" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "guideline" 000 -->
   <xsl:template match="*[@key='guideline'] | *[@key='guidance']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="guideline" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "value" 000 -->
   <xsl:template match="*[@key='value']" priority="2" mode="json2xml">
      <xsl:element name="value" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "select" 000 -->
   <xsl:template match="*[@key='select']" priority="2" mode="json2xml">
      <xsl:element name="select" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('choice', 'alternatives')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "choice" 000 -->
   <xsl:template match="*[@key='choice'] | *[@key='alternatives']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="choice" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "part" 000 -->
   <xsl:template match="*[@key='part'] | *[@key='parts']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="part" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='party']/*[@key='id'] | *[@key='parties']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*/*[@key='id'] | *[@key='ref-list']/*[@key='id'] | *[@key='reference-lists']/*/*[@key='id'] | *[@key='ref']/*[@key='id'] | *[@key='references']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*/*[@key='id'] | *[@key='prop']/*[@key='id'] | *[@key='properties']/*/*[@key='id'] | *[@key='param']/*[@key='id'] | *[@key='parameters']/*/*[@key='id'] | *[@key='desc']/*[@key='id'] | *[@key='descriptions']/*/*[@key='id'] | *[@key='part']/*[@key='id'] | *[@key='parts']/*/*[@key='id'] | *[@key='profile']/*[@key='id'] | *[@key='profiles']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*/*[@key='class'] | *[@key='param']/*[@key='class'] | *[@key='parameters']/*/*[@key='class'] | *[@key='part']/*[@key='class'] | *[@key='parts']/*/*[@key='class'] | *[@key='set']/*[@key='class'] | *[@key='settings']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "test" 000 -->
   <xsl:template match="*[@key='test']" mode="json2xml"/>
   <xsl:template match="*[@key='constraint']/*[@key='test'] | *[@key='constraints']/*/*[@key='test']"
                 mode="as-attribute">
      <xsl:attribute name="test">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "how-many" 000 -->
   <xsl:template match="*[@key='how-many']" mode="json2xml"/>
   <xsl:template match="*[@key='select']/*[@key='how-many']" mode="as-attribute">
      <xsl:attribute name="how-many">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "depends-on" 000 -->
   <xsl:template match="*[@key='depends-on']" mode="json2xml"/>
   <xsl:template match="*[@key='param']/*[@key='depends-on'] | *[@key='parameters']/*/*[@key='depends-on'] | *[@key='set']/*[@key='depends-on'] | *[@key='settings']/*/*[@key='depends-on']"
                 mode="as-attribute">
      <xsl:attribute name="depends-on">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "profile" 000 -->
   <xsl:template match="*[@key='profile'] | *[@key='profiles']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="profile" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import', 'imports')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('merge')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('modify', 'modifys')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "import" 000 -->
   <xsl:template match="*[@key='import'] | *[@key='imports']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="import" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('include', 'includes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('exclude', 'excludes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "merge" 000 -->
   <xsl:template match="*[@key='merge']" priority="2" mode="json2xml">
      <xsl:element name="merge" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('combine')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('as-is')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('custom', 'customs')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "combine" 000 -->
   <xsl:template match="*[@key='combine']" priority="2" mode="json2xml">
      <xsl:element name="combine" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "as-is" 000 -->
   <xsl:template match="*[@key='as-is']" priority="2" mode="json2xml">
      <xsl:element name="as-is" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "method" 000 -->
   <xsl:template match="*[@key='method']" mode="json2xml"/>
   <xsl:template match="*[@key='combine']/*[@key='method']" mode="as-attribute">
      <xsl:attribute name="method">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "custom" 000 -->
   <xsl:template match="*[@key='custom'] | *[@key='customs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="custom" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "group" 000 -->
   <xsl:template match="*[@key='group'] | *[@key='groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="group" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "modify" 000 -->
   <xsl:template match="*[@key='modify'] | *[@key='modifys']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="modify" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('set', 'settings')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('alter', 'alterations')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "include" 000 -->
   <xsl:template match="*[@key='include'] | *[@key='includes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="include" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "all" 000 -->
   <xsl:template match="*[@key='all']" priority="2" mode="json2xml">
      <xsl:element name="all" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "call" 000 -->
   <xsl:template match="*[@key='call'] | *[@key='id-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="call" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "match" 000 -->
   <xsl:template match="*[@key='match'] | *[@key='pattern-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="match" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "exclude" 000 -->
   <xsl:template match="*[@key='exclude'] | *[@key='excludes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="exclude" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "set" 000 -->
   <xsl:template match="*[@key='set'] | *[@key='settings']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="set" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="param-id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('label')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc', 'descriptions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('constraint', 'constraints')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('select')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='set']/string[@key='param-id'] | *[@key='settings']/*/string[@key='{@address}']"/>
   <!-- 000 Handling assembly "alter" 000 -->
   <xsl:template match="*[@key='alter'] | *[@key='alterations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="alter" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remove', 'removals')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('add', 'additions')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "remove" 000 -->
   <xsl:template match="*[@key='remove'] | *[@key='removals']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="remove" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "add" 000 -->
   <xsl:template match="*[@key='add'] | *[@key='additions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="add" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'parameters')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "control-id" 000 -->
   <xsl:template match="*[@key='control-id']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='control-id'] | *[@key='id-selectors']/*/*[@key='control-id'] | *[@key='alter']/*[@key='control-id'] | *[@key='alterations']/*/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "with-control" 000 -->
   <xsl:template match="*[@key='with-control']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='with-control'] | *[@key='id-selectors']/*/*[@key='with-control'] | *[@key='match']/*[@key='with-control'] | *[@key='pattern-selectors']/*/*[@key='with-control']"
                 mode="as-attribute">
      <xsl:attribute name="with-control">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "with-subcontrols" 000 -->
   <xsl:template match="*[@key='with-subcontrols']" mode="json2xml"/>
   <xsl:template match="*[@key='all']/*[@key='with-subcontrols'] | *[@key='call']/*[@key='with-subcontrols'] | *[@key='id-selectors']/*/*[@key='with-subcontrols'] | *[@key='match']/*[@key='with-subcontrols'] | *[@key='pattern-selectors']/*/*[@key='with-subcontrols']"
                 mode="as-attribute">
      <xsl:attribute name="with-subcontrols">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "subcontrol-id" 000 -->
   <xsl:template match="*[@key='subcontrol-id']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='subcontrol-id'] | *[@key='id-selectors']/*/*[@key='subcontrol-id'] | *[@key='alter']/*[@key='subcontrol-id'] | *[@key='alterations']/*/*[@key='subcontrol-id']"
                 mode="as-attribute">
      <xsl:attribute name="subcontrol-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "param-id" 000 -->
   <xsl:template match="*[@key='param-id']" mode="json2xml"/>
   <xsl:template match="*[@key='set']/*[@key='param-id'] | *[@key='settings']/*/*[@key='param-id']"
                 mode="as-attribute">
      <xsl:attribute name="param-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "pattern" 000 -->
   <xsl:template match="*[@key='pattern']" mode="json2xml"/>
   <xsl:template match="*[@key='match']/*[@key='pattern'] | *[@key='pattern-selectors']/*/*[@key='pattern']"
                 mode="as-attribute">
      <xsl:attribute name="pattern">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "order" 000 -->
   <xsl:template match="*[@key='order']" mode="json2xml"/>
   <xsl:template match="*[@key='match']/*[@key='order'] | *[@key='pattern-selectors']/*/*[@key='order']"
                 mode="as-attribute">
      <xsl:attribute name="order">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "position" 000 -->
   <xsl:template match="*[@key='position']" mode="json2xml"/>
   <xsl:template match="*[@key='add']/*[@key='position'] | *[@key='additions']/*/*[@key='position']"
                 mode="as-attribute">
      <xsl:attribute name="position">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class-ref" 000 -->
   <xsl:template match="*[@key='class-ref']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='class-ref'] | *[@key='removals']/*/*[@key='class-ref']"
                 mode="as-attribute">
      <xsl:attribute name="class-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "id-ref" 000 -->
   <xsl:template match="*[@key='id-ref']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='id-ref'] | *[@key='removals']/*/*[@key='id-ref']"
                 mode="as-attribute">
      <xsl:attribute name="id-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "item-name" 000 -->
   <xsl:template match="*[@key='item-name']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='item-name'] | *[@key='removals']/*/*[@key='item-name']"
                 mode="as-attribute">
      <xsl:attribute name="item-name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- Markdown converter-->
   <xsl:output indent="yes"/>
   <xsl:template name="parse"><!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        --><!-- $str may be passed in, or we can process the current node -->
      <xsl:param name="str" select="string(.)"/>
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
      <!--<xsl:copy-of select="$flat-structures"/>-->
      <xsl:variable name="nested-structures">
         <xsl:apply-templates select="$flat-structures" mode="build-structures"/>
      </xsl:variable>
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
      <xsl:sequence select="(every $l in $lines satisfies matches($l,'^\|'))             and (some $l in $lines satisfies m:is-table-row-demarcator($l))"/>
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
      <!-- first, splitting ul from ol groups -->
      <xsl:for-each-group select="$group"
                          group-starting-with="*[@level = $level and not(@type = preceding-sibling::*/@type)]">
         <xsl:element name="m:{ $group[1]/@type }"
                      namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
            <xsl:for-each-group select="current-group()" group-starting-with="li[@level = $level]">
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
      </xsl:for-each-group>
   </xsl:template>
   <xsl:template match="m:pre//text()" mode="infer-inlines">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:template match="text()" mode="infer-inlines">
      <xsl:variable name="markup" expand-text="true">
         <xsl:apply-templates select="$tag-replacements/m:rules">
            <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
         </xsl:apply-templates>
      </xsl:variable>
      <xsl:try select="parse-xml-fragment($markup)">
         <xsl:catch expand-text="yes" select="."/>
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
         <img alt="!\[{{$text}}\]" src="\({{$text}}\)"/>
         <a href="\[{{$text}}\]">\(<text/>\)</a>
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
      <xsl:apply-templates mode="#current" select="@href, @alt, @src"/>
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
   <xsl:template match="m:text" mode="write-replace">
      <xsl:text>$1</xsl:text>
   </xsl:template>
   <xsl:template match="m:a/@href" mode="write-replace">
      <xsl:text> href="$2"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@alt" mode="write-replace">
      <xsl:text> alt="$1"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@src" mode="write-replace">
      <xsl:text> src="$2"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:text" mode="write-match">
      <xsl:text>(.*?)</xsl:text>
   </xsl:template>
</xsl:stylesheet>
