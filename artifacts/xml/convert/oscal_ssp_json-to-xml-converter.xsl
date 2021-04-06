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
   <!-- METASCHEMA: OSCAL System Security Plan (SSP) Model (version 1.0.0-rc1) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='system-security-plan']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  system-security-plan" -->
      <assembly name="system-security-plan"
                gi="system-security-plan"
                formal-name="System Security Plan (SSP)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-security-plan</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='import-profile']"/>
         <xsl:apply-templates select="*[@key='system-characteristics']"/>
         <xsl:apply-templates select="*[@key='system-implementation']"/>
         <xsl:apply-templates select="*[@key='control-implementation']"/>
         <xsl:apply-templates select="*[@key='back-matter']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='metadata']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  metadata" -->
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
      <!-- XML match="  prop" -->
      <assembly name="property" gi="prop" formal-name="Property">
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
      <!-- XML match="  link" -->
      <assembly name="link" gi="link" formal-name="Link">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='rel']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='text']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  role" -->
      <assembly name="role" gi="role" formal-name="Role">
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
      <!-- XML match="  location" -->
      <assembly name="location" gi="location" formal-name="Location">
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
      <!-- XML match="  party" -->
      <assembly name="party"
                gi="party"
                formal-name="Party (organization or person)">
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
   <xsl:template match="j:map[@key='responsible-parties']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  responsible-party" -->
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
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='import-profile']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  import-profile" -->
      <assembly name="import-profile"
                gi="import-profile"
                formal-name="Import Profile">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-profile</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-characteristics']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  system-characteristics" -->
      <assembly name="system-characteristics"
                gi="system-characteristics"
                formal-name="System Characteristics">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-characteristics</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='system-ids']"/>
         <xsl:apply-templates select="*[@key='system-name']"/>
         <xsl:apply-templates select="*[@key='system-name-short']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='date-authorized']"/>
         <xsl:apply-templates select="*[@key='security-sensitivity-level']"/>
         <xsl:apply-templates select="*[@key='system-information']"/>
         <xsl:apply-templates select="*[@key='security-impact-level']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='authorization-boundary']"/>
         <xsl:apply-templates select="*[@key='network-architecture']"/>
         <xsl:apply-templates select="*[@key='data-flow']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-information']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  system-information" -->
      <assembly name="system-information"
                gi="system-information"
                formal-name="System Information">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-information</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='information-types']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='security-impact-level']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  security-impact-level" -->
      <assembly name="security-impact-level"
                gi="security-impact-level"
                formal-name="Security Impact Level">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-impact-level</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='security-objective-confidentiality']"/>
         <xsl:apply-templates select="*[@key='security-objective-integrity']"/>
         <xsl:apply-templates select="*[@key='security-objective-availability']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='authorization-boundary']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  authorization-boundary" -->
      <assembly name="authorization-boundary"
                gi="authorization-boundary"
                formal-name="Authorization Boundary">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">authorization-boundary</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='diagrams']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='diagrams']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  diagram" -->
      <assembly name="diagram"
                gi="diagram"
                formal-name="Diagram"
                json-key-flag="uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">diagram</xsl:attribute>
         </xsl:if>
         <flag as-type="uuid"
               name="uuid"
               key="uuid"
               gi="uuid"
               formal-name="Diagram ID">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='caption']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='network-architecture']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  network-architecture" -->
      <assembly name="network-architecture"
                gi="network-architecture"
                formal-name="Network Architecture">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">network-architecture</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='diagrams']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='data-flow']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  data-flow" -->
      <assembly name="data-flow" gi="data-flow" formal-name="Data Flow">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">data-flow</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='diagrams']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-implementation']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  system-implementation" -->
      <assembly name="system-implementation"
                gi="system-implementation"
                formal-name="System Implementation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-implementation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='leveraged-authorizations']"/>
         <xsl:apply-templates select="*[@key='users']"/>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='users']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  user" -->
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
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='role-ids']"/>
         <xsl:apply-templates select="*[@key='authorized-privileges']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='authorized-privileges']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  authorized-privilege" -->
      <assembly name="authorized-privilege"
                gi="authorized-privilege"
                formal-name="Privilege">
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='functions-performed']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  component" -->
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
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='protocols']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  responsible-role" -->
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
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  protocol" -->
      <assembly name="protocol"
                gi="protocol"
                formal-name="Service Protocol Information">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='port-ranges']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  port-range" -->
      <assembly as-type="empty"
                name="port-range"
                gi="port-range"
                formal-name="Port Range">
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='transport']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  inventory-item" -->
      <assembly name="inventory-item"
                gi="inventory-item"
                formal-name="Inventory Item">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='implemented-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='control-implementation']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  control-implementation" -->
      <assembly name="control-implementation"
                gi="control-implementation"
                formal-name="Control Implementation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-implementation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='implemented-requirements']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='implemented-requirements']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  implemented-requirement" -->
      <assembly name="implemented-requirement"
                gi="implemented-requirement"
                formal-name="Control-based Requirement">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parameter-settings']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='by-components']"/>
         <xsl:apply-templates select="*[@key='statements']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='parameter-settings']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  set-parameter" -->
      <assembly name="set-parameter"
                gi="set-parameter"
                formal-name="Set Parameter Value"
                json-key-flag="param-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">set-parameter</xsl:attribute>
         </xsl:if>
         <flag as-type="NCName"
               name="param-id"
               key="param-id"
               gi="param-id"
               scope="global"
               formal-name="Parameter ID">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='param-id']"/>
         <xsl:apply-templates select="*[@key='values']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='by-components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  by-component" -->
      <assembly name="by-component"
                gi="by-component"
                formal-name="Component Control Implementation"
                json-key-flag="component-uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">by-component</xsl:attribute>
         </xsl:if>
         <flag as-type="uuid"
               name="component-uuid"
               key="component-uuid"
               gi="component-uuid"
               formal-name="Component Universally Unique Identifier Reference">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parameter-settings']"/>
         <xsl:apply-templates select="*[@key='export']"/>
         <xsl:apply-templates select="*[@key='inherited']"/>
         <xsl:apply-templates select="*[@key='satisfied']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='statements']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  statement" -->
      <assembly name="statement"
                gi="statement"
                formal-name="Specific Control Statement"
                json-key-flag="statement-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement</xsl:attribute>
         </xsl:if>
         <flag as-type="NCName"
               name="statement-id"
               key="statement-id"
               gi="statement-id"
               scope="global"
               formal-name="Control Statement Reference">
            <xsl:value-of select="@key"/>
         </flag>
         <xsl:apply-templates select="*[@key='statement-id']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='by-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='back-matter']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  back-matter" -->
      <assembly name="back-matter" gi="back-matter" formal-name="Back matter">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">back-matter</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='resources']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:string[@key='remarks']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  remarks" -->
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
   <xsl:template match="j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:string">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  location-uuid" -->
      <field name="location-uuid"
             gi="location-uuid"
             as-type="uuid"
             formal-name="Location Reference"
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
   <xsl:template match="(j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string)">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  party-uuid" -->
      <field name="party-uuid"
             gi="party-uuid"
             as-type="uuid"
             formal-name="Party Reference"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="(j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string)"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='system-ids']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  system-id" -->
      <field name="system-id"
             gi="system-id"
             as-type="string"
             formal-name="System Identification">
         <xsl:apply-templates select="*[@key='identifier-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching   system-id-->
   <xsl:template match="j:array[@key='system-ids']/j:map" mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="(@key | @key | j:array[@key='role-ids']/j:string | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key)">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  role-id" -->
      <field name="role-id"
             gi="role-id"
             as-type="NCName"
             formal-name="Role Identifier Reference"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="(@key | @key | j:array[@key='role-ids']/j:string | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key | @key)"
                 mode="get-value-property"
                 priority="7">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:string">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  function-performed" -->
      <field name="function-performed"
             gi="function-performed"
             as-type="string"
             formal-name="Functions Performed"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:string"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  hash" -->
      <field name="hash" gi="hash" formal-name="Hash">
         <xsl:apply-templates select="*[@key='algorithm']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching   hash-->
   <xsl:template match="j:array[@key='hashes']/j:map" mode="get-value-property">
      <value as-type="string" key="value" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:string[@key='uuid'] | j:array[@key='props']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='uuid'] | j:map[@key='diagrams']/j:map/@key | j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:array[@key='implemented-requirements']/j:map/j:string[@key='uuid'] | j:map[@key='by-components']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='statements']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"><!-- XML match="system-security-plan/@uuid | prop/@uuid | location/@uuid | party/@uuid | system-security-plan/system-characteristics/system-information/information-type/@uuid | diagram/@uuid | system-security-plan/system-implementation/leveraged-authorization/@uuid | user/@uuid | component/@uuid | protocol/@uuid | inventory-item/@uuid | implemented-requirement/@uuid | by-component/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/inherited/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/@uuid | statement/@uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/@uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/@uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/@uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/@uuid | system-security-plan/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="System Security Plan Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:string[@key='uuid'] | j:array[@key='props']/j:map/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='uuid'] | j:map[@key='diagrams']/j:map/@key | j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:array[@key='implemented-requirements']/j:map/j:string[@key='uuid'] | j:map[@key='by-components']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='statements']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']"><!-- XML match="prop/@name" -->
      <flag in-json="string"
            as-type="NCName"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"><!-- XML match="prop/@ns" -->
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
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
            gi="value"
            formal-name="Annotated Property Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='class']"><!-- XML match="prop/@class" -->
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-profile']/j:string[@key='href'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"><!-- XML match="link/@href | import-profile/@href | system-security-plan/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-profile']/j:string[@key='href'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']"><!-- XML match="link/@rel" -->
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="link/@media-type | system-security-plan/back-matter/resource/rlink/@media-type | system-security-plan/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="system-security-plan/metadata/document-id/@scheme | system-security-plan/metadata/party/external-id/@scheme | system-security-plan/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"><!-- XML match="role/@id" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="system-security-plan/metadata/location/address/@type | system-security-plan/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="NCName"
            name="oscal-metadata-location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:array[@key='parties']/j:map/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 priority="8"><!-- XML match="system-security-plan/metadata/location/telephone-number/@type | party/@type | system-security-plan/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:array[@key='parties']/j:map/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key | j:map[@key='responsible-roles']/j:map/@key"><!-- XML match="responsible-party/@role-id | responsible-role/@role-id" -->
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
   <xsl:template match="j:array[@key='system-ids']/j:map/j:string[@key='identifier-type']"><!-- XML match="system-id/@identifier-type" -->
      <flag in-json="string"
            as-type="uri"
            name="identifier-type"
            key="identifier-type"
            gi="identifier-type"
            formal-name="Identification System Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='system-ids']/j:map/j:string[@key='identifier-type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:string[@key='system']"
                 priority="9"><!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="Information Type Identification System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='status']/j:string[@key='state']"
                 priority="5"><!-- XML match="system-security-plan/system-characteristics/status/@state" -->
      <flag in-json="string"
            as-type="string"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='components']/j:map/j:string[@key='type']"><!-- XML match="component/@type" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="7"><!-- XML match="system-security-plan/system-implementation/component/status/@state" -->
      <flag in-json="string"
            as-type="NCName"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"><!-- XML match="protocol/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name"
            formal-name="Protocol Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"><!-- XML match="port-range/@start" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="start"
            key="start"
            gi="start"
            formal-name="Start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"><!-- XML match="port-range/@end" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="end"
            key="end"
            gi="end"
            formal-name="End">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"><!-- XML match="port-range/@transport" -->
      <flag in-json="string"
            as-type="NCName"
            name="transport"
            key="transport"
            gi="transport"
            formal-name="Transport">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid'] | j:map[@key='by-components']/j:map/@key"
                 priority="8"><!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/@component-uuid | by-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid"
            formal-name="Component Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid'] | j:map[@key='by-components']/j:map/@key"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='implemented-requirements']/j:map/j:string[@key='control-id']"><!-- XML match="implemented-requirement/@control-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="control-id"
            key="control-id"
            gi="control-id"
            formal-name="Control Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='implemented-requirements']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='parameter-settings']/j:map/@key"><!-- XML match="set-parameter/@param-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="param-id"
            key="param-id"
            gi="param-id"
            formal-name="Parameter ID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='parameter-settings']/j:map/@key"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/@provided-uuid | system-security-plan/control-implementation/implemented-requirement/by-component/inherited/@provided-uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/@provided-uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/@provided-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="oscal-ssp-provided-uuid"
            key="provided-uuid"
            gi="provided-uuid"
            formal-name="Provided UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/@responsibility-uuid | system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/@responsibility-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="oscal-ssp-responsibility-uuid"
            key="responsibility-uuid"
            gi="responsibility-uuid"
            formal-name="Provided UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='statements']/j:map/@key"><!-- XML match="statement/@statement-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="statement-id"
            key="statement-id"
            gi="statement-id"
            formal-name="Control Statement Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='statements']/j:map/@key"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"><!-- XML match="hash/@algorithm" -->
      <flag in-json="string"
            as-type="string"
            name="algorithm"
            key="algorithm"
            gi="algorithm"
            formal-name="Hash algorithm">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- XML match="system-security-plan/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/published" -->
      <field name="oscal-metadata-published"
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/last-modified" -->
      <field name="oscal-metadata-last-modified"
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/version" -->
      <field name="oscal-metadata-version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/oscal-version" -->
      <field name="oscal-metadata-oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision" -->
      <assembly name="oscal-metadata-revision"
                gi="revision"
                formal-name="Revision History Entry">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions" -->
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/published" -->
      <field name="oscal-metadata-published"
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/last-modified" -->
      <field name="oscal-metadata-last-modified"
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/version" -->
      <field name="oscal-metadata-version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/oscal-version" -->
      <field name="oscal-metadata-oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/document-id" -->
      <field name="oscal-metadata-document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-security-plan/metadata/document-id-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Role Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address" -->
      <assembly name="oscal-metadata-address" gi="address" formal-name="Address">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/addr-line" -->
      <field name="oscal-metadata-addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/country" -->
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/email-address" -->
      <field name="oscal-metadata-email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/telephone-number" -->
      <field name="oscal-metadata-telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-security-plan/metadata/location/telephone-number-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/url" -->
      <field name="url"
             gi="url"
             as-type="uri"
             formal-name="Location URL"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/name" -->
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/external-id" -->
      <field name="external-id"
             gi="external-id"
             formal-name="Party External Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-security-plan/metadata/party/external-id-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/email-address" -->
      <field name="oscal-metadata-email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/telephone-number" -->
      <field name="oscal-metadata-telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-security-plan/metadata/party/telephone-number-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address" -->
      <assembly name="oscal-metadata-address" gi="address" formal-name="Address">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/addr-line" -->
      <field name="oscal-metadata-addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/country" -->
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/member-of-organization" -->
      <field name="member-of-organization"
             gi="member-of-organization"
             as-type="uuid"
             formal-name="Organizational Affiliation"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='system-name']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-name" -->
      <field name="system-name"
             gi="system-name"
             as-type="string"
             formal-name="System Name - Full"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='system-name']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='system-name-short']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-name-short" -->
      <field name="system-name-short"
             gi="system-name-short"
             as-type="string"
             formal-name="System Name - Short"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-name-short</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='system-name-short']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='description']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="System Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='date-authorized']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/date-authorized" -->
      <field name="oscal-ssp-date-authorized"
             gi="date-authorized"
             as-type="date"
             formal-name="System Authorization Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">date-authorized</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='date-authorized']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="date" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='security-sensitivity-level']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-sensitivity-level" -->
      <field name="security-sensitivity-level"
             gi="security-sensitivity-level"
             formal-name="Security Sensitivity Level"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-sensitivity-level</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:string[@key='security-sensitivity-level']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type" -->
      <assembly name="information-type"
                gi="information-type"
                formal-name="Information Type">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='categorizations']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='confidentiality-impact']"/>
         <xsl:apply-templates select="*[@key='integrity-impact']"/>
         <xsl:apply-templates select="*[@key='availability-impact']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Information Type Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization" -->
      <assembly name="categorization"
                gi="categorization"
                formal-name="Information Type Categorization">
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='information-type-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:array[@key='information-type-ids']/j:string"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization/information-type-id" -->
      <field name="information-type-id"
             gi="information-type-id"
             as-type="string"
             formal-name="Information Type Systemized Identifier"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:array[@key='information-type-ids']/j:string"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact" -->
      <assembly name="confidentiality-impact"
                gi="confidentiality-impact"
                formal-name="Confidentiality Impact Level">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">confidentiality-impact</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='base']"/>
         <xsl:apply-templates select="*[@key='selected']"/>
         <xsl:apply-templates select="*[@key='adjustment-justification']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/base" -->
      <field name="oscal-ssp-base"
             gi="base"
             as-type="string"
             formal-name="Base Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/selected" -->
      <field name="oscal-ssp-selected"
             gi="selected"
             as-type="string"
             formal-name="Selected Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/adjustment-justification" -->
      <field name="oscal-ssp-adjustment-justification"
             gi="adjustment-justification"
             as-type="markup-multiline"
             formal-name="Adjustment Justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:string[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact" -->
      <assembly name="integrity-impact"
                gi="integrity-impact"
                formal-name="Integrity Impact Level">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">integrity-impact</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='base']"/>
         <xsl:apply-templates select="*[@key='selected']"/>
         <xsl:apply-templates select="*[@key='adjustment-justification']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/base" -->
      <field name="oscal-ssp-base"
             gi="base"
             as-type="string"
             formal-name="Base Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/selected" -->
      <field name="oscal-ssp-selected"
             gi="selected"
             as-type="string"
             formal-name="Selected Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/adjustment-justification" -->
      <field name="oscal-ssp-adjustment-justification"
             gi="adjustment-justification"
             as-type="markup-multiline"
             formal-name="Adjustment Justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:string[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact" -->
      <assembly name="availability-impact"
                gi="availability-impact"
                formal-name="Availability Impact Level">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">availability-impact</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='base']"/>
         <xsl:apply-templates select="*[@key='selected']"/>
         <xsl:apply-templates select="*[@key='adjustment-justification']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/base" -->
      <field name="oscal-ssp-base"
             gi="base"
             as-type="string"
             formal-name="Base Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/selected" -->
      <field name="oscal-ssp-selected"
             gi="selected"
             as-type="string"
             formal-name="Selected Level (Confidentiality, Integrity, or Availability)"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/adjustment-justification" -->
      <field name="oscal-ssp-adjustment-justification"
             gi="adjustment-justification"
             as-type="markup-multiline"
             formal-name="Adjustment Justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:string[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-confidentiality']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-confidentiality" -->
      <field name="security-objective-confidentiality"
             gi="security-objective-confidentiality"
             as-type="string"
             formal-name="Security Objective: Confidentiality"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-confidentiality</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-confidentiality']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-integrity']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-integrity" -->
      <field name="security-objective-integrity"
             gi="security-objective-integrity"
             as-type="string"
             formal-name="Security Objective: Integrity"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-integrity</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-integrity']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-availability']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-availability" -->
      <field name="security-objective-availability"
             gi="security-objective-availability"
             as-type="string"
             formal-name="Security Objective: Availability"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-availability</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:string[@key='security-objective-availability']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='status']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/status" -->
      <assembly name="oscal-ssp-status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Authorization Boundary Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Diagram Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/caption" -->
      <field name="caption"
             gi="caption"
             as-type="markup-line"
             formal-name="Caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/remarks" -->
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="remarks field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:string[@key='remarks']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/remarks" -->
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="remarks field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Network Architecture Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Diagram Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/caption" -->
      <field name="caption"
             gi="caption"
             as-type="markup-line"
             formal-name="Caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/remarks" -->
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="remarks field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Data Flow Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Diagram Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/caption" -->
      <field name="caption"
             gi="caption"
             as-type="markup-line"
             formal-name="Caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/remarks" -->
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="remarks field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:map[@key='diagrams']/j:map/j:string[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization" -->
      <assembly name="leveraged-authorization"
                gi="leveraged-authorization"
                formal-name="Leveraged Authorization">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='party-uuid']"/>
         <xsl:apply-templates select="*[@key='date-authorized']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='party-uuid']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/party-uuid" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='party-uuid']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='date-authorized']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/date-authorized" -->
      <field name="oscal-ssp-date-authorized"
             gi="date-authorized"
             as-type="date"
             formal-name="System Authorization Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">date-authorized</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='date-authorized']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="date" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/short-name" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/description" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/authorized-privilege/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Privilege Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/authorized-privilege/description" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/description" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/purpose" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/protocol/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Protocol Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/description" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component" -->
      <assembly name="implemented-component"
                gi="implemented-component"
                formal-name="Implemented Component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:string[@key='description']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/set-parameter/value" -->
      <field name="parameter-value"
             gi="value"
             as-type="string"
             formal-name="Parameter Value"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/set-parameter/value" -->
      <field name="parameter-value"
             gi="value"
             as-type="string"
             formal-name="Parameter Value"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 mode="get-value-property"
                 priority="11">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export" -->
      <assembly name="export" gi="export" formal-name="Export">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">export</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='provided']"/>
         <xsl:apply-templates select="*[@key='responsibilities']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Export Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided" -->
      <assembly name="provided"
                gi="provided"
                formal-name="Provided Control Implementation">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Provided Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility" -->
      <assembly name="responsibility"
                gi="responsibility"
                formal-name="Control Implementation Responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Responsibility Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited" -->
      <assembly name="inherited"
                gi="inherited"
                formal-name="Inherited Control Implementation">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Inherited Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied" -->
      <assembly name="satisfied"
                gi="satisfied"
                formal-name="Satisfied Control Implementation Responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='responsibility-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Satisfied Control Implementation Responsibility Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/set-parameter/value" -->
      <field name="parameter-value"
             gi="value"
             as-type="string"
             formal-name="Parameter Value"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='parameter-settings']/j:map/j:array[@key='values']/j:string"
                 mode="get-value-property"
                 priority="13">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export" -->
      <assembly name="export" gi="export" formal-name="Export">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">export</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='provided']"/>
         <xsl:apply-templates select="*[@key='responsibilities']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Export Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided" -->
      <assembly name="provided"
                gi="provided"
                formal-name="Provided Control Implementation">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Provided Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility" -->
      <assembly name="responsibility"
                gi="responsibility"
                formal-name="Control Implementation Responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Implementation Responsibility Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited" -->
      <assembly name="inherited"
                gi="inherited"
                formal-name="Inherited Control Implementation">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Inherited Control Implementation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied" -->
      <assembly name="satisfied"
                gi="satisfied"
                formal-name="Satisfied Control Implementation Responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='responsibility-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Satisfied Control Implementation Responsibility Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:map[@key='statements']/j:map/j:map[@key='by-components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource" -->
      <assembly name="resource" gi="resource" formal-name="Resource">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Resource Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/document-id" -->
      <field name="oscal-metadata-document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-security-plan/back-matter/resource/document-id-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/citation" -->
      <assembly name="citation" gi="citation" formal-name="Citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='biblio']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:map[@key='biblio']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/citation/biblio" -->
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/base64" -->
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
   <!-- matching system-security-plan/back-matter/resource/base64-->
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
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
         <insert param-id="\{{\{{{{$nws}}\}}\}}"/>
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
   <xsl:template match="@*[matches(., '\{\$nws\}')]" mode="write-match">
        <!--<xsl:value-of select="."/>-->
        <!--<xsl:value-of select="replace(., '\{\$nws\}', '(\S*)?')"/>-->
      <xsl:value-of select="replace(., '\{\$nws\}', '\\s*(\\S+)?\\s*')"/>
   </xsl:template>
   <xsl:template match="text" mode="write-replace">
      <xsl:text>$1</xsl:text>
   </xsl:template>
   <xsl:template match="insert/@param-id" mode="write-replace">
      <xsl:text> param-id='$1'</xsl:text>
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
   <xsl:template match="text" mode="write-match">
      <xsl:text>(.*?)</xsl:text>
   </xsl:template>
   <xsl:template match="text[@not]" mode="write-match">
      <xsl:text expand-text="true">([^{ @not }]*?)</xsl:text>
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
