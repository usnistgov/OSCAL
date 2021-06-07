<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                version="3.0"
                exclude-result-prefixes="#all"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
<!-- XML to JSON conversion: pipeline -->
<!-- Supports either of two interfaces:
      simply handle the XML as source (easier), producing the JSON as output, or
      use arguments (equivalent to): -it from-xml produce=json file=[file] (mirrors the JSON converter interface) -->
<!-- Parameter 'produce' supports acquiring outputs other than JSON:
      produce=xpath produces XPath JSON (an XML syntax)
      produce=supermodel produces intermediate (internal) 'supermodel' format-->
<!-- Parameter setting 'json-indent=yes' produces JSON indented using the internal serializer-->
   <xsl:param name="file" as="xs:string?"/>
   <xsl:param name="produce" as="xs:string">json</xsl:param>
   <xsl:param name="json-indent" as="xs:string">no</xsl:param>
   <!-- NB the output method is XML but serialized JSON is written with disable-output-escaping (below)
     permitting inspection of intermediate results without changing the serialization method.-->
   <xsl:output omit-xml-declaration="true" method="xml"/>
   <xsl:variable name="write-options" as="map(*)">
      <xsl:map>
         <xsl:map-entry key="'indent'" expand-text="true">{ $json-indent='yes' }</xsl:map-entry>
      </xsl:map>
   </xsl:variable>
   <xsl:variable name="source-xml" select="/"/>
   <xsl:template match="/" name="from-xml">
      <xsl:param name="source">
         <xsl:choose><!-- evaluating $file as URI relative to nominal source directory -->
            <xsl:when test="exists($file)">
               <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                        select="$file ! document(.,$source-xml)">
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
      <xsl:variable name="supermodel">
         <xsl:apply-templates select="$source/*"/>
      </xsl:variable>
      <xsl:variable name="result">
         <xsl:choose>
            <xsl:when test="$produce = 'supermodel'">
               <xsl:sequence select="$supermodel"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:variable name="new-json-xml">
                  <xsl:apply-templates select="$supermodel/*" mode="write-json"/>
               </xsl:variable>
               <xsl:choose>
                  <xsl:when test="matches($produce,('xpath|xdm|xml'))">
                     <xsl:sequence select="$new-json-xml"/>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                              select="xml-to-json($new-json-xml, $write-options)">
                        <xsl:catch expand-text="true">
                           <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{ $err:description }</nm:ERROR>
                        </xsl:catch>
                     </xsl:try>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:sequence select="$result/*"/>
      <xsl:if test="matches($result,'\S') and empty($result/*)">
         <xsl:value-of select="$result" disable-output-escaping="true"/>
      </xsl:if>
   </xsl:template>
   <!-- XML to JSON conversion: object filters -->
   <xsl:strip-space elements="plan-of-action-and-milestones metadata revision prop link role location address party responsible-party import-ssp local-definitions component status responsible-role protocol port-range inventory-item implemented-component observation origin actor related-task subject include-all include-subject exclude-subject identified-subject relevant-evidence risk characterization facet mitigating-factor response required-asset task timing on-date within-date-range at-frequency dependency associated-activity risk-log entry logged-by related-response related-observation poam-item associated-risk back-matter resource citation rlink"/>
   <!-- METASCHEMA conversion stylesheet supports XML -> METASCHEMA/SUPERMODEL conversion -->
   <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->
   <!-- METASCHEMA:  in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="plan-of-action-and-milestones"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones"
                name="plan-of-action-and-milestones"
                key="plan-of-action-and-milestones"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_poam_metaschema.xml"
                _key-name="oscal-poam:plan-of-action-and-milestones"
                _using-root-name="plan-of-action-and-milestones"
                gi="plan-of-action-and-milestones">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">plan-of-action-and-milestones</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="metadata"/>
         <xsl:apply-templates select="import-ssp"/>
         <xsl:apply-templates select="system-id"/>
         <xsl:apply-templates select="local-definitions"/>
         <xsl:for-each-group select="observation" group-by="true()">
            <group in-json="ARRAY" key="observations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="risk" group-by="true()">
            <group in-json="ARRAY" key="risks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="poam-item" group-by="true()">
            <group in-json="ARRAY" key="poam-items">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="back-matter"/>
      </assembly>
   </xsl:template>
   <xsl:template match="metadata"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/metadata"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/metadata"
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
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="published"/>
         <xsl:apply-templates select="last-modified"/>
         <xsl:apply-templates select="version"/>
         <xsl:apply-templates select="oscal-version"/>
         <xsl:apply-templates select="revisions"/>
         <xsl:for-each-group select="document-id" group-by="true()">
            <group in-json="ARRAY" key="document-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="role" group-by="true()">
            <group in-json="ARRAY" key="roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="location" group-by="true()">
            <group in-json="ARRAY" key="locations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="party" group-by="true()">
            <group in-json="ARRAY" key="parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-party" group-by="true()">
            <group in-json="ARRAY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="prop"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@ns"/>
         <xsl:apply-templates select="@value"/>
         <xsl:apply-templates select="@class"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="link"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="@rel"/>
         <xsl:apply-templates select="@media-type"/>
         <xsl:apply-templates select="text"/>
      </assembly>
   </xsl:template>
   <xsl:template match="role"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@id"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="short-name"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="location"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="address"/>
         <xsl:for-each-group select="email-address" group-by="true()">
            <group in-json="ARRAY" key="email-addresses">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="telephone-number" group-by="true()">
            <group in-json="ARRAY" key="telephone-numbers">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="url" group-by="true()">
            <group in-json="ARRAY" key="urls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="party"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="name"/>
         <xsl:apply-templates select="short-name"/>
         <xsl:for-each-group select="external-id" group-by="true()">
            <group in-json="ARRAY" key="external-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="email-address" group-by="true()">
            <group in-json="ARRAY" key="email-addresses">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="telephone-number" group-by="true()">
            <group in-json="ARRAY" key="telephone-numbers">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="address" group-by="true()">
            <group in-json="ARRAY" key="addresses">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="location-uuid" group-by="true()">
            <group in-json="ARRAY" key="location-uuids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="member-of-organization" group-by="true()">
            <group in-json="ARRAY" key="member-of-organizations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="responsible-party"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="party-uuid" group-by="true()">
            <group in-json="ARRAY" key="party-uuids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="import-ssp"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/import-ssp"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/import-ssp"
                name="import-ssp"
                key="import-ssp"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_assessment-common_metaschema.xml"
                _key-name="oscal-assessment-common:import-ssp"
                _step="import-ssp"
                _key="import-ssp"
                _key-ref="oscal-assessment-common:import-ssp"
                _using-name="import-ssp"
                _in-xml-name="import-ssp"
                _in-json-name="import-ssp"
                gi="import-ssp">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ssp</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="local-definitions"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/local-definitions"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/local-definitions"
                name="local-definitions"
                key="local-definitions"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_poam_metaschema.xml"
                _key-name="oscal-poam:local-definitions"
                _step="local-definitions"
                _key="local-definitions"
                _key-ref="oscal-poam:local-definitions"
                _using-name="local-definitions"
                _in-xml-name="local-definitions"
                _in-json-name="local-definitions"
                gi="local-definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:for-each-group select="component" group-by="true()">
            <group in-json="ARRAY" key="components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="inventory-item" group-by="true()">
            <group in-json="ARRAY" key="inventory-items">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="component"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/local-definitions/component"
                _metaschema-json-id="/assembly/oscal-poam/local-definitions/components"
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:apply-templates select="purpose"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="status"/>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="ARRAY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="protocol" group-by="true()">
            <group in-json="ARRAY" key="protocols">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="responsible-role"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="party-uuid" group-by="true()">
            <group in-json="ARRAY" key="party-uuids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="protocol"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="port-range" group-by="true()">
            <group in-json="ARRAY" key="port-ranges">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="port-range"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@start"/>
         <xsl:apply-templates select="@end"/>
         <xsl:apply-templates select="@transport"/>
      </assembly>
   </xsl:template>
   <xsl:template match="inventory-item"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/local-definitions/inventory-item"
                _metaschema-json-id="/assembly/oscal-poam/local-definitions/inventory-items"
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-party" group-by="true()">
            <group in-json="ARRAY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="implemented-component" group-by="true()">
            <group in-json="ARRAY" key="implemented-components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="observation"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/observation"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/observations"
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="method" group-by="true()">
            <group in-json="ARRAY" key="methods">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="type" group-by="true()">
            <group in-json="ARRAY" key="types">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="origin" group-by="true()">
            <group in-json="ARRAY" key="origins">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="relevant-evidence" group-by="true()">
            <group in-json="ARRAY" key="relevant-evidence">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="collected"/>
         <xsl:apply-templates select="expires"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="origin"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:for-each-group select="actor" group-by="true()">
            <group in-json="ARRAY" key="actors">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="related-task" group-by="true()">
            <group in-json="ARRAY" key="related-tasks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="actor"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@actor-uuid"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="related-task"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/origin/related-task"
                _metaschema-json-id="/assembly/oscal-assessment-common/origin/related-tasks"
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
         <xsl:apply-templates select="@task-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-party" group-by="true()">
            <group in-json="ARRAY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="identified-subject"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="subject"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/related-task/subject"
                _metaschema-json-id="/assembly/oscal-assessment-common/related-task/subjects"
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
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="include-all"/>
         <xsl:for-each-group select="include-subject" group-by="true()">
            <group in-json="ARRAY" key="include-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-subject" group-by="true()">
            <group in-json="ARRAY" key="exclude-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="include-subject"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="exclude-subject"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="risk"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/risk"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/risks"
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:apply-templates select="statement"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="status"/>
         <xsl:for-each-group select="origin" group-by="true()">
            <group in-json="ARRAY" key="origins">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="threat-id" group-by="true()">
            <group in-json="ARRAY" key="threat-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="characterization" group-by="true()">
            <group in-json="ARRAY" key="characterizations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="mitigating-factor" group-by="true()">
            <group in-json="ARRAY" key="mitigating-factors">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="deadline"/>
         <xsl:for-each-group select="response" group-by="true()">
            <group in-json="ARRAY" key="remediations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="risk-log"/>
         <xsl:for-each-group select="related-observation" group-by="true()">
            <group in-json="ARRAY" key="related-observations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="characterization"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="origin"/>
         <xsl:for-each-group select="facet" group-by="true()">
            <group in-json="ARRAY" key="facets">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="task"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-assessment-common/response/task"
                _metaschema-json-id="/assembly/oscal-assessment-common/response/tasks"
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="timing"/>
         <xsl:for-each-group select="dependency" group-by="true()">
            <group in-json="ARRAY" key="dependencies">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="task" group-by="true()">
            <group in-json="ARRAY" key="tasks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="associated-activity" group-by="true()">
            <group in-json="ARRAY" key="associated-activities">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="ARRAY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="logged-by"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/logged-by"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/logged-by"
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
         <xsl:apply-templates select="@party-uuid"/>
         <xsl:apply-templates select="@role-id"/>
      </assembly>
   </xsl:template>
   <xsl:template match="poam-item"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/poam-item"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/poam-items"
                name="poam-item"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_poam_metaschema.xml"
                _key-name="oscal-poam:poam-item"
                _step="poam-item"
                _key="poam-items"
                _key-ref="oscal-poam:poam-item"
                _using-name="poam-item"
                _in-xml-name="poam-item"
                _in-json-name="poam-items"
                gi="poam-item">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="origin" group-by="true()">
            <group in-json="ARRAY" key="origins">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="related-observation" group-by="true()">
            <group in-json="ARRAY" key="related-observations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="associated-risk" group-by="true()">
            <group in-json="ARRAY" key="related-risks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="back-matter"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/back-matter"
                _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/back-matter"
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
         <xsl:for-each-group select="resource" group-by="true()">
            <group in-json="ARRAY" key="resources">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="remarks"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="location-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="party-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="system-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/system-id"
             _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/system-id"
             collapsible="no"
             as-type="string"
             name="system-id"
             key="system-id"
             _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
             _key-name="oscal-implementation-common:system-id"
             _step="system-id"
             _key="system-id"
             _key-ref="oscal-implementation-common:system-id"
             _using-name="system-id"
             _in-xml-name="system-id"
             _in-json-name="system-id"
             gi="system-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@identifier-type"/>
         <value as-type="string" key="id" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="threat-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@system"/>
         <xsl:apply-templates select="@href"/>
         <value as-type="uri" key="id" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="status-change"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="hash"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@algorithm"/>
         <value as-type="string" key="value" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-poam/plan-of-action-and-milestones/uuid"
            _metaschema-json-id="/assembly/oscal-poam/plan-of-action-and-milestones/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="prop/@name"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="prop/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="prop/@ns"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="prop/@value"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="prop/@class"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="link/@href"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="link/@rel"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="link/@media-type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/metadata/document-id/@scheme | plan-of-action-and-milestones/back-matter/resource/document-id/@scheme"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="role/@id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="location/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/@type | plan-of-action-and-milestones/metadata/party/address/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/telephone-number/@type | plan-of-action-and-milestones/metadata/party/telephone-number/@type"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="party/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="party/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/external-id/@scheme"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="responsible-party/@role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="import-ssp/@href"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-assessment-common/import-ssp/href"
            _metaschema-json-id="/assembly/oscal-assessment-common/import-ssp/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="system-id/@identifier-type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="component/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="component/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/status/@state"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="responsible-role/@role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="protocol/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="protocol/@name"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="port-range/@start"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="port-range/@end"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="port-range/@transport"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="inventory-item/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/@component-uuid"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="observation/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="actor/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="actor/@actor-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="actor/@role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="related-task/@task-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="subject/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="include-subject/@subject-uuid | exclude-subject/@subject-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="include-subject/@type | exclude-subject/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/@subject-placeholder-uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/observation/subject/@subject-uuid | plan-of-action-and-milestones/risk/mitigating-factor/subject/@subject-uuid | plan-of-action-and-milestones/risk/response/required-asset/subject/@subject-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/observation/subject/@type | plan-of-action-and-milestones/risk/mitigating-factor/subject/@type | plan-of-action-and-milestones/risk/response/required-asset/subject/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/observation/relevant-evidence/@href"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="risk/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="threat-id/@system"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="threat-id/@href"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/facet/@name"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/facet/@system"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/facet/@value"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/@uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/@implementation-uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/@uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/@lifecycle"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/@uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="task/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="task/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/on-date/@date"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range/@start"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range/@end"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency/@period"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency/@unit"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/dependency/@task-uuid"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/@activity-uuid"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/@uuid"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="logged-by/@party-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="logged-by/@role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/@response-uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/risk/related-observation/@observation-uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="poam-item/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-poam/poam-item/uuid"
            _metaschema-json-id="/assembly/oscal-poam/poam-item/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/poam-item/related-observation/@observation-uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="observation-uuid"
            _key="observation-uuid"
            _metaschema-xml-id="/assembly/oscal-poam/poam-item/related-observation/observation-uuid"
            _metaschema-json-id="/assembly/oscal-poam/poam-item/related-observations/observation-uuid"
            name="observation-uuid"
            key="observation-uuid"
            _using-name="observation-uuid"
            _in-xml-name="observation-uuid"
            _in-json-name="observation-uuid"
            gi="observation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/poam-item/associated-risk/@risk-uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="risk-uuid"
            _key="risk-uuid"
            _metaschema-xml-id="/assembly/oscal-poam/poam-item/associated-risk/risk-uuid"
            _metaschema-json-id="/assembly/oscal-poam/poam-item/related-risks/risk-uuid"
            name="risk-uuid"
            key="risk-uuid"
            _using-name="risk-uuid"
            _in-xml-name="risk-uuid"
            _in-json-name="risk-uuid"
            gi="risk-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/@uuid"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/rlink/@href"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/rlink/@media-type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="hash/@algorithm"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/base64/@filename"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/base64/@media-type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="plan-of-action-and-milestones/metadata/title"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/published"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/last-modified"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/version"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/oscal-version"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="published"/>
         <xsl:apply-templates select="last-modified"/>
         <xsl:apply-templates select="version"/>
         <xsl:apply-templates select="oscal-version"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="revision"/>
      </group>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/published"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/last-modified"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/version"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/oscal-version"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/revisions/revision/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/document-id"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="identifier" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/link/text"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/role/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/role/short-name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/role/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/role/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@type"/>
         <xsl:for-each-group select="addr-line" group-by="true()">
            <group in-json="ARRAY" key="addr-lines">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="city"/>
         <xsl:apply-templates select="state"/>
         <xsl:apply-templates select="postal-code"/>
         <xsl:apply-templates select="country"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/addr-line"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/city"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/state"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/postal-code"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/address/country"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/email-address"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/telephone-number"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@type"/>
         <value as-type="string" key="number" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/location/url"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/location/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/short-name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/external-id"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="id" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/party/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/email-address"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/telephone-number"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@type"/>
         <value as-type="string" key="number" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@type"/>
         <xsl:for-each-group select="addr-line" group-by="true()">
            <group in-json="ARRAY" key="addr-lines">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="city"/>
         <xsl:apply-templates select="state"/>
         <xsl:apply-templates select="postal-code"/>
         <xsl:apply-templates select="country"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address/addr-line"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address/city"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address/state"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address/postal-code"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/address/country"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/party/member-of-organization"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/metadata/responsible-party/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/purpose"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/status"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@state"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/responsible-role/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/component/protocol/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/responsible-party/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="implemented-component"
                _key="implemented-components"
                _metaschema-xml-id="/assembly/oscal-implementation-common/inventory-item/implemented-component"
                _metaschema-json-id="/assembly/oscal-implementation-common/inventory-item/implemented-components"
                name="implemented-component"
                _using-name="implemented-component"
                _in-xml-name="implemented-component"
                _in-json-name="implemented-components"
                gi="implemented-component">
         <xsl:apply-templates select="@component-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-party" group-by="true()">
            <group in-json="ARRAY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/responsible-party/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/title"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/link/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/method"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/type"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/actor/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/responsible-party/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/subject/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/subject/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/subject/include-all"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/subject/include-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/subject/exclude-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-placeholder-uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/description"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/include-all"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/include-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/exclude-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/subject"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/observation/subject/title"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/subject/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/relevant-evidence"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="relevant-evidence"
                _key="relevant-evidence"
                _metaschema-xml-id="/assembly/oscal-assessment-common/observation/relevant-evidence"
                _metaschema-json-id="/assembly/oscal-assessment-common/observation/relevant-evidence"
                name="relevant-evidence"
                _using-name="relevant-evidence"
                _in-xml-name="relevant-evidence"
                _in-json-name="relevant-evidence"
                gi="relevant-evidence">
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/observation/relevant-evidence/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/relevant-evidence/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/collected"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/observation/expires"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/title"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/statement"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/link/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/status"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/actor/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/responsible-party/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/subject/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/subject/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/subject/include-all"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/subject/include-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/subject/exclude-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-placeholder-uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/description"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/include-all"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/include-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/exclude-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/actor/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/responsible-party/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/description"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/include-all"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/include-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/exclude-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-placeholder-uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/facet"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="facet"
                _key="facets"
                _metaschema-xml-id="/assembly/oscal-assessment-common/characterization/facet"
                _metaschema-json-id="/assembly/oscal-assessment-common/characterization/facets"
                name="facet"
                _using-name="facet"
                _in-xml-name="facet"
                _in-json-name="facets"
                gi="facet">
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@system"/>
         <xsl:apply-templates select="@value"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/characterization/facet/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="mitigating-factor"
                _key="mitigating-factors"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/mitigating-factor"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/mitigating-factors"
                name="mitigating-factor"
                _using-name="mitigating-factor"
                _in-xml-name="mitigating-factor"
                _in-json-name="mitigating-factors"
                gi="mitigating-factor">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@implementation-uuid"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/subject"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/subject/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/mitigating-factor/subject/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/deadline"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@lifecycle"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="origin" group-by="true()">
            <group in-json="ARRAY" key="origins">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="required-asset" group-by="true()">
            <group in-json="ARRAY" key="required-assets">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="task" group-by="true()">
            <group in-json="ARRAY" key="tasks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response/title"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/actor/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-placeholder-uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/description"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/include-all"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/include-subject/link/text"
                 priority="19"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/exclude-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="required-asset"
                _key="required-assets"
                _metaschema-xml-id="/assembly/oscal-assessment-common/response/required-asset"
                _metaschema-json-id="/assembly/oscal-assessment-common/response/required-assets"
                name="required-asset"
                _using-name="required-asset"
                _in-xml-name="required-asset"
                _in-json-name="required-assets"
                gi="required-asset">
         <xsl:apply-templates select="@uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/subject"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-uuid"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/subject/title"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/subject/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response/required-asset/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="on-date"/>
         <xsl:apply-templates select="within-date-range"/>
         <xsl:apply-templates select="at-frequency"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/on-date"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@date"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@start"/>
         <xsl:apply-templates select="@end"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@period"/>
         <xsl:apply-templates select="@unit"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/dependency"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="dependency"
                _key="dependencies"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/dependency"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/dependencies"
                name="dependency"
                _using-name="dependency"
                _in-xml-name="dependency"
                _in-json-name="dependencies"
                gi="dependency">
         <xsl:apply-templates select="@task-uuid"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="associated-activity"
                _key="associated-activities"
                _metaschema-xml-id="/assembly/oscal-assessment-common/task/associated-activity"
                _metaschema-json-id="/assembly/oscal-assessment-common/task/associated-activities"
                name="associated-activity"
                _using-name="associated-activity"
                _in-xml-name="associated-activity"
                _in-json-name="associated-activities"
                gi="associated-activity">
         <xsl:apply-templates select="@activity-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="ARRAY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/responsible-role/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/subject/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/subject/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/subject/include-all"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/subject/include-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/subject/exclude-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/response//task/responsible-role/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:for-each-group select="entry" group-by="true()">
            <group in-json="ARRAY" key="entries">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="entry"
                _key="entries"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries"
                name="entry"
                _using-name="entry"
                _in-xml-name="entry"
                _in-json-name="entries"
                gi="entry">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:apply-templates select="start"/>
         <xsl:apply-templates select="end"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="logged-by" group-by="true()">
            <group in-json="ARRAY" key="logged-by">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="status-change"/>
         <xsl:for-each-group select="related-response" group-by="true()">
            <group in-json="ARRAY" key="related-responses">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/start"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/end"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="related-response"
                _key="related-responses"
                _metaschema-xml-id="/assembly/oscal-assessment-common/risk/risk-log/entry/related-response"
                _metaschema-json-id="/assembly/oscal-assessment-common/risk/risk-log/entries/related-responses"
                name="related-response"
                _using-name="related-response"
                _in-xml-name="related-response"
                _in-json-name="related-responses"
                gi="related-response">
         <xsl:apply-templates select="@response-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="related-task" group-by="true()">
            <group in-json="ARRAY" key="related-tasks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/responsible-party/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/description"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/include-all"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/include-subject/link/text"
                 priority="19"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/exclude-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@subject-placeholder-uuid"/>
         <xsl:for-each-group select="subject" group-by="true()">
            <group in-json="ARRAY" key="subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/description"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-all"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-subject/link/text"
                 priority="20"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/exclude-subject/link/text"
                 priority="19"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/risk/related-observation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@observation-uuid"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/poam-item/title"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-poam/poam-item/title"
             _metaschema-json-id="/assembly/oscal-poam/poam-item/title"
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
   <xsl:template match="plan-of-action-and-milestones/poam-item/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-poam/poam-item/description"
             _metaschema-json-id="/assembly/oscal-poam/poam-item/description"
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
   <xsl:template match="plan-of-action-and-milestones/poam-item/link/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/poam-item/origin"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="origin"
                _key="origins"
                _metaschema-xml-id="/assembly/oscal-poam/poam-item/origin"
                _metaschema-json-id="/assembly/oscal-poam/poam-item/origins"
                name="origin"
                _using-name="origin"
                _in-xml-name="origin"
                _in-json-name="origins"
                gi="origin">
         <xsl:for-each-group select="actor" group-by="true()">
            <group in-json="ARRAY" key="actors">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/poam-item/origin/actor/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/poam-item/related-observation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly as-type="empty"
                _step="related-observation"
                _key="related-observations"
                _metaschema-xml-id="/assembly/oscal-poam/poam-item/related-observation"
                _metaschema-json-id="/assembly/oscal-poam/poam-item/related-observations"
                name="related-observation"
                _using-name="related-observation"
                _in-xml-name="related-observation"
                _in-json-name="related-observations"
                gi="related-observation">
         <xsl:apply-templates select="@observation-uuid"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/poam-item/associated-risk"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly as-type="empty"
                _step="associated-risk"
                _key="related-risks"
                _metaschema-xml-id="/assembly/oscal-poam/poam-item/associated-risk"
                _metaschema-json-id="/assembly/oscal-poam/poam-item/related-risks"
                name="associated-risk"
                _using-name="associated-risk"
                _in-xml-name="associated-risk"
                _in-json-name="related-risks"
                gi="associated-risk">
         <xsl:apply-templates select="@risk-uuid"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="resource"
                _key="resources"
                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource"
                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources"
                name="resource"
                _using-name="resource"
                _in-xml-name="resource"
                _in-json-name="resources"
                gi="resource">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="document-id" group-by="true()">
            <group in-json="ARRAY" key="document-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="citation"/>
         <xsl:for-each-group select="rlink" group-by="true()">
            <group in-json="ARRAY" key="rlinks">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="base64"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/document-id"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="identifier" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/citation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="text"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="link" group-by="true()">
            <group in-json="ARRAY" key="links">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/citation/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/citation/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/rlink"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _step="rlink"
                _key="rlinks"
                _metaschema-xml-id="/assembly/oscal-metadata/back-matter/resource/rlink"
                _metaschema-json-id="/assembly/oscal-metadata/back-matter/resources/rlinks"
                name="rlink"
                _using-name="rlink"
                _in-xml-name="rlink"
                _in-json-name="rlinks"
                gi="rlink">
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="@media-type"/>
         <xsl:for-each-group select="hash" group-by="true()">
            <group in-json="ARRAY" key="hashes">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="plan-of-action-and-milestones/back-matter/resource/base64"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
         <xsl:apply-templates select="@filename"/>
         <xsl:apply-templates select="@media-type"/>
         <value as-type="base64Binary" key="value" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <!-- XML to JSON conversion: Supermodel serialization as JSON
        including markdown production -->
   <xsl:variable xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 name="ns"
                 select="/*/@namespace"/>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="group"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <array>
         <xsl:copy-of select="@key"/>
         <xsl:apply-templates mode="#current"/>
      </array>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="group[@in-json='BY_KEY']"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <map>
         <xsl:copy-of select="@key"/>
         <xsl:apply-templates mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="flag[@key=../@json-key-flag]"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"/>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="group[@in-json='SINGLETON_OR_ARRAY'][count(*)=1]"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:apply-templates mode="write-json">
         <xsl:with-param name="group-key" select="@key"/>
      </xsl:apply-templates>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 priority="2"
                 match="group/assembly | group/field"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
        <!-- $group-key is only provided when group/@in-json="SINGLETON_OR_ASSEMBLY" and there is one member of the group -->
      <xsl:param name="group-key" select="()"/>
      <!--@json-key-flag is only available when group/@in-json="BY_KEY"-->
      <xsl:variable name="json-key-flag-name" select="@json-key-flag"/>
      <!-- this will be an array member unless its group is a singleton or BY_KEY -->
      <!-- so we want no key except -->
      <map>
            <!-- we take a $group-key if given -->
         <xsl:copy-of select="$group-key"/>
         <!-- when there's a JSON key flag, we get the key from there -->
         <xsl:for-each select="flag[@key=$json-key-flag-name]">
            <xsl:attribute name="key" select="."/>
         </xsl:for-each>
         <xsl:apply-templates mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 priority="3"
                 match="group/field[@in-json='SCALAR']"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:param name="group-key" select="()"/>
      <xsl:variable name="json-key-flag-name" select="@json-key-flag"/>
      <!-- with no flags, this field has only its value -->
      <xsl:apply-templates mode="write-json">
         <xsl:with-param name="use-key" select="flag[@key = $json-key-flag-name]"/>
      </xsl:apply-templates>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="/assembly"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <map>
         <xsl:next-match/>
      </map>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="assembly"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <map key="{@key}">
         <xsl:apply-templates mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="field"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <map key="{@key}">
         <xsl:apply-templates mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="field[@in-json='SCALAR']"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:apply-templates mode="#current"/>
      <!--
        <!-\- when there are no flags, the field is a string whose value is the value -\->
        <string>
            <xsl:copy-of select="@key"/>
            <xsl:value-of select="value"/>
        </string> -->
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="flag[@key=../value/@key-flag]"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"/>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="flag"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:element name="{(@in-json[matches(.,'\S')],'string')[1]}"
                   namespace="http://www.w3.org/2005/xpath-functions">
         <xsl:copy-of select="@key"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 priority="2"
                 match="field[exists(@json-key-flag)]/value"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:variable name="key-flag-name" select="../@json-key-flag"/>
      <xsl:element name="{@in-json}" namespace="http://www.w3.org/2005/xpath-functions">
         <xsl:attribute name="key" select="../flag[@key = $key-flag-name]"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="value"
                 mode="write-json"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:variable name="key-flag-name" select="@key-flag"/>
      <xsl:element name="{(@in-json[matches(.,'\S')],'string')[1]}"
                   namespace="http://www.w3.org/2005/xpath-functions">
         <xsl:copy-of select="((../flag[@key=$key-flag-name],parent::field[@in-json = 'SCALAR'])/@key, @key)[1]"/>
         <!-- overriding the key           -->
         <xsl:if test="exists(@key-flag)">
            <xsl:attribute name="key">
               <xsl:apply-templates select="../flag[@name=$key-flag-name]" mode="cast-data"/>
            </xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="cast-data"/>
      </xsl:element>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="*"
                 mode="cast-data"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="value[@as-type='markup-line']"
                 mode="cast-data"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:apply-templates mode="md"/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 match="value[@as-type='markup-multiline']"
                 mode="cast-data"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:variable name="lines" as="node()*">
         <xsl:apply-templates select="*" mode="md"/>
      </xsl:variable>
      <xsl:value-of select="$lines/self::* =&gt; string-join('&#xA;')"/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 name="conditional-lf"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:if test="exists(preceding-sibling::*)">
         <string/>
      </xsl:if>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="text()[empty(ancestor::pre)]"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:variable name="escaped">
         <xsl:value-of select="replace(., '([`~\^\*&#34;])', '\\$1')"/>
      </xsl:variable>
      <xsl:value-of select="replace($escaped,'\s+',' ')"/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="text()"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
        <!-- Escapes go here       -->
        <!-- prefixes ` ~ ^ * with char E0000 from Unicode PUA -->
        <!--<xsl:value-of select="replace(., '([`~\^\*''&quot;])', '&#xE0000;$1')"/>-->
        <!-- prefixes ` ~ ^ * ' " with reverse solidus -->
      <xsl:value-of select="replace(., '([`~\^\*&#34;])', '\\$1')"/>
      <!--<xsl:value-of select="."/>-->
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="p"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:call-template name="conditional-lf"/>
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="h1 | h2 | h3 | h4 | h5 | h6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:call-template name="conditional-lf"/>
      <string>
         <xsl:apply-templates select="." mode="mark"/>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h1"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"># </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h2"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">## </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h3"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">### </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">#### </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">##### </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="mark"
                 match="h6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">###### </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="table"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:call-template name="conditional-lf"/>
      <xsl:apply-templates select="*" mode="md"/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="tr"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <string>
         <xsl:apply-templates select="*" mode="md"/>
      </string>
      <xsl:if test="empty(preceding-sibling::tr)">
         <string>
            <xsl:text>|</xsl:text>
            <xsl:for-each select="th | td">
               <xsl:text> --- |</xsl:text>
            </xsl:for-each>
         </string>
      </xsl:if>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="th | td"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:if test="empty(preceding-sibling::*)">|</xsl:if>
      <xsl:text> </xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text> |</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 priority="1"
                 match="pre"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:call-template name="conditional-lf"/>
      <string>```</string>
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
      <string>```</string>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 priority="1"
                 match="ul | ol"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:call-template name="conditional-lf"/>
      <xsl:apply-templates mode="md"/>
      <string/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="ul//ul | ol//ol | ol//ul | ul//ol"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:apply-templates mode="md"/>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="li"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <string>
         <xsl:for-each select="(../ancestor::ul | ../ancestor::ol)">
            <xsl:text>  </xsl:text>
         </xsl:for-each>
         <xsl:text>* </xsl:text>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="ol/li"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <string>
         <xsl:for-each select="(../ancestor::ul | ../ancestor::ol)">
            <xsl:text xml:space="preserve">  </xsl:text>
         </xsl:for-each>
         <xsl:text>1. </xsl:text>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="code | span[contains(@class, 'code')]"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>`</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>`</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="em | i"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>*</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>*</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="strong | b"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>**</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>**</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="q"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>"</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>"</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="insert"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>{{ insert: </xsl:text>
      <xsl:value-of select="@type, @id-ref" separator=", "/>
      <xsl:text> }}</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="a"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>[</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>]</xsl:text>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="@href"/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                 xmlns="http://www.w3.org/2005/xpath-functions"
                 mode="md"
                 match="img"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
      <xsl:text>![</xsl:text>
      <xsl:value-of select="(@alt,@src)[1]"/>
      <xsl:text>]</xsl:text>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="@src"/>
      <xsl:for-each select="@title">
         <xsl:text expand-text="true"> "{.}"</xsl:text>
      </xsl:for-each>
      <xsl:text>)</xsl:text>
   </xsl:template>
</xsl:stylesheet>
