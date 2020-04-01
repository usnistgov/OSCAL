<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes"
               method="text"
               omit-xml-declaration="yes"
               use-character-maps="delimiters"/>
   <!-- METASCHEMA conversion stylesheet supports XML->JSON conversion -->
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:character-map name="delimiters"/>
   <xsl:param name="json-indent" as="xs:string">no</xsl:param>
   <!-- Pass $diagnostic as 'rough' for first pass, 'rectified' for second pass -->
   <xsl:param name="diagnostic" as="xs:string">no</xsl:param>
   <xsl:template match="text()" mode="md">
      <xsl:value-of select="replace(., '([`~\^\*&#34;])', '\\$1')"/>
   </xsl:template>
   <xsl:variable name="write-options" as="map(*)" expand-text="true">
      <xsl:map>
         <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
      </xsl:map>
   </xsl:variable>
   <xsl:variable name="xpath-json">
      <map>
         <xsl:apply-templates select="/" mode="xml2json"/>
      </map>
   </xsl:variable>
   <xsl:variable name="rectified">
      <xsl:apply-templates select="$xpath-json" mode="rectify"/>
   </xsl:variable>
   <xsl:template match="/">
      <xsl:choose>
         <xsl:when test="$diagnostic = 'rough'">
            <xsl:copy-of select="$xpath-json"/>
         </xsl:when>
         <xsl:when test="$diagnostic = 'rectified'">
            <xsl:copy-of select="$rectified"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xml-to-json($rectified, $write-options)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="node() | @*" mode="rectify">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates mode="#current" select="node() | @*"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="rectify"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                 match="/*/@key | array/*/@key"/>
   <xsl:template mode="rectify" match="@m:*"/>
   <xsl:template mode="rectify"
                 match="array[count(*) eq 1][not(@m:in-json = 'ARRAY')]"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
      <xsl:for-each select="*">
         <xsl:copy>
            <xsl:copy-of select="../@key"/>
            <xsl:apply-templates mode="#current"/>
         </xsl:copy>
      </xsl:for-each>
   </xsl:template>
   <xsl:template name="prose">
      <xsl:param name="key" select="'PROSE'"/>
      <xsl:param name="wrapped" select="false()"/>
      <xsl:variable name="blocks"
                    select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"/>
      <xsl:if test="exists($blocks) or $wrapped">
         <xsl:variable name="string-sequence" as="element()*">
            <xsl:apply-templates mode="md" select="$blocks"/>
         </xsl:variable>
         <string key="{$key}">
            <xsl:value-of select="string-join($string-sequence, '\n')"/>
         </string>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="as-string" match="@* | *">
      <xsl:param name="key" select="local-name()"/>
      <xsl:param name="mandatory" select="false()"/>
      <xsl:if test="$mandatory or matches(., '\S')">
         <string key="{ $key }">
            <xsl:value-of select="."/>
         </string>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="as-boolean" match="@* | *">
      <xsl:param name="key" select="local-name()"/>
      <xsl:param name="mandatory" select="false()"/>
      <xsl:if test="$mandatory or matches(., '\S')">
         <boolean key="{ $key }">
            <xsl:value-of select="."/>
         </boolean>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="as-integer" match="@* | *">
      <xsl:param name="key" select="local-name()"/>
      <xsl:param name="mandatory" select="false()"/>
      <xsl:if test="$mandatory or matches(., '\S')">
         <integer key="{ $key }">
            <xsl:value-of select="."/>
         </integer>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="as-number" match="@* | *">
      <xsl:param name="key" select="local-name()"/>
      <xsl:param name="mandatory" select="false()"/>
      <xsl:if test="$mandatory or matches(., '\S')">
         <number key="{ $key }">
            <xsl:value-of select="."/>
         </number>
      </xsl:if>
   </xsl:template>
   <xsl:template name="conditional-lf">
      <xsl:variable name="predecessor"
                    select="preceding-sibling::p | preceding-sibling::ul | preceding-sibling::ol | preceding-sibling::table | preceding-sibling::pre"/>
      <xsl:if test="exists($predecessor)">
         <string/>
      </xsl:if>
   </xsl:template>
   <xsl:template mode="md" match="p | link | part/*">
      <xsl:call-template name="conditional-lf"/>
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template mode="md" match="h1 | h2 | h3 | h4 | h5 | h6">
      <xsl:call-template name="conditional-lf"/>
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
      <xsl:call-template name="conditional-lf"/>
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
      <xsl:call-template name="conditional-lf"/>
      <string>```</string>
      <string>
         <xsl:apply-templates mode="md"/>
      </string>
      <string>```</string>
   </xsl:template>
   <xsl:template mode="md" priority="1" match="ul | ol">
      <xsl:call-template name="conditional-lf"/>
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
   <xsl:template mode="md" match="code | span[contains(@class, 'code')]">
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
   <xsl:template mode="md" match="insert">
      <xsl:text>{{ </xsl:text>
      <xsl:value-of select="@param-id"/>
      <xsl:text> }}</xsl:text>
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
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:template match="part" mode="xml2json">
      <map key="part">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@ns"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:call-template name="prose">
            <xsl:with-param name="key">prose</xsl:with-param>
         </xsl:call-template>
         <xsl:if test="exists(part)">
            <array key="parts" m:in-json="ARRAY">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="prose" mode="xml2json">
      <string key="prose">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="status" mode="xml2json">
      <map key="status">
         <xsl:apply-templates mode="as-string" select="@state"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="user" mode="xml2json">
      <map key="{@id}">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role-id)">
            <array key="role-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(authorized-privilege)">
            <array key="authorized-privileges" m:in-json="ARRAY">
               <xsl:apply-templates select="authorized-privilege" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="role-id" mode="xml2json">
      <string key="role-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="authorized-privilege" mode="xml2json">
      <map key="authorized-privilege">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(function-performed)">
            <array key="functions-performed" m:in-json="ARRAY">
               <xsl:apply-templates select="function-performed" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="function-performed" mode="xml2json">
      <string key="function-performed">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="component" mode="xml2json">
      <map key="{@id}">
         <xsl:apply-templates mode="as-string" select="@component-type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="status" mode="#current"/>
         <xsl:for-each-group select="responsible-role" group-by="local-name()">
            <map key="responsible-roles">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="inventory-item" mode="xml2json">
      <map key="inventory-item">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@asset-id"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="implemented-component" group-by="local-name()">
            <map key="implemented-components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="implemented-component" mode="xml2json">
      <map key="{@component-id}">
         <xsl:apply-templates mode="as-string" select="@use"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="responsible-role" mode="xml2json">
      <map key="{@role-id}">
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="metadata" mode="xml2json">
      <map key="metadata">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="published" mode="#current"/>
         <xsl:apply-templates select="last-modified" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:apply-templates select="oscal-version" mode="#current"/>
         <xsl:for-each select="revision-history">
            <xsl:if test="exists(revision)">
               <array key="revision-history" m:in-json="ARRAY">
                  <xsl:apply-templates select="revision" mode="#current"/>
               </array>
            </xsl:if>
         </xsl:for-each>
         <xsl:if test="exists(doc-id)">
            <array key="document-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="doc-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role)">
            <array key="roles" m:in-json="ARRAY">
               <xsl:apply-templates select="role" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location)">
            <array key="locations" m:in-json="ARRAY">
               <xsl:apply-templates select="location" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party)">
            <array key="parties" m:in-json="ARRAY">
               <xsl:apply-templates select="party" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="back-matter" mode="xml2json">
      <map key="back-matter">
         <xsl:if test="exists(resource)">
            <array key="resources" m:in-json="ARRAY">
               <xsl:apply-templates select="resource" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="revision" mode="xml2json">
      <map key="revision">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="published" mode="#current"/>
         <xsl:apply-templates select="last-modified" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:apply-templates select="oscal-version" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="link" mode="xml2json">
      <xsl:variable name="text-key">text</xsl:variable>
      <map key="link">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates mode="as-string" select="@rel"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="published" mode="xml2json">
      <string key="published">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="last-modified" mode="xml2json">
      <string key="last-modified">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="version" mode="xml2json">
      <string key="version">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="oscal-version" mode="xml2json">
      <string key="oscal-version">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="doc-id" mode="xml2json">
      <xsl:variable name="text-key">identifier</xsl:variable>
      <map key="doc-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="prop" mode="xml2json">
      <xsl:variable name="text-key">value</xsl:variable>
      <map key="prop">
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@ns"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="annotation" mode="xml2json">
      <map key="annotation">
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@ns"/>
         <xsl:apply-templates mode="as-string" select="@value"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="location" mode="xml2json">
      <map key="location">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="address" mode="#current"/>
         <xsl:if test="exists(email)">
            <array key="email-addresses" m:in-json="ARRAY">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers" m:in-json="ARRAY">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(url)">
            <array key="URLs" m:in-json="ARRAY">
               <xsl:apply-templates select="url" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="location-id" mode="xml2json">
      <string key="location-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="party" mode="xml2json">
      <map key="party">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(person)">
            <array key="persons" m:in-json="ARRAY">
               <xsl:apply-templates select="person" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="org" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="party-id" mode="xml2json">
      <string key="party-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="person" mode="xml2json">
      <map key="person">
         <xsl:apply-templates select="person-name" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:apply-templates select="org-name" mode="#current"/>
         <xsl:if test="exists(person-id)">
            <array key="person-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="person-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(org-id)">
            <array key="organization-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="org-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(address)">
            <array key="addresses" m:in-json="ARRAY">
               <xsl:apply-templates select="address" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location-id)">
            <array key="location-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="location-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(email)">
            <array key="email-addresses" m:in-json="ARRAY">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers" m:in-json="ARRAY">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(url)">
            <array key="URLs" m:in-json="ARRAY">
               <xsl:apply-templates select="url" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="org" mode="xml2json">
      <map key="org">
         <xsl:apply-templates select="org-name" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:if test="exists(org-id)">
            <array key="organization-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="org-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(address)">
            <array key="addresses" m:in-json="ARRAY">
               <xsl:apply-templates select="address" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location-id)">
            <array key="location-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="location-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(email)">
            <array key="email-addresses" m:in-json="ARRAY">
               <xsl:apply-templates select="email" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(phone)">
            <array key="telephone-numbers" m:in-json="ARRAY">
               <xsl:apply-templates select="phone" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(url)">
            <array key="URLs" m:in-json="ARRAY">
               <xsl:apply-templates select="url" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="person-id" mode="xml2json">
      <xsl:variable name="text-key">id</xsl:variable>
      <map key="person-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="org-id" mode="xml2json">
      <xsl:variable name="text-key">id</xsl:variable>
      <map key="org-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="rlink" mode="xml2json">
      <map key="rlink">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:if test="exists(hash)">
            <array key="hashes" m:in-json="ARRAY">
               <xsl:apply-templates select="hash" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="person-name" mode="xml2json">
      <string key="person-name">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="org-name" mode="xml2json">
      <string key="org-name">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="short-name" mode="xml2json">
      <string key="short-name">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="address" mode="xml2json">
      <map key="address">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:if test="exists(addr-line)">
            <array key="postal-address" m:in-json="ARRAY">
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
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="city" mode="xml2json">
      <string key="city">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="state" mode="xml2json">
      <string key="state">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="postal-code" mode="xml2json">
      <string key="postal-code">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="country" mode="xml2json">
      <string key="country">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="email" mode="xml2json">
      <string key="email">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="phone" mode="xml2json">
      <xsl:variable name="text-key">number</xsl:variable>
      <map key="phone">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="url" mode="xml2json">
      <string key="url">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="desc" mode="xml2json">
      <string key="desc">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="text" mode="xml2json">
      <string key="text">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="biblio" mode="xml2json">
      <map key="biblio"/>
   </xsl:template>
   <xsl:template match="resource" mode="xml2json">
      <map key="resource">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="desc" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(doc-id)">
            <array key="document-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="doc-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="citation" mode="#current"/>
         <xsl:if test="exists(rlink)">
            <array key="rlinks" m:in-json="ARRAY">
               <xsl:apply-templates select="rlink" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(base64)">
            <array key="attachments" m:in-json="ARRAY">
               <xsl:apply-templates select="base64" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="citation" mode="xml2json">
      <map key="citation">
         <xsl:apply-templates select="text" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="biblio" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="hash" mode="xml2json">
      <xsl:variable name="text-key">value</xsl:variable>
      <map key="hash">
         <xsl:apply-templates mode="as-string" select="@algorithm"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="role" mode="xml2json">
      <map key="role">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:apply-templates select="desc" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="responsible-party" mode="xml2json">
      <map key="{@role-id}">
         <xsl:if test="exists(party-id)">
            <array key="party-ids" m:in-json="ARRAY">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(prop)">
            <array key="properties" m:in-json="ARRAY">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations" m:in-json="ARRAY">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links" m:in-json="ARRAY">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="title" mode="xml2json">
      <string key="title">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="base64" mode="xml2json">
      <xsl:variable name="text-key">value</xsl:variable>
      <map key="base64">
         <xsl:apply-templates mode="as-string" select="@filename"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="description" mode="xml2json">
      <string key="description">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="remarks" mode="xml2json">
      <string key="remarks">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="import-ap" mode="xml2json">
      <map key="import-ap">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="objectives" mode="xml2json">
      <map key="objectives">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(controls)">
            <array key="control-group">
               <xsl:apply-templates select="controls" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(control-objectives)">
            <array key="control-objective-group">
               <xsl:apply-templates select="control-objectives" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="objective" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="controls" mode="xml2json">
      <map key="controls">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="all" mode="#current"/>
         <xsl:if test="exists(include-control)">
            <array key="include-controls">
               <xsl:apply-templates select="include-control" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(exclude-control)">
            <array key="exclude-controls">
               <xsl:apply-templates select="exclude-control" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="control-objectives" mode="xml2json">
      <map key="control-objectives">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="all" mode="#current"/>
         <xsl:if test="exists(include-objective)">
            <array key="include-objectives">
               <xsl:apply-templates select="include-objective" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(exclude-objective)">
            <array key="exclude-objectives">
               <xsl:apply-templates select="exclude-objective" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(objective)">
            <array key="objective-definitions">
               <xsl:apply-templates select="objective" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="include-control" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="include-control">
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="exclude-control" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="exclude-control">
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="include-objective" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="include-objective">
         <xsl:apply-templates mode="as-string" select="@objective-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="exclude-objective" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="exclude-objective">
         <xsl:apply-templates mode="as-string" select="@objective-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="objective" mode="xml2json">
      <map key="objective">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="control-link" mode="#current"/>
         <xsl:apply-templates select="part" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="control-link" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="control-link">
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="assessment-subject" mode="xml2json">
      <map key="assessment-subject">
         <xsl:if test="exists(include-subject)">
            <array key="includes">
               <xsl:apply-templates select="include-subject" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(exclude-subject)">
            <array key="excludes">
               <xsl:apply-templates select="exclude-subject" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="local-definitions" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="include-subject" mode="xml2json">
      <map key="include-subject">
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="all" mode="#current"/>
         <xsl:if test="exists(id-ref)">
            <array key="id-refs">
               <xsl:apply-templates select="id-ref" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="exclude-subject" mode="xml2json">
      <map key="exclude-subject">
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="all" mode="#current"/>
         <xsl:if test="exists(id-ref)">
            <array key="id-refs">
               <xsl:apply-templates select="id-ref" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="id-ref" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="id-ref">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="all" mode="xml2json">
      <string key="all">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="local-definitions" mode="xml2json">
      <map key="local-definitions">
         <xsl:for-each-group select="component" group-by="local-name()">
            <map key="components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(inventory-item)">
            <array key="inventory-items">
               <xsl:apply-templates select="inventory-item" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each-group select="user" group-by="local-name()">
            <map key="users">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="assets" mode="xml2json">
      <map key="assets">
         <xsl:apply-templates select="tools" mode="#current"/>
         <xsl:apply-templates select="origination" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="tools" mode="xml2json">
      <map key="tools">
         <xsl:for-each-group select="component" group-by="local-name()">
            <map key="components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
      </map>
   </xsl:template>
   <xsl:template match="origination" mode="xml2json">
      <map key="origination">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="assessment-activities" mode="xml2json">
      <map key="assessment-activities">
         <xsl:if test="exists(test-method)">
            <array key="test-methods">
               <xsl:apply-templates select="test-method" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="schedule" mode="#current"/>
         <xsl:if test="exists(included-activity)">
            <array key="included-activities">
               <xsl:apply-templates select="included-activity" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(excluded-activity)">
            <array key="excluded-activities">
               <xsl:apply-templates select="excluded-activity" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="test-method" mode="xml2json">
      <map key="test-method">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(test-step)">
            <array key="test-steps">
               <xsl:apply-templates select="test-step" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="test-step" mode="xml2json">
      <map key="test-step">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="sequence" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(role-id)">
            <array key="role-ids">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="sequence" mode="xml2json">
      <number key="sequence">
         <xsl:apply-templates mode="#current"/>
      </number>
   </xsl:template>
   <xsl:template match="schedule" mode="xml2json">
      <map key="schedule">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(task)">
            <array key="tasks">
               <xsl:apply-templates select="task" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="task" mode="xml2json">
      <map key="task">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="start" mode="#current"/>
         <xsl:apply-templates select="end" mode="#current"/>
         <xsl:if test="exists(activitiy-id)">
            <array key="activity-ids">
               <xsl:apply-templates select="activitiy-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role-id)">
            <array key="role-ids">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location-id)">
            <array key="location-ids">
               <xsl:apply-templates select="location-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="start" mode="xml2json">
      <string key="start">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="end" mode="xml2json">
      <string key="end">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="activitiy-id" mode="xml2json">
      <string key="activitiy-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="included-activity" mode="xml2json">
      <map key="included-activity">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role-id)">
            <array key="role-ids">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location-id)">
            <array key="location-ids">
               <xsl:apply-templates select="location-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="excluded-activity" mode="xml2json">
      <map key="excluded-activity">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(role-id)">
            <array key="role-ids">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(location-id)">
            <array key="location-ids">
               <xsl:apply-templates select="location-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="evidence-inventory" mode="xml2json">
      <map key="evidence-inventory">
         <xsl:if test="exists(artifact)">
            <array key="artifacts">
               <xsl:apply-templates select="artifact" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="artifact" mode="xml2json">
      <map key="artifact">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="results" mode="xml2json">
      <map key="results">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="start" mode="#current"/>
         <xsl:apply-templates select="end" mode="#current"/>
         <xsl:if test="exists(finding)">
            <array key="findings">
               <xsl:apply-templates select="finding" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="finding" mode="xml2json">
      <map key="finding">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="date-time-stamp" mode="#current"/>
         <xsl:apply-templates select="objective-status" mode="#current"/>
         <xsl:if test="exists(observation)">
            <array key="observations">
               <xsl:apply-templates select="observation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(threat-id)">
            <array key="threat-ids">
               <xsl:apply-templates select="threat-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(risk)">
            <array key="risks">
               <xsl:apply-templates select="risk" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="date-time-stamp" mode="xml2json">
      <string key="date-time-stamp">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="objective-status" mode="xml2json">
      <map key="objective-status">
         <xsl:apply-templates mode="as-string" select="@objective-id"/>
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:apply-templates select="satisfaction" mode="#current"/>
         <xsl:apply-templates select="implementation-status" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="satisfaction" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="satisfaction">
         <xsl:apply-templates mode="as-string" select="@system"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="implementation-status" mode="xml2json">
      <string key="implementation-status">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="observation" mode="xml2json">
      <map key="observation">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(observation-type)">
            <array key="observation-types">
               <xsl:apply-templates select="observation-type" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(reference)">
            <array key="references">
               <xsl:apply-templates select="reference" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(target)">
            <array key="targets">
               <xsl:apply-templates select="target" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(assessor)">
            <array key="assessors">
               <xsl:apply-templates select="assessor" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(relevant-evidence)">
            <array key="evidence-group">
               <xsl:apply-templates select="relevant-evidence" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="relevant-evidence" mode="xml2json">
      <map key="relevant-evidence">
         <xsl:apply-templates mode="as-string" select="@evidence-id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="assessor" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="assessor">
         <xsl:apply-templates mode="as-string" select="@party-id"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="target" mode="xml2json">
      <map key="target">
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(component-id)">
            <array key="components">
               <xsl:apply-templates select="component-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(inventory-item-id)">
            <array key="items">
               <xsl:apply-templates select="inventory-item-id" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="component-id" mode="xml2json">
      <string key="component-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="inventory-item-id" mode="xml2json">
      <string key="inventory-item-id">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="reference" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="reference">
         <xsl:apply-templates mode="as-string" select="@ref-id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="observation-type" mode="xml2json">
      <string key="observation-type">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="threat-id" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="threat-id">
         <xsl:apply-templates mode="as-string" select="@system"/>
         <xsl:apply-templates mode="as-string" select="@uri"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="risk" mode="xml2json">
      <map key="risk">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="risk-statement">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">risk-statement</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(mitigating-factor)">
            <array key="mitigating-factors">
               <xsl:apply-templates select="mitigating-factor" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(remediation)">
            <array key="remediation-group">
               <xsl:apply-templates select="remediation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="risk-status" mode="#current"/>
         <xsl:for-each select="closure-actions">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">closure-actions</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:apply-templates select="remediation-tracking" mode="#current"/>
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="remediation-tracking" mode="xml2json">
      <map key="remediation-tracking">
         <xsl:if test="exists(tracking-entry)">
            <array key="tracking-entries">
               <xsl:apply-templates select="tracking-entry" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="tracking-entry" mode="xml2json">
      <map key="tracking-entry">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates select="date-time-stamp" mode="#current"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="required-resource" mode="xml2json">
      <map key="required-resource">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(id-ref)">
            <array key="id-refs">
               <xsl:apply-templates select="id-ref" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="risk-status" mode="xml2json">
      <string key="risk-status">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="closure-actions" mode="xml2json">
      <string key="closure-actions">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="mitigating-factor" mode="xml2json">
      <map key="mitigating-factor">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@implementation-id"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(id-ref)">
            <array key="id-refs">
               <xsl:apply-templates select="id-ref" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="remediation" mode="xml2json">
      <map key="remediation">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(annotation)">
            <array key="annotations">
               <xsl:apply-templates select="annotation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(id-ref)">
            <array key="id-refs">
               <xsl:apply-templates select="id-ref" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(required-resource)">
            <array key="required-resources">
               <xsl:apply-templates select="required-resource" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="schedule" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
               <xsl:with-param name="wrapped" select="true()"/>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="risk-statement" mode="xml2json">
      <string key="risk-statement">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="assessment-results" mode="xml2json">
      <map key="assessment-results">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="metadata" mode="#current"/>
         <xsl:apply-templates select="import-ap" mode="#current"/>
         <xsl:apply-templates select="objectives" mode="#current"/>
         <xsl:apply-templates select="assessment-subject" mode="#current"/>
         <xsl:apply-templates select="assets" mode="#current"/>
         <xsl:apply-templates select="assessment-activities" mode="#current"/>
         <xsl:apply-templates select="evidence-inventory" mode="#current"/>
         <xsl:apply-templates select="results" mode="#current"/>
         <xsl:apply-templates select="back-matter" mode="#current"/>
      </map>
   </xsl:template>
</xsl:stylesheet>
