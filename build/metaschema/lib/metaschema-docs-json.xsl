<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0">
    
    <!-- Purpose: XSLT 3.0 stylesheet for converting a metaschema with samples into JSON for Jekyll parse and display -->
    <!-- Input:   Metaschema -->
    <!-- Output:  JSON  -->
    

    <!-- To debug, switch output methods and modes on template[@match='/'] -->
    <!--<xsl:output method="xml" indent="yes"/>-->
    <xsl:output method="text"/>
    
    <xsl:strip-space elements="*"/>
    <xsl:preserve-space elements="p"/>
    
    <xsl:param name="json-indent" as="xs:string">no</xsl:param>
    
    <xsl:variable name="write-options" as="map(*)" expand-text="true">
        <xsl:map>
            <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
        </xsl:map>
    </xsl:variable>
    
    <xsl:variable name="serialize-options" as="map(*)" expand-text="true">
        <xsl:map>
            <xsl:map-entry key="'indent'">true</xsl:map-entry>
        </xsl:map>
    </xsl:variable>
    
    
    <xsl:template match="/">
        <xsl:variable name="xpath-json">
            <xsl:apply-templates select="*" mode="cast"/>
        </xsl:variable>
        <xsl:value-of select="xml-to-json($xpath-json, $write-options)"/>
    </xsl:template>    
    
    <xsl:template match="/" mode="hide">
        <xsl:apply-templates select="*" mode="cast"/>
    </xsl:template>    
    
    <xsl:template mode="cast"  priority="1" match="define-assembly | define-flag | define-field" expand-text="yes">
        <map>
            <string key="name">{ @named | @name }</string>
            <xsl:apply-templates select="@group-as" mode="#current"/>
            <xsl:apply-templates select="description, remarks" mode="#current"/>
            <xsl:apply-templates select="." mode="type"/>
            <xsl:call-template name="flags"/>
            <xsl:apply-templates mode="#current" select="model"/>
            <xsl:for-each-group select="example" group-by="true()">
                <array key="examples">
                  <xsl:apply-templates mode="#current" select="current-group()"/>
                </array>
            </xsl:for-each-group>
        </map>
    </xsl:template>
   
    <xsl:template mode="type" match="define-field | field | fields">
        <string key="schema_type">field</string>
    </xsl:template>
    
    <xsl:template mode="type" match="define-assembly | assembly | assemblies">
        <string key="schema_type">field</string>
    </xsl:template>
    
    <xsl:template mode="type" match="define-flag | flag">
        <string key="schema_type">flag</string>
    </xsl:template>
    
    <!--<xsl:template mode="type" match="flag"/>-->
    
    <xsl:template match="@group-as" mode="cast">
        <string key="group-name" xsl:expand-text="yes">{ . }</string>
    </xsl:template>
    
    <xsl:template match="model" mode="cast">
        <array key="content_types">
            <xsl:apply-templates select="*" mode="#current"/>
        </array>
    </xsl:template>
    
