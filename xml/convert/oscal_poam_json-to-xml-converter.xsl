<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                xmlns:j="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                exclude-result-prefixes="#all">
<!-- JSON to XML conversion: pipeline -->
<!-- Processing architecture -->
   <xsl:param name="file" as="xs:string"/>
   <xsl:param name="produce" as="xs:string">xml</xsl:param>
   <xsl:template name="from-json">
      <xsl:if test="not(unparsed-text-available($file))" expand-text="true">
         <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">No file found at { $file }</nm:ERROR>
      </xsl:if>
      <xsl:call-template name="from-xdm-json-xml">
         <xsl:with-param name="source">
            <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                     select="unparsed-text($file) ! json-to-xml(.)">
               <xsl:catch>
                  <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{{ $err:description }}</nm:ERROR>
               </xsl:catch>
            </xsl:try>
         </xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   <xsl:template match="/" name="from-xdm-json-xml" expand-text="true">
      <xsl:param name="source">
         <xsl:choose><!-- evaluating { $file } as URI relative to nominal source directory-->
            <xsl:when test="exists($file)">
               <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                        select="$file ! document(.,/)">
                  <xsl:catch>
                     <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{ $err:description }</nm:ERROR>
                  </xsl:catch>
               </xsl:try>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:param>
      <xsl:if test="$source/j:map" expand-text="true">
         <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">No XPath (XML) JSON found at { $file } - syntax of http://www.w3.org/2005/xpath-functions</nm:ERROR>
      </xsl:if>
      <xsl:variable name="supermodel">
         <xsl:apply-templates select="$source"/>
      </xsl:variable>
      <xsl:choose>
         <xsl:when test="$produce = 'supermodel'">
            <xsl:sequence select="$supermodel"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="$supermodel" mode="write-xml"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- JSON to XML conversion: object filters -->
   <xsl:strip-space elements="j:map j:array"/>
   <!-- METASCHEMA conversion stylesheet supports JSON -> METASCHEMA/SUPERMODEL conversion -->
   <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->
   <!-- METASCHEMA: OSCAL Plan of Action and Milestones (POA&M) Model (version 1.0.0-milestone3) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones" -->
      <assembly name="plan-of-action-and-milestones"
                gi="plan-of-action-and-milestones"
                formal-name="Plan of Action and Milestones (POA&amp;M)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">plan-of-action-and-milestones</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='import-ssp']"/>
         <xsl:apply-templates select="*[@key='system-id']"/>
         <xsl:apply-templates select="*[@key='local-definitions']"/>
         <xsl:apply-templates select="*[@key='observations']"/>
         <xsl:apply-templates select="*[@key='risks']"/>
         <xsl:apply-templates select="*[@key='poam-items']"/>
         <xsl:apply-templates select="*[@key='back-matter']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:array[@key='observations']/j:map/j:string[@key='uuid'] | j:array[@key='risks']/j:map/j:string[@key='uuid'] | j:array[@key='poam-items']/j:map/j:string[@key='uuid']"><!-- Cf XML match="plan-of-action-and-milestones/@uuid | prop/@uuid | annotation/@uuid | location/@uuid | party/@uuid | component/@uuid | protocol/@uuid | inventory-item/@uuid | observation/@uuid | risk/@uuid | poam-item/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="POA&amp;M Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:array[@key='observations']/j:map/j:string[@key='uuid'] | j:array[@key='risks']/j:map/j:string[@key='uuid'] | j:array[@key='poam-items']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='metadata']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="metadata" -->
      <assembly name="metadata" gi="metadata" formal-name="Publication metadata">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">metadata</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='published']"/>
         <xsl:apply-templates select="*[@key='last-modified']"/>
         <xsl:apply-templates select="*[@key='version']"/>
         <xsl:apply-templates select="*[@key='oscal-version']"/>
         <xsl:apply-templates select="*[@key='revisions']"/>
         <xsl:apply-templates select="*[@key='document-ids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='roles']"/>
         <xsl:apply-templates select="*[@key='locations']"/>
         <xsl:apply-templates select="*[@key='parties']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="prop" -->
      <field name="property" gi="prop" formal-name="Property">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prop</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='ns']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']"
                 mode="get-value-property">
      <value as-type="string" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='protocols']/j:map/j:string[@key='name']"><!-- Cf XML match="prop/@name | annotation/@name | protocol/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='protocols']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns']"><!-- Cf XML match="prop/@ns | annotation/@ns" -->
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class']"><!-- Cf XML match="prop/@class" -->
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='annotations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="annotation" -->
      <assembly name="annotation" gi="annotation" formal-name="Annotated Property">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">annotation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='ns']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='annotations']/j:map/j:string[@key='value']"><!-- Cf XML match="annotation/@value" -->
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value"
            formal-name="Annotated Property Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='annotations']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:string[@key='remarks']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="remarks" -->
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="Remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:string[@key='remarks']" mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="link" -->
      <assembly name="link" gi="link" formal-name="Link">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">link</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='rel']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ssp']/j:string[@key='href'] | j:array[@key='threat-ids']/j:map[@key='threat-id']/j:string[@key='href']"><!-- Cf XML match="link/@href | import-ssp/@href | threat-id/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ssp']/j:string[@key='href'] | j:array[@key='threat-ids']/j:map[@key='threat-id']/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']"><!-- Cf XML match="link/@rel" -->
      <flag in-json="string"
            as-type="NCName"
            name="rel"
            key="rel"
            gi="rel"
            formal-name="Relation">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- Cf XML match="link/@media-type | plan-of-action-and-milestones/back-matter/resource/rlink/@media-type | plan-of-action-and-milestones/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="role" -->
      <assembly name="role" gi="role" formal-name="Role">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">role</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='short-name']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"><!-- Cf XML match="role/@id" -->
      <flag in-json="string"
            as-type="NCName"
            name="id"
            key="id"
            gi="id"
            formal-name="Role Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="location" -->
      <assembly name="location" gi="location" formal-name="Location">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">location</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='address']"/>
         <xsl:apply-templates select="*[@key='email-addresses']"/>
         <xsl:apply-templates select="*[@key='telephone-numbers']"/>
         <xsl:apply-templates select="*[@key='urls']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="party" -->
      <assembly name="party"
                gi="party"
                formal-name="Party (organization or person)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">party</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='short-name']"/>
         <xsl:apply-templates select="*[@key='external-ids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='email-addresses']"/>
         <xsl:apply-templates select="*[@key='telephone-numbers']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='member-of-organizations']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"><!-- Cf XML match="party/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Party Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:string[@key='location-uuid']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="location-uuid" -->
      <field name="location-uuid"
             gi="location-uuid"
             as-type="uuid"
             formal-name="Location Reference"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">location-uuid</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:string[@key='location-uuid']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="responsible-party" -->
      <assembly name="responsible-party"
                gi="responsible-party"
                formal-name="Responsible Party"
                json-key-flag="role-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">responsible-party</xsl:attribute>
         </xsl:if>
         <flag as-type="NCName"
               name="role-id"
               key="role-id"
               gi="role-id"
               formal-name="Responsible Role">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key | j:map[@key='responsible-roles']/j:map/@key"><!-- Cf XML match="responsible-party/@role-id | responsible-role/@role-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Responsible Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key | j:map[@key='responsible-roles']/j:map/@key"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="party-uuid" -->
      <field name="party-uuid"
             gi="party-uuid"
             as-type="uuid"
             formal-name="Party Reference"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">party-uuid</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="(j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string[@key='party-uuid'])"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='import-ssp']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="import-ssp" -->
      <assembly name="import-ssp"
                gi="import-ssp"
                formal-name="Import System Security Plan">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ssp</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-id']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="system-id" -->
      <field name="system-id"
             gi="system-id"
             as-type="string"
             formal-name="System Identification">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='identifier-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-id']" mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-id']/j:string[@key='identifier-type']"><!-- Cf XML match="system-id/@identifier-type" -->
      <flag in-json="string"
            as-type="uri"
            name="identifier-type"
            key="identifier-type"
            gi="identifier-type"
            formal-name="Identification System Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-id']/j:string[@key='identifier-type']"
                 mode="keep-value-property"
                 priority="4"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='local-definitions']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="local-definitions" -->
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="component" -->
      <assembly name="system-component"
                gi="component"
                formal-name="Component"
                json-key-flag="uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">component</xsl:attribute>
         </xsl:if>
         <flag as-type="uuid"
               name="uuid"
               key="uuid"
               gi="uuid"
               formal-name="Component Identifier">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='purpose']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='protocols']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='components']/j:map/j:string[@key='type']"><!-- Cf XML match="component/@type" -->
      <flag in-json="string"
            as-type="string"
            name="component-type"
            key="type"
            gi="type"
            formal-name="Component Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='components']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='responsible-roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="responsible-role" -->
      <assembly name="responsible-role"
                gi="responsible-role"
                formal-name="Responsible Role"
                json-key-flag="role-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">responsible-role</xsl:attribute>
         </xsl:if>
         <flag as-type="NCName"
               name="role-id"
               key="role-id"
               gi="role-id"
               formal-name="Responsible Role ID">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="protocol" -->
      <assembly name="protocol"
                gi="protocol"
                formal-name="Service Protocol Information">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">protocol</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='port-ranges']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="port-range" -->
      <field as-type="empty"
             name="port-range"
             gi="port-range"
             formal-name="Port Range">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">port-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='transport']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:number[@key='start']"><!-- Cf XML match="port-range/@start" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="start"
            key="start"
            gi="start"
            formal-name="Start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:number[@key='start']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:number[@key='end']"><!-- Cf XML match="port-range/@end" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="end"
            key="end"
            gi="end"
            formal-name="End">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:number[@key='end']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:string[@key='transport']"><!-- Cf XML match="port-range/@transport" -->
      <flag in-json="string"
            as-type="NCName"
            name="transport"
            key="transport"
            gi="transport"
            formal-name="Transport">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map[@key='port-range']/j:string[@key='transport']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="inventory-item" -->
      <assembly name="inventory-item"
                gi="inventory-item"
                formal-name="Inventory Item">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">inventory-item</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='implemented-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='implemented-components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="implemented-component" -->
      <assembly name="component-implemention-reference"
                gi="implemented-component"
                formal-name="Implemented Component"
                json-key-flag="component-uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implemented-component</xsl:attribute>
         </xsl:if>
         <flag as-type="uuid"
               name="component-uuid"
               key="component-uuid"
               gi="component-uuid"
               formal-name="Component Universally Unique Identifier Reference">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='implemented-components']/j:map/@key"><!-- Cf XML match="implemented-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid"
            formal-name="Component Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='implemented-components']/j:map/@key"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="observation" -->
      <assembly name="observation" gi="observation" formal-name="Objective">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">observation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='methods']"/>
         <xsl:apply-templates select="*[@key='types']"/>
         <xsl:apply-templates select="*[@key='assessors']"/>
         <xsl:apply-templates select="*[@key='subject-references']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='relevant-evidence']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="risk" -->
      <assembly name="risk" gi="risk" formal-name="Identified Risk">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">risk</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='risk-metrics']"/>
         <xsl:apply-templates select="*[@key='statement']"/>
         <xsl:apply-templates select="*[@key='mitigating-factors']"/>
         <xsl:apply-templates select="*[@key='remediation-deadline']"/>
         <xsl:apply-templates select="*[@key='remediations']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='closure-actions']"/>
         <xsl:apply-templates select="*[@key='remediation-tracking']"/>
         <xsl:apply-templates select="*[@key='related-observations']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="task" -->
      <assembly name="task" gi="task" formal-name="Task">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">task</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='activity-instances']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='poam-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="poam-item" -->
      <assembly name="poam-item" gi="poam-item" formal-name="POA&amp;M Item">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">poam-item</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='collected']"/>
         <xsl:apply-templates select="*[@key='expires']"/>
         <xsl:apply-templates select="*[@key='related-observations']"/>
         <xsl:apply-templates select="*[@key='threat-ids']"/>
         <xsl:apply-templates select="*[@key='related-risks']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map[@key='threat-id']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="threat-id" -->
      <field name="threat-id"
             gi="threat-id"
             as-type="uri"
             formal-name="Threat ID">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">threat-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map[@key='threat-id']"
                 mode="get-value-property">
      <value as-type="uri" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map[@key='threat-id']/j:string[@key='system']"><!-- Cf XML match="threat-id/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="Threat Type Identification System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map[@key='threat-id']/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='back-matter']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="back-matter" -->
      <assembly name="back-matter" gi="back-matter" formal-name="Back matter">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">back-matter</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='resources']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map[@key='hash']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="hash" -->
      <field name="hash" gi="hash" formal-name="Hash">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">hash</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='algorithm']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map[@key='hash']"
                 mode="get-value-property">
      <value as-type="string" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map[@key='hash']/j:string[@key='algorithm']"><!-- Cf XML match="hash/@algorithm" -->
      <flag in-json="string"
            as-type="string"
            name="algorithm"
            key="algorithm"
            gi="algorithm"
            formal-name="Hash algorithm">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map[@key='hash']/j:string[@key='algorithm']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Document Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/published" -->
      <field name="published"
             gi="published"
             as-type="dateTime-with-timezone"
             formal-name="Publication Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/last-modified" -->
      <field name="last-modified"
             gi="last-modified"
             as-type="dateTime-with-timezone"
             formal-name="Last Modified Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/version" -->
      <field name="version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/oscal-version" -->
      <field name="oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision" -->
      <assembly name="revision" gi="revision" formal-name="Revision History Entry">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revision</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='published']"/>
         <xsl:apply-templates select="*[@key='last-modified']"/>
         <xsl:apply-templates select="*[@key='version']"/>
         <xsl:apply-templates select="*[@key='oscal-version']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions" -->
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='revision']"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Document Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/published" -->
      <field name="published"
             gi="published"
             as-type="dateTime-with-timezone"
             formal-name="Publication Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/last-modified" -->
      <field name="last-modified"
             gi="last-modified"
             as-type="dateTime-with-timezone"
             formal-name="Last Modified Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/version" -->
      <field name="version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/oscal-version" -->
      <field name="oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/revisions/revision/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/document-id" -->
      <field name="document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">document-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="6"><!-- Cf XML match="plan-of-action-and-milestones/metadata/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/role/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Role Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/role/short-name" -->
      <field name="short-name"
             gi="short-name"
             formal-name="Role Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/role/description" -->
      <field name="description"
             gi="description"
             formal-name="Role Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/role/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Location Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address" -->
      <assembly name="address" gi="address" formal-name="Address">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">address</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/addr-line" -->
      <field name="addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">addr-line</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/postal-code" -->
      <field name="postal-code"
             gi="postal-code"
             formal-name="Postal Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/address/country" -->
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/email-address" -->
      <field name="email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">email-address</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/telephone-number" -->
      <field name="telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">telephone-number</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/metadata/location/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/url" -->
      <field name="url"
             gi="url"
             as-type="uri"
             formal-name="Location URL"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">url</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/location/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/name" -->
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/short-name" -->
      <field name="short-name"
             gi="short-name"
             formal-name="Party Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/external-id" -->
      <field name="external-id"
             gi="external-id"
             formal-name="Party External Identifier">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">external-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="External Identifier Schema">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/email-address" -->
      <field name="email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">email-address</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/telephone-number" -->
      <field name="telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">telephone-number</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address" -->
      <assembly name="address" gi="address" formal-name="Address">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">address</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/addr-line" -->
      <field name="addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">addr-line</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/postal-code" -->
      <field name="postal-code"
             gi="postal-code"
             formal-name="Postal Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/address/country" -->
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/party/member-of-organization" -->
      <field name="member-of-organization"
             gi="member-of-organization"
             as-type="uuid"
             formal-name="Organizational Affiliation"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">member-of-organization</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/metadata/responsible-party/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Component Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Component Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/purpose" -->
      <field name="purpose"
             gi="purpose"
             as-type="markup-line"
             formal-name="Purpose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">purpose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/status/@state" -->
      <flag in-json="string"
            as-type="string"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/responsible-role/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/component/protocol/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="title field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/inventory-item/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Inventory Item Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/inventory-item/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/inventory-item/responsible-party/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/responsible-party/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Observation Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Observaton Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string[@key='method']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/method" -->
      <field name="method"
             gi="method"
             formal-name="Observation Method"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">method</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string[@key='method']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='types']/j:string[@key='type']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/type" -->
      <field name="type"
             gi="type"
             formal-name="Observation Type"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">type</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='types']/j:string[@key='type']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='assessors']/j:map[@key='assessor']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/assessor" -->
      <field as-type="empty"
             name="assessor"
             gi="assessor"
             formal-name="Assessor">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessor</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='party-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='assessors']/j:map[@key='assessor']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='assessors']/j:map[@key='assessor']/j:string[@key='party-uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/assessor/@party-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="party-uuid"
            key="party-uuid"
            gi="party-uuid"
            formal-name="Party UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='assessors']/j:map[@key='assessor']/j:string[@key='party-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/subject-reference" -->
      <assembly name="subject-reference"
                gi="subject-reference"
                formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject-reference</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/subject-reference/@uuid-ref" -->
      <flag in-json="string"
            as-type="string"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/subject-reference/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/subject-reference/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/subject-reference/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/origin" -->
      <field as-type="empty" name="origin" gi="origin" formal-name="Origin">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">origin</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='uuid-ref']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/origin/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/origin/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/relevant-evidence" -->
      <assembly name="relevant-evidence"
                gi="relevant-evidence"
                formal-name="Relevant Evidence">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">relevant-evidence</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/observation/relevant-evidence/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Relevant Evidence Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/relevant-evidence/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Relevant Evidence Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/observation/relevant-evidence/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Risk Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Risk Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric" -->
      <assembly name="risk-metric" gi="risk-metric" formal-name="Risk Metric">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">risk-metric</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='name']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name"
            formal-name="name flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='class']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric/@class" -->
      <flag in-json="string"
            as-type="string"
            name="class"
            key="class"
            gi="class"
            formal-name="class flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='system']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='value']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric/@value" -->
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value"
            formal-name="Risk Metric Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/risk-metric/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='risk-metrics']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/statement" -->
      <field name="statement"
             gi="statement"
             as-type="markup-multiline"
             formal-name="Risk Statement"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor" -->
      <assembly name="mitigating-factor"
                gi="mitigating-factor"
                formal-name="Mitigating Factor">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">mitigating-factor</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='implementation-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='subject-references']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Mitigating Factor Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/@implementation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="implementation-uuid"
            key="implementation-uuid"
            gi="implementation-uuid"
            formal-name="Implementation UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Mitigating Factor Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject-reference" -->
      <assembly name="subject-reference"
                gi="subject-reference"
                formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject-reference</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject-reference/@uuid-ref" -->
      <flag in-json="string"
            as-type="string"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject-reference/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject-reference/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject-reference/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='remediation-deadline']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-deadline" -->
      <field name="remediation-deadline"
             gi="remediation-deadline"
             as-type="dateTime-with-timezone"
             formal-name="Remediation Deadline"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remediation-deadline</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='remediation-deadline']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation" -->
      <assembly name="remediation" gi="remediation" formal-name="Remediation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remediation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='required-assets']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Remediation Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Remediation Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Remediaiton Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/origin" -->
      <field as-type="empty"
             name="origin"
             gi="origin"
             formal-name="Remediation Origin">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">origin</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='uuid-ref']"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/origin/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='type']"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/origin/@type" -->
      <flag in-json="string"
            as-type="uuid"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map[@key='origin']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset" -->
      <assembly name="required-asset"
                gi="required-asset"
                formal-name="Required Asset">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">required-asset</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='subject-references']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 priority="9"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Required Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/subject-reference" -->
      <assembly name="subject-reference"
                gi="subject-reference"
                formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject-reference</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 priority="11"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/subject-reference/@uuid-ref" -->
      <flag in-json="string"
            as-type="string"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 priority="11"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/subject-reference/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/subject-reference/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/subject-reference/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subject-references']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Title for Required Asset"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Description of Required Asset"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/required-asset/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Task Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Task Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='start']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/start" -->
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Task Start Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='end']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/end" -->
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="Task End Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/activity-instance" -->
      <assembly name="associated-action"
                gi="activity-instance"
                formal-name="Associated Action">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">activity-instance</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='activity-instance-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:string[@key='activity-instance-uuid']"
                 priority="11"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/activity-instance/@activity-instance-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-instance-uuid"
            key="activity-instance-uuid"
            gi="activity-instance-uuid"
            formal-name="Activity Instance Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:string[@key='activity-instance-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/activity-instance/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation/task/responsible-party/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='status']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/status" -->
      <field name="status" gi="status" formal-name="Status" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='status']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='closure-actions']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/closure-actions" -->
      <field name="closure-actions"
             gi="closure-actions"
             as-type="markup-multiline"
             formal-name="Closer Actions"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">closure-actions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='closure-actions']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking" -->
      <assembly name="remediation-tracking"
                gi="remediation-tracking"
                formal-name="Remediation Tracking">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remediation-tracking</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='entries']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry" -->
      <assembly name="entry" gi="entry" formal-name="Tracking Entry">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">entry</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='date-time-stamp']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Tracking Entry Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='date-time-stamp']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry/date-time-stamp" -->
      <field name="date-time-stamp"
             gi="date-time-stamp"
             as-type="dateTime-with-timezone"
             formal-name="Date/Time Stamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">date-time-stamp</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='date-time-stamp']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Tracking Entry Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Tracking Entry Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/remediation-tracking/entry/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='remediation-tracking']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/risk/related-observation" -->
      <field as-type="empty"
             name="related-observation"
             gi="related-observation"
             formal-name="Related Observation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">related-observation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']/j:string[@key='observation-uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/risk/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid"
            formal-name="Observation Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="POA&amp;M Item Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="POA&amp;M Item Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/link/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='collected']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/collected" -->
      <field name="collected"
             gi="collected"
             as-type="dateTime-with-timezone"
             formal-name="collected field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">collected</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='collected']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='expires']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/expires" -->
      <field name="expires"
             gi="expires"
             as-type="dateTime-with-timezone"
             formal-name="expires field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expires</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='expires']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/related-observation" -->
      <field as-type="empty"
             name="related-observation"
             gi="related-observation"
             formal-name="Related Observation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">related-observation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']/j:string[@key='observation-uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/poam-item/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid"
            formal-name="Observation Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map[@key='related-observation']/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map[@key='associated-risk']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/associated-risk" -->
      <field as-type="empty"
             name="associated-risk"
             gi="associated-risk"
             formal-name="Associated Risk">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">associated-risk</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='risk-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map[@key='associated-risk']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map[@key='associated-risk']/j:string[@key='risk-uuid']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/poam-item/associated-risk/@risk-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="risk-uuid"
            key="risk-uuid"
            gi="risk-uuid"
            formal-name="Risk Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map[@key='associated-risk']/j:string[@key='risk-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='party-uuids']/j:string[@key='party-uuid']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/poam-item/party-uuid" -->
      <field name="party-uuid"
             gi="party-uuid"
             as-type="uuid"
             formal-name="party-uuid field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">party-uuid</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='party-uuids']/j:string[@key='party-uuid']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource" -->
      <assembly name="resource" gi="resource" formal-name="Resource">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">resource</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='document-ids']"/>
         <xsl:apply-templates select="*[@key='citation']"/>
         <xsl:apply-templates select="*[@key='rlinks']"/>
         <xsl:apply-templates select="*[@key='base64']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Resource Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Resource Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/description" -->
      <field name="description"
             gi="description"
             formal-name="Resource Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/document-id" -->
      <field name="document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">document-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/citation" -->
      <assembly name="citation" gi="citation" formal-name="Citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='biblio']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/citation/text" -->
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Citation Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:map[@key='biblio']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/citation/biblio" -->
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">rlink</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/base64" -->
      <field name="base64"
             gi="base64"
             as-type="base64Binary"
             formal-name="Base64">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base64</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='filename']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 mode="get-value-property">
      <value as-type="base64Binary" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- Cf XML match="plan-of-action-and-milestones/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <!-- by default, fields traverse their properties to find a value -->
   <xsl:template match="*" mode="get-value-property">
      <xsl:apply-templates mode="keep-value-property"/>
   </xsl:template>
   <xsl:template match="*" mode="keep-value-property">
      <xsl:value-of select="."/>
   </xsl:template>
   <!-- JSON to XML conversion: Markdown to markup inferencing -->
   <!-- JSON to XML conversion: Supermodel serialization as XML -->
</xsl:stylesheet>
