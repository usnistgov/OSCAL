<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                xpath-default-namespace="urn:mini"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes"
               method="xml"
               omit-xml-declaration="yes"
               use-character-maps="delimiters"/>
   <!-- METASCHEMA conversion stylesheet supports XML->JSON conversion -->
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:character-map name="delimiters">
      <xsl:output-character character="&lt;" string="\u003c"/>
      <xsl:output-character character="&gt;" string="\u003e"/>
   </xsl:character-map>
   <xsl:param name="json-indent" as="xs:string">no</xsl:param>
   <!-- Pass $diagnostic as 'rough' for first pass, 'rectified' for second pass -->
   <xsl:param name="diagnostic" as="xs:string">none</xsl:param>
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
         <xsl:when test="$diagnostic='rough'">
            <xsl:copy-of select="$xpath-json"/>
         </xsl:when>
         <xsl:when test="$diagnostic='rectified'">
            <xsl:copy-of select="$rectified"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="xml-to-json($rectified, $write-options)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:mode name="rectify" on-no-match="shallow-copy"/>
   <xsl:template mode="rectify"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                 match="/*/@key | array/*/@key"/>
   <xsl:template mode="rectify"
                 match="array[count(*) eq 1]"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
      <xsl:for-each select="*">
         <xsl:copy>
            <xsl:copy-of select="../@key"/>
            <xsl:apply-templates mode="#current"/>
         </xsl:copy>
      </xsl:for-each>
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
   <xsl:template mode="md" match="insert">
      <xsl:text>{ </xsl:text>
      <xsl:value-of select="@param-id"/>
      <xsl:text> }</xsl:text>
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
      <xsl:value-of select="replace(.,'([`~\^\*''&#34;])','\\$1')"/>
   </xsl:template>
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:template match="lunch" mode="xml2json">
      <map key="lunch">
         <xsl:apply-templates select="salad" mode="#current"/>
         <xsl:apply-templates select="sandwich" mode="#current"/>
         <xsl:if test="exists(chip)">
            <array key="chips">
               <xsl:apply-templates select="chip" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(cookie)">
            <array key="cookies">
               <xsl:apply-templates select="cookie" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(cupcake)">
            <array key="cupcakes">
               <xsl:apply-templates select="cupcake" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="sandwich" mode="xml2json">
      <map key="sandwich">
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="chip" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <string key="chip">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="cookie" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="cookie">
         <xsl:apply-templates mode="as-string" select="@days"/>
         <xsl:apply-templates mode="as-string" select="@baker"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="array[@key = 'cookies'][count(map) gt 1]"
                 mode="rectify"
                 xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <xsl:for-each-group select="map"
                          group-by="string-join( (*[@key = 'baker'],*[@key = 'days'] ), '#' )">
         <map key="cookies">
            <xsl:copy-of select="*[@key = ('days', 'baker')]"/>
            <array key="{$text-key}">
               <xsl:for-each select="current-group()/string[@key = $text-key]">
                  <string>
                     <xsl:apply-templates mode="#current"/>
                  </string>
               </xsl:for-each>
            </array>
         </map>
      </xsl:for-each-group>
   </xsl:template>
   <xsl:template match="cupcake" mode="xml2json">
      <xsl:variable name="text-key">STRVALUE</xsl:variable>
      <map key="cupcake">
         <xsl:apply-templates mode="as-string" select="@icing"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key" select="$text-key"/>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="salad" mode="xml2json">
      <map key="salad">
         <xsl:if test="exists(masked-field)">
            <array key="masked-fields">
               <xsl:apply-templates select="masked-field" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(labeled-value-field)">
            <array key="labeled-value-fields">
               <xsl:apply-templates select="labeled-value-field" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(ID-object)">
            <array key="ID-objects">
               <xsl:apply-templates select="ID-object" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="masked-field" mode="xml2json">
      <xsl:variable name="text-key">
         <xsl:value-of select="string[@key='name']"/>
      </xsl:variable>
      <string key="masked-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="labeled-value-field" mode="xml2json">
      <xsl:variable name="text-key">label</xsl:variable>
      <string key="labeled-value-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="ID-object" mode="xml2json">
      <xsl:variable name="text-key">
         <xsl:value-of select="string[@key='big']"/>
      </xsl:variable>
      <string key="ID-object">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
</xsl:stylesheet>
