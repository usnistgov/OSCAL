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
   <xsl:strip-space elements="assessment-results metadata revision annotation link role location address party responsible-party import-ap local-definitions add-objectives-and-methods part activity step reviewed-controls control-selection include-control exclude-control control-objective-selection responsible-role related-controls result component status protocol inventory-item implemented-component user authorized-privilege assessment-action timing assessment-subject include-subject exclude-subject associated-activity assessment-subject-placeholder assessment-assets assessment-platform uses-component attestation assessment-log entry related-action related-task observation origin actor subject relevant-evidence risk characterization facet mitigating-factor response required-asset task risk-log related-response finding objective-status back-matter resource citation biblio rlink"/>
   <!-- METASCHEMA conversion stylesheet supports XML -> METASCHEMA/SUPERMODEL conversion -->
   <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ -->
   <!-- METASCHEMA: OSCAL Assessment Results Model (version 1.0.0-rc1) in namespace "http://csrc.nist.gov/ns/oscal/1.0"-->
   <xsl:template match="assessment-results"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-results"
                gi="assessment-results"
                formal-name="Security Assessment Results (SAR)">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-results</xsl:attribute>
         </xsl:if>
         <xsl:if test=". is /*">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="metadata"/>
         <xsl:apply-templates select="import-ap"/>
         <xsl:apply-templates select="local-definitions"/>
         <xsl:for-each-group select="result" group-by="true()">
            <group in-json="ARRAY" key="results">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="back-matter"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/@uuid | prop/@uuid | annotation/@uuid | location/@uuid | party/@uuid | activity/@uuid | result/@uuid | component/@uuid | protocol/@uuid | inventory-item/@uuid | user/@uuid | assessment-action/@uuid | part/@uuid | observation/@uuid | risk/@uuid | task/@uuid | finding/@uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Assessment Results Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="metadata"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="metadata" gi="metadata" formal-name="Publication metadata">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
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
      <field name="property" gi="prop" formal-name="Property">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@ns"/>
         <xsl:apply-templates select="@class"/>
         <value as-type="string" key="value" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="prop/@name | annotation/@name | part/@name | protocol/@name"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="name"
            key="name"
            gi="name"
            formal-name="Property Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="prop/@ns | annotation/@ns | part/@ns"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="ns"
            key="ns"
            gi="ns"
            formal-name="Property Namespace">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="prop/@class | part/@class"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="class"
            key="class"
            gi="class"
            formal-name="Property Class">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="annotation"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="annotation" gi="annotation" formal-name="Annotated Property">
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@ns"/>
         <xsl:apply-templates select="@value"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="annotation/@value"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value"
            formal-name="Annotated Property Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="remarks"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="remarks"
             gi="remarks"
             as-type="markup-multiline"
             formal-name="Remarks"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">remarks</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="link"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="link" gi="link" formal-name="Link">
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="@rel"/>
         <xsl:apply-templates select="@media-type"/>
         <xsl:apply-templates select="text"/>
      </assembly>
   </xsl:template>
   <xsl:template match="link/@href | import-ap/@href | threat-id/@href"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="link/@rel"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="rel"
            key="rel"
            gi="rel"
            formal-name="Relation">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="link/@media-type | assessment-results/back-matter/resource/rlink/@media-type | assessment-results/back-matter/resource/base64/@media-type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type"
            formal-name="Media Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="role"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="role" gi="role" formal-name="Role">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="role/@id | part/@id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="id"
            key="id"
            gi="id"
            formal-name="Role Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="location"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="location" gi="location" formal-name="Location">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
      <assembly name="party"
                gi="party"
                formal-name="Party (organization or person)">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="party/@type | assessment-subject/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="Party Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="location-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="location-uuid"
             gi="location-uuid"
             as-type="uuid"
             formal-name="Location Reference"
             in-json="SCALAR">
         <value as-type="uuid" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="responsible-party"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="responsible-party"
                gi="responsible-party"
                formal-name="Responsible Party"
                json-key-flag="role-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">responsible-party</xsl:attribute>
         </xsl:if>
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="responsible-party/@role-id | responsible-role/@role-id | logged-by/@role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Responsible Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="party-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="party-uuid"
             gi="party-uuid"
             as-type="uuid"
             formal-name="Party Reference"
             in-json="SCALAR">
         <value as-type="uuid" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="import-ap"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="import-ap"
                gi="import-ap"
                formal-name="Import Assessment Plan">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ap</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="add-objectives-and-methods"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="local-objective"
                gi="add-objectives-and-methods"
                formal-name="Assessment-Specific Control Objective">
         <xsl:apply-templates select="@control-id"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="part" group-by="true()">
            <group in-json="ARRAY" key="parts">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="add-objectives-and-methods/@control-id | assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/include-control/@control-id | assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/@control-id | assessment-results/result/reviewed-controls/control-selection/include-control/@control-id | assessment-results/result/reviewed-controls/control-selection/exclude-control/@control-id | objective-status/@control-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="control-id"
            key="control-id"
            gi="control-id"
            formal-name="Control Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="part"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="part" gi="part" formal-name="Part">
         <xsl:apply-templates select="@id"/>
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@ns"/>
         <xsl:apply-templates select="@class"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                             group-by="true()">
            <field in-json="SCALAR"
                   name="prose"
                   key="prose"
                   as-type="markup-multiline"
                   formal-name="Part Text">
               <value in-json="string" as-type="markup-multiline">
                  <xsl:apply-templates select="current-group()" mode="cast-prose"/>
               </value>
            </field>
         </xsl:for-each-group>
         <xsl:for-each-group select="part" group-by="true()">
            <group in-json="ARRAY" key="parts">
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
   <xsl:template match="activity"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="activity" gi="activity" formal-name="Activity">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="step" group-by="true()">
            <group in-json="ARRAY" key="actions">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="related-controls"/>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="BY_KEY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="reviewed-controls"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="reviewed-controls"
                gi="reviewed-controls"
                formal-name="Reviewed Controls and Control Objectives">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">reviewed-controls</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="control-selection" group-by="true()">
            <group in-json="ARRAY" key="control-selections">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="control-objective-selection" group-by="true()">
            <group in-json="ARRAY" key="control-objective-selections">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="include-objective"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="select-objective-by-id"
             gi="include-objective"
             formal-name="Select Objective">
         <xsl:apply-templates select="@objective-id"/>
      </field>
   </xsl:template>
   <xsl:template match="include-objective/@objective-id | exclude-objective/@objective-id | objective-status/@objective-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="objective-id"
            key="objective-id"
            gi="objective-id"
            formal-name="Objective ID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="responsible-role"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="responsible-role"
                gi="responsible-role"
                formal-name="Responsible Role"
                json-key-flag="role-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">responsible-role</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="result"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="result" gi="result" formal-name="Assessment Result">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="local-definitions"/>
         <xsl:apply-templates select="reviewed-controls"/>
         <xsl:for-each-group select="assessment-subject" group-by="true()">
            <group in-json="ARRAY" key="assessment-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="assessment-assets"/>
         <xsl:for-each-group select="attestation" group-by="true()">
            <group in-json="ARRAY" key="attestations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="assessment-log"/>
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
         <xsl:for-each-group select="finding" group-by="true()">
            <group in-json="ARRAY" key="findings">
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
      <assembly name="system-component"
                gi="component"
                formal-name="Component"
                json-key-flag="uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">component</xsl:attribute>
         </xsl:if>
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-roles">
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
   <xsl:template match="component/@type"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="component-type"
            key="type"
            gi="type"
            formal-name="Component Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="protocol"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="protocol"
                gi="protocol"
                formal-name="Service Protocol Information">
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
      <field as-type="empty"
             name="port-range"
             gi="port-range"
             formal-name="Port Range">
         <xsl:apply-templates select="@start"/>
         <xsl:apply-templates select="@end"/>
         <xsl:apply-templates select="@transport"/>
      </field>
   </xsl:template>
   <xsl:template match="port-range/@start"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="start"
            key="start"
            gi="start"
            formal-name="Start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="port-range/@end"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="end"
            key="end"
            gi="end"
            formal-name="End">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="port-range/@transport"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="transport"
            key="transport"
            gi="transport"
            formal-name="Transport">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="inventory-item"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="inventory-item"
                gi="inventory-item"
                formal-name="Inventory Item">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
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
   <xsl:template match="user"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="system-user"
                gi="user"
                formal-name="System User"
                json-key-flag="uuid">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">user</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@uuid"/>
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="role-id" group-by="true()">
            <group in-json="ARRAY" key="role-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="authorized-privilege" group-by="true()">
            <group in-json="ARRAY" key="authorized-privileges">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="role-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="role-id"
             gi="role-id"
             as-type="NCName"
             formal-name="Role Identifier Reference"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="authorized-privilege"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="authorized-privilege"
                gi="authorized-privilege"
                formal-name="Privilege">
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="function-performed" group-by="true()">
            <group in-json="ARRAY" key="functions-performed">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="function-performed"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="function-performed"
             gi="function-performed"
             as-type="string"
             formal-name="Functions Performed"
             in-json="SCALAR">
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-action"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="action" gi="assessment-action" formal-name="Action">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="assessment-subject" group-by="true()">
            <group in-json="ARRAY" key="assessment-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="BY_KEY" key="responsible-roles">
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
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-subject"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-subject"
                gi="assessment-subject"
                formal-name="Subject of Assessment">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
      <assembly name="select-subject-by-id"
                gi="include-subject"
                formal-name="Select Assessment Subject">
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="include-subject/@uuid-ref | exclude-subject/@uuid-ref"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-assets"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-assets"
                gi="assessment-assets"
                formal-name="Assessment Assets">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-assets</xsl:attribute>
         </xsl:if>
         <xsl:for-each-group select="component" group-by="true()">
            <group in-json="BY_KEY" key="components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="assessment-platform" group-by="true()">
            <group in-json="ARRAY" key="assessment-platforms">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="part"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-part" gi="part" formal-name="Assessment Part">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@name"/>
         <xsl:apply-templates select="@ns"/>
         <xsl:apply-templates select="@class"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                             group-by="true()">
            <field in-json="SCALAR"
                   name="prose"
                   key="prose"
                   as-type="markup-multiline"
                   formal-name="Part Text">
               <value in-json="string" as-type="markup-multiline">
                  <xsl:apply-templates select="current-group()" mode="cast-prose"/>
               </value>
            </field>
         </xsl:for-each-group>
         <xsl:for-each-group select="part" group-by="true()">
            <group in-json="ARRAY" key="parts">
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
   <xsl:template match="logged-by"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="logged-by"
             gi="logged-by"
             formal-name="Logged By">
         <xsl:apply-templates select="@party-uuid"/>
         <xsl:apply-templates select="@role-id"/>
      </field>
   </xsl:template>
   <xsl:template match="logged-by/@party-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="party-uuid"
            key="party-uuid"
            gi="party-uuid"
            formal-name="Party UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="related-action"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="related-action"
                gi="related-action"
                formal-name="Action Reference">
         <xsl:apply-templates select="@action-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="related-action/@action-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="action-uuid"
            key="action-uuid"
            gi="action-uuid"
            formal-name="Action Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="related-task"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="related-task" gi="related-task" formal-name="Task Reference">
         <xsl:apply-templates select="@task-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="assessment-subject" group-by="true()">
            <group in-json="ARRAY" key="assessment-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="related-task/@task-uuid"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="task-uuid"
            key="task-uuid"
            gi="task-uuid"
            formal-name="Task Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="observation"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="observation" gi="observation" formal-name="Objective">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="origin"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="origin" gi="origin" formal-name="Origin">
         <xsl:for-each-group select="actor" group-by="true()">
            <group in-json="ARRAY" key="actors">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="related-action" group-by="true()">
            <group in-json="ARRAY" key="related-actions">
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
   <xsl:template match="risk"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="risk" gi="risk" formal-name="Identified Risk">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="threat-id"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="threat-id"
             gi="threat-id"
             as-type="uri"
             formal-name="Threat ID">
         <xsl:apply-templates select="@system"/>
         <xsl:apply-templates select="@href"/>
         <value as-type="uri" key="id" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="threat-id/@system"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="Threat Type Identification System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="characterization"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="characterization"
                gi="characterization"
                formal-name="Characterization">
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
      <assembly name="task" gi="task" formal-name="Task">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="start"/>
         <xsl:apply-templates select="end"/>
         <xsl:for-each-group select="related-action" group-by="true()">
            <group in-json="ARRAY" key="related-actions">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="BY_KEY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="status-change"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="risk-status"
             gi="status-change"
             as-type="NCName"
             formal-name="Risk Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status-change</xsl:attribute>
         </xsl:if>
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="finding"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="finding" gi="finding" formal-name="Finding">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="collected"/>
         <xsl:apply-templates select="expires"/>
         <xsl:apply-templates select="objective-status"/>
         <xsl:apply-templates select="implementation-statement-uuid"/>
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
   <xsl:template match="objective-status"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="objective-status"
                gi="objective-status"
                formal-name="Objective Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">objective-status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@objective-id"/>
         <xsl:apply-templates select="@control-id"/>
         <xsl:apply-templates select="title"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="back-matter"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="back-matter" gi="back-matter" formal-name="Back matter">
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
   <xsl:template match="hash"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="hash" gi="hash" formal-name="Hash">
         <xsl:apply-templates select="@algorithm"/>
         <value as-type="string" key="value" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="hash/@algorithm"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="algorithm"
            key="algorithm"
            gi="algorithm"
            formal-name="Hash algorithm">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/title"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Document Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/published"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="published"
             gi="published"
             as-type="dateTime-with-timezone"
             formal-name="Publication Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/last-modified"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="last-modified"
             gi="last-modified"
             as-type="dateTime-with-timezone"
             formal-name="Last Modified Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/version"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/oscal-version"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="revision" gi="revision" formal-name="Revision History Entry">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/metadata/revisions"
                 priority="4"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <group name="revisions" gi="revisions" group-json="ARRAY">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">revisions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="revision"/>
      </group>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Document Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/published"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="published"
             gi="published"
             as-type="dateTime-with-timezone"
             formal-name="Publication Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">published</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/last-modified"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="last-modified"
             gi="last-modified"
             as-type="dateTime-with-timezone"
             formal-name="Last Modified Timestamp"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">last-modified</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/version"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="version"
             gi="version"
             formal-name="Document Version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">version</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/oscal-version"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="oscal-version"
             gi="oscal-version"
             formal-name="OSCAL version"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">oscal-version</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/revisions/revision/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/document-id"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="identifier" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/document-id/@scheme"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/link/text"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/role/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Role Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/role/short-name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="short-name"
             gi="short-name"
             formal-name="Role Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/role/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Role Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/role/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Location Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="address" gi="address" formal-name="Address">
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
   <xsl:template match="assessment-results/metadata/location/address/@type"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address/addr-line"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address/city"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address/state"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address/postal-code"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="postal-code"
             gi="postal-code"
             formal-name="Postal Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/address/country"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/email-address"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <value as-type="email" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/telephone-number"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="@type"/>
         <value as-type="string" key="number" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/telephone-number/@type"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/url"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="url"
             gi="url"
             as-type="uri"
             formal-name="Location URL"
             in-json="SCALAR">
         <value as-type="uri" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/location/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="name" gi="name" formal-name="Party Name" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">name</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/short-name"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="short-name"
             gi="short-name"
             formal-name="Party Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/external-id"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="external-id"
             gi="external-id"
             formal-name="Party External Identifier">
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="id" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/external-id/@scheme"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="External Identifier Schema">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/email-address"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="email-address"
             gi="email-address"
             as-type="email"
             formal-name="Email Address"
             in-json="SCALAR">
         <value as-type="email" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/telephone-number"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="telephone-number"
             gi="telephone-number"
             formal-name="Telephone Number">
         <xsl:apply-templates select="@type"/>
         <value as-type="string" key="number" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/telephone-number/@type"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type"
            formal-name="type flag">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="address" gi="address" formal-name="Address">
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
   <xsl:template match="assessment-results/metadata/party/address/@type"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="location-type"
            key="type"
            gi="type"
            formal-name="Address Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address/addr-line"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="addr-line"
             gi="addr-line"
             formal-name="Address line"
             in-json="SCALAR">
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address/city"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="city" gi="city" formal-name="City" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">city</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address/state"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="state" gi="state" formal-name="State" in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">state</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address/postal-code"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="postal-code"
             gi="postal-code"
             formal-name="Postal Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">postal-code</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/address/country"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="country"
             gi="country"
             formal-name="Country Code"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">country</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/party/member-of-organization"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="member-of-organization"
             gi="member-of-organization"
             as-type="uuid"
             formal-name="Organizational Affiliation"
             in-json="SCALAR">
         <value as-type="uuid" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/metadata/responsible-party/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions"
                 priority="3"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:for-each-group select="add-objectives-and-methods" group-by="true()">
            <group in-json="ARRAY" key="add-objectives-and-methods">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="activity" group-by="true()">
            <group in-json="ARRAY" key="activities">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/add-objectives-and-methods/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/add-objectives-and-methods/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/add-objectives-and-methods//part/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Part Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/add-objectives-and-methods//part/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Included Activity Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Included Activity Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="step" gi="step" formal-name="Action">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:apply-templates select="reviewed-controls"/>
         <xsl:for-each-group select="responsible-role" group-by="true()">
            <group in-json="BY_KEY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/@uuid"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Action Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Action Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Action Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-control" group-by="true()">
            <group in-json="ARRAY" key="include-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-control" group-by="true()">
            <group in-json="ARRAY" key="exclude-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-all"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/include-control/statement-id"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-selection/exclude-control/statement-id"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-objective" group-by="true()">
            <group in-json="ARRAY" key="include-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-objective" group-by="true()">
            <group in-json="ARRAY" key="exclude-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/step/reviewed-controls/control-objective-selection/include-all"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/local-definitions/activity/step/responsible-role/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-control" group-by="true()">
            <group in-json="ARRAY" key="include-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-control" group-by="true()">
            <group in-json="ARRAY" key="exclude-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/include-all"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/include-control/statement-id"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-selection/exclude-control/statement-id"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-objective-selection"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-objective" group-by="true()">
            <group in-json="ARRAY" key="include-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-objective" group-by="true()">
            <group in-json="ARRAY" key="exclude-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/local-definitions/activity/related-controls/control-objective-selection/include-all"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/local-definitions/activity/responsible-role/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/title"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Results Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/description"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Results Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/start"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="start field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/end"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="end field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/link/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="local-definitions"
                gi="local-definitions"
                formal-name="Local Definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:for-each-group select="component" group-by="true()">
            <group in-json="BY_KEY" key="components">
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
         <xsl:for-each-group select="user" group-by="true()">
            <group in-json="BY_KEY" key="users">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="assessment-action" group-by="true()">
            <group in-json="ARRAY" key="assessment-actions">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Component Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Component Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/purpose"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="purpose"
             gi="purpose"
             as-type="markup-line"
             formal-name="Purpose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">purpose</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/status"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@state"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/status/@state"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/responsible-role/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/component/protocol/title"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="title field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Inventory Item Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/responsible-party/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/implemented-component"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="implemented-component"
                gi="implemented-component"
                formal-name="Implemented Component">
         <xsl:apply-templates select="@component-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/implemented-component/@component-uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid"
            formal-name="Component Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/implemented-component/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/inventory-item/implemented-component/responsible-party/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="User Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/short-name"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="short-name"
             gi="short-name"
             formal-name="User Short Name"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">short-name</xsl:attribute>
         </xsl:if>
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="User Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/authorized-privilege/title"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="title field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/user/authorized-privilege/description"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Privilege Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Event Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Event Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="timing" gi="timing" formal-name="Event Timing">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">timing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="on-date"/>
         <xsl:apply-templates select="within-date-range"/>
         <xsl:apply-templates select="at-frequency"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/on-date"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="on-date"
             gi="on-date"
             formal-name="On Date Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">on-date</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@date"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/on-date/@date"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="date"
            key="date"
            gi="date"
            formal-name="On Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/within-date-range"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="within-date-range"
             gi="within-date-range"
             formal-name="On Date Range Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">within-date-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@start"/>
         <xsl:apply-templates select="@end"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/within-date-range/@start"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="start"
            key="start"
            gi="start"
            formal-name="Start Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/within-date-range/@end"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="end"
            key="end"
            gi="end"
            formal-name="End Date Condition">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/at-frequency"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="at-frequency"
             gi="at-frequency"
             formal-name="Frequency Condition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">at-frequency</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@period"/>
         <xsl:apply-templates select="@unit"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/at-frequency/@period"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="number"
            as-type="positiveInteger"
            name="period"
            key="period"
            gi="period"
            formal-name="Period">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/timing/at-frequency/@unit"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="unit"
            key="unit"
            gi="unit"
            formal-name="Time Unit">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/assessment-subject/description"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/assessment-subject/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/assessment-subject/include-all"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/assessment-subject/include-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/assessment-subject/exclude-subject/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/responsible-role/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="associated-activity"
                gi="associated-activity"
                formal-name="Associated Activity">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="@activity-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-roles">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="assessment-subject" group-by="true()">
            <group in-json="ARRAY" key="assessment-subjects">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="assessment-subject-placeholder"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/@uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Associated Activity Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/@activity-uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="activity-uuid"
            key="activity-uuid"
            gi="activity-uuid"
            formal-name="Activity Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/responsible-role/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject-placeholder"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-subject-placeholder"
                gi="assessment-subject-placeholder"
                formal-name="Assessment Subject Placeholder">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-subject-placeholder</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="source" group-by="true()">
            <group in-json="ARRAY" key="sources">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject-placeholder/description"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessment Subject Placeholder Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject-placeholder/source"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="source"
             gi="source"
             formal-name="Assessment Subject Source">
         <xsl:apply-templates select="@activity-instance-uuid"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject-placeholder/source/@activity-instance-uuid"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="activity-instance-uuid"
            key="activity-instance-uuid"
            gi="activity-instance-uuid"
            formal-name="Activity Instance Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/local-definitions/assessment-action/associated-activity/assessment-subject-placeholder/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Objective Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/link/text"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-selection"
                gi="control-selection"
                formal-name="Assessed Controls">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-control" group-by="true()">
            <group in-json="ARRAY" key="include-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-control" group-by="true()">
            <group in-json="ARRAY" key="exclude-controls">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Assessed Controls Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/include-all"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/include-control"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="include-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/include-control/statement-id"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/exclude-control"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="select-control-by-id"
                gi="exclude-control"
                formal-name="Select Control">
         <xsl:apply-templates select="@control-id"/>
         <xsl:for-each-group select="statement-id" group-by="true()">
            <group in-json="ARRAY" key="statement-ids">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-selection/exclude-control/statement-id"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement-id"
             gi="statement-id"
             as-type="NCName"
             formal-name="Include Specific Statements"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-objective-selection"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="control-objective-selection"
                gi="control-objective-selection"
                formal-name="Referened Control Objectives">
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="include-objective" group-by="true()">
            <group in-json="ARRAY" key="include-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="exclude-objective" group-by="true()">
            <group in-json="ARRAY" key="exclude-objectives">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-objective-selection/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Control Ojectives Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-objective-selection/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/reviewed-controls/control-objective-selection/include-all"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/assessment-subject/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-subject/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-subject/include-all"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/assessment-subject/include-subject/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-subject/exclude-subject/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Component Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Component Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/purpose"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="purpose"
             gi="purpose"
             as-type="markup-line"
             formal-name="Purpose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">purpose</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/status"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="status" gi="status" formal-name="Status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="@state"/>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/status/@state"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="state"
            key="state"
            gi="state"
            formal-name="State">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/responsible-role/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/component/protocol/title"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="title field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-platform"
                gi="assessment-platform"
                formal-name="Assessment Platform">
         <xsl:apply-templates select="@uuid"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="uses-component" group-by="true()">
            <group in-json="ARRAY" key="uses-components">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/@uuid"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Assessment Platform Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Assessment Platform Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/uses-component"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="uses-component"
                gi="uses-component"
                formal-name="Uses Component">
         <xsl:apply-templates select="@component-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
            <group in-json="BY_KEY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/uses-component/@component-uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid"
            formal-name="Component Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/uses-component/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-assets/assessment-platform/uses-component/responsible-party/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/attestation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="attestation"
                gi="attestation"
                formal-name="Attestation Statements">
         <xsl:for-each-group select="responsible-party" group-by="true()">
            <group in-json="BY_KEY" key="responsible-parties">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="part" group-by="true()">
            <group in-json="ARRAY" key="parts">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/attestation/responsible-party/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/attestation//part/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Part Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/attestation//part/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="assessment-log"
                gi="assessment-log"
                formal-name="Assessment Log">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">assessment-log</xsl:attribute>
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
   <xsl:template match="assessment-results/result/assessment-log/entry"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="entry" gi="entry" formal-name="Assessment Log Entry">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="related-action" group-by="true()">
            <group in-json="ARRAY" key="related-actions">
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
   <xsl:template match="assessment-results/result/assessment-log/entry/@uuid"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Assessment Log Entry Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Action Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Action Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/start"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/end"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="End"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-action/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-action/responsible-party/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/responsible-party/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/assessment-subject/description"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/assessment-subject/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/assessment-subject/include-all"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/assessment-subject/include-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/assessment-log/entry/related-task/assessment-subject/exclude-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/title"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Observation Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Observaton Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/method"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="method"
             gi="method"
             formal-name="Observation Method"
             in-json="SCALAR">
         <value as-type="string" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/type"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="type"
             gi="type"
             as-type="NCName"
             formal-name="Observation Type"
             in-json="SCALAR">
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/actor"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="actor" gi="actor" formal-name="Assessment Actor">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/observation/origin/actor/@type"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Actor Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/actor/@uuid-ref"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="Actor UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/actor/@role-id"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Actor Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/actor/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-action/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-action/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/assessment-subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/assessment-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/assessment-subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/observation/origin/related-task/assessment-subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/origin/related-task/assessment-subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/subject"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/observation/subject/@uuid-ref"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/subject/@type"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/subject/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/subject/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/relevant-evidence"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="relevant-evidence"
                gi="relevant-evidence"
                formal-name="Relevant Evidence">
         <xsl:apply-templates select="@href"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/observation/relevant-evidence/@href"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Relevant Evidence Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/relevant-evidence/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Relevant Evidence Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/observation/relevant-evidence/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/title"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Risk Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Risk Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/statement"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="statement"
             gi="statement"
             as-type="markup-multiline"
             formal-name="Risk Statement"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/status"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="status"
             gi="status"
             as-type="NCName"
             formal-name="Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/actor"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="actor" gi="actor" formal-name="Assessment Actor">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/origin/actor/@type"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Actor Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/actor/@uuid-ref"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="Actor UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/actor/@role-id"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Actor Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/actor/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-action/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-action/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/assessment-subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/assessment-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/assessment-subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/risk/origin/related-task/assessment-subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/origin/related-task/assessment-subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/actor"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="actor" gi="actor" formal-name="Assessment Actor">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/characterization/origin/actor/@type"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Actor Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/actor/@uuid-ref"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="Actor UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/actor/@role-id"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Actor Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/actor/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-action/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-action/responsible-party/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/responsible-party/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/assessment-subject/description"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/assessment-subject/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/assessment-subject/include-all"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/assessment-subject/include-subject/link/text"
                 priority="19"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/origin/related-task/assessment-subject/exclude-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/facet"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="facet" gi="facet" formal-name="Facet">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/characterization/facet/@name"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="name"
            key="name"
            gi="name"
            formal-name="Facet Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/facet/@system"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system"
            formal-name="Naming System">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/facet/@value"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value"
            formal-name="Facet Value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/characterization/facet/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="mitigating-factor"
                gi="mitigating-factor"
                formal-name="Mitigating Factor">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/mitigating-factor/@uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Mitigating Factor Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/@implementation-uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="implementation-uuid"
            key="implementation-uuid"
            gi="implementation-uuid"
            formal-name="Implementation UUID">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Mitigating Factor Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/subject"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/mitigating-factor/subject/@uuid-ref"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/subject/@type"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/subject/title"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/mitigating-factor/subject/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/deadline"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="deadline"
             gi="deadline"
             as-type="dateTime-with-timezone"
             formal-name="Risk Resolution Deadline"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">deadline</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="response" gi="response" formal-name="Risk Response">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/response/@uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Remediation Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/@lifecycle"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="lifecycle"
            key="lifecycle"
            gi="lifecycle"
            formal-name="Remediation Intent">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/title"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Response Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/description"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Response Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/link/text"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/actor"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="actor" gi="actor" formal-name="Assessment Actor">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/response/origin/actor/@type"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Actor Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/actor/@uuid-ref"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="Actor UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/actor/@role-id"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Actor Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/actor/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-action/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-action/responsible-party/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/responsible-party/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/assessment-subject/description"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/assessment-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/assessment-subject/include-all"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/assessment-subject/include-subject/link/text"
                 priority="20"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/origin/related-task/assessment-subject/exclude-subject/link/text"
                 priority="19"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="required-asset"
                gi="required-asset"
                formal-name="Required Asset">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/response/required-asset/@uuid"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Required Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/subject"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="subject-reference"
                gi="subject"
                formal-name="Identifies the Subject">
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="title"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/response/required-asset/subject/@uuid-ref"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/subject/@type"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Universally Unique Identifier Reference Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/subject/title"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Subject Reference Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/title"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Title for Required Asset"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Description of Required Asset"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/required-asset/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/title"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Task Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/description"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Task Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/start"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Task Start Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/end"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="Task End Date"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/related-action/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/related-action/responsible-party/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/response/task/responsible-role/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="risk-log" gi="risk-log" formal-name="Risk Log">
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
   <xsl:template match="assessment-results/result/risk/risk-log/entry"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="entry" gi="entry" formal-name="Risk Log Entry">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/risk/risk-log/entry/@uuid"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Risk Log Entry Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/title"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Action Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/description"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Action Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/start"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="start"
             gi="start"
             as-type="dateTime-with-timezone"
             formal-name="Start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/end"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="end"
             gi="end"
             as-type="dateTime-with-timezone"
             formal-name="End"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/link/text"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/related-response"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="related-response"
                gi="related-response"
                formal-name="Action Reference">
         <xsl:apply-templates select="@response-uuid"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
         <xsl:for-each-group select="related-action" group-by="true()">
            <group in-json="ARRAY" key="related-actions">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="remarks"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/related-response/@response-uuid"
                 priority="12"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="response-uuid"
            key="response-uuid"
            gi="response-uuid"
            formal-name="Response Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/related-response/link/text"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/related-response/related-action/link/text"
                 priority="16"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/risk-log/entry/related-response/related-action/responsible-party/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/related-observation"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="related-observation"
             gi="related-observation"
             formal-name="Related Observation">
         <xsl:apply-templates select="@observation-uuid"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/risk/related-observation/@observation-uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid"
            formal-name="Observation Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/title"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Finding Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/description"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Finding Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/link/text"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/actor"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="actor" gi="actor" formal-name="Assessment Actor">
         <xsl:apply-templates select="@type"/>
         <xsl:apply-templates select="@uuid-ref"/>
         <xsl:apply-templates select="@role-id"/>
         <xsl:for-each-group select="prop" group-by="true()">
            <group in-json="ARRAY" key="props">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/result/finding/origin/actor/@type"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="type"
            key="type"
            gi="type"
            formal-name="Actor Type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/actor/@uuid-ref"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid-ref"
            key="uuid-ref"
            gi="uuid-ref"
            formal-name="Actor UUID Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/actor/@role-id"
                 priority="11"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="NCName"
            name="role-id"
            key="role-id"
            gi="role-id"
            formal-name="Actor Role">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/actor/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-action/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-action/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/link/text"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/responsible-party/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/assessment-subject/description"
                 priority="13"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Include Subjects Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/assessment-subject/link/text"
                 priority="15"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/assessment-subject/include-all"
                 priority="14"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
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
   <xsl:template match="assessment-results/result/finding/origin/related-task/assessment-subject/include-subject/link/text"
                 priority="18"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/origin/related-task/assessment-subject/exclude-subject/link/text"
                 priority="17"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/collected"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="collected"
             gi="collected"
             as-type="dateTime-with-timezone"
             formal-name="collected field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">collected</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/expires"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="expires"
             gi="expires"
             as-type="dateTime-with-timezone"
             formal-name="expires field"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expires</xsl:attribute>
         </xsl:if>
         <value as-type="dateTime-with-timezone" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/objective-status/title"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Objective Status Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/objective-status/description"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Objective Status Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/objective-status/link/text"
                 priority="10"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Link Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/objective-status/status"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="status"
             gi="status"
             as-type="NCName"
             formal-name="Implementation Status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <value as-type="NCName" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/implementation-statement-uuid"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="implementation-statement-uuid"
             gi="implementation-statement-uuid"
             as-type="uuid"
             formal-name="Implementation Statement UUID"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">implementation-statement-uuid</xsl:attribute>
         </xsl:if>
         <value as-type="uuid" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/related-observation"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="related-observation"
             gi="related-observation"
             formal-name="Related Observation">
         <xsl:apply-templates select="@observation-uuid"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/related-observation/@observation-uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid"
            formal-name="Observation Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/associated-risk"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field as-type="empty"
             name="associated-risk"
             gi="associated-risk"
             formal-name="Associated Risk">
         <xsl:apply-templates select="@risk-uuid"/>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/result/finding/associated-risk/@risk-uuid"
                 priority="9"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="risk-uuid"
            key="risk-uuid"
            gi="risk-uuid"
            formal-name="Risk Universally Unique Identifier Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource"
                 priority="5"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="resource" gi="resource" formal-name="Resource">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
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
   <xsl:template match="assessment-results/back-matter/resource/@uuid"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid"
            formal-name="Resource Universally Unique Identifier">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/title"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="title"
             gi="title"
             as-type="markup-line"
             formal-name="Resource Title"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">title</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/description"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="description"
             gi="description"
             as-type="markup-multiline"
             formal-name="Resource Description"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">description</xsl:attribute>
         </xsl:if>
         <value as-type="markup-multiline" in-json="string">
            <xsl:for-each-group select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"
                                group-by="true()">
               <xsl:apply-templates select="current-group()" mode="cast-prose"/>
            </xsl:for-each-group>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/document-id"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="document-id"
             gi="document-id"
             formal-name="Document Identifier">
         <xsl:apply-templates select="@scheme"/>
         <value as-type="string" key="identifier" in-json="string">
            <xsl:value-of select="."/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/document-id/@scheme"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme"
            formal-name="Document Identification Scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/citation"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="citation" gi="citation" formal-name="Citation">
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
         <xsl:for-each-group select="annotation" group-by="true()">
            <group in-json="ARRAY" key="annotations">
               <xsl:apply-templates select="current-group()">
                  <xsl:with-param name="with-key" select="false()"/>
               </xsl:apply-templates>
            </group>
         </xsl:for-each-group>
         <xsl:apply-templates select="biblio"/>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/citation/text"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="text"
             gi="text"
             as-type="markup-line"
             formal-name="Citation Text"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">text</xsl:attribute>
         </xsl:if>
         <value as-type="markup-line" in-json="string">
            <xsl:apply-templates mode="cast-prose"/>
         </value>
      </field>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/citation/biblio"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="biblio" gi="biblio" formal-name="Bibliographic Definition">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">biblio</xsl:attribute>
         </xsl:if>
      </assembly>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/rlink"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <assembly name="rlink" gi="rlink" formal-name="Resource link">
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
   <xsl:template match="assessment-results/back-matter/resource/rlink/@href"
                 priority="8"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href"
            formal-name="Hypertext Reference">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="assessment-results/back-matter/resource/base64"
                 priority="6"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:param name="with-key" select="true()"/>
      <field name="base64"
             gi="base64"
             as-type="base64Binary"
             formal-name="Base64">
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
   <xsl:template match="assessment-results/back-matter/resource/base64/@filename"
                 priority="7"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename"
            formal-name="File Name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="*"
                 mode="cast-prose"
                 xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:element name="{ local-name() }"
                   namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel">
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
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
      <map>
         <xsl:copy-of select="($group-key,@key)[1]"/>
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
         <xsl:copy-of select="(../flag[@key=$key-flag-name],parent::field[@in-json = 'SCALAR']/@key, @key)[1]"/>
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
      <xsl:variable name="predecessor"
                    select="preceding-sibling::p | preceding-sibling::ul | preceding-sibling::ol | preceding-sibling::table | preceding-sibling::pre"/>
      <xsl:if test="exists($predecessor)">
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
      <xsl:text>{{ </xsl:text>
      <xsl:value-of select="@param-id"/>
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
