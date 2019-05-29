<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                xpath-default-namespace="urn:OSCAL-SSP-metaschema"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="text" use-character-maps="delimiters"/>
   <!-- METASCHEMA conversion stylesheet supports XML->JSON conversion -->
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:character-map name="delimiters">
      <xsl:output-character character="&lt;" string="\u003c"/>
      <xsl:output-character character="&gt;" string="\u003e"/>
   </xsl:character-map>
   <xsl:param name="json-indent" as="xs:string">no</xsl:param>
   <xsl:mode name="rectify" on-no-match="shallow-copy"/>
   <xsl:template mode="rectify"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                 match="/*/@key | array/*/@key"/>
   <xsl:variable name="write-options" as="map(*)" expand-text="true">
      <xsl:map>
         <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
      </xsl:map>
   </xsl:variable>
   <xsl:template match="/" mode="debug">
      <map>
         <xsl:apply-templates mode="xml2json"/>
      </map>
   </xsl:template>
   <xsl:template match="/">
      <xsl:variable name="xpath-json">
         <map>
            <xsl:apply-templates mode="xml2json"/>
         </map>
      </xsl:variable>
      <xsl:variable name="rectified">
         <xsl:apply-templates select="$xpath-json" mode="rectify"/>
      </xsl:variable>
      <json>
         <xsl:value-of select="xml-to-json($rectified, $write-options)"/>
      </json>
   </xsl:template>
   <xsl:template name="prose">
      <xsl:variable name="blocks"
                    select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"/>
      <xsl:if test="exists($blocks)">
         <array key="prose">
            <xsl:apply-templates mode="md" select="$blocks"/>
         </array>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="as-string" match="@* | *">
      <xsl:param name="key" select="local-name()"/>
      <xsl:if test="matches(.,'\S')">
         <string key="{$key}">
            <xsl:value-of select="."/>
         </string>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="md" match="p | link | part/*">
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template mode="md" match="h1 | h2 | h3 | h4 | h5 | h6">
      <string>
         <xsl:apply-templates select="." mode="mark"/>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template mode="mark" match="h1"># </xsl:template>
   <xsl:template mode="mark" match="h2">## </xsl:template>
   <xsl:template mode="mark" match="h3">### </xsl:template>
   <xsl:template mode="mark" match="h4">#### </xsl:template>
   <xsl:template mode="mark" match="h5">##### </xsl:template>
   <xsl:template mode="mark" match="h6">###### </xsl:template>
   <xsl:template mode="md" match="table">
      <xsl:apply-templates select="*" mode="md"/>
   </xsl:template>
   <xsl:template mode="md" match="tr">
      <string>
         <xsl:apply-templates select="*" mode="md"/>
      </string>
      <xsl:if test="empty(preceding-sibling::tr)">
         <string>
            <xsl:text>|</xsl:text>
            <xsl:for-each select="th | td"> --- |</xsl:for-each>
         </string>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="md" match="th | td">
      <xsl:if test="empty(preceding-sibling::*)">|</xsl:if>
      <xsl:text> </xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text> |</xsl:text>
   </xsl:template>
   <xsl:template mode="md" priority="1" match="pre">
      <string>```</string>
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
      <string>```</string>
   </xsl:template>
   <xsl:template mode="md" priority="1" match="ul | ol">
      <string/>
      <xsl:apply-templates mode="md"/>
      <string/>
   </xsl:template>
   <xsl:template mode="md" match="ul//ul | ol//ol | ol//ul | ul//ol">
      <xsl:apply-templates mode="md"/>
   </xsl:template>
   <xsl:template mode="md" match="li">
      <string>
         <xsl:for-each select="../ancestor::ul">
            <xsl:text/>
         </xsl:for-each>
         <xsl:text>* </xsl:text>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template mode="md" match="ol/li">
      <string/>
      <string>
         <xsl:for-each select="../ancestor::ul">
            <xsl:text/>
         </xsl:for-each>
         <xsl:text>1. </xsl:text>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template mode="md" match="code | span[contains(@class,'code')]">
      <xsl:text>`</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>`</xsl:text>
   </xsl:template>
   <xsl:template mode="md" match="em | i">
      <xsl:text>*</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>*</xsl:text>
   </xsl:template>
   <xsl:template mode="md" match="strong | b">
      <xsl:text>**</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>**</xsl:text>
   </xsl:template>
   <xsl:template mode="md" match="q">
      <xsl:text>"</xsl:text>
      <xsl:apply-templates mode="md"/>
      <xsl:text>"</xsl:text>
   </xsl:template>
   <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/>
   <xsl:template mode="md" match="a">
      <xsl:text>[</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>]</xsl:text>
      <xsl:text>(</xsl:text>
      <xsl:value-of select="@href"/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template match="text()" mode="md">
      <xsl:value-of select="replace(.,'\s+',' ') ! replace(.,'([`~\^\*])','\\$1')"/>
   </xsl:template>
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:template match="system-security-plan" mode="xml2json">
      <map key="system-security-plan">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="metadata" mode="#current"/>
         <xsl:if test="exists(import)">
            <array key="imports">
               <xsl:apply-templates select="import" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="system-characteristics" mode="#current"/>
         <xsl:apply-templates select="system-implementation" mode="#current"/>
         <xsl:apply-templates select="control-implementation" mode="#current"/>
         <xsl:apply-templates select="references" mode="#current"/>
         <xsl:apply-templates select="attachment" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="system-characteristics" mode="xml2json">
      <map key="system-characteristics">
         <xsl:apply-templates select="system-id" mode="#current"/>
         <xsl:apply-templates select="system-name" mode="#current"/>
         <xsl:apply-templates select="system-name-short" mode="#current"/>
         <xsl:apply-templates select="description" mode="#current"/>
         <xsl:apply-templates select="security-sensitivity-level" mode="#current"/>
         <xsl:apply-templates select="system-information" mode="#current"/>
         <xsl:apply-templates select="security-impact-level" mode="#current"/>
         <xsl:apply-templates select="security-eauth" mode="#current"/>
         <xsl:apply-templates select="status" mode="#current"/>
         <xsl:apply-templates select="status-other-description" mode="#current"/>
         <xsl:apply-templates select="deployment-model" mode="#current"/>
         <xsl:apply-templates select="deployment-model-other-description" mode="#current"/>
         <xsl:if test="exists(service-model)">
            <array key="service-models">
               <xsl:apply-templates select="service-model" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(service-model-other-description)">
            <array key="service-model-descriptions">
               <xsl:apply-templates select="service-model-other-description" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="leveraged-authorizations" mode="#current"/>
         <xsl:apply-templates select="authorization-boundary" mode="#current"/>
         <xsl:apply-templates select="network-architecture" mode="#current"/>
         <xsl:apply-templates select="data-flow" mode="#current"/>
         <xsl:apply-templates select="users" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="system-id" mode="xml2json">
      <map key="system-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="system-name" mode="xml2json">
      <string key="system-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="system-name-short" mode="xml2json">
      <string key="system-name-short">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="description" mode="xml2json">
      <map key="description">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="security-sensitivity-level" mode="xml2json">
      <string key="security-sensitivity-level">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="system-information" mode="xml2json">
      <map key="system-information">
         <xsl:if test="exists(information-type)">
            <array key="ssp-information-type">
               <xsl:apply-templates select="information-type" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(designations)">
            <array key="ssp-designations">
               <xsl:apply-templates select="designations" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="designations" mode="xml2json">
      <map key="designations">
         <xsl:if test="exists(designation)">
            <array key="ssp-designation">
               <xsl:apply-templates select="designation" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="designation" mode="xml2json">
      <map key="designation">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="declaration" mode="#current"/>
         <xsl:if test="exists(qualifiers)">
            <array key="ssp-qualifiers">
               <xsl:apply-templates select="qualifiers" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="declaration" mode="xml2json">
      <string key="declaration">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="qualifiers" mode="xml2json">
      <map key="qualifiers">
         <xsl:if test="exists(qualifier)">
            <array key="ssp-qualifiers">
               <xsl:apply-templates select="qualifier" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="qualifier" mode="xml2json">
      <map key="qualifier">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="qual-question" mode="#current"/>
         <xsl:apply-templates select="qual-response" mode="#current"/>
         <xsl:apply-templates select="qual-notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="qual-question" mode="xml2json">
      <string key="qual-question">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="qual-response" mode="xml2json">
      <string key="qual-response">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="qual-notes" mode="xml2json">
      <string key="qual-notes">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="information-type" mode="xml2json">
      <map key="information-type">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@nist-id"/>
         <xsl:apply-templates select="description" mode="#current"/>
         <xsl:apply-templates select="confidentiality-impact" mode="#current"/>
         <xsl:apply-templates select="integrity-impact" mode="#current"/>
         <xsl:apply-templates select="availability-impact" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="confidentiality-impact" mode="xml2json">
      <map key="confidentiality-impact">
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:apply-templates select="adjustment-justification" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="integrity-impact" mode="xml2json">
      <map key="integrity-impact">
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:apply-templates select="adjustment-justification" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="availability-impact" mode="xml2json">
      <map key="availability-impact">
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:apply-templates select="adjustment-justification" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="base" mode="xml2json">
      <string key="base">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="selected" mode="xml2json">
      <string key="selected">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="adjustment-justification" mode="xml2json">
      <string key="adjustment-justification">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-impact-level" mode="xml2json">
      <map key="security-impact-level">
         <xsl:apply-templates select="security-objective-confidentiality" mode="#current"/>
         <xsl:apply-templates select="security-objective-integrity" mode="#current"/>
         <xsl:apply-templates select="security-objective-availability" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="security-objective-confidentiality" mode="xml2json">
      <string key="security-objective-confidentiality">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-objective-integrity" mode="xml2json">
      <string key="security-objective-integrity">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-objective-availability" mode="xml2json">
      <string key="security-objective-availability">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-eauth" mode="xml2json">
      <map key="security-eauth">
         <xsl:apply-templates select="security-auth-ial" mode="#current"/>
         <xsl:apply-templates select="security-auth-aal" mode="#current"/>
         <xsl:apply-templates select="security-auth-fal" mode="#current"/>
         <xsl:apply-templates select="security-eauth-level" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="security-auth-ial" mode="xml2json">
      <string key="security-auth-ial">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-auth-aal" mode="xml2json">
      <string key="security-auth-aal">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-auth-fal" mode="xml2json">
      <string key="security-auth-fal">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="security-eauth-level" mode="xml2json">
      <string key="security-eauth-level">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="status" mode="xml2json">
      <string key="status">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="status-other-description" mode="xml2json">
      <string key="status-other-description">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="deployment-model" mode="xml2json">
      <string key="deployment-model">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="deployment-model-other-description" mode="xml2json">
      <string key="deployment-model-other-description">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="service-model" mode="xml2json">
      <string key="service-model">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="service-model-other-description" mode="xml2json">
      <string key="service-model-other-description">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="leveraged-authorizations" mode="xml2json">
      <map key="leveraged-authorizations">
         <xsl:if test="exists(leveraged-authorization)">
            <array key="ssp-leveraged-authorization">
               <xsl:apply-templates select="leveraged-authorization" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="leveraged-authorization" mode="xml2json">
      <map key="leveraged-authorization">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="leveraged-authorization-name" mode="#current"/>
         <xsl:apply-templates select="leveraged-authorization-service-provider" mode="#current"/>
         <xsl:apply-templates select="leveraged-authorization-date-granted" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="leveraged-authorization-name" mode="xml2json">
      <string key="leveraged-authorization-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="leveraged-authorization-service-provider" mode="xml2json">
      <string key="leveraged-authorization-service-provider">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="leveraged-authorization-date-granted" mode="xml2json">
      <string key="leveraged-authorization-date-granted">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="authorization-boundary" mode="xml2json">
      <map key="authorization-boundary">
         <xsl:if test="exists(boundary-diagram)">
            <array key="ssp-boundary-diagram">
               <xsl:apply-templates select="boundary-diagram" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="boundary-diagram" mode="xml2json">
      <map key="boundary-diagram">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@attachment-id"/>
         <xsl:apply-templates select="boundary-description" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="boundary-description" mode="xml2json">
      <map key="boundary-description">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="network-architecture" mode="xml2json">
      <map key="network-architecture">
         <xsl:if test="exists(network-diagram)">
            <array key="ssp-network-boundary">
               <xsl:apply-templates select="network-diagram" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="network-diagram" mode="xml2json">
      <map key="network-diagram">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@attachment-id"/>
         <xsl:apply-templates select="network-description" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="network-description" mode="xml2json">
      <map key="network-description">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="data-flow" mode="xml2json">
      <map key="data-flow">
         <xsl:if test="exists(data-flow-diagram)">
            <array key="ssp-data-flow-diagram">
               <xsl:apply-templates select="data-flow-diagram" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="data-flow-diagram" mode="xml2json">
      <map key="data-flow-diagram">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@attachment-id"/>
         <xsl:apply-templates select="data-flow-description" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="data-flow-description" mode="xml2json">
      <map key="data-flow-description">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="users" mode="xml2json">
      <map key="users">
         <xsl:if test="exists(role)">
            <array key="roles">
               <xsl:apply-templates select="role" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="statistics" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="role" mode="xml2json">
      <map key="role">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@external"/>
         <xsl:apply-templates mode="as-string" select="@access"/>
         <xsl:apply-templates mode="as-string" select="@sensitivity-level"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:apply-templates select="desc" mode="#current"/>
         <xsl:if test="exists(privilege)">
            <array key="privileges">
               <xsl:apply-templates select="privilege" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(responsibility)">
            <array key="responsibilities">
               <xsl:apply-templates select="responsibility" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="privilege" mode="xml2json">
      <string key="privilege">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="responsibility" mode="xml2json">
      <string key="responsibility">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="statistics" mode="xml2json">
      <map key="statistics">
         <xsl:apply-templates select="internal-user-total-current" mode="#current"/>
         <xsl:apply-templates select="internal-user-total-future" mode="#current"/>
         <xsl:apply-templates select="external-user-total-current" mode="#current"/>
         <xsl:apply-templates select="external-user-total-future" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="internal-user-total-current" mode="xml2json">
      <string key="internal-user-total-current">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="internal-user-total-future" mode="xml2json">
      <string key="internal-user-total-future">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="external-user-total-current" mode="xml2json">
      <string key="external-user-total-current">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="external-user-total-future" mode="xml2json">
      <string key="external-user-total-future">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="system-implementation" mode="xml2json">
      <map key="system-implementation">
         <xsl:apply-templates mode="as-string" select="@interconnected"/>
         <xsl:apply-templates select="ports-protocols-services" mode="#current"/>
         <xsl:if test="exists(interconnection)">
            <array key="ssp-interconnection">
               <xsl:apply-templates select="interconnection" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(component)">
            <array key="components">
               <xsl:apply-templates select="component" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="system-inventory" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="ports-protocols-services" mode="xml2json">
      <map key="ports-protocols-services">
         <xsl:if test="exists(service)">
            <array key="ssp-service">
               <xsl:apply-templates select="service" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="service" mode="xml2json">
      <map key="service">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:if test="exists(protocol)">
            <array key="ssp-protocol">
               <xsl:apply-templates select="protocol" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="purpose" mode="#current"/>
         <xsl:if test="exists(used-by)">
            <array key="component-users">
               <xsl:apply-templates select="used-by" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="protocol" mode="xml2json">
      <map key="protocol">
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:if test="exists(port-range)">
            <array key="port-ranges">
               <xsl:apply-templates select="port-range" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="port-range" mode="xml2json">
      <map key="port-range">
         <xsl:apply-templates mode="as-string" select="@start"/>
         <xsl:apply-templates mode="as-string" select="@end"/>
         <xsl:apply-templates mode="as-string" select="@transport"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="purpose" mode="xml2json">
      <string key="purpose">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="used-by" mode="xml2json">
      <string key="used-by">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="interconnection" mode="xml2json">
      <map key="interconnection">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="external-system-name" mode="#current"/>
         <xsl:apply-templates select="external-system-org" mode="#current"/>
         <xsl:if test="exists(isa-authorization)">
            <array key="isa-authorizations">
               <xsl:apply-templates select="isa-authorization" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="isa-name" mode="#current"/>
         <xsl:apply-templates select="isa-date" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="external-system-name" mode="xml2json">
      <string key="external-system-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="external-system-org" mode="xml2json">
      <string key="external-system-org">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="isa-authorization" mode="xml2json">
      <string key="isa-authorization">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="isa-name" mode="xml2json">
      <string key="isa-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="isa-date" mode="xml2json">
      <string key="isa-date">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="component" mode="xml2json">
      <map key="component">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(origin)">
            <array key="ssp-origin">
               <xsl:apply-templates select="origin" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(characteristics)">
            <array key="ssp-characteristics">
               <xsl:apply-templates select="characteristics" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(satisfaction)">
            <array key="ssp-satisfaction">
               <xsl:apply-templates select="satisfaction" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(validation)">
            <array key="validations">
               <xsl:apply-templates select="validation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(provisioning)">
            <array key="ssp-provisioning">
               <xsl:apply-templates select="provisioning" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(subcomponent)">
            <array key="subcomponents">
               <xsl:apply-templates select="subcomponent" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="origin" mode="xml2json">
      <map key="origin">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="organization" mode="#current"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:apply-templates select="release-date" mode="#current"/>
         <xsl:apply-templates select="model" mode="#current"/>
         <xsl:if test="exists(part)">
            <array key="ssp-part">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="vendor" mode="xml2json">
      <map key="vendor">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="release-date" mode="xml2json">
      <string key="release-date">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="model" mode="xml2json">
      <string key="model">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="part" mode="xml2json">
      <map key="part">
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(email)">
            <array key="email-addresses">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="characteristics" mode="xml2json">
      <map key="characteristics">
         <xsl:apply-templates mode="as-string" select="@context"/>
         <xsl:if test="exists(ip-address)">
            <array key="ip-addresses">
               <xsl:apply-templates select="ip-address" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(service)">
            <array key="ssp-service">
               <xsl:apply-templates select="service" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(part)">
            <array key="ssp-part">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="ip-address" mode="xml2json">
      <map key="ip-address">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="satisfaction" mode="xml2json">
      <map key="satisfaction">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@context"/>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="system-inventory" mode="xml2json">
      <map key="system-inventory">
         <xsl:if test="exists(inventory-item)">
            <array key="inventory-items">
               <xsl:apply-templates select="inventory-item" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="inventory-item" mode="xml2json">
      <map key="inventory-item">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@component-id"/>
         <xsl:apply-templates mode="as-string" select="@virtual"/>
         <xsl:apply-templates mode="as-string" select="@public"/>
         <xsl:if test="exists(ip-address)">
            <array key="ip-addresses">
               <xsl:apply-templates select="ip-address" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(dns-name)">
            <array key="dns-names">
               <xsl:apply-templates select="dns-name" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(host-item)">
            <array key="ssp-host-item">
               <xsl:apply-templates select="host-item" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(software-item)">
            <array key="ssp-software-item">
               <xsl:apply-templates select="software-item" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="comments" mode="#current"/>
         <xsl:apply-templates select="serial-no" mode="#current"/>
         <xsl:if test="exists(network-id)">
            <array key="network-ids">
               <xsl:apply-templates select="network-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(asset-owner)">
            <array key="asset-owners">
               <xsl:apply-templates select="asset-owner" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(asset-administrator)">
            <array key="asset-administrators">
               <xsl:apply-templates select="asset-administrator" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="dns-name" mode="xml2json">
      <string key="dns-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="host-item" mode="xml2json">
      <map key="host-item">
         <xsl:if test="exists(netbios-name)">
            <array key="netbios-names">
               <xsl:apply-templates select="netbios-name" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(mac-address)">
            <array key="mac-addresses">
               <xsl:apply-templates select="mac-address" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(authenticated-scan)">
            <array key="authenticated-scans">
               <xsl:apply-templates select="authenticated-scan" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(baseline-template)">
            <array key="baseline-templates">
               <xsl:apply-templates select="baseline-template" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(os-name)">
            <array key="os-names">
               <xsl:apply-templates select="os-name" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(os-version)">
            <array key="os-versions">
               <xsl:apply-templates select="os-version" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location)">
            <array key="locations">
               <xsl:apply-templates select="location" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(asset-type)">
            <array key="asset-types">
               <xsl:apply-templates select="asset-type" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(vendor)">
            <array key="vendors">
               <xsl:apply-templates select="vendor" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(hardware-model)">
            <array key="hardware-models">
               <xsl:apply-templates select="hardware-model" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(scanned)">
            <array key="ssp-scanned">
               <xsl:apply-templates select="scanned" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="netbios-name" mode="xml2json">
      <string key="netbios-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="mac-address" mode="xml2json">
      <string key="mac-address">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="os-name" mode="xml2json">
      <string key="os-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="os-version" mode="xml2json">
      <string key="os-version">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="location" mode="xml2json">
      <string key="location">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="asset-type" mode="xml2json">
      <string key="asset-type">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="hardware-model" mode="xml2json">
      <string key="hardware-model">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="authenticated-scan" mode="xml2json">
      <string key="authenticated-scan">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="software-item" mode="xml2json">
      <map key="software-item">
         <xsl:if test="exists(vendor)">
            <array key="vendors">
               <xsl:apply-templates select="vendor" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(software-name)">
            <array key="software-names">
               <xsl:apply-templates select="software-name" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(software-version)">
            <array key="software-versions">
               <xsl:apply-templates select="software-version" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(software-patch-level)">
            <array key="software-patch-levels">
               <xsl:apply-templates select="software-patch-level" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(function)">
            <array key="functions">
               <xsl:apply-templates select="function" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="software-name" mode="xml2json">
      <string key="software-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="software-version" mode="xml2json">
      <string key="software-version">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="software-patch-level" mode="xml2json">
      <string key="software-patch-level">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="function" mode="xml2json">
      <string key="function">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="comments" mode="xml2json">
      <string key="comments">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="serial-no" mode="xml2json">
      <string key="serial-no">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="network-id" mode="xml2json">
      <string key="network-id">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="asset-owner" mode="xml2json">
      <map key="asset-owner">
         <xsl:apply-templates mode="as-string" select="@poc-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="asset-administrator" mode="xml2json">
      <map key="asset-administrator">
         <xsl:apply-templates mode="as-string" select="@poc-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="control-implementation" mode="xml2json">
      <map key="control-implementation">
         <xsl:if test="exists(control)">
            <array key="controls">
               <xsl:apply-templates select="control" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="control" mode="xml2json">
      <map key="control">
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:if test="exists(responsible-role)">
            <array key="ssp-responsible-role">
               <xsl:apply-templates select="responsible-role" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(set-param)">
            <array key="parameter-settings">
               <xsl:apply-templates select="set-param" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(control-response)">
            <array key="control-responses">
               <xsl:apply-templates select="control-response" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="responsible-role" mode="xml2json">
      <map key="responsible-role">
         <xsl:apply-templates mode="as-string" select="@role-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="set-param" mode="xml2json">
      <map key="set-param">
         <xsl:apply-templates mode="as-string" select="@param-id"/>
         <xsl:apply-templates mode="as-string" select="@target"/>
         <xsl:apply-templates select="value" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="value" mode="xml2json">
      <string key="value">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="control-response" mode="xml2json">
      <map key="control-response">
         <xsl:apply-templates mode="as-string" select="@stmt-id"/>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="references" mode="xml2json">
      <map key="references">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(ref)">
            <array key="refs">
               <xsl:apply-templates select="ref" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="ref" mode="xml2json">
      <map key="ref">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@ref-type"/>
         <xsl:if test="exists(citation)">
            <array key="citations">
               <xsl:apply-templates select="citation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="citation" mode="xml2json">
      <map key="citation">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:if test="matches(.,'\S')">
            <string key="RICHTEXT">
               <xsl:apply-templates mode="md"/>
            </string>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="link" mode="xml2json">
      <map key="link">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates mode="as-string" select="@rel"/>
         <xsl:if test="matches(.,'\S')">
            <string key="RICHTEXT">
               <xsl:apply-templates mode="md"/>
            </string>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="attachment" mode="xml2json">
      <map key="attachment">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="description" mode="#current"/>
         <xsl:apply-templates select="format" mode="#current"/>
         <xsl:apply-templates select="date" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:apply-templates select="attachment-type" mode="#current"/>
         <xsl:apply-templates select="base64" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="format" mode="xml2json">
      <string key="format">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="date" mode="xml2json">
      <string key="date">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="attachment-type" mode="xml2json">
      <string key="attachment-type">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="base64" mode="xml2json">
      <map key="base64">
         <xsl:apply-templates mode="as-string" select="@filename"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="validation" mode="xml2json">
      <map key="validation">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="provisioning" mode="xml2json">
      <map key="provisioning">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="subcomponent" mode="xml2json">
      <string key="subcomponent">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="organization" mode="xml2json">
      <string key="organization">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="baseline-template" mode="xml2json">
      <string key="baseline-template">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="scanned" mode="xml2json">
      <string key="scanned">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="metadata" mode="xml2json">
      <map key="metadata">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(author)">
            <array key="authors">
               <xsl:apply-templates select="author" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="publication-date" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:if test="exists(doc-id)">
            <array key="document-ids">
               <xsl:apply-templates select="doc-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(hlink)">
            <array key="hashed-links">
               <xsl:apply-templates select="hlink" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(resource)">
            <array key="resources">
               <xsl:apply-templates select="resource" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role)">
            <array key="roles">
               <xsl:apply-templates select="role" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party)">
            <array key="parties">
               <xsl:apply-templates select="party" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
         <xsl:apply-templates select="extra-meta" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="title" mode="xml2json">
      <string key="title">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="author" mode="xml2json">
      <string key="author">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="publication-date" mode="xml2json">
      <string key="publication-date">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="version" mode="xml2json">
      <map key="version">
         <xsl:apply-templates mode="as-string" select="@iso-date"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="doc-id" mode="xml2json">
      <map key="doc-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="prop" mode="xml2json">
      <map key="prop">
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="party" mode="xml2json">
      <map key="party">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@role-id"/>
         <xsl:if test="exists(person)">
            <array key="persons">
               <xsl:apply-templates select="person" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="org" mode="#current"/>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="person" mode="xml2json">
      <map key="person">
         <xsl:apply-templates select="person-name" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:apply-templates select="org-name" mode="#current"/>
         <xsl:if test="exists(person-id)">
            <array key="person-ids">
               <xsl:apply-templates select="person-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(org-id)">
            <array key="organization-ids">
               <xsl:apply-templates select="org-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="address" mode="#current"/>
         <xsl:if test="exists(email)">
            <array key="email-addresses">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(url)">
            <array key="URLs">
               <xsl:apply-templates select="url" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="org" mode="xml2json">
      <map key="org">
         <xsl:apply-templates select="org-name" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:if test="exists(org-id)">
            <array key="organization-ids">
               <xsl:apply-templates select="org-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="address" mode="#current"/>
         <xsl:if test="exists(email)">
            <array key="email-addresses">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(url)">
            <array key="URLs">
               <xsl:apply-templates select="url" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="person-id" mode="xml2json">
      <map key="person-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="org-id" mode="xml2json">
      <map key="org-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="hlink" mode="xml2json">
      <map key="hlink">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates mode="as-string" select="@rel"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(hash)">
            <array key="hashes">
               <xsl:apply-templates select="hash" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="person-name" mode="xml2json">
      <string key="person-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="org-name" mode="xml2json">
      <string key="org-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="short-name" mode="xml2json">
      <string key="short-name">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="address" mode="xml2json">
      <map key="address">
         <xsl:if test="exists(addr-line)">
            <array key="postal-address">
               <xsl:apply-templates select="addr-line" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="city" mode="#current"/>
         <xsl:apply-templates select="state" mode="#current"/>
         <xsl:apply-templates select="postal-code" mode="#current"/>
         <xsl:apply-templates select="country" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="addr-line" mode="xml2json">
      <string key="addr-line">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="city" mode="xml2json">
      <string key="city">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="state" mode="xml2json">
      <string key="state">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="postal-code" mode="xml2json">
      <string key="postal-code">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="country" mode="xml2json">
      <string key="country">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="email" mode="xml2json">
      <string key="email">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="phone" mode="xml2json">
      <string key="phone">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="url" mode="xml2json">
      <string key="url">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="notes" mode="xml2json">
      <map key="notes">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="desc" mode="xml2json">
      <string key="desc">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="resource" mode="xml2json">
      <map key="resource">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(author)">
            <array key="authors">
               <xsl:apply-templates select="author" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="publication-date" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:if test="exists(doc-id)">
            <array key="document-ids">
               <xsl:apply-templates select="doc-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(hlink)">
            <array key="hashed-links">
               <xsl:apply-templates select="hlink" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="hash" mode="xml2json">
      <map key="hash">
         <xsl:apply-templates mode="as-string" select="@algorithm"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="extra-meta" mode="xml2json">
      <map key="extra-meta">
         <xsl:if test="exists(meta-group)">
            <array key="metadata-groups">
               <xsl:apply-templates select="meta-group" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(meta)">
            <array key="metadata-fields">
               <xsl:apply-templates select="meta" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="meta-group" mode="xml2json">
      <map key="meta-group">
         <xsl:apply-templates mode="as-string" select="@term"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:if test="exists(meta)">
            <array key="metadata-fields">
               <xsl:apply-templates select="meta" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(meta-group)">
            <array key="metadata-groups">
               <xsl:apply-templates select="meta-group" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="meta" mode="xml2json">
      <map key="meta">
         <xsl:apply-templates mode="as-string" select="@term"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="import" mode="xml2json">
      <map key="import">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates select="include" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="include" mode="xml2json">
      <map key="include">
         <xsl:apply-templates select="all" mode="#current"/>
         <xsl:if test="exists(call)">
            <array key="calls">
               <xsl:apply-templates select="call" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="all" mode="xml2json">
      <map key="all">
         <xsl:apply-templates mode="as-string" select="@with-subcontrols"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="call" mode="xml2json">
      <map key="call">
         <xsl:apply-templates mode="as-string" select="@component-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
</xsl:stylesheet>
