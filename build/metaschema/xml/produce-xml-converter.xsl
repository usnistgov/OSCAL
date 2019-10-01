<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    
    xmlns="http://www.w3.org/2005/xpath-functions">
    
<!-- Purpose: Produce an XSLT supporting bidirectional XML-JSON syntax negotiation based on constraints declared in a netaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting bidirectional transformation. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:variable name="string-value-label">STRVALUE</xsl:variable>
    <xsl:variable name="markdown-value-label">RICHTEXT</xsl:variable>
    <xsl:variable name="markdown-blocks-label">PROSE</xsl:variable>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly"
        use="@name"/>
    
    <!-- Produces composed metaschema (imports resolved) -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    <!--<xsl:variable name="composed-metaschema" select="/"/>-->
    
    <xsl:template match="/">
        <xsl:apply-templates select="$composed-metaschema/METASCHEMA"/>
    </xsl:template>
    
    <xsl:template match="METASCHEMA">
        <XSLT:stylesheet version="3.0"
            xpath-default-namespace="{ $target-namespace }"
            exclude-result-prefixes="#all">
            
            <XSLT:output indent="yes" method="text" omit-xml-declaration="yes" use-character-maps="delimiters"/>
            
            <xsl:comment> METASCHEMA conversion stylesheet supports XML->JSON conversion </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:comment> 88888888888888888888888888888888888888888888888888888888888888 </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            
            <XSLT:character-map name="delimiters">
               <!-- Rewrites Unicode PUA char E0000 to reverse solidus -->
               <!--<XSLT:output-character character="&#xE0000;" string="\"/>-->
            </XSLT:character-map>
            
            <XSLT:param name="json-indent" as="xs:string">no</XSLT:param>
            <xsl:comment> Pass $diagnostic as 'rough' for first pass, 'rectified' for second pass </xsl:comment>
            <XSLT:param name="diagnostic" as="xs:string">no</XSLT:param>
            
            <!-- Note that Saxon's JSON serializer already escapes characters per
                 https://www.w3.org/XML/Group/qtspecs/specifications/xpath-functions-31/html/Overview.html#func-xml-to-json 
            -->
            <XSLT:template match="text()" mode="md">
                <!-- Escapes go here       -->
                <!-- prefixes ` ~ ^ * with char E0000 from Unicode PUA -->
                <!--<XSLT:value-of select="replace(., '([`~\^\*''&quot;])', '&#xE0000;$1')"/>-->
                <!-- prefixes ` ~ ^ * ' " with backward solidus -->
                <XSLT:value-of select="replace(., '([`~\^\*&quot;])', '\\$1')"/>
                <!--<XSLT:value-of select="."/>-->
            </XSLT:template>
            
            <XSLT:variable name="write-options" as="map(*)" expand-text="true">
                <XSLT:map>
                    <XSLT:map-entry key="'indent'">{ $json-indent='yes' }</XSLT:map-entry>
                </XSLT:map>
            </XSLT:variable>
            
            <xsl:call-template name="furniture"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:comment> 88888888888888888888888888888888888888888888888888888888888888 </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>


        </XSLT:stylesheet>
    </xsl:template>
    
    <xsl:template match="METASCHEMA/title"/>
    
    <xsl:template match="/METASCHEMA/*" priority="-0.2"/>
    
    
<!-- Flags don't need templates since they are always handled
     with fields or assemblies. -->
    <xsl:template match="define-flag"/>
    
    <xsl:template match="define-field" mode="text-key">
        <xsl:value-of select="$string-value-label"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as-type='markup-line']" mode="text-key">
        <xsl:value-of select="$markdown-value-label"/>
    </xsl:template>
    
