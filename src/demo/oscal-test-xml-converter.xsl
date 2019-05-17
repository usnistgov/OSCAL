<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/2005/xpath-functions"
                version="3.0"
                xpath-default-namespace="urn:fakeup"
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
   <xsl:template mode="md" match="a[starts-with(@href,'#')]">
      <xsl:variable name="link-target"
                    select="key('element-by-id',substring-after(@href,'#'))"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="replace(.,'&lt;','&amp;lt;')"/>
      <xsl:text>]</xsl:text>
      <xsl:text>(#</xsl:text>
      <xsl:value-of select="$link-target/*[1] =&gt; normalize-space() =&gt; lower-case() =&gt; replace('\s+','-') =&gt; replace('[^a-z\-\d]','')"/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template match="text()" mode="md">
      <xsl:value-of select="replace(.,'\s+',' ') ! replace(.,'([`~\^\*])','\$1')"/>
   </xsl:template>
   <!-- 88888888888888888888888888888888888888888888888888888888888888 -->
   <xsl:template match="acquired-model" mode="xml2json">
      <map key="acquired-model">
         <xsl:if test="exists(acquired-field)">
            <array key="acquired-fields">
               <xsl:apply-templates select="acquired-field" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="acquired-field" mode="xml2json">
      <string key="acquired-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="kit" mode="xml2json">
      <map key="kit">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@some_string"/>
         <xsl:apply-templates select="another-thing" mode="#current"/>
         <xsl:if test="exists(thing)">
            <array key="things">
               <xsl:apply-templates select="thing" mode="#current"/>
            </array>
         </xsl:if>
      </map>
   </xsl:template>
   <xsl:template match="another-thing" mode="xml2json">
      <string key="another-thing">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="thing" mode="xml2json">
      <map key="thing">
         <xsl:apply-templates mode="as-string" select="@id"/>
         <xsl:apply-templates mode="as-string" select="@some_string"/>
         <xsl:apply-templates select="single-required-field" mode="#current"/>
         <xsl:apply-templates select="acquired-model" mode="#current"/>
         <xsl:apply-templates select="single-mixed-field" mode="#current"/>
         <xsl:apply-templates select="boolean_field" mode="#current"/>
         <xsl:if test="exists(plural-field)">
            <array key="all-in-fun">
               <xsl:apply-templates select="plural-field" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(plural-mixed-field)">
            <array key="plurals-mixed">
               <xsl:apply-templates select="plural-mixed-field" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:if test="exists(plural-flagged-mixed)">
            <array key="plurals">
               <xsl:apply-templates select="plural-flagged-mixed" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="single-chunk" mode="#current"/>
         <xsl:if test="exists(chunk-among-chunks)">
            <array key="many-chunks">
               <xsl:apply-templates select="chunk-among-chunks" mode="#current"/>
            </array>
         </xsl:if>
         <xsl:apply-templates select="vanilla" mode="#current"/>
         <xsl:apply-templates select="chocolate" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="single-required-field" mode="xml2json">
      <string key="single-required-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="single-mixed-field" mode="xml2json">
      <string key="single-mixed-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="plural-field" mode="xml2json">
      <string key="plural-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="plural-mixed-field" mode="xml2json">
      <string key="plural-mixed-field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
   <xsl:template match="plural-flagged-mixed" mode="xml2json">
      <map key="plural-flagged-mixed">
         <xsl:apply-templates mode="as-string" select="@some_string"/>
         <xsl:apply-templates mode="as-string" select=".">
            <xsl:with-param name="key">STRVALUE</xsl:with-param>
         </xsl:apply-templates>
      </map>
   </xsl:template>
   <xsl:template match="single-chunk" mode="xml2json">
      <map key="single-chunk">
         <xsl:apply-templates select="single-required-field" mode="#current"/>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="chunk-among-chunks" mode="xml2json">
      <map key="chunk-among-chunks">
         <xsl:apply-templates mode="as-string" select="@boolean_flag"/>
         <xsl:apply-templates select="single-required-field" mode="#current"/>
         <xsl:call-template name="prose"/>
      </map>
   </xsl:template>
   <xsl:template match="vanilla" mode="xml2json">
      <map key="vanilla">
         <xsl:apply-templates select="single-required-field" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="chocolate" mode="xml2json">
      <map key="chocolate">
         <xsl:apply-templates select="single-required-field" mode="#current"/>
      </map>
   </xsl:template>
   <xsl:template match="boolean_field" mode="xml2json">
      <string key="boolean_field">
         <xsl:apply-templates mode="md"/>
      </string>
   </xsl:template>
</xsl:stylesheet>
