<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math oscal"
    xpath-default-namespace="http://www.w3.org/2001/XMLSchema"
    version="3.0">
    
<!-- For preprocessing XSDs. -->
    <xsl:output indent="yes"/>
        
    <xsl:strip-space elements="*"/>
    
    <xsl:mode default-mode="explode" name="explode" on-no-match="shallow-copy"/>
    <xsl:mode name="echo" on-no-match="shallow-copy"/>
    
    <xsl:template match="annotation" mode="echo"/>
    
    <xsl:template name="fallback">
        <xsl:param name="from"/>
        <xsl:if test="empty($from)">
        <fallback>
            <xsl:apply-templates select="." mode="echo"/>
        </fallback>
        </xsl:if>
    </xsl:template>
    
<!-- With $who any element inside a schema, returns the entire schema plus its
     imported and included modules. -->
    <xsl:function name="oscal:assemble-schema" as="document-node()">
        <xsl:param name="who" as="element()?"/>
        <xsl:document>
            <xsl:apply-templates select="$who/root()/schema" mode="assemble-schema"/>
        </xsl:document>
    </xsl:function>
    
    <xsl:template match="schema" mode="assemble-schema">
        <xsl:sequence select="."/>
        <xsl:if test="exists(document-uri(/))">
            
        <xsl:apply-templates select="import | include" mode="#current">
            <xsl:with-param name="top" select="document-uri(/)" tunnel="yes"/>
        </xsl:apply-templates>
        </xsl:if>
        
    </xsl:template>
    
    <xsl:template match="import | include" mode="assemble-schema" expand-text="true">
        <xsl:param name="top" as="xs:anyURI?" tunnel="yes"/>
        <!--<xsl:message>
            <!-\-@schemaLocation is { @schemaLocation }-\->
            document(@schemaLocation)/*/name() is { document(@schemaLocation)/*/name() }
            
           }
        </xsl:message>-->
        <xsl:if test="empty(document(@schemaLocation))">
            <xsl:message>
                <xsl:value-of select="$top"/>
            document URI is { document-uri(/) }
               {  }</xsl:message>
        </xsl:if>
        <xsl:for-each select="document(@schemaLocation,root())">
          <xsl:sequence select="."/>
          <xsl:apply-templates select="import | include" mode="#current"/>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:key name="element-by-attributeGroups" match="xs:element" use="descendant::xs:attributeGroup/@ref except .//xs:element//xs:attributeGroup/@ref"/>
    
    <xsl:key name="attributeGroup-by-attributeGroups" match="xs:attributeGroup" use="descendant::xs:attributeGroup/@ref"/>
    
    
    
    <xsl:key name="element-by-type" match="xs:element[@type]"   use="@ref"/>
    
    
    <xsl:function name="oscal:elements-for-attribute-declaration" as="element(xs:element)*">
        <xsl:param name="att" as="element(xs:attribute)"/>
        <!--<xsl:variable name="scope" select="oscal:elements-for-attribute-declaration(.)"/>-->
        <!-- placeholder XXX --><xsl:variable name="scope" select="$att"/>
        <xsl:sequence select="$att ! ( ancestor::xs:element[1],
            ancestor::xs:complexType/key('element-by-type',('oscal:' || @type),$scope ),
            ancestor::xs:attributeGroup/key('element-by-attributeGroups',('oscal:' || @name),$scope ),
            ancestor::xs:attributeGroup/
              key('attributeGroup-by-attributeGroups',('oscal:' || @name),$scope)/
              key('element-by-attributeGroups',('oscal:' || @name),$scope ),
            ancestor::xs:attributeGroup/
              key('attributeGroup-by-attributeGroups',('oscal:' || @name),$scope)/
                ancestor::xs:complexType/key('element-by-type',('oscal:' || @type),$scope ) 
            )"/>
    </xsl:function>
    
    <xsl:key name="attributes-by-group" match="attributeGroup/attribute" use="'oscal:' || ../@name"/>
    
    <xsl:key name="inside-group" match="group[exists(@name)]/*" use="'oscal:' || ../@name"/>
    
    <xsl:key name="inside-complexType-by-name" match="complexType[exists(@name)]/*" use="'oscal:' || ../@name"/>
    
    
    
    <xsl:template match="/">
        <xsl:apply-templates mode="explode"/>
    </xsl:template>
    
    
    
    <xsl:template mode="explode" match="group[exists(@ref)]">
        <xsl:apply-templates mode="explode" select="key('inside-group',current()/@ref,oscal:assemble-schema(.))"/>
        <xsl:call-template name="fallback">
            <xsl:with-param name="from" select="key('inside-group', current()/@ref, oscal:assemble-schema(.))"/>
        </xsl:call-template>
    </xsl:template>
    
<!-- Patch for logic hole in profile_.xsd   -->
    <xsl:template priority="5" mode="explode" match="group[@name='profileGroup']//group[@ref = 'oscal:profileGroup']">
        <element ref="group"/>
    </xsl:template>

    <xsl:template mode="explode" match="group//group" priority="2"/>
    
    <!--<xsl:template mode="explode" match="attributeGroup//attributeGroup" priority="2"/>-->
    
    <xsl:template mode="explode" match="schema/group[exists(@name)]"/>
    
    <!--<xsl:template mode="explode" match="schema/attributeGroup"/>-->
    
    <xsl:template mode="explode" match="/schema/complexType" priority="3"/>
    
    <xsl:template mode="explode" match="annotation"/>
    
    <xsl:template match="*" mode="explode">
        <xsl:element name="{local-name()}">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    
    <xsl:template mode="explode" match="element">
        <element>
            <xsl:apply-templates select="@*" mode="explode"/>
            <xsl:apply-templates mode="#current"/>
        </element>
    </xsl:template>

    <xsl:template priority="2" mode="explode" match="element[@type='xs:string']">
        <element>
            <xsl:apply-templates select="@*" mode="explode"/>
        </element>
    </xsl:template>
    
    <xsl:template mode="explode" match="include | import"/>
    
    <xsl:template mode="explode" match="element[exists(@type)]">
        <element>
            <xsl:apply-templates select="@*" mode="explode"/>
            <xsl:apply-templates mode="#current" select="key('inside-complexType-by-name',@type,oscal:assemble-schema(.))"/>
            <xsl:call-template name="fallback">
                <xsl:with-param name="from" select="key('inside-complexType-by-name',@type, oscal:assemble-schema(.))"/>
            </xsl:call-template>
            
        </element>
    </xsl:template>
    
    <xsl:template match="@*" mode="explode">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="@ref" mode="explode">
        <xsl:attribute name="ref" select="replace(.,'^oscal:','')"/>
    </xsl:template>
    
    
    <xsl:template match="complexType" mode="explode">
        <elements>
            <xsl:apply-templates mode="#current"/>
        </elements>
    </xsl:template>
    
    
    
    <xsl:template match="complexType[@mixed='true']" mode="explode">
        <mixed>
            <xsl:apply-templates mode="#current"/>
        </mixed>
    </xsl:template>
    
    <xsl:template mode="explode" match="complexType/sequence | group/sequence">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="explode" match="choice[@minOccurs='0'][@maxOccurs='unbounded']">
        <optionalRepeatable>
            <xsl:apply-templates mode="#current"/>
        </optionalRepeatable>
    </xsl:template>

    <xsl:template match="attribute" mode="explode">
        <attribute>
            <xsl:copy-of select="@*"/>
        </attribute>
    </xsl:template>
    
    <xsl:template match="attributeGroup[exists(@ref)]" mode="explode">
        <xsl:variable name="schema-set" select="oscal:assemble-schema(.)"/>
        <xsl:apply-templates  mode="#current" select="key('attributes-by-group',@ref,$schema-set)"/>
        <xsl:call-template name="fallback">
            <xsl:with-param name="from" select="key('attributes-by-group',@ref, $schema-set)"/>
        </xsl:call-template>
    </xsl:template>
    
    
    <!---->

</xsl:stylesheet>