<!-- this should only apply as long as (a) xml-unwrap='yes' and (b) there
    are no flags -->
    <xsl:template match="define-field[@as-type='markup-multiline']" mode="text-key">
        <!--<xsl:value-of select="$markdown-blocks-label"/>-->
        <xsl:value-of select="@name"/>
    </xsl:template>
    
    <xsl:template priority="3" match="define-field[matches(json-value-key,'\S')]" mode="text-key">
        <xsl:value-of select="json-value-key"/>
    </xsl:template>
    
    <xsl:template priority="4" match="define-field[exists(json-value-key/@flag-name)]" mode="text-key">
        <XSLT:value-of select="@{ json-value-key/@flag-name }"/>
    </xsl:template>
    
    <xsl:variable name="numeric-types" as="element()*">
        <type>integer</type>
        <type>double</type>
        <type>decimal</type>
        <type>float</type>
        <type>double</type>
        <type>integer</type>
        <type>nonNegativeInteger</type>
        <type>positiveInteger</type>
        <!--<type>percent</type>-->
    </xsl:variable>        
    
    <xsl:template match="define-field[@as-type=$numeric-types]" priority="3">
        <XSLT:template match="{@name}" mode="xml2json">
            <number key="{@name}">
                <xsl:for-each select="json-key">
                    <xsl:attribute name="key">{@<xsl:value-of select="@flag-name"/>}</xsl:attribute>
                </xsl:for-each>
                <XSLT:apply-templates mode="#current"/>
            </number>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template match="define-field[@as-type='boolean']" priority="3">
        <XSLT:template match="{@name}" mode="xml2json">
            <boolean key="{@name}">
                <xsl:for-each select="json-key">
                    <xsl:attribute name="key">{@<xsl:value-of select="@flag-name"/>}</xsl:attribute>
                </xsl:for-each>
                <XSLT:apply-templates mode="#current"/>
            </boolean>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template match="define-field[@as-type=('markup-line','markup-multiline')][empty(flag)]" priority="3">
        <XSLT:template match="{@name}" mode="xml2json">
            <string key="{@name}">
                <!-- Mode 'md' will escape characters for Markdown. -->
                <XSLT:apply-templates mode="md"/>
            </string>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template match="define-field[empty(flag)]" priority="2">
        <XSLT:template match="{@name}" mode="xml2json">
            <string key="{@name}">
                <!-- Not escaping any characters this time. -->
                <XSLT:apply-templates mode="#current"/>
            </string>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template match="define-field">
        <XSLT:template match="{@name}" mode="xml2json">
            <XSLT:variable name="text-key">
                <xsl:apply-templates select="." mode="text-key"/>
            </XSLT:variable>
            <map key="{@name}">
                <xsl:for-each select="json-key">
                    <xsl:attribute name="key">{@<xsl:value-of select="@flag-name"/>}</xsl:attribute>
                </xsl:for-each>
                <xsl:apply-templates select="flag"/>
                <xsl:if test="not(@as-type = 'empty')">
                    <XSLT:apply-templates mode="as-string" select=".">
                        <XSLT:with-param name="key" select="$text-key"/>
                        <!-- Always write the value key even when empty, as required by the JSON Schema -->
                        <XSLT:with-param name="mandatory" select="true()"/>
                        <!-- write an empty string when the value key is dynamic
                         since the key tells us the value for the (implicit) flag:
                         <XSLT:with-param name="mandatory" select="{ exists(json-value-key/@flag-name) }()"/> -->
                    </XSLT:apply-templates>
                </xsl:if>
            </map>
        </XSLT:template>
        <!-- flagged, groupable fields marked as collapsible may be collapsed -->
        <xsl:if test="exists(flag) and @collapsible = ('yes','true')">
            <xsl:variable name="group-names" select="distinct-values(key('reference-by-name',@name)/group-as/@name)"/>
            <xsl:variable name="text-key">
                <xsl:apply-templates select="." mode="text-key"/>
            </xsl:variable>
            <xsl:variable name="group-properties">
                <xsl:variable name="flag-names" as="xs:string*">
                    <xsl:perform-sort select="flag/(@name,@ref)[1]/normalize-space(.)">
                        <xsl:sort select="."/>
                    </xsl:perform-sort>
                </xsl:variable>
                <xsl:sequence select="string-join($flag-names ! ( '*[@key = ''' || . || ''']'),',')"/>
            </xsl:variable>
            
            <xsl:for-each select="$group-names">
                <!-- making it explicit -->
                <xsl:variable name="group-name" select="."/>
                <!--<XSLT:template match="array[@key = ({ string-join($callers ! ('''' || . || ''''),', ') })][count(map) gt 1]" mode="rectify"-->
                <XSLT:template match="array[@key = '{ $group-name }'][count(map) gt 1]" mode="rectify"
                        xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
                <XSLT:variable name="text-key">
                    <xsl:copy-of select="$text-key"/>
                </XSLT:variable>
                
                <XSLT:variable name="grouped-maps" as="element()*">
                    <XSLT:for-each-group select="map"
                        group-by="string-join( ({ $group-properties } ), '#' )">
                        <map>
                            <!--<XSLT:copy-of select="*[@key = ('days', 'baker')]"/>-->
                            <array key="{{$text-key}}">
                                <XSLT:for-each select="current-group()/string[@key = $text-key]">
                                    <string>
                                        <XSLT:apply-templates mode="#current"/>
                                    </string>
                                </XSLT:for-each>
                            </array>
                        </map>
                    </XSLT:for-each-group>
                </XSLT:variable>
                <XSLT:choose>
                    <XSLT:when test="count($grouped-maps) gt 1">
                        <array key="{ $group-name }">
                            <XSLT:copy-of select="$grouped-maps"/>
                        </array>
                    </XSLT:when>
                    <XSLT:otherwise>
                        <map key="{ $group-name }">
                            <XSLT:copy-of select="$grouped-maps/*"/>
                        </map>
                    </XSLT:otherwise>
                </XSLT:choose>
            </XSLT:template>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
    
    <!-- no special provision made for addressing by @id that happens at the other end -->
    <xsl:template match="define-assembly">
        <XSLT:template match="{@name}" mode="xml2json">
            <map key="{@name}">
                <xsl:for-each select="json-key">
                    <xsl:attribute name="key">{@<xsl:value-of select="@flag-name"/>}</xsl:attribute>
                </xsl:for-each>

                <xsl:apply-templates select="flag"/>

                <xsl:apply-templates select="model"/>
            </map>
        </XSLT:template>
    </xsl:template>
    
    <!--  A flag designated to be key is not picked up as a property -->
    <xsl:template match="flag[(@name|@ref)=../(json-key|json-value-key)/@flag-name]"/>
    
    <xsl:template match="flag">
        <xsl:variable name="datatype" select="(key('definition-by-name',@ref)/@as-type,@as-type,'string')[1]"/>
        <xsl:variable name="type" as="xs:string">
            <xsl:apply-templates mode="resolve-type" select="$datatype"/>
        </xsl:variable>
        <XSLT:apply-templates mode="as-{$type}" select="@{(@name,@ref)[1]}"/>
    </xsl:template>

    <!-- mode 'resolve type' matches strings :-) -->
    <xsl:template mode="resolve-type" match=".">string</xsl:template>
    
    <xsl:template mode="resolve-type" match=".[.='boolean']">boolean</xsl:template>
    
    <xsl:template mode="resolve-type" match=".[.=$numeric-types]">number</xsl:template>
    
    <xsl:template match="model">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="field | assembly">
        <XSLT:apply-templates select="{@ref}" mode="#current"/>
    </xsl:template>
    
    <xsl:template priority="2" match="field[@in-xml='UNWRAPPED'][key('definition-by-name',@ref)/@as-type='markup-multiline']">
        <XSLT:call-template name="prose">
            <XSLT:with-param name="key">
                <xsl:value-of select="@ref"/>
            </XSLT:with-param>
        </XSLT:call-template>
    </xsl:template>
    
    <xsl:template match="field[key('definition-by-name',@ref)/@as-type='markup-multiline']">
        <XSLT:for-each select="{ @ref }">
            <XSLT:call-template name="prose">
                <XSLT:with-param name="key">
                    <xsl:value-of select="@ref"/>
                </XSLT:with-param>
            </XSLT:call-template>
        </XSLT:for-each>
    </xsl:template>
    
    <xsl:template priority="3" match="field[number(@max-occurs) &gt; 1 or @max-occurs='unbounded'] |
        assembly[number(@max-occurs) &gt; 1 or @max-occurs='unbounded']">
            <XSLT:if test="exists({@ref})">
                <array key="{ group-as/@name }">
                    <!-- copying @m:in-json to condition handling
                         in the next 'rectify' mode -->
                    <xsl:copy-of select="group-as/@in-json"/>
                    <xsl:next-match/>
                    <!--<XSLT:apply-templates select="{@ref}" mode="#current"/>-->
                </array>
            </XSLT:if>
        <!--<XSLT:call-template name="elems-arrayed">
            <XSLT:with-param name="elems" select="{@ref}"/>
            <XSLT:with-param name="group-as" select="'{@group-as}'"/>
        </XSLT:call-template>-->
    </xsl:template>
    
    <xsl:template priority="4"
        match="field[exists(key('definition-by-name',@ref)/json-key)] |
        assembly[exists(key('definition-by-name',@ref)/json-key)]">
        <XSLT:for-each-group select="{@ref}" group-by="local-name()">
            <map key="{  group-as/@name }">
                
                <XSLT:apply-templates select="current-group()" mode="#current"/>
            </map>
        </XSLT:for-each-group>
    </xsl:template>
    
    <xsl:template priority="5"
        match="field[group-as/@in-xml='GROUPED'] |
        assembly[group-as/@in-xml='GROUPED']">
        <XSLT:for-each select="{group-as/@name}">
            <xsl:next-match/>
        </XSLT:for-each>
    </xsl:template>
    
    <xsl:template name="furniture">

        <XSLT:variable name="xpath-json">
            <map>
                <XSLT:apply-templates select="/" mode="xml2json"/>
            </map>
        </XSLT:variable>

        <XSLT:variable name="rectified">
            <XSLT:apply-templates select="$xpath-json" mode="rectify"/>
        </XSLT:variable>

        <XSLT:template match="/">
            <XSLT:choose>
                <XSLT:when test="$diagnostic = 'rough'">
                    <XSLT:copy-of select="$xpath-json"/>
                </XSLT:when>
                <XSLT:when test="$diagnostic = 'rectified'">
                    <XSLT:copy-of select="$rectified"/>
                </XSLT:when>
                <XSLT:otherwise>
                    <XSLT:value-of select="xml-to-json($rectified, $write-options)"/>
                </XSLT:otherwise>
            </XSLT:choose>
        </XSLT:template>

        <XSLT:template match="node() | @*" mode="rectify">
            <XSLT:copy copy-namespaces="no">
                <XSLT:apply-templates mode="#current" select="node() | @*"/>
            </XSLT:copy>
        </XSLT:template>

        <XSLT:template mode="rectify"
            xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
            match="/*/@key | array/*/@key"/>

        <XSLT:template mode="rectify" match="@m:*"/>

        <!--        don't squash arrays marked as @m:in-json="ARRAY" -->
        <XSLT:template mode="rectify" match="array[count(*) eq 1][not(@m:in-json = 'ARRAY')]"
            xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
            <XSLT:for-each select="*">
                <XSLT:copy>
                    <XSLT:copy-of select="../@key"/>
                    <XSLT:apply-templates mode="#current"/>
                </XSLT:copy>
            </XSLT:for-each>
        </XSLT:template>

        <XSLT:template name="prose">
            <XSLT:param name="key" select="'{ $markdown-blocks-label }'"/>
            <XSLT:variable name="blocks"
                select="p | ul | ol | pre | h1 | h2 | h3 | h4 | h5 | h6 | table"/>
            <XSLT:if test="exists($blocks)">
                <XSLT:variable name="string-sequence" as="element()*">
                    <XSLT:apply-templates mode="md" select="$blocks"/>
                </XSLT:variable>
                <string key="{{$key}}">
                    <XSLT:value-of select="string-join($string-sequence, '\n')"/>
                </string>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="as-string" match="@* | *">
            <XSLT:param name="key" select="local-name()"/>
            <XSLT:param name="mandatory" select="false()"/>
            <XSLT:if test="$mandatory or matches(., '\S')">
                <string key="{{ $key }}">
                    <XSLT:value-of select="."/>
                </string>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="as-boolean" match="@* | *">
            <XSLT:param name="key" select="local-name()"/>
            <XSLT:param name="mandatory" select="false()"/>
            <XSLT:if test="$mandatory or matches(., '\S')">
                <boolean key="{{ $key }}">
                    <XSLT:value-of select="."/>
                </boolean>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="as-integer" match="@* | *">
            <XSLT:param name="key" select="local-name()"/>
            <XSLT:param name="mandatory" select="false()"/>
            <XSLT:if test="$mandatory or matches(., '\S')">
                <integer key="{{ $key }}">
                    <XSLT:value-of select="."/>
                </integer>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="as-number" match="@* | *">
            <XSLT:param name="key" select="local-name()"/>
            <XSLT:param name="mandatory" select="false()"/>
            <XSLT:if test="$mandatory or matches(., '\S')">
                <number key="{{ $key }}">
                    <XSLT:value-of select="."/>
                </number>
            </XSLT:if>
        </XSLT:template>

        <!--<XSLT:key name="parameters" match="param" use="@id"/>-->

        <XSLT:template name="conditional-lf">
            <XSLT:variable name="predecessor"
                select="preceding-sibling::p | preceding-sibling::ul | preceding-sibling::ol | preceding-sibling::table | preceding-sibling::pre"/>
            <XSLT:if test="exists($predecessor)">
                <string/>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="md" match="p | link | part/*">
            <XSLT:call-template name="conditional-lf"/>
            <string>
                <XSLT:apply-templates mode="md"/>
            </string>
        </XSLT:template>

        <XSLT:template mode="md" match="h1 | h2 | h3 | h4 | h5 | h6">
            <XSLT:call-template name="conditional-lf"/>
            <string>
                <XSLT:apply-templates select="." mode="mark"/>
                <XSLT:apply-templates mode="md"/>
            </string>
        </XSLT:template>

        <XSLT:template mode="mark" match="h1"># </XSLT:template>
        <XSLT:template mode="mark" match="h2">## </XSLT:template>
        <XSLT:template mode="mark" match="h3">### </XSLT:template>
        <XSLT:template mode="mark" match="h4">#### </XSLT:template>
        <XSLT:template mode="mark" match="h5">##### </XSLT:template>
        <XSLT:template mode="mark" match="h6">###### </XSLT:template>

        <XSLT:template mode="md" match="table">
            <XSLT:call-template name="conditional-lf"/>
            <XSLT:apply-templates select="*" mode="md"/>
        </XSLT:template>

        <XSLT:template mode="md" match="tr">
            <string>
                <XSLT:apply-templates select="*" mode="md"/>
            </string>
            <XSLT:if test="empty(preceding-sibling::tr)">
                <string>
                    <XSLT:text>|</XSLT:text>
                    <XSLT:for-each select="th | td">
                        <xsl:text> --- |</xsl:text>
                    </XSLT:for-each>
                </string>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template mode="md" match="th | td">
            <XSLT:if test="empty(preceding-sibling::*)">|</XSLT:if>
            <XSLT:text>
                <xsl:text> </xsl:text>
            </XSLT:text>
            <XSLT:apply-templates mode="md"/>
            <XSLT:text> |</XSLT:text>
        </XSLT:template>

        <XSLT:template mode="md" priority="1" match="pre">
            <XSLT:call-template name="conditional-lf"/>
            <string>```</string>
            <string>
                <XSLT:apply-templates mode="md"/>
            </string>
            <string>```</string>
        </XSLT:template>

        <XSLT:template mode="md" priority="1" match="ul | ol">
            <XSLT:call-template name="conditional-lf"/>
            <XSLT:apply-templates mode="md"/>
            <string/>
        </XSLT:template>

        <XSLT:template mode="md" match="ul//ul | ol//ol | ol//ul | ul//ol">
            <XSLT:apply-templates mode="md"/>
        </XSLT:template>

        <XSLT:template mode="md" match="li">
            <string>
                <XSLT:for-each select="../ancestor::ul">
                    <XSLT:text>&#32;&#32;</XSLT:text>
                </XSLT:for-each>
                <XSLT:text>* </XSLT:text>
                <XSLT:apply-templates mode="md"/>
            </string>
        </XSLT:template>
        <!-- Since XProc doesn't support character maps we do this in XSLT -   -->

        <XSLT:template mode="md" match="ol/li">
            <string/>
            <string>
                <XSLT:for-each select="../ancestor::ul">
                    <XSLT:text>&#32;&#32;</XSLT:text>
                </XSLT:for-each>
                <XSLT:text>1. </XSLT:text>
                <XSLT:apply-templates mode="md"/>
            </string>
        </XSLT:template>
        <!-- Since XProc doesn't support character maps we do this in XSLT -   -->



        <XSLT:template mode="md" match="code | span[contains(@class, 'code')]">
            <XSLT:text>`</XSLT:text>
            <XSLT:apply-templates mode="md"/>
            <XSLT:text>`</XSLT:text>
        </XSLT:template>

        <XSLT:template mode="md" match="em | i">
            <XSLT:text>*</XSLT:text>
            <XSLT:apply-templates mode="md"/>
            <XSLT:text>*</XSLT:text>
        </XSLT:template>

        <XSLT:template mode="md" match="strong | b">
            <XSLT:text>**</XSLT:text>
            <XSLT:apply-templates mode="md"/>
            <XSLT:text>**</XSLT:text>
        </XSLT:template>

        <XSLT:template mode="md" match="q">
            <XSLT:text>"</XSLT:text>
            <XSLT:apply-templates mode="md"/>
            <XSLT:text>"</XSLT:text>
        </XSLT:template>

        <!-- <insert param-id="ac-1_prm_1"/> -->
        <XSLT:template mode="md" match="insert">
            <XSLT:text>{{ </XSLT:text>
            <XSLT:value-of select="@param-id"/>
            <XSLT:text> }}</XSLT:text>
        </XSLT:template>

        <XSLT:key name="element-by-id" match="*[exists(@id)]" use="@id"/>

        <XSLT:template mode="md" match="a">
            <XSLT:text>[</XSLT:text>
            <XSLT:value-of select="."/>
            <XSLT:text>]</XSLT:text>
            <XSLT:text>(</XSLT:text>
            <XSLT:value-of select="@href"/>
            <XSLT:text>)</XSLT:text>
        </XSLT:template>

<!-- See top level template match="/" for XSLT:template match="text()" mode="md" -->
    </xsl:template>
    
</xsl:stylesheet>