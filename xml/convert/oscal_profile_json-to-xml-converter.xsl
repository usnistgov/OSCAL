<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                xmlns:j="http://www.w3.org/2005/xpath-functions"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                version="3.0"
                exclude-result-prefixes="#all">
<!-- JSON to XML conversion: pipeline -->
   <xsl:output indent="true"/>
   <!-- Processing architecture -->
   <!-- $file should be a URI, absolute or relative to the XSLT transformation-->
   <xsl:param name="file" as="xs:anyURI?"/>
   <!-- Pass in $produce=supermodel to produce OSCAL M4 supermodel intermediate format -->
   <xsl:param name="produce" as="xs:string">xml</xsl:param>
   <xsl:template name="from-json">
      <xsl:if test="not(unparsed-text-available($file))" expand-text="true">
         <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">No file found at { $file }</nm:ERROR>
      </xsl:if>
      <xsl:call-template name="from-xdm-json-xml">
         <xsl:with-param name="source">
            <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                     select="unparsed-text($file) ! json-to-xml(.)">
               <xsl:catch expand-text="true">
                  <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{{ $err:description }}</nm:ERROR>
               </xsl:catch>
            </xsl:try>
         </xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   <xsl:mode name="cast-md" on-no-match="shallow-copy"/>
   <xsl:template match="/" name="from-xdm-json-xml" expand-text="true">
      <xsl:param name="source">
         <xsl:choose><!-- evaluate { $file } as URI (absolute or relative to stylesheet)-->
            <xsl:when test="exists($file)">
               <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors" select="document($file)">
                  <xsl:catch expand-text="true">
                     <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{ $err:description }</nm:ERROR>
                  </xsl:catch>
               </xsl:try>
            </xsl:when>
            <xsl:otherwise>
               <xsl:sequence select="/"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:param>
      <xsl:if test="empty($source/j:map)" expand-text="true">
         <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">No XPath (XML) JSON found at { $file } - using syntax of http://www.w3.org/2005/xpath-functions</nm:ERROR>
      </xsl:if>
      <xsl:variable name="near-supermodel">
         <xsl:apply-templates select="$source/*"/>
      </xsl:variable>
      <xsl:variable name="supermodel">
         <xsl:apply-templates select="$near-supermodel/*" mode="cast-md"/>
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
   <xsl:template match="/j:map[empty(@key)]" priority="10">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- JSON to XML conversion: object filters -->
   <xsl:strip-space elements="j:map j:array"/>
   <!-- METASCHEMA conversion stylesheet supports JSON -> METASCHEMA/SUPERMODEL conversion -->
   <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->
   <!-- METASCHEMA:  in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='profile']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile" -->
      <assembly name="profile" key="profile" gi="profile">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">profile</xsl:attribute>
         </xsl:if>
         <xsl:if test=".. is /j:map">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='imports']"/>
         <xsl:apply-templates select="*[@key='merge']"/>
         <xsl:apply-templates select="*[@key='modify']"/>
         <xsl:apply-templates select="*[@key='back-matter']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='metadata']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="metadata" -->
      <assembly name="metadata" key="metadata" gi="metadata">
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
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='roles']"/>
         <xsl:apply-templates select="*[@key='locations']"/>
         <xsl:apply-templates select="*[@key='parties']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="prop" -->
      <assembly name="property" gi="prop">
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='ns']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="link" -->
      <assembly name="link" gi="link">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='rel']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='text']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="role" -->
      <assembly name="role" gi="role">
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='short-name']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="location" -->
      <assembly name="location" gi="location">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='address']"/>
         <xsl:apply-templates select="*[@key='email-addresses']"/>
         <xsl:apply-templates select="*[@key='telephone-numbers']"/>
         <xsl:apply-templates select="*[@key='urls']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="party" -->
      <assembly name="party" gi="party">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='short-name']"/>
         <xsl:apply-templates select="*[@key='external-ids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='email-addresses']"/>
         <xsl:apply-templates select="*[@key='telephone-numbers']"/>
         <xsl:apply-templates select="*[@key='addresses']"/>
         <xsl:apply-templates select="*[@key='location-uuids']"/>
         <xsl:apply-templates select="*[@key='member-of-organizations']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="responsible-party" -->
      <assembly name="responsible-party" gi="responsible-party">
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='imports']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="import" -->
      <assembly name="import" gi="import">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='include-all']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="include-all" -->
      <assembly as-type="empty"
                name="include-all"
                key="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='merge']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="merge" -->
      <assembly name="merge" key="merge" gi="merge">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">merge</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='combine']"/>
         <xsl:apply-templates select="*[@key='as-is']"/>
         <xsl:apply-templates select="*[@key='custom']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='combine']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="combine" -->
      <assembly as-type="empty" name="combine" key="combine" gi="combine">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">combine</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='method']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='custom']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="custom" -->
      <assembly name="custom" key="custom" gi="custom">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">custom</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='groups']"/>
         <xsl:apply-templates select="*[@key='insert-controls']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='groups']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="group" -->
      <assembly name="group" gi="group">
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='params']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='groups']"/>
         <xsl:apply-templates select="*[@key='insert-controls']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="param" -->
      <assembly name="parameter" gi="param">
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='depends-on']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='label']"/>
         <xsl:apply-templates select="*[@key='usage']"/>
         <xsl:apply-templates select="*[@key='constraints']"/>
         <xsl:apply-templates select="*[@key='guidelines']"/>
         <xsl:apply-templates select="*[@key='values']"/>
         <xsl:apply-templates select="*[@key='select']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='constraints']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="constraint" -->
      <assembly name="parameter-constraint" gi="constraint">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='tests']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='guidelines']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="guideline" -->
      <assembly name="parameter-guideline" gi="guideline">
         <xsl:apply-templates select="*[@key='prose']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='select']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="select" -->
      <assembly name="parameter-selection" key="select" gi="select">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">select</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='how-many']"/>
         <xsl:apply-templates select="*[@key='choice']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="part" -->
      <assembly name="part" gi="part">
         <xsl:apply-templates select="*[@key='id']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='ns']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='prose']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='insert-controls']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="insert-controls" -->
      <assembly name="insert-controls" gi="insert-controls">
         <xsl:apply-templates select="*[@key='order']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='modify']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="modify" -->
      <assembly name="modify" key="modify" gi="modify">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">modify</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='set-parameters']"/>
         <xsl:apply-templates select="*[@key='alters']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='alters']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="alter" -->
      <assembly name="alter" gi="alter">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='removes']"/>
         <xsl:apply-templates select="*[@key='adds']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="remove" -->
      <assembly as-type="empty" name="remove" gi="remove">
         <xsl:apply-templates select="*[@key='by-name']"/>
         <xsl:apply-templates select="*[@key='by-class']"/>
         <xsl:apply-templates select="*[@key='by-id']"/>
         <xsl:apply-templates select="*[@key='by-item-name']"/>
         <xsl:apply-templates select="*[@key='by-ns']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='adds']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="add" -->
      <assembly name="add" gi="add">
         <xsl:apply-templates select="*[@key='position']"/>
         <xsl:apply-templates select="*[@key='by-id']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='params']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='back-matter']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="back-matter" -->
      <assembly name="back-matter" key="back-matter" gi="back-matter">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">back-matter</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='resources']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:string[@key='remarks']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="remarks" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:string">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="location-uuid" -->
      <field collapsible="no"
             as-type="uuid"
             name="location-uuid"
             gi="location-uuid"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='party-uuids']/j:string">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="party-uuid" -->
      <field collapsible="no"
             as-type="uuid"
             name="party-uuid"
             gi="party-uuid"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='party-uuids']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:boolean[@key='as-is']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="as-is" -->
      <field collapsible="no"
             as-type="boolean"
             name="as-is"
             key="as-is"
             gi="as-is"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">as-is</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:boolean[@key='as-is']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="boolean" in-json="boolean">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="(j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="value" -->
      <field collapsible="no"
             as-type="string"
             name="parameter-value"
             gi="value"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="(j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:array[@key='values']/j:string | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'] | j:string[@key='value'])"
                 mode="get-value-property"
                 priority="12">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="hash" -->
      <field collapsible="no" as-type="string" name="hash" gi="hash">
         <xsl:apply-templates select="*[@key='algorithm']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching hash-->
   <xsl:template match="j:array[@key='hashes']/j:map" mode="get-value-property">
      <value as-type="string" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:string[@key='uuid']"><!-- XML match="profile/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']"><!-- XML match="prop/@name" -->
      <flag in-json="string"
            as-type="token"
            name="name"
            key="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='uuid']"><!-- XML match="prop/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"><!-- XML match="prop/@ns" -->
      <flag in-json="string" as-type="uri" name="ns" key="ns" gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='value']"><!-- XML match="prop/@value" -->
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='class']"><!-- XML match="prop/@class" -->
      <flag in-json="string"
            as-type="token"
            name="class"
            key="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href']"><!-- XML match="link/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']"><!-- XML match="link/@rel" -->
      <flag in-json="string"
            as-type="token"
            name="rel"
            key="rel"
            gi="rel">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type']"><!-- XML match="link/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="profile/metadata/document-id/@scheme | profile/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"><!-- XML match="role/@id" -->
      <flag in-json="string" as-type="token" name="id" key="id" gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map/j:string[@key='uuid']"><!-- XML match="location/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="profile/metadata/location/address/@type | profile/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="token"
            name="location-type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 priority="8"><!-- XML match="profile/metadata/location/telephone-number/@type | profile/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='uuid']"><!-- XML match="party/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"><!-- XML match="party/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 priority="8"><!-- XML match="profile/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map/j:string[@key='role-id']"><!-- XML match="responsible-party/@role-id" -->
      <flag in-json="string"
            as-type="token"
            name="role-id"
            key="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='imports']/j:map/j:string[@key='href']"><!-- XML match="import/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='imports']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls']"><!-- XML match="profile/import/include-controls/@with-child-controls | profile/import/exclude-controls/@with-child-controls | profile/merge/custom//group/insert-controls/include-controls/@with-child-controls | profile/merge/custom//group/insert-controls/exclude-controls/@with-child-controls | profile/merge/custom/insert-controls/include-controls/@with-child-controls | profile/merge/custom/insert-controls/exclude-controls/@with-child-controls" -->
      <flag in-json="string"
            as-type="token"
            name="with-child-controls"
            key="with-child-controls"
            gi="with-child-controls">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='with-child-controls'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='with-child-controls']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern']"><!-- XML match="profile/import/include-controls/matching/@pattern | profile/import/exclude-controls/matching/@pattern | profile/merge/custom//group/insert-controls/include-controls/matching/@pattern | profile/merge/custom//group/insert-controls/exclude-controls/matching/@pattern | profile/merge/custom/insert-controls/include-controls/matching/@pattern | profile/merge/custom/insert-controls/exclude-controls/matching/@pattern" -->
      <flag in-json="string"
            as-type="string"
            name="pattern"
            key="pattern"
            gi="pattern">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern'] | j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map/j:string[@key='pattern']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='combine']/j:string[@key='method']"><!-- XML match="combine/@method" -->
      <flag in-json="string"
            as-type="string"
            name="method"
            key="method"
            gi="method">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='combine']/j:string[@key='method']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='groups']/j:map/j:string[@key='id']"><!-- XML match="group/@id" -->
      <flag in-json="string" as-type="token" name="id" key="id" gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='groups']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='groups']/j:map/j:string[@key='class']"><!-- XML match="group/@class" -->
      <flag in-json="string"
            as-type="token"
            name="class"
            key="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='groups']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='id']"><!-- XML match="param/@id" -->
      <flag in-json="string" as-type="token" name="id" key="id" gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='class']"><!-- XML match="param/@class" -->
      <flag in-json="string"
            as-type="token"
            name="class"
            key="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='depends-on']"><!-- XML match="param/@depends-on" -->
      <flag in-json="string"
            as-type="token"
            name="depends-on"
            key="depends-on"
            gi="depends-on">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='params']/j:map/j:string[@key='depends-on']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='select']/j:string[@key='how-many']"><!-- XML match="select/@how-many" -->
      <flag in-json="string"
            as-type="token"
            name="how-many"
            key="how-many"
            gi="how-many">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='select']/j:string[@key='how-many']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='id']"><!-- XML match="part/@id" -->
      <flag in-json="string" as-type="token" name="id" key="id" gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"><!-- XML match="part/@name" -->
      <flag in-json="string"
            as-type="token"
            name="name"
            key="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"><!-- XML match="part/@ns" -->
      <flag in-json="string" as-type="uri" name="ns" key="ns" gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"><!-- XML match="part/@class" -->
      <flag in-json="string"
            as-type="token"
            name="class"
            key="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='insert-controls']/j:map/j:string[@key='order']"><!-- XML match="insert-controls/@order" -->
      <flag in-json="string"
            as-type="token"
            name="order"
            key="order"
            gi="order">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='insert-controls']/j:map/j:string[@key='order']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='param-id']"
                 priority="6"><!-- XML match="profile/modify/set-parameter/@param-id" -->
      <flag in-json="string"
            as-type="token"
            name="param-id"
            key="param-id"
            gi="param-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='param-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='class']"
                 priority="6"><!-- XML match="profile/modify/set-parameter/@class" -->
      <flag in-json="string"
            as-type="token"
            name="class"
            key="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='depends-on']"><!-- XML match="profile/modify/set-parameter/@depends-on" -->
      <flag in-json="string"
            as-type="token"
            name="depends-on"
            key="depends-on"
            gi="depends-on">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='depends-on']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='alters']/j:map/j:string[@key='control-id']"><!-- XML match="alter/@control-id" -->
      <flag in-json="string"
            as-type="token"
            name="control-id"
            key="control-id"
            gi="control-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='alters']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-name']"><!-- XML match="remove/@by-name" -->
      <flag in-json="string"
            as-type="token"
            name="by-name"
            key="by-name"
            gi="by-name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-class']"><!-- XML match="remove/@by-class" -->
      <flag in-json="string"
            as-type="token"
            name="by-class"
            key="by-class"
            gi="by-class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-id']"><!-- XML match="remove/@by-id" -->
      <flag in-json="string"
            as-type="token"
            name="by-id"
            key="by-id"
            gi="by-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-item-name']"><!-- XML match="remove/@by-item-name" -->
      <flag in-json="string"
            as-type="token"
            name="by-item-name"
            key="by-item-name"
            gi="by-item-name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-item-name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-ns']"><!-- XML match="remove/@by-ns" -->
      <flag in-json="string"
            as-type="token"
            name="by-ns"
            key="by-ns"
            gi="by-ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='removes']/j:map/j:string[@key='by-ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='adds']/j:map/j:string[@key='position']"><!-- XML match="add/@position" -->
      <flag in-json="string"
            as-type="token"
            name="position"
            key="position"
            gi="position">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='adds']/j:map/j:string[@key='position']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='adds']/j:map/j:string[@key='by-id']"><!-- XML match="add/@by-id" -->
      <flag in-json="string"
            as-type="token"
            name="by-id"
            key="by-id"
            gi="by-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='adds']/j:map/j:string[@key='by-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="profile/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- XML match="profile/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"><!-- XML match="profile/back-matter/resource/rlink/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"><!-- XML match="hash/@algorithm" -->
      <flag in-json="string"
            as-type="string"
            name="algorithm"
            key="algorithm"
            gi="algorithm">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- XML match="profile/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="profile/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/published" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="published"
             key="published"
             gi="published"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/last-modified" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="last-modified"
             key="last-modified"
             gi="last-modified"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/version" -->
      <field collapsible="no"
             as-type="string"
             name="version"
             key="version"
             gi="version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/oscal-version" -->
      <field collapsible="no"
             as-type="string"
             name="oscal-version"
             key="oscal-version"
             gi="oscal-version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision" -->
      <assembly name="revision" gi="revision">
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='published']"/>
         <xsl:apply-templates select="*[@key='last-modified']"/>
         <xsl:apply-templates select="*[@key='version']"/>
         <xsl:apply-templates select="*[@key='oscal-version']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions" -->
      <group in-xml="SHOWN"
             gi="revisions"
             group-json="ARRAY"
             name="revision"
             key="revisions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/published" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="published"
             key="published"
             gi="published"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/last-modified" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="last-modified"
             key="last-modified"
             gi="last-modified"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/version" -->
      <field collapsible="no"
             as-type="string"
             name="version"
             key="version"
             gi="version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/oscal-version" -->
      <field collapsible="no"
             as-type="string"
             name="oscal-version"
             key="oscal-version"
             gi="oscal-version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/revisions/revision/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/document-id" -->
      <field collapsible="no"
             as-type="string"
             name="document-id"
             gi="document-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/metadata/document-id-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/role/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/role/short-name" -->
      <field collapsible="no"
             as-type="string"
             name="short-name"
             key="short-name"
             gi="short-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/role/description" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/role/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address" -->
      <assembly name="address" key="address" gi="address">
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
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address/addr-line" -->
      <field collapsible="no"
             as-type="string"
             name="addr-line"
             gi="addr-line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address/city" -->
      <field collapsible="no"
             as-type="string"
             name="city"
             key="city"
             gi="city"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address/state" -->
      <field collapsible="no"
             as-type="string"
             name="state"
             key="state"
             gi="state"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address/postal-code" -->
      <field collapsible="no"
             as-type="string"
             name="postal-code"
             key="postal-code"
             gi="postal-code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/address/country" -->
      <field collapsible="no"
             as-type="string"
             name="country"
             key="country"
             gi="country"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/email-address" -->
      <field collapsible="no"
             as-type="email"
             name="email-address"
             gi="email-address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/telephone-number" -->
      <field collapsible="no"
             as-type="string"
             name="telephone-number"
             gi="telephone-number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/metadata/location/telephone-number-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/url" -->
      <field collapsible="no"
             as-type="uri"
             name="url"
             gi="url"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/location/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/name" -->
      <field collapsible="no"
             as-type="string"
             name="name"
             key="name"
             gi="name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/short-name" -->
      <field collapsible="no"
             as-type="string"
             name="short-name"
             key="short-name"
             gi="short-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/external-id" -->
      <field collapsible="no"
             as-type="string"
             name="external-id"
             gi="external-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/metadata/party/external-id-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/email-address" -->
      <field collapsible="no"
             as-type="email"
             name="email-address"
             gi="email-address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/telephone-number" -->
      <field collapsible="no"
             as-type="string"
             name="telephone-number"
             gi="telephone-number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/metadata/party/telephone-number-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address" -->
      <assembly name="address" gi="address">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address/addr-line" -->
      <field collapsible="no"
             as-type="string"
             name="addr-line"
             gi="addr-line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address/city" -->
      <field collapsible="no"
             as-type="string"
             name="city"
             key="city"
             gi="city"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address/state" -->
      <field collapsible="no"
             as-type="string"
             name="state"
             key="state"
             gi="state"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address/postal-code" -->
      <field collapsible="no"
             as-type="string"
             name="postal-code"
             key="postal-code"
             gi="postal-code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/address/country" -->
      <field collapsible="no"
             as-type="string"
             name="country"
             key="country"
             gi="country"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/party/member-of-organization" -->
      <field collapsible="no"
             as-type="uuid"
             name="member-of-organization"
             gi="member-of-organization"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/metadata/responsible-party/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/include-controls" -->
      <assembly name="select-control-by-id" gi="include-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/include-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="9">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/include-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/exclude-controls" -->
      <assembly name="select-control-by-id" gi="exclude-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/exclude-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:array[@key='imports']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/import/exclude-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/label" -->
      <field collapsible="no"
             as-type="markup-line"
             name="label"
             key="label"
             gi="label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/usage" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="usage"
             key="usage"
             gi="usage"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/constraint/description" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/constraint/test" -->
      <assembly name="test" gi="test">
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/constraint/test/expression" -->
      <field collapsible="no"
             as-type="string"
             name="expression"
             key="expression"
             gi="expression"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for profile/merge/custom//group/param/guideline-->
   <xsl:template priority="6"
                 match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']">
      <field scope="local"
             _step="prose"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose">
         <value as-type="markup-multiline"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/param/select/choice" -->
      <field collapsible="no"
             as-type="markup-line"
             name="parameter-choice"
             gi="choice"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='params']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group//part/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for profile/merge/custom//group//part-->
   <xsl:template priority="5"
                 match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map//j:array[@key='parts']/j:map/j:string[@key='prose']">
      <field scope="local"
             _step="prose"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/part/prose"
             _metaschema-json-id="/assembly/oscal-catalog-common/part/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose">
         <value as-type="markup-multiline"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/prose/PROSE"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/prose/PROSE"
                in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group//part/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/include-controls" -->
      <assembly name="select-control-by-id" gi="include-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/include-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="15">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/include-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/exclude-controls" -->
      <assembly name="select-control-by-id" gi="exclude-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/exclude-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="14">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']//j:array[@key='groups']/j:map/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom//group/insert-controls/exclude-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/include-controls" -->
      <assembly name="select-control-by-id" gi="include-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/include-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="12">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/include-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/exclude-controls" -->
      <assembly name="select-control-by-id" gi="exclude-controls">
         <xsl:apply-templates select="*[@key='with-child-controls']"/>
         <xsl:apply-templates select="*[@key='with-ids']"/>
         <xsl:apply-templates select="*[@key='matching']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/exclude-controls/with-id" -->
      <field collapsible="no"
             as-type="token"
             name="with-id"
             gi="with-id"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='with-ids']/j:string"
                 mode="get-value-property"
                 priority="11">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='merge']/j:map[@key='custom']/j:array[@key='insert-controls']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='matching']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/merge/custom/insert-controls/exclude-controls/matching" -->
      <assembly as-type="empty" name="matching" gi="matching">
         <xsl:apply-templates select="*[@key='pattern']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter" -->
      <assembly name="set-parameter" gi="set-parameter">
         <xsl:apply-templates select="*[@key='param-id']"/>
         <xsl:apply-templates select="*[@key='class']"/>
         <xsl:apply-templates select="*[@key='depends-on']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='label']"/>
         <xsl:apply-templates select="*[@key='usage']"/>
         <xsl:apply-templates select="*[@key='constraints']"/>
         <xsl:apply-templates select="*[@key='guidelines']"/>
         <xsl:apply-templates select="*[@key='values']"/>
         <xsl:apply-templates select="*[@key='select']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='label']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/label" -->
      <field collapsible="no"
             as-type="markup-line"
             name="label"
             key="label"
             gi="label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='label']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='usage']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/usage" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="usage"
             key="usage"
             gi="usage"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:string[@key='usage']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/constraint/description" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/constraint/test" -->
      <assembly name="test" gi="test">
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/constraint/test/expression" -->
      <field collapsible="no"
             as-type="string"
             name="expression"
             key="expression"
             gi="expression"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for profile/modify/set-parameter/guideline-->
   <xsl:template priority="4"
                 match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']">
      <field scope="local"
             _step="prose"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose">
         <value as-type="markup-multiline"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/set-parameter/select/choice" -->
      <field collapsible="no"
             as-type="markup-line"
             name="parameter-choice"
             gi="choice"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='set-parameters']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/label" -->
      <field collapsible="no"
             as-type="markup-line"
             name="label"
             key="label"
             gi="label"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">label</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:string[@key='label']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/usage" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="usage"
             key="usage"
             gi="usage"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">usage</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:string[@key='usage']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/constraint/description" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/constraint/test" -->
      <assembly name="test" gi="test">
         <xsl:apply-templates select="*[@key='expression']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/constraint/test/expression" -->
      <field collapsible="no"
             as-type="string"
             name="expression"
             key="expression"
             gi="expression"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expression</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='constraints']/j:map/j:array[@key='tests']/j:map/j:string[@key='expression']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for profile/modify/alter/add/param/guideline-->
   <xsl:template priority="6"
                 match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:array[@key='guidelines']/j:map/j:string[@key='prose']">
      <field scope="local"
             _step="prose"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose">
         <value as-type="markup-multiline"
                _metaschema-xml-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                _metaschema-json-id="/assembly/oscal-catalog-common/parameter-guideline/prose/PROSE"
                in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/param/select/choice" -->
      <field collapsible="no"
             as-type="markup-line"
             name="parameter-choice"
             gi="choice"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='params']/j:map/j:map[@key='select']/j:array[@key='choice']/j:string"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add//part/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for profile/modify/alter/add//part-->
   <xsl:template priority="5"
                 match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map//j:array[@key='parts']/j:map/j:string[@key='prose']">
      <field scope="local"
             _step="prose"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/part/prose"
             _metaschema-json-id="/assembly/oscal-catalog-common/part/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose">
         <value as-type="markup-multiline"
                _metaschema-xml-id="/assembly/oscal-catalog-common/part/prose/PROSE"
                _metaschema-json-id="/assembly/oscal-catalog-common/part/prose/PROSE"
                in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/modify/alter/add//part/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='modify']/j:array[@key='alters']/j:map/j:array[@key='adds']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource" -->
      <assembly name="resource" gi="resource">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='document-ids']"/>
         <xsl:apply-templates select="*[@key='citation']"/>
         <xsl:apply-templates select="*[@key='rlinks']"/>
         <xsl:apply-templates select="*[@key='base64']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/title" -->
      <field collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/description" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/document-id" -->
      <field collapsible="no"
             as-type="string"
             name="document-id"
             gi="document-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/back-matter/resource/document-id-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/citation" -->
      <assembly name="citation" key="citation" gi="citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/citation/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/citation/link/text" -->
      <field collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="profile/back-matter/resource/base64" -->
      <field collapsible="no"
             as-type="base64Binary"
             name="base64"
             key="base64"
             gi="base64">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base64</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='filename']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching profile/back-matter/resource/base64-->
   <xsl:template match="j:map[@key='profile']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 mode="get-value-property">
      <value as-type="base64Binary" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <!-- by default, fields traverse their properties to find a value -->
   <xsl:template match="*" mode="get-value-property">
      <xsl:apply-templates mode="keep-value-property"/>
   </xsl:template>
   <xsl:template match="*" mode="keep-value-property">
      <xsl:value-of select="."/>
   </xsl:template>
   <!-- JSON to XML conversion: Markdown to markup inferencing -->
   <xsl:template mode="cast-md"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="value[@as-type=('markup-line')]">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <!-- if this is valid only a single p comes back but who can tell? -->
         <xsl:call-template name="parse-markdown-line">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="cast-md"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="value[@as-type=('markup-multiline')]">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:call-template name="parse-markdown">
            <xsl:with-param name="markdown-str" select="string(.)"/>
         </xsl:call-template>
      </xsl:copy>
   </xsl:template>
   <xsl:template name="parse-markdown-line">
      <xsl:param name="markdown-str" as="xs:string" required="yes"/>
      <xsl:variable name="str-as-textnode">
         <xsl:value-of select="string($markdown-str) =&gt; replace('\\n','&#xA;')"/>
      </xsl:variable>
      <xsl:apply-templates select="$str-as-textnode" mode="infer-inlines"/>
   </xsl:template>
   <xsl:template name="parse-markdown">
        
