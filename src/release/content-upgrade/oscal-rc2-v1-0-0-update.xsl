<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://csrc.nist.gov/ns/oscal/1.0"
                xmlns:uuid="java:java.util.UUID"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                exclude-result-prefixes="#all"
                version="3.0">

<!-- This XSLT, applied to an XML document valid to the Milestone 3 OSCAL schema version for Catalog, Profile, SSP or Component,
     will produce a similar XML document, valid or closer to valid to the Release Candidate 1 OSCAL schema. -->
   <xsl:output indent="yes"/>
   
   <xsl:mode on-no-match="shallow-copy"/>
   
   <xsl:mode name="copy" on-no-match="shallow-copy"/>

   <xsl:param name="schema-location" as="xs:string" select="''"/>
   
   <xsl:variable select="uuid:randomUUID()" name="new-document-uuid"/>
   
   <xsl:template match="/comment()"/>
   
   <xsl:template match="/*">
      <xsl:comment expand-text="true"> Modified by the OSCAL 1.0.0 RC2 to OSCAL 1.0.0 conversion XSLT on { current-dateTime() } </xsl:comment>
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="@* except @id"/>
         <xsl:attribute name="uuid" select="$new-document-uuid"/>
         <xsl:choose>
            <xsl:when test="$schema-location => boolean()">
               <xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="$schema-location"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:message>xsi:schemaLocation not set, parameter schema-location is undefined.</xsl:message>
            </xsl:otherwise>
         </xsl:choose>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>

   <xsl:template match="@xsi:schemaLocation"/>
   
   <xsl:template match="oscal-version">
      <oscal-version>1.0.0</oscal-version>
   </xsl:template>
   
   <xsl:template match="last-modified" expand-text="true">
      <last-modified>{ current-dateTime() }</last-modified>
   </xsl:template>
   
   <!-- Usage change: we no longer permit spaces in values of select/@how-many -->
   <xsl:template match="select/@how-many" expand-text="true">
        <!-- trims and replaces remaining spaces with hyphens -->
      <xsl:attribute name="how-many" select="normalize-space() ! replace(.,' ','-')"/>
   </xsl:template>
   
   <!-- METASCHEMA MODULE oscal_catalog_metaschema.xml-->
   <!-- Catalog format changes only 'NCName' values to 'token'  -->
   
   <!-- METASCHEMA MODULE oscal_metadata_metaschema.xml-->
   <xsl:template match="back-matter//biblio">
      <xsl:message>'biblio' element is dropped from data in conversion (as it is no longer supported in OSCAL).</xsl:message>
   </xsl:template>
   
   <!-- METASCHEMA MODULE oscal_control-common_metaschema.xml-->
   <!-- only 'NCName' to 'token' -->
   
   <!-- METASCHEMA MODULE oscal_profile_metaschema.xml-->
   <xsl:template match="set-parameter">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates select="prop"/>
         <xsl:apply-templates select="link"/>
         <xsl:apply-templates select="label"/>
         <xsl:apply-templates select="usage"/>
         <xsl:apply-templates select="constraint"/>
         <xsl:apply-templates select="guideline"/>
         <xsl:apply-templates select="value"/>
         <xsl:apply-templates select="select"/>
      </xsl:copy>
   </xsl:template>
   
   <xsl:template match="add/@id-ref | remove/@id-ref">
      <xsl:attribute name="by-id" select="."/>
   </xsl:template>
   
   <xsl:template match="remove/@name-ref">
      <xsl:attribute name="by-name" select="."/>
   </xsl:template>
   
   <xsl:template match="remove/@class-ref">
      <xsl:attribute name="by-class" select="."/>
   </xsl:template>
   
   <xsl:template match="remove/@item-name">
      <xsl:attribute name="by-item-name" select="."/>
   </xsl:template>
   
   <xsl:template match="remove/@ns-ref">
      <xsl:attribute name="by-ns" select="."/>
   </xsl:template>
   
   <!-- METASCHEMA MODULE oscal_ssp_metaschema.xml -->
   <!-- responsible-role was added (back) to statement; many BY_KEY were switched to ARRAY group types-->
   
   <!-- METASCHEMA MODULE oscal_component_metaschema.xml-->
   <!-- order changes: -->
   <xsl:template match="implemented-requirement">
      <xsl:copy>
         <xsl:apply-templates select="@*"/>
         <xsl:apply-templates select="prop"/>
         <xsl:apply-templates select="link"/>
         <xsl:apply-templates select="responsible-role"/>
         <xsl:apply-templates select="set-parameter"/>
         <xsl:apply-templates select="statement"/>
         <xsl:apply-templates select="remarks"/>
      </xsl:copy>
   </xsl:template>
   
   <!-- METASCHEMA MODULE oscal_implementation-common_metaschema.xml-->
   <!-- 'BY_KEY' is now 'ARRAY'; 'NCName' is now 'token' - no syntax change in XML -->
   
   <!-- METASCHEMA MODULE oscal_assessment-plan_metaschema.xml-->
   <!-- 'BY_KEY' is now 'ARRAY' -->
   
   <!-- METASCHEMA MODULE oscal_assessment-results_metaschema.xml-->
   <!-- 'BY_KEY' is now 'ARRAY' -->
   
   <!-- METASCHEMA MODULE oscal_assessment-common_metaschema.xml-->
   <xsl:template match="subject-placeholder">
      <xsl:message>'subject-placeholder' element is dropped from data in conversion (as it is no longer supported in OSCAL).</xsl:message>
   </xsl:template>
   
   <!-- object select-subject-by-id has names in use 'include-subject' and 'exclude-subject'-->
   <xsl:template match="include-subject/@uuid-ref | exclude-subject/@uuid-ref">
      <xsl:attribute name="subject-uuid" select="string(.)"/>
      <!-- ADD THE NEW MANDATORY @type HERE ...
             it may be 'system' or 'this-system' if the subject of the assessment is the system as a whole
             (uuid corresponding to 'this-system' in the imported SSP).
             or if a targeted component or capability, it may be the type of component or capability -->
      <!--<xsl:attribute name="type"> ... literal or calculated value, or ...
              <xsl:apply-templates select="$type-target" mode="type-for-assessment"/>
            </xsl:attribute>-->
      <!-- DROP MESSAGING BY REMOVING OR COMMENTING OUT -->
      <xsl:message expand-text="true">'{name(..)}' type must be defined: please provide a type for
            { name(..) } '{ @uuid-ref }'.</xsl:message>
   </xsl:template>
   
   <!-- METASCHEMA MODULE metaschema/oscal_poam_metaschema.xml-->
   <!-- 'BY_KEY' is now 'ARRAY' -->
</xsl:stylesheet>
