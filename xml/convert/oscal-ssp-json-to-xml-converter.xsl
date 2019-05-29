<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- OSCAL system-security-plan conversion stylesheet supports JSON->XML conversion -->
   <xsl:param name="target-ns"
              as="xs:string?"
              select="'urn:OSCAL-SSP-metaschema'"/>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:preserve-space elements="string"/>
   <xsl:param name="json-file" as="xs:string"/>
   <xsl:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/>
   <xsl:template match="/">
      <xsl:choose>
         <xsl:when test="exists($json-xml/map)">
            <xsl:apply-templates select="$json-xml" mode="json2xml"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="json2xml"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/map[empty(@key)]" priority="10" mode="json2xml">
      <xsl:apply-templates mode="#current" select="*[@key=('system-security-plan')]"/>
   </xsl:template>
   <xsl:template match="array" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="array[@key='prose']/*" priority="5" mode="json2xml">
      <xsl:element name="p" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:variable name="text-contents" select="string-join(string,'&#xA;')"/>
         <xsl:call-template name="parse">
            <xsl:with-param name="str" select="$text-contents"/>
         </xsl:call-template>
      </xsl:element>
   </xsl:template>
   <xsl:template match="string[@key='RICHTEXT']" mode="json2xml">
      <xsl:call-template name="parse"/>
   </xsl:template>
   <xsl:template match="string[@key='STRVALUE']" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="*"/>
   <xsl:template mode="as-attribute" match="map">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="string[@key='id']" priority="0.4">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- 000 Handling assembly "system-security-plan" 000 -->
   <xsl:template match="*[@key='system-security-plan'] | *[@key='ssp']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="system-security-plan" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('metadata')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import', 'imports')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-characteristics', 'ssp-system-characteristics')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-implementation', 'ssp-system-implementation')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('control-implementation', 'ssp-control-implementation')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('attachment')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "system-characteristics" 000 -->
   <xsl:template match="*[@key='system-characteristics'] | *[@key='ssp-system-characteristics']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="system-characteristics" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-id')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('system-name-short')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-sensitivity-level')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-information', 'ssp-system-information')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('security-impact-level', 'ssp-security-impact-level')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('security-eauth', 'ssp-security-eauth')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('status')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('status-other-description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('deployment-model')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('deployment-model-other-description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('service-model', 'service-models')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('service-model-other-description', 'service-model-descriptions')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorizations', 'ssp-leveraged-authorizations')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('authorization-boundary', 'ssp-authorization-boundary')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('network-architecture', 'ssp-network-architecture')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('data-flow', 'ssp-data-flow')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('users', 'ssp-users')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-id" 000 -->
   <xsl:template match="*[@key='system-id']" priority="2" mode="json2xml">
      <xsl:element name="system-id" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-name" 000 -->
   <xsl:template match="*[@key='system-name']" priority="2" mode="json2xml">
      <xsl:element name="system-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "system-name-short" 000 -->
   <xsl:template match="*[@key='system-name-short']" priority="2" mode="json2xml">
      <xsl:element name="system-name-short" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "description" 000 -->
   <xsl:template match="*[@key='description']" priority="2" mode="json2xml">
      <xsl:element name="description" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-sensitivity-level" 000 -->
   <xsl:template match="*[@key='security-sensitivity-level']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-sensitivity-level" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "system-information" 000 -->
   <xsl:template match="*[@key='system-information'] | *[@key='ssp-system-information']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="system-information" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('information-type', 'ssp-information-type')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('designations', 'ssp-designations')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "designations" 000 -->
   <xsl:template match="*[@key='designations'] | *[@key='ssp-designations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="designations" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('designation', 'ssp-designation')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "designation" 000 -->
   <xsl:template match="*[@key='designation'] | *[@key='ssp-designation']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="designation" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('declaration')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qualifiers', 'ssp-qualifiers')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "declaration" 000 -->
   <xsl:template match="*[@key='declaration']" priority="2" mode="json2xml">
      <xsl:element name="declaration" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "qualifiers" 000 -->
   <xsl:template match="*[@key='qualifiers'] | *[@key='ssp-qualifiers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="qualifiers" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qualifier', 'ssp-qualifiers')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "qualifier" 000 -->
   <xsl:template match="*[@key='qualifier'] | *[@key='ssp-qualifiers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="qualifier" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-question')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-response')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('qual-notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-question" 000 -->
   <xsl:template match="*[@key='qual-question']" priority="2" mode="json2xml">
      <xsl:element name="qual-question" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-response" 000 -->
   <xsl:template match="*[@key='qual-response']" priority="2" mode="json2xml">
      <xsl:element name="qual-response" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "qual-notes" 000 -->
   <xsl:template match="*[@key='qual-notes']" priority="2" mode="json2xml">
      <xsl:element name="qual-notes" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "information-type" 000 -->
   <xsl:template match="*[@key='information-type'] | *[@key='ssp-information-type']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="information-type" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('confidentiality-impact', 'ssp-confidentiality-impact')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('integrity-impact', 'ssp-integrity-impact')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('availability-impact', 'ssp-availability-impact')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "confidentiality-impact" 000 -->
   <xsl:template match="*[@key='confidentiality-impact'] | *[@key='ssp-confidentiality-impact']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="confidentiality-impact" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "integrity-impact" 000 -->
   <xsl:template match="*[@key='integrity-impact'] | *[@key='ssp-integrity-impact']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="integrity-impact" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "availability-impact" 000 -->
   <xsl:template match="*[@key='availability-impact'] | *[@key='ssp-availability-impact']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="availability-impact" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('selected')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('adjustment-justification')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "base" 000 -->
   <xsl:template match="*[@key='base']" priority="2" mode="json2xml">
      <xsl:element name="base" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "selected" 000 -->
   <xsl:template match="*[@key='selected']" priority="2" mode="json2xml">
      <xsl:element name="selected" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "adjustment-justification" 000 -->
   <xsl:template match="*[@key='adjustment-justification']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="adjustment-justification" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "security-impact-level" 000 -->
   <xsl:template match="*[@key='security-impact-level'] | *[@key='ssp-security-impact-level']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-impact-level" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-confidentiality')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-integrity')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-objective-availability')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-confidentiality" 000 -->
   <xsl:template match="*[@key='security-objective-confidentiality']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-objective-confidentiality"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-integrity" 000 -->
   <xsl:template match="*[@key='security-objective-integrity']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-objective-integrity"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-objective-availability" 000 -->
   <xsl:template match="*[@key='security-objective-availability']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-objective-availability"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "security-eauth" 000 -->
   <xsl:template match="*[@key='security-eauth'] | *[@key='ssp-security-eauth']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="security-eauth" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-ial')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-aal')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-auth-fal')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('security-eauth-level')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-ial" 000 -->
   <xsl:template match="*[@key='security-auth-ial']" priority="2" mode="json2xml">
      <xsl:element name="security-auth-ial" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-aal" 000 -->
   <xsl:template match="*[@key='security-auth-aal']" priority="2" mode="json2xml">
      <xsl:element name="security-auth-aal" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-auth-fal" 000 -->
   <xsl:template match="*[@key='security-auth-fal']" priority="2" mode="json2xml">
      <xsl:element name="security-auth-fal" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "security-eauth-level" 000 -->
   <xsl:template match="*[@key='security-eauth-level']" priority="2" mode="json2xml">
      <xsl:element name="security-eauth-level" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "status" 000 -->
   <xsl:template match="*[@key='status']" priority="2" mode="json2xml">
      <xsl:element name="status" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "status-other-description" 000 -->
   <xsl:template match="*[@key='status-other-description']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="status-other-description" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "deployment-model" 000 -->
   <xsl:template match="*[@key='deployment-model']" priority="2" mode="json2xml">
      <xsl:element name="deployment-model" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "deployment-model-other-description" 000 -->
   <xsl:template match="*[@key='deployment-model-other-description']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="deployment-model-other-description"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "service-model" 000 -->
   <xsl:template match="*[@key='service-model'] | *[@key='service-models']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="service-model" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "service-model-other-description" 000 -->
   <xsl:template match="*[@key='service-model-other-description'] | *[@key='service-model-descriptions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="service-model-other-description"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "leveraged-authorizations" 000 -->
   <xsl:template match="*[@key='leveraged-authorizations'] | *[@key='ssp-leveraged-authorizations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="leveraged-authorizations" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization', 'ssp-leveraged-authorization')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "leveraged-authorization" 000 -->
   <xsl:template match="*[@key='leveraged-authorization'] | *[@key='ssp-leveraged-authorization']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('leveraged-authorization-name')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization-service-provider')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('leveraged-authorization-date-granted')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-name" 000 -->
   <xsl:template match="*[@key='leveraged-authorization-name']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-name"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-service-provider" 000 -->
   <xsl:template match="*[@key='leveraged-authorization-service-provider']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-service-provider"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "leveraged-authorization-date-granted" 000 -->
   <xsl:template match="*[@key='leveraged-authorization-date-granted']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="leveraged-authorization-date-granted"
                   namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "authorization-boundary" 000 -->
   <xsl:template match="*[@key='authorization-boundary'] | *[@key='ssp-authorization-boundary']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="authorization-boundary" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('boundary-diagram', 'ssp-boundary-diagram')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "boundary-diagram" 000 -->
   <xsl:template match="*[@key='boundary-diagram'] | *[@key='ssp-boundary-diagram']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="boundary-diagram" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('boundary-description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "boundary-description" 000 -->
   <xsl:template match="*[@key='boundary-description']" priority="2" mode="json2xml">
      <xsl:element name="boundary-description" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "network-architecture" 000 -->
   <xsl:template match="*[@key='network-architecture'] | *[@key='ssp-network-architecture']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="network-architecture" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('network-diagram', 'ssp-network-boundary')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "network-diagram" 000 -->
   <xsl:template match="*[@key='network-diagram'] | *[@key='ssp-network-boundary']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="network-diagram" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('network-description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "network-description" 000 -->
   <xsl:template match="*[@key='network-description']" priority="2" mode="json2xml">
      <xsl:element name="network-description" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "data-flow" 000 -->
   <xsl:template match="*[@key='data-flow'] | *[@key='ssp-data-flow']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="data-flow" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('data-flow-diagram', 'ssp-data-flow-diagram')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "data-flow-diagram" 000 -->
   <xsl:template match="*[@key='data-flow-diagram'] | *[@key='ssp-data-flow-diagram']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="data-flow-diagram" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('data-flow-description')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "data-flow-description" 000 -->
   <xsl:template match="*[@key='data-flow-description']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="data-flow-description" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "users" 000 -->
   <xsl:template match="*[@key='users'] | *[@key='ssp-users']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="users" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('statistics', 'ssp-statistics')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "role" 000 -->
   <xsl:template match="*[@key='role'] | *[@key='roles']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="role" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('privilege', 'privileges')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('responsibility', 'responsibilities')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "privilege" 000 -->
   <xsl:template match="*[@key='privilege'] | *[@key='privileges']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="privilege" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "responsibility" 000 -->
   <xsl:template match="*[@key='responsibility'] | *[@key='responsibilities']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="responsibility" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "statistics" 000 -->
   <xsl:template match="*[@key='statistics'] | *[@key='ssp-statistics']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="statistics" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('internal-user-total-current')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('internal-user-total-future')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-user-total-current')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-user-total-future')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "internal-user-total-current" 000 -->
   <xsl:template match="*[@key='internal-user-total-current']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="internal-user-total-current" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "internal-user-total-future" 000 -->
   <xsl:template match="*[@key='internal-user-total-future']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="internal-user-total-future" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-user-total-current" 000 -->
   <xsl:template match="*[@key='external-user-total-current']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="external-user-total-current" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-user-total-future" 000 -->
   <xsl:template match="*[@key='external-user-total-future']"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="external-user-total-future" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "system-implementation" 000 -->
   <xsl:template match="*[@key='system-implementation'] | *[@key='ssp-system-implementation']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="system-implementation" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('ports-protocols-services', 'ssp-ports-protocols-services')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('interconnection', 'ssp-interconnection')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('component', 'components')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('system-inventory', 'ssp-system-inventory')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "ports-protocols-services" 000 -->
   <xsl:template match="*[@key='ports-protocols-services'] | *[@key='ssp-ports-protocols-services']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ports-protocols-services" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('service', 'ssp-service')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "service" 000 -->
   <xsl:template match="*[@key='service'] | *[@key='ssp-service']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="service" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('protocol', 'ssp-protocol')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('purpose')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('used-by', 'component-users')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "protocol" 000 -->
   <xsl:template match="*[@key='protocol'] | *[@key='ssp-protocol']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="protocol" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('port-range', 'port-ranges')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "port-range" 000 -->
   <xsl:template match="*[@key='port-range'] | *[@key='port-ranges']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="port-range" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "purpose" 000 -->
   <xsl:template match="*[@key='purpose']" priority="2" mode="json2xml">
      <xsl:element name="purpose" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "used-by" 000 -->
   <xsl:template match="*[@key='used-by'] | *[@key='component-users']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="used-by" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "interconnected" 000 -->
   <xsl:template match="*[@key='interconnected']" mode="json2xml"/>
   <xsl:template match="*[@key='system-implementation']/*[@key='interconnected'] | *[@key='ssp-system-implementation']/*/*[@key='interconnected']"
                 mode="as-attribute">
      <xsl:attribute name="interconnected">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "interconnection" 000 -->
   <xsl:template match="*[@key='interconnection'] | *[@key='ssp-interconnection']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="interconnection" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-system-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('external-system-org')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('isa-authorization', 'isa-authorizations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('isa-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('isa-date')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-system-name" 000 -->
   <xsl:template match="*[@key='external-system-name']" priority="2" mode="json2xml">
      <xsl:element name="external-system-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "external-system-org" 000 -->
   <xsl:template match="*[@key='external-system-org']" priority="2" mode="json2xml">
      <xsl:element name="external-system-org" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "isa-authorization" 000 -->
   <xsl:template match="*[@key='isa-authorization'] | *[@key='isa-authorizations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="isa-authorization" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "isa-name" 000 -->
   <xsl:template match="*[@key='isa-name']" priority="2" mode="json2xml">
      <xsl:element name="isa-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "isa-date" 000 -->
   <xsl:template match="*[@key='isa-date']" priority="2" mode="json2xml">
      <xsl:element name="isa-date" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "component" 000 -->
   <xsl:template match="*[@key='component'] | *[@key='components']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="component" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('origin', 'ssp-origin')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('characteristics', 'ssp-characteristics')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('satisfaction', 'ssp-satisfaction')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('validation', 'validations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('provisioning', 'ssp-provisioning')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('subcomponent', 'subcomponents')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "origin" 000 -->
   <xsl:template match="*[@key='origin'] | *[@key='ssp-origin']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="origin" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('organization')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('release-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('model')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'ssp-part')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='system-security-plan']/*[@key='id'] | *[@key='ssp']/*/*[@key='id'] | *[@key='designation']/*[@key='id'] | *[@key='ssp-designation']/*/*[@key='id'] | *[@key='qualifier']/*[@key='id'] | *[@key='ssp-qualifiers']/*/*[@key='id'] | *[@key='information-type']/*[@key='id'] | *[@key='ssp-information-type']/*/*[@key='id'] | *[@key='leveraged-authorization']/*[@key='id'] | *[@key='ssp-leveraged-authorization']/*/*[@key='id'] | *[@key='boundary-diagram']/*[@key='id'] | *[@key='ssp-boundary-diagram']/*/*[@key='id'] | *[@key='network-diagram']/*[@key='id'] | *[@key='ssp-network-boundary']/*/*[@key='id'] | *[@key='data-flow-diagram']/*[@key='id'] | *[@key='ssp-data-flow-diagram']/*/*[@key='id'] | *[@key='role']/*[@key='id'] | *[@key='roles']/*/*[@key='id'] | *[@key='service']/*[@key='id'] | *[@key='ssp-service']/*/*[@key='id'] | *[@key='interconnection']/*[@key='id'] | *[@key='ssp-interconnection']/*/*[@key='id'] | *[@key='component']/*[@key='id'] | *[@key='components']/*/*[@key='id'] | *[@key='origin']/*[@key='id'] | *[@key='ssp-origin']/*/*[@key='id'] | *[@key='vendor']/*[@key='id'] | *[@key='vendors']/*/*[@key='id'] | *[@key='satisfaction']/*[@key='id'] | *[@key='ssp-satisfaction']/*/*[@key='id'] | *[@key='inventory-item']/*[@key='id'] | *[@key='inventory-items']/*/*[@key='id'] | *[@key='references']/*[@key='id'] | *[@key='ref']/*[@key='id'] | *[@key='refs']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*/*[@key='id'] | *[@key='attachment']/*[@key='id'] | *[@key='party']/*[@key='id'] | *[@key='parties']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "vendor" 000 -->
   <xsl:template match="*[@key='vendor'] | *[@key='vendors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="vendor" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "release-date" 000 -->
   <xsl:template match="*[@key='release-date']" priority="2" mode="json2xml">
      <xsl:element name="release-date" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "model" 000 -->
   <xsl:template match="*[@key='model']" priority="2" mode="json2xml">
      <xsl:element name="model" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "part" 000 -->
   <xsl:template match="*[@key='part'] | *[@key='ssp-part']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="part" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "characteristics" 000 -->
   <xsl:template match="*[@key='characteristics'] | *[@key='ssp-characteristics']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="characteristics" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ip-address', 'ip-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('service', 'ssp-service')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'ssp-part')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "ip-address" 000 -->
   <xsl:template match="*[@key='ip-address'] | *[@key='ip-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ip-address" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "satisfaction" 000 -->
   <xsl:template match="*[@key='satisfaction'] | *[@key='ssp-satisfaction']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="satisfaction" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "system-inventory" 000 -->
   <xsl:template match="*[@key='system-inventory'] | *[@key='ssp-system-inventory']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="system-inventory" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('inventory-item', 'inventory-items')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "inventory-item" 000 -->
   <xsl:template match="*[@key='inventory-item'] | *[@key='inventory-items']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="inventory-item" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ip-address', 'ip-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('dns-name', 'dns-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('host-item', 'ssp-host-item')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('software-item', 'ssp-software-item')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('comments')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('serial-no')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('network-id', 'network-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('asset-owner', 'asset-owners')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('asset-administrator', 'asset-administrators')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "dns-name" 000 -->
   <xsl:template match="*[@key='dns-name'] | *[@key='dns-names']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="dns-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "host-item" 000 -->
   <xsl:template match="*[@key='host-item'] | *[@key='ssp-host-item']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="host-item" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('netbios-name', 'netbios-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('mac-address', 'mac-addresses')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('authenticated-scan', 'authenticated-scans')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('baseline-template', 'baseline-templates')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('os-name', 'os-names')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('os-version', 'os-versions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('location', 'locations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('asset-type', 'asset-types')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('vendor', 'vendors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hardware-model', 'hardware-models')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('scanned', 'ssp-scanned')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "netbios-name" 000 -->
   <xsl:template match="*[@key='netbios-name'] | *[@key='netbios-names']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="netbios-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "mac-address" 000 -->
   <xsl:template match="*[@key='mac-address'] | *[@key='mac-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="mac-address" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "os-name" 000 -->
   <xsl:template match="*[@key='os-name'] | *[@key='os-names']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="os-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "os-version" 000 -->
   <xsl:template match="*[@key='os-version'] | *[@key='os-versions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="os-version" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "location" 000 -->
   <xsl:template match="*[@key='location'] | *[@key='locations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="location" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "asset-type" 000 -->
   <xsl:template match="*[@key='asset-type'] | *[@key='asset-types']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="asset-type" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "hardware-model" 000 -->
   <xsl:template match="*[@key='hardware-model'] | *[@key='hardware-models']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hardware-model" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "authenticated-scan" 000 -->
   <xsl:template match="*[@key='authenticated-scan'] | *[@key='authenticated-scans']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="authenticated-scan" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "software-item" 000 -->
   <xsl:template match="*[@key='software-item'] | *[@key='ssp-software-item']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="software-item" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('vendor', 'vendors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('software-name', 'software-names')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('software-version', 'software-versions')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('software-patch-level', 'software-patch-levels')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('function', 'functions')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "software-name" 000 -->
   <xsl:template match="*[@key='software-name'] | *[@key='software-names']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="software-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "software-version" 000 -->
   <xsl:template match="*[@key='software-version'] | *[@key='software-versions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="software-version" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "software-patch-level" 000 -->
   <xsl:template match="*[@key='software-patch-level'] | *[@key='software-patch-levels']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="software-patch-level" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "function" 000 -->
   <xsl:template match="*[@key='function'] | *[@key='functions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="function" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "comments" 000 -->
   <xsl:template match="*[@key='comments']" priority="2" mode="json2xml">
      <xsl:element name="comments" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "serial-no" 000 -->
   <xsl:template match="*[@key='serial-no']" priority="2" mode="json2xml">
      <xsl:element name="serial-no" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "network-id" 000 -->
   <xsl:template match="*[@key='network-id'] | *[@key='network-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="network-id" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "asset-owner" 000 -->
   <xsl:template match="*[@key='asset-owner'] | *[@key='asset-owners']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="asset-owner" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "asset-administrator" 000 -->
   <xsl:template match="*[@key='asset-administrator'] | *[@key='asset-administrators']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="asset-administrator" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "control-implementation" 000 -->
   <xsl:template match="*[@key='control-implementation'] | *[@key='ssp-control-implementation']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="control-implementation" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('control', 'controls')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "control" 000 -->
   <xsl:template match="*[@key='control'] | *[@key='controls']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="control" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('responsible-role', 'ssp-responsible-role')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('set-param', 'parameter-settings')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current"
                              select="*[@key=('control-response', 'control-responses')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "responsible-role" 000 -->
   <xsl:template match="*[@key='responsible-role'] | *[@key='ssp-responsible-role']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="responsible-role" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "set-param" 000 -->
   <xsl:template match="*[@key='set-param'] | *[@key='parameter-settings']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="set-param" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "value" 000 -->
   <xsl:template match="*[@key='value']" priority="2" mode="json2xml">
      <xsl:element name="value" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "control-response" 000 -->
   <xsl:template match="*[@key='control-response'] | *[@key='control-responses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="control-response" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "references" 000 -->
   <xsl:template match="*[@key='references']" priority="2" mode="json2xml">
      <xsl:element name="references" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref', 'refs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "ref" 000 -->
   <xsl:template match="*[@key='ref'] | *[@key='refs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ref" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('citation', 'citations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "citation" 000 -->
   <xsl:template match="*[@key='citation'] | *[@key='citations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="citation" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "link" 000 -->
   <xsl:template match="*[@key='link'] | *[@key='links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="link" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='RICHTEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "attachment" 000 -->
   <xsl:template match="*[@key='attachment']" priority="2" mode="json2xml">
      <xsl:element name="attachment" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('description')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('format')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('attachment-type')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('base64')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "format" 000 -->
   <xsl:template match="*[@key='format']" priority="2" mode="json2xml">
      <xsl:element name="format" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "date" 000 -->
   <xsl:template match="*[@key='date']" priority="2" mode="json2xml">
      <xsl:element name="date" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "attachment-type" 000 -->
   <xsl:template match="*[@key='attachment-type']" priority="2" mode="json2xml">
      <xsl:element name="attachment-type" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "base64" 000 -->
   <xsl:template match="*[@key='base64']" priority="2" mode="json2xml">
      <xsl:element name="base64" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "attachment-id" 000 -->
   <xsl:template match="*[@key='attachment-id']" mode="json2xml"/>
   <xsl:template match="*[@key='boundary-diagram']/*[@key='attachment-id'] | *[@key='ssp-boundary-diagram']/*/*[@key='attachment-id'] | *[@key='network-diagram']/*[@key='attachment-id'] | *[@key='ssp-network-boundary']/*/*[@key='attachment-id'] | *[@key='data-flow-diagram']/*[@key='attachment-id'] | *[@key='ssp-data-flow-diagram']/*/*[@key='attachment-id']"
                 mode="as-attribute">
      <xsl:attribute name="attachment-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "component-id" 000 -->
   <xsl:template match="*[@key='component-id']" mode="json2xml"/>
   <xsl:template match="*[@key='inventory-item']/*[@key='component-id'] | *[@key='inventory-items']/*/*[@key='component-id'] | *[@key='call']/*[@key='component-id'] | *[@key='calls']/*/*[@key='component-id']"
                 mode="as-attribute">
      <xsl:attribute name="component-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "control-id" 000 -->
   <xsl:template match="*[@key='control-id']" mode="json2xml"/>
   <xsl:template match="*[@key='control']/*[@key='control-id'] | *[@key='controls']/*/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "stmt-id" 000 -->
   <xsl:template match="*[@key='stmt-id']" mode="json2xml"/>
   <xsl:template match="*[@key='control-response']/*[@key='stmt-id'] | *[@key='control-responses']/*/*[@key='stmt-id']"
                 mode="as-attribute">
      <xsl:attribute name="stmt-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "nist-id" 000 -->
   <xsl:template match="*[@key='nist-id']" mode="json2xml"/>
   <xsl:template match="*[@key='information-type']/*[@key='nist-id'] | *[@key='ssp-information-type']/*/*[@key='nist-id']"
                 mode="as-attribute">
      <xsl:attribute name="nist-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "poc-id" 000 -->
   <xsl:template match="*[@key='poc-id']" mode="json2xml"/>
   <xsl:template match="*[@key='asset-owner']/*[@key='poc-id'] | *[@key='asset-owners']/*/*[@key='poc-id'] | *[@key='asset-administrator']/*[@key='poc-id'] | *[@key='asset-administrators']/*/*[@key='poc-id']"
                 mode="as-attribute">
      <xsl:attribute name="poc-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "param-id" 000 -->
   <xsl:template match="*[@key='param-id']" mode="json2xml"/>
   <xsl:template match="*[@key='set-param']/*[@key='param-id'] | *[@key='parameter-settings']/*/*[@key='param-id']"
                 mode="as-attribute">
      <xsl:attribute name="param-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "ref-type" 000 -->
   <xsl:template match="*[@key='ref-type']" mode="json2xml"/>
   <xsl:template match="*[@key='ref']/*[@key='ref-type'] | *[@key='refs']/*/*[@key='ref-type']"
                 mode="as-attribute">
      <xsl:attribute name="ref-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "target" 000 -->
   <xsl:template match="*[@key='target']" mode="json2xml"/>
   <xsl:template match="*[@key='set-param']/*[@key='target'] | *[@key='parameter-settings']/*/*[@key='target']"
                 mode="as-attribute">
      <xsl:attribute name="target">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "filename" 000 -->
   <xsl:template match="*[@key='filename']" mode="json2xml"/>
   <xsl:template match="*[@key='base64']/*[@key='filename']" mode="as-attribute">
      <xsl:attribute name="filename">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "role-id" 000 -->
   <xsl:template match="*[@key='role-id']" mode="json2xml"/>
   <xsl:template match="*[@key='responsible-role']/*[@key='role-id'] | *[@key='ssp-responsible-role']/*/*[@key='role-id'] | *[@key='party']/*[@key='role-id'] | *[@key='parties']/*/*[@key='role-id']"
                 mode="as-attribute">
      <xsl:attribute name="role-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='part']/*[@key='class'] | *[@key='ssp-part']/*/*[@key='class'] | *[@key='control']/*[@key='class'] | *[@key='controls']/*/*[@key='class'] | *[@key='prop']/*[@key='class'] | *[@key='properties']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "context" 000 -->
   <xsl:template match="*[@key='context']" mode="json2xml"/>
   <xsl:template match="*[@key='characteristics']/*[@key='context'] | *[@key='ssp-characteristics']/*/*[@key='context'] | *[@key='satisfaction']/*[@key='context'] | *[@key='ssp-satisfaction']/*/*[@key='context']"
                 mode="as-attribute">
      <xsl:attribute name="context">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "name" 000 -->
   <xsl:template match="*[@key='name']" mode="json2xml"/>
   <xsl:template match="*[@key='role']/*[@key='name'] | *[@key='roles']/*/*[@key='name'] | *[@key='service']/*[@key='name'] | *[@key='ssp-service']/*/*[@key='name'] | *[@key='protocol']/*[@key='name'] | *[@key='ssp-protocol']/*/*[@key='name']"
                 mode="as-attribute">
      <xsl:attribute name="name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "start" 000 -->
   <xsl:template match="*[@key='start']" mode="json2xml"/>
   <xsl:template match="*[@key='port-range']/*[@key='start'] | *[@key='port-ranges']/*/*[@key='start']"
                 mode="as-attribute">
      <xsl:attribute name="start">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "end" 000 -->
   <xsl:template match="*[@key='end']" mode="json2xml"/>
   <xsl:template match="*[@key='port-range']/*[@key='end'] | *[@key='port-ranges']/*/*[@key='end']"
                 mode="as-attribute">
      <xsl:attribute name="end">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "transport" 000 -->
   <xsl:template match="*[@key='transport']" mode="json2xml"/>
   <xsl:template match="*[@key='port-range']/*[@key='transport'] | *[@key='port-ranges']/*/*[@key='transport']"
                 mode="as-attribute">
      <xsl:attribute name="transport">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "type" 000 -->
   <xsl:template match="*[@key='type']" mode="json2xml"/>
   <xsl:template match="*[@key='system-id']/*[@key='type'] | *[@key='component']/*[@key='type'] | *[@key='components']/*/*[@key='type'] | *[@key='vendor']/*[@key='type'] | *[@key='vendors']/*/*[@key='type'] | *[@key='ip-address']/*[@key='type'] | *[@key='ip-addresses']/*/*[@key='type'] | *[@key='doc-id']/*[@key='type'] | *[@key='document-ids']/*/*[@key='type'] | *[@key='person-id']/*[@key='type'] | *[@key='person-ids']/*/*[@key='type'] | *[@key='org-id']/*[@key='type'] | *[@key='organization-ids']/*/*[@key='type'] | *[@key='resource']/*[@key='type'] | *[@key='resources']/*/*[@key='type'] | *[@key='meta-group']/*[@key='type'] | *[@key='metadata-groups']/*/*[@key='type'] | *[@key='meta']/*[@key='type'] | *[@key='metadata-fields']/*/*[@key='type']"
                 mode="as-attribute">
      <xsl:attribute name="type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "public" 000 -->
   <xsl:template match="*[@key='public']" mode="json2xml"/>
   <xsl:template match="*[@key='inventory-item']/*[@key='public'] | *[@key='inventory-items']/*/*[@key='public']"
                 mode="as-attribute">
      <xsl:attribute name="public">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "virtual" 000 -->
   <xsl:template match="*[@key='virtual']" mode="json2xml"/>
   <xsl:template match="*[@key='inventory-item']/*[@key='virtual'] | *[@key='inventory-items']/*/*[@key='virtual']"
                 mode="as-attribute">
      <xsl:attribute name="virtual">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "external" 000 -->
   <xsl:template match="*[@key='external']" mode="json2xml"/>
   <xsl:template match="*[@key='role']/*[@key='external'] | *[@key='roles']/*/*[@key='external']"
                 mode="as-attribute">
      <xsl:attribute name="external">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "access" 000 -->
   <xsl:template match="*[@key='access']" mode="json2xml"/>
   <xsl:template match="*[@key='role']/*[@key='access'] | *[@key='roles']/*/*[@key='access']"
                 mode="as-attribute">
      <xsl:attribute name="access">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "sensitivity-level" 000 -->
   <xsl:template match="*[@key='sensitivity-level']" mode="json2xml"/>
   <xsl:template match="*[@key='role']/*[@key='sensitivity-level'] | *[@key='roles']/*/*[@key='sensitivity-level']"
                 mode="as-attribute">
      <xsl:attribute name="sensitivity-level">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "validation" 000 -->
   <xsl:template match="*[@key='validation'] | *[@key='validations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="validation" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "provisioning" 000 -->
   <xsl:template match="*[@key='provisioning'] | *[@key='ssp-provisioning']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="provisioning" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "subcomponent" 000 -->
   <xsl:template match="*[@key='subcomponent'] | *[@key='subcomponents']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="subcomponent" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "organization" 000 -->
   <xsl:template match="*[@key='organization']" priority="2" mode="json2xml">
      <xsl:element name="organization" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "baseline-template" 000 -->
   <xsl:template match="*[@key='baseline-template'] | *[@key='baseline-templates']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="baseline-template" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "scanned" 000 -->
   <xsl:template match="*[@key='scanned'] | *[@key='ssp-scanned']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="scanned" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "metadata" 000 -->
   <xsl:template match="*[@key='metadata']" priority="2" mode="json2xml">
      <xsl:element name="metadata" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('publication-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hlink', 'hashed-links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('resource', 'resources')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('role', 'roles')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('party', 'parties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('extra-meta')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "title" 000 -->
   <xsl:template match="*[@key='title']" priority="2" mode="json2xml">
      <xsl:element name="title" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "author" 000 -->
   <xsl:template match="*[@key='author'] | *[@key='authors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="author" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "publication-date" 000 -->
   <xsl:template match="*[@key='publication-date']" priority="2" mode="json2xml">
      <xsl:element name="publication-date" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "version" 000 -->
   <xsl:template match="*[@key='version']" priority="2" mode="json2xml">
      <xsl:element name="version" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "iso-date" 000 -->
   <xsl:template match="*[@key='iso-date']" mode="json2xml"/>
   <xsl:template match="*[@key='version']/*[@key='iso-date']" mode="as-attribute">
      <xsl:attribute name="iso-date">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "doc-id" 000 -->
   <xsl:template match="*[@key='doc-id'] | *[@key='document-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="doc-id" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <xsl:template match="*[@key='prop'] | *[@key='properties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="prop" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "party" 000 -->
   <xsl:template match="*[@key='party'] | *[@key='parties']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="party" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person', 'persons')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "person" 000 -->
   <xsl:template match="*[@key='person'] | *[@key='persons']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="person" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('person-id', 'person-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "org" 000 -->
   <xsl:template match="*[@key='org']" priority="2" mode="json2xml">
      <xsl:element name="org" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('short-name')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('org-id', 'organization-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('email', 'email-addresses')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('phone', 'telephone-numbers')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('url', 'URLs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "person-id" 000 -->
   <xsl:template match="*[@key='person-id'] | *[@key='person-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="person-id" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-id" 000 -->
   <xsl:template match="*[@key='org-id'] | *[@key='organization-ids']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="org-id" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "hlink" 000 -->
   <xsl:template match="*[@key='hlink'] | *[@key='hashed-links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hlink" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hash', 'hashes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "rel" 000 -->
   <xsl:template match="*[@key='rel']" mode="json2xml"/>
   <xsl:template match="*[@key='link']/*[@key='rel'] | *[@key='links']/*/*[@key='rel'] | *[@key='hlink']/*[@key='rel'] | *[@key='hashed-links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "media-type" 000 -->
   <xsl:template match="*[@key='media-type']" mode="json2xml"/>
   <xsl:template match="*[@key='hlink']/*[@key='media-type'] | *[@key='hashed-links']/*/*[@key='media-type'] | *[@key='resource']/*[@key='media-type'] | *[@key='resources']/*/*[@key='media-type']"
                 mode="as-attribute">
      <xsl:attribute name="media-type">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling field "person-name" 000 -->
   <xsl:template match="*[@key='person-name']" priority="2" mode="json2xml">
      <xsl:element name="person-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "org-name" 000 -->
   <xsl:template match="*[@key='org-name']" priority="2" mode="json2xml">
      <xsl:element name="org-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "short-name" 000 -->
   <xsl:template match="*[@key='short-name']" priority="2" mode="json2xml">
      <xsl:element name="short-name" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "address" 000 -->
   <xsl:template match="*[@key='address']" priority="2" mode="json2xml">
      <xsl:element name="address" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('addr-line', 'postal-address')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('city')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('state')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('postal-code')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('country')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "addr-line" 000 -->
   <xsl:template match="*[@key='addr-line'] | *[@key='postal-address']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="addr-line" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "city" 000 -->
   <xsl:template match="*[@key='city']" priority="2" mode="json2xml">
      <xsl:element name="city" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "state" 000 -->
   <xsl:template match="*[@key='state']" priority="2" mode="json2xml">
      <xsl:element name="state" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "postal-code" 000 -->
   <xsl:template match="*[@key='postal-code']" priority="2" mode="json2xml">
      <xsl:element name="postal-code" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "country" 000 -->
   <xsl:template match="*[@key='country']" priority="2" mode="json2xml">
      <xsl:element name="country" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "email" 000 -->
   <xsl:template match="*[@key='email'] | *[@key='email-addresses']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="email" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "phone" 000 -->
   <xsl:template match="*[@key='phone'] | *[@key='telephone-numbers']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="phone" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "url" 000 -->
   <xsl:template match="*[@key='url'] | *[@key='URLs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="url" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "notes" 000 -->
   <xsl:template match="*[@key='notes']" priority="2" mode="json2xml">
      <xsl:element name="notes" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <xsl:template match="*[@key='desc']" priority="2" mode="json2xml">
      <xsl:element name="desc" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "resource" 000 -->
   <xsl:template match="*[@key='resource'] | *[@key='resources']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="resource" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('author', 'authors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('publication-date')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('version')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('doc-id', 'document-ids')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'properties')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('hlink', 'hashed-links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "hash" 000 -->
   <xsl:template match="*[@key='hash'] | *[@key='hashes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="hash" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "algorithm" 000 -->
   <xsl:template match="*[@key='algorithm']" mode="json2xml"/>
   <xsl:template match="*[@key='hash']/*[@key='algorithm'] | *[@key='hashes']/*/*[@key='algorithm']"
                 mode="as-attribute">
      <xsl:attribute name="algorithm">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "href" 000 -->
   <xsl:template match="*[@key='href']" mode="json2xml"/>
   <xsl:template match="*[@key='part']/*[@key='href'] | *[@key='ssp-part']/*/*[@key='href'] | *[@key='control']/*[@key='href'] | *[@key='controls']/*/*[@key='href'] | *[@key='citation']/*[@key='href'] | *[@key='citations']/*/*[@key='href'] | *[@key='link']/*[@key='href'] | *[@key='links']/*/*[@key='href'] | *[@key='hlink']/*[@key='href'] | *[@key='hashed-links']/*/*[@key='href'] | *[@key='import']/*[@key='href'] | *[@key='imports']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "extra-meta" 000 -->
   <xsl:template match="*[@key='extra-meta']" priority="2" mode="json2xml">
      <xsl:element name="extra-meta" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta-group', 'metadata-groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta', 'metadata-fields')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "meta-group" 000 -->
   <xsl:template match="*[@key='meta-group'] | *[@key='metadata-groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="meta-group" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta', 'metadata-fields')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('meta-group', 'metadata-groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('notes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "meta" 000 -->
   <xsl:template match="*[@key='meta'] | *[@key='metadata-fields']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="meta" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "term" 000 -->
   <xsl:template match="*[@key='term']" mode="json2xml"/>
   <xsl:template match="*[@key='meta-group']/*[@key='term'] | *[@key='metadata-groups']/*/*[@key='term'] | *[@key='meta']/*[@key='term'] | *[@key='metadata-fields']/*/*[@key='term']"
                 mode="as-attribute">
      <xsl:attribute name="term">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "import" 000 -->
   <xsl:template match="*[@key='import'] | *[@key='imports']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="import" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('include', 'includes')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "include" 000 -->
   <xsl:template match="*[@key='include'] | *[@key='includes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="include" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'calls')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "all" 000 -->
   <xsl:template match="*[@key='all']" priority="2" mode="json2xml">
      <xsl:element name="all" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "call" 000 -->
   <xsl:template match="*[@key='call'] | *[@key='calls']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="call" namespace="urn:OSCAL-SSP-metaschema">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='STRVALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "with-subcontrols" 000 -->
   <xsl:template match="*[@key='with-subcontrols']" mode="json2xml"/>
   <xsl:template match="*[@key='all']/*[@key='with-subcontrols']" mode="as-attribute">
      <xsl:attribute name="with-subcontrols">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- Markdown converter-->
   <xsl:output indent="yes"/>
   <xsl:template name="parse"><!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        --><!-- $str may be passed in, or we can process the current node -->
      <xsl:param name="str" select="string(.)"/>
      <xsl:variable name="starts-with-code" select="matches($str,'^```')"/>
      <!-- Blocks is split between code blocks and everything else -->
      <xsl:variable name="blocks">
         <xsl:for-each-group select="tokenize($str, '\n')"
                             group-starting-with=".[matches(., '^```')]">
            <xsl:variable name="this-is-code"
                          select="not((position() mod 2) + number($starts-with-code))"/>
            <m:p><!-- Adding an attribute flag when this is a code block, code='code' -->
               <xsl:if test="$this-is-code">
                  <xsl:variable name="language"
                                expand-text="true"
                                select="(replace(.,'^```','') ! normalize-space(.))[matches(.,'\S')]"/>
                  <xsl:attribute name="code" select="if ($language) then $language else 'code'"/>
               </xsl:if>
               <xsl:value-of select="string-join(current-group()[not(matches(., '^```'))],'&#xA;')"/>
            </m:p>
         </xsl:for-each-group>
      </xsl:variable>
      <xsl:variable name="rough-blocks">
         <xsl:apply-templates select="$blocks" mode="parse-block"/>
      </xsl:variable>
      <xsl:variable name="flat-structures">
         <xsl:apply-templates select="$rough-blocks" mode="mark-structures"/>
      </xsl:variable>
      <!--<xsl:copy-of select="$flat-structures"/>-->
      <xsl:variable name="nested-structures">
         <xsl:apply-templates select="$flat-structures" mode="build-structures"/>
      </xsl:variable>
      <xsl:variable name="fully-marked">
         <xsl:apply-templates select="$nested-structures" mode="infer-inlines"/>
      </xsl:variable>
      <xsl:apply-templates select="$fully-marked" mode="cast-ns"/>
   </xsl:template>
   <xsl:template match="*" mode="copy mark-structures build-structures infer-inlines">
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="parse-block"
                 priority="1"
                 match="m:p[exists(@code)]"
                 expand-text="true">
      <xsl:element name="m:pre" namespace="{ $target-ns }">
         <xsl:element name="code" namespace="{ $target-ns }">
            <xsl:for-each select="@code[not(.='code')]">
               <xsl:attribute name="class">language-{.}</xsl:attribute>
            </xsl:for-each>
            <xsl:value-of select="string(.)"/>
         </xsl:element>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="parse-block" match="m:p" expand-text="true">
      <xsl:for-each select="tokenize(string(.),'\n\s*\n')[normalize-space(.)]">
         <m:p>
            <xsl:value-of select="replace(.,'^\s*\n','')"/>
         </m:p>
      </xsl:for-each>
   </xsl:template>
   <xsl:function name="m:is-table-row-demarcator" as="xs:boolean">
      <xsl:param name="line" as="xs:string"/>
      <xsl:sequence select="matches($line,'^[\|\-:\s]+$')"/>
   </xsl:function>
   <xsl:function name="m:is-table" as="xs:boolean">
      <xsl:param name="line" as="element(m:p)"/>
      <xsl:variable name="lines" select="tokenize($line,'\s*\n')[matches(.,'\S')]"/>
      <xsl:sequence select="(every $l in $lines satisfies matches($l,'^\|'))             and (some $l in $lines satisfies m:is-table-row-demarcator($l))"/>
   </xsl:function>
   <xsl:template mode="mark-structures" priority="5" match="m:p[m:is-table(.)]">
      <xsl:variable name="rows">
         <xsl:for-each select="tokenize(string(.),'\s*\n')">
            <m:tr>
               <xsl:value-of select="."/>
            </m:tr>
         </xsl:for-each>
      </xsl:variable>
      <m:table>
         <xsl:apply-templates select="$rows/m:tr" mode="make-row"/>
      </m:table>
   </xsl:template>
   <xsl:template match="m:tr[m:is-table-row-demarcator(string(.))]"
                 priority="5"
                 mode="make-row"/>
   <xsl:template match="m:tr" mode="make-row">
      <m:tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <m:td>
               <xsl:value-of select="."/>
            </m:td>
         </xsl:for-each>
      </m:tr>
   </xsl:template>
   <xsl:template match="m:tr[some $f in (following-sibling::tr) satisfies m:is-table-row-demarcator(string($f))]"
                 mode="make-row">
      <m:tr>
         <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
            <m:th>
               <xsl:value-of select="."/>
            </m:th>
         </xsl:for-each>
      </m:tr>
   </xsl:template>
   <xsl:template mode="mark-structures" match="m:p[matches(.,'^#')]"><!-- 's' flag is dot-matches-all, so \n does not impede -->
      <m:p header-level="{ replace(.,'[^#].*$','','s') ! string-length(.) }">
         <xsl:value-of select="replace(.,'^#+\s*','') ! replace(.,'\s+$','')"/>
      </m:p>
   </xsl:template>
   <xsl:variable name="li-regex" as="xs:string">^\s*(\*|\d+\.)\s</xsl:variable>
   <xsl:template mode="mark-structures" match="m:p[matches(.,$li-regex)]">
      <m:list>
         <xsl:for-each-group group-starting-with=".[matches(.,$li-regex)]"
                             select="tokenize(., '\n')">
            <m:li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}"
                  type="{ if (matches(.,'\s*\d')) then 'ol' else 'ul' }">
               <xsl:for-each select="current-group()[normalize-space(.)]">
                  <xsl:if test="not(position() eq 1)">
                     <m:br/>
                  </xsl:if>
                  <xsl:value-of select="replace(., $li-regex, '')"/>
               </xsl:for-each>
            </m:li>
         </xsl:for-each-group>
      </m:list>
   </xsl:template>
   <xsl:template mode="build-structures" match="m:p[@header-level]">
      <xsl:variable name="level" select="(@header-level[6 &gt;= .],6)[1]"/>
      <xsl:element name="m:h{$level}"
                   namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
         <xsl:value-of select="."/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="build-structures" match="m:list" name="nest-lists"><!-- Starting at level 0 and grouping  --><!--        -->
      <xsl:param name="level" select="0"/>
      <xsl:param name="group" select="m:li"/>
      <xsl:variable name="this-type" select="$group[1]/@type"/>
      <!-- first, splitting ul from ol groups -->
      <xsl:for-each-group select="$group"
                          group-starting-with="*[@level = $level and not(@type = preceding-sibling::*/@type)]">
         <xsl:element name="m:{ $group[1]/@type }"
                      namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
            <xsl:for-each-group select="current-group()" group-starting-with="li[@level = $level]">
               <xsl:choose>
                  <xsl:when test="@level = $level (: checking first item in group :)">
                     <m:li><!--<xsl:copy-of select="@level"/>-->
                        <xsl:apply-templates mode="copy"/>
                        <xsl:if test="current-group()/@level &gt; $level (: go deeper? :)">
                           <xsl:call-template name="nest-lists">
                              <xsl:with-param name="level" select="$level + 1"/>
                              <xsl:with-param name="group" select="current-group()[@level &gt; $level]"/>
                           </xsl:call-template>
                        </xsl:if>
                     </m:li>
                  </xsl:when>
                  <xsl:otherwise><!-- fallback for skipping levels -->
                     <m:li><!-- level="{$level}"-->
                        <xsl:call-template name="nest-lists">
                           <xsl:with-param name="level" select="$level + 1"/>
                           <xsl:with-param name="group" select="current-group()"/>
                        </xsl:call-template>
                     </m:li>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each-group>
         </xsl:element>
      </xsl:for-each-group>
   </xsl:template>
   <xsl:template match="m:pre//text()" mode="infer-inlines">
      <xsl:copy-of select="."/>
   </xsl:template>
   <xsl:template match="text()" mode="infer-inlines">
      <xsl:variable name="markup" expand-text="true">
         <xsl:apply-templates select="$tag-replacements/m:rules">
            <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
         </xsl:apply-templates>
      </xsl:variable>
      <xsl:try select="parse-xml-fragment($markup)">
         <xsl:catch expand-text="yes" select="."/>
      </xsl:try>
   </xsl:template>
   <xsl:template mode="cast-ns" match="*">
      <xsl:element name="{local-name()}" namespace="{ $target-ns }">
         <xsl:copy-of select="@*[matches(.,'\S')]"/>
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="m:rules" as="xs:string"><!-- Original is only provided for processing text nodes -->
      <xsl:param name="original" as="text()?" tunnel="yes"/>
      <xsl:param name="starting" as="xs:string" select="string($original)"/>
      <xsl:iterate select="*">
         <xsl:param name="original" select="$original" as="text()?"/>
         <xsl:param name="str" select="$starting" as="xs:string"/>
         <xsl:on-completion select="$str"/>
         <xsl:next-iteration>
            <xsl:with-param name="str">
               <xsl:apply-templates select=".">
                  <xsl:with-param name="str" select="$str"/>
               </xsl:apply-templates>
            </xsl:with-param>
         </xsl:next-iteration>
      </xsl:iterate>
   </xsl:template>
   <xsl:template match="m:replace" expand-text="true">
      <xsl:param name="str" as="xs:string"/>
      <!--<xsl:value-of>replace({$str},{@match},{string(.)})</xsl:value-of>-->
      <xsl:sequence select="replace($str, @match, string(.))"/>
      <!--<xsl:copy-of select="."/>-->
   </xsl:template>
   <xsl:variable xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                 name="tag-replacements">
      <rules><!-- first, literal replacements -->
         <replace match="&amp;">&amp;amp;</replace>
         <replace match="&lt;">&amp;lt;</replace>
         <!-- next, explicit escape sequences -->
         <replace match="\\&#34;">&amp;quot;</replace>
         <replace match="\\\*">&amp;#2A;</replace>
         <replace match="\\`">&amp;#60;</replace>
         <replace match="\\~">&amp;#7E;</replace>
         <replace match="\\^">&amp;#5E;</replace>
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
   <xsl:variable xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
                 name="tag-specification"
                 as="element(m:tag-spec)">
      <tag-spec><!-- The XML notation represents the substitution by showing both delimiters and tags  --><!-- Note that text contents are regex notation for matching so * must be \* -->
         <q>"<text/>"</q>
         <img alt="!\[{{$text}}\]" src="\({{$text}}\)"/>
         <a href="\[{{$text}}\]">\(<text/>\)</a>
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
   <xsl:template match="*" mode="write-replace"><!-- we can write an open/close pair even for an empty element b/c
             it will be parsed and serialized -->
      <xsl:text>&lt;</xsl:text>
      <xsl:value-of select="local-name()"/>
      <!-- coercing the order to ensure correct formation of regegex       -->
      <xsl:apply-templates mode="#current" select="@href, @alt, @src"/>
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
   <xsl:template match="m:text" mode="write-replace">
      <xsl:text>$1</xsl:text>
   </xsl:template>
   <xsl:template match="m:a/@href" mode="write-replace">
      <xsl:text> href="$2"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@alt" mode="write-replace">
      <xsl:text> alt="$1"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:img/@src" mode="write-replace">
      <xsl:text> src="$2"</xsl:text>
      <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
   </xsl:template>
   <xsl:template match="m:text" mode="write-match">
      <xsl:text>(.*?)</xsl:text>
   </xsl:template>
</xsl:stylesheet>
