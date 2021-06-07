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
   <xsl:template match="j:map[@key='system-security-plan']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan"
                name="system-security-plan"
                key="system-security-plan"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:system-security-plan"
                _using-root-name="system-security-plan"
                gi="system-security-plan">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-security-plan</xsl:attribute>
         </xsl:if>
         <xsl:if test=".. is /j:map">
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
      <!-- XML match="metadata" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/metadata"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/metadata"
                name="metadata"
                key="metadata"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:metadata"
                _step="metadata"
                _key="metadata"
                _key-ref="oscal-metadata:metadata"
                _using-name="metadata"
                _in-xml-name="metadata"
                _in-json-name="metadata"
                gi="metadata">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/revision/prop"
                _metaschema-json-id="/assembly/oscal-metadata/revision/props"
                name="property"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:property"
                _step="prop"
                _key="props"
                _key-ref="oscal-metadata:property"
                _using-name="prop"
                _in-xml-name="prop"
                _in-json-name="props"
                gi="prop">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/revision/link"
                _metaschema-json-id="/assembly/oscal-metadata/revision/links"
                name="link"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:link"
                _step="link"
                _key="links"
                _key-ref="oscal-metadata:link"
                _using-name="link"
                _in-xml-name="link"
                _in-json-name="links"
                gi="link">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='rel']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='text']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="role" -->
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/metadata/role"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/roles"
                name="role"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:role"
                _step="role"
                _key="roles"
                _key-ref="oscal-metadata:role"
                _using-name="role"
                _in-xml-name="role"
                _in-json-name="roles"
                gi="role">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/metadata/location"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/locations"
                name="location"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:location"
                _step="location"
                _key="locations"
                _key-ref="oscal-metadata:location"
                _using-name="location"
                _in-xml-name="location"
                _in-json-name="locations"
                gi="location">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/metadata/party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/parties"
                name="party"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:party"
                _step="party"
                _key="parties"
                _key-ref="oscal-metadata:party"
                _using-name="party"
                _in-xml-name="party"
                _in-json-name="parties"
                gi="party">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/metadata/responsible-party"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/responsible-parties"
                name="responsible-party"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:responsible-party"
                _step="responsible-party"
                _key="responsible-parties"
                _key-ref="oscal-metadata:responsible-party"
                _using-name="responsible-party"
                _in-xml-name="responsible-party"
                _in-json-name="responsible-parties"
                gi="responsible-party">
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='import-profile']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="import-profile" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/import-profile"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/import-profile"
                name="import-profile"
                key="import-profile"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:import-profile"
                _step="import-profile"
                _key="import-profile"
                _key-ref="oscal-ssp:import-profile"
                _using-name="import-profile"
                _in-xml-name="import-profile"
                _in-json-name="import-profile"
                gi="import-profile">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-profile</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-characteristics']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-characteristics" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/system-characteristics"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/system-characteristics"
                name="system-characteristics"
                key="system-characteristics"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:system-characteristics"
                _step="system-characteristics"
                _key="system-characteristics"
                _key-ref="oscal-ssp:system-characteristics"
                _using-name="system-characteristics"
                _in-xml-name="system-characteristics"
                _in-json-name="system-characteristics"
                gi="system-characteristics">
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
      <!-- XML match="system-information" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-information"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-information"
                name="system-information"
                key="system-information"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:system-information"
                _step="system-information"
                _key="system-information"
                _key-ref="oscal-ssp:system-information"
                _using-name="system-information"
                _in-xml-name="system-information"
                _in-json-name="system-information"
                gi="system-information">
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
      <!-- XML match="security-impact-level" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/security-impact-level"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/security-impact-level"
                name="security-impact-level"
                key="security-impact-level"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:security-impact-level"
                _step="security-impact-level"
                _key="security-impact-level"
                _key-ref="oscal-ssp:security-impact-level"
                _using-name="security-impact-level"
                _in-xml-name="security-impact-level"
                _in-json-name="security-impact-level"
                gi="security-impact-level">
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
      <!-- XML match="authorization-boundary" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/authorization-boundary"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/authorization-boundary"
                name="authorization-boundary"
                key="authorization-boundary"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:authorization-boundary"
                _step="authorization-boundary"
                _key="authorization-boundary"
                _key-ref="oscal-ssp:authorization-boundary"
                _using-name="authorization-boundary"
                _in-xml-name="authorization-boundary"
                _in-json-name="authorization-boundary"
                gi="authorization-boundary">
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
   <xsl:template match="j:array[@key='diagrams']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="diagram" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/diagram"
                _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/diagrams"
                name="diagram"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:diagram"
                _step="diagram"
                _key="diagrams"
                _key-ref="oscal-ssp:diagram"
                _using-name="diagram"
                _in-xml-name="diagram"
                _in-json-name="diagrams"
                gi="diagram">
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
      <!-- XML match="network-architecture" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/network-architecture"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/network-architecture"
                name="network-architecture"
                key="network-architecture"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:network-architecture"
                _step="network-architecture"
                _key="network-architecture"
                _key-ref="oscal-ssp:network-architecture"
                _using-name="network-architecture"
                _in-xml-name="network-architecture"
                _in-json-name="network-architecture"
                gi="network-architecture">
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
      <!-- XML match="data-flow" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/data-flow"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/data-flow"
                name="data-flow"
                key="data-flow"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:data-flow"
                _step="data-flow"
                _key="data-flow"
                _key-ref="oscal-ssp:data-flow"
                _using-name="data-flow"
                _in-xml-name="data-flow"
                _in-json-name="data-flow"
                gi="data-flow">
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
      <!-- XML match="system-implementation" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/system-implementation"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/system-implementation"
                name="system-implementation"
                key="system-implementation"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:system-implementation"
                _step="system-implementation"
                _key="system-implementation"
                _key-ref="oscal-ssp:system-implementation"
                _using-name="system-implementation"
                _in-xml-name="system-implementation"
                _in-json-name="system-implementation"
                gi="system-implementation">
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
   <xsl:template match="j:array[@key='users']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="user" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/user"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/users"
                name="system-user"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:system-user"
                _step="user"
                _key="users"
                _key-ref="oscal-implementation-common:system-user"
                _using-name="user"
                _in-xml-name="user"
                _in-json-name="users"
                gi="user">
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
      <!-- XML match="authorized-privilege" -->
      <assembly _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/authorized-privilege"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-user/authorized-privileges"
                name="authorized-privilege"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:authorized-privilege"
                _step="authorized-privilege"
                _key="authorized-privileges"
                _key-ref="oscal-implementation-common:authorized-privilege"
                _using-name="authorized-privilege"
                _in-xml-name="authorized-privilege"
                _in-json-name="authorized-privileges"
                gi="authorized-privilege">
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='functions-performed']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="component" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/component"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/components"
                name="system-component"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:system-component"
                _step="component"
                _key="components"
                _key-ref="oscal-implementation-common:system-component"
                _using-name="component"
                _in-xml-name="component"
                _in-json-name="components"
                gi="component">
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
   <xsl:template match="j:array[@key='responsible-roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="responsible-role" -->
      <assembly _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/responsible-role"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/responsible-roles"
                name="responsible-role"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:responsible-role"
                _step="responsible-role"
                _key="responsible-roles"
                _key-ref="oscal-metadata:responsible-role"
                _using-name="responsible-role"
                _in-xml-name="responsible-role"
                _in-json-name="responsible-roles"
                gi="responsible-role">
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='party-uuids']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="protocol" -->
      <assembly _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/protocol"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/protocols"
                name="protocol"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:protocol"
                _step="protocol"
                _key="protocols"
                _key-ref="oscal-implementation-common:protocol"
                _using-name="protocol"
                _in-xml-name="protocol"
                _in-json-name="protocols"
                gi="protocol">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='port-ranges']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="port-range" -->
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/port-range"
                _metaschema-json-id="/assembly/oscal-implementation-common/protocol/port-ranges"
                name="port-range"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:port-range"
                _step="port-range"
                _key="port-ranges"
                _key-ref="oscal-implementation-common:port-range"
                _using-name="port-range"
                _in-xml-name="port-range"
                _in-json-name="port-ranges"
                gi="port-range">
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='transport']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="inventory-item" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/inventory-item"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/inventory-items"
                name="inventory-item"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:inventory-item"
                _step="inventory-item"
                _key="inventory-items"
                _key-ref="oscal-implementation-common:inventory-item"
                _using-name="inventory-item"
                _in-xml-name="inventory-item"
                _in-json-name="inventory-items"
                gi="inventory-item">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='implemented-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='set-parameters']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="set-parameter" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/set-parameter"
                _metaschema-json-id="/assembly/oscal-ssp/control-implementation/set-parameters"
                name="set-parameter"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:set-parameter"
                _step="set-parameter"
                _key="set-parameters"
                _key-ref="oscal-implementation-common:set-parameter"
                _using-name="set-parameter"
                _in-xml-name="set-parameter"
                _in-json-name="set-parameters"
                gi="set-parameter">
         <xsl:apply-templates select="*[@key='param-id']"/>
         <xsl:apply-templates select="*[@key='values']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='by-components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="by-component" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/statement/by-component"
                _metaschema-json-id="/assembly/oscal-ssp/statement/by-components"
                name="by-component"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:by-component"
                _step="by-component"
                _key="by-components"
                _key-ref="oscal-ssp:by-component"
                _using-name="by-component"
                _in-xml-name="by-component"
                _in-json-name="by-components"
                gi="by-component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='set-parameters']"/>
         <xsl:apply-templates select="*[@key='implementation-status']"/>
         <xsl:apply-templates select="*[@key='export']"/>
         <xsl:apply-templates select="*[@key='inherited']"/>
         <xsl:apply-templates select="*[@key='satisfied']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='implementation-status']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="implementation-status" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/by-component/implementation-status"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/implementation-status"
                name="implementation-status"
                key="implementation-status"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
                _key-name="oscal-implementation-common:implementation-status"
                _step="implementation-status"
                _key="implementation-status"
                _key-ref="oscal-implementation-common:implementation-status"
                _using-name="implementation-status"
                _in-xml-name="implementation-status"
                _in-json-name="implementation-status"
                gi="implementation-status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implementation-status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='back-matter']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="back-matter" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/back-matter"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/back-matter"
                name="back-matter"
                key="back-matter"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:back-matter"
                _step="back-matter"
                _key="back-matter"
                _key-ref="oscal-metadata:back-matter"
                _using-name="back-matter"
                _in-xml-name="back-matter"
                _in-json-name="back-matter"
                gi="back-matter">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">back-matter</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='resources']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:[@key='remarks']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="remarks" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/property/remarks"
             _metaschema-json-id="/assembly/oscal-metadata/property/remarks"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:remarks"
             _step="remarks"
             _key="remarks"
             _key-ref="oscal-metadata:remarks"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:[@key='remarks']" mode="get-value-property" priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="location-uuid" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/party/location-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/party/location-uuids"
             collapsible="no"
             as-type="uuid"
             name="location-uuid"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:location-uuid"
             _step="location-uuid"
             _key="location-uuids"
             _key-ref="oscal-metadata:location-uuid"
             _using-name="location-uuid"
             _in-xml-name="location-uuid"
             _in-json-name="location-uuids"
             gi="location-uuid"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:array[@key='location-uuids']/j:"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="(j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j:)">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="party-uuid" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/party-uuid"
             _metaschema-json-id="/assembly/oscal-metadata/responsible-party/party-uuids"
             collapsible="no"
             as-type="uuid"
             name="party-uuid"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:party-uuid"
             _step="party-uuid"
             _key="party-uuids"
             _key-ref="oscal-metadata:party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuids"
             gi="party-uuid"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="(j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j:)"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='system-ids']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-id" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-id"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-ids"
             collapsible="no"
             as-type="string"
             name="system-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:system-id"
             _step="system-id"
             _key="system-ids"
             _key-ref="oscal-implementation-common:system-id"
             _using-name="system-id"
             _in-xml-name="system-id"
             _in-json-name="system-ids"
             gi="system-id">
         <xsl:apply-templates select="*[@key='identifier-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-id-->
   <xsl:template match="j:array[@key='system-ids']/j:map" mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="(j:string[@key='role-id'] | j:string[@key='role-id'] | j:array[@key='role-ids']/j: | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="role-id" -->
      <field _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/role-id"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/role-ids"
             collapsible="no"
             as-type="token"
             name="role-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:role-id"
             _step="role-id"
             _key="role-ids"
             _key-ref="oscal-metadata:role-id"
             _using-name="role-id"
             _in-xml-name="role-id"
             _in-json-name="role-ids"
             gi="role-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="(j:string[@key='role-id'] | j:string[@key='role-id'] | j:array[@key='role-ids']/j: | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'])"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="function-performed" -->
      <field _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/function-performed"
             _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/functions-performed"
             collapsible="no"
             as-type="string"
             name="function-performed"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:function-performed"
             _step="function-performed"
             _key="functions-performed"
             _key-ref="oscal-implementation-common:function-performed"
             _using-name="function-performed"
             _in-xml-name="function-performed"
             _in-json-name="functions-performed"
             gi="function-performed"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:array[@key='functions-performed']/j:"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="hash" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/hash"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/hashes"
             collapsible="no"
             as-type="string"
             name="hash"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:hash"
             _step="hash"
             _key="hashes"
             _key-ref="oscal-metadata:hash"
             _using-name="hash"
             _in-xml-name="hash"
             _in-json-name="hashes"
             gi="hash">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:string[@key='uuid']"><!-- XML match="system-security-plan/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']"><!-- XML match="prop/@name" -->
      <flag in-json="string"
            as-type="token"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-metadata/property/name"
            _metaschema-json-id="/assembly/oscal-metadata/property/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
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
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-metadata/property/uuid"
            _metaschema-json-id="/assembly/oscal-metadata/property/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"><!-- XML match="prop/@ns" -->
      <flag in-json="string"
            as-type="uri"
            _step="ns"
            _key="ns"
            _metaschema-xml-id="/assembly/oscal-metadata/property/ns"
            _metaschema-json-id="/assembly/oscal-metadata/property/ns"
            name="ns"
            key="ns"
            _using-name="ns"
            _in-xml-name="ns"
            _in-json-name="ns"
            gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='value']"><!-- XML match="prop/@value" -->
      <flag in-json="string"
            as-type="string"
            _step="value"
            _key="value"
            _metaschema-xml-id="/assembly/oscal-metadata/property/value"
            _metaschema-json-id="/assembly/oscal-metadata/property/value"
            name="value"
            key="value"
            _using-name="value"
            _in-xml-name="value"
            _in-json-name="value"
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
            _step="class"
            _key="class"
            _metaschema-xml-id="/assembly/oscal-metadata/property/class"
            _metaschema-json-id="/assembly/oscal-metadata/property/class"
            name="class"
            key="class"
            _using-name="class"
            _in-xml-name="class"
            _in-json-name="class"
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
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-metadata/link/href"
            _metaschema-json-id="/assembly/oscal-metadata/link/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
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
            _step="rel"
            _key="rel"
            _metaschema-xml-id="/assembly/oscal-metadata/link/rel"
            _metaschema-json-id="/assembly/oscal-metadata/link/rel"
            name="rel"
            key="rel"
            _using-name="rel"
            _in-xml-name="rel"
            _in-json-name="rel"
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
            _metaschema-xml-id="/assembly/oscal-metadata/link/media-type"
            _metaschema-json-id="/assembly/oscal-metadata/link/media-type"
            name="media-type"
            key="media-type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
            _key-name="oscal-metadata:media-type"
            _step="media-type"
            _key="media-type"
            _key-ref="oscal-metadata:media-type"
            _using-name="media-type"
            _in-xml-name="media-type"
            _in-json-name="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="system-security-plan/metadata/document-id/@scheme | system-security-plan/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            _step="scheme"
            _key="scheme"
            _metaschema-xml-id="/field/oscal-metadata/document-id/scheme"
            _metaschema-json-id="/field/oscal-metadata/document-id/scheme"
            name="scheme"
            key="scheme"
            _using-name="scheme"
            _in-xml-name="scheme"
            _in-json-name="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"><!-- XML match="role/@id" -->
      <flag in-json="string"
            as-type="token"
            _step="id"
            _key="id"
            _metaschema-xml-id="/assembly/oscal-metadata/role/id"
            _metaschema-json-id="/assembly/oscal-metadata/role/id"
            name="id"
            key="id"
            _using-name="id"
            _in-xml-name="id"
            _in-json-name="id"
            gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map/j:string[@key='uuid']"><!-- XML match="location/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-metadata/location/uuid"
            _metaschema-json-id="/assembly/oscal-metadata/location/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="system-security-plan/metadata/location/address/@type | system-security-plan/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-metadata/address/type"
            _metaschema-json-id="/assembly/oscal-metadata/address/type"
            name="location-type"
            key="type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
            _key-name="oscal-metadata:location-type"
            _step="type"
            _key="type"
            _key-ref="oscal-metadata:location-type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 priority="8"><!-- XML match="system-security-plan/metadata/location/telephone-number/@type | system-security-plan/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            _step="type"
            _key="type"
            _metaschema-xml-id="/field/oscal-metadata/telephone-number/type"
            _metaschema-json-id="/field/oscal-metadata/telephone-number/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='uuid']"><!-- XML match="party/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-metadata/party/uuid"
            _metaschema-json-id="/assembly/oscal-metadata/party/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
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
            _step="type"
            _key="type"
            _metaschema-xml-id="/assembly/oscal-metadata/party/type"
            _metaschema-json-id="/assembly/oscal-metadata/party/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 priority="8"><!-- XML match="system-security-plan/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            _step="scheme"
            _key="scheme"
            _metaschema-xml-id="/assembly/oscal-metadata/party/external-id/scheme"
            _metaschema-json-id="/assembly/oscal-metadata/party/external-ids/scheme"
            name="scheme"
            key="scheme"
            _using-name="scheme"
            _in-xml-name="scheme"
            _in-json-name="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map/j:string[@key='role-id']"><!-- XML match="responsible-party/@role-id" -->
      <flag in-json="string"
            as-type="token"
            _step="role-id"
            _key="role-id"
            _metaschema-xml-id="/assembly/oscal-metadata/responsible-party/role-id"
            _metaschema-json-id="/assembly/oscal-metadata/responsible-party/role-id"
            name="role-id"
            key="role-id"
            _using-name="role-id"
            _in-xml-name="role-id"
            _in-json-name="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='import-profile']/j:string[@key='href']"><!-- XML match="import-profile/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-ssp/import-profile/href"
            _metaschema-json-id="/assembly/oscal-ssp/import-profile/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='import-profile']/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="4"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='system-ids']/j:map/j:string[@key='identifier-type']"><!-- XML match="system-id/@identifier-type" -->
      <flag in-json="string"
            as-type="uri"
            _step="identifier-type"
            _key="identifier-type"
            _metaschema-xml-id="/field/oscal-implementation-common/system-id/identifier-type"
            _metaschema-json-id="/field/oscal-implementation-common/system-id/identifier-type"
            name="identifier-type"
            key="identifier-type"
            _using-name="identifier-type"
            _in-xml-name="identifier-type"
            _in-json-name="identifier-type"
            gi="identifier-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='system-ids']/j:map/j:string[@key='identifier-type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- XML match="system-security-plan/system-characteristics/system-information/information-type/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:string[@key='system']"
                 priority="9"><!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization/@system" -->
      <flag in-json="string"
            as-type="uri"
            _step="system"
            _key="system"
            _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization/system"
            _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations/system"
            name="system"
            key="system"
            _using-name="system"
            _in-xml-name="system"
            _in-json-name="system"
            gi="system">
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
            _step="state"
            _key="state"
            _metaschema-xml-id="/assembly/oscal-ssp/status/state"
            _metaschema-json-id="/assembly/oscal-ssp/status/state"
            name="state"
            key="state"
            _using-name="state"
            _in-xml-name="state"
            _in-json-name="state"
            gi="state">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='diagrams']/j:map/j:string[@key='uuid']"><!-- XML match="diagram/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/diagram/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/diagram/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='diagrams']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="system-security-plan/system-implementation/leveraged-authorization/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='users']/j:map/j:string[@key='uuid']"><!-- XML match="user/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/uuid"
            _metaschema-json-id="/assembly/oscal-implementation-common/system-user/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='users']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='uuid']"><!-- XML match="component/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/uuid"
            _metaschema-json-id="/assembly/oscal-implementation-common/system-component/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='type']"><!-- XML match="component/@type" -->
      <flag in-json="string"
            as-type="string"
            _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/type"
            _metaschema-json-id="/assembly/oscal-implementation-common/system-component/type"
            name="system-component-type"
            key="type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
            _key-name="oscal-implementation-common:system-component-type"
            _step="type"
            _key="type"
            _key-ref="oscal-implementation-common:system-component-type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="7"><!-- XML match="system-security-plan/system-implementation/component/status/@state" -->
      <flag in-json="string"
            as-type="token"
            _step="state"
            _key="state"
            _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/status/state"
            _metaschema-json-id="/assembly/oscal-implementation-common/system-component/status/state"
            name="state"
            key="state"
            _using-name="state"
            _in-xml-name="state"
            _in-json-name="state"
            gi="state">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='responsible-roles']/j:map/j:string[@key='role-id']"><!-- XML match="responsible-role/@role-id" -->
      <flag in-json="string"
            as-type="token"
            _step="role-id"
            _key="role-id"
            _metaschema-xml-id="/assembly/oscal-metadata/responsible-role/role-id"
            _metaschema-json-id="/assembly/oscal-metadata/responsible-role/role-id"
            name="role-id"
            key="role-id"
            _using-name="role-id"
            _in-xml-name="role-id"
            _in-json-name="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-roles']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='uuid']"><!-- XML match="protocol/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/uuid"
            _metaschema-json-id="/assembly/oscal-implementation-common/protocol/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"><!-- XML match="protocol/@name" -->
      <flag in-json="string"
            as-type="string"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/name"
            _metaschema-json-id="/assembly/oscal-implementation-common/protocol/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"><!-- XML match="port-range/@start" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            _step="start"
            _key="start"
            _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/start"
            _metaschema-json-id="/assembly/oscal-implementation-common/port-range/start"
            name="start"
            key="start"
            _using-name="start"
            _in-xml-name="start"
            _in-json-name="start"
            gi="start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"><!-- XML match="port-range/@end" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            _step="end"
            _key="end"
            _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/end"
            _metaschema-json-id="/assembly/oscal-implementation-common/port-range/end"
            name="end"
            key="end"
            _using-name="end"
            _in-xml-name="end"
            _in-json-name="end"
            gi="end">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"><!-- XML match="port-range/@transport" -->
      <flag in-json="string"
            as-type="token"
            _step="transport"
            _key="transport"
            _metaschema-xml-id="/assembly/oscal-implementation-common/port-range/transport"
            _metaschema-json-id="/assembly/oscal-implementation-common/port-range/transport"
            name="transport"
            key="transport"
            _using-name="transport"
            _in-xml-name="transport"
            _in-json-name="transport"
            gi="transport">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map/j:string[@key='uuid']"><!-- XML match="inventory-item/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/uuid"
            _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 priority="8"><!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="component-uuid"
            _key="component-uuid"
            _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component/component-uuid"
            _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components/component-uuid"
            name="component-uuid"
            key="component-uuid"
            _using-name="component-uuid"
            _in-xml-name="component-uuid"
            _in-json-name="component-uuid"
            gi="component-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='set-parameters']/j:map/j:string[@key='param-id']"><!-- XML match="set-parameter/@param-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/param-id"
            _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/param-id"
            name="param-id"
            key="param-id"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
            _key-name="oscal-implementation-common:param-id"
            _step="param-id"
            _key="param-id"
            _key-ref="oscal-implementation-common:param-id"
            _using-name="param-id"
            _in-xml-name="param-id"
            _in-json-name="param-id"
            gi="param-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='set-parameters']/j:map/j:string[@key='param-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:string[@key='control-id']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/@control-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/control-id"
            _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/control-id"
            name="control-id"
            key="control-id"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_control-common_metaschema.xml"
            _key-name="oscal-catalog-common:control-id"
            _step="control-id"
            _key="control-id"
            _key-ref="oscal-catalog-common:control-id"
            _using-name="control-id"
            _in-xml-name="control-id"
            _in-json-name="control-id"
            gi="control-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:string[@key='statement-id']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/@statement-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-ssp/statement/statement-id"
            _metaschema-json-id="/assembly/oscal-ssp/statement/statement-id"
            name="statement-id"
            key="statement-id"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
            _key-name="oscal-implementation-common:statement-id"
            _step="statement-id"
            _key="statement-id"
            _key-ref="oscal-implementation-common:statement-id"
            _using-name="statement-id"
            _in-xml-name="statement-id"
            _in-json-name="statement-id"
            gi="statement-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:string[@key='statement-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:string[@key='uuid']"
                 priority="8"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/statement/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/statement/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='by-components']/j:map/j:string[@key='component-uuid']"><!-- XML match="by-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="component-uuid"
            _key="component-uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/component-uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/component-uuid"
            name="component-uuid"
            key="component-uuid"
            _using-name="component-uuid"
            _in-xml-name="component-uuid"
            _in-json-name="component-uuid"
            gi="component-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='by-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='by-components']/j:map/j:string[@key='uuid']"><!-- XML match="by-component/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='by-components']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='implementation-status']/j:string[@key='state']"><!-- XML match="implementation-status/@state" -->
      <flag in-json="string"
            as-type="token"
            _step="state"
            _key="state"
            _metaschema-xml-id="/assembly/oscal-implementation-common/implementation-status/state"
            _metaschema-json-id="/assembly/oscal-implementation-common/implementation-status/state"
            name="state"
            key="state"
            _using-name="state"
            _in-xml-name="state"
            _in-json-name="state"
            gi="state">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='implementation-status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid']"
                 priority="13"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="13"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid']"
                 priority="13"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="13"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/@provided-uuid | system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/@provided-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/provided-uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/provided-uuid"
            name="provided-uuid"
            key="provided-uuid"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
            _key-name="oscal-ssp:provided-uuid"
            _step="provided-uuid"
            _key="provided-uuid"
            _key-ref="oscal-ssp:provided-uuid"
            _using-name="provided-uuid"
            _in-xml-name="provided-uuid"
            _in-json-name="provided-uuid"
            gi="provided-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:string[@key='provided-uuid']"
                 mode="keep-value-property"
                 priority="13"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid']"
                 priority="12"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/inherited/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/@provided-uuid | system-security-plan/control-implementation/implemented-requirement/by-component/inherited/@provided-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/provided-uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/provided-uuid"
            name="provided-uuid"
            key="provided-uuid"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
            _key-name="oscal-ssp:provided-uuid"
            _step="provided-uuid"
            _key="provided-uuid"
            _key-ref="oscal-ssp:provided-uuid"
            _using-name="provided-uuid"
            _in-xml-name="provided-uuid"
            _in-json-name="provided-uuid"
            gi="provided-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:string[@key='provided-uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid']"
                 priority="12"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/@uuid | system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid']"><!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/@responsibility-uuid | system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/@responsibility-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid"
            _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/responsibility-uuid"
            name="responsibility-uuid"
            key="responsibility-uuid"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
            _key-name="oscal-ssp:responsibility-uuid"
            _step="responsibility-uuid"
            _key="responsibility-uuid"
            _key-ref="oscal-ssp:responsibility-uuid"
            _using-name="responsibility-uuid"
            _in-xml-name="responsibility-uuid"
            _in-json-name="responsibility-uuid"
            gi="responsibility-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid'] | j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:string[@key='responsibility-uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="system-security-plan/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/uuid"
            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- XML match="system-security-plan/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/href"
            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"><!-- XML match="system-security-plan/back-matter/resource/rlink/@media-type" -->
      <flag in-json="string"
            as-type="string"
            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink/media-type"
            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks/media-type"
            name="media-type"
            key="media-type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
            _key-name="oscal-metadata:media-type"
            _step="media-type"
            _key="media-type"
            _key-ref="oscal-metadata:media-type"
            _using-name="media-type"
            _in-xml-name="media-type"
            _in-json-name="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"><!-- XML match="hash/@algorithm" -->
      <flag in-json="string"
            as-type="string"
            _step="algorithm"
            _key="algorithm"
            _metaschema-xml-id="/field/oscal-metadata/hash/algorithm"
            _metaschema-json-id="/field/oscal-metadata/hash/algorithm"
            name="algorithm"
            key="algorithm"
            _using-name="algorithm"
            _in-xml-name="algorithm"
            _in-json-name="algorithm"
            gi="algorithm">
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
            _step="filename"
            _key="filename"
            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/filename"
            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/filename"
            name="filename"
            key="filename"
            _using-name="filename"
            _in-xml-name="filename"
            _in-json-name="filename"
            gi="filename">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="system-security-plan/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64/media-type"
            _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64/media-type"
            name="media-type"
            key="media-type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
            _key-name="oscal-metadata:media-type"
            _step="media-type"
            _key="media-type"
            _key-ref="oscal-metadata:media-type"
            _using-name="media-type"
            _in-xml-name="media-type"
            _in-json-name="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-metadata/metadata/title"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/published" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/metadata/published"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/published"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="published"
             key="published"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:published"
             _step="published"
             _key="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"
             gi="published"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/last-modified" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/metadata/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/last-modified"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="last-modified"
             key="last-modified"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:last-modified"
             _step="last-modified"
             _key="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"
             gi="last-modified"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/version" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/metadata/version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/version"
             collapsible="no"
             as-type="string"
             name="version"
             key="version"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:version"
             _step="version"
             _key="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"
             gi="version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/oscal-version" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/metadata/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/oscal-version"
             collapsible="no"
             as-type="string"
             name="oscal-version"
             key="oscal-version"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:oscal-version"
             _step="oscal-version"
             _key="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"
             gi="oscal-version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision" -->
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/metadata/revisions/revision"
                _metaschema-json-id="/assembly/oscal-metadata/metadata/revisions"
                name="revision"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:revision"
                _step="revisions/revision"
                _key="revisions"
                _key-ref="oscal-metadata:revision"
                _using-name="revision"
                _in-xml-name="revision"
                _in-json-name="revisions"
                gi="revision">
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
      <group in-xml="SHOWN"
             gi="revisions"
             group-json="ARRAY"
             name="revision"
             key="revisions"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:revision"
             _key-ref="oscal-metadata:revision">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*"/>
      </group>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-metadata/revision/title"
             _metaschema-json-id="/assembly/oscal-metadata/revision/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/published" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/revision/published"
             _metaschema-json-id="/assembly/oscal-metadata/revision/published"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="published"
             key="published"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:published"
             _step="published"
             _key="published"
             _key-ref="oscal-metadata:published"
             _using-name="published"
             _in-xml-name="published"
             _in-json-name="published"
             gi="published"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/last-modified" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/revision/last-modified"
             _metaschema-json-id="/assembly/oscal-metadata/revision/last-modified"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="last-modified"
             key="last-modified"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:last-modified"
             _step="last-modified"
             _key="last-modified"
             _key-ref="oscal-metadata:last-modified"
             _using-name="last-modified"
             _in-xml-name="last-modified"
             _in-json-name="last-modified"
             gi="last-modified"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/version" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/revision/version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/version"
             collapsible="no"
             as-type="string"
             name="version"
             key="version"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:version"
             _step="version"
             _key="version"
             _key-ref="oscal-metadata:version"
             _using-name="version"
             _in-xml-name="version"
             _in-json-name="version"
             gi="version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/oscal-version" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/revision/oscal-version"
             _metaschema-json-id="/assembly/oscal-metadata/revision/oscal-version"
             collapsible="no"
             as-type="string"
             name="oscal-version"
             key="oscal-version"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:oscal-version"
             _step="oscal-version"
             _key="oscal-version"
             _key-ref="oscal-metadata:oscal-version"
             _using-name="oscal-version"
             _in-xml-name="oscal-version"
             _in-json-name="oscal-version"
             gi="oscal-version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/revisions/revision/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/document-id" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/metadata/document-id"
             _metaschema-json-id="/assembly/oscal-metadata/metadata/document-ids"
             collapsible="no"
             as-type="string"
             name="document-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:document-id"
             _step="document-id"
             _key="document-ids"
             _key-ref="oscal-metadata:document-id"
             _using-name="document-id"
             _in-xml-name="document-id"
             _in-json-name="document-ids"
             gi="document-id">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-metadata/role/title"
             _metaschema-json-id="/assembly/oscal-metadata/role/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/short-name" -->
      <field _step="short-name"
             _key="short-name"
             _metaschema-xml-id="/assembly/oscal-metadata/role/short-name"
             _metaschema-json-id="/assembly/oscal-metadata/role/short-name"
             collapsible="no"
             as-type="string"
             name="short-name"
             key="short-name"
             _using-name="short-name"
             _in-xml-name="short-name"
             _in-json-name="short-name"
             gi="short-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-metadata/role/description"
             _metaschema-json-id="/assembly/oscal-metadata/role/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-metadata/location/title"
             _metaschema-json-id="/assembly/oscal-metadata/location/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address" -->
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/location/address"
                _metaschema-json-id="/assembly/oscal-metadata/location/address"
                name="address"
                key="address"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:address"
                _step="address"
                _key="address"
                _key-ref="oscal-metadata:address"
                _using-name="address"
                _in-xml-name="address"
                _in-json-name="address"
                gi="address">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/addr-line" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/address/addr-line"
             _metaschema-json-id="/assembly/oscal-metadata/address/addr-lines"
             collapsible="no"
             as-type="string"
             name="addr-line"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:addr-line"
             _step="addr-line"
             _key="addr-lines"
             _key-ref="oscal-metadata:addr-line"
             _using-name="addr-line"
             _in-xml-name="addr-line"
             _in-json-name="addr-lines"
             gi="addr-line"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/city" -->
      <field _step="city"
             _key="city"
             _metaschema-xml-id="/assembly/oscal-metadata/address/city"
             _metaschema-json-id="/assembly/oscal-metadata/address/city"
             collapsible="no"
             as-type="string"
             name="city"
             key="city"
             _using-name="city"
             _in-xml-name="city"
             _in-json-name="city"
             gi="city"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/state" -->
      <field _step="state"
             _key="state"
             _metaschema-xml-id="/assembly/oscal-metadata/address/state"
             _metaschema-json-id="/assembly/oscal-metadata/address/state"
             collapsible="no"
             as-type="string"
             name="state"
             key="state"
             _using-name="state"
             _in-xml-name="state"
             _in-json-name="state"
             gi="state"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/postal-code" -->
      <field _step="postal-code"
             _key="postal-code"
             _metaschema-xml-id="/assembly/oscal-metadata/address/postal-code"
             _metaschema-json-id="/assembly/oscal-metadata/address/postal-code"
             collapsible="no"
             as-type="string"
             name="postal-code"
             key="postal-code"
             _using-name="postal-code"
             _in-xml-name="postal-code"
             _in-json-name="postal-code"
             gi="postal-code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/address/country" -->
      <field _step="country"
             _key="country"
             _metaschema-xml-id="/assembly/oscal-metadata/address/country"
             _metaschema-json-id="/assembly/oscal-metadata/address/country"
             collapsible="no"
             as-type="string"
             name="country"
             key="country"
             _using-name="country"
             _in-xml-name="country"
             _in-json-name="country"
             gi="country"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/email-address" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/location/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/location/email-addresses"
             collapsible="no"
             as-type="email"
             name="email-address"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:email-address"
             _step="email-address"
             _key="email-addresses"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"
             gi="email-address"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/telephone-number" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/location/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/location/telephone-numbers"
             collapsible="no"
             as-type="string"
             name="telephone-number"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:telephone-number"
             _step="telephone-number"
             _key="telephone-numbers"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"
             gi="telephone-number">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/url" -->
      <field _step="url"
             _key="urls"
             _metaschema-xml-id="/assembly/oscal-metadata/location/url"
             _metaschema-json-id="/assembly/oscal-metadata/location/urls"
             collapsible="no"
             as-type="uri"
             name="url"
             _using-name="url"
             _in-xml-name="url"
             _in-json-name="urls"
             gi="url"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/location/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/name" -->
      <field _step="name"
             _key="name"
             _metaschema-xml-id="/assembly/oscal-metadata/party/name"
             _metaschema-json-id="/assembly/oscal-metadata/party/name"
             collapsible="no"
             as-type="string"
             name="name"
             key="name"
             _using-name="name"
             _in-xml-name="name"
             _in-json-name="name"
             gi="name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/short-name" -->
      <field _step="short-name"
             _key="short-name"
             _metaschema-xml-id="/assembly/oscal-metadata/party/short-name"
             _metaschema-json-id="/assembly/oscal-metadata/party/short-name"
             collapsible="no"
             as-type="string"
             name="short-name"
             key="short-name"
             _using-name="short-name"
             _in-xml-name="short-name"
             _in-json-name="short-name"
             gi="short-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/external-id" -->
      <field _step="external-id"
             _key="external-ids"
             _metaschema-xml-id="/assembly/oscal-metadata/party/external-id"
             _metaschema-json-id="/assembly/oscal-metadata/party/external-ids"
             collapsible="no"
             as-type="string"
             name="external-id"
             _using-name="external-id"
             _in-xml-name="external-id"
             _in-json-name="external-ids"
             gi="external-id">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/email-address" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/party/email-address"
             _metaschema-json-id="/assembly/oscal-metadata/party/email-addresses"
             collapsible="no"
             as-type="email"
             name="email-address"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:email-address"
             _step="email-address"
             _key="email-addresses"
             _key-ref="oscal-metadata:email-address"
             _using-name="email-address"
             _in-xml-name="email-address"
             _in-json-name="email-addresses"
             gi="email-address"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/telephone-number" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/party/telephone-number"
             _metaschema-json-id="/assembly/oscal-metadata/party/telephone-numbers"
             collapsible="no"
             as-type="string"
             name="telephone-number"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:telephone-number"
             _step="telephone-number"
             _key="telephone-numbers"
             _key-ref="oscal-metadata:telephone-number"
             _using-name="telephone-number"
             _in-xml-name="telephone-number"
             _in-json-name="telephone-numbers"
             gi="telephone-number">
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
      <assembly _metaschema-xml-id="/assembly/oscal-metadata/party/address"
                _metaschema-json-id="/assembly/oscal-metadata/party/addresses"
                name="address"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
                _key-name="oscal-metadata:address"
                _step="address"
                _key="addresses"
                _key-ref="oscal-metadata:address"
                _using-name="address"
                _in-xml-name="address"
                _in-json-name="addresses"
                gi="address">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/addr-line" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/address/addr-line"
             _metaschema-json-id="/assembly/oscal-metadata/address/addr-lines"
             collapsible="no"
             as-type="string"
             name="addr-line"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:addr-line"
             _step="addr-line"
             _key="addr-lines"
             _key-ref="oscal-metadata:addr-line"
             _using-name="addr-line"
             _in-xml-name="addr-line"
             _in-json-name="addr-lines"
             gi="addr-line"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/city" -->
      <field _step="city"
             _key="city"
             _metaschema-xml-id="/assembly/oscal-metadata/address/city"
             _metaschema-json-id="/assembly/oscal-metadata/address/city"
             collapsible="no"
             as-type="string"
             name="city"
             key="city"
             _using-name="city"
             _in-xml-name="city"
             _in-json-name="city"
             gi="city"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/state" -->
      <field _step="state"
             _key="state"
             _metaschema-xml-id="/assembly/oscal-metadata/address/state"
             _metaschema-json-id="/assembly/oscal-metadata/address/state"
             collapsible="no"
             as-type="string"
             name="state"
             key="state"
             _using-name="state"
             _in-xml-name="state"
             _in-json-name="state"
             gi="state"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/postal-code" -->
      <field _step="postal-code"
             _key="postal-code"
             _metaschema-xml-id="/assembly/oscal-metadata/address/postal-code"
             _metaschema-json-id="/assembly/oscal-metadata/address/postal-code"
             collapsible="no"
             as-type="string"
             name="postal-code"
             key="postal-code"
             _using-name="postal-code"
             _in-xml-name="postal-code"
             _in-json-name="postal-code"
             gi="postal-code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/address/country" -->
      <field _step="country"
             _key="country"
             _metaschema-xml-id="/assembly/oscal-metadata/address/country"
             _metaschema-json-id="/assembly/oscal-metadata/address/country"
             collapsible="no"
             as-type="string"
             name="country"
             key="country"
             _using-name="country"
             _in-xml-name="country"
             _in-json-name="country"
             gi="country"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/party/member-of-organization" -->
      <field _step="member-of-organization"
             _key="member-of-organizations"
             _metaschema-xml-id="/assembly/oscal-metadata/party/member-of-organization"
             _metaschema-json-id="/assembly/oscal-metadata/party/member-of-organizations"
             collapsible="no"
             as-type="uuid"
             name="member-of-organization"
             _using-name="member-of-organization"
             _in-xml-name="member-of-organization"
             _in-json-name="member-of-organizations"
             gi="member-of-organization"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/metadata/responsible-party/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='system-name']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-name" -->
      <field _step="system-name"
             _key="system-name"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-name"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-name"
             collapsible="no"
             as-type="string"
             name="system-name"
             key="system-name"
             _using-name="system-name"
             _in-xml-name="system-name"
             _in-json-name="system-name"
             gi="system-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-name</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='system-name']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='system-name-short']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-name-short" -->
      <field _step="system-name-short"
             _key="system-name-short"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/system-name-short"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/system-name-short"
             collapsible="no"
             as-type="string"
             name="system-name-short"
             key="system-name-short"
             _using-name="system-name-short"
             _in-xml-name="system-name-short"
             _in-json-name="system-name-short"
             gi="system-name-short"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-name-short</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='system-name-short']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='description']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/description"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='description']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='date-authorized']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/date-authorized" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/date-authorized"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/date-authorized"
             collapsible="no"
             as-type="date"
             name="date-authorized"
             key="date-authorized"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:date-authorized"
             _step="date-authorized"
             _key="date-authorized"
             _key-ref="oscal-ssp:date-authorized"
             _using-name="date-authorized"
             _in-xml-name="date-authorized"
             _in-json-name="date-authorized"
             gi="date-authorized"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">date-authorized</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='date-authorized']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='security-sensitivity-level']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-sensitivity-level" -->
      <field _step="security-sensitivity-level"
             _key="security-sensitivity-level"
             _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level"
             _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/security-sensitivity-level"
             collapsible="no"
             as-type="string"
             name="security-sensitivity-level"
             key="security-sensitivity-level"
             _using-name="security-sensitivity-level"
             _in-xml-name="security-sensitivity-level"
             _in-json-name="security-sensitivity-level"
             gi="security-sensitivity-level"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-sensitivity-level</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:[@key='security-sensitivity-level']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type" -->
      <assembly _step="information-type"
                _key="information-types"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types"
                name="information-type"
                _using-name="information-type"
                _in-xml-name="information-type"
                _in-json-name="information-types"
                gi="information-type">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/title"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/description"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization" -->
      <assembly _step="categorization"
                _key="categorizations"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations"
                name="categorization"
                _using-name="categorization"
                _in-xml-name="categorization"
                _in-json-name="categorizations"
                gi="categorization">
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='information-type-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:array[@key='information-type-ids']/j:"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/categorization/information-type-id" -->
      <field _step="information-type-id"
             _key="information-type-ids"
             _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/categorization/information-type-id"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/categorizations/information-type-ids"
             collapsible="no"
             as-type="string"
             name="information-type-id"
             _using-name="information-type-id"
             _in-xml-name="information-type-id"
             _in-json-name="information-type-ids"
             gi="information-type-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='categorizations']/j:map/j:array[@key='information-type-ids']/j:"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact" -->
      <assembly _step="confidentiality-impact"
                _key="confidentiality-impact"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact"
                name="confidentiality-impact"
                key="confidentiality-impact"
                _using-name="confidentiality-impact"
                _in-xml-name="confidentiality-impact"
                _in-json-name="confidentiality-impact"
                gi="confidentiality-impact">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/base" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/base"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/base"
             collapsible="no"
             as-type="string"
             name="base"
             key="base"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:base"
             _step="base"
             _key="base"
             _key-ref="oscal-ssp:base"
             _using-name="base"
             _in-xml-name="base"
             _in-json-name="base"
             gi="base"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/selected" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/selected"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/selected"
             collapsible="no"
             as-type="string"
             name="selected"
             key="selected"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:selected"
             _step="selected"
             _key="selected"
             _key-ref="oscal-ssp:selected"
             _using-name="selected"
             _in-xml-name="selected"
             _in-json-name="selected"
             gi="selected"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/confidentiality-impact/adjustment-justification" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/confidentiality-impact/adjustment-justification"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/confidentiality-impact/adjustment-justification"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="adjustment-justification"
             key="adjustment-justification"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:adjustment-justification"
             _step="adjustment-justification"
             _key="adjustment-justification"
             _key-ref="oscal-ssp:adjustment-justification"
             _using-name="adjustment-justification"
             _in-xml-name="adjustment-justification"
             _in-json-name="adjustment-justification"
             gi="adjustment-justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='confidentiality-impact']/j:[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact" -->
      <assembly _step="integrity-impact"
                _key="integrity-impact"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact"
                name="integrity-impact"
                key="integrity-impact"
                _using-name="integrity-impact"
                _in-xml-name="integrity-impact"
                _in-json-name="integrity-impact"
                gi="integrity-impact">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/base" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/base"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/base"
             collapsible="no"
             as-type="string"
             name="base"
             key="base"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:base"
             _step="base"
             _key="base"
             _key-ref="oscal-ssp:base"
             _using-name="base"
             _in-xml-name="base"
             _in-json-name="base"
             gi="base"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/selected" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/selected"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/selected"
             collapsible="no"
             as-type="string"
             name="selected"
             key="selected"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:selected"
             _step="selected"
             _key="selected"
             _key-ref="oscal-ssp:selected"
             _using-name="selected"
             _in-xml-name="selected"
             _in-json-name="selected"
             gi="selected"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/integrity-impact/adjustment-justification" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/integrity-impact/adjustment-justification"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/integrity-impact/adjustment-justification"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="adjustment-justification"
             key="adjustment-justification"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:adjustment-justification"
             _step="adjustment-justification"
             _key="adjustment-justification"
             _key-ref="oscal-ssp:adjustment-justification"
             _using-name="adjustment-justification"
             _in-xml-name="adjustment-justification"
             _in-json-name="adjustment-justification"
             gi="adjustment-justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='integrity-impact']/j:[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact" -->
      <assembly _step="availability-impact"
                _key="availability-impact"
                _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact"
                _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact"
                name="availability-impact"
                key="availability-impact"
                _using-name="availability-impact"
                _in-xml-name="availability-impact"
                _in-json-name="availability-impact"
                gi="availability-impact">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='base']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/base" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/base"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/base"
             collapsible="no"
             as-type="string"
             name="base"
             key="base"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:base"
             _step="base"
             _key="base"
             _key-ref="oscal-ssp:base"
             _using-name="base"
             _in-xml-name="base"
             _in-json-name="base"
             gi="base"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">base</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='base']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='selected']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/selected" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/selected"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/selected"
             collapsible="no"
             as-type="string"
             name="selected"
             key="selected"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:selected"
             _step="selected"
             _key="selected"
             _key-ref="oscal-ssp:selected"
             _using-name="selected"
             _in-xml-name="selected"
             _in-json-name="selected"
             gi="selected"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">selected</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='selected']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='adjustment-justification']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/system-information/information-type/availability-impact/adjustment-justification" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-information/information-type/availability-impact/adjustment-justification"
             _metaschema-json-id="/assembly/oscal-ssp/system-information/information-types/availability-impact/adjustment-justification"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="adjustment-justification"
             key="adjustment-justification"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:adjustment-justification"
             _step="adjustment-justification"
             _key="adjustment-justification"
             _key-ref="oscal-ssp:adjustment-justification"
             _using-name="adjustment-justification"
             _in-xml-name="adjustment-justification"
             _in-json-name="adjustment-justification"
             gi="adjustment-justification"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">adjustment-justification</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='system-information']/j:array[@key='information-types']/j:map/j:map[@key='availability-impact']/j:[@key='adjustment-justification']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-confidentiality']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-confidentiality" -->
      <field _step="security-objective-confidentiality"
             _key="security-objective-confidentiality"
             _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality"
             _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-confidentiality"
             collapsible="no"
             as-type="string"
             name="security-objective-confidentiality"
             key="security-objective-confidentiality"
             _using-name="security-objective-confidentiality"
             _in-xml-name="security-objective-confidentiality"
             _in-json-name="security-objective-confidentiality"
             gi="security-objective-confidentiality"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-confidentiality</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-confidentiality']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-integrity']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-integrity" -->
      <field _step="security-objective-integrity"
             _key="security-objective-integrity"
             _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity"
             _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-integrity"
             collapsible="no"
             as-type="string"
             name="security-objective-integrity"
             key="security-objective-integrity"
             _using-name="security-objective-integrity"
             _in-xml-name="security-objective-integrity"
             _in-json-name="security-objective-integrity"
             gi="security-objective-integrity"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-integrity</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-integrity']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-availability']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/security-impact-level/security-objective-availability" -->
      <field _step="security-objective-availability"
             _key="security-objective-availability"
             _metaschema-xml-id="/assembly/oscal-ssp/security-impact-level/security-objective-availability"
             _metaschema-json-id="/assembly/oscal-ssp/security-impact-level/security-objective-availability"
             collapsible="no"
             as-type="string"
             name="security-objective-availability"
             key="security-objective-availability"
             _using-name="security-objective-availability"
             _in-xml-name="security-objective-availability"
             _in-json-name="security-objective-availability"
             gi="security-objective-availability"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">security-objective-availability</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='security-impact-level']/j:[@key='security-objective-availability']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='status']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/status" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-characteristics/status"
                _metaschema-json-id="/assembly/oscal-ssp/system-characteristics/status"
                name="status"
                key="status"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:status"
                _step="status"
                _key="status"
                _key-ref="oscal-ssp:status"
                _using-name="status"
                _in-xml-name="status"
                _in-json-name="status"
                gi="status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/description"
             _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/description"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/caption" -->
      <field _step="caption"
             _key="caption"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/caption"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/caption"
             collapsible="no"
             as-type="markup-line"
             name="caption"
             key="caption"
             _using-name="caption"
             _in-xml-name="caption"
             _in-json-name="caption"
             gi="caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/diagram/remarks" -->
      <field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/remarks"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:[@key='remarks']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/authorization-boundary/remarks" -->
      <field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/authorization-boundary/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/authorization-boundary/remarks"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='authorization-boundary']/j:[@key='remarks']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/network-architecture/description"
             _metaschema-json-id="/assembly/oscal-ssp/network-architecture/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/description"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/caption" -->
      <field _step="caption"
             _key="caption"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/caption"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/caption"
             collapsible="no"
             as-type="markup-line"
             name="caption"
             key="caption"
             _using-name="caption"
             _in-xml-name="caption"
             _in-json-name="caption"
             gi="caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/network-architecture/diagram/remarks" -->
      <field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/remarks"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='network-architecture']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/data-flow/description"
             _metaschema-json-id="/assembly/oscal-ssp/data-flow/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/description"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/caption" -->
      <field _step="caption"
             _key="caption"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/caption"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/caption"
             collapsible="no"
             as-type="markup-line"
             name="caption"
             key="caption"
             _using-name="caption"
             _in-xml-name="caption"
             _in-json-name="caption"
             gi="caption"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">caption</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='caption']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/data-flow/diagram/remarks" -->
      <field _step="remarks"
             _key="remarks"
             _metaschema-xml-id="/assembly/oscal-ssp/diagram/remarks"
             _metaschema-json-id="/assembly/oscal-ssp/diagram/remarks"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="remarks"
             key="remarks"
             _using-name="remarks"
             _in-xml-name="remarks"
             _in-json-name="remarks"
             gi="remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:map[@key='data-flow']/j:array[@key='diagrams']/j:map/j:[@key='remarks']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-characteristics/responsible-party/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-characteristics']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization" -->
      <assembly _step="leveraged-authorization"
                _key="leveraged-authorizations"
                _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization"
                _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations"
                name="leveraged-authorization"
                _using-name="leveraged-authorization"
                _in-xml-name="leveraged-authorization"
                _in-json-name="leveraged-authorizations"
                gi="leveraged-authorization">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='party-uuid']"/>
         <xsl:apply-templates select="*[@key='date-authorized']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/title"
             _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='party-uuid']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/party-uuid" -->
      <field _step="party-uuid"
             _key="party-uuid"
             _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/party-uuid"
             _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/party-uuid"
             collapsible="no"
             as-type="uuid"
             name="party-uuid"
             key="party-uuid"
             _using-name="party-uuid"
             _in-xml-name="party-uuid"
             _in-json-name="party-uuid"
             gi="party-uuid"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">party-uuid</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='party-uuid']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='date-authorized']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/leveraged-authorization/date-authorized" -->
      <field _metaschema-xml-id="/assembly/oscal-ssp/system-implementation/leveraged-authorization/date-authorized"
             _metaschema-json-id="/assembly/oscal-ssp/system-implementation/leveraged-authorizations/date-authorized"
             collapsible="no"
             as-type="date"
             name="date-authorized"
             key="date-authorized"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
             _key-name="oscal-ssp:date-authorized"
             _step="date-authorized"
             _key="date-authorized"
             _key-ref="oscal-ssp:date-authorized"
             _using-name="date-authorized"
             _in-xml-name="date-authorized"
             _in-json-name="date-authorized"
             gi="date-authorized"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">date-authorized</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='leveraged-authorizations']/j:map/j:[@key='date-authorized']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/title"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/short-name" -->
      <field _step="short-name"
             _key="short-name"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/short-name"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/short-name"
             collapsible="no"
             as-type="string"
             name="short-name"
             key="short-name"
             _using-name="short-name"
             _in-xml-name="short-name"
             _in-json-name="short-name"
             gi="short-name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-user/description"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-user/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/authorized-privilege/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/title"
             _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/user/authorized-privilege/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-implementation-common/authorized-privilege/description"
             _metaschema-json-id="/assembly/oscal-implementation-common/authorized-privilege/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/title"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-component/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/description"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-component/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/purpose" -->
      <field _step="purpose"
             _key="purpose"
             _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/purpose"
             _metaschema-json-id="/assembly/oscal-implementation-common/system-component/purpose"
             collapsible="no"
             as-type="markup-line"
             name="purpose"
             key="purpose"
             _using-name="purpose"
             _in-xml-name="purpose"
             _in-json-name="purpose"
             gi="purpose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">purpose</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:map[@key='status']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/status" -->
      <assembly _step="status"
                _key="status"
                _metaschema-xml-id="/assembly/oscal-implementation-common/system-component/status"
                _metaschema-json-id="/assembly/oscal-implementation-common/system-component/status"
                name="status"
                key="status"
                _using-name="status"
                _in-xml-name="status"
                _in-json-name="status"
                gi="status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/component/protocol/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-implementation-common/protocol/title"
             _metaschema-json-id="/assembly/oscal-implementation-common/protocol/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/description"
             _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/responsible-party/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component" -->
      <assembly _step="implemented-component"
                _key="implemented-components"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components"
                name="implemented-component"
                _using-name="implemented-component"
                _in-xml-name="implemented-component"
                _in-json-name="implemented-components"
                gi="implemented-component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/system-implementation/inventory-item/implemented-component/responsible-party/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='system-implementation']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']"
                 priority="3">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/system-security-plan/control-implementation"
                _metaschema-json-id="/assembly/oscal-ssp/system-security-plan/control-implementation"
                name="control-implementation"
                key="control-implementation"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:control-implementation"
                _step="control-implementation"
                _key="control-implementation"
                _key-ref="oscal-ssp:control-implementation"
                _using-name="control-implementation"
                _in-xml-name="control-implementation"
                _in-json-name="control-implementation"
                gi="control-implementation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">control-implementation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='set-parameters']"/>
         <xsl:apply-templates select="*[@key='implemented-requirements']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:[@key='description']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/description"
             _metaschema-json-id="/assembly/oscal-ssp/control-implementation/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:[@key='description']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/set-parameter/value" -->
      <field _step="value"
             _key="values"
             _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/value"
             _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/values"
             collapsible="no"
             as-type="string"
             name="parameter-value"
             _using-name="value"
             _in-xml-name="value"
             _in-json-name="values"
             gi="value"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/control-implementation/implemented-requirement"
                _metaschema-json-id="/assembly/oscal-ssp/control-implementation/implemented-requirements"
                name="implemented-requirement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:implemented-requirement"
                _step="implemented-requirement"
                _key="implemented-requirements"
                _key-ref="oscal-ssp:implemented-requirement"
                _using-name="implemented-requirement"
                _in-xml-name="implemented-requirement"
                _in-json-name="implemented-requirements"
                gi="implemented-requirement">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='set-parameters']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='statements']"/>
         <xsl:apply-templates select="*[@key='by-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/set-parameter/value" -->
      <field _step="value"
             _key="values"
             _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/value"
             _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/values"
             collapsible="no"
             as-type="string"
             name="parameter-value"
             _using-name="value"
             _in-xml-name="value"
             _in-json-name="values"
             gi="value"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ssp/implemented-requirement/statement"
                _metaschema-json-id="/assembly/oscal-ssp/implemented-requirement/statements"
                name="statement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_ssp_metaschema.xml"
                _key-name="oscal-ssp:statement"
                _step="statement"
                _key="statements"
                _key-ref="oscal-ssp:statement"
                _using-name="statement"
                _in-xml-name="statement"
                _in-json-name="statements"
                gi="statement">
         <xsl:apply-templates select="*[@key='statement-id']"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='by-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/set-parameter/value" -->
      <field _step="value"
             _key="values"
             _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/value"
             _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/values"
             collapsible="no"
             as-type="string"
             name="parameter-value"
             _using-name="value"
             _in-xml-name="value"
             _in-json-name="values"
             gi="value"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export" -->
      <assembly _step="export"
                _key="export"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export"
                name="export"
                key="export"
                _using-name="export"
                _in-xml-name="export"
                _in-json-name="export"
                gi="export">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided" -->
      <assembly _step="provided"
                _key="provided"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided"
                name="provided"
                _using-name="provided"
                _in-xml-name="provided"
                _in-json-name="provided"
                gi="provided">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/provided/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility" -->
      <assembly _step="responsibility"
                _key="responsibilities"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities"
                name="responsibility"
                _using-name="responsibility"
                _in-xml-name="responsibility"
                _in-json-name="responsibilities"
                gi="responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited" -->
      <assembly _step="inherited"
                _key="inherited"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited"
                name="inherited"
                _using-name="inherited"
                _in-xml-name="inherited"
                _in-json-name="inherited"
                gi="inherited">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/inherited/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied" -->
      <assembly _step="satisfied"
                _key="satisfied"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied"
                name="satisfied"
                _using-name="satisfied"
                _in-xml-name="satisfied"
                _in-json-name="satisfied"
                gi="satisfied">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='responsibility-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/satisfied/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/statement/by-component/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='statements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/set-parameter/value" -->
      <field _step="value"
             _key="values"
             _metaschema-xml-id="/assembly/oscal-implementation-common/set-parameter/value"
             _metaschema-json-id="/assembly/oscal-implementation-common/set-parameter/values"
             collapsible="no"
             as-type="string"
             name="parameter-value"
             _using-name="value"
             _in-xml-name="value"
             _in-json-name="values"
             gi="value"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='set-parameters']/j:map/j:array[@key='values']/j:"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export" -->
      <assembly _step="export"
                _key="export"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export"
                name="export"
                key="export"
                _using-name="export"
                _in-xml-name="export"
                _in-json-name="export"
                gi="export">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided" -->
      <assembly _step="provided"
                _key="provided"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided"
                name="provided"
                _using-name="provided"
                _in-xml-name="provided"
                _in-json-name="provided"
                gi="provided">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/provided/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/provided/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/provided/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='provided']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility" -->
      <assembly _step="responsibility"
                _key="responsibilities"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities"
                name="responsibility"
                _using-name="responsibility"
                _in-xml-name="responsibility"
                _in-json-name="responsibilities"
                gi="responsibility">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/export/responsibility/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/export/responsibilities/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/export/responsibility/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:map[@key='export']/j:array[@key='responsibilities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited" -->
      <assembly _step="inherited"
                _key="inherited"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited"
                name="inherited"
                _using-name="inherited"
                _in-xml-name="inherited"
                _in-json-name="inherited"
                gi="inherited">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='provided-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/inherited/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/inherited/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/inherited/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='inherited']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied" -->
      <assembly _step="satisfied"
                _key="satisfied"
                _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied"
                _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied"
                name="satisfied"
                _using-name="satisfied"
                _in-xml-name="satisfied"
                _in-json-name="satisfied"
                gi="satisfied">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='responsibility-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ssp/by-component/satisfied/description"
             _metaschema-json-id="/assembly/oscal-ssp/by-component/satisfied/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/satisfied/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='satisfied']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/control-implementation/implemented-requirement/by-component/responsible-role/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='control-implementation']/j:array[@key='implemented-requirements']/j:map/j:array[@key='by-components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource" -->
      <assembly _step="resource"
                _key="resources"
                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource"
                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources"
                name="resource"
                _using-name="resource"
                _in-xml-name="resource"
                _in-json-name="resources"
                gi="resource">
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
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/title"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/title"
             collapsible="no"
             as-type="markup-line"
             name="title"
             key="title"
             _using-name="title"
             _in-xml-name="title"
             _in-json-name="title"
             gi="title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/description"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/description"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="description"
             key="description"
             _using-name="description"
             _in-xml-name="description"
             _in-json-name="description"
             gi="description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/document-id" -->
      <field _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/document-id"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/document-ids"
             collapsible="no"
             as-type="string"
             name="document-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_metadata_metaschema.xml"
             _key-name="oscal-metadata:document-id"
             _step="document-id"
             _key="document-ids"
             _key-ref="oscal-metadata:document-id"
             _using-name="document-id"
             _in-xml-name="document-id"
             _in-json-name="document-ids"
             gi="document-id">
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
      <assembly _step="citation"
                _key="citation"
                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation"
                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation"
                name="citation"
                key="citation"
                _using-name="citation"
                _in-xml-name="citation"
                _in-json-name="citation"
                gi="citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/citation/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/citation/text"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/citation/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/citation/link/text" -->
      <field _step="text"
             _key="text"
             _metaschema-xml-id="/assembly/oscal-metadata/link/text"
             _metaschema-json-id="/assembly/oscal-metadata/link/text"
             collapsible="no"
             as-type="markup-line"
             name="text"
             key="text"
             _using-name="text"
             _in-xml-name="text"
             _in-json-name="text"
             gi="text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/rlink" -->
      <assembly _step="rlink"
                _key="rlinks"
                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink"
                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks"
                name="rlink"
                _using-name="rlink"
                _in-xml-name="rlink"
                _in-json-name="rlinks"
                gi="rlink">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='system-security-plan']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-security-plan/back-matter/resource/base64" -->
      <field _step="base64"
             _key="base64"
             _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/base64"
             _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/base64"
             collapsible="no"
             as-type="base64Binary"
             name="base64"
             key="base64"
             _using-name="base64"
             _in-xml-name="base64"
             _in-json-name="base64"
             gi="base64">
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
