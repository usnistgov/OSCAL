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
      <xsl:apply-templates mode="#current" select="*[@key=('catalog')]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-id" 000 -->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "person-name" 000 -->
   <xsl:template match="*[@key='person-name']" priority="2" mode="json2xml">
      <xsl:element name="person-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-name" 000 -->
   <xsl:template match="*[@key='org-name']" priority="2" mode="json2xml">
      <xsl:element name="org-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "short-name" 000 -->
   <xsl:template match="*[@key='short-name']" priority="2" mode="json2xml">
      <xsl:element name="short-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "city" 000 -->
   <xsl:template match="*[@key='city']" priority="2" mode="json2xml">
      <xsl:element name="city" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "state" 000 -->
   <xsl:template match="*[@key='state']" priority="2" mode="json2xml">
      <xsl:element name="state" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "postal-code" 000 -->
   <xsl:template match="*[@key='postal-code']" priority="2" mode="json2xml">
      <xsl:element name="postal-code" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "country" 000 -->
   <xsl:template match="*[@key='country']" priority="2" mode="json2xml">
      <xsl:element name="country" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "email" 000 -->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="email" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "phone" 000 -->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="phone" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "url" 000 -->
   <xsl:template match="*[@key='url'] | *[@key='URLs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="url" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "doc-id" 000 -->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
   <xsl:template match="*[@key='hlink']/*[@key='href'] | *[@key='hashed-links']/*/*[@key='href'] | *[@key='citation']/*[@key='href'] | *[@key='citations']/*/*[@key='href'] | *[@key='link']/*[@key='href'] | *[@key='links']/*/*[@key='href']"
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "date" 000 -->
   <xsl:template match="*[@key='date']" priority="2" mode="json2xml">
      <xsl:element name="date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "base64" 000 -->
   <xsl:template match="*[@key='base64']" priority="2" mode="json2xml">
      <xsl:element name="base64" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "link" 000 -->
   <xsl:template match="*[@key='link'] | *[@key='links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="link" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "catalog" 000 -->
   <xsl:template match="*[@key='catalog'] | *[@key='control-catalog']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="catalog" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('section', 'sections')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('control', 'controls')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('back')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "back" 000 -->
   <xsl:template match="*[@key='back']" priority="2" mode="json2xml">
      <xsl:element name="back" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "section" 000 -->
   <xsl:template match="*[@key='section'] | *[@key='sections']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="section" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=('section', 'sections')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "group" 000 -->
   <xsl:template match="*[@key='group'] | *[@key='groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="group" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'parameters')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('control', 'controls')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "control" 000 -->
   <xsl:template match="*[@key='control'] | *[@key='controls']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="control" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'parameters')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('subcontrol', 'subcontrols')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "subcontrol" 000 -->
   <xsl:template match="*[@key='subcontrol'] | *[@key='subcontrols']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="subcontrol" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'parameters')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref-list', 'reference-lists')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='subcontrol']/string[@key='id'] | *[@key='subcontrols']/*/string[@key='{@address}']"/>
   <!-- 000 Handling field "title" 000 -->
   <xsl:template match="*[@key='title']" priority="2" mode="json2xml">
      <xsl:element name="title" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <xsl:template match="*[@key='desc'] | *[@key='descriptions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "constraint" 000 -->
   <xsl:template match="*[@key='constraint'] | *[@key='constraints']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="constraint" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=RICHTEXT]"/>
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
   <xsl:template match="*[@key='party']/*[@key='id'] | *[@key='parties']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*/*[@key='id'] | *[@key='ref-list']/*[@key='id'] | *[@key='reference-lists']/*/*[@key='id'] | *[@key='ref']/*[@key='id'] | *[@key='references']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*/*[@key='id'] | *[@key='catalog']/*[@key='id'] | *[@key='control-catalog']/*/*[@key='id'] | *[@key='back']/*[@key='id'] | *[@key='section']/*[@key='id'] | *[@key='sections']/*/*[@key='id'] | *[@key='group']/*[@key='id'] | *[@key='groups']/*/*[@key='id'] | *[@key='control']/*[@key='id'] | *[@key='controls']/*/*[@key='id'] | *[@key='subcontrol']/*[@key='id'] | *[@key='subcontrols']/*/*[@key='id'] | *[@key='prop']/*[@key='id'] | *[@key='properties']/*/*[@key='id'] | *[@key='param']/*[@key='id'] | *[@key='parameters']/*/*[@key='id'] | *[@key='desc']/*[@key='id'] | *[@key='descriptions']/*/*[@key='id'] | *[@key='part']/*[@key='id'] | *[@key='parts']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='section']/*[@key='class'] | *[@key='sections']/*/*[@key='class'] | *[@key='group']/*[@key='class'] | *[@key='groups']/*/*[@key='class'] | *[@key='control']/*[@key='class'] | *[@key='controls']/*/*[@key='class'] | *[@key='subcontrol']/*[@key='class'] | *[@key='subcontrols']/*/*[@key='class'] | *[@key='prop']/*[@key='class'] | *[@key='properties']/*/*[@key='class'] | *[@key='param']/*[@key='class'] | *[@key='parameters']/*/*[@key='class'] | *[@key='part']/*[@key='class'] | *[@key='parts']/*/*[@key='class']"
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
   <xsl:template match="*[@key='param']/*[@key='depends-on'] | *[@key='parameters']/*/*[@key='depends-on']"
                 mode="as-attribute">
      <xsl:attribute name="depends-on">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "model-version" 000 -->
   <xsl:template match="*[@key='model-version']" mode="json2xml"/>
   <xsl:template match="*[@key='catalog']/*[@key='model-version'] | *[@key='control-catalog']/*/*[@key='model-version']"
                 mode="as-attribute">
      <xsl:attribute name="model-version">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
</xsl:stylesheet>
