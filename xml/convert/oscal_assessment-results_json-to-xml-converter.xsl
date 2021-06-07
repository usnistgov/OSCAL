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
   <xsl:template match="j:map[@key='assessment-results']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results"
                name="assessment-results"
                key="assessment-results"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-results_metaschema.xml"
                _key-name="oscal-ar:assessment-results"
                _using-root-name="assessment-results"
                gi="assessment-results">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-results</xsl:attribute>
         </xsl:if>
         <xsl:if test=".. is /j:map">
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
      <!-- XML match="metadata" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/metadata"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/metadata"
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)">
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
   <xsl:template match="j:map[@key='import-ap']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="import-ap" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/import-ap"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/import-ap"
                name="import-ap"
                key="import-ap"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-results_metaschema.xml"
                _key-name="oscal-ar:import-ap"
                _step="import-ap"
                _key="import-ap"
                _key-ref="oscal-ar:import-ap"
                _using-name="import-ap"
                _in-xml-name="import-ap"
                _in-json-name="import-ap"
                gi="import-ap">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ap</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="objectives-and-methods" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/local-definitions/objectives-and-methods"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/local-definitions/objectives-and-methods"
                name="local-objective"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:local-objective"
                _step="objectives-and-methods"
                _key="objectives-and-methods"
                _key-ref="oscal-assessment-common:local-objective"
                _using-name="objectives-and-methods"
                _in-xml-name="objectives-and-methods"
                _in-json-name="objectives-and-methods"
                gi="objectives-and-methods">
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
      <!-- XML match="objectives-and-methods/part | objectives-and-methods/part//part" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/local-objective/part"
                _metaschema-json-id="/assembly/oscal-assessment-common/local-objective/parts"
                name="part"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_control-common_metaschema.xml"
                _key-name="oscal-catalog-common:part"
                _step="part"
                _key="parts"
                _key-ref="oscal-catalog-common:part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"
                gi="part">
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
      <!-- XML match="attestation/part | attestation/part//part" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/attestation/part"
                _metaschema-json-id="/assembly/oscal-ar/result/attestations/parts"
                name="assessment-part"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:assessment-part"
                _step="part"
                _key="parts"
                _key-ref="oscal-assessment-common:assessment-part"
                _using-name="part"
                _in-xml-name="part"
                _in-json-name="parts"
                gi="part">
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
      <!-- XML match="activity" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/local-definitions/activity"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/local-definitions/activities"
                name="activity"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:activity"
                _step="activity"
                _key="activities"
                _key-ref="oscal-assessment-common:activity"
                _using-name="activity"
                _in-xml-name="activity"
                _in-json-name="activities"
                gi="activity">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='steps']"/>
         <xsl:apply-templates select="*[@key='related-controls']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='reviewed-controls']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="reviewed-controls" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step/reviewed-controls"
                _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps/reviewed-controls"
                name="reviewed-controls"
                key="reviewed-controls"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:reviewed-controls"
                _step="reviewed-controls"
                _key="reviewed-controls"
                _key-ref="oscal-assessment-common:reviewed-controls"
                _using-name="reviewed-controls"
                _in-xml-name="reviewed-controls"
                _in-json-name="reviewed-controls"
                gi="reviewed-controls">
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
      <!-- XML match="include-objective" -->
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/include-objective"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/include-objectives"
                name="select-objective-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-objective-by-id"
                _step="include-objective"
                _key="include-objectives"
                _key-ref="oscal-assessment-common:select-objective-by-id"
                _using-name="include-objective"
                _in-xml-name="include-objective"
                _in-json-name="include-objectives"
                gi="include-objective">
         <xsl:apply-templates select="*[@key='objective-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='exclude-objectives']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="exclude-objective" -->
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/exclude-objective"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/exclude-objectives"
                name="select-objective-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-objective-by-id"
                _step="exclude-objective"
                _key="exclude-objectives"
                _key-ref="oscal-assessment-common:select-objective-by-id"
                _using-name="exclude-objective"
                _in-xml-name="exclude-objective"
                _in-json-name="exclude-objectives"
                gi="exclude-objective">
         <xsl:apply-templates select="*[@key='objective-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-roles']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="responsible-role" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step/responsible-role"
                _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps/responsible-roles"
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
   <xsl:template match="j:map[@key='related-controls']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="related-controls" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/activity/related-controls"
                _metaschema-json-id="/assembly/oscal-assessment-common/activity/related-controls"
                name="reviewed-controls"
                key="related-controls"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:reviewed-controls"
                _step="related-controls"
                _key="related-controls"
                _key-ref="oscal-assessment-common:reviewed-controls"
                _using-name="related-controls"
                _in-xml-name="related-controls"
                _in-json-name="related-controls"
                gi="related-controls">
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
      <!-- XML match="result" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/result"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/results"
                name="result"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-results_metaschema.xml"
                _key-name="oscal-ar:result"
                _step="result"
                _key="results"
                _key-ref="oscal-ar:result"
                _using-name="result"
                _in-xml-name="result"
                _in-json-name="results"
                gi="result">
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
   <xsl:template match="j:array[@key='components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="component" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions/component"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions/components"
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
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions/inventory-item"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions/inventory-items"
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
   <xsl:template match="j:array[@key='users']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="user" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions/user"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions/users"
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
   <xsl:template match="j:map[@key='assessment-assets']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-assets" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions/assessment-assets"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions/assessment-assets"
                name="assessment-assets"
                key="assessment-assets"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:assessment-assets"
                _step="assessment-assets"
                _key="assessment-assets"
                _key-ref="oscal-assessment-common:assessment-assets"
                _using-name="assessment-assets"
                _in-xml-name="assessment-assets"
                _in-json-name="assessment-assets"
                gi="assessment-assets">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-assets</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='assessment-platforms']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-task" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions/assessment-task"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions/tasks"
                name="task"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:task"
                _step="assessment-task"
                _key="tasks"
                _key-ref="oscal-assessment-common:task"
                _using-name="assessment-task"
                _in-xml-name="assessment-task"
                _in-json-name="tasks"
                gi="assessment-task">
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
   <xsl:template match="j:array[@key='tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="task" -->
      <assembly recursive="true"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/task"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/tasks"
                name="task"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:task"
                _step="task"
                _key="tasks"
                _key-ref="oscal-assessment-common:task"
                _using-name="task"
                _in-xml-name="task"
                _in-json-name="tasks"
                gi="task">
         <xsl:apply-templates select="*"/>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='timing']"/>
         <xsl:apply-templates select="*[@key='dependencies']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
         <xsl:apply-templates select="*"/>
         <xsl:apply-templates select="*[@key='associated-activities']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="subject" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/task/associated-activity/subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/associated-activities/subjects"
                name="assessment-subject"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:assessment-subject"
                _step="subject"
                _key="subjects"
                _key-ref="oscal-assessment-common:assessment-subject"
                _using-name="subject"
                _in-xml-name="subject"
                _in-json-name="subjects"
                gi="subject">
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
      <!-- XML match="include-subject" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-subjects"
                name="select-subject-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-subject-by-id"
                _step="include-subject"
                _key="include-subjects"
                _key-ref="oscal-assessment-common:select-subject-by-id"
                _using-name="include-subject"
                _in-xml-name="include-subject"
                _in-json-name="include-subjects"
                gi="include-subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='exclude-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="exclude-subject" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/exclude-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/exclude-subjects"
                name="select-subject-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-subject-by-id"
                _step="exclude-subject"
                _key="exclude-subjects"
                _key-ref="oscal-assessment-common:select-subject-by-id"
                _using-name="exclude-subject"
                _in-xml-name="exclude-subject"
                _in-json-name="exclude-subjects"
                gi="exclude-subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="logged-by" -->
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/logged-by"
                _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/logged-by"
                name="logged-by"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:logged-by"
                _step="logged-by"
                _key="logged-by"
                _key-ref="oscal-assessment-common:logged-by"
                _using-name="logged-by"
                _in-xml-name="logged-by"
                _in-json-name="logged-by"
                gi="logged-by">
         <xsl:apply-templates select="*[@key='party-uuid']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="related-task" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/related-task"
                _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/related-tasks"
                name="related-task"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:related-task"
                _step="related-task"
                _key="related-tasks"
                _key-ref="oscal-assessment-common:related-task"
                _using-name="related-task"
                _in-xml-name="related-task"
                _in-json-name="related-tasks"
                gi="related-task">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='identified-subject']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="observation" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/observation"
                _metaschema-json-id="/assembly/oscal-ar/result/observations"
                name="observation"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:observation"
                _step="observation"
                _key="observations"
                _key-ref="oscal-assessment-common:observation"
                _using-name="observation"
                _in-xml-name="observation"
                _in-json-name="observations"
                gi="observation">
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
      <!-- XML match="origin" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/observation/origin"
                _metaschema-json-id="/assembly/oscal-assessment-common/observation/origins"
                name="origin"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:origin"
                _step="origin"
                _key="origins"
                _key-ref="oscal-assessment-common:origin"
                _using-name="origin"
                _in-xml-name="origin"
                _in-json-name="origins"
                gi="origin">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">origin</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='actors']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="actor" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/origin/actor"
                _metaschema-json-id="/assembly/oscal-assessment-common/origin/actors"
                name="origin-actor"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:origin-actor"
                _step="actor"
                _key="actors"
                _key-ref="oscal-assessment-common:origin-actor"
                _using-name="actor"
                _in-xml-name="actor"
                _in-json-name="actors"
                gi="actor">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='actor-uuid']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="risk" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/risk"
                _metaschema-json-id="/assembly/oscal-ar/result/risks"
                name="risk"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:risk"
                _step="risk"
                _key="risks"
                _key-ref="oscal-assessment-common:risk"
                _using-name="risk"
                _in-xml-name="risk"
                _in-json-name="risks"
                gi="risk">
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
      <!-- XML match="characterization" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/risk/characterization"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/characterizations"
                name="characterization"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:characterization"
                _step="characterization"
                _key="characterizations"
                _key-ref="oscal-assessment-common:characterization"
                _using-name="characterization"
                _in-xml-name="characterization"
                _in-json-name="characterizations"
                gi="characterization">
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origin']"/>
         <xsl:apply-templates select="*[@key='facets']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='findings']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="finding" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/result/finding"
                _metaschema-json-id="/assembly/oscal-ar/result/findings"
                name="finding"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-results_metaschema.xml"
                _key-name="oscal-ar:finding"
                _step="finding"
                _key="findings"
                _key-ref="oscal-ar:finding"
                _using-name="finding"
                _in-xml-name="finding"
                _in-json-name="findings"
                gi="finding">
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
      <!-- XML match="target" -->
      <assembly _metaschema-xml-id="/assembly/oscal-ar/finding/target"
                _metaschema-json-id="/assembly/oscal-ar/finding/target"
                name="finding-target"
                key="target"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:finding-target"
                _step="target"
                _key="target"
                _key-ref="oscal-assessment-common:finding-target"
                _using-name="target"
                _in-xml-name="target"
                _in-json-name="target"
                gi="target">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">target</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='target-id']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='status']"/>
         <xsl:apply-templates select="*[@key='reason']"/>
         <xsl:apply-templates select="*[@key='implementation-status']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='implementation-status']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="implementation-status" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/implementation-status"
                _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/implementation-status"
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
      <assembly _metaschema-xml-id="/assembly/oscal-ar/assessment-results/back-matter"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/back-matter"
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
   <xsl:template match="(j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j:)">
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
   <xsl:template match="(j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j: | j:string[@key='party-uuid'] | j:array[@key='party-uuids']/j: | j:array[@key='party-uuids']/j:)"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="(j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:array[@key='role-ids']/j: | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'])">
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
   <xsl:template match="(j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:array[@key='role-ids']/j: | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'] | j:string[@key='role-id'])"
                 mode="get-value-property"
                 priority="9">
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
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="threat-id" -->
      <field _metaschema-xml-id="/assembly/oscal-assessment-common/risk/threat-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/threat-ids"
             collapsible="no"
             as-type="uri"
             name="threat-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
             _key-name="oscal-assessment-common:threat-id"
             _step="threat-id"
             _key="threat-ids"
             _key-ref="oscal-assessment-common:threat-id"
             _using-name="threat-id"
             _in-xml-name="threat-id"
             _in-json-name="threat-ids"
             gi="threat-id">
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching threat-id-->
   <xsl:template match="j:array[@key='threat-ids']/j:map" mode="get-value-property">
      <value as-type="uri" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:[@key='status-change']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="status-change" -->
      <field _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/status-change"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/status-change"
             collapsible="no"
             as-type="token"
             name="risk-status"
             key="status-change"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
             _key-name="oscal-assessment-common:risk-status"
             _step="status-change"
             _key="status-change"
             _key-ref="oscal-assessment-common:risk-status"
             _using-name="status-change"
             _in-xml-name="status-change"
             _in-json-name="status-change"
             gi="status-change"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status-change</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:[@key='status-change']"
                 mode="get-value-property"
                 priority="10">
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
   <xsl:template match="j:map[@key='assessment-results']/j:string[@key='uuid']"><!-- XML match="assessment-results/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ar/assessment-results/uuid"
            _metaschema-json-id="/assembly/oscal-ar/assessment-results/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='name']"><!-- XML match="prop/@name" -->
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='uuid']"><!-- XML match="prop/@uuid" -->
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='ns']"><!-- XML match="prop/@ns" -->
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='value']"><!-- XML match="prop/@value" -->
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='class']"><!-- XML match="prop/@class" -->
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
   <xsl:template match="(j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='prop']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map | j:array[@key='props']/j:map)/j:string[@key='class']"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="assessment-results/metadata/document-id/@scheme | assessment-results/back-matter/resource/document-id/@scheme" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="assessment-results/metadata/location/address/@type | assessment-results/metadata/party/address/@type" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 priority="8"><!-- XML match="assessment-results/metadata/location/telephone-number/@type | assessment-results/metadata/party/telephone-number/@type" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 priority="8"><!-- XML match="assessment-results/metadata/party/external-id/@scheme" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
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
   <xsl:template match="j:map[@key='import-ap']/j:string[@key='href']"><!-- XML match="import-ap/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-ar/import-ap/href"
            _metaschema-json-id="/assembly/oscal-ar/import-ap/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='import-ap']/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="4"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map/j:string[@key='control-id']"><!-- XML match="objectives-and-methods/@control-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-assessment-common/local-objective/control-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/local-objective/control-id"
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
   <xsl:template match="j:array[@key='objectives-and-methods']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='id']"><!-- XML match="part/@id" -->
      <flag in-json="string"
            as-type="token"
            _step="id"
            _key="id"
            _metaschema-xml-id="/assembly/oscal-catalog-common/part/id"
            _metaschema-json-id="/assembly/oscal-catalog-common/part/id"
            name="id"
            key="id"
            _using-name="id"
            _in-xml-name="id"
            _in-json-name="id"
            gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"><!-- XML match="part/@name" -->
      <flag in-json="string"
            as-type="token"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-catalog-common/part/name"
            _metaschema-json-id="/assembly/oscal-catalog-common/part/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"><!-- XML match="part/@ns" -->
      <flag in-json="string"
            as-type="uri"
            _step="ns"
            _key="ns"
            _metaschema-xml-id="/assembly/oscal-catalog-common/part/ns"
            _metaschema-json-id="/assembly/oscal-catalog-common/part/ns"
            name="ns"
            key="ns"
            _using-name="ns"
            _in-xml-name="ns"
            _in-json-name="ns"
            gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"><!-- XML match="part/@class" -->
      <flag in-json="string"
            as-type="token"
            _step="class"
            _key="class"
            _metaschema-xml-id="/assembly/oscal-catalog-common/part/class"
            _metaschema-json-id="/assembly/oscal-catalog-common/part/class"
            name="class"
            key="class"
            _using-name="class"
            _in-xml-name="class"
            _in-json-name="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='activities']/j:map/j:string[@key='uuid']"><!-- XML match="activity/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/activity/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/activity/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='activities']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:string[@key='uuid']"
                 priority="8"><!-- XML match="assessment-results/local-definitions/activity/step/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"><!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/@control-id | assessment-results/result/reviewed-controls/control-selection/include-control/@control-id | assessment-results/result/reviewed-controls/control-selection/exclude-control/@control-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/control-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/control-id"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:string[@key='control-id'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:string[@key='control-id']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map/j:string[@key='objective-id']"><!-- XML match="include-objective/@objective-id | exclude-objective/@objective-id" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-assessment-common/select-objective-by-id/objective-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/select-objective-by-id/objective-id"
            name="objective-id"
            key="objective-id"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
            _key-name="oscal-assessment-common:objective-id"
            _step="objective-id"
            _key="objective-id"
            _key-ref="oscal-assessment-common:objective-id"
            _using-name="objective-id"
            _in-xml-name="objective-id"
            _in-json-name="objective-id"
            gi="objective-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-objectives']/j:map/j:string[@key='objective-id'] | j:array[@key='exclude-objectives']/j:map/j:string[@key='objective-id']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='results']/j:map/j:string[@key='uuid']"><!-- XML match="result/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ar/result/uuid"
            _metaschema-json-id="/assembly/oscal-ar/result/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='results']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="9"><!-- XML match="assessment-results/result/local-definitions/component/status/@state | assessment-results/result/local-definitions/assessment-assets/component/status/@state" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 priority="10"><!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/@component-uuid" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='uuid']"
                 priority="9"><!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platform/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platforms/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:string[@key='component-uuid']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="component-uuid"
            _key="component-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platform/uses-component/component-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platforms/uses-components/component-uuid"
            name="component-uuid"
            key="component-uuid"
            _using-name="component-uuid"
            _in-xml-name="component-uuid"
            _in-json-name="component-uuid"
            gi="component-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map/j:string[@key='uuid']"><!-- XML match="assessment-task/@uuid | task/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='uuid'] | j:array[@key='tasks']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map/j:string[@key='type']"><!-- XML match="assessment-task/@type | task/@type" -->
      <flag in-json="string"
            as-type="token"
            _step="type"
            _key="type"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='type'] | j:array[@key='tasks']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/on-date/@date | assessment-results/result/risk/response//task/timing/on-date/@date" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            _step="date"
            _key="date"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/on-date/date"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/on-date/date"
            name="date"
            key="date"
            _using-name="date"
            _in-xml-name="date"
            _in-json-name="date"
            gi="date">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/within-date-range/@start | assessment-results/result/risk/response//task/timing/within-date-range/@start" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            _step="start"
            _key="start"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/within-date-range/start"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/within-date-range/start"
            name="start"
            key="start"
            _using-name="start"
            _in-xml-name="start"
            _in-json-name="start"
            gi="start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/within-date-range/@end | assessment-results/result/risk/response//task/timing/within-date-range/@end" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            _step="end"
            _key="end"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/within-date-range/end"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/within-date-range/end"
            name="end"
            key="end"
            _using-name="end"
            _in-xml-name="end"
            _in-json-name="end"
            gi="end">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/at-frequency/@period | assessment-results/result/risk/response//task/timing/at-frequency/@period" -->
      <flag in-json="number"
            as-type="positiveInteger"
            _step="period"
            _key="period"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/at-frequency/period"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/at-frequency/period"
            name="period"
            key="period"
            _using-name="period"
            _in-xml-name="period"
            _in-json-name="period"
            gi="period">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 priority="11"><!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/at-frequency/@unit | assessment-results/result/risk/response//task/timing/at-frequency/@unit" -->
      <flag in-json="string"
            as-type="string"
            _step="unit"
            _key="unit"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/at-frequency/unit"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/at-frequency/unit"
            name="unit"
            key="unit"
            _using-name="unit"
            _in-xml-name="unit"
            _in-json-name="unit"
            gi="unit">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid']"
                 priority="10"><!-- XML match="assessment-results/result/local-definitions//assessment-task/dependency/@task-uuid | assessment-results/result/risk/response//task/dependency/@task-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="task-uuid"
            _key="task-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/dependency/task-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/dependencies/task-uuid"
            name="task-uuid"
            key="task-uuid"
            _using-name="task-uuid"
            _in-xml-name="task-uuid"
            _in-json-name="task-uuid"
            gi="task-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 priority="10"><!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/@activity-uuid | assessment-results/result/risk/response//task/associated-activity/@activity-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="activity-uuid"
            _key="activity-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/task/associated-activity/activity-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/task/associated-activities/activity-uuid"
            name="activity-uuid"
            key="activity-uuid"
            _using-name="activity-uuid"
            _in-xml-name="activity-uuid"
            _in-json-name="activity-uuid"
            gi="activity-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type']"><!-- XML match="subject/@type" -->
      <flag in-json="string"
            as-type="token"
            _step="type"
            _key="type"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='subject-uuid'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='subject-uuid']"><!-- XML match="include-subject/@subject-uuid | exclude-subject/@subject-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/select-subject-by-id/subject-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/select-subject-by-id/subject-uuid"
            name="subject-uuid"
            key="subject-uuid"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
            _key-name="oscal-assessment-common:subject-uuid"
            _step="subject-uuid"
            _key="subject-uuid"
            _key-ref="oscal-assessment-common:subject-uuid"
            _using-name="subject-uuid"
            _in-xml-name="subject-uuid"
            _in-json-name="subject-uuid"
            gi="subject-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='subject-uuid'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='subject-uuid']"
                 mode="keep-value-property"
                 priority="15"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='type'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='type']"><!-- XML match="include-subject/@type | exclude-subject/@type" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-assessment-common/select-subject-by-id/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/select-subject-by-id/type"
            name="subject-type"
            key="type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
            _key-name="oscal-assessment-common:subject-type"
            _step="type"
            _key="type"
            _key-ref="oscal-assessment-common:subject-type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='type'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="15"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='uuid']"><!-- XML match="part/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"><!-- XML match="part/@name" -->
      <flag in-json="string"
            as-type="token"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/name"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"><!-- XML match="part/@ns" -->
      <flag in-json="string"
            as-type="uri"
            _step="ns"
            _key="ns"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/ns"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/ns"
            name="ns"
            key="ns"
            _using-name="ns"
            _in-xml-name="ns"
            _in-json-name="ns"
            gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"><!-- XML match="part/@class" -->
      <flag in-json="string"
            as-type="token"
            _step="class"
            _key="class"
            _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/class"
            _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/class"
            name="class"
            key="class"
            _using-name="class"
            _in-xml-name="class"
            _in-json-name="class"
            gi="class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='parts']/j:map/j:string[@key='class']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 priority="8"><!-- XML match="assessment-results/result/assessment-log/entry/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/uuid"
            _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"><!-- XML match="logged-by/@party-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="party-uuid"
            _key="party-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/logged-by/party-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/logged-by/party-uuid"
            name="party-uuid"
            key="party-uuid"
            _using-name="party-uuid"
            _in-xml-name="party-uuid"
            _in-json-name="party-uuid"
            gi="party-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='role-id']"><!-- XML match="logged-by/@role-id" -->
      <flag in-json="string"
            as-type="token"
            _step="role-id"
            _key="role-id"
            _metaschema-xml-id="/assembly/oscal-assessment-common/logged-by/role-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/logged-by/role-id"
            name="role-id"
            key="role-id"
            _using-name="role-id"
            _in-xml-name="role-id"
            _in-json-name="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid']"><!-- XML match="related-task/@task-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="task-uuid"
            _key="task-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/task-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/related-task/task-uuid"
            name="task-uuid"
            key="task-uuid"
            _using-name="task-uuid"
            _in-xml-name="task-uuid"
            _in-json-name="task-uuid"
            gi="task-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 priority="11"><!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/observation/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/characterization/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/response/origin/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/@subject-placeholder-uuid | assessment-results/result/finding/origin/related-task/identified-subject/@subject-placeholder-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="subject-placeholder-uuid"
            _key="subject-placeholder-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject/subject-placeholder-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject/subject-placeholder-uuid"
            name="subject-placeholder-uuid"
            key="subject-placeholder-uuid"
            _using-name="subject-placeholder-uuid"
            _in-xml-name="subject-placeholder-uuid"
            _in-json-name="subject-placeholder-uuid"
            gi="subject-placeholder-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map/j:string[@key='uuid']"><!-- XML match="observation/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/observation/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/observation/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='type']"><!-- XML match="actor/@type" -->
      <flag in-json="string"
            as-type="token"
            _step="type"
            _key="type"
            _metaschema-xml-id="/assembly/oscal-assessment-common/origin-actor/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/origin-actor/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='actor-uuid']"><!-- XML match="actor/@actor-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="actor-uuid"
            _key="actor-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/origin-actor/actor-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/origin-actor/actor-uuid"
            name="actor-uuid"
            key="actor-uuid"
            _using-name="actor-uuid"
            _in-xml-name="actor-uuid"
            _in-json-name="actor-uuid"
            gi="actor-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='actor-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='role-id']"><!-- XML match="actor/@role-id" -->
      <flag in-json="string"
            as-type="token"
            _step="role-id"
            _key="role-id"
            _metaschema-xml-id="/assembly/oscal-assessment-common/origin-actor/role-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/origin-actor/role-id"
            name="role-id"
            key="role-id"
            _using-name="role-id"
            _in-xml-name="role-id"
            _in-json-name="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid']"><!-- XML match="assessment-results/result/observation/subject/@subject-uuid | assessment-results/result/risk/mitigating-factor/subject/@subject-uuid | assessment-results/result/risk/response/required-asset/subject/@subject-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/subject-reference/subject-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/subject-reference/subject-uuid"
            name="subject-uuid"
            key="subject-uuid"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
            _key-name="oscal-assessment-common:subject-uuid"
            _step="subject-uuid"
            _key="subject-uuid"
            _key-ref="oscal-assessment-common:subject-uuid"
            _using-name="subject-uuid"
            _in-xml-name="subject-uuid"
            _in-json-name="subject-uuid"
            gi="subject-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type']"><!-- XML match="assessment-results/result/observation/subject/@type | assessment-results/result/risk/mitigating-factor/subject/@type | assessment-results/result/risk/response/required-asset/subject/@type" -->
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-assessment-common/subject-reference/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/subject-reference/type"
            name="subject-type"
            key="type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
            _key-name="oscal-assessment-common:subject-type"
            _step="type"
            _key="type"
            _key-ref="oscal-assessment-common:subject-type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 priority="9"><!-- XML match="assessment-results/result/observation/relevant-evidence/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-assessment-common/observation/relevant-evidence/href"
            _metaschema-json-id="/assembly/oscal-assessment-common/observation/relevant-evidence/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map/j:string[@key='uuid']"><!-- XML match="risk/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system']"><!-- XML match="threat-id/@system" -->
      <flag in-json="string"
            as-type="uri"
            _step="system"
            _key="system"
            _metaschema-xml-id="/field/oscal-assessment-common/threat-id/system"
            _metaschema-json-id="/field/oscal-assessment-common/threat-id/system"
            name="system"
            key="system"
            _using-name="system"
            _in-xml-name="system"
            _in-json-name="system"
            gi="system">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='href']"><!-- XML match="threat-id/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/field/oscal-assessment-common/threat-id/href"
            _metaschema-json-id="/field/oscal-assessment-common/threat-id/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"
                 priority="11"><!-- XML match="assessment-results/result/risk/characterization/facet/@name" -->
      <flag in-json="string"
            as-type="token"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-assessment-common/characterization/facet/name"
            _metaschema-json-id="/assembly/oscal-assessment-common/characterization/facets/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"
                 priority="11"><!-- XML match="assessment-results/result/risk/characterization/facet/@system" -->
      <flag in-json="string"
            as-type="uri"
            _step="system"
            _key="system"
            _metaschema-xml-id="/assembly/oscal-assessment-common/characterization/facet/system"
            _metaschema-json-id="/assembly/oscal-assessment-common/characterization/facets/system"
            name="system"
            key="system"
            _using-name="system"
            _in-xml-name="system"
            _in-json-name="system"
            gi="system">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"
                 priority="11"><!-- XML match="assessment-results/result/risk/characterization/facet/@value" -->
      <flag in-json="string"
            as-type="string"
            _step="value"
            _key="value"
            _metaschema-xml-id="/assembly/oscal-assessment-common/characterization/facet/value"
            _metaschema-json-id="/assembly/oscal-assessment-common/characterization/facets/value"
            name="value"
            key="value"
            _using-name="value"
            _in-xml-name="value"
            _in-json-name="value"
            gi="value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/mitigating-factor/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/mitigating-factor/@implementation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="implementation-uuid"
            _key="implementation-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor/implementation-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors/implementation-uuid"
            name="implementation-uuid"
            key="implementation-uuid"
            _using-name="implementation-uuid"
            _in-xml-name="implementation-uuid"
            _in-json-name="implementation-uuid"
            gi="implementation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/response/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/response/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/response/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 priority="9"><!-- XML match="assessment-results/result/risk/response/@lifecycle" -->
      <flag in-json="string"
            as-type="token"
            _step="lifecycle"
            _key="lifecycle"
            _metaschema-xml-id="/assembly/oscal-assessment-common/response/lifecycle"
            _metaschema-json-id="/assembly/oscal-assessment-common/response/lifecycle"
            name="lifecycle"
            key="lifecycle"
            _using-name="lifecycle"
            _in-xml-name="lifecycle"
            _in-json-name="lifecycle"
            gi="lifecycle">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 priority="11"><!-- XML match="assessment-results/result/risk/response/required-asset/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 priority="10"><!-- XML match="assessment-results/result/risk/risk-log/entry/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 priority="12"><!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/@response-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="response-uuid"
            _key="response-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/related-response/response-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/related-responses/response-uuid"
            name="response-uuid"
            key="response-uuid"
            _using-name="response-uuid"
            _in-xml-name="response-uuid"
            _in-json-name="response-uuid"
            gi="response-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/risk/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="observation-uuid"
            _key="observation-uuid"
            _metaschema-xml-id="/assembly/oscal-assessment-common/risk/related-observation/observation-uuid"
            _metaschema-json-id="/assembly/oscal-assessment-common/risk/related-observations/observation-uuid"
            name="observation-uuid"
            key="observation-uuid"
            _using-name="observation-uuid"
            _in-xml-name="observation-uuid"
            _in-json-name="observation-uuid"
            gi="observation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='findings']/j:map/j:string[@key='uuid']"><!-- XML match="finding/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-ar/finding/uuid"
            _metaschema-json-id="/assembly/oscal-ar/finding/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='findings']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='type']"><!-- XML match="target/@type" -->
      <flag in-json="string"
            as-type="string"
            _step="type"
            _key="type"
            _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/type"
            _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/type"
            name="type"
            key="type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='target-id']"><!-- XML match="target/@target-id" -->
      <flag in-json="string"
            as-type="token"
            _step="target-id"
            _key="target-id"
            _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/target-id"
            _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/target-id"
            name="target-id"
            key="target-id"
            _using-name="target-id"
            _in-xml-name="target-id"
            _in-json-name="target-id"
            gi="target-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='target']/j:string[@key='target-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
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
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/finding/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="observation-uuid"
            _key="observation-uuid"
            _metaschema-xml-id="/assembly/oscal-ar/finding/related-observation/observation-uuid"
            _metaschema-json-id="/assembly/oscal-ar/finding/related-observations/observation-uuid"
            name="observation-uuid"
            key="observation-uuid"
            _using-name="observation-uuid"
            _in-xml-name="observation-uuid"
            _in-json-name="observation-uuid"
            gi="observation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 priority="9"><!-- XML match="assessment-results/result/finding/associated-risk/@risk-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            _step="risk-uuid"
            _key="risk-uuid"
            _metaschema-xml-id="/assembly/oscal-ar/finding/associated-risk/risk-uuid"
            _metaschema-json-id="/assembly/oscal-ar/finding/related-risks/risk-uuid"
            name="risk-uuid"
            key="risk-uuid"
            _using-name="risk-uuid"
            _in-xml-name="risk-uuid"
            _in-json-name="risk-uuid"
            gi="risk-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="assessment-results/back-matter/resource/@uuid" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- XML match="assessment-results/back-matter/resource/rlink/@href" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"><!-- XML match="assessment-results/back-matter/resource/rlink/@media-type" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- XML match="assessment-results/back-matter/resource/base64/@filename" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="assessment-results/back-matter/resource/base64/@media-type" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/published" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/published" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/last-modified" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/oscal-version" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/document-id" -->
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
   <!-- matching assessment-results/metadata/document-id-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/addr-line" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/city" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/state" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/email-address" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/telephone-number" -->
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
   <!-- matching assessment-results/metadata/location/telephone-number-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/url" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/external-id" -->
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
   <!-- matching assessment-results/metadata/party/external-id-->
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/email-address" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/telephone-number" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/addr-line" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/city" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/state" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/address/country" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/party/member-of-organization" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']"
                 priority="3">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions" -->
      <assembly _step="local-definitions"
                _key="local-definitions"
                _metaschema-xml-id="/assembly/oscal-ar/assessment-results/local-definitions"
                _metaschema-json-id="/assembly/oscal-ar/assessment-results/local-definitions"
                name="local-definitions"
                key="local-definitions"
                _using-name="local-definitions"
                _in-xml-name="local-definitions"
                _in-json-name="local-definitions"
                gi="local-definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='objectives-and-methods']"/>
         <xsl:apply-templates select="*[@key='activities']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/local-objective/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/local-objective/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods//part/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-catalog-common/part/title"
             _metaschema-json-id="/assembly/oscal-catalog-common/part/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods//part" -->
      <field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-catalog-common/part/p ul ol pre table h1 h2 h3 h4 h5 h6"
             _metaschema-json-id="/assembly/oscal-catalog-common/part/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/objectives-and-methods//part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='objectives-and-methods']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/activity/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/activity/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/activity/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/activity/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step" -->
      <assembly _step="step"
                _key="steps"
                _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step"
                _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps"
                name="step"
                _using-name="step"
                _in-xml-name="step"
                _in-json-name="steps"
                gi="step">
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/activity/step/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/activity/steps/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection" -->
      <assembly _step="control-selection"
                _key="control-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections"
                name="control-selection"
                _using-name="control-selection"
                _in-xml-name="control-selection"
                _in-json-name="control-selections"
                gi="control-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="include-control"
                _key="include-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="include-control"
                _in-xml-name="include-control"
                _in-json-name="include-controls"
                gi="include-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/exclude-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/exclude-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="exclude-control"
                _key="exclude-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="exclude-control"
                _in-xml-name="exclude-control"
                _in-json-name="exclude-controls"
                gi="exclude-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection" -->
      <assembly _step="control-objective-selection"
                _key="control-objective-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections"
                name="control-objective-selection"
                _using-name="control-objective-selection"
                _in-xml-name="control-objective-selection"
                _in-json-name="control-objective-selections"
                gi="control-objective-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/step/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='steps']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection" -->
      <assembly _step="control-selection"
                _key="control-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections"
                name="control-selection"
                _using-name="control-selection"
                _in-xml-name="control-selection"
                _in-json-name="control-selections"
                gi="control-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="include-control"
                _key="include-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="include-control"
                _in-xml-name="include-control"
                _in-json-name="include-controls"
                gi="include-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/exclude-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/exclude-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="exclude-control"
                _key="exclude-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="exclude-control"
                _in-xml-name="exclude-control"
                _in-json-name="exclude-controls"
                gi="exclude-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection" -->
      <assembly _step="control-objective-selection"
                _key="control-objective-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections"
                name="control-objective-selection"
                _using-name="control-objective-selection"
                _in-xml-name="control-objective-selection"
                _in-json-name="control-objective-selections"
                gi="control-objective-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:map[@key='related-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/local-definitions/activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='local-definitions']/j:array[@key='activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-ar/result/title"
             _metaschema-json-id="/assembly/oscal-ar/result/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ar/result/description"
             _metaschema-json-id="/assembly/oscal-ar/result/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='start']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/start" -->
      <field _step="start"
             _key="start"
             _metaschema-xml-id="/assembly/oscal-ar/result/start"
             _metaschema-json-id="/assembly/oscal-ar/result/start"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="start"
             key="start"
             _using-name="start"
             _in-xml-name="start"
             _in-json-name="start"
             gi="start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='start']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='end']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/end" -->
      <field _step="end"
             _key="end"
             _metaschema-xml-id="/assembly/oscal-ar/result/end"
             _metaschema-json-id="/assembly/oscal-ar/result/end"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="end"
             key="end"
             _using-name="end"
             _in-xml-name="end"
             _in-json-name="end"
             gi="end"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:[@key='end']"
                 mode="get-value-property"
                 priority="5">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions" -->
      <assembly _step="local-definitions"
                _key="local-definitions"
                _metaschema-xml-id="/assembly/oscal-ar/result/local-definitions"
                _metaschema-json-id="/assembly/oscal-ar/result/local-definitions"
                name="local-definitions"
                key="local-definitions"
                _using-name="local-definitions"
                _in-xml-name="local-definitions"
                _in-json-name="local-definitions"
                gi="local-definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='users']"/>
         <xsl:apply-templates select="*[@key='assessment-assets']"/>
         <xsl:apply-templates select="*[@key='tasks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/status" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/inventory-item/implemented-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='short-name']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/short-name" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='short-name']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/authorized-privilege/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/user/authorized-privilege/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:array[@key='users']/j:map/j:array[@key='authorized-privileges']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/purpose" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:[@key='purpose']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:map[@key='status']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/status" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform" -->
      <assembly _step="assessment-platform"
                _key="assessment-platforms"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platform"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platforms"
                name="assessment-platform"
                _using-name="assessment-platform"
                _in-xml-name="assessment-platform"
                _in-json-name="assessment-platforms"
                gi="assessment-platform">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='uses-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platform/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platforms/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component" -->
      <assembly _step="uses-component"
                _key="uses-components"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platform/uses-component"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-assets/assessment-platforms/uses-components"
                name="uses-component"
                _using-name="uses-component"
                _in-xml-name="uses-component"
                _in-json-name="uses-components"
                gi="uses-component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions/assessment-assets/assessment-platform/uses-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']/j:map[@key='assessment-assets']/j:array[@key='assessment-platforms']/j:map/j:array[@key='uses-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/task/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/task/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/task/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/task/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/timing" -->
      <assembly _step="timing"
                _key="timing"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing"
                name="timing"
                key="timing"
                _using-name="timing"
                _in-xml-name="timing"
                _in-json-name="timing"
                gi="timing">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">timing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='on-date']"/>
         <xsl:apply-templates select="*[@key='within-date-range']"/>
         <xsl:apply-templates select="*[@key='at-frequency']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/on-date" -->
      <assembly as-type="empty"
                _step="on-date"
                _key="on-date"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/on-date"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/on-date"
                name="on-date"
                key="on-date"
                _using-name="on-date"
                _in-xml-name="on-date"
                _in-json-name="on-date"
                gi="on-date">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">on-date</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='date']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/within-date-range" -->
      <assembly as-type="empty"
                _step="within-date-range"
                _key="within-date-range"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/within-date-range"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/within-date-range"
                name="within-date-range"
                key="within-date-range"
                _using-name="within-date-range"
                _in-xml-name="within-date-range"
                _in-json-name="within-date-range"
                gi="within-date-range">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">within-date-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/timing/at-frequency" -->
      <assembly as-type="empty"
                _step="at-frequency"
                _key="at-frequency"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/at-frequency"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/at-frequency"
                name="at-frequency"
                key="at-frequency"
                _using-name="at-frequency"
                _in-xml-name="at-frequency"
                _in-json-name="at-frequency"
                gi="at-frequency">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">at-frequency</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='period']"/>
         <xsl:apply-templates select="*[@key='unit']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/dependency" -->
      <assembly _step="dependency"
                _key="dependencies"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/dependency"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/dependencies"
                name="dependency"
                _using-name="dependency"
                _in-xml-name="dependency"
                _in-json-name="dependencies"
                gi="dependency">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity" -->
      <assembly _step="associated-activity"
                _key="associated-activities"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/associated-activity"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/associated-activities"
                name="associated-activity"
                _using-name="associated-activity"
                _in-xml-name="associated-activity"
                _in-json-name="associated-activities"
                gi="associated-activity">
         <xsl:apply-templates select="*[@key='activity-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/associated-activity/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/local-definitions//assessment-task/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='local-definitions']//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection" -->
      <assembly _step="control-selection"
                _key="control-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections"
                name="control-selection"
                _using-name="control-selection"
                _in-xml-name="control-selection"
                _in-json-name="control-selections"
                gi="control-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-controls']"/>
         <xsl:apply-templates select="*[@key='exclude-controls']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:map[@key='include-all']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/include-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/include-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="include-control"
                _key="include-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="include-control"
                _in-xml-name="include-control"
                _in-json-name="include-controls"
                gi="include-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/include-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='include-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/exclude-control" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-selection/exclude-control"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-selections/exclude-controls"
                name="select-control-by-id"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:select-control-by-id"
                _step="exclude-control"
                _key="exclude-controls"
                _key-ref="oscal-assessment-common:select-control-by-id"
                _using-name="exclude-control"
                _in-xml-name="exclude-control"
                _in-json-name="exclude-controls"
                gi="exclude-control">
         <xsl:apply-templates select="*[@key='control-id']"/>
         <xsl:apply-templates select="*[@key='statement-ids']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-selection/exclude-control/statement-id" -->
      <field _step="statement-id"
             _key="statement-ids"
             _metaschema-xml-id="/assembly/oscal-assessment-common/select-control-by-id/statement-id"
             _metaschema-json-id="/assembly/oscal-assessment-common/select-control-by-id/statement-ids"
             collapsible="no"
             as-type="token"
             name="statement-id"
             _using-name="statement-id"
             _in-xml-name="statement-id"
             _in-json-name="statement-ids"
             gi="statement-id"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-selections']/j:map/j:array[@key='exclude-controls']/j:map/j:array[@key='statement-ids']/j:"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection" -->
      <assembly _step="control-objective-selection"
                _key="control-objective-selections"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections"
                name="control-objective-selection"
                _using-name="control-objective-selection"
                _in-xml-name="control-objective-selection"
                _in-json-name="control-objective-selections"
                gi="control-objective-selection">
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='include-all']"/>
         <xsl:apply-templates select="*[@key='include-objectives']"/>
         <xsl:apply-templates select="*[@key='exclude-objectives']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='reviewed-controls']/j:array[@key='control-objective-selections']/j:map/j:map[@key='include-all']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/reviewed-controls/control-objective-selection/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selection/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/reviewed-controls/control-objective-selections/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation" -->
      <assembly _step="attestation"
                _key="attestations"
                _metaschema-xml-id="/assembly/oscal-ar/result/attestation"
                _metaschema-json-id="/assembly/oscal-ar/result/attestations"
                name="attestation"
                _using-name="attestation"
                _in-xml-name="attestation"
                _in-json-name="attestations"
                gi="attestation">
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='parts']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation//part/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation//part" -->
      <field _step="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _key="prose"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-part/p ul ol pre table h1 h2 h3 h4 h5 h6"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-part/prose"
             in-xml="UNWRAPPED"
             collapsible="no"
             as-type="markup-multiline"
             name="prose"
             key="prose"
             _using-name="prose"
             _in-xml-name="p ul ol pre table h1 h2 h3 h4 h5 h6"
             _in-json-name="prose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">prose</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/attestation//part/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='attestations']/j:map//j:array[@key='parts']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log" -->
      <assembly _step="assessment-log"
                _key="assessment-log"
                _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log"
                _metaschema-json-id="/assembly/oscal-ar/result/assessment-log"
                name="assessment-log"
                key="assessment-log"
                _using-name="assessment-log"
                _in-xml-name="assessment-log"
                _in-json-name="assessment-log"
                gi="assessment-log">
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
      <assembly _step="entry"
                _key="entries"
                _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry"
                _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries"
                name="entry"
                _using-name="entry"
                _in-xml-name="entry"
                _in-json-name="entries"
                gi="entry">
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/title"
             _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/description"
             _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='start']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/start" -->
      <field _step="start"
             _key="start"
             _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/start"
             _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/start"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="start"
             key="start"
             _using-name="start"
             _in-xml-name="start"
             _in-json-name="start"
             gi="start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='start']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='end']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/end" -->
      <field _step="end"
             _key="end"
             _metaschema-xml-id="/assembly/oscal-ar/result/assessment-log/entry/end"
             _metaschema-json-id="/assembly/oscal-ar/result/assessment-log/entries/end"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="end"
             key="end"
             _using-name="end"
             _in-xml-name="end"
             _in-json-name="end"
             gi="end"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:[@key='end']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/assessment-log/entry/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:map[@key='assessment-log']/j:array[@key='entries']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='methods']/j:"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/method" -->
      <field _step="method"
             _key="methods"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/method"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/methods"
             collapsible="no"
             as-type="string"
             name="method"
             _using-name="method"
             _in-xml-name="method"
             _in-json-name="methods"
             gi="method"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='methods']/j:"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='types']/j:"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/type" -->
      <field _step="type"
             _key="types"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/type"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/types"
             collapsible="no"
             as-type="token"
             name="type"
             _using-name="type"
             _in-xml-name="type"
             _in-json-name="types"
             gi="type"
             in-json="SCALAR"/>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='types']/j:"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/observation/subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/observation/subjects"
                name="subject-reference"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:subject-reference"
                _step="subject"
                _key="subjects"
                _key-ref="oscal-assessment-common:subject-reference"
                _using-name="subject"
                _in-xml-name="subject"
                _in-json-name="subjects"
                gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/subject-reference/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/subject-reference/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence" -->
      <assembly _step="relevant-evidence"
                _key="relevant-evidence"
                _metaschema-xml-id="/assembly/oscal-assessment-common/observation/relevant-evidence"
                _metaschema-json-id="/assembly/oscal-assessment-common/observation/relevant-evidence"
                name="relevant-evidence"
                _using-name="relevant-evidence"
                _in-xml-name="relevant-evidence"
                _in-json-name="relevant-evidence"
                gi="relevant-evidence">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/relevant-evidence/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/relevant-evidence/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/relevant-evidence/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='collected']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/collected" -->
      <field _step="collected"
             _key="collected"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/collected"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/collected"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="collected"
             key="collected"
             _using-name="collected"
             _in-xml-name="collected"
             _in-json-name="collected"
             gi="collected"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">collected</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='collected']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='expires']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/observation/expires" -->
      <field _step="expires"
             _key="expires"
             _metaschema-xml-id="/assembly/oscal-assessment-common/observation/expires"
             _metaschema-json-id="/assembly/oscal-assessment-common/observation/expires"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="expires"
             key="expires"
             _using-name="expires"
             _in-xml-name="expires"
             _in-json-name="expires"
             gi="expires"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expires</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='observations']/j:map/j:[@key='expires']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='statement']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/statement" -->
      <field _step="statement"
             _key="statement"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/statement"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/statement"
             in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="statement"
             key="statement"
             _using-name="statement"
             _in-xml-name="statement"
             _in-json-name="statement"
             gi="statement"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='statement']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='status']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/status" -->
      <field _step="status"
             _key="status"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/status"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/status"
             collapsible="no"
             as-type="token"
             name="status"
             key="status"
             _using-name="status"
             _in-xml-name="status"
             _in-json-name="status"
             gi="status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='status']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/facet" -->
      <assembly _step="facet"
                _key="facets"
                _metaschema-xml-id="/assembly/oscal-assessment-common/characterization/facet"
                _metaschema-json-id="/assembly/oscal-assessment-common/characterization/facets"
                name="facet"
                _using-name="facet"
                _in-xml-name="facet"
                _in-json-name="facets"
                gi="facet">
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/characterization/facet/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor" -->
      <assembly _step="mitigating-factor"
                _key="mitigating-factors"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors"
                name="mitigating-factor"
                _using-name="mitigating-factor"
                _in-xml-name="mitigating-factor"
                _in-json-name="mitigating-factors"
                gi="mitigating-factor">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='implementation-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor/subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors/subjects"
                name="subject-reference"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:subject-reference"
                _step="subject"
                _key="subjects"
                _key-ref="oscal-assessment-common:subject-reference"
                _using-name="subject"
                _in-xml-name="subject"
                _in-json-name="subjects"
                gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/subject-reference/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/subject-reference/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/mitigating-factor/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='deadline']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/deadline" -->
      <field _step="deadline"
             _key="deadline"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/deadline"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/deadline"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="deadline"
             key="deadline"
             _using-name="deadline"
             _in-xml-name="deadline"
             _in-json-name="deadline"
             gi="deadline"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">deadline</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:[@key='deadline']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response" -->
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/risk/response"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/remediations"
                name="response"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:response"
                _step="response"
                _key="remediations"
                _key-ref="oscal-assessment-common:response"
                _using-name="response"
                _in-xml-name="response"
                _in-json-name="remediations"
                gi="response">
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/response/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/response/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/response/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/response/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset" -->
      <assembly _step="required-asset"
                _key="required-assets"
                _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset"
                _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets"
                name="required-asset"
                _using-name="required-asset"
                _in-xml-name="required-asset"
                _in-json-name="required-assets"
                gi="required-asset">
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
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset/subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets/subjects"
                name="subject-reference"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:subject-reference"
                _step="subject"
                _key="subjects"
                _key-ref="oscal-assessment-common:subject-reference"
                _using-name="subject"
                _in-xml-name="subject"
                _in-json-name="subjects"
                gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/subject/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/subject-reference/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/subject-reference/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response/required-asset/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/task/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/task/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/task/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/task/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/timing" -->
      <assembly _step="timing"
                _key="timing"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing"
                name="timing"
                key="timing"
                _using-name="timing"
                _in-xml-name="timing"
                _in-json-name="timing"
                gi="timing">
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
                _step="on-date"
                _key="on-date"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/on-date"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/on-date"
                name="on-date"
                key="on-date"
                _using-name="on-date"
                _in-xml-name="on-date"
                _in-json-name="on-date"
                gi="on-date">
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
                _step="within-date-range"
                _key="within-date-range"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/within-date-range"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/within-date-range"
                name="within-date-range"
                key="within-date-range"
                _using-name="within-date-range"
                _in-xml-name="within-date-range"
                _in-json-name="within-date-range"
                gi="within-date-range">
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
                _step="at-frequency"
                _key="at-frequency"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/timing/at-frequency"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/timing/at-frequency"
                name="at-frequency"
                key="at-frequency"
                _using-name="at-frequency"
                _in-xml-name="at-frequency"
                _in-json-name="at-frequency"
                gi="at-frequency">
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
      <assembly _step="dependency"
                _key="dependencies"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/dependency"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/dependencies"
                name="dependency"
                _using-name="dependency"
                _in-xml-name="dependency"
                _in-json-name="dependencies"
                gi="dependency">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity" -->
      <assembly _step="associated-activity"
                _key="associated-activities"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/associated-activity"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/associated-activities"
                name="associated-activity"
                _using-name="associated-activity"
                _in-xml-name="associated-activity"
                _in-json-name="associated-activities"
                gi="associated-activity">
         <xsl:apply-templates select="*[@key='activity-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/associated-activity/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/response//task/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log" -->
      <assembly _step="risk-log"
                _key="risk-log"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log"
                name="risk-log"
                key="risk-log"
                _using-name="risk-log"
                _in-xml-name="risk-log"
                _in-json-name="risk-log"
                gi="risk-log">
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
      <assembly _step="entry"
                _key="entries"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries"
                name="entry"
                _using-name="entry"
                _in-xml-name="entry"
                _in-json-name="entries"
                gi="entry">
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='title']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='description']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='start']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/start" -->
      <field _step="start"
             _key="start"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/start"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/start"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="start"
             key="start"
             _using-name="start"
             _in-xml-name="start"
             _in-json-name="start"
             gi="start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='start']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='end']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/end" -->
      <field _step="end"
             _key="end"
             _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/end"
             _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/end"
             collapsible="no"
             as-type="dateTime-with-timezone"
             name="end"
             key="end"
             _using-name="end"
             _in-xml-name="end"
             _in-json-name="end"
             gi="end"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:[@key='end']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response" -->
      <assembly _step="related-response"
                _key="related-responses"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/related-response"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/related-responses"
                name="related-response"
                _using-name="related-response"
                _in-xml-name="related-response"
                _in-json-name="related-responses"
                gi="related-response">
         <xsl:apply-templates select="*[@key='response-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="22">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="22">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="21">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/risk-log/entry/related-response/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="21">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/risk/related-observation" -->
      <assembly as-type="empty"
                _step="related-observation"
                _key="related-observations"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/related-observation"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/related-observations"
                name="related-observation"
                _using-name="related-observation"
                _in-xml-name="related-observation"
                _in-json-name="related-observations"
                gi="related-observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-ar/finding/title"
             _metaschema-json-id="/assembly/oscal-ar/finding/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-ar/finding/description"
             _metaschema-json-id="/assembly/oscal-ar/finding/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject" -->
      <assembly _step="identified-subject"
                _key="identified-subject"
                _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/identified-subject"
                name="identified-subject"
                key="identified-subject"
                _using-name="identified-subject"
                _in-xml-name="identified-subject"
                _in-json-name="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:map[@key='include-all']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/include-all" -->
      <assembly as-type="empty"
                _step="include-all"
                _key="include-all"
                _metaschema-xml-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                _metaschema-json-id="/assembly/oscal-assessment-common/assessment-subject/include-all"
                name="include-all"
                key="include-all"
                _using-name="include-all"
                _in-xml-name="include-all"
                _in-json-name="include-all"
                gi="include-all">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">include-all</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/title" -->
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/title"
             _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/title"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/description" -->
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/description"
             _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/description"
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='status']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/status" -->
      <field _step="status"
             _key="status"
             _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/status"
             _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/status"
             collapsible="no"
             as-type="token"
             name="status"
             key="status"
             _using-name="status"
             _in-xml-name="status"
             _in-json-name="status"
             gi="status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='status']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='reason']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/target/reason" -->
      <field _step="reason"
             _key="reason"
             _metaschema-xml-id="/assembly/oscal-assessment-common/finding-target/reason"
             _metaschema-json-id="/assembly/oscal-assessment-common/finding-target/reason"
             collapsible="no"
             as-type="NCName"
             name="reason"
             key="reason"
             _using-name="reason"
             _in-xml-name="reason"
             _in-json-name="reason"
             gi="reason"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">reason</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:map[@key='target']/j:[@key='reason']"
                 mode="get-value-property"
                 priority="8">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='implementation-statement-uuid']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/implementation-statement-uuid" -->
      <field _step="implementation-statement-uuid"
             _key="implementation-statement-uuid"
             _metaschema-xml-id="/assembly/oscal-ar/finding/implementation-statement-uuid"
             _metaschema-json-id="/assembly/oscal-ar/finding/implementation-statement-uuid"
             collapsible="no"
             as-type="uuid"
             name="implementation-statement-uuid"
             key="implementation-statement-uuid"
             _using-name="implementation-statement-uuid"
             _in-xml-name="implementation-statement-uuid"
             _in-json-name="implementation-statement-uuid"
             gi="implementation-statement-uuid"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implementation-statement-uuid</xsl:attribute>
         </xsl:if>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:[@key='implementation-statement-uuid']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-observations']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/related-observation" -->
      <assembly as-type="empty"
                _step="related-observation"
                _key="related-observations"
                _metaschema-xml-id="/assembly/oscal-ar/finding/related-observation"
                _metaschema-json-id="/assembly/oscal-ar/finding/related-observations"
                name="related-observation"
                _using-name="related-observation"
                _in-xml-name="related-observation"
                _in-json-name="related-observations"
                gi="related-observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:array[@key='results']/j:map/j:array[@key='findings']/j:map/j:array[@key='related-risks']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/result/finding/associated-risk" -->
      <assembly as-type="empty"
                _step="associated-risk"
                _key="related-risks"
                _metaschema-xml-id="/assembly/oscal-ar/finding/associated-risk"
                _metaschema-json-id="/assembly/oscal-ar/finding/related-risks"
                name="associated-risk"
                _using-name="associated-risk"
                _in-xml-name="associated-risk"
                _in-json-name="related-risks"
                gi="associated-risk">
         <xsl:apply-templates select="*[@key='risk-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/description" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/document-id" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/citation/link/text" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value>
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/rlink" -->
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
   <xsl:template match="j:map[@key='assessment-results']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="assessment-results/back-matter/resource/base64" -->
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
