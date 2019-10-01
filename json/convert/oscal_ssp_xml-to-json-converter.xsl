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
      <xsl:variable name="blocks"
                    select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"/>
      <xsl:if test="exists($blocks)">
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
   <xsl:template match="metadata" mode="xml2json">
      <map key="metadata">
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="published" mode="#current"/>
         <xsl:apply-templates select="last-modified" mode="#current"/>
         <xsl:apply-templates select="version" mode="#current"/>
         <xsl:apply-templates select="oscal-version" mode="#current"/>
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
         <xsl:if test="exists(link)">
            <array key="links">
               <xsl:apply-templates select="link" mode="#current"/>
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
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="back-matter" mode="xml2json">
      <map key="back-matter">
         <xsl:if test="exists(citation)">
            <array key="citations">
               <xsl:apply-templates select="citation" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(resource)">
            <array key="resources">
               <xsl:apply-templates select="resource" mode="#current"/>
            </array>
         </xsl:if>
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
      <xsl:variable name="text-key">
         <xsl:value-of select="@name"/>
      </xsl:variable>
      <map key="prop">
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
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="party" mode="xml2json">
      <map key="party">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(person)">
            <array key="persons">
               <xsl:apply-templates select="person" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="org" mode="#current"/>
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
            </xsl:call-template>
         </xsl:for-each>
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
            <array key="hashes">
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
   <xsl:template match="resource" mode="xml2json">
      <map key="resource">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="desc" mode="#current"/>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(rlink)">
            <array key="rlinks">
               <xsl:apply-templates select="rlink" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="base64" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
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
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="responsible-party" mode="xml2json">
      <map key="{@role-id}">
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
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
   <xsl:template match="citation" mode="xml2json">
      <map key="citation">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:if test="exists(target)">
            <array key="targets">
               <xsl:apply-templates select="target" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="title" mode="#current"/>
         <xsl:apply-templates select="desc" mode="#current"/>
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
      </map>
   </xsl:template>
   <xsl:template match="target" mode="xml2json">
      <string key="target">
         <xsl:apply-templates mode="#current"/>
      </string>
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
   <xsl:template match="system-security-plan" mode="xml2json">
      <map key="system-security-plan">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="metadata" mode="#current"/>
         <xsl:apply-templates select="import-profile" mode="#current"/>
         <xsl:apply-templates select="system-characteristics" mode="#current"/>
         <xsl:apply-templates select="system-implementation" mode="#current"/>
         <xsl:apply-templates select="control-implementation" mode="#current"/>
         <xsl:apply-templates select="back-matter" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="import-profile" mode="xml2json">
      <map key="import-profile">
         <xsl:apply-templates mode="as-string" select="@href"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="system-characteristics" mode="xml2json">
      <map key="system-characteristics">
         <xsl:if test="exists(system-id)">
            <array key="system-ids">
               <xsl:apply-templates select="system-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="system-name" mode="#current"/>
         <xsl:apply-templates select="system-name-short" mode="#current"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:apply-templates select="date-authorized" mode="#current"/>
         <xsl:apply-templates select="security-sensitivity-level" mode="#current"/>
         <xsl:apply-templates select="system-information" mode="#current"/>
         <xsl:apply-templates select="security-impact-level" mode="#current"/>
         <xsl:apply-templates select="status" mode="#current"/>
         <xsl:if test="exists(leveraged-authorization)">
            <array key="leveraged-authorizations">
               <xsl:apply-templates select="leveraged-authorization" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="authorization-boundary" mode="#current"/>
         <xsl:apply-templates select="network-architecture" mode="#current"/>
         <xsl:apply-templates select="data-flow" mode="#current"/>
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="system-id" mode="xml2json">
      <xsl:variable name="text-key">id</xsl:variable>
      <map key="system-id">
         <xsl:apply-templates mode="as-string" select="@identifier-type"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="system-name" mode="xml2json">
      <string key="system-name">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="system-name-short" mode="xml2json">
      <string key="system-name-short">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="security-sensitivity-level" mode="xml2json">
      <string key="security-sensitivity-level">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="system-information" mode="xml2json">
      <map key="system-information">
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
         <xsl:if test="exists(information-type)">
            <array key="information-types">
               <xsl:apply-templates select="information-type" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="information-type" mode="xml2json">
      <map key="information-type">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:for-each-group select="information-type-id" group-by="local-name()">
            <map key="information-type-ids">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="confidentiality-impact" mode="#current"/>
         <xsl:apply-templates select="integrity-impact" mode="#current"/>
         <xsl:apply-templates select="availability-impact" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="information-type-id" mode="xml2json">
      <xsl:variable name="text-key">id</xsl:variable>
      <map key="{@system}">
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
            <xsl:with-param name="mandatory" select="true()"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="confidentiality-impact" mode="xml2json">
      <map key="confidentiality-impact">
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:for-each select="adjustment-justification">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">adjustment-justification</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="integrity-impact" mode="xml2json">
      <map key="integrity-impact">
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:for-each select="adjustment-justification">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">adjustment-justification</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="availability-impact" mode="xml2json">
      <map key="availability-impact">
         <xsl:if test="exists(prop)">
            <array key="properties">
               <xsl:apply-templates select="prop" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="base" mode="#current"/>
         <xsl:apply-templates select="selected" mode="#current"/>
         <xsl:for-each select="adjustment-justification">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">adjustment-justification</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="base" mode="xml2json">
      <string key="base">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="selected" mode="xml2json">
      <string key="selected">
         <xsl:apply-templates mode="#current"/>
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
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="security-objective-integrity" mode="xml2json">
      <string key="security-objective-integrity">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="security-objective-availability" mode="xml2json">
      <string key="security-objective-availability">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="status" mode="xml2json">
      <map key="status">
         <xsl:apply-templates mode="as-string" select="@state"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="leveraged-authorization" mode="xml2json">
      <map key="leveraged-authorization">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
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
         <xsl:apply-templates select="party-id" mode="#current"/>
         <xsl:apply-templates select="date-authorized" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="date-authorized" mode="xml2json">
      <string key="date-authorized">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="authorization-boundary" mode="xml2json">
      <map key="authorization-boundary">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:for-each-group select="diagram" group-by="local-name()">
            <map key="diagrams">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="diagram" mode="xml2json">
      <map key="{@id}">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
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
         <xsl:apply-templates select="caption" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="caption" mode="xml2json">
      <string key="caption">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="network-architecture" mode="xml2json">
      <map key="network-architecture">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:for-each-group select="diagram" group-by="local-name()">
            <map key="diagrams">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="data-flow" mode="xml2json">
      <map key="data-flow">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:for-each-group select="diagram" group-by="local-name()">
            <map key="diagrams">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="system-implementation" mode="xml2json">
      <map key="system-implementation">
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
         <xsl:for-each-group select="user" group-by="local-name()">
            <map key="users">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="component" group-by="local-name()">
            <map key="components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:if test="exists(service)">
            <array key="services">
               <xsl:apply-templates select="service" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(interconnection)">
            <array key="ssp-interconnection">
               <xsl:apply-templates select="interconnection" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="system-inventory" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
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
         <xsl:if test="exists(role-id)">
            <array key="role-ids">
               <xsl:apply-templates select="role-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(authorized-privilege)">
            <array key="authorized-privileges">
               <xsl:apply-templates select="authorized-privilege" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
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
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(function-performed)">
            <array key="functions-performed">
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
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:apply-templates mode="as-string" select="@component-type"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:apply-templates select="status" mode="#current"/>
         <xsl:for-each-group select="responsible-role" group-by="local-name()">
            <map key="responsible-roles">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="service" mode="xml2json">
      <map key="service">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@name"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:if test="exists(protocol)">
            <array key="ssp-protocol">
               <xsl:apply-templates select="protocol" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="purpose" mode="#current"/>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
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
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="port-range">
         <xsl:apply-templates mode="as-number" select="@start"/>
         <xsl:apply-templates mode="as-number" select="@end"/>
         <xsl:apply-templates mode="as-string" select="@transport"/>
      </map>
   </xsl:template>
   <xsl:template match="purpose" mode="xml2json">
      <string key="purpose">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="interconnection" mode="xml2json">
      <map key="interconnection">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates select="remote-system-name" mode="#current"/>
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
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="remote-system-name" mode="xml2json">
      <string key="remote-system-name">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
   <xsl:template match="system-inventory" mode="xml2json">
      <map key="system-inventory">
         <xsl:if test="exists(inventory-item)">
            <array key="inventory-items">
               <xsl:apply-templates select="inventory-item" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
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
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="implemented-component" mode="xml2json">
      <map key="{@component-id}">
         <xsl:apply-templates mode="as-string" select="@use"/>
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
         <xsl:for-each-group select="responsible-party" group-by="local-name()">
            <map key="responsible-parties">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="control-implementation" mode="xml2json">
      <map key="control-implementation">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
         <xsl:if test="exists(implemented-requirement)">
            <array key="implemented-requirements">
               <xsl:apply-templates select="implemented-requirement" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="implemented-requirement" mode="xml2json">
      <map key="implemented-requirement">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@control-id"/>
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:for-each-group select="by-component" group-by="local-name()">
            <map key="by-components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="responsible-role" group-by="local-name()">
            <map key="responsible-roles">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="set-param" group-by="local-name()">
            <map key="set-params">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="statement" group-by="local-name()">
            <map key="statements">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="statement" mode="xml2json">
      <map key="{@statement-id}">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
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
         <xsl:for-each-group select="responsible-role" group-by="local-name()">
            <map key="responsible-roles">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="by-component" group-by="local-name()">
            <map key="by-components">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="responsible-role" mode="xml2json">
      <map key="{@role-id}">
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
         <xsl:if test="exists(party-id)">
            <array key="party-ids">
               <xsl:apply-templates select="party-id" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:for-each select="remarks">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">remarks</xsl:with-param>
            </xsl:call-template>
         </xsl:for-each>
      </map>
   </xsl:template>
   <xsl:template match="by-component" mode="xml2json">
      <map key="{@component-id}">
         <xsl:for-each select="description">
            <xsl:call-template name="prose">
               <xsl:with-param name="key">description</xsl:with-param>
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
         <xsl:for-each-group select="responsible-role" group-by="local-name()">
            <map key="responsible-roles">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
         <xsl:for-each-group select="set-param" group-by="local-name()">
            <map key="set-params">
               <xsl:apply-templates select="current-group()" mode="#current"/>
            </map>
         </xsl:for-each-group>
      </map>
   </xsl:template>
   <xsl:template match="set-param" mode="xml2json">
      <map key="{@param-id}">
         <xsl:apply-templates select="value" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="value" mode="xml2json">
      <string key="value">
         <xsl:apply-templates mode="#current"/>
      </string>
   </xsl:template>
</xsl:stylesheet>
