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

<!-- nb The schema and Schematron for the metaschema format is essential
        for validating constraints assumed by this transformation. -->

    <xsl:output indent="yes"/>

<!-- Including XSD namespace for post process -->
    <xsl:strip-space elements="METASCHEMA define-assembly define-field define-flag model choice allowed-values remarks xs:*"/>
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:variable name="declaration-prefix" select="string(/METASCHEMA/short-name)"/>
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly"
        use="@name"/>

    <!-- Produces $composed-metaschema -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    
    <!-- Produces intermediate results, w/o namespace alignment -->
    <!-- entry template -->
    
    <xsl:param name="debug" select="'no'"/>
    
    <!--<xsl:template match="/">
        <xsl:apply-templates select="/METASCHEMA"/>
    </xsl:template>-->
    
    <xsl:template match="/">
        <xsl:variable name="unwired">
            <xsl:call-template name="build-schema"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="$debug = 'yes'">
                <xsl:message>Running in 'debug' to show intermediate results</xsl:message>
                <xsl:sequence select="$unwired"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$unwired" mode="wire-ns"/>
            </xsl:otherwise>
        </xsl:choose>
        <!-- $unwired has the schema with no namespaces -->

        <!--<xsl:copy-of select="$unwired"/>-->
        <!-- mode 'wire-ns' wires up the namespaces -->

    </xsl:template>

    <!--MAIN ACTION HERE -->
    
    <xsl:template name="build-schema">
        <xs:schema elementFormDefault="qualified" targetNamespace="{ $target-namespace }">
            <xsl:for-each select="$composed-metaschema/METASCHEMA/schema-version">
                <xsl:attribute name="version" select="normalize-space(.)"/>
            </xsl:for-each>
            <xs:annotation>
                <xs:appinfo>
                    <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*" mode="header-documentation"/>
                    <m:root>
                        <xsl:value-of select="/METASCHEMA/@root"/>
                    </m:root>
                </xs:appinfo>
            </xs:annotation>
            <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>
            
            <xsl:if test="$composed-metaschema//@as-type = ('markup-line', 'markup-multiline')">
                <xsl:if test="$composed-metaschema//@as-type = 'markup-multiline'">
                    <xs:group name="PROSE">
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
                </xsl:if>
                <xsl:apply-templates mode="acquire-prose" select="document('oscal-prose-module.xsd')"/>
            </xsl:if>
            <xsl:variable name="all-types" select="$composed-metaschema//@as-type"/>
            
            <xsl:copy-of select="$types-library/xs:simpleType[@name = $all-types]"/>
        </xs:schema>
    </xsl:template>
    
    <xsl:variable name="types-library" select="document('oscal-datatypes.xsd')/*"/>
    
    <xsl:template match="namespace"/>
        
    <xsl:template mode="header-documentation" match="*"/>
    
    <xsl:template mode="header-documentation" match="/METASCHEMA/schema-name | /METASCHEMA/short-name |
        /METASCHEMA/schema-version | /METASCHEMA/remarks">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="/METASCHEMA/schema-name | /METASCHEMA/short-name |
        /METASCHEMA/schema-version | /METASCHEMA/remarks"/>
    
