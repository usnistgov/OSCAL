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
   <xsl:strip-space elements="component-definition metadata revision prop link role location address party responsible-party import-component-definition component responsible-role protocol port-range control-implementation set-parameter implemented-requirement statement capability incorporates-component back-matter resource citation rlink"/>
   <!-- METASCHEMA conversion stylesheet supports XML -> METASCHEMA/SUPERMODEL conversion -->
   <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->
   <!-- METASCHEMA:  in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="component-definition"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/component-definition"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition"
                name="component-definition"
                key="component-definition"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:component-definition"
                _using-root-name="component-definition"
                gi="component-definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">component-definition</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="metadata"/>
         <xsl:for-each-group select="import-component-definition" group-by="true()">
            <group in-json="ARRAY" key="import-component-definitions">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="component" group-by="true()">
            <group in-json="ARRAY" key="components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="capability" group-by="true()">
            <group in-json="ARRAY" key="capabilities">
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
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/metadata"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition/metadata"
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
   <xsl:template match="import-component-definition"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly as-type="empty"
                _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/import-component-definition"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition/import-component-definitions"
                name="import-component-definition"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:import-component-definition"
                _step="import-component-definition"
                _key="import-component-definitions"
                _key-ref="oscal-component-definition:import-component-definition"
                _using-name="import-component-definition"
                _in-xml-name="import-component-definition"
                _in-json-name="import-component-definitions"
                gi="import-component-definition">
         <xsl:apply-templates select="@href"/>
      </assembly>
   </xsl:template>
   <xsl:template match="component"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/component"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition/components"
                name="defined-component"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:defined-component"
                _step="component"
                _key="components"
                _key-ref="oscal-component-definition:defined-component"
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
         <xsl:for-each-group select="control-implementation" group-by="true()">
            <group in-json="ARRAY" key="control-implementations">
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
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/responsible-role"
                _metaschema-json-id="/assembly/oscal-component-definition/defined-component/responsible-roles"
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
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/protocol"
                _metaschema-json-id="/assembly/oscal-component-definition/defined-component/protocols"
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
   <xsl:template match="set-parameter"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/set-parameter"
                _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/set-parameters"
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
         <xsl:apply-templates select="@param-id"/>
         <xsl:for-each-group select="value" group-by="true()">
            <group in-json="ARRAY" key="values">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="capability"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/capability"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition/capabilities"
                name="capability"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:capability"
                _step="capability"
                _key="capabilities"
                _key-ref="oscal-component-definition:capability"
                _using-name="capability"
                _in-xml-name="capability"
                _in-json-name="capabilities"
                gi="capability">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@name"/>
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
         <xsl:for-each-group select="incorporates-component" group-by="true()">
            <group in-json="ARRAY" key="incorporates-components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="control-implementation" group-by="true()">
            <group in-json="ARRAY" key="control-implementations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="incorporates-component"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/capability/incorporates-component"
                _metaschema-json-id="/assembly/oscal-component-definition/capability/incorporates-components"
                name="incorporates-component"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:incorporates-component"
                _step="incorporates-component"
                _key="incorporates-components"
                _key-ref="oscal-component-definition:incorporates-component"
                _using-name="incorporates-component"
                _in-xml-name="incorporates-component"
                _in-json-name="incorporates-components"
                gi="incorporates-component">
         <xsl:apply-templates select="@component-uuid"/>
         <xsl:apply-templates select="description"/>
      </assembly>
   </xsl:template>
   <xsl:template match="back-matter"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/back-matter"
                _metaschema-json-id="/assembly/oscal-component-definition/component-definition/back-matter"
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
   <xsl:template match="component-definition/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/component-definition/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/component-definition/uuid"
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
   <xsl:template match="component-definition/metadata/document-id/@scheme | component-definition/back-matter/resource/document-id/@scheme"
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
   <xsl:template match="component-definition/metadata/location/address/@type | component-definition/metadata/party/address/@type"
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
   <xsl:template match="component-definition/metadata/location/telephone-number/@type | component-definition/metadata/party/telephone-number/@type"
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
   <xsl:template match="component-definition/metadata/party/external-id/@scheme"
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
   <xsl:template match="import-component-definition/@href"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            _step="href"
            _key="href"
            _metaschema-xml-id="/assembly/oscal-component-definition/import-component-definition/href"
            _metaschema-json-id="/assembly/oscal-component-definition/import-component-definition/href"
            name="href"
            key="href"
            _using-name="href"
            _in-xml-name="href"
            _in-json-name="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="component/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/defined-component/uuid"
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
            _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/type"
            _metaschema-json-id="/assembly/oscal-component-definition/defined-component/type"
            name="defined-component-type"
            key="type"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
            _key-name="oscal-component-definition:defined-component-type"
            _step="type"
            _key="type"
            _key-ref="oscal-component-definition:defined-component-type"
            _using-name="type"
            _in-xml-name="type"
            _in-json-name="type"
            gi="type">
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
   <xsl:template match="component-definition/component/control-implementation/@uuid | component-definition/capability/control-implementation/@uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="component-definition/component/control-implementation/@source | component-definition/capability/control-implementation/@source"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/source"
            _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/source"
            name="source"
            key="source"
            _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_implementation-common_metaschema.xml"
            _key-name="oscal-implementation-common:source"
            _step="source"
            _key="source"
            _key-ref="oscal-implementation-common:source"
            _using-name="source"
            _in-xml-name="source"
            _in-json-name="source"
            gi="source">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="set-parameter/@param-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/@uuid | component-definition/capability/control-implementation/implemented-requirement/@uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/@control-id | component-definition/capability/control-implementation/implemented-requirement/@control-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/control-id"
            _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/control-id"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement/@statement-id | component-definition/capability/control-implementation/implemented-requirement/statement/@statement-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="token"
            _metaschema-xml-id="/assembly/oscal-component-definition/statement/statement-id"
            _metaschema-json-id="/assembly/oscal-component-definition/statement/statement-id"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement/@uuid | component-definition/capability/control-implementation/implemented-requirement/statement/@uuid"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/statement/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/statement/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="capability/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="uuid"
            _key="uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/capability/uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/capability/uuid"
            name="uuid"
            key="uuid"
            _using-name="uuid"
            _in-xml-name="uuid"
            _in-json-name="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="capability/@name"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            _step="name"
            _key="name"
            _metaschema-xml-id="/assembly/oscal-component-definition/capability/name"
            _metaschema-json-id="/assembly/oscal-component-definition/capability/name"
            name="name"
            key="name"
            _using-name="name"
            _in-xml-name="name"
            _in-json-name="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="incorporates-component/@component-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            _step="component-uuid"
            _key="component-uuid"
            _metaschema-xml-id="/assembly/oscal-component-definition/incorporates-component/component-uuid"
            _metaschema-json-id="/assembly/oscal-component-definition/incorporates-component/component-uuid"
            name="component-uuid"
            key="component-uuid"
            _using-name="component-uuid"
            _in-xml-name="component-uuid"
            _in-json-name="component-uuid"
            gi="component-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="component-definition/back-matter/resource/@uuid"
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
   <xsl:template match="component-definition/back-matter/resource/rlink/@href"
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
   <xsl:template match="component-definition/back-matter/resource/rlink/@media-type"
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
   <xsl:template match="component-definition/back-matter/resource/base64/@filename"
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
   <xsl:template match="component-definition/back-matter/resource/base64/@media-type"
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
   <xsl:template match="component-definition/metadata/title"
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
   <xsl:template match="component-definition/metadata/published"
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
   <xsl:template match="component-definition/metadata/last-modified"
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
   <xsl:template match="component-definition/metadata/version"
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
   <xsl:template match="component-definition/metadata/oscal-version"
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
   <xsl:template match="component-definition/metadata/revisions/revision"
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
   <xsl:template match="component-definition/metadata/revisions"
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
   <xsl:template match="component-definition/metadata/revisions/revision/title"
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
   <xsl:template match="component-definition/metadata/revisions/revision/published"
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
   <xsl:template match="component-definition/metadata/revisions/revision/last-modified"
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
   <xsl:template match="component-definition/metadata/revisions/revision/version"
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
   <xsl:template match="component-definition/metadata/revisions/revision/oscal-version"
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
   <xsl:template match="component-definition/metadata/revisions/revision/link/text"
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
   <xsl:template match="component-definition/metadata/document-id"
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
   <xsl:template match="component-definition/metadata/link/text"
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
   <xsl:template match="component-definition/metadata/role/title"
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
   <xsl:template match="component-definition/metadata/role/short-name"
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
   <xsl:template match="component-definition/metadata/role/description"
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
   <xsl:template match="component-definition/metadata/role/link/text"
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
   <xsl:template match="component-definition/metadata/location/title"
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
   <xsl:template match="component-definition/metadata/location/address"
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
   <xsl:template match="component-definition/metadata/location/address/addr-line"
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
   <xsl:template match="component-definition/metadata/location/address/city"
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
   <xsl:template match="component-definition/metadata/location/address/state"
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
   <xsl:template match="component-definition/metadata/location/address/postal-code"
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
   <xsl:template match="component-definition/metadata/location/address/country"
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
   <xsl:template match="component-definition/metadata/location/email-address"
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
   <xsl:template match="component-definition/metadata/location/telephone-number"
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
   <xsl:template match="component-definition/metadata/location/url"
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
   <xsl:template match="component-definition/metadata/location/link/text"
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
   <xsl:template match="component-definition/metadata/party/name"
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
   <xsl:template match="component-definition/metadata/party/short-name"
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
   <xsl:template match="component-definition/metadata/party/external-id"
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
   <xsl:template match="component-definition/metadata/party/link/text"
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
   <xsl:template match="component-definition/metadata/party/email-address"
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
   <xsl:template match="component-definition/metadata/party/telephone-number"
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
   <xsl:template match="component-definition/metadata/party/address"
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
   <xsl:template match="component-definition/metadata/party/address/addr-line"
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
   <xsl:template match="component-definition/metadata/party/address/city"
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
   <xsl:template match="component-definition/metadata/party/address/state"
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
   <xsl:template match="component-definition/metadata/party/address/postal-code"
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
   <xsl:template match="component-definition/metadata/party/address/country"
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
   <xsl:template match="component-definition/metadata/party/member-of-organization"
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
   <xsl:template match="component-definition/metadata/responsible-party/link/text"
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
   <xsl:template match="component-definition/component/title"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="title"
             _key="title"
             _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/title"
             _metaschema-json-id="/assembly/oscal-component-definition/defined-component/title"
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
   <xsl:template match="component-definition/component/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/description"
             _metaschema-json-id="/assembly/oscal-component-definition/defined-component/description"
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
   <xsl:template match="component-definition/component/purpose"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="purpose"
             _key="purpose"
             _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/purpose"
             _metaschema-json-id="/assembly/oscal-component-definition/defined-component/purpose"
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
   <xsl:template match="component-definition/component/link/text"
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
   <xsl:template match="component-definition/component/responsible-role/link/text"
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
   <xsl:template match="component-definition/component/protocol/title"
                 priority="7"
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
   <xsl:template match="component-definition/component/control-implementation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/defined-component/control-implementation"
                _metaschema-json-id="/assembly/oscal-component-definition/defined-component/control-implementations"
                name="control-implementation"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:control-implementation"
                _step="control-implementation"
                _key="control-implementations"
                _key-ref="oscal-component-definition:control-implementation"
                _using-name="control-implementation"
                _in-xml-name="control-implementation"
                _in-json-name="control-implementations"
                gi="control-implementation">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@source"/>
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
         <xsl:for-each-group select="set-parameter" group-by="true()">
            <group in-json="ARRAY" key="set-parameters">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="implemented-requirement" group-by="true()">
            <group in-json="ARRAY" key="implemented-requirements">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="component-definition/component/control-implementation/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/description"
             _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/description"
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
   <xsl:template match="component-definition/component/control-implementation/link/text"
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
   <xsl:template match="component-definition/component/control-implementation/set-parameter/value"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/implemented-requirement"
                _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/implemented-requirements"
                name="implemented-requirement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:implemented-requirement"
                _step="implemented-requirement"
                _key="implemented-requirements"
                _key-ref="oscal-component-definition:implemented-requirement"
                _using-name="implemented-requirement"
                _in-xml-name="implemented-requirement"
                _in-json-name="implemented-requirements"
                gi="implemented-requirement">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@control-id"/>
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
         <xsl:for-each-group select="set-parameter" group-by="true()">
            <group in-json="ARRAY" key="set-parameters">
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
         <xsl:for-each-group select="statement" group-by="true()">
            <group in-json="ARRAY" key="statements">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/description"
             _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/description"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/link/text"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/set-parameter/value"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/responsible-role/link/text"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/statement"
                _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/statements"
                name="statement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:statement"
                _step="statement"
                _key="statements"
                _key-ref="oscal-component-definition:statement"
                _using-name="statement"
                _in-xml-name="statement"
                _in-json-name="statements"
                gi="statement">
         <xsl:apply-templates select="@statement-id"/>
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/statement/description"
             _metaschema-json-id="/assembly/oscal-component-definition/statement/description"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement/link/text"
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
   <xsl:template match="component-definition/component/control-implementation/implemented-requirement/statement/responsible-role/link/text"
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
   <xsl:template match="component-definition/capability/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/capability/description"
             _metaschema-json-id="/assembly/oscal-component-definition/capability/description"
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
   <xsl:template match="component-definition/capability/link/text"
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
   <xsl:template match="component-definition/capability/incorporates-component/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/incorporates-component/description"
             _metaschema-json-id="/assembly/oscal-component-definition/incorporates-component/description"
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
   <xsl:template match="component-definition/capability/control-implementation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/capability/control-implementation"
                _metaschema-json-id="/assembly/oscal-component-definition/capability/control-implementations"
                name="control-implementation"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:control-implementation"
                _step="control-implementation"
                _key="control-implementations"
                _key-ref="oscal-component-definition:control-implementation"
                _using-name="control-implementation"
                _in-xml-name="control-implementation"
                _in-json-name="control-implementations"
                gi="control-implementation">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@source"/>
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
         <xsl:for-each-group select="set-parameter" group-by="true()">
            <group in-json="ARRAY" key="set-parameters">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="implemented-requirement" group-by="true()">
            <group in-json="ARRAY" key="implemented-requirements">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="component-definition/capability/control-implementation/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/description"
             _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/description"
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
   <xsl:template match="component-definition/capability/control-implementation/link/text"
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
   <xsl:template match="component-definition/capability/control-implementation/set-parameter/value"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/control-implementation/implemented-requirement"
                _metaschema-json-id="/assembly/oscal-component-definition/control-implementation/implemented-requirements"
                name="implemented-requirement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:implemented-requirement"
                _step="implemented-requirement"
                _key="implemented-requirements"
                _key-ref="oscal-component-definition:implemented-requirement"
                _using-name="implemented-requirement"
                _in-xml-name="implemented-requirement"
                _in-json-name="implemented-requirements"
                gi="implemented-requirement">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@control-id"/>
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
         <xsl:for-each-group select="set-parameter" group-by="true()">
            <group in-json="ARRAY" key="set-parameters">
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
         <xsl:for-each-group select="statement" group-by="true()">
            <group in-json="ARRAY" key="statements">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/description"
             _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/description"
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/link/text"
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/set-parameter/value"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/responsible-role/link/text"
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/statement"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly _metaschema-xml-id="/assembly/oscal-component-definition/implemented-requirement/statement"
                _metaschema-json-id="/assembly/oscal-component-definition/implemented-requirement/statements"
                name="statement"
                _base-uri="file:/mnt/c/Users/davidwal/git/github/david-waltermire-nist/oscal-content/oscal/src/metaschema/oscal_component_metaschema.xml"
                _key-name="oscal-component-definition:statement"
                _step="statement"
                _key="statements"
                _key-ref="oscal-component-definition:statement"
                _using-name="statement"
                _in-xml-name="statement"
                _in-json-name="statements"
                gi="statement">
         <xsl:apply-templates select="@statement-id"/>
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/statement/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field _step="description"
             _key="description"
             _metaschema-xml-id="/assembly/oscal-component-definition/statement/description"
             _metaschema-json-id="/assembly/oscal-component-definition/statement/description"
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/statement/link/text"
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
   <xsl:template match="component-definition/capability/control-implementation/implemented-requirement/statement/responsible-role/link/text"
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
   <xsl:template match="component-definition/back-matter/resource"
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
   <xsl:template match="component-definition/back-matter/resource/title"
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
   <xsl:template match="component-definition/back-matter/resource/description"
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
   <xsl:template match="component-definition/back-matter/resource/document-id"
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
   <xsl:template match="component-definition/back-matter/resource/citation"
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
   <xsl:template match="component-definition/back-matter/resource/citation/text"
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
   <xsl:template match="component-definition/back-matter/resource/citation/link/text"
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
   <xsl:template match="component-definition/back-matter/resource/rlink"
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
   <xsl:template match="component-definition/back-matter/resource/base64"
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
