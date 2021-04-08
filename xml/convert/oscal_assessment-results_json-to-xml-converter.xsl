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
   <!-- METASCHEMA: OSCAL Assessment Results Model (version 1.0.0-rc2) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="j:map[@key='assessment-results']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  assessment-results" -->
      <assembly name="assessment-results"
                gi="assessment-results"
                formal-name="Security Assessment Results (SAR)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-results</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='import-ap']"/>
         <xsl:apply-templates select="*[@key='local-definitions']"/>
         <xsl:apply-templates select="*[@key='results']"/>
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)">
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
   <xsl:template match="j:map[@key='import-ap']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  import-ap" -->
      <assembly name="import-ap"
                gi="import-ap"
                formal-name="Import Assessment Plan">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ap</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  objectives-and-methods" -->
      <assembly name="local-objective"
                gi="objectives-and-methods"
                formal-name="Assessment-Specific Control Objective">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map/j:array[@key='parts']/j:map | j:array[@key='objectives-and-methods']/j:map/j:array[@key='parts']/j:map//j:array[@key='parts']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match=" objectives-and-methods/ part |  objectives-and-methods/ part//part" -->
      <assembly name="part" gi="part" formal-name="Part">
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
   <xsl:template match="j:array[@key='attestations']/j:map/j:array[@key='parts']/j:map | j:array[@key='attestations']/j:map/j:array[@key='parts']/j:map//j:array[@key='parts']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match=" attestation/ part |  attestation/ part//part" -->
      <assembly name="assessment-part" gi="part" formal-name="Assessment Part">
         <xsl:apply-templates select="*[@key='uuid']"/>
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
   <xsl:template match="j:array[@key='activities']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  activity" -->
      <assembly name="activity" gi="activity" formal-name="Activity">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='actions']"/>
         <xsl:apply-templates select="*[@key='related-controls']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='reviewed-controls']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  reviewed-controls" -->
      <assembly name="reviewed-controls"
                gi="reviewed-controls"
                formal-name="Reviewed Controls and Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">reviewed-controls</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='control-selections']"/>
         <xsl:apply-templates select="*[@key='control-objective-selections']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  include-objective" -->
      <assembly as-type="empty"
                name="select-objective-by-id"
                gi="include-objective"
                formal-name="Select Objective">
         <xsl:apply-templates select="*[@key='objective-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='exclude-objectives']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  exclude-objective" -->
      <assembly as-type="empty"
                name="select-objective-by-id"
                gi="exclude-objective"
                formal-name="Select Objective">
         <xsl:apply-templates select="*[@key='objective-id']"/>
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
   <xsl:template match="j:map[@key='related-controls']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  related-controls" -->
      <assembly name="reviewed-controls"
                gi="related-controls"
                formal-name="Reviewed Controls and Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">related-controls</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='control-selections']"/>
         <xsl:apply-templates select="*[@key='control-objective-selections']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='results']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  result" -->
      <assembly name="result" gi="result" formal-name="Assessment Result">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='prop']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='local-definitions']"/>
         <xsl:apply-templates select="*[@key='reviewed-controls']"/>
         <xsl:apply-templates select="*[@key='attestations']"/>
         <xsl:apply-templates select="*[@key='assessment-log']"/>
         <xsl:apply-templates select="*[@key='observations']"/>
         <xsl:apply-templates select="*[@key='risks']"/>
         <xsl:apply-templates select="*[@key='findings']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
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
   <xsl:template match="j:map[@key='assessment-assets']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  assessment-assets" -->
      <assembly name="assessment-assets"
                gi="assessment-assets"
                formal-name="Assessment Assets">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-assets</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='assessment-platforms']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='assessment-actions']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  assessment-action" -->
      <assembly name="action" gi="assessment-action" formal-name="Action">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  logged-by" -->
      <assembly as-type="empty"
                name="logged-by"
                gi="logged-by"
                formal-name="Logged By">
         <xsl:apply-templates select="*[@key='party-uuid']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  related-task" -->
      <assembly name="related-task" gi="related-task" formal-name="Task Reference">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='identified-subject']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  subject" -->
      <assembly name="assessment-subject"
                gi="subject"
                formal-name="Subject of Assessment">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-subjects']"/>
         <xsl:apply-templates select="*[@key='exclude-subjects']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  include-subject" -->
      <assembly name="select-subject-by-id"
                gi="include-subject"
                formal-name="Select Assessment Subject">
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='exclude-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  exclude-subject" -->
      <assembly name="select-subject-by-id"
                gi="exclude-subject"
                formal-name="Select Assessment Subject">
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  observation" -->
      <assembly name="observation" gi="observation" formal-name="Observation">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='methods']"/>
         <xsl:apply-templates select="*[@key='types']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='relevant-evidence']"/>
         <xsl:apply-templates select="*[@key='collected']"/>
         <xsl:apply-templates select="*[@key='expires']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="(j:array[@key='origins']/j:map | j:array[@key='origins']/j:map | j:map[@key='origin'] | j:array[@key='origins']/j:map | j:array[@key='origins']/j:map)">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  origin" -->
      <assembly name="origin" gi="origin" formal-name="Origin">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">origin</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='actors']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  actor" -->
      <assembly name="origin-actor" gi="actor" formal-name="Originating Actor">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  risk" -->
      <assembly name="risk" gi="risk" formal-name="Identified Risk">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='statement']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='threat-ids']"/>
         <xsl:apply-templates select="*[@key='characterizations']"/>
         <xsl:apply-templates select="*[@key='mitigating-factors']"/>
         <xsl:apply-templates select="*[@key='deadline']"/>
         <xsl:apply-templates select="*[@key='remediations']"/>
         <xsl:apply-templates select="*[@key='risk-log']"/>
         <xsl:apply-templates select="*[@key='related-observations']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='characterizations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  characterization" -->
      <assembly name="characterization"
                gi="characterization"
                formal-name="Characterization">
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origin']"/>
         <xsl:apply-templates select="*[@key='facets']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map | j:array[@key='tasks']/j:map//j:array[@key='tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  task |   task//task" -->
      <assembly name="task" gi="task" formal-name="Task">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='timing']"/>
         <xsl:apply-templates select="*[@key='dependencies']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
         <xsl:apply-templates select="*[@key='associated-activities']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='subject-placeholder']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  subject-placeholder" -->
      <assembly name="assessment-subject-placeholder"
                gi="subject-placeholder"
                formal-name="Assessment Subject Placeholder">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">subject-placeholder</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='sources']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='findings']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  finding" -->
      <assembly name="finding" gi="finding" formal-name="Finding">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='target']"/>
         <xsl:apply-templates select="*[@key='implementation-statement-uuid']"/>
         <xsl:apply-templates select="*[@key='related-observations']"/>
         <xsl:apply-templates select="*[@key='related-risks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='target']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  target" -->
      <assembly name="finding-target" gi="target" formal-name="Objective Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">target</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='id-ref']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='implementation-status']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='implementation-status']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  implementation-status" -->
      <assembly name="implementation-status"
                gi="implementation-status"
                formal-name="Implementation Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implementation-status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
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
   <xsl:template match="(j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string)">
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
   <xsl:template match="(j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j:string | j:array[@key='party-uuids']/j:string)"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="(@key | @key | @key | @key | @key | @key | j:array[@key='role-ids']/j:string | @key | @key | @key | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | @key | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key)">
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
   <xsl:template match="(@key | @key | @key | @key | @key | @key | j:array[@key='role-ids']/j:string | @key | @key | @key | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key | @key | @key | j:string[@key='role-id'] | @key | j:string[@key='role-id'] | @key)"
                 mode="get-value-property"
                 priority="9">
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
                 priority="11">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  threat-id" -->
      <field name="threat-id"
             gi="threat-id"
             as-type="uri"
             formal-name="Threat ID">
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching   threat-id-->
   <xsl:template match="j:array[@key='threat-ids']/j:map" mode="get-value-property">
      <value as-type="uri" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:string[@key='status-change']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="  status-change" -->
      <field name="risk-status"
             gi="status-change"
             as-type="NCName"
             formal-name="Risk Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status-change</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:string[@key='status-change']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="NCName" in-json="string">
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
   <xsl:template match="j:map[@key='assessment-results']/j:string[@key='uuid'] | (j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:array[@key='activities']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='uuid'] | j:array[@key='results']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='uuid'] | j:array[@key='assessment-actions']/j:map/j:string[@key='uuid'] | j:array[@key='parts']/j:map/j:string[@key='uuid'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()| j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='uuid'] | j:array[@key='observations']/j:map/j:string[@key='uuid'] | j:array[@key='risks']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map//j:array[@key='tasks']/j:map/()| j:map[@key='subject-placeholder']/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid'] | j:array[@key='findings']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"><!-- XML match="assessment-results/@uuid | prop/@uuid | location/@uuid | party/@uuid | activity/@uuid | assessment-results/local-definitions/activity/step/@uuid | result/@uuid | component/@uuid | protocol/@uuid | inventory-item/@uuid | user/@uuid | assessment-results/result/local-definitions/assessment-assets/assessment-platform/@uuid | assessment-action/@uuid | part/@uuid | part//part/@uuid | assessment-results/result/assessment-log/entry/@uuid | observation/@uuid | risk/@uuid | assessment-results/result/risk/mitigating-factor/@uuid | assessment-results/result/risk/response/@uuid | assessment-results/result/risk/response/required-asset/@uuid | task/@uuid | task//task/@uuid | subject-placeholder/@uuid | assessment-results/result/risk/risk-log/entry/@uuid | finding/@uuid | assessment-results/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Assessment Results Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:string[@key='uuid'] | (j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='uuid'] | j:array[@key='locations']/j:map/j:string[@key='uuid'] | j:array[@key='parties']/j:map/j:string[@key='uuid'] | j:array[@key='activities']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='uuid'] | j:array[@key='results']/j:map/j:string[@key='uuid'] | j:map[@key='components']/j:map/@key | j:array[@key='protocols']/j:map/j:string[@key='uuid'] | j:array[@key='inventory-items']/j:map/j:string[@key='uuid'] | j:map[@key='users']/j:map/@key | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='uuid'] | j:array[@key='assessment-actions']/j:map/j:string[@key='uuid'] | j:array[@key='parts']/j:map/j:string[@key='uuid'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()| j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='uuid'] | j:array[@key='observations']/j:map/j:string[@key='uuid'] | j:array[@key='risks']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map//j:array[@key='tasks']/j:map/()| j:map[@key='subject-placeholder']/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid'] | j:array[@key='findings']/j:map/j:string[@key='uuid'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='name'] | j:array[@key='parts']/j:map/j:string[@key='name'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()| j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"><!-- XML match="prop/@name | part/@name | part//part/@name | assessment-results/result/risk/characterization/facet/@name" -->
      <flag in-json="string"
            as-type="NCName"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='name'] | j:array[@key='parts']/j:map/j:string[@key='name'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()| j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='ns'] | j:array[@key='parts']/j:map/j:string[@key='ns'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"><!-- XML match="prop/@ns | part/@ns | part//part/@ns" -->
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='ns'] | j:array[@key='parts']/j:map/j:string[@key='ns'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='value'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"><!-- XML match="prop/@value | assessment-results/result/risk/characterization/facet/@value" -->
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value"
            formal-name="Property Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='value'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='class'] | j:array[@key='parts']/j:map/j:string[@key='class'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"><!-- XML match="prop/@class | part/@class | part//part/@class" -->
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='class'] | j:array[@key='parts']/j:map/j:string[@key='class'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ap']/j:string[@key='href'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href'] | j:array[@key='threat-ids']/j:map/j:string[@key='href'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"><!-- XML match="link/@href | import-ap/@href | assessment-results/result/observation/relevant-evidence/@href | threat-id/@href | assessment-results/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href'] | j:map[@key='import-ap']/j:string[@key='href'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href'] | j:array[@key='threat-ids']/j:map/j:string[@key='href'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="link/@media-type | assessment-results/back-matter/resource/rlink/@media-type | assessment-results/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="assessment-results/metadata/document-id/@scheme | assessment-results/metadata/party/external-id/@scheme | assessment-results/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"><!-- XML match="role/@id | part/@id | part//part/@id" -->
      <flag in-json="string"
            as-type="NCName"
            name="id"
            key="id"
            gi="id"
            formal-name="Role Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map/j:string[@key='id'] | j:array[@key='parts']/j:map//j:array[@key='parts']/j:map/()"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="assessment-results/metadata/location/address/@type | assessment-results/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="NCName"
            name="oscal-metadata-location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:array[@key='parties']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='target']/j:string[@key='type']"
                 priority="8"><!-- XML match="assessment-results/metadata/location/telephone-number/@type | party/@type | assessment-results/metadata/party/telephone-number/@type | target/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:array[@key='parties']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='target']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key | j:map[@key='responsible-roles']/j:map/@key | j:array[@key='logged-by']/j:map/j:string[@key='role-id'] | j:array[@key='actors']/j:map/j:string[@key='role-id']"><!-- XML match="responsible-party/@role-id | responsible-role/@role-id | logged-by/@role-id | actor/@role-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Responsible Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='responsible-parties']/j:map/@key | j:map[@key='responsible-roles']/j:map/@key | j:array[@key='logged-by']/j:map/j:string[@key='role-id'] | j:array[@key='actors']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"><!-- XML match="objectives-and-methods/@control-id | assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/@control-id | assessment-results/result/reviewed-controls/control-selection/include-control/@control-id | assessment-results/result/reviewed-controls/control-selection/exclude-control/@control-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="control-id"
            key="control-id"
            gi="control-id"
            formal-name="Control Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map/j:string[@key='objective-id']"><!-- XML match="include-objective/@objective-id | exclude-objective/@objective-id" -->
      <flag in-json="string"
            as-type="NCName"
            name="oscal-assessment-common-objective-id"
            key="objective-id"
            gi="objective-id"
            formal-name="Objective ID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map/j:string[@key='objective-id']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='implementation-status']/j:string[@key='state']"
                 priority="9"><!-- XML match="assessment-results/result/local-definitions/component/status/@state | assessment-results/result/local-definitions/assessment-assets/component/status/@state | implementation-status/@state" -->
      <flag in-json="string"
            as-type="NCName"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='implementation-status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:string[@key='component-uuid']"
                 priority="10"><!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/@component-uuid | assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid"
            formal-name="Component Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"><!-- XML match="logged-by/@party-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="party-uuid"
            key="party-uuid"
            gi="party-uuid"
            formal-name="Party UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:array[@key='sources']/j:map/j:string[@key='task-uuid']"><!-- XML match="related-task/@task-uuid | assessment-results/result/risk/response//task/dependency/@task-uuid | assessment-results/result/risk/response//task/associated-activity/subject-placeholder/source/@task-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="task-uuid"
            key="task-uuid"
            gi="task-uuid"
            formal-name="Task Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:array[@key='sources']/j:map/j:string[@key='task-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type'] | j:array[@key='actors']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map//j:array[@key='tasks']/j:map/()"><!-- XML match="subject/@type | actor/@type | assessment-results/result/observation/subject/@type | assessment-results/result/risk/mitigating-factor/subject/@type | assessment-results/result/risk/response/required-asset/subject/@type | task/@type | task//task/@type" -->
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Subject Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type'] | j:array[@key='actors']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map//j:array[@key='tasks']/j:map/()"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='uuid-ref'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='uuid-ref'] | j:array[@key='actors']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref']"><!-- XML match="include-subject/@uuid-ref | exclude-subject/@uuid-ref | actor/@uuid-ref | assessment-results/result/observation/subject/@uuid-ref | assessment-results/result/risk/mitigating-factor/subject/@uuid-ref | assessment-results/result/risk/response/required-asset/subject/@uuid-ref" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='uuid-ref'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='uuid-ref'] | j:array[@key='actors']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='uuid-ref']"
                 mode="keep-value-property"
                 priority="15"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 priority="11"><!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/observation/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/characterization/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/response/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/finding/origin/related-task/identified-subject/@subject-placeholder-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="subject-placeholder-uuid"
            key="subject-placeholder-uuid"
            gi="subject-placeholder-uuid"
            formal-name="Assessment Subject Placeholder Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"><!-- XML match="threat-id/@system | assessment-results/result/risk/characterization/facet/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="Threat Type Identification System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/mitigating-factor/@implementation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="implementation-uuid"
            key="implementation-uuid"
            gi="implementation-uuid"
            formal-name="Implementation UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 priority="9"><!-- XML match="assessment-results/result/risk/response/@lifecycle" -->
      <flag in-json="string"
            as-type="NCName"
            name="lifecycle"
            key="lifecycle"
            gi="lifecycle"
            formal-name="Remediation Intent">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 priority="14"><!-- XML match="assessment-results/result/risk/response//task/timing/on-date/@date" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="date"
            key="date"
            gi="date"
            formal-name="On Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 priority="14"><!-- XML match="assessment-results/result/risk/response//task/timing/within-date-range/@start" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="start"
            key="start"
            gi="start"
            formal-name="Start Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 priority="14"><!-- XML match="assessment-results/result/risk/response//task/timing/within-date-range/@end" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="end"
            key="end"
            gi="end"
            formal-name="End Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 priority="14"><!-- XML match="assessment-results/result/risk/response//task/timing/at-frequency/@period" -->
      <flag in-json="number"
            as-type="positiveInteger"
            name="period"
            key="period"
            gi="period"
            formal-name="Period">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 priority="14"><!-- XML match="assessment-results/result/risk/response//task/timing/at-frequency/@unit" -->
      <flag in-json="string"
            as-type="string"
            name="unit"
            key="unit"
            gi="unit"
            formal-name="Time Unit">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 priority="13"><!-- XML match="assessment-results/result/risk/response//task/associated-activity/@activity-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-uuid"
            key="activity-uuid"
            gi="activity-uuid"
            formal-name="Activity Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 mode="keep-value-property"
                 priority="13"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 priority="12"><!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/@response-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="response-uuid"
            key="response-uuid"
            gi="response-uuid"
            formal-name="Response Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/related-observation/@observation-uuid | assessment-results/result/finding/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid"
            formal-name="Observation Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='id-ref']"><!-- XML match="target/@id-ref" -->
      <flag in-json="string"
            as-type="NCName"
            name="id-ref"
            key="id-ref"
            gi="id-ref"
            formal-name="Finding Target Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='id-ref']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/finding/associated-risk/@risk-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="risk-uuid"
            key="risk-uuid"
            gi="risk-uuid"
            formal-name="Risk Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- XML match="assessment-results/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/published" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions" -->
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/published" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/document-id" -->
      <field name="oscal-metadata-document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching assessment-results/metadata/document-id-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/addr-line" -->
      <field name="oscal-metadata-addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/email-address" -->
      <field name="oscal-metadata-email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/telephone-number" -->
      <field name="oscal-metadata-telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching assessment-results/metadata/location/telephone-number-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/url" -->
      <field name="url"
             gi="url"
             as-type="uri"
             formal-name="Location URL"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/name" -->
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/external-id" -->
      <field name="external-id"
             gi="external-id"
             formal-name="Party External Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching assessment-results/metadata/party/external-id-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/email-address" -->
      <field name="oscal-metadata-email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/telephone-number" -->
      <field name="oscal-metadata-telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching assessment-results/metadata/party/telephone-number-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address" -->
      <assembly name="oscal-metadata-address" gi="address" formal-name="Address">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/addr-line" -->
      <field name="oscal-metadata-addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/city" -->
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/state" -->
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/member-of-organization" -->
      <field name="member-of-organization"
             gi="member-of-organization"
             as-type="uuid"
             formal-name="Organizational Affiliation"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']"
                 priority="3">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions" -->
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='objectives-and-methods']"/>
         <xsl:apply-templates select="*[@key='activities']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods//part/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for assessment-results/local-definitions/objectives-and-methods//part-->
   <xsl:template priority="4"
                 match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:string[@key='prose']">
      <field scope="local"
             name="prose"
             key="prose"
             as-type="markup-multiline"
             formal-name="Part Text">
         <value as-type="markup-multiline" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods//part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step" -->
      <assembly name="step" gi="step" formal-name="Action">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='reviewed-controls']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="15">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="14">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="13">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="12">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Results Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Results Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='start']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/start" -->
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="start field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='end']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/end" -->
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="end field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions" -->
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='users']"/>
         <xsl:apply-templates select="*[@key='assessment-assets']"/>
         <xsl:apply-templates select="*[@key='assessment-actions']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/authorized-privilege/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/authorized-privilege/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:map[@key='status']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/status" -->
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:map[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform" -->
      <assembly name="assessment-platform"
                gi="assessment-platform"
                formal-name="Assessment Platform">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='uses-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Assessment Platform Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component" -->
      <assembly name="uses-component"
                gi="uses-component"
                formal-name="Uses Component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-action/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-action/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-action/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-action/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='assessment-actions']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection" -->
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="12">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/exclude-control" -->
      <assembly name="oscal-assessment-common-select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:string"
                 mode="get-value-property"
                 priority="11">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection" -->
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation" -->
      <assembly name="attestation"
                gi="attestation"
                formal-name="Attestation Statements">
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation//part/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <!-- matching markup-multiline value for assessment-results/result/attestation//part-->
   <xsl:template priority="4"
                 match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:string[@key='prose']">
      <field scope="local"
             name="prose"
             key="prose"
             as-type="markup-multiline"
             formal-name="Part Text">
         <value as-type="markup-multiline" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation//part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log" -->
      <assembly name="assessment-log"
                gi="assessment-log"
                formal-name="Assessment Log">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-log</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='entries']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry" -->
      <assembly name="entry" gi="entry" formal-name="Assessment Log Entry">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='logged-by']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/start" -->
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/end" -->
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="End"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Observation Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/method" -->
      <field name="method"
             gi="method"
             formal-name="Observation Method"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='types']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/type" -->
      <field name="type"
             gi="type"
             as-type="NCName"
             formal-name="Observation Type"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='types']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject" -->
      <assembly name="oscal-assessment-common-subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence" -->
      <assembly name="relevant-evidence"
                gi="relevant-evidence"
                formal-name="Relevant Evidence">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='collected']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/collected" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='collected']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='expires']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/expires" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:string[@key='expires']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/statement" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='status']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/status" -->
      <field name="status"
             gi="status"
             as-type="NCName"
             formal-name="Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='status']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/facet" -->
      <assembly name="facet" gi="facet" formal-name="Facet">
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/facet/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor" -->
      <assembly name="mitigating-factor"
                gi="mitigating-factor"
                formal-name="Mitigating Factor">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='implementation-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject" -->
      <assembly name="oscal-assessment-common-subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='deadline']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/deadline" -->
      <field name="deadline"
             gi="deadline"
             as-type="dateTime-with-timezone"
             formal-name="Risk Resolution Deadline"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">deadline</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:string[@key='deadline']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response" -->
      <assembly name="oscal-assessment-common-response"
                gi="response"
                formal-name="Risk Response">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='lifecycle']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='required-assets']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Response Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Response Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset" -->
      <assembly name="required-asset"
                gi="required-asset"
                formal-name="Required Asset">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/subject" -->
      <assembly name="oscal-assessment-common-subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="*[@key='uuid-ref']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/subject/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/timing" -->
      <assembly name="timing" gi="timing" formal-name="Event Timing">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">timing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='on-date']"/>
         <xsl:apply-templates select="*[@key='within-date-range']"/>
         <xsl:apply-templates select="*[@key='at-frequency']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/timing/on-date" -->
      <assembly as-type="empty"
                name="on-date"
                gi="on-date"
                formal-name="On Date Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">on-date</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='date']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/timing/within-date-range" -->
      <assembly as-type="empty"
                name="within-date-range"
                gi="within-date-range"
                formal-name="On Date Range Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">within-date-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/timing/at-frequency" -->
      <assembly as-type="empty"
                name="at-frequency"
                gi="at-frequency"
                formal-name="Frequency Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">at-frequency</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='period']"/>
         <xsl:apply-templates select="*[@key='unit']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/dependency" -->
      <assembly name="dependency" gi="dependency" formal-name="Task Dependency">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity" -->
      <assembly name="associated-activity"
                gi="associated-activity"
                formal-name="Associated Activity">
         <xsl:apply-templates select="*[@key='activity-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='subject-placeholder']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:string[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject-placeholder/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:array[@key='sources']/j:map"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject-placeholder/source" -->
      <assembly as-type="empty"
                name="source"
                gi="source"
                formal-name="Assessment Subject Source">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject-placeholder/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:map[@key='subject-placeholder']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log" -->
      <assembly name="risk-log" gi="risk-log" formal-name="Risk Log">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">risk-log</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='entries']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry" -->
      <assembly name="entry" gi="entry" formal-name="Risk Log Entry">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='logged-by']"/>
         <xsl:apply-templates select="*[@key='status-change']"/>
         <xsl:apply-templates select="*[@key='related-responses']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/start" -->
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/end" -->
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="End"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response" -->
      <assembly name="related-response"
                gi="related-response"
                formal-name="Action Reference">
         <xsl:apply-templates select="*[@key='response-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="22">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="22">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/related-observation" -->
      <assembly as-type="empty"
                name="related-observation"
                gi="related-observation"
                formal-name="Related Observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Finding Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Finding Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                gi="identified-subject"
                formal-name="Identified Subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                name="include-all"
                gi="include-all"
                formal-name="All">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/title" -->
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Objective Status Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/description" -->
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Objective Status Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='status']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/status" -->
      <field name="status"
             gi="status"
             as-type="NCName"
             formal-name="Objective Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:string[@key='status']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="NCName" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='implementation-statement-uuid']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/implementation-statement-uuid" -->
      <field name="implementation-statement-uuid"
             gi="implementation-statement-uuid"
             as-type="uuid"
             formal-name="Implementation Statement UUID"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implementation-statement-uuid</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:string[@key='implementation-statement-uuid']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/related-observation" -->
      <assembly as-type="empty"
                name="related-observation"
                gi="related-observation"
                formal-name="Related Observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/associated-risk" -->
      <assembly as-type="empty"
                name="associated-risk"
                gi="associated-risk"
                formal-name="Associated Risk">
         <xsl:apply-templates select="*[@key='risk-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/document-id" -->
      <field name="oscal-metadata-document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching assessment-results/back-matter/resource/document-id-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/citation" -->
      <assembly name="citation" gi="citation" formal-name="Citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='biblio']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:map[@key='biblio']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/citation/biblio" -->
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/base64" -->
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
   <!-- matching assessment-results/back-matter/resource/base64-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
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
