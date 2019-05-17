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
   <!-- 000 Handling assembly "metadata" 000 -->
   <xsl:template match="*[@key='metadata'] | /map[empty(@key)]"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="metadata" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('publication-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-identifiers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party', 'parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('extra-meta')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "title" 000 -->
   <xsl:template match="*[@key='title']" priority="2" mode="json2xml">
      <xsl:element name="title" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "author" 000 -->
   <xsl:template match="*[@key='author'] | *[@key='authors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="author" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "publication-date" 000 -->
   <xsl:template match="*[@key='publication-date']" priority="2" mode="json2xml">
      <xsl:element name="publication-date" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "version" 000 -->
   <xsl:template match="*[@key='version']" priority="2" mode="json2xml">
      <xsl:element name="version" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "iso-date" 000 -->
   <xsl:template match="*[@key='iso-date']" mode="json2xml"/>
   <xsl:template match="*[@key='version']/*[@key='iso-date']" mode="as-attribute">
      <xsl:attribute name="iso-date">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "doc-id" 000 -->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-identifiers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "type" 000 -->
   <xsl:template match="*[@key='type']" mode="json2xml"/>
   <xsl:template match="*[@key='doc-id']/*[@key='type'] | *[@key='document-identifiers']/*/*[@key='type'] | *[@key='person-id']/*[@key='type'] | *[@key='person-identifiers']/*/*[@key='type'] | *[@key='org-id']/*[@key='type'] | *[@key='organization-identifiers']/*/*[@key='type'] | *[@key='resource']/*[@key='type'] | *[@key='resources']/*/*[@key='type'] | *[@key='meta-group']/*[@key='type'] | *[@key='metadata-groups']/*/*[@key='type'] | *[@key='meta']/*[@key='type'] | *[@key='metadata-fields']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='prop']/*[@key='class'] | *[@key='properties']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
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
         <xsl:apply-templates mode="#current" select="*[@key=('person-id', 'person-identifiers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-identifiers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address')]"/>
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
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-identifiers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "person-id" 000 -->
   <xsl:template match="*[@key='person-id'] | *[@key='person-identifiers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="person-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-id" 000 -->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-identifiers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "link" 000 -->
   <xsl:template match="*[@key='link'] | *[@key='links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="link" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hash', 'hashes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "rel" 000 -->
   <xsl:template match="*[@key='rel']" mode="json2xml"/>
   <xsl:template match="*[@key='link']/*[@key='rel'] | *[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "media-type" 000 -->
   <xsl:template match="*[@key='media-type']" mode="json2xml"/>
   <xsl:template match="*[@key='link']/*[@key='media-type'] | *[@key='links']/*/*[@key='media-type'] | *[@key='resource']/*[@key='media-type'] | *[@key='resources']/*/*[@key='media-type']"
                 mode="as-attribute">
      <xsl:attribute name="media-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "person-name" 000 -->
   <xsl:template match="*[@key='person-name']" priority="2" mode="json2xml">
      <xsl:element name="person-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-name" 000 -->
   <xsl:template match="*[@key='org-name']" priority="2" mode="json2xml">
      <xsl:element name="org-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "full-name" 000 -->
   <xsl:template match="*[@key='full-name']" priority="2" mode="json2xml">
      <xsl:element name="full-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "short-name" 000 -->
   <xsl:template match="*[@key='short-name']" priority="2" mode="json2xml">
      <xsl:element name="short-name" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "address" 000 -->
   <xsl:template match="*[@key='address']" priority="2" mode="json2xml">
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
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "city" 000 -->
   <xsl:template match="*[@key='city']" priority="2" mode="json2xml">
      <xsl:element name="city" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "state" 000 -->
   <xsl:template match="*[@key='state']" priority="2" mode="json2xml">
      <xsl:element name="state" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "postal-code" 000 -->
   <xsl:template match="*[@key='postal-code']" priority="2" mode="json2xml">
      <xsl:element name="postal-code" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "country" 000 -->
   <xsl:template match="*[@key='country']" priority="2" mode="json2xml">
      <xsl:element name="country" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "email" 000 -->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="email" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "phone" 000 -->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="phone" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "url" 000 -->
   <xsl:template match="*[@key='url'] | *[@key='URLs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="url" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "notes" 000 -->
   <xsl:template match="*[@key='notes']" priority="2" mode="json2xml">
      <xsl:element name="notes" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <xsl:template match="*[@key='desc']" priority="2" mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "resource" 000 -->
   <xsl:template match="*[@key='resource'] | *[@key='resources']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="resource" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('publication-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-identifiers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "hash" 000 -->
   <xsl:template match="*[@key='hash'] | *[@key='hashes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hash" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
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
   <!-- 000 Handling assembly "role" 000 -->
   <xsl:template match="*[@key='role'] | *[@key='roles']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="role" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "href" 000 -->
   <xsl:template match="*[@key='href']" mode="json2xml"/>
   <xsl:template match="*[@key='link']/*[@key='href'] | *[@key='links']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
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
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
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
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='party']/*[@key='id'] | *[@key='parties']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
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
</xsl:stylesheet>
