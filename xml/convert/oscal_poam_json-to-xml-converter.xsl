<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                xmlns:j="http://www.w3.org/2005/xpath-functions"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0/supermodel"
                version="3.0"
                exclude-result-prefixes="#all">
<!-- JSON to XML conversion: pipeline -->
   <xsl:output indent="true"/>
   <!-- Processing architecture -->
   <!-- $file should be a path to the file -->
   <xsl:param name="file" as="xs:string?"/>
   <!-- or $json should be a JSON literal -->
   <xsl:param name="json" as="xs:string?"/>
   <!-- Pass in $produce=supermodel to produce OSCAL M4 supermodel intermediate format -->
   <xsl:param name="produce" as="xs:string">xml</xsl:param>
   <xsl:template name="from-json">
      <xsl:if test="not(unparsed-text-available($file))" expand-text="true">
         <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">No file found at { $file }</nm:ERROR>
      </xsl:if>
      <xsl:variable name="source">
         <xsl:choose>
            <xsl:when test="matches($json,'\S')"><!-- $json is not empty, so we try it -->
               <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors" select="json-to-xml($json)">
                  <xsl:catch expand-text="true">
                     <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{{ $err:description }}</nm:ERROR>
                  </xsl:catch>
               </xsl:try>
            </xsl:when>
            <xsl:otherwise>
               <xsl:try xmlns:err="http://www.w3.org/2005/xqt-errors"
                        select="unparsed-text($file) ! json-to-xml(.)">
                  <xsl:catch expand-text="true">
                     <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema" code="{ $err:code }">{{ $err:description }}</nm:ERROR>
                  </xsl:catch>
               </xsl:try>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <xsl:call-template name="from-xdm-json-xml">
         <xsl:with-param name="source" select="$source"/>
      </xsl:call-template>
   </xsl:template>
   <xsl:mode name="cast-md" on-no-match="shallow-copy"/>
   <xsl:template match="/">
      <nm:ERROR xmlns:nm="http://csrc.nist.gov/ns/metaschema">Error in XSLT invocation - an initial template (-it) is expected ('from-json' or 'from-xdm-json-xml'), but none is given</nm:ERROR>
   </xsl:template>
   <xsl:template name="from-xdm-json-xml" expand-text="true">
      <xsl:param name="source">
         <xsl:choose><!-- evaluating $file as URI (absolute or relative to stylesheet)-->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones" -->
      <assembly name="plan-of-action-and-milestones"
                key="plan-of-action-and-milestones"
                gi="plan-of-action-and-milestones">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">plan-of-action-and-milestones</xsl:attribute>
         </xsl:if>
         <xsl:if test=".. is /j:map">
            <xsl:attribute name="namespace">http://csrc.nist.gov/ns/oscal/1.0</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='metadata']"/>
         <xsl:apply-templates select="*[@key='import-ssp']"/>
         <xsl:apply-templates select="*[@key='system-id']"/>
         <xsl:apply-templates select="*[@key='local-definitions']"/>
         <xsl:apply-templates select="*[@key='observations']"/>
         <xsl:apply-templates select="*[@key='risks']"/>
         <xsl:apply-templates select="*[@key='poam-items']"/>
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
   <xsl:template match="j:map[@key='import-ssp']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="import-ssp" -->
      <assembly name="import-ssp" key="import-ssp" gi="import-ssp">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">import-ssp</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='local-definitions']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="local-definitions" -->
      <assembly name="local-definitions"
                key="local-definitions"
                gi="local-definitions">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">local-definitions</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='components']"/>
         <xsl:apply-templates select="*[@key='inventory-items']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='components']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="component" -->
      <assembly name="system-component" gi="component">
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
      <assembly name="responsible-role" gi="responsible-role">
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
      <assembly name="protocol" gi="protocol">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='port-ranges']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="port-range" -->
      <assembly as-type="empty" name="port-range" gi="port-range">
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
         <xsl:apply-templates select="*[@key='transport']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="inventory-item" -->
      <assembly name="inventory-item" gi="inventory-item">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='implemented-components']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="observation" -->
      <assembly name="observation" gi="observation">
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
   <xsl:template match="(j:array[@key='origins']/j:map | j:map[@key='origin'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="origin" -->
      <assembly name="origin" gi="origin">
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
      <assembly name="origin-actor" gi="actor">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='actor-uuid']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="related-task" -->
      <assembly name="related-task" gi="related-task">
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
      <!-- XML match="subject" -->
      <assembly name="assessment-subject" gi="subject">
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
   <xsl:template match="j:array[@key='include-subjects']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="include-subject" -->
      <assembly name="select-subject-by-id" gi="include-subject">
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
      <assembly name="select-subject-by-id" gi="exclude-subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="risk" -->
      <assembly name="risk" gi="risk">
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
      <assembly name="characterization" gi="characterization">
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origin']"/>
         <xsl:apply-templates select="*[@key='facets']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="task" -->
      <assembly name="task" gi="task">
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
   <xsl:template match="j:array[@key='logged-by']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="logged-by" -->
      <assembly as-type="empty" name="logged-by" gi="logged-by">
         <xsl:apply-templates select="*[@key='party-uuid']"/>
         <xsl:apply-templates select="*[@key='role-id']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:array[@key='poam-items']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="poam-item" -->
      <assembly name="poam-item" gi="poam-item">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='origins']"/>
         <xsl:apply-templates select="*[@key='related-observations']"/>
         <xsl:apply-templates select="*[@key='related-risks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
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
   <xsl:template match="j:map[@key='system-id']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="system-id" -->
      <field collapsible="no"
             as-type="string"
             name="system-id"
             key="system-id"
             gi="system-id">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">system-id</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='identifier-type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching system-id-->
   <xsl:template match="j:map[@key='system-id']" mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="(j:map[@key='status'] | j:string[@key='status'])">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="status" -->
      <field collapsible="no"
             as-type="token"
             name="risk-status"
             key="status"
             gi="status"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="(j:map[@key='status'] | j:string[@key='status'])"
                 mode="get-value-property"
                 priority="5">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="threat-id" -->
      <field collapsible="no" as-type="uri" name="threat-id" gi="threat-id">
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
   <xsl:template match="j:string[@key='status-change']">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="status-change" -->
      <field collapsible="no"
             as-type="token"
             name="risk-status"
             key="status-change"
             gi="status-change"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status-change</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:string[@key='status-change']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="token" in-json="string">
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:string[@key='uuid']"
                 priority="1"><!-- XML match="plan-of-action-and-milestones/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="3"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='name']" priority="1"><!-- XML match="prop/@name" -->
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
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='uuid']" priority="1"><!-- XML match="prop/@uuid" -->
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
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']" priority="1"><!-- XML match="prop/@ns" -->
      <flag in-json="string" as-type="uri" name="ns" key="ns" gi="ns">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='ns']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='value']" priority="1"><!-- XML match="prop/@value" -->
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
   <xsl:template match="j:array[@key='props']/j:map/j:string[@key='class']" priority="1"><!-- XML match="prop/@class" -->
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='href']" priority="1"><!-- XML match="link/@href" -->
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
   <xsl:template match="j:array[@key='links']/j:map/j:string[@key='rel']" priority="1"><!-- XML match="link/@rel" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 priority="6"><!-- XML match="plan-of-action-and-milestones/metadata/document-id/@scheme | plan-of-action-and-milestones/back-matter/resource/document-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map/j:string[@key='scheme'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']" priority="1"><!-- XML match="role/@id" -->
      <flag in-json="string" as-type="token" name="id" key="id" gi="id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='roles']/j:map/j:string[@key='id']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='locations']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="location/@uuid" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"><!-- XML match="plan-of-action-and-milestones/metadata/location/address/@type | plan-of-action-and-milestones/metadata/party/address/@type" -->
      <flag in-json="string"
            as-type="token"
            name="location-type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 priority="8"><!-- XML match="plan-of-action-and-milestones/metadata/location/telephone-number/@type | plan-of-action-and-milestones/metadata/party/telephone-number/@type" -->
      <flag in-json="string"
            as-type="string"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="party/@uuid" -->
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
   <xsl:template match="j:array[@key='parties']/j:map/j:string[@key='type']"
                 priority="1"><!-- XML match="party/@type" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 priority="8"><!-- XML match="plan-of-action-and-milestones/metadata/party/external-id/@scheme" -->
      <flag in-json="string"
            as-type="uri"
            name="scheme"
            key="scheme"
            gi="scheme">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map/j:string[@key='scheme']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='responsible-parties']/j:map/j:string[@key='role-id']"
                 priority="1"><!-- XML match="responsible-party/@role-id" -->
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
   <xsl:template match="j:map[@key='import-ssp']/j:string[@key='href']" priority="1"><!-- XML match="import-ssp/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='import-ssp']/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="4"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='system-id']/j:string[@key='identifier-type']"
                 priority="1"><!-- XML match="system-id/@identifier-type" -->
      <flag in-json="string"
            as-type="uri"
            name="identifier-type"
            key="identifier-type"
            gi="identifier-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='system-id']/j:string[@key='identifier-type']"
                 mode="keep-value-property"
                 priority="4"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="component/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
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
            name="system-component-type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='components']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/local-definitions/component/status/@state" -->
      <flag in-json="string"
            as-type="token"
            name="state"
            key="state"
            gi="state">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']/j:string[@key='state']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='responsible-roles']/j:map/j:string[@key='role-id']"
                 priority="1"><!-- XML match="responsible-role/@role-id" -->
      <flag in-json="string"
            as-type="token"
            name="role-id"
            key="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='responsible-roles']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="protocol/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"
                 priority="1"><!-- XML match="protocol/@name" -->
      <flag in-json="string"
            as-type="string"
            name="name"
            key="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='protocols']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"
                 priority="1"><!-- XML match="port-range/@start" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="start"
            key="start"
            gi="start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='start']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"
                 priority="1"><!-- XML match="port-range/@end" -->
      <flag in-json="number"
            as-type="nonNegativeInteger"
            name="end"
            key="end"
            gi="end">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:number[@key='end']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"
                 priority="1"><!-- XML match="port-range/@transport" -->
      <flag in-json="string"
            as-type="token"
            name="transport"
            key="transport"
            gi="transport">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='port-ranges']/j:map/j:string[@key='transport']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="inventory-item/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='inventory-items']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 priority="8"><!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/@component-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="component-uuid"
            key="component-uuid"
            gi="component-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:string[@key='component-uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="observation/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='observations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='type']" priority="1"><!-- XML match="actor/@type" -->
      <flag in-json="string"
            as-type="token"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='actor-uuid']"
                 priority="1"><!-- XML match="actor/@actor-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="actor-uuid"
            key="actor-uuid"
            gi="actor-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='actor-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='role-id']"
                 priority="1"><!-- XML match="actor/@role-id" -->
      <flag in-json="string"
            as-type="token"
            name="role-id"
            key="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='actors']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid']"
                 priority="1"><!-- XML match="related-task/@task-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="task-uuid"
            key="task-uuid"
            gi="task-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='related-tasks']/j:map/j:string[@key='task-uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type']"
                 priority="1"><!-- XML match="subject/@type" -->
      <flag in-json="string"
            as-type="token"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='subject-uuid'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='subject-uuid']"><!-- XML match="include-subject/@subject-uuid | exclude-subject/@subject-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="subject-uuid"
            key="subject-uuid"
            gi="subject-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='subject-uuid'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='subject-uuid']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='type'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='type']"><!-- XML match="include-subject/@type | exclude-subject/@type" -->
      <flag in-json="string"
            as-type="token"
            name="subject-type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='include-subjects']/j:map/j:string[@key='type'] | j:array[@key='exclude-subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="14"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 priority="10"><!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/@subject-placeholder-uuid | plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/@subject-placeholder-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="subject-placeholder-uuid"
            key="subject-placeholder-uuid"
            gi="subject-placeholder-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:string[@key='subject-placeholder-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid']"><!-- XML match="plan-of-action-and-milestones/observation/subject/@subject-uuid | plan-of-action-and-milestones/risk/mitigating-factor/subject/@subject-uuid | plan-of-action-and-milestones/risk/response/required-asset/subject/@subject-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="subject-uuid"
            key="subject-uuid"
            gi="subject-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='subject-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type']"><!-- XML match="plan-of-action-and-milestones/observation/subject/@type | plan-of-action-and-milestones/risk/mitigating-factor/subject/@type | plan-of-action-and-milestones/risk/response/required-asset/subject/@type" -->
      <flag in-json="string"
            as-type="token"
            name="subject-type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type'] | j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/observation/relevant-evidence/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map/j:string[@key='uuid']" priority="1"><!-- XML match="risk/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='risks']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system']"
                 priority="1"><!-- XML match="threat-id/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='href']"
                 priority="1"><!-- XML match="threat-id/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='threat-ids']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"
                 priority="9"><!-- XML match="plan-of-action-and-milestones/risk/characterization/facet/@name" -->
      <flag in-json="string"
            as-type="token"
            name="name"
            key="name"
            gi="name">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='name']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"
                 priority="9"><!-- XML match="plan-of-action-and-milestones/risk/characterization/facet/@system" -->
      <flag in-json="string"
            as-type="uri"
            name="system"
            key="system"
            gi="system">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='system']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"
                 priority="9"><!-- XML match="plan-of-action-and-milestones/risk/characterization/facet/@value" -->
      <flag in-json="string"
            as-type="string"
            name="value"
            key="value"
            gi="value">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:string[@key='value']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/@implementation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="implementation-uuid"
            key="implementation-uuid"
            gi="implementation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='implementation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/risk/response/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/risk/response/@lifecycle" -->
      <flag in-json="string"
            as-type="token"
            name="lifecycle"
            key="lifecycle"
            gi="lifecycle">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='lifecycle']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 priority="9"><!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='uuid']" priority="1"><!-- XML match="task/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='type']" priority="1"><!-- XML match="task/@type" -->
      <flag in-json="string"
            as-type="token"
            name="type"
            key="type"
            gi="type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='tasks']/j:map/j:string[@key='type']"
                 mode="keep-value-property"
                 priority="9"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 priority="12"><!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/on-date/@date" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="date"
            key="date"
            gi="date">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']/j:string[@key='date']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 priority="12"><!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range/@start" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="start"
            key="start"
            gi="start">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='start']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 priority="12"><!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range/@end" -->
      <flag in-json="string"
            as-type="dateTime-with-timezone"
            name="end"
            key="end"
            gi="end">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']/j:string[@key='end']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 priority="12"><!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency/@period" -->
      <flag in-json="number"
            as-type="positiveInteger"
            name="period"
            key="period"
            gi="period">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:number[@key='period']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 priority="12"><!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency/@unit" -->
      <flag in-json="string"
            as-type="string"
            name="unit"
            key="unit"
            gi="unit">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']/j:string[@key='unit']"
                 mode="keep-value-property"
                 priority="12"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid']"
                 priority="11"><!-- XML match="plan-of-action-and-milestones/risk/response//task/dependency/@task-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="task-uuid"
            key="task-uuid"
            gi="task-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map/j:string[@key='task-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 priority="11"><!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/@activity-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="activity-uuid"
            key="activity-uuid"
            gi="activity-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:string[@key='activity-uuid']"
                 mode="keep-value-property"
                 priority="11"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 priority="8"><!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"
                 priority="1"><!-- XML match="logged-by/@party-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="party-uuid"
            key="party-uuid"
            gi="party-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='party-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='role-id']"
                 priority="1"><!-- XML match="logged-by/@role-id" -->
      <flag in-json="string"
            as-type="token"
            name="role-id"
            key="role-id"
            gi="role-id">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='logged-by']/j:map/j:string[@key='role-id']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 priority="10"><!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/@response-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="response-uuid"
            key="response-uuid"
            gi="response-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:string[@key='response-uuid']"
                 mode="keep-value-property"
                 priority="10"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/risk/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='poam-items']/j:map/j:string[@key='uuid']"
                 priority="1"><!-- XML match="poam-item/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:array[@key='poam-items']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="5"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/poam-item/related-observation/@observation-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="observation-uuid"
            key="observation-uuid"
            gi="observation-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map/j:string[@key='observation-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/poam-item/associated-risk/@risk-uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="risk-uuid"
            key="risk-uuid"
            gi="risk-uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map/j:string[@key='risk-uuid']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 priority="6"><!-- XML match="plan-of-action-and-milestones/back-matter/resource/@uuid" -->
      <flag in-json="string"
            as-type="uuid"
            name="uuid"
            key="uuid"
            gi="uuid">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='uuid']"
                 mode="keep-value-property"
                 priority="6"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 priority="8"><!-- XML match="plan-of-action-and-milestones/back-matter/resource/rlink/@href" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="href"
            key="href"
            gi="href">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='href']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"><!-- XML match="plan-of-action-and-milestones/back-matter/resource/rlink/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="8"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:array[@key='hashes']/j:map/j:string[@key='algorithm']"
                 priority="3"><!-- XML match="hash/@algorithm" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 priority="7"><!-- XML match="plan-of-action-and-milestones/back-matter/resource/base64/@filename" -->
      <flag in-json="string"
            as-type="uri-reference"
            name="filename"
            key="filename"
            gi="filename">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='filename']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"><!-- XML match="plan-of-action-and-milestones/back-matter/resource/base64/@media-type" -->
      <flag in-json="string"
            as-type="string"
            name="media-type"
            key="media-type"
            gi="media-type">
         <xsl:value-of select="."/>
      </flag>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']/j:string[@key='media-type']"
                 mode="keep-value-property"
                 priority="7"><!-- Not keeping the flag here. --></xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='title']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='title']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='published']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/published" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='published']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/last-modified" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/version" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/oscal-version" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="4">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']"
                 priority="4">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/published" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='published']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/last-modified" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='last-modified']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/version" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/oscal-version" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:string[@key='oscal-version']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/revisions/revision/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='revisions']/j:array[@key='revisions']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/document-id" -->
      <field collapsible="no"
             as-type="string"
             name="document-id"
             gi="document-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching plan-of-action-and-milestones/metadata/document-id-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/role/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/role/short-name" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/role/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/role/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address/addr-line" -->
      <field collapsible="no"
             as-type="string"
             name="addr-line"
             gi="addr-line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="8">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address/city" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='city']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address/state" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='state']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address/postal-code" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/address/country" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:map[@key='address']/j:string[@key='country']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/email-address" -->
      <field collapsible="no"
             as-type="email"
             name="email-address"
             gi="email-address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/telephone-number" -->
      <field collapsible="no"
             as-type="string"
             name="telephone-number"
             gi="telephone-number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching plan-of-action-and-milestones/metadata/location/telephone-number-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/url" -->
      <field collapsible="no"
             as-type="uri"
             name="url"
             gi="url"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='urls']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uri" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/location/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='locations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/name" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/short-name" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:string[@key='short-name']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/external-id" -->
      <field collapsible="no"
             as-type="string"
             name="external-id"
             gi="external-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching plan-of-action-and-milestones/metadata/party/external-id-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='external-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="id" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/email-address" -->
      <field collapsible="no"
             as-type="email"
             name="email-address"
             gi="email-address"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='email-addresses']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="email" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/telephone-number" -->
      <field collapsible="no"
             as-type="string"
             name="telephone-number"
             gi="telephone-number">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching plan-of-action-and-milestones/metadata/party/telephone-number-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='telephone-numbers']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="number" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address" -->
      <assembly name="address" gi="address">
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='addr-lines']"/>
         <xsl:apply-templates select="*[@key='city']"/>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='postal-code']"/>
         <xsl:apply-templates select="*[@key='country']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address/addr-line" -->
      <field collapsible="no"
             as-type="string"
             name="addr-line"
             gi="addr-line"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:array[@key='addr-lines']/j:string"
                 mode="get-value-property"
                 priority="10">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address/city" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='city']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address/state" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='state']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address/postal-code" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='postal-code']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/address/country" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='addresses']/j:map/j:string[@key='country']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/party/member-of-organization" -->
      <field collapsible="no"
             as-type="uuid"
             name="member-of-organization"
             gi="member-of-organization"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='parties']/j:map/j:array[@key='member-of-organizations']/j:string"
                 mode="get-value-property"
                 priority="7">
      <value as-type="uuid" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/metadata/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='metadata']/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='purpose']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/purpose" -->
      <field collapsible="no"
             as-type="markup-line"
             name="purpose"
             key="purpose"
             gi="purpose"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">purpose</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:string[@key='purpose']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:map[@key='status']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/status" -->
      <assembly name="status" key="status" gi="status">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">status</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='state']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/component/protocol/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='components']/j:map/j:array[@key='protocols']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component" -->
      <assembly name="implemented-component" gi="implemented-component">
         <xsl:apply-templates select="*[@key='component-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-parties']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/local-definitions/inventory-item/implemented-component/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='local-definitions']/j:array[@key='inventory-items']/j:map/j:array[@key='implemented-components']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/method" -->
      <field collapsible="no"
             as-type="string"
             name="method"
             gi="method"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='methods']/j:string"
                 mode="get-value-property"
                 priority="6">
      <value as-type="string" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='types']/j:string"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/type" -->
      <field collapsible="no"
             as-type="token"
             name="type"
             gi="type"
             in-json="SCALAR">
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='types']/j:string"
                 mode="get-value-property"
                 priority="6">
      <value as-type="token" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                key="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/subject" -->
      <assembly name="subject-reference" gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/subject/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/relevant-evidence" -->
      <assembly name="relevant-evidence" gi="relevant-evidence">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/relevant-evidence/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/relevant-evidence/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:array[@key='relevant-evidence']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='collected']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/collected" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="collected"
             key="collected"
             gi="collected"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">collected</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='collected']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='expires']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/observation/expires" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="expires"
             key="expires"
             gi="expires"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">expires</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='observations']/j:map/j:string[@key='expires']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/statement" -->
      <field in-xml="WITH_WRAPPER"
             collapsible="no"
             as-type="markup-multiline"
             name="statement"
             key="statement"
             gi="statement"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">statement</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='statement']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                key="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                key="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:map[@key='origin']/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/facet" -->
      <assembly name="facet" gi="facet">
         <xsl:apply-templates select="*[@key='name']"/>
         <xsl:apply-templates select="*[@key='system']"/>
         <xsl:apply-templates select="*[@key='value']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/characterization/facet/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='characterizations']/j:map/j:array[@key='facets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor" -->
      <assembly name="mitigating-factor" gi="mitigating-factor">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='implementation-uuid']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject" -->
      <assembly name="subject-reference" gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/mitigating-factor/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='mitigating-factors']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='deadline']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/deadline" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="deadline"
             key="deadline"
             gi="deadline"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">deadline</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:string[@key='deadline']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response" -->
      <assembly name="response" gi="response">
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject" -->
      <assembly name="identified-subject"
                key="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/origin/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='origins']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset" -->
      <assembly name="required-asset" gi="required-asset">
         <xsl:apply-templates select="*[@key='uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='description']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/subject" -->
      <assembly name="subject-reference" gi="subject">
         <xsl:apply-templates select="*[@key='subject-uuid']"/>
         <xsl:apply-templates select="*[@key='type']"/>
         <xsl:apply-templates select="*[@key='title']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/subject/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response/required-asset/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map/j:array[@key='required-assets']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='title']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='description']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/timing" -->
      <assembly name="timing" key="timing" gi="timing">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">timing</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='on-date']"/>
         <xsl:apply-templates select="*[@key='within-date-range']"/>
         <xsl:apply-templates select="*[@key='at-frequency']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='on-date']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/on-date" -->
      <assembly as-type="empty" name="on-date" key="on-date" gi="on-date">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">on-date</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='date']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='within-date-range']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/within-date-range" -->
      <assembly as-type="empty"
                name="within-date-range"
                key="within-date-range"
                gi="within-date-range">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">within-date-range</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='start']"/>
         <xsl:apply-templates select="*[@key='end']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:map[@key='timing']/j:map[@key='at-frequency']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/timing/at-frequency" -->
      <assembly as-type="empty"
                name="at-frequency"
                key="at-frequency"
                gi="at-frequency">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">at-frequency</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='period']"/>
         <xsl:apply-templates select="*[@key='unit']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='dependencies']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/dependency" -->
      <assembly name="dependency" gi="dependency">
         <xsl:apply-templates select="*[@key='task-uuid']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity" -->
      <assembly name="associated-activity" gi="associated-activity">
         <xsl:apply-templates select="*[@key='activity-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='responsible-roles']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/associated-activity/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='associated-activities']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="13">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/response//task/responsible-role/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='remediations']/j:map//j:array[@key='tasks']/j:map/j:array[@key='responsible-roles']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="13">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log" -->
      <assembly name="risk-log" key="risk-log" gi="risk-log">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">risk-log</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='entries']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry" -->
      <assembly name="entry" gi="entry">
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/start" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="start"
             key="start"
             gi="start"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">start</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='start']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 priority="8">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/end" -->
      <field collapsible="no"
             as-type="dateTime-with-timezone"
             name="end"
             key="end"
             gi="end"
             in-json="SCALAR">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">end</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:string[@key='end']"
                 mode="get-value-property"
                 priority="8">
      <value as-type="dateTime-with-timezone" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="10">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="10">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response" -->
      <assembly name="related-response" gi="related-response">
         <xsl:apply-templates select="*[@key='response-uuid']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
         <xsl:apply-templates select="*[@key='related-tasks']"/>
         <xsl:apply-templates select="*[@key='remarks']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="12">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/responsible-party/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='responsible-parties']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="14">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="14">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="16">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="16">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="18">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="18">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']"
                 priority="12">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject" -->
      <assembly name="identified-subject"
                key="identified-subject"
                gi="identified-subject">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">identified-subject</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='subject-placeholder-uuid']"/>
         <xsl:apply-templates select="*[@key='subjects']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 priority="15">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="15">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="17">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="17">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="20">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/include-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='include-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="20">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="19">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/risk-log/entry/related-response/related-task/identified-subject/subject/exclude-subject/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:map[@key='risk-log']/j:array[@key='entries']/j:map/j:array[@key='related-responses']/j:map/j:array[@key='related-tasks']/j:map/j:map[@key='identified-subject']/j:array[@key='subjects']/j:map/j:array[@key='exclude-subjects']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="19">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='risks']/j:map/j:array[@key='related-observations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/risk/related-observation" -->
      <assembly as-type="empty" name="related-observation" gi="related-observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='title']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='description']"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="5">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='origins']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/origin" -->
      <assembly name="origin" gi="origin">
         <xsl:apply-templates select="*[@key='actors']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="11">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/origin/actor/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='origins']/j:map/j:array[@key='actors']/j:map/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="11">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-observations']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/related-observation" -->
      <assembly as-type="empty" name="related-observation" gi="related-observation">
         <xsl:apply-templates select="*[@key='observation-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:array[@key='poam-items']/j:map/j:array[@key='related-risks']/j:map"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/poam-item/associated-risk" -->
      <assembly as-type="empty" name="associated-risk" gi="associated-risk">
         <xsl:apply-templates select="*[@key='risk-uuid']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map"
                 priority="5">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/title" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='title']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/description" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:string[@key='description']"
                 mode="get-value-property"
                 priority="6">
      <value as-type="markup-multiline" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/document-id" -->
      <field collapsible="no"
             as-type="string"
             name="document-id"
             gi="document-id">
         <xsl:apply-templates select="*[@key='scheme']"/>
         <xsl:apply-templates select="." mode="get-value-property"/>
      </field>
   </xsl:template>
   <!-- matching plan-of-action-and-milestones/back-matter/resource/document-id-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='document-ids']/j:map"
                 mode="get-value-property">
      <value as-type="string" key="identifier" in-json="string">
         <xsl:apply-templates mode="keep-value-property"/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/citation" -->
      <assembly name="citation" key="citation" gi="citation">
         <xsl:if test="$with-key">
            <xsl:attribute name="key">citation</xsl:attribute>
         </xsl:if>
         <xsl:apply-templates select="*[@key='text']"/>
         <xsl:apply-templates select="*[@key='props']"/>
         <xsl:apply-templates select="*[@key='links']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/citation/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:string[@key='text']"
                 mode="get-value-property"
                 priority="7">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 priority="9">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/citation/link/text" -->
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
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='citation']/j:array[@key='links']/j:map/j:string[@key='text']"
                 mode="get-value-property"
                 priority="9">
      <value as-type="markup-line" in-json="string">
         <xsl:value-of select="."/>
      </value>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:array[@key='rlinks']/j:map"
                 priority="7">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/rlink" -->
      <assembly name="rlink" gi="rlink">
         <xsl:apply-templates select="*[@key='href']"/>
         <xsl:apply-templates select="*[@key='media-type']"/>
         <xsl:apply-templates select="*[@key='hashes']"/>
      </assembly>
   </xsl:template>
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
                 priority="6">
      <xsl:param name="with-key" select="true()"/>
      <!-- XML match="plan-of-action-and-milestones/back-matter/resource/base64" -->
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
   <!-- matching plan-of-action-and-milestones/back-matter/resource/base64-->
   <xsl:template match="j:map[@key='plan-of-action-and-milestones']/j:map[@key='back-matter']/j:array[@key='resources']/j:map/j:map[@key='base64']"
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
