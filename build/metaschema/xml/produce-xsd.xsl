<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs math m"
    version="2.0"
    
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    
<!-- Purpose: Produce an XSD Schema representing constraints declared in a netaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSD, with embedded documentation -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    
    <xsl:strip-space elements="METASCHEMA define-assembly define-field define-flag model choice valid-values remarks xs:*"/>
    
    <!--<xsl:variable name="home"   select="/"/>
    <xsl:variable name="abroad" select="//import/@href/document(.)"/>-->
    
    <!--<xsl:variable name="home" select="/"/>-->
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:variable name="declaration-prefix" select="string(/METASCHEMA/short-name)"/>
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly"
        use="@name"/>

    <!-- Produces $composed-metaschema -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    
    
    <!-- entry template -->
    <xsl:template match="/">       
        <!-- $unwired has the schema with no namespaces -->
        <xsl:variable name="unwired">
            <xsl:apply-templates/>
        </xsl:variable>
        <!--<xsl:copy-of select="$unwired"/>-->
        <!-- mode 'wire-ns' wires up the namespaces -->
        <xsl:apply-templates select="$unwired" mode="wire-ns"/>
    </xsl:template>

    <xsl:template match="/" mode="debug">       
            <xsl:apply-templates/>
    </xsl:template>
    
    <!--MAIN ACTION HERE -->
    
    <xsl:template match="/METASCHEMA">
        <xs:schema elementFormDefault="qualified" targetNamespace="{ $target-namespace }">
            <xsl:for-each select="$composed-metaschema/METASCHEMA/schema-version">
                <xsl:attribute name="version" select="normalize-space(.)"/>
            </xsl:for-each>
            <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>
            <!--<xsl:apply-templates select="*"/>-->
            
            <xsl:if test="exists($composed-metaschema//prose)">
                <xs:group name="prose">
                    <xs:choice>
                        <xs:element ref="oscal-prose:h1"/>
                        <xs:element ref="oscal-prose:h2"/>
                        <xs:element ref="oscal-prose:h3"/>
                        <xs:element ref="oscal-prose:h4"/>
                        <xs:element ref="oscal-prose:h5"/>
                        <xs:element ref="oscal-prose:h6"/>
                        <xs:element ref="oscal-prose:p"/>
                        <xs:element ref="oscal-prose:ul"/>
                        <xs:element ref="oscal-prose:ol"/>
                        <xs:element ref="oscal-prose:pre"/>
                        <xs:element ref="oscal-prose:table"/>
                    </xs:choice>
                </xs:group>
                <xsl:apply-templates mode="acquire-prose"
                    select="document('oscal-prose-module.xsd')"/>
            </xsl:if>
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
    
    <xsl:template match="field | assembly">
        <xs:element minOccurs="{ number(@required = 'yes') }" ref="{$declaration-prefix}:{@named}"/>
    </xsl:template>
    
<!-- Will not match declaration elements, which do not have @named -->
    <xsl:template priority="5" match="fields | assemblies">
        <xs:element maxOccurs="unbounded" minOccurs="{ number(@required = 'yes') }" ref="{$declaration-prefix}:{@named}"/>
    </xsl:template>

    
    <xsl:template match="define-field">
        <xs:element name="{@name }">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType mixed="true">
                <xsl:if test="@as='mixed'">
                    <xs:group ref="{$declaration-prefix}:everything-inline"/>
                </xsl:if>
                
                <xsl:apply-templates select="key | flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="define-field[@as='boolean']">
        <xs:element name="{@name }" type="xs:boolean">
            <xsl:apply-templates select="." mode="annotated"/>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="define-assembly">
        <xs:element name="{@name}">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType>
                <xsl:apply-templates select="model"/>
                <xsl:apply-templates select="key | flag"/>
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
    
    
    <xsl:template match="flag | key">
        <xsl:variable name="name" select="@name"/>
        <xsl:variable name="datatype" select="(@datatype,key('definition-by-name',@name)/@datatype)[1]"/>
        <xsl:variable name="value-list" select="(valid-values,key('definition-by-name',@name)/valid-values)[1]"/>
        <xs:attribute name="{ @name }">
            <!-- required if declared as required, a key, or a value-key with no fallback (value) -->
            <xsl:if test="(@required='yes') or exists(self::key|child::value-key)">
                <xsl:attribute name="use">required</xsl:attribute>
            </xsl:if>
            <!-- annotate as datatype or string unless an exclusive value-list is given -->
            <xsl:for-each select="($datatype,'string')[1][not($value-list/@allow-other='yes')]">
                <xsl:attribute name="type" expand-text="true">xs:{ . }</xsl:attribute>
            </xsl:for-each>
            <xsl:apply-templates select="/*/define-flag[@name=$name]" mode="annotated"/>
            <xsl:apply-templates select="$value-list">
                <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:apply-templates>
        </xs:attribute>
    </xsl:template>

    <!-- No restriction is introduced when allow others is 'yes' -->
    <xsl:template match="valid-values[@allow-other='yes']"/>
        
    <xsl:template match="valid-values">
        <xsl:param name="datatype" as="xs:string">string</xsl:param>
        <xs:simpleType>
            <xs:restriction base="xs:{$datatype}">
                <xsl:apply-templates/>
            </xs:restriction>
        </xs:simpleType>
    </xsl:template>
    
    <xsl:template match="valid-values/value">
        <xs:enumeration value="{@name}">
            <xsl:if test="matches(.,'\S')">
                <xs:annotation>
                    <xs:documentation>
                        
                    <p>
                        <xsl:apply-templates/>
                    </p>
                    </xs:documentation>
                </xs:annotation>
            </xsl:if>
        </xs:enumeration>
    </xsl:template>
    
    
    <xsl:mode name="acquire-prose" on-no-match="shallow-copy"/>
    
    <xsl:template match="comment() | processing-instruction()" mode="acquire-prose"/>
    
    <xsl:template match="xs:schema" mode="acquire-prose">
            <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
<!-- dropping top level (placeholder) 'prose' element declaration and its complexType -->
    <xsl:template match="xs:schema/xs:element[@name='prose'] | xs:schema/xs:complexType[@name='prose']" mode="acquire-prose"/>
    
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
    
    <xsl:template match="xs:documentation//text()" mode="wire-ns">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="text()" mode="wire-ns"/>
        
</xsl:stylesheet>