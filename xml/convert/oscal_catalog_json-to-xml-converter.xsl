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
   <!-- METASCHEMA: OSCAL Control Catalog Model (version 1.0.0-milestone3) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='catalog']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog" -->
      <assembly name="catalog" gi="catalog" formal-name="Catalog">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">catalog</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='params']"/>
         <xsl:apply-templates select="*[@key='controls']"/>
         <xsl:apply-templates select="*[@key='groups']"/>
         <xsl:apply-templates select="*[@key='back-matter']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid']"><!-- Cf XML match="catalog/@uuid | prop/@uuid | annotation/@uuid | location/@uuid | party/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Catalog Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:string[@key='uuid'] | j:array[@key='props']/j:map[@key='prop']/j:string[@key='uuid'] | j:array[@key='annotations']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid']"
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
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='parts']/j:map/j:string[@key='name']"><!-- Cf XML match="prop/@name | annotation/@name | part/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='name'] | j:array[@key='annotations']/j:map/j:string[@key='name'] | j:array[@key='parts']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns'] | j:array[@key='parts']/j:map/j:string[@key='ns']"><!-- Cf XML match="prop/@ns | annotation/@ns | part/@ns" -->
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='ns'] | j:array[@key='annotations']/j:map/j:string[@key='ns'] | j:array[@key='parts']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class'] | j:array[@key='params']/j:map/j:string[@key='class'] | j:array[@key='controls']/j:map/j:string[@key='class'] | j:array[@key='parts']/j:map/j:string[@key='class'] | j:array[@key='groups']/j:map/j:string[@key='class']"><!-- Cf XML match="prop/@class | param/@class | control/@class | part/@class | group/@class" -->
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map[@key='prop']/j:string[@key='class'] | j:array[@key='params']/j:map/j:string[@key='class'] | j:array[@key='controls']/j:map/j:string[@key='class'] | j:array[@key='parts']/j:map/j:string[@key='class'] | j:array[@key='groups']/j:map/j:string[@key='class']"
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href']"><!-- Cf XML match="link/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href']"
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- Cf XML match="link/@media-type | catalog/back-matter/resource/rlink/@media-type | catalog/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
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
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='params']/j:map/j:string[@key='id'] | j:array[@key='controls']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map/j:string[@key='id'] | j:array[@key='groups']/j:map/j:string[@key='id']"><!-- Cf XML match="role/@id | param/@id | control/@id | part/@id | group/@id" -->
      <flag in-json="string"
            as-type="NCName"
            name="id"
            key="id"
            gi="id"
            formal-name="Role Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='params']/j:map/j:string[@key='id'] | j:array[@key='controls']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map/j:string[@key='id'] | j:array[@key='groups']/j:map/j:string[@key='id']"
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
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key"><!-- Cf XML match="responsible-party/@role-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Responsible Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key"
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
   <xsl:template match="j:array[@key='params']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="param" -->
      <assembly name="parameter" gi="param" formal-name="Parameter">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">param</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='depends-on']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='label']"/>
         <xsl:apply-templates select="*[@key='usage']"/>
         <xsl:apply-templates select="*[@key='constraints']"/>
         <xsl:apply-templates select="*[@key='guidelines']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='depends-on']"><!-- Cf XML match="param/@depends-on" -->
      <flag in-json="string"
            as-type="NCName"
            name="depends-on"
            key="depends-on"
            gi="depends-on"
            formal-name="Depends on">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='depends-on']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='constraints']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="constraint" -->
      <assembly name="parameter-constraint"
                gi="constraint"
                formal-name="Constraint">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">constraint</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='tests']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='guidelines']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="guideline" -->
      <assembly name="parameter-guideline" gi="guideline" formal-name="Guideline">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">guideline</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='prose']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="(j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="value" -->
      <field name="parameter-value"
             gi="value"
             as-type="string"
             formal-name="Parameter Value"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">value</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="(j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'])"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='select']">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="select" -->
      <assembly name="parameter-selection" gi="select" formal-name="Selection">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">select</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='how-many']"/>
         <xsl:apply-templates select="*[@key='choice']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='select']/j:string[@key='how-many']"><!-- Cf XML match="select/@how-many" -->
      <flag in-json="string"
            as-type="string"
            name="how-many"
            key="how-many"
            gi="how-many"
            formal-name="Parameter Cardinality">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='select']/j:string[@key='how-many']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='controls']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="control" -->
      <assembly name="control" gi="control" formal-name="Control">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='params']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='controls']"/>
         <xsl:apply-templates select="*[@key='']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="part" -->
      <assembly name="part" gi="part" formal-name="Part">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">part</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
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
   <xsl:template match="j:array[@key='groups']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="group" -->
      <assembly name="group" gi="group" formal-name="Control Group">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">group</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='params']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='annotations']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='']"/>
         <xsl:apply-templates select="*[@key='']"/>
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/published" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/last-modified" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/version" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/oscal-version" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions" -->
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='revision']"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/published" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/last-modified" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/version" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/oscal-version" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/document-id" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="6"><!-- Cf XML match="catalog/metadata/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/role/description" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 priority="7"><!-- Cf XML match="catalog/metadata/location/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address/addr-line" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string[@key='addr-line']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/address/country" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/email-address" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/telephone-number" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="catalog/metadata/location/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/url" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string[@key='url']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/name" -->
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/external-id" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="catalog/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="External Identifier Schema">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map[@key='external-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/email-address" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string[@key='email-address']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/telephone-number" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 priority="8"><!-- Cf XML match="catalog/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map[@key='telephone-number']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9"><!-- Cf XML match="catalog/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="string"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address/addr-line" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/address/country" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/party/member-of-organization" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string[@key='member-of-organization']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:string[@key='label']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/label" -->
      <field name="label"
             gi="label"
             as-type="markup-line"
             formal-name="Parameter Label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:string[@key='label']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:string[@key='usage']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/usage" -->
      <field name="usage"
             gi="usage"
             as-type="markup-multiline"
             formal-name="Parameter Usage Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:string[@key='usage']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/constraint/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Constraint Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/constraint/test" -->
      <assembly name="test" gi="test" formal-name="Constraint Test">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">test</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/constraint/test/expression" -->
      <field name="expression"
             gi="expression"
             as-type="string"
             formal-name="Constraint test"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/guideline/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Guideline Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/param/select/choice" -->
      <field name="parameter-choice"
             gi="choice"
             as-type="markup-line"
             formal-name="Choice"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">choice</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='params']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Control Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/label" -->
      <field name="label"
             gi="label"
             as-type="markup-line"
             formal-name="Parameter Label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/usage" -->
      <field name="usage"
             gi="usage"
             as-type="markup-multiline"
             formal-name="Parameter Usage Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/constraint/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Constraint Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/constraint/test" -->
      <assembly name="test" gi="test" formal-name="Constraint Test">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">test</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/constraint/test/expression" -->
      <field name="expression"
             gi="expression"
             as-type="string"
             formal-name="Constraint test"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/guideline/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Guideline Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/param/select/choice" -->
      <field name="parameter-choice"
             gi="choice"
             as-type="markup-line"
             formal-name="Choice"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">choice</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='params']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/part/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/part/prose" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/control/part/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='controls']/j:map/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Group Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/label" -->
      <field name="label"
             gi="label"
             as-type="markup-line"
             formal-name="Parameter Label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/usage" -->
      <field name="usage"
             gi="usage"
             as-type="markup-multiline"
             formal-name="Parameter Usage Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/constraint/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Constraint Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/constraint/test" -->
      <assembly name="test" gi="test" formal-name="Constraint Test">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">test</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/constraint/test/expression" -->
      <field name="expression"
             gi="expression"
             as-type="string"
             formal-name="Constraint test"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/guideline/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Guideline Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/param/select/choice" -->
      <field name="parameter-choice"
             gi="choice"
             as-type="markup-line"
             formal-name="Choice"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">choice</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='params']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/part/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/part/prose" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:string[@key='prose']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/part/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Control Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/label" -->
      <field name="label"
             gi="label"
             as-type="markup-line"
             formal-name="Parameter Label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/usage" -->
      <field name="usage"
             gi="usage"
             as-type="markup-multiline"
             formal-name="Parameter Usage Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/constraint/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Constraint Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/constraint/test" -->
      <assembly name="test" gi="test" formal-name="Constraint Test">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">test</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/constraint/test/expression" -->
      <field name="expression"
             gi="expression"
             as-type="string"
             formal-name="Constraint test"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property"
                 priority="14">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/guideline/prose" -->
      <field name="prose"
             as-type="markup-multiline"
             gi="prose"
             formal-name="Guideline Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/param/select/choice" -->
      <field name="parameter-choice"
             gi="choice"
             as-type="markup-line"
             formal-name="Choice"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">choice</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/part/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/part/prose" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/group/control/part/link/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:array[@key='groups']/j:map/((: NOWHERE :))"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- Cf XML match="catalog/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Resource Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/description" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/document-id" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 priority="8"><!-- Cf XML match="catalog/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map[@key='document-id']/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/citation" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property">
      <value as-type="markup-multiline" in-json="string">
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:map[@key='biblio']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/citation/biblio" -->
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">rlink</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- Cf XML match="catalog/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- Cf XML match="catalog/back-matter/resource/base64" -->
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
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 mode="get-value-property">
      <value as-type="base64Binary" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- Cf XML match="catalog/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='catalog']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
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