<!-- appearing in an array 'examples'   -->
    <xsl:template match="example" mode="cast">
        <map>
            <xsl:apply-templates mode="#current"/>
            <xsl:apply-templates select="." mode="example-in-xml"/>
            <xsl:apply-templates select="." mode="example-in-json"/>
            <xsl:apply-templates select="." mode="example-in-yaml"/>
        </map>
    </xsl:template>
    
    <xsl:template priority="1" match="example/description | example/remarks" mode="example-in-xml example-in-json example-in-yaml"/>
    
    <xsl:template match="example/description | example/remarks" mode="cast">
        <string key="{local-name()}">
            <xsl:apply-templates/>
        </string>
    </xsl:template>
    
    <xsl:template match="example/*" mode="example-in-xml">
        <xsl:variable name="no-ns">
            <xsl:apply-templates select="." mode="no-ns"/>
        </xsl:variable>
        <xsl:variable name="syntax" select=" serialize($no-ns, $serialize-options)"/>
        <string key="xml">
            <xsl:value-of select="$syntax"/>
        </string>
    </xsl:template>
    
    <xsl:template match="example/*" mode="example-in-json"/>
    <xsl:template match="example/*" mode="example-in-yaml"/>
    
    <xsl:template mode="no-ns" match="*" xmlns="">
        <xsl:element name="{ local-name() }">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="flags">
        <xsl:for-each-group select="flag" group-by="true()">
            <array key="flags">
               <xsl:apply-templates select="current-group()" mode="cast"/>
            </array>
            
        </xsl:for-each-group>
        
    </xsl:template>
    
    <xsl:template match="description" mode="cast" expand-text="true">
        <string key="description">{ normalize-space(.) }</string>
    </xsl:template>
    
    <xsl:template match="remarks" mode="cast">
        <string key="remarks">
            <xsl:apply-templates mode="#current"/>
        </string>
    </xsl:template>
    
     
    <xsl:template match="field | fields | assembly | assemblies | flag" mode="cast" expand-text="yes">
        <map>
            <string key="name">{ @name | @named }</string>
            
            <xsl:apply-templates select="." mode="type"/>
            <xsl:apply-templates select="description, remarks" mode="#current"/>
            <xsl:apply-templates select="." mode="cardinality"/>
        </map>
    </xsl:template>

    <xsl:template match="prose" mode="cast" expand-text="yes">
        <map>
            <string key="name">prose</string>
        </map>
    </xsl:template>
    <xsl:template name="metaschematype">
        <string key="metaschema-type">{ substring-after(local-name(),'define-') }</string>
    </xsl:template>

    <xsl:template match="field[@required='yes'] | assembly[@required='yes']" mode="cardinality">
        <string key="cardinality">one and one only</string>
    </xsl:template>
    
    <!-- Metaschema doesn't support this but just in case. -->
    <xsl:template match="fields[@required='yes'] | assemblies[@required='yes']" mode="cardinality">
        <string key="cardinality">one or more</string>
    </xsl:template>
    
    <xsl:template match="field | assembly" mode="cardinality">
        <string key="cardinality">zero or one</string>
    </xsl:template>
    
    <xsl:template match="fields | assemblies" mode="cardinality">
        <string key="cardinality">zero or more</string>
    </xsl:template>
    
    <xsl:template match="p" mode="cast">
        <xsl:for-each select="preceding-sibling::*[1]"><xsl:text>&#xA;&#xA;</xsl:text></xsl:for-each>
            <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <xsl:template match="text()" mode="cast">
        <xsl:value-of select="replace(.,'\s+',' ')"/>
    </xsl:template>
    
    <xsl:template mode="cast" match="/*/*"/>
        
    <xsl:template match="/*" mode="cast">
        <array>
            <!--<string key="element">
                <xsl:value-of select="local-name(.)"/>
            </string>-->
            <xsl:apply-templates mode="cast"/>
            </array>
            <!--<xsl:if test="boolean(node())">
                <array key="content">
                    <xsl:apply-templates mode="cast"/>
                </array>
            </xsl:if>-->
    </xsl:template>
    <!--
    
    <xsl:template match="*" mode="cast">
        <map>
            <string key="element">
                <xsl:value-of select="local-name(.)"/>
            </string>
            <xsl:apply-templates select="@*" mode="cast"/>
            <xsl:if test="boolean(node())">
                <array key="content">
                    <xsl:apply-templates mode="cast"/>
                </array>
            </xsl:if>
        </map>
    </xsl:template>
    
    <xsl:template match="text()" mode="cast">
        <string>
            <xsl:value-of select="replace(.,'\s+',' ')"/>
        </string>
    </xsl:template>
    
    <xsl:template match="@*" mode="cast">
        <string key="@{ local-name() }">
            <xsl:value-of select="."/>
        </string>
    </xsl:template>-->
    
<!-- Comments and PIs are dropped. -->
    
</xsl:stylesheet>