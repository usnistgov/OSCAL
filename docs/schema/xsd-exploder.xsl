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
    
    <xsl:mode default-mode="explode" on-no-match="shallow-copy"/>
    <xsl:mode name="propagate" on-no-match="shallow-copy"/>
    
    <!--<xsl:variable name="me-and-imports" select="
        / , document(xsl:import/@href)"/>-->
    
    <xsl:template match="/">
        <xsl:apply-templates mode="explode"/>
        </xsl:template>
    
    <xsl:template match="attribute" mode="propagate">
        <attribute>
            <xsl:copy-of select="@*"/>
        </attribute>
    </xsl:template>
    
    <!-- override from calling XSLT   -->
    <xsl:variable name="schema-sources" select="/"/>
    
    <xsl:template match="attributeGroup[exists(@ref)]" mode="propagate">
        <xsl:apply-templates  mode="#current" select="key('attributes-by-group',@ref,$schema-sources)"/>
        <xsl:call-template name="fallback">
            <xsl:with-param name="from" select="key('attributes-by-group',@ref,$schema-sources)"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="fallback">
        <xsl:param name="from"/>
        <xsl:if test="empty($from)">
        <fallback>
            <xsl:copy-of select="."/>
        </fallback>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:key name="element-by-attributeGroups" match="xs:element" use="descendant::xs:attributeGroup/@ref except .//xs:element//xs:attributeGroup/@ref"/>
    
    <xsl:key name="attributeGroup-by-attributeGroups" match="xs:attributeGroup" use="descendant::xs:attributeGroup/@ref"/>
    
    
    
    <xsl:key name="element-by-type" match="xs:element[@type]"   use="@ref"/>
    
    
    <xsl:function name="oscal:elements-for-attribute-declaration" as="element(xs:element)*">
        <xsl:param name="att" as="element(xs:attribute)"/>
        <xsl:param name="scope" as="document-node()"/>
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
    
    <xsl:template mode="explode" match="group[exists(@ref)]">
        <xsl:apply-templates mode="explode" select="key('inside-group',current()/@ref,$schema-sources)"/>
        <xsl:call-template name="fallback">
            <xsl:with-param name="from" select="key('inside-group', current()/@ref,$schema-sources)"/>
        </xsl:call-template>
    </xsl:template>
    
<!-- Patch for logic hole in profile_.xsd   -->
    <xsl:template priority="5" mode="explode" match="group[@name='profileGroup']//group[@ref = 'oscal:profileGroup']">
        <element ref="group"/>
    </xsl:template>
    
    <xsl:template mode="explode" match="schema/group[exists(@name)]"/>
    
    <xsl:template mode="explode" match="schema/attributeGroup"/>
    
    <xsl:template mode="explode" match="/schema/complexType" priority="3"/>
    
    <xsl:template mode="explode" match="annotation"/>
    
    <xsl:template mode="explode" match="element">
        <element>
            <xsl:apply-templates select="@*" mode="explode"/>
            <xsl:apply-templates select=".//(attribute|attributeGroup) except .//element//(attribute|attributeGroup)" mode="propagate"/>
            <xsl:apply-templates mode="#current"/>
        </element>
    </xsl:template>

    <xsl:template mode="explode" match="element[exists(@type)]">
        <element>
            <xsl:apply-templates select="@*" mode="explode"/>
            <xsl:apply-templates mode="#current" select="key('inside-complexType-by-name',@type,$schema-sources)"/>
            <xsl:call-template name="fallback">
                <xsl:with-param name="from" select="key('inside-complexType-by-name',@type,$schema-sources)"/>
            </xsl:call-template>
            
        </element>
    </xsl:template>
    
    <xsl:template match="@*" mode="explode">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="@ref" mode="explode">
        <xsl:attribute name="ref" select="replace(.,'^oscal:','')"/>
    </xsl:template>
    
<!-- dropped in default mode, picked up in 'propagate'   -->
    <xsl:template mode="explode" match="attribute | attributeGroup"/>
    
    <xsl:template match="complexType" mode="explode propagate">
        <elements>
            <xsl:apply-templates mode="#current"/>
        </elements>
    </xsl:template>
    
    <xsl:template match="complexType[@mixed='true']" mode="explode propagate">
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

    <!---->

</xsl:stylesheet>