<!-- Produces an element for markup-line and markup-multiline -->
    
    <xsl:template match="define-field">
        <xs:element name="{@name }">
            <xsl:apply-templates select="." mode="annotated"/>
            <xsl:variable name="datatype">
                <xsl:choose>
                    <xsl:when test="exists(allowed-values)">
                        <xsl:value-of select="concat(@name,'-enumeration')"/>
                    </xsl:when>
                    <xsl:when test="exists(@as-type)">
                        <xsl:value-of select="@as-type"/>
                    </xsl:when>
                    <xsl:otherwise>string</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xs:complexType>
                <xs:simpleContent>
                    <xs:extension base="xs:string">
                        <!-- replace @base with correct base for type -->
                        <xsl:call-template name="assign-datatype">
                            <xsl:with-param name="assign-to-attribute">base</xsl:with-param>
                            <xsl:with-param name="datatype" select="$datatype"/>
                        </xsl:call-template>
                        <xsl:apply-templates select="flag"/>
                    </xs:extension>
                    <!--<xs:restriction base="xs:string">
                        <!-\- overriding @base when a nominal type is given -\->
                        <xsl:apply-templates select="allowed-values"/>
                    </xs:restriction>-->
                </xs:simpleContent>
                           
            </xs:complexType>
        </xs:element>
        <xsl:apply-templates select="allowed-values">
            <xsl:with-param name="simpletype-name" select="@name || '-enumeration'"/>
        </xsl:apply-templates>
        <!--<xsl:if test="exists(allowed-values)">
            <xs:simpleType name="{@name}-enumeration">
                <xs:restriction base="xs:string">
                    <xsl:apply-templates select="allowed-values/*"/>
                </xs:restriction>
            </xs:simpleType>
        </xsl:if>-->
    </xsl:template>

    <!--<xsl:template priority="3" match="define-field[exists(@as-type)]">
        <xs:element name="{@name }">
            <xsl:call-template name="assign-type">
                <xsl:with-param name="datatype" select="$type"/>
            </xsl:call-template>
            <xsl:apply-templates select="." mode="annotated"/>
            <xsl:apply-templates select="allowed-values">
                <xsl:with-param name="datatype" select="@as-type"/>
            </xsl:apply-templates>
        </xs:element>
    </xsl:template>-->
    <xsl:template priority="5" match="define-field[@as-type='empty']">-
        <xs:element name="{@name }">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType>
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template priority="5" match="define-field[@as-type='markup-line']">
        <xs:element name="{@name }">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType mixed="true">
                <xs:group ref="{$declaration-prefix}:everything-inline"/>
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template priority="5" match="define-field[@as-type='markup-multiline']">
        <xs:element name="{@name}">
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType mixed="true">
                <xs:group ref="{$declaration-prefix}:PROSE"/>
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template priority="6" match="define-field[@as-type='markup-multiline'][not(@in-xml='WITH_WRAPPER')]"/>
    
    <xsl:template match="define-assembly">
        <xsl:variable name="whose" select="."/>
        <xs:element name="{@name}">
            <xsl:if test="@name = /*/@root">
                <xsl:attribute name="m:root" namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0">yes</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="." mode="annotated"/>
            <xs:complexType>
                <xsl:apply-templates select="model"/>
                <xsl:apply-templates select="flag"/>
            </xs:complexType>
            <!-- producing xs:unique to govern attributes that will be promoted to keys -->
            <!-- this works over and above XSD type validation e.g. ID -->
            <xsl:for-each select="model//*[group-as/@in-json='BY_KEY'][not(group-as/@in-xml='GROUPED')]">
                <xsl:apply-templates select="key('definition-by-name',@ref)/json-key" mode="uniqueness-constraint">
                        <xsl:with-param name="whose" select="$whose"/>
                </xsl:apply-templates>
            </xsl:for-each>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="json-key" mode="uniqueness-constraint">
        <xsl:param name="whose"/>
        <xs:unique name="{ $whose/@name}-{ ../@name }-keys">
            <xs:selector xpath="{ $declaration-prefix}:{../@name }"/>
            <xs:field xpath="@{ @flag-name }"/>
        </xs:unique>
    </xsl:template>

    <!-- Flags become attributes; this schema defines them all locally. -->
    <xsl:template match="define-flag"/>

    <!-- Extra coverage -->
    <xsl:template mode="annotated" priority="5"
        match="define-flag[empty(formal-name | description)] |
        define-field[empty(formal-name | description)] |
        define-assembly[empty(formal-name | description)] |
        flag[empty(formal-name | description)]"/>

    <xsl:template mode="annotated" match="*"/>
    
    <xsl:template match="define-flag | define-field | define-assembly | flag[exists(formal-name| description)]" mode="annotated">
        <xs:annotation>
            <xs:appinfo>
                <xsl:copy-of select="formal-name, description"/>
            </xs:appinfo>
            <xs:documentation>
                <xsl:apply-templates select="formal-name, description"/>
            </xs:documentation>
        </xs:annotation>
    </xsl:template>
    
    <xsl:template match="formal-name">
        <b><xsl:apply-templates/></b>
        <xsl:for-each select="../description">: </xsl:for-each>
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

    <xsl:template match="field | assembly">
        <xs:element ref="{$declaration-prefix}:{@ref}"
            minOccurs="{ if (exists(@min-occurs)) then @min-occurs else 0 }"
            maxOccurs="{ if (exists(@max-occurs)) then @max-occurs else 1 }"/>
    </xsl:template>
    
    <xsl:template priority="5" match="field[group-as/@in-xml='GROUPED'] | assembly[group-as/@in-xml='GROUPED']">
        <xs:element name="{group-as/@name}"
            minOccurs="{ if (@min-occurs != '0') then 1 else 0 }"
            maxOccurs="1">
            <xsl:variable name="decl" select="key('definition-by-name',@ref)"/>
            <xsl:apply-templates select="$decl" mode="annotated"/>
            <xs:complexType>
                <xs:sequence>
                  <xsl:next-match/>
                </xs:sequence>
            </xs:complexType>
            <xsl:apply-templates select="$decl/json-key" mode="uniqueness-constraint">
                <xsl:with-param name="whose" select="ancestor::define-assembly"/>
            </xsl:apply-templates>
        </xs:element>
    </xsl:template>
    
    <!-- TODO XXX switch default behavior ...   -->
    <!-- No wrapper, just prose elements -->
    <xsl:template match="field[@in-xml='UNWRAPPED'][key('definition-by-name',@ref)/@as-type='markup-multiline']">
        <xs:group ref="{$declaration-prefix}:PROSE" maxOccurs="unbounded" minOccurs="0"/>
    </xsl:template>
    
    <!-- With wrapper -->
    <xsl:template match="field[not(@in-xml='UNWRAPPED')][key('definition-by-name',@ref)/@as-type='markup-multiline']">
        <xs:element name="{@ref}"
            minOccurs="{ if (exists(@min-occurs)) then @min-occurs else 0 }"
            maxOccurs="{ if (exists(@max-occurs)) then @max-occurs else 1 }">
          <xsl:apply-templates select="key('definition-by-name',@ref)" mode="annotated"/>
            <xs:complexType>
              <xs:group ref="{$declaration-prefix}:PROSE" maxOccurs="unbounded" minOccurs="0"/>
            </xs:complexType>
        </xs:element>
    </xsl:template>
    
    <xsl:template match="flag">
        <xsl:variable name="datatype" select="(@as-type,key('definition-by-name',@ref)/@as-type,'string')[1]"/>
        <xsl:variable name="value-list" select="(allowed-values,key('definition-by-name',@ref)/allowed-values)[1]"/>
        <xs:attribute name="{ (@name,@ref)[1] }">
            <xsl:if test="(@required='yes') or (@name=(../json-key/@flag-name,../json-value-key/@flag-name))">
                <xsl:attribute name="use">required</xsl:attribute>
            </xsl:if>
            <!-- annotate as datatype or string unless an exclusive value-list is given -->
            <xsl:if test="empty($value-list)">
                <!-- overriding string datatype on attribute -->
                <xsl:call-template name="assign-datatype">
                    <xsl:with-param name="datatype" select="$datatype"/>
                </xsl:call-template>
            </xsl:if>
            
            <xsl:apply-templates select=".[exists(@name)] | key('definition-by-name',@ref)" mode="annotated"/>
            <xsl:apply-templates select="$value-list">
                <xsl:with-param name="datatype" select="$datatype"/>
            </xsl:apply-templates>
        </xs:attribute>
    </xsl:template>
    
    <xsl:template name="assign-datatype">
        <xsl:param name="assign-to-attribute" as="xs:string?">type</xsl:param>
        <xsl:param name="datatype"/>
        <xsl:variable name="oscal-types" select="$datatype[. = $types-library/xs:simpleType/@name]"/>
        <xsl:for-each select="$oscal-types">
            <xsl:attribute name="{ $assign-to-attribute }" expand-text="true"
                select="concat($declaration-prefix, ':', .)"/>
        </xsl:for-each>
        <xsl:variable name="xsd-types" select="$datatype[. = $types-library/xs:annotation[@id='built-in-types']/xs:appinfo/xs:simpleType/@name]"/>
        <xsl:for-each select="$xsd-types">
            <xsl:attribute name="{ $assign-to-attribute }" expand-text="true" select="concat('xs:', .)"/>
        </xsl:for-each>
        <xsl:if test="empty(($oscal-types,$xsd-types))">
            <xsl:attribute name="{ $assign-to-attribute }" expand-text="true"
                select="concat($declaration-prefix, ':', $datatype)"/>
        </xsl:if>
        
    </xsl:template>

    <!-- When allow-other=yes, we union the enumeration with the declared datatype -->        
    <xsl:template match="allowed-values[@allow-other='yes']">
        <xsl:param name="datatype" as="xs:string">string</xsl:param>
        <xsl:param name="simpletype-name" as="xs:string?"/>
        <xs:simpleType>
            <xsl:for-each select="$simpletype-name">
                <xsl:attribute name="name">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xs:union memberTypes="xs:{$datatype}">
                <xsl:call-template name="assign-datatype">
                    <xsl:with-param name="datatype" select="$datatype"/>
                    <xsl:with-param name="assign-to-attribute">memberTypes</xsl:with-param>
                </xsl:call-template>
                <xs:simpleType>
                    <xs:restriction base="xs:{$datatype}">
                        <xsl:call-template name="assign-datatype">
                            <xsl:with-param name="datatype" select="$datatype"/>
                            <xsl:with-param name="assign-to-attribute">base</xsl:with-param>
                        </xsl:call-template>
                        <xsl:apply-templates/>
                    </xs:restriction>
                </xs:simpleType>
            </xs:union>
        </xs:simpleType>
    </xsl:template>
    
    <xsl:template match="allowed-values">
        <xsl:param name="datatype" select="(../@as-type,'string')[1]"/>
        <xsl:param name="simpletype-name" as="xs:string?"/>
        <xs:simpleType>
            <xsl:for-each select="$simpletype-name">
                <xsl:attribute name="name">
                    <xsl:value-of select="."/>
                </xsl:attribute>
            </xsl:for-each>
            <xs:restriction base="xs:{$datatype}">
                <xsl:apply-templates/>
            </xs:restriction>
        </xs:simpleType>
    </xsl:template>
    
    <xsl:template match="allowed-values/enum">
        <xs:enumeration value="{@value}">
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
    
    <!-- Mode 'wire-ns' wires up namespaces, bringing the prose module into the same namespace as the main
     schema, and cleaning up declarations and names as it goes. -->
    <xsl:template match="comment()" mode="wire-ns">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="*" mode="wire-ns">
        <xsl:copy copy-namespaces="no"> 
            <xsl:namespace name="m">http://csrc.nist.gov/ns/oscal/metaschema/1.0</xsl:namespace>
            <xsl:namespace name="{$declaration-prefix}" select="$target-namespace"/>
            <xsl:namespace name="oscal-prose" select="$target-namespace"/>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="m:*" mode="wire-ns" xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0">
        <xsl:element name="m:{local-name()}">
            <xsl:namespace name="m">http://csrc.nist.gov/ns/oscal/metaschema/1.0</xsl:namespace>
            <xsl:namespace name="{$declaration-prefix}" select="$target-namespace"/>
            <xsl:namespace name="oscal-prose" select="$target-namespace"/>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="xs:documentation//text() | m:*//text()" mode="wire-ns">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="text()" mode="wire-ns"/>
        
</xsl:stylesheet>