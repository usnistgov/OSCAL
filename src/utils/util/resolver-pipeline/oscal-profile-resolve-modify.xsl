<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    exclude-result-prefixes="#all"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
<!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="catalog">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates>
                <xsl:with-param name="modifications" tunnel="yes" select="child::modify"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="modify"/>
    
    <xsl:template match="control">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->
        <xsl:variable name="id" select="@id"/>
        
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="title" mode="#current"/>
            <xsl:copy-of select="$modifications/key('alteration-for-control-id',$id,.)/add[empty(@id-ref)][@position=('before','starting')]/*"/>
            
            <xsl:apply-templates select="* except title" mode="#current"/>
            <!--<xsl:message expand-text="true">{ string-join((* except title)/(name() || '#' || @id), ', ') }</xsl:message>-->
            
            <xsl:copy-of select="$modifications/key('alteration-for-control-id',$id,.)/add[empty(@id-ref)][not(@position = ('before','starting'))]/*"/>      
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="control//*">
        <xsl:param name="modifications" tunnel="yes" as="element(modify)?" required="yes"/>
        <!--<xsl:variable name="modifications" select="/*/modify"/>-->       
        <xsl:variable name="here" select="."/>
        <xsl:variable name="home" select="ancestor::control[1]"/> 
        <xsl:variable name="alterations" select="$modifications/key('alteration-for-control-id',$home/@id,.)"/>
        <!-- Key retrievals scoped to alterations...   -->
        <xsl:variable name="patches-to-id" select="$alterations/key('addition-by-id-ref',$here/@id,.)"/>
        
        <!-- $patches-before contains 'add' elements marked as patching before this element, either by its @id
      or if bound by its @class, iff it is the first of its class in the containing control
     -->
        <xsl:variable name="patches-before" select="$patches-to-id[@position='before']"/>
        
        <xsl:copy-of select="$patches-before/*"/>
        <xsl:if test="not(oscal:removable(.,$modifications))">
            <xsl:copy>
                <xsl:apply-templates select="@*" mode="#current"/>
                
                <xsl:variable name="patches-starting" select="$patches-to-id[@position='starting']"/>
                <xsl:copy-of select="$patches-starting/*"/>
                
                <xsl:apply-templates select="node()" mode="#current"/>
                
                <xsl:variable name="patches-ending" select="$patches-to-id[empty(@position) or @position='ending' or not(@position=('before','after','starting','ending'))]"/>
                <xsl:copy-of select="$patches-ending/*"/>
            </xsl:copy>
        </xsl:if>
        
        <!-- Reverse logic for 'after' patches. Note that elements inside descendant subcontrols or components are excluded from consideration.    -->
        <xsl:variable name="patches-after" select="$patches-to-id[@position='after']"/>
        <xsl:copy-of select="$patches-after/*"/>
        
    </xsl:template>
    
    <xsl:key name="alteration-for-control-id" match="alter" use="@control-id"/>
    <xsl:key name="addition-by-id-ref"   match="add"   use="@id-ref"/>
    
    <xsl:function name="oscal:classes" as="xs:string*">
        <xsl:param name="who" as="element()"/>
        <!-- HTML is not case sensitive so neither are we -->
        <xsl:sequence select="tokenize($who/@class/lower-case(.), '\s+')"/>
    </xsl:function>
    
    <xsl:function name="oscal:removable" as="xs:boolean">
        <xsl:param name="who" as="node()"/>
        <xsl:param name="mods" as="element(modify)?"/>
        <xsl:variable name="home" select="($who/ancestor::control | $who/ancestor::component)[last()]"/> 
        <xsl:variable name="alterations" select="$mods/key('alteration-for-control-id',$home/@id,.)"/>
        <xsl:variable name="removals" select="$alterations/remove"/>
        
        <xsl:sequence select="some $r in $removals satisfies oscal:remove-match($who,$r)"/>
    </xsl:function>  
    
    <xsl:function name="oscal:remove-match">
        <xsl:param name="who" as="node()"/>
        <xsl:param name="removal" as="element(remove)"/>
        <xsl:variable name="item-okay"  select="empty($removal/@item-name) or ($removal/@item-name = local-name($who))"/>
        <xsl:variable name="id-okay"    select="empty($removal/@id-ref)    or ($removal/@id-ref = $who/@id)"/>
        <xsl:variable name="class-okay" select="empty($removal/@class-ref) or ($removal/@class-ref = oscal:classes($who))"/>
        <xsl:sequence select="exists($removal/(@item-name|@id-ref|@class-ref)) and ($item-okay and $id-okay and $class-okay)"/>
    </xsl:function>
    
</xsl:stylesheet>