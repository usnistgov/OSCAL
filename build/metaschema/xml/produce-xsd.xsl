<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs math m"
    version="3.0"
    
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    
<!-- Purpose: Produce an XSD Schema representing constraints declared in a netaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSD, with embedded documentation -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!--<xsl:variable name="home"   select="/"/>
    <xsl:variable name="abroad" select="//import/@href/document(.)"/>-->
    
    <xsl:variable name="home" select="/"/>
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:variable name="declaration-prefix" select="string(/METASCHEMA/short-name)"/>
    
    <xsl:key name="declarations-by-name"
        match="define-field | define-assembly | define-flag" use="@name"/>
    
    <xsl:template match="/">
        <!--<xsl:apply-templates/>-->       
        <!-- $unwired has the schema with no namespaces -->
        <xsl:variable name="unwired">
            <xsl:apply-templates/>
        </xsl:variable>
        <!--<xsl:copy-of select="$unwired"/>-->
        <!-- mode 'wire-ns' wires up the namespaces -->
        <xsl:apply-templates select="$unwired" mode="wire-ns"/>
    </xsl:template>
    
    <xsl:template match="/METASCHEMA">
        <xs:schema elementFormDefault="qualified" targetNamespace="{ $target-namespace }">

            <xsl:apply-templates/>

            <xs:group name="prose">
                <xs:choice>
                    <xs:element ref="{$declaration-prefix}:p"/>
                    <xs:element ref="{$declaration-prefix}:ul"/>
                    <xs:element ref="{$declaration-prefix}:ol"/>
                    <xs:element ref="{$declaration-prefix}:pre"/>
                </xs:choice>
            </xs:group>

            <xsl:apply-templates mode="acquire-prose" select="document('oscal-prose-module.xsd')"/>

        </xs:schema>
    </xsl:template>
    
    <xsl:template match="namespace"/>
        
    <xsl:template match="/METASCHEMA/schema-name">
        <xsl:comment>
            <xsl:apply-templates/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="/METASCHEMA/short-name">
        <xsl:comment>short name: <xsl:apply-templates/></xsl:comment>
    </xsl:template>
    
    <xsl:template match="/METASCHEMA/remarks/*">
        <xsl:comment>
            <xsl:apply-templates/>
        </xsl:comment>
    </xsl:template>
    
    <xsl:template match="*[matches(@named,'\S')]">
        <xs:element minOccurs="{ number(@required = 'yes') }" ref="{$declaration-prefix}:{@named}"/>
    </xsl:template>
    
<!-- Will not match declaration elements, which do not have @named -->
    <xsl:template priority="5" match="*[matches(@named,'\S')][matches(@group-as,'\S')]">
        <xs:element maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }" ref="{$declaration-prefix}:{@named}"/>
    </xsl:template>

    <!-- @acquire-from indicates the model is elsewhere ... -->
    <xsl:template
        match="define-assembly[exists(@acquire-from)] |
               define-field[exists(@acquire-from)] |
               define-flag[exists(@acquire-from)]"
        expand-text="true">
        <xsl:variable name="defining" select="@name"/>
        <xsl:variable name="module" select="@acquire-from"/>
        <xsl:variable name="definition"
            select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, .))"/>
        <xsl:choose>
            <xsl:when test="not(root() is $home )">
                <xsl:comment> Schema definitions cannot be imported indirectly: check { local-name() || '[@name=''' || $defining || ''']'} acquired from '{ $module }' at { /METASCHEMA/import[@name=$module]/@href } </xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$definition"/>
                <xsl:if test="empty($definition)">
                    <xsl:comment> No definition found for { $defining } in { $module } at { /METASCHEMA/import[@name=$module]/@href }</xsl:comment>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="define-field">
        <xs:element name="{@name }">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType mixed="true">
                <xsl:if test="@as='mixed'">
                    <xs:group ref="{$declaration-prefix}:everything-inline"/>
                </xsl:if>
                
                <!-- picking up attribute declarations -->
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="define-assembly">
        <xs:element name="{@name}">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType>
                <xsl:apply-templates select="model"/>
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>

    <xsl:template match="define-flag"/>

    <xsl:template mode="annotated" priority="5"
        match="define-flag[empty(formal-name | description)] |
        define-field[empty(formal-name | description)] |
        define-assembly[empty(formal-name | description)]"/>

    <xsl:template mode="annotated" match="*"/>
    
    <xsl:template match="define-flag | define-field | define-assembly" mode="annotated">
        <xs:annotation>
            <xs:documentation>
                <xsl:apply-templates select="formal-name, description"/>
            </xs:documentation>
        </xs:annotation>
    </xsl:template>
    
    <xsl:template match="formal-name">
        <b><xsl:apply-templates/>: </b>
    </xsl:template>
    
    
    <xsl:template match="model">
        <xs:sequence>
            <xsl:apply-templates/>
        </xs:sequence>
    </xsl:template>
    
    <xsl:template match="choice">
        <xs:choice>
            <xsl:apply-templates/>
        </xs:choice>
    </xsl:template>
    
    <xsl:template match="prose">
        <xs:group ref="{$declaration-prefix}:prose" maxOccurs="unbounded" minOccurs="0"/>
    </xsl:template>
    
    
    <xsl:template match="flag">
        <xsl:variable name="name" select="@name"/>
        <xs:attribute name="{ @name }" type="xs:string">
            <xsl:for-each select="@required[.='yes']">
                <xsl:attribute name="use">required</xsl:attribute>
            </xsl:for-each>
            <xsl:for-each select="@datatype">
                <xsl:attribute name="type" expand-text="true">xs:{ . }</xsl:attribute>
            </xsl:for-each>
            
            <xsl:apply-templates select="/*/define-flag[@name=$name]" mode="annotated"/>
        </xs:attribute>
    </xsl:template>

    <xsl:mode name="acquire-prose" on-no-match="shallow-copy"/>
    
    <xsl:template match="comment() | processing-instruction()" mode="acquire-prose"/>
    
    <xsl:template match="xs:schema" mode="acquire-prose">
            <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
<!-- dropping placeholder 'prose' element declaration -->
    <xsl:template match="xs:schema/xs:element[@name='prose']" mode="acquire-prose"/>
    
    <xsl:template match="comment()" mode="wire-ns">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="*" mode="wire-ns">
        <xsl:copy copy-namespaces="no"> 
            <xsl:namespace name="{$declaration-prefix}" select="$target-namespace"/>
            <xsl:namespace name="oscal-prose" select="$target-namespace"/>
            <xsl:copy-of select="@*"/>
           <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>