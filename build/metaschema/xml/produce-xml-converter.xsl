<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    
    xmlns="http://www.w3.org/2005/xpath-functions">
    
<!-- Purpose: Produce an XSLT supporting bidirectional XML-JSON syntax negotiation based on constraints declared in a netaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting bidirectional transformation. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:template match="METASCHEMA">
        <xslt:stylesheet version="3.0"
            xpath-default-namespace="{ $target-namespace }"
            exclude-result-prefixes="#all">
            
            <xslt:output indent="yes" method="text" use-character-maps="delimiters"/>
            
            <xsl:comment> METASCHEMA conversion stylesheet supports XML->JSON conversion </xsl:comment>
            
            <xsl:comment> 88888888888888888888888888888888888888888888888888888888888888 </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> 88888888888888888888888888888888888888888888888888888888888888 </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
    </xsl:template>
    
    <xsl:template match="METASCHEMA/title"/>
    
    <xsl:template match="/METASCHEMA/*" priority="-0.2"/>
    
    
<!-- Flags don't need templates since they are always handled
     with fields or assemblies. -->
    <xsl:template match="define-flag"/>
    
    
    <xsl:template match="define-field[@address=flag/@name][@as='mixed'][empty(flag)]" priority="4">
        <xslt:template match="{@name}" mode="xml2json">
            <string key="{@address}">
                <xsl:apply-templates mode="md"/>
            </string>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-field[@address=flag/@name][empty(flag)]" priority="3">
        <xslt:template match="{@name}" mode="xml2json">
            <string key="{@address}">
                <xsl:apply-templates mode="md"/>
            </string>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-field[@address=flag/@name][@as='mixed']" priority="2">
        <xslt:template match="{@name}" mode="xml2json">
            <map key="{@address}">
                <xsl:apply-templates select="flag"/>
                
                <xslt:if test="matches(.,'\S')">
                    <string key="TEXT">
                        <xslt:apply-templates mode="md"/>
                    </string>
                </xslt:if>
            </map>
        </xslt:template>
    </xsl:template>
    
    
