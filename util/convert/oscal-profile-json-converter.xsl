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
      <xsl:apply-templates mode="#current" select="*[@key=('profile')]"/>
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
   <xsl:template match="*[@key='party']/*[@key='id'] | *[@key='parties']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*/*[@key='id'] | *[@key='ref-list']/*[@key='id'] | *[@key='reference-lists']/*/*[@key='id'] | *[@key='ref']/*[@key='id'] | *[@key='references']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*/*[@key='id'] | *[@key='prop']/*[@key='id'] | *[@key='properties']/*/*[@key='id'] | *[@key='param']/*[@key='id'] | *[@key='parameters']/*/*[@key='id'] | *[@key='desc']/*[@key='id'] | *[@key='descriptions']/*/*[@key='id'] | *[@key='part']/*[@key='id'] | *[@key='parts']/*/*[@key='id'] | *[@key='profile']/*[@key='id'] | *[@key='profiles']/*/*[@key='id'] | *[@key='set-param']/*[@key='id'] | *[@key='param-settings']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*/*[@key='class'] | *[@key='param']/*[@key='class'] | *[@key='parameters']/*/*[@key='class'] | *[@key='part']/*[@key='class'] | *[@key='parts']/*/*[@key='class'] | *[@key='set-param']/*[@key='class'] | *[@key='param-settings']/*/*[@key='class']"
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
   <xsl:template match="*[@key='param']/*[@key='depends-on'] | *[@key='parameters']/*/*[@key='depends-on'] | *[@key='set-param']/*[@key='depends-on'] | *[@key='param-settings']/*/*[@key='depends-on']"
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
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "as-is" 000 -->
   <xsl:template match="*[@key='as-is']" priority="2" mode="json2xml">
      <xsl:element name="as-is" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
         <xsl:apply-templates mode="#current" select="*[@key=('set-param', 'param-settings')]"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "call" 000 -->
   <xsl:template match="*[@key='call'] | *[@key='id-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="call" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "match" 000 -->
   <xsl:template match="*[@key='match'] | *[@key='pattern-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="match" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
   <!-- 000 Handling assembly "set-param" 000 -->
   <xsl:template match="*[@key='set-param'] | *[@key='param-settings']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="set-param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
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
                 match="*[@key='set-param']/string[@key='id'] | *[@key='param-settings']/*/string[@key='{@address}']"/>
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
         <xsl:apply-templates mode="json2xml" select="*[@key=STRVALUE]"/>
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
</xsl:stylesheet>
