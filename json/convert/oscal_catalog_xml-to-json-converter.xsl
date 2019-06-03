<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
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
   <xsl:template match="publication-date" mode="xml2json">
      <string key="publication-date">
         <xsl:apply-templates mode="md"/>
      </string>
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
         <xsl:if test="exists(address)">
            <array key="addresses">
               <xsl:apply-templates select="address" mode="#current"/>
            </array>
         </xsl:if>
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
         <xsl:if test="exists(address)">
            <array key="addresses">
               <xsl:apply-templates select="address" mode="#current"/>
            </array>
         </xsl:if>
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
         <xsl:apply-templates mode="as-string" select="@type"/>
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
      <map key="email">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="phone" mode="xml2json">
      <map key="phone">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="url" mode="xml2json">
      <map key="url">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="role" mode="xml2json">
      <map key="role">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="short-name" mode="#current"/>
         <xsl:apply-templates select="desc" mode="#current"/>
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
   <xsl:template match="resource" mode="xml2json">
      <map key="resource">
         <xsl:apply-templates mode="as-string" select="@rel"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(author)">
            <array key="authors">
               <xsl:apply-templates select="author" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="format" mode="#current"/>
         <xsl:apply-templates select="description" mode="#current"/>
         <xsl:apply-templates select="date" mode="#current"/>
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
         <xsl:apply-templates select="base64" mode="#current"/>
         <xsl:apply-templates select="notes" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="author" mode="xml2json">
      <string key="author">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="doc-id" mode="xml2json">
      <map key="doc-id">
         <xsl:apply-templates mode="as-string" select="@type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="notes" mode="xml2json">
      <map key="notes">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="hlink" mode="xml2json">
      <map key="hlink">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:apply-templates mode="as-string" select="@media-type"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(hash)">
            <array key="hashes">
               <xsl:apply-templates select="hash" mode="#current"/>
            </array>
         </xsl:if>
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
   <xsl:template match="description" mode="xml2json">
      <map key="description">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="version" mode="xml2json">
      <map key="version">
         <xsl:apply-templates mode="as-string" select="@iso-date"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="format" mode="xml2json">
      <string key="format">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="date" mode="xml2json">
      <map key="date">
         <xsl:apply-templates mode="as-string" select="@iso-date"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="base64" mode="xml2json">
      <map key="base64">
         <xsl:apply-templates mode="as-string" select="@filename"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="ref-list" mode="xml2json">
      <map key="ref-list">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:call-template name="prose"/>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(ref)">
            <array key="references">
               <xsl:apply-templates select="ref" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(ref-list)">
            <array key="reference-lists">
               <xsl:apply-templates select="ref-list" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="ref" mode="xml2json">
      <map key="ref">
         <xsl:apply-templates mode="as-string" select="@id"/>
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
   <xsl:template match="catalog" mode="xml2json">
      <map key="catalog">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@model-version"/>
         <xsl:apply-templates select="metadata" mode="#current"/>
         <xsl:if test="exists(section)">
            <array key="sections">
               <xsl:apply-templates select="section" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(group)">
            <array key="groups">
               <xsl:apply-templates select="group" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(control)">
            <array key="controls">
               <xsl:apply-templates select="control" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="back" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="back" mode="xml2json">
      <map key="back">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="ref-list" mode="#current"/>
         <xsl:if test="exists(resource)">
            <array key="resources">
               <xsl:apply-templates select="resource" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="section" mode="xml2json">
      <map key="section">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:call-template name="prose"/>
         <xsl:if test="exists(section)">
            <array key="sections">
               <xsl:apply-templates select="section" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="ref-list" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="group" mode="xml2json">
      <map key="group">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each-group select="param" group-by="local-name()">
            <map key="parameters">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(part)">
            <array key="parts">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(group)">
            <array key="groups">
               <xsl:apply-templates select="group" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(control)">
            <array key="controls">
               <xsl:apply-templates select="control" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="ref-list" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="control" mode="xml2json">
      <map key="control">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each-group select="param" group-by="local-name()">
            <map key="parameters">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(part)">
            <array key="parts">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each-group select="subcontrol" group-by="local-name()">
            <map key="subcontrols">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:apply-templates select="ref-list" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="subcontrol" mode="xml2json">
      <map key="{@id}">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:for-each-group select="param" group-by="local-name()">
            <map key="parameters">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(part)">
            <array key="parts">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="ref-list" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="title" mode="xml2json">
      <string key="title">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="prop" mode="xml2json">
      <map key="prop">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="param" mode="xml2json">
      <map key="{@id}">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates mode="as-string" select="@depends-on"/>
         <xsl:apply-templates select="label" mode="#current"/>
         <xsl:if test="exists(desc)">
            <array key="descriptions">
               <xsl:apply-templates select="desc" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(constraint)">
            <array key="constraints">
               <xsl:apply-templates select="constraint" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(guideline)">
            <array key="guidance">
               <xsl:apply-templates select="guideline" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="value" mode="#current"/>
         <xsl:apply-templates select="select" mode="#current"/>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="label" mode="xml2json">
      <string key="label">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="desc" mode="xml2json">
      <map key="desc">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="matches(.,'\S')">
            <string key="RICHTEXT">
               <xsl:apply-templates mode="md"/>
            </string>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="constraint" mode="xml2json">
      <map key="constraint">
         <xsl:apply-templates mode="as-string" select="@test"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="guideline" mode="xml2json">
      <map key="guideline">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="value" mode="xml2json">
      <string key="value">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="select" mode="xml2json">
      <map key="select">
         <xsl:apply-templates mode="as-string" select="@how-many"/>
         <xsl:if test="exists(choice)">
            <array key="alternatives">
               <xsl:apply-templates select="choice" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="choice" mode="xml2json">
      <string key="choice">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="part" mode="xml2json">
      <map key="part">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@class"/>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:call-template name="prose"/>
         <xsl:if test="exists(part)">
            <array key="parts">
               <xsl:apply-templates select="part" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
</xsl:stylesheet>
