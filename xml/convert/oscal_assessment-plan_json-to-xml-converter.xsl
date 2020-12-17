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
   <!-- METASCHEMA: OSCAL Assessment Plan Model (version 1.0.0-milestone3) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='assessment-plan']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan" -->
      <assembly name="assessment-plan"
                gi="assessment-plan"
                formal-name="Security Assessment Plan (SAP)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-plan</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='import-ssp']"/>
         <xsl:apply-templates select="*[@key='local-definitions']"/>
         <xsl:apply-templates select="*[@key='terms-and-conditions']"/>
         <xsl:apply-templates select="*[@key='reviewed-controls']"/>
         <xsl:apply-templates select="*[@key='assessment-subjects']"/>
         <xsl:apply-templates select="*[@key='assessment-assets']"/>
         <xsl:apply-templates select="*[@key='assessment-activities']"/>
         <xsl:apply-templates select="*[@key='assessment-actions']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
         <xsl:apply-templates select="*[@key='back-matter']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='uuid'] | j:map[@key='origination']/j:string[@key='uuid'] | j:array[@key='assessment-activities']/j:map/j:string[@key='uuid'] | j:array[@key='assessment-actions']/j:map/j:string[@key='uuid']"><!-- Cf XML match="assessment-plan/@uuid | prop/@uuid | annotation/@uuid | location/@uuid | party/@uuid | component/@uuid | protocol/@uuid | inventory-item/@uuid | user/@uuid | part/@uuid | origination/@uuid | assessment-activity/@uuid | assessment-action/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Assessment Plan Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='uuid'] | j:map[@key='origination']/j:string[@key='uuid'] | j:array[@key='assessment-activities']/j:map/j:string[@key='uuid'] | j:array[@key='assessment-actions']/j:map/j:string[@key='uuid']"
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
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='protocols']/j:map/j:string[@key='name'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='name']"><!-- Cf XML match="prop/@name | annotation/@name | protocol/@name | part/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='protocols']/j:map/j:string[@key='name'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='ns']"><!-- Cf XML match="prop/@ns | annotation/@ns | part/@ns" -->
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='class']"><!-- Cf XML match="prop/@class | part/@class" -->
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class'] | (j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)/j:string[@key='class']"
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ssp']/j:string[@key='href']"><!-- Cf XML match="link/@href | import-ssp/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ssp']/j:string[@key='href']"
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- Cf XML match="link/@media-type | assessment-plan/back-matter/resource/rlink/@media-type | assessment-plan/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
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
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='objectives']/j:map/j:string[@key='id']"><!-- Cf XML match="role/@id | objectives/@id" -->
      <flag in-json="string"
            as-type="NCName"
            name="id"
            key="id"
            gi="id"
            formal-name="Role Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='objectives']/j:map/j:string[@key='id']"
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
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type'] | j:array[@key='assessment-subjects']/j:map/j:string[@key='type']"><!-- Cf XML match="party/@type | assessment-subject/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Party Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type'] | j:array[@key='assessment-subjects']/j:map/j:string[@key='type']"
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
   <xsl:template match="j:array[@key='party-uuids']/j:string[@key='party-uuid']">
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
   <xsl:template match="j:array[@key='party-uuids']/j:string[@key='party-uuid']"
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
   <xsl:template match="j:map[@key='users']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="user" -->
      <assembly name="system-user"
                gi="user"
                formal-name="System User"
                json-key-flag="uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">user</xsl:attribute>
         </xsl:if>
         <flag as-type="uuid"
               name="uuid"
               key="uuid"
               gi="uuid"
               formal-name="User Universally Unique Identifier">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='short-name']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='role-ids']"/>
         <xsl:apply-templates select="*[@key='authorized-privileges']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="(@key | @key | @key | @key | j:array[@key='role-ids']/j:string[@key='role-id'] | @key | @key | @key | @key | @key)">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="role-id" -->
      <field name="role-id"
             gi="role-id"
             as-type="NCName"
             formal-name="Role Identifier Reference"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">role-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
         <xsl:apply-templates select="*[@key='']"/>
      </field>
   </xsl:template>
   <xsl:template match="(@key | @key | @key | @key | j:array[@key='role-ids']/j:string[@key='role-id'] | @key | @key | @key | @key | @key)"
                 mode="get-value-property"
                 priority="7">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='authorized-privileges']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="authorized-privilege" -->
      <assembly name="authorized-privilege"
                gi="authorized-privilege"
                formal-name="Privilege">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">authorized-privilege</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='functions-performed']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:string[@key='function-performed']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="function-performed" -->
      <field name="function-performed"
             gi="function-performed"
             as-type="string"
             formal-name="Functions Performed"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">function-performed</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:string[@key='function-performed']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="objectives" -->
      <assembly name="local-objective"
                gi="objectives"
                formal-name="Assessment-Specific Control Objective">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">objectives</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='part']"/>
         <xsl:apply-templates select="*[@key='assessment-methods']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"><!-- Cf XML match="objectives/@control-id | assessment-plan/reviewed-controls/control-selection/include-control/@control-id | assessment-plan/reviewed-controls/control-selection/exclude-control/@control-id | assessment-plan/assessment-activity/step/reviewed-controls/control-selection/include-control/@control-id | assessment-plan/assessment-activity/step/reviewed-controls/control-selection/exclude-control/@control-id | assessment-plan/assessment-activity/reviewed-controls/control-selection/include-control/@control-id | assessment-plan/assessment-activity/reviewed-controls/control-selection/exclude-control/@control-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="control-id"
            key="control-id"
            gi="control-id"
            formal-name="Control Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))| j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:map[@key='part'] | j:array[@key='parts']/j:map | (j:array[@key='parts']/j:map | j:map[@key='parts']) | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map | j:array[@key='parts']/j:map)">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="part" -->
      <assembly name="assessment-part" gi="part" formal-name="Assessment Part">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">part</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='ns']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='prose']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='reviewed-controls']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="reviewed-controls" -->
      <assembly name="reviewed-controls"
                gi="reviewed-controls"
                formal-name="Reviewed Controls and Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">reviewed-controls</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='control-selections']"/>
         <xsl:apply-templates select="*[@key='control-objective-selections']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map[@key='include-objective']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="include-objective" -->
      <field as-type="empty"
             name="select-objective-by-id"
             gi="include-objective"
             formal-name="Select Objective">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-objective</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='objective-id']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map[@key='include-objective']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map[@key='include-objective']/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map[@key='exclude-objective']/j:string[@key='objective-id']"><!-- Cf XML match="include-objective/@objective-id | exclude-objective/@objective-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="objective-id"
            key="objective-id"
            gi="objective-id"
            formal-name="Objective ID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map[@key='include-objective']/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map[@key='exclude-objective']/j:string[@key='objective-id']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='assessment-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-subject" -->
      <assembly name="assessment-subject"
                gi="assessment-subject"
                formal-name="Subject of Assessment">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-subjects']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="include-subject" -->
      <assembly name="select-subject-by-id"
                gi="include-subject"
                formal-name="Select Assessment Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-assets']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-assets" -->
      <assembly name="assets"
                gi="assessment-assets"
                formal-name="Assessment Assets">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-assets</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='tools']"/>
         <xsl:apply-templates select="*[@key='origination']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='origination']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="origination" -->
      <assembly name="origination"
                gi="origination"
                formal-name="Assessment Origination">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">origination</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='assessment-activities']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-activity" -->
      <assembly name="activity" gi="assessment-activity" formal-name="Activity">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-activity</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='origination']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='actions']"/>
         <xsl:apply-templates select="*[@key='reviewed-controls']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='assessment-actions']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-action" -->
      <assembly name="action" gi="assessment-action" formal-name="Action">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-action</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='timing']"/>
         <xsl:apply-templates select="*[@key='activity-instances']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/published" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/version" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions" -->
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='revision']"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/published" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/version" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/document-id" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="6"><!-- Cf XML match="assessment-plan/metadata/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/role/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="assessment-plan/metadata/location/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address/addr-line" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/email-address" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/telephone-number" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="assessment-plan/metadata/location/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/url" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/name" -->
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/external-id" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="assessment-plan/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="External Identifier Schema">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/email-address" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/telephone-number" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="assessment-plan/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9"><!-- Cf XML match="assessment-plan/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address/addr-line" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/party/member-of-organization" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']"
                 priority="3">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions" -->
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='users']"/>
         <xsl:apply-templates select="*[@key='objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="7"><!-- Cf XML match="assessment-plan/local-definitions/component/status/@state" -->
      <flag in-json="string"
            as-type="string"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/inventory-item/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/inventory-item/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/inventory-item/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/inventory-item/implemented-component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/inventory-item/implemented-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="User Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/short-name" -->
      <field name="short-name"
             gi="short-name"
             formal-name="User Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="User Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/authorized-privilege/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/user/authorized-privilege/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Privilege Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/part/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Part Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:string[@key='prose']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/part/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Part Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:map[@key='part']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='assessment-methods']/j:map[@key='assessment-method']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/local-definitions/objectives/assessment-method" -->
      <field as-type="empty"
             name="assessment-method"
             gi="assessment-method"
             formal-name="Assessment Method">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-method</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='method-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='assessment-methods']/j:map[@key='assessment-method']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='assessment-methods']/j:map[@key='assessment-method']/j:string[@key='method-uuid']"
                 priority="8"><!-- Cf XML match="assessment-plan/local-definitions/objectives/assessment-method/@method-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="method-uuid"
            key="method-uuid"
            gi="method-uuid"
            formal-name="Method ID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='local-definitions']/j:array[@key='objectives']/j:map/j:array[@key='assessment-methods']/j:map[@key='assessment-method']/j:string[@key='method-uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']"
                 priority="3">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/terms-and-conditions" -->
      <assembly name="terms-and-conditions"
                gi="terms-and-conditions"
                formal-name="Assessment Plan Terms and Conditions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">terms-and-conditions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/terms-and-conditions/part/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Part Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:string[@key='prose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/terms-and-conditions/part/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Part Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/terms-and-conditions/part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='terms-and-conditions']/(j:array[@key='parts']/j:map | j:map[@key='parts'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/include-control" -->
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="10">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/exclude-control" -->
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">exclude-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-objective-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/reviewed-controls/control-objective-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/include-subject/subject" -->
      <field as-type="empty"
             name="subject"
             gi="subject"
             formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 priority="10"><!-- Cf XML match="assessment-plan/assessment-subject/include-subject/subject/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='subjects']/j:map[@key='subject']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/exclude-subject/subject" -->
      <field as-type="empty"
             name="subject"
             gi="subject"
             formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='subjects']/j:map[@key='subject']"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='subjects']/j:map[@key='subject']/j:string[@key='uuid-ref']"
                 priority="9"><!-- Cf XML match="assessment-plan/assessment-subject/exclude-subject/subject/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='subjects']/j:map[@key='subject']/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools" -->
      <assembly name="tools" gi="tools" formal-name="Assessment Assets">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">tools</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-assets/tools/component/status/@state" -->
      <flag in-json="string"
            as-type="string"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/tools/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='tools']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/origination/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Oritination Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/origination/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Origination Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/origination/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/part/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Part Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/part/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Part Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-assets/part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='assessment-assets']/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Included Activity Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Included Activity Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/origination/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Oritination Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/origination/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Origination Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/origination/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step" -->
      <assembly name="step" gi="step" formal-name="Action">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">step</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='origination']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='reviewed-controls']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- Cf XML match="assessment-plan/assessment-activity/step/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Action Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Action Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Action Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/origination/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Oritination Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/origination/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Origination Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/origination/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/include-control" -->
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="14">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/exclude-control" -->
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">exclude-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-objective-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/reviewed-controls/control-objective-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/step/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/include-control" -->
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="12">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/exclude-control" -->
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">exclude-control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string[@key='statement-id']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-objective-selection</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/reviewed-controls/control-objective-selection/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Event Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Event Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/timing" -->
      <assembly name="timing" gi="timing" formal-name="Event Timing">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">timing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/timing/on-date" -->
      <field as-type="empty"
             name="on-date"
             gi="on-date"
             formal-name="On Date Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">on-date</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='date']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-action/timing/on-date/@date" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="date"
            key="date"
            gi="date"
            formal-name="On Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/timing/within-date-range" -->
      <field as-type="empty"
             name="within-date-range"
             gi="within-date-range"
             formal-name="On Date Range Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">within-date-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-action/timing/within-date-range/@start" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="start"
            key="start"
            gi="start"
            formal-name="Start Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-action/timing/within-date-range/@end" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="end"
            key="end"
            gi="end"
            formal-name="End Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/timing/at-frequency" -->
      <field as-type="empty"
             name="at-frequency"
             gi="at-frequency"
             formal-name="Frequency Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">at-frequency</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='period']"/>
         <xsl:apply-templates select="*[@key='unit']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-action/timing/at-frequency/@period" -->
      <flag in-json="number"
            as-type="positiveInteger"
            name="period"
            key="period"
            gi="period"
            formal-name="Period">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 priority="8"><!-- Cf XML match="assessment-plan/assessment-action/timing/at-frequency/@unit" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="unit"
            key="unit"
            gi="unit"
            formal-name="Time Unit">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:map[@key='timing']/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance" -->
      <assembly name="activity-instance"
                gi="activity-instance"
                formal-name="Activity Instance">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">activity-instance</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='activity-uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='origination']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- Cf XML match="assessment-plan/assessment-action/activity-instance/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Activity Instance Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='activity-uuid']"
                 priority="7"><!-- Cf XML match="assessment-plan/assessment-action/activity-instance/@activity-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-uuid"
            key="activity-uuid"
            gi="activity-uuid"
            formal-name="Activity Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='activity-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Activity Instance Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Activity Instance Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/origination/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Oritination Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/origination/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Origination Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/origination/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='origination']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/include-all" -->
      <field as-type="empty"
             name="include-all"
             gi="include-all"
             formal-name="All"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/include-subject/subject" -->
      <field as-type="empty"
             name="subject"
             gi="subject"
             formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="15"><!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/include-subject/subject/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="15"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/exclude-subject/subject" -->
      <field as-type="empty"
             name="subject"
             gi="subject"
             formal-name="Identifies the Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="14"><!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/exclude-subject/subject/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject-placeholder" -->
      <assembly name="assessment-subject-placeholder"
                gi="assessment-subject-placeholder"
                formal-name="Assessment Subject Placeholder">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-subject-placeholder</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='sources']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject-placeholder/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessment Subject Placeholder Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject-placeholder/source" -->
      <field as-type="empty"
             name="source"
             gi="source"
             formal-name="Assessment Subject Source">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">source</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='activity-instance-uuid']"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value>
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="11"><!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject-placeholder/source/@activity-instance-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-instance-uuid"
            key="activity-instance-uuid"
            gi="activity-instance-uuid"
            formal-name="Activity Instance Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/assessment-action/activity-instance/assessment-subject-placeholder/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='assessment-actions']/j:map/j:array[@key='activity-instances']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='start']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/start" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='end']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/end" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/activity-instance" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:string[@key='activity-instance-uuid']"
                 priority="7"><!-- Cf XML match="assessment-plan/task/activity-instance/@activity-instance-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-instance-uuid"
            key="activity-instance-uuid"
            gi="activity-instance-uuid"
            formal-name="Activity Instance Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:string[@key='activity-instance-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/activity-instance/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/(j:array[@key='activity-instances']/j:map | j:map[@key='activity-instances'])/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:array[@key='tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- Cf XML match="assessment-plan/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Resource Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/description" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/document-id" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="assessment-plan/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/citation" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:map[@key='biblio']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/citation/biblio" -->
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">rlink</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- Cf XML match="assessment-plan/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="assessment-plan/back-matter/resource/base64" -->
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
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 mode="get-value-property">
      <value as-type="base64Binary" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- Cf XML match="assessment-plan/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
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