<!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        -->
        <!-- $str may be passed in, or we can process the current node -->
      <xsl:param name="markdown-str" as="xs:string" required="yes"/>
      <xsl:variable name="str" select="string($markdown-str) =&gt; replace('\\n','&#xA;')"/>
      <xsl:variable name="starts-with-code" select="matches($str,'^```')"/>
      <!-- Blocks is split between code blocks and everything else -->
      <xsl:variable name="blocks">
         <xsl:for-each-group select="tokenize($str, '\n')"
                             group-starting-with=".[matches(., '^```')]">
                <!-- odd groups are code if the first one has code, otherwise evens -->
            <xsl:variable name="this-is-code"
                          select="not((position() mod 2) + number($starts-with-code))"/>
            <p><!-- Adding an attribute flag when this is a code block, code='code' -->
               <xsl:if test="$this-is-code">
                  <xsl:variable name="language"
                                expand-text="true"
                                select="(replace(.,'^```','') ! normalize-space(.))[matches(.,'\S')]"/>
                  <xsl:attribute name="code" select="if ($language) then $language else 'code'"/>
               </xsl:if>
               <xsl:value-of select="string-join(current-group()[not(matches(., '^```'))],'&#xA;')"/>
            </p>
         </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="rough-blocks">
         <xsl:apply-templates select="$blocks" mode="parse-block"/>
      </xsl:variable>
      <!-- for debugging <xsl:copy-of select="$rough-blocks"/> -->
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
      <xsl:sequence select="$fully-marked"/>
   </xsl:template>
   <xsl:template match="*" mode="copy mark-structures build-structures infer-inlines">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="parse-block"
                 priority="1"
                 match="p[exists(@code)]"
                 expand-text="true">
      <pre>
         <xsl:for-each select="@code[not(.='code')]">
            <xsl:attribute name="class">language-{.}</xsl:attribute>
         </xsl:for-each>
         <xsl:value-of select="string(.)"/>
      </pre>
   </xsl:template>
   <xsl:template mode="parse-block" match="p" expand-text="true">
      <xsl:for-each select="tokenize(string(.),'\n\s*\n')[normalize-space(.)]">
         <p>
                <!-- trimming leading and trailing whitespace here -->
            <xsl:value-of select="replace(.,'(^\s*\n|\s+$)','')"/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:function name="m:is-table-row-demarcator" as="xs:boolean">
      <xsl:param name="line" as="xs:string"/>
      <xsl:sequence select="matches($line,'^[\|\-:\s]+$')"/>
   </xsl:function>
   <xsl:function name="m:is-table" as="xs:boolean">
      <xsl:param name="line" as="element(p)"/>
      <xsl:variable name="lines" select="tokenize($line,'\s*\n')[matches(.,'\S')]"/>
      <xsl:sequence select="(every $l in $lines satisfies matches($l,'^\|')) and (some $l in $lines satisfies m:is-table-row-demarcator($l))"/>
   </xsl:function>
   <xsl:template mode="mark-structures" priority="5" match="p[m:is-table(.)]">
      <xsl:variable name="rows">
         <xsl:for-each select="tokenize(string(.),'\s*\n')">
            <tr>
               <xsl:value-of select="."/>
            </tr>
         </xsl:for-each>
      </xsl:variable>
      <table>
         <xsl:apply-templates select="$rows/tr" mode="make-row"/>
      </table>
   </xsl:template>
   <xsl:template match="tr[m:is-table-row-demarcator(string(.))]"
                 priority="5"
                 mode="make-row"/>
   <xsl:template match="tr" mode="make-row">
      <tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <td>
               <xsl:value-of select="."/>
            </td>
         </xsl:for-each>
      </tr>
   </xsl:template>
   <xsl:template match="tr[some $f in (following-sibling::tr) satisfies m:is-table-row-demarcator(string($f))]"
                 mode="make-row">
      <tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <th>
               <xsl:value-of select="."/>
            </th>
         </xsl:for-each>
      </tr>
   </xsl:template>
   <xsl:template mode="mark-structures" match="p[matches(.,'^#')]">
        <!-- 's' flag is dot-matches-all, so \n does not impede -->
      <p header-level="{ replace(.,'[^#].*$','','s') ! string-length(.) }">
         <xsl:value-of select="replace(.,'^#+\s*','') ! replace(.,'\s+$','')"/>
      </p>
   </xsl:template>
   <xsl:variable name="li-regex" as="xs:string">^\s*(\*|\d+\.)\s</xsl:variable>
   <xsl:template mode="mark-structures" match="p[matches(.,$li-regex)]">
      <list>
         <xsl:for-each-group group-starting-with=".[matches(.,$li-regex)]"
                             select="tokenize(., '\n')">
            <li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}"
                type="{ if (matches(.,'\s*\d')) then 'ol' else 'ul' }">
               <xsl:for-each select="current-group()[normalize-space(.)]">
                  <xsl:if test="not(position() eq 1)">
                     <br/>
                  </xsl:if>
                  <xsl:value-of select="replace(., $li-regex, '')"/>
               </xsl:for-each>
            </li>
         </xsl:for-each-group>
      </list>
   </xsl:template>
   <xsl:template mode="build-structures" match="p[@header-level]">
      <xsl:variable name="level" select="(@header-level[6 &gt;= .],6)[1]"/>
      <xsl:element name="h{$level}"
                   namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
         <xsl:value-of select="."/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="build-structures" match="list" name="nest-lists">
        <!-- Starting at level 0 and grouping  -->
        <!--        -->
      <xsl:param name="level" select="0"/>
      <xsl:param name="group" select="li"/>
      <xsl:variable name="this-type" select="$group[1]/@type"/>
      <!--first, splitting ul from ol groups -->
      <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level and not(@type = preceding-sibling::*[1]/@type)]">-->
      <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level]">-->
      <xsl:element name="{ $group[1]/@type }"
                   namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
         <xsl:for-each-group select="$group"
                             group-starting-with="li[(@level = $level) or not(@type = preceding-sibling::*[1]/@type)]">
            <xsl:choose>
               <xsl:when test="@level = $level (: checking first item in group :)">
                  <li>
                            <!--<xsl:copy-of select="@level"/>-->
                     <xsl:apply-templates mode="copy"/>
                     <xsl:if test="current-group()/@level &gt; $level (: go deeper? :)">
                        <xsl:call-template name="nest-lists">
                           <xsl:with-param name="level" select="$level + 1"/>
                           <xsl:with-param name="group" select="current-group()[@level &gt; $level]"/>
                        </xsl:call-template>
                     </xsl:if>
                  </li>
               </xsl:when>
               <xsl:otherwise>
                        <!-- fallback for skipping levels -->
                  <li>
                                <!-- level="{$level}"-->
                     <xsl:call-template name="nest-lists">
                        <xsl:with-param name="level" select="$level + 1"/>
                        <xsl:with-param name="group" select="current-group()"/>
                     </xsl:call-template>
                  </li>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each-group>
      </xsl:element>
      <!--</xsl:for-each-group>-->
   </xsl:template>
   <xsl:template match="pre//text()" mode="infer-inlines">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:template match="text()" mode="infer-inlines">
      <xsl:variable name="markup">
         <xsl:apply-templates select="$tag-replacements/rules" mode="replacements">
            <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
         </xsl:apply-templates>
      </xsl:variable>
      <xsl:try select="parse-xml-fragment($markup)">
         <xsl:catch select="."/>
      </xsl:try>
   </xsl:template>
   <xsl:template match="rules" as="xs:string" mode="replacements">

        <!-- Original is only provided for processing text nodes -->
      <xsl:param name="original" as="text()?" tunnel="yes"/>
      <xsl:param name="starting" as="xs:string" select="string($original)"/>
      <xsl:iterate select="*">
         <xsl:param name="original" select="$original" as="text()?"/>
         <xsl:param name="str" select="$starting" as="xs:string"/>
         <xsl:on-completion select="$str"/>
         <xsl:next-iteration>
            <xsl:with-param name="str">
               <xsl:apply-templates select="." mode="replacements">
                  <xsl:with-param name="str" select="$str"/>
               </xsl:apply-templates>
            </xsl:with-param>
         </xsl:next-iteration>
      </xsl:iterate>
   </xsl:template>
   <xsl:template match="replace" expand-text="true" mode="replacements">
      <xsl:param name="str" as="xs:string"/>
      <!--<xsl:value-of>replace({$str},{@match},{string(.)})</xsl:value-of>-->
      <!-- 's' sets dot-matches-all       -->
      <xsl:sequence select="replace($str, @match, string(.),'s')"/>
      <!--<xsl:copy-of select="."/>-->
   </xsl:template>
   <xsl:variable name="tag-replacements">
      <rules>
            <!-- first, literal replacements -->
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
   <xsl:variable name="tag-specification" as="element()">
      <tag-spec>
            <!-- The XML notation represents the substitution by showing both delimiters and tags  -->
            <!-- Note that text contents are regex notation for matching so * must be \* -->
         <q>"<text/>"</q>
         <img alt="!\[{{$noclosebracket}}\]" src="\({{$nocloseparen}}\)"/>
         <insert>\{\{\s*insert: <type/>,\s*<id-ref/>\s*\}\}</insert>
         <a href="\[{{$noclosebracket}}\]">\(<text not="\)"/>\)</a>
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
   <xsl:template match="text" mode="write-match">
      <xsl:text>(.*?)</xsl:text>
   </xsl:template>
   <xsl:template match="insert/type | insert/id-ref" mode="write-match">
      <xsl:text>(\i\c*?)</xsl:text>
   </xsl:template>
   <xsl:template match="text[@not]" mode="write-match">
      <xsl:text expand-text="true">([^{ @not }]*?)</xsl:text>
   </xsl:template>
   <xsl:template match="*" mode="write-replace">
        <!-- we can write an open/close pair even for an empty element b/c
             it will be parsed and serialized -->
      <xsl:text>&lt;</xsl:text>
      <xsl:value-of select="local-name()"/>
      <!-- forcing the namespace! -->
      <xsl:text> xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"</xsl:text>
      <!-- coercing the order to ensure correct formation of regegex       -->
      <xsl:apply-templates mode="#current" select="@*"/>
      <xsl:text>&gt;</xsl:text>
      <xsl:apply-templates mode="#current" select="*"/>
      <xsl:text>&lt;/</xsl:text>
      <xsl:value-of select="local-name()"/>
      <xsl:text>&gt;</xsl:text>
   </xsl:template>
   <xsl:template match="text" mode="write-replace">
      <xsl:text>$1</xsl:text>
   </xsl:template>
   <xsl:template match="insert" mode="write-replace">
        <!-- we can write an open/close pair even for an empty element b/c
             it will be parsed and serialized -->
      <xsl:text>&lt;insert xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"</xsl:text>
      <!-- coercing the order to ensure correct formation of regegex       -->
      <xsl:apply-templates mode="#current" select="*"/>
      <xsl:text>/&gt;</xsl:text>
   </xsl:template>
   <xsl:template match="insert/type" mode="write-replace">
      <xsl:text> type='$1'</xsl:text>
   </xsl:template>
   <xsl:template match="insert/id-ref" mode="write-replace">
      <xsl:text> id-ref='$2'</xsl:text>
   </xsl:template>
   <xsl:template match="a/@href" mode="write-replace">
      <xsl:text> href='$2'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="img/@alt" mode="write-replace">
      <xsl:text> alt='$1'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="img/@src" mode="write-replace">
      <xsl:text> src='$2'</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:variable name="line-example" xml:space="preserve"> { insertion } </xsl:variable>
   <!-- JSON to XML conversion: Supermodel serialization as XML -->
   <xsl:strip-space xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                    elements="s:*"/>
   <xsl:preserve-space xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                       elements="s:flag s:value"/>
   <xsl:mode xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
             name="write-xml"/>
   <xsl:template xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="s:*[exists(@gi)]"
                 mode="write-xml">
      <xsl:element name="{@gi}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
            <!-- putting flags first in case of disarranged inputs -->
         <xsl:apply-templates select="s:flag, (* except s:flag)" mode="write-xml"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="s:value[@as-type=('markup-line','markup-multiline')]"
                 mode="write-xml">
      <xsl:apply-templates mode="cast-prose"/>
   </xsl:template>
   <xsl:template xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:apply-templates select="." mode="cast-prose"/>
   </xsl:template>
   <xsl:template xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 priority="2"
                 match="s:flag"
                 mode="write-xml">
      <xsl:attribute name="{@gi}">
         <xsl:value-of select="."/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template xmlns:s="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                 match="*"
                 mode="cast-prose">
      <xsl:element name="{local-name()}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>
