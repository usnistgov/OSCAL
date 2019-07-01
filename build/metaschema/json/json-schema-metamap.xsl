<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0" xmlns="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" expand-text="true">

<!-- Purpose: Produce an XPath-JSON document representing JSON Schema declarations from Metaschema source data.
     The results are conformant to the rules for the XPath 3.1 definition of an XML format capable of being cast
     (using the xml-to-json() function) into JSON. -->
    
<!-- Note: this XSLT will only be used on its own for development and debugging.
     It is however imported by `produce-json-converter.xsl` and possibly other stylesheets. -->
    
    <xsl:strip-space elements="METASCHEMA define-assembly define-field model"/>
    
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="/" priority="2">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:variable name="home" select="/"/>
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:variable name="string-value-label">STRVALUE</xsl:variable>
    <xsl:variable name="markdown-value-label">RICHTEXT</xsl:variable>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly"
        use="@name"/>

    <!-- Produces composed metaschema (imports resolved) -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    
    <xsl:template match="/METASCHEMA" expand-text="true">
        <map>
            <string key="$schema">http://json-schema.org/draft-07/schema#</string>
            <string key="$id">http://csrc.nist.gov/ns/oscal/{ $composed-metaschema/METASCHEMA/schema-version }/{ short-name }-schema.json</string>
            <xsl:for-each select="schema-name">
              <string key="$comment">{ . }: JSON Schema</string>
            </xsl:for-each>
            
            <xsl:apply-templates select="schema-version"/>
            <string key="type">object</string>
            <map key="definitions">
                <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>

                <map key="prose">
                    <xsl:call-template name="string-or-array-of-strings"/>
                </map>
            </map>           
        <map key="properties">
            <!--<xsl:apply-templates mode="properties"/>-->
            <map key="{@root}">
                <string key="$ref">#/definitions/{ @root }</string>
            </map>
        </map>
        <!--<map key="propertyNames">
                <array key="enum">
                    <string>
                        <xsl:apply-templates mode="property-names"/></string>
                </array>
            </map>-->
        </map>
    </xsl:template>
    <xsl:template name="string-or-array-of-strings">
        <array key="anyOf">
            <map>
                <string key="type">string</string>
            </map>
            <map>
                <string key="type">array</string>
                <map key="items">
                    <string key="type">string</string>
                </map>
            </map>
        </array>
    </xsl:template>

    <xsl:template match="METASCHEMA/schema-name | METASCHEMA/short-name | METASCHEMA/remarks | METASCHEMA/namespace | METASCHEMA/schema-version"/>
  
    <!-- Flag declarations are all handled at the point of invocation -->
    <xsl:template match="define-flag"/>
    
    <xsl:template match="define-assembly | define-field">
        <map key="{ @name (: @group-as | @name[empty(../@group-as)] :) }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <string key="type">object</string>
            <map key="properties">
                <xsl:apply-templates select="." mode="properties"/>
            </map>
            <xsl:for-each-group select="(flag[@required='yes'][empty(value-key)] | model//*[@min-occurs &gt; 0])" group-by="true()">
                <array key="required">
                    <xsl:apply-templates select="current-group()" mode="property-name"/>
                    <!--<xsl:for-each select="current-group()">
                        <string>
                            <xsl:value-of select="(@name,@ref)[1]"/>
                        </string>
                    </xsl:for-each>-->
                </array>
            </xsl:for-each-group>
            <xsl:choose>
                <xsl:when test="exists(flag/value-key)">
                    <xsl:variable name="all-properties"
                        select="flag[empty(value-key)] | model//(field | assembly)"/>
                    <number key="minProperties">
                        <xsl:value-of select="count($all-properties[@required='yes' or @min-occurs &gt; 0] | self::define-field[not(@as='empty')])"/>
                    </number>
                    <number key="maxProperties">
                        <xsl:value-of select="count($all-properties | self::define-field[not(@as='empty')])"/>
                    </number>
                </xsl:when>
                <xsl:otherwise>
                    <boolean key="additionalProperties">false</boolean>
                </xsl:otherwise>
            </xsl:choose>
            
            <!--<map key="propertyNames">
                <array key="enum">
                    <xsl:apply-templates select="." mode="text-property"/>
                    <xsl:apply-templates select="flag, model" mode="property-name"/>
                </array>
            </map>-->
        </map>
    </xsl:template>
    
    <xsl:template match="*" mode="text-property"/>
    
    <xsl:template match="define-field" mode="text-property">
        <string>
          <xsl:apply-templates select="." mode="text-key"/>
        </string>
    </xsl:template>
    
    <xsl:template match="define-field" mode="text-key">
        <xsl:value-of select="$string-value-label"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as='mixed']" mode="text-key">
        <xsl:value-of select="$markdown-value-label"/>
    </xsl:template>
    
    <xsl:template priority="2" match="define-field[exists(value-key)]" mode="text-key">
        <xsl:value-of select="value-key"/>
    </xsl:template>
    
    <xsl:template priority="3" match="define-field[exists(flag/value-key)]" mode="text-key"/>
    
    <xsl:template match="define-assembly[exists(key)] | define-field[exists(key)]">
        <!--<xsl:if test="matches(@group-as,'\S')">
            <map key="{ @group-as }">
                <string key="$id">#/definitions/{@group-as}</string>
                <string key="type">object</string>
                <map key="additionalProperties">
                    <string key="type">object</string>
                    <string key="$ref">#/definitions/{ @name }</string>
                </map>
                <number key="minProperties">1</number>
            </map>
        </xsl:if>-->
        <map key="{ @name }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <string key="type">object</string>
            <map key="properties">
                <xsl:apply-templates select="." mode="properties"/>
            </map>
            <boolean key="additionalProperties">false</boolean>
        </map>
    </xsl:template>
    
    <xsl:template match="define-field[empty(key|flag)]">
        <map key="{ @name (: @group-as | @name[empty(../@group-as)] :) }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <xsl:apply-templates select="." mode="object-type"/>
        </map>
    </xsl:template>

    <xsl:template match="define-assembly" mode="properties">
        <!-- to be excluded, flags assigned to be keys -->
        <xsl:apply-templates mode="declaration" select="flag[empty(key)], model"/>
    </xsl:template>

    <xsl:template match="formal-name">
        <string key="title">
            <xsl:apply-templates/>
        </string>
    </xsl:template>

    <xsl:template match="description">
        <string key="description">
            <xsl:value-of select="normalize-space(.)"/>
        </string>
    </xsl:template>

    <xsl:template match="remarks | example"/>
    
    <xsl:template match="*[exists(@ref)]" mode="property-name">
        <string>
            <xsl:value-of select="key('definition-by-name',@ref)/(@group-as,@name)[1]"/>
        </string>
    </xsl:template>
    
    <xsl:template match="flag[exists(@name)]" mode="property-name">
        <string>
            <xsl:value-of select="@name"/>
        </string>
    </xsl:template>
    
<!-- Not yet implemented -->
    <xsl:template match="any" mode="property-name"/>
    
    <xsl:template match="prose" mode="property-name">
        <string>prose</string>
    </xsl:template>
    
    <xsl:template match="model | choice" priority="2" mode="property-name">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="define-field" mode="properties">
        <xsl:apply-templates mode="declaration" select="flag[empty(key)]"/>
        <xsl:variable name="this-key" as="xs:string?">
            <xsl:apply-templates select="." mode="text-key"/>
        </xsl:variable>
        <xsl:if test="matches($this-key, '\S')">
            <map key="{$this-key}">                
                <xsl:call-template name="string-or-array-of-strings"/>
            </map>
        </xsl:if>
    </xsl:template>

    <!--A flag declared as a key or value key gets no declaration since it
    will not show up in the JSON as a separate property -->
    
    <xsl:template mode="declaration" match="flag[exists(value-key|key)]"/>
        
    <xsl:template mode="declaration" match="flag">
        <map key="{(@name,@ref)[1]}">
            <string key="type">string</string>
            <xsl:apply-templates select="formal-name | description"/>
            <xsl:if test="empty(formal-name | description)">
                <xsl:apply-templates select="key('definition-by-name',@ref)/(formal-name | description)"/>
            </xsl:if>
            <xsl:apply-templates select="(valid-values,key('definition-by-name',@ref)/valid-values)[1]"/>    
        </map>
    </xsl:template>
    
    <!-- No restriction is introduced when allow others is 'yes' -->
    <xsl:template match="valid-values[@allow-other='yes']"/>
    
    <xsl:template match="valid-values">
        <xsl:param name="datatype" as="xs:string">string</xsl:param>
        <array key="enum">
            <xsl:apply-templates/>
        </array>
    </xsl:template>
    
    <xsl:template match="valid-values/value">
        <string>
            <xsl:apply-templates select="@name"/>
        </string>
    </xsl:template>

    <!-- irrespective of min-occurs and max-occurs, assemblies and fields designated
         with key flags are represented as objects, never arrays, as the key
         flag serves as a label -->
    <xsl:template mode="declaration" priority="5"
        match="assembly[exists(key('definition-by-name',@ref)/key)] |
               field[exists(key('definition-by-name',@ref)/key)]">
        <xsl:variable name="group-name" select="key('definition-by-name',@ref)/@group-as"/>
        <xsl:message expand-text="yes">{ $group-name }</xsl:message>
        <map key="{ $group-name }">
            <string key="type">object</string>
            <map key="additionalProperties">
                <string key="type">object</string>
                <string key="$ref">#/definitions/{ @ref }</string>
            </map>
        </map>
    </xsl:template>
    
    <!-- Always a map when max-occurs is 1 or implicit -->
    <xsl:template mode="declaration" priority="3"
        match="assembly[empty(@max-occurs) or number(@max-occurs) = 1 ] |
        field[empty(@max-occurs) or number(@max-occurs)= 1 ]">
        <map key="{@ref}">
            <xsl:apply-templates select="key('definition-by-name', @ref)" mode="object-type"/>
            <string key="$ref">#/definitions/{ @ref }</string>
        </map>
    </xsl:template>
    
    <!-- Always an array when min-occurs is greater than 1 -->
    <xsl:template mode="declaration" priority="3" expand-text="yes"
        match="assembly[number(@min-occurs) &gt; 1 ] | field[number(@min-occurs) &gt; 1 ]">
        <map key="{ key('definition-by-name',@ref)/@group-as }">
            <string key="type">array</string>
            <number key="minItems">{ @min-occurs }</number>
            <xsl:if test="@max-occurs != 'unbounded'">
                <number key="maxItems">{ @max-occurs }</number>
            </xsl:if>
            <map key="items">
                <string key="$ref">#/definitions/{ @ref }</string>
            </map>
        </map>
    </xsl:template>
    
    <!-- Now matching when min-occurs is 1 or less, max-occurs is more than 1 -->
    
    <xsl:template mode="declaration" match="assembly | field">
        <map key="{ key('definition-by-name',@ref)/@group-as }">
            <array key="anyOf">
                <map>
                    <string key="type">object</string>
                    <string key="$ref">#/definitions/{ @ref }</string>
                </map>
                <map>
                    <string key="type">array</string>
                    <xsl:if test="@max-occurs != 'unbounded'">
                        <string key="maxItems">{ @max-occurs }</string>
                    </xsl:if>
                    <map key="items">
                        <string key="$ref">#/definitions/{ @ref }</string>
                    </map>
                </map>
            </array>
        </map>
    </xsl:template>

    <xsl:template mode="declaration" match="prose">
        <map key="prose">
            <string key="$ref">#/definitions/prose</string>
        </map>
    </xsl:template>
    
    
    <xsl:template match="*" mode="object-type">
        <string key="type">object</string>
            </xsl:template>

    <xsl:template match="define-field" mode="object-type">
        <string key="type">string</string>
    </xsl:template>
    
    <xsl:template match="define-field[@as='boolean']" mode="object-type">
        <string key="type">boolean</string>
    </xsl:template>
    
    
    <xsl:template match="prose" name="prose"/>
    

</xsl:stylesheet>