<!-- Keys are added to everything and then removed from nodes in arrays, in mode 'rectify' -->

    <!-- ignoring address in these cases -->
    <xsl:template match="define-field[empty(flag)][@as='mixed']" priority="3">
        <xslt:template match="{@name}" mode="xml2json">
            <string key="{@name}">
                <xslt:apply-templates mode="md"/>
            </string>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-field[empty(flag)]" priority="2">
        <xslt:template match="{@name}" mode="xml2json">
            <string key="{@name}">
                <xslt:apply-templates mode="md"/>
            </string>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-field[@as='mixed']">
        <xslt:template match="{@name}" mode="xml2json">
            <map key="{@name}">
                <xsl:apply-templates select="flag"/>
                
                <xslt:if test="matches(.,'\S')">
                    <string key="RICHTEXT">
                        <xslt:apply-templates mode="md"/>
                    </string>
                </xslt:if>
            </map>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="define-field">
        <xslt:template match="{@name}" mode="xml2json">
            <map key="{@name}">
                <xsl:apply-templates select="flag"/>
                
                <xslt:apply-templates mode="as-string" select=".">
                    <xslt:with-param name="key">STRVALUE</xslt:with-param>
                </xslt:apply-templates>
            </map>
        </xslt:template>
    </xsl:template>
   
    
    <!-- no special provision made for addressing by @id that happens at the other end -->
    <xsl:template match="define-assembly">
        <xslt:template match="{@name}" mode="xml2json">
            <map  key="{@name}">
                <xsl:for-each select="@address">
                    <xsl:attribute name="key">{@<xsl:value-of select="."/>}</xsl:attribute>
                </xsl:for-each>
                
                <xsl:apply-templates select="flag"/>
                
                <xsl:apply-templates select="model"/>
            </map>
        </xslt:template>
    </xsl:template>
    
    <xsl:template match="flag">
        <!-- no datatyping support yet -->
        <xslt:apply-templates mode="as-string" select="@{@name}"/>
    </xsl:template>
        
    <xsl:template match="model">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="prose">
        <xslt:call-template name="prose"/>
    </xsl:template>
    
    <xsl:template match="field | assembly">
        <xslt:apply-templates select="{@named}" mode="#current"/>
    </xsl:template>
    
    <xsl:template match="fields | assemblies">
            <xslt:if test="exists({@named})">
                <array key="{@group-as}">
                    <xslt:apply-templates select="{@named}" mode="#current"/>
                </array>
            </xslt:if>
        <!--<xslt:call-template name="elems-arrayed">
            <xslt:with-param name="elems" select="{@named}"/>
            <xslt:with-param name="group-as" select="'{@group-as}'"/>
        </xslt:call-template>-->
    </xsl:template>
    
    <xsl:template match="fields[@address] | assemblies[@address]">
            <xslt:for-each-group select="{@named}" group-by="local-name()">
                <map key="{@group-as}">
                    <xslt:apply-templates select="current-group()" mode="#current"/>
                </map>
            </xslt:for-each-group>
    </xsl:template>
    
    <xsl:template name="furniture">
        
        <xslt:character-map name="delimiters">
            <xslt:output-character character="&lt;" string="\u003c"/>
            <xslt:output-character character="&gt;" string="\u003e"/>
        </xslt:character-map>
        
        <xslt:param name="json-indent" as="xs:string">no</xslt:param>
    
        <xslt:mode name="rectify" on-no-match="shallow-copy"/>
        
        <xslt:template mode="rectify" xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
            match="/*/@key | array/*/@key"/>
        
        <xslt:variable name="write-options" as="map(*)" expand-text="true">
            <xslt:map>
                <xslt:map-entry key="'indent'">{ $json-indent='yes' }</xslt:map-entry>
            </xslt:map>
        </xslt:variable>
        
        <xslt:template match="/" mode="debug">
            <map>
                <xslt:apply-templates mode="xml2json"/>
            </map>
        </xslt:template>
        
        <xslt:template match="/">
            <xslt:variable name="xpath-json">
                <map>
                  <xslt:apply-templates mode="xml2json"/>
                </map>
            </xslt:variable>
            <xslt:variable name="rectified">
                <xslt:apply-templates select="$xpath-json" mode="rectify"/>
            </xslt:variable>
            <json>
                <xslt:value-of select="xml-to-json($rectified, $write-options)"/>
            </json>
        </xslt:template>
        
        <xslt:template name="prose">
            <xslt:if test="exists(p | ul | ol | pre)">
                <array key="prose">
                    <xslt:apply-templates mode="md" select="p | ul | ol | pre"/>
                </array>
            </xslt:if>
        </xslt:template>
        
        <xslt:template mode="as-string" match="@* | *">
            <xslt:param name="key" select="local-name()"/>
            <xslt:if test="matches(.,'\S')">
            <string key="{{$key}}">
                <xslt:value-of select="."/>
            </string>
            </xslt:if>
        </xslt:template>
        
        
        
        <!--<xslt:key name="parameters" match="param" use="@id"/>-->
        
        <xslt:template mode="md" match="p | link | part/*">
            <string>
                <xslt:apply-templates mode="md"/>
            </string>
        </xslt:template>
        
        <xslt:template mode="md" priority="1" match="pre">
            <string>```</string>
            <string>
                <xslt:apply-templates mode="md"/>
            </string>
            <string>```</string>
        </xslt:template>

        <xslt:template mode="md" priority="1" match="ul | ol">
            <string/>
            <xslt:apply-templates mode="md"/>
            <string/>
        </xslt:template>
        
        <xslt:template mode="md" match="ul//ul | ol//ol | ol//ul | ul//ol">
            <xslt:apply-templates mode="md"/>
        </xslt:template>
        
        <xslt:template mode="md" match="li">
            <string>
                <xslt:for-each select="../ancestor::ul">
                    <xslt:text>&#32;&#32;</xslt:text>
                </xslt:for-each>
                <xslt:text>* </xslt:text>
                <xslt:apply-templates mode="md"/>
            </string>
        </xslt:template><!-- Since XProc doesn't support character maps we do this in XSLT -   -->
        
        <xslt:template mode="md" match="ol/li">
            <string/>
            <string>
                <xslt:for-each select="../ancestor::ul">
                    <xslt:text>&#32;&#32;</xslt:text>
                </xslt:for-each>
                <xslt:text>1. </xslt:text>
                <xslt:apply-templates mode="md"/>
            </string>
        </xslt:template><!-- Since XProc doesn't support character maps we do this in XSLT -   -->
        
        
        
        <xslt:template mode="md" match="code | span[contains(@class,'code')]">
            <xslt:text>`</xslt:text>
            <xslt:apply-templates mode="md"/>
            <xslt:text>`</xslt:text>
        </xslt:template>
        
        <xslt:template mode="md" match="em | i">
            <xslt:text>*</xslt:text>
            <xslt:apply-templates mode="md"/>
            <xslt:text>*</xslt:text>
        </xslt:template>
        
        <xslt:template mode="md" match="strong | b">
            <xslt:text>**</xslt:text>
            <xslt:apply-templates mode="md"/>
            <xslt:text>**</xslt:text>
        </xslt:template>
        
        <xslt:template mode="md" match="q">
            <xslt:text>"</xslt:text>
            <xslt:apply-templates mode="md"/>
            <xslt:text>"</xslt:text>
        </xslt:template>
        
        <xslt:key name="element-by-id" match="*[exists(@id)]" use="@id"/>
        
        
        <xslt:template mode="md" match="a[starts-with(@href,'#')]">
            <xslt:variable name="link-target" select="key('element-by-id',substring-after(@href,'#'))"/>
            <xslt:text>[</xslt:text>
            <xslt:value-of select="replace(.,'&lt;','&amp;lt;')"/>
            <xslt:text>]</xslt:text>
            <xslt:text>(#</xslt:text>
            <xslt:value-of select="$link-target/*[1] => normalize-space() => lower-case() => replace('\s+','-') => replace('[^a-z\-\d]','')"/>
            <xslt:text>)</xslt:text>
        </xslt:template>
        
        <xslt:template match="text()" mode="md">
            <!-- Escapes go here       -->
            <xslt:value-of select="replace(.,'\s+',' ') ! replace(.,'([`~\^\*])','\$1')"/>
        </xslt:template>
        
        
    </xsl:template>
    
</xsl:stylesheet>