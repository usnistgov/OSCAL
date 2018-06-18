<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0" xmlns="http://www.w3.org/2005/xpath-functions"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0" expand-text="true">

    <xsl:strip-space elements="METASCHEMA define-assembly define-field model"/>
    
    <xsl:output indent="yes" method="xml"/>
    
    <xsl:template match="/" priority="2">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly"
        use="@name"/>

    <xsl:template match="/METASCHEMA" expand-text="true">
        <xsl:variable name="top-group" select="@top"/>
        <xsl:variable name="top-each" select="@use"/>
        <map>
            <string key="$schema">http://json-schema.org/draft-07/schema#</string>
            <string key="$id">http://csrc.nist.gov/ns/oscal/1.0/{ short-name}-schema.json</string>
            <xsl:for-each select="schema-name">
              <string key="$comment">{ . }: JSON Schema</string>
            </xsl:for-each>
            <string key="type">object</string>
            <map key="definitions">
                <xsl:apply-templates/>
                <map key="prose">
                    <string key="type">array</string>
                    <map key="items">
                        <string key="type">string</string>
                    </map>
                </map>
            </map>           
        <map key="properties">
            <!--<xsl:apply-templates mode="properties"/>-->
            <map key="{$top-each}">
                <string key="$ref">#/definitions/{ $top-each }</string>
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

   <xsl:template match="METASCHEMA/schema-name | METASCHEMA/remarks"/>
   <xsl:template match="define-flag"/>
    
    <xsl:template match="define-assembly | define-field">
        <map key="{ @name (: @group-as | @name[empty(../@group-as)] :) }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <string key="type">object</string>
            <map key="properties">
                <xsl:apply-templates select="." mode="default-attributes"/>
                <xsl:apply-templates select="." mode="properties"/>
            </map>
            <boolean key="additionalProperties">false</boolean>
            <map key="propertyNames">
                <array key="enum">
                    <xsl:if test="not(@has-id='none') and not(flag/@name='id')"><string>id</string></xsl:if>
                    <xsl:apply-templates select="." mode="text-property"/>
                    <xsl:apply-templates select="flag, model" mode="property-name"/>
                </array>
            </map>
        </map>
    </xsl:template>
    
    <xsl:template match="*" mode="text-property"/>
    
    <xsl:template match="define-field"              mode="text-property"><string>STRVALUE</string></xsl:template>
    <xsl:template match="define-field[@as='mixed']" mode="text-property"><string>RICHTEXT</string></xsl:template>
    

    <xsl:template match="define-assembly[matches(@address,'\S')] | define-field[matches(@address,'\S')]">
        <map key="{ @group-as }">
            <string key="$id">#/definitions/{@group-as}</string>
            <string key="type">object</string>
            <map key="additionalProperties">
                <string key="type">object</string>
                <string key="$ref">#/definitions/{ @name }</string>
            </map>
        </map>
        <map key="{ @name }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <string key="type">object</string>
            <map key="properties">
                <xsl:apply-templates select="." mode="default-attributes"/>
                <xsl:apply-templates select="." mode="properties"/>
            </map>
            <map key="propertyNames">
                <array key="enum">
                    <xsl:if test="not(@has-id='none') and not(flag/@name='id')"><string>id</string></xsl:if>
                    <xsl:apply-templates select="." mode="text-property"/>
                    <xsl:apply-templates select="flag, model" mode="property-name"/>
                </array>
            </map>
        </map>
    </xsl:template>
    
    
    <xsl:template match="define-field[empty(model/*) and (@has-id = 'none')]">
        <map key="{ @name (: @group-as | @name[empty(../@group-as)] :) }">
            <xsl:apply-templates select="formal-name, description"/>
            <string key="$id">#/definitions/{@name}</string>
            <string key="type">string</string>
        </map>
    </xsl:template>

    <!-- Supervene key here when declaration has label="id"?       -->

    <xsl:template match="define-assembly" mode="properties">
        <xsl:apply-templates mode="declaration" select="flag, model"/>
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
    
    <xsl:template match="*" mode="property-name">
        <string>
            <xsl:value-of select="(@group-as,@named,@name)[1]"/>
        </string>
    </xsl:template>
    
    <xsl:template match="prose" mode="property-name">
        <string>prose</string>
    </xsl:template>
    
    <xsl:template match="model | choice" priority="2" mode="property-name">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as = 'mixed']" mode="properties">
        <xsl:apply-templates mode="declaration" select="flag, model"/>
        <map key="RICHTEXT">
            <string key="type">string</string>
        </map>
    </xsl:template>

    <xsl:template match="define-field" mode="properties">
        <xsl:apply-templates mode="declaration" select="flag, model"/>
        <map key="STRVALUE">
            <string key="type">string</string>
        </map>
    </xsl:template>

    <xsl:template mode="default-attributes" match="*">
        <xsl:if test="not(@has-id = 'none') and not(flag/@name = 'id')">
            <map key="id">
                <string key="type">string</string>
            </map>
        </xsl:if>
    </xsl:template>

    <!-- How to express a required attribute or element in JSON schema? -->
    <xsl:template mode="default-attributes" match="*[@has-id = 'none']"/>

    <xsl:template mode="declaration" match="flag">
        <map key="{@name}">
            <string key="type">string</string>
        </map>
    </xsl:template>


    <xsl:template mode="declaration" match="assemblies | fields">
        <map key="{ @group-as }">
            <string key="type">array</string>
            <map key="items">
                <string key="$ref">#/definitions/{ @named }</string>
            </map>
        </map>
    </xsl:template>

    <xsl:template mode="declaration" match="assemblies[matches(@address,'\S')] | fields[matches(@address,'\S')]">
        <map key="{ @group-as }">
            <string key="type">object</string>
            <string key="$ref">#/definitions/{ @group-as }</string>
        </map>
    </xsl:template>

    <xsl:template match="*" mode="object-type">
        <string key="type">object</string>
        
    </xsl:template>

    <xsl:template match="define-field[empty(model/*) and (@has-id = 'none')]" mode="object-type">
        <string key="type">string</string>
    </xsl:template>

    <xsl:template mode="declaration" match="assembly | field">

        <map key="{@named}">
            <xsl:apply-templates select="key('definition-by-name', @named)" mode="object-type"/>
            <string key="$ref">#/definitions/{ @named }</string>
        </map>
    </xsl:template>

    <xsl:template mode="declaration" match="prose">
        <map key="prose">
            <string key="$ref">#/definitions/prose</string>
        </map>
    </xsl:template>


    <xsl:template match="prose" name="prose"/>
    <!--<xsl:template match="prose" name="prose">
        <map key="prose">
            <string key="type">array</string>
            <map key="items">
                <xsl:comment>can't be right</xsl:comment>
                <string key="$ref">#/definitions/prose</string>
            </map>
        </map>
    </xsl:template>-->

</xsl:stylesheet>