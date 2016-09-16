<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
     <xsl:template match="*">
         <xsl:element name="{name(.)}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
             <xsl:apply-templates select="node() | @*"/>
         </xsl:element>
     </xsl:template>
    
    <xsl:template match="/">
         <xsl:apply-templates/>
    </xsl:template>

    <!-- No longer wanted -->
    <xsl:template match="@type"/>
    
    <xsl:template match="controlId[not(matches(.,'\S'))] | subcontrolId[not(matches(.,'\S'))]"/>
    

    <xsl:template match="controlId">
        <prop class="control-name">
            <xsl:apply-templates/>
        </prop>
        <!--<xsl:comment> could be further elaborated, for example with a link to a matching control in a catalog or profile </xsl:comment>
        <xsl:comment> NB also some of these are (incorrectly) shown as 'controlId' not 'subcontrolId' </xsl:comment>-->
    </xsl:template>
    
    <xsl:template match="subcontrolId">
        <prop class="subcontrol-name">
            <xsl:apply-templates/>
        </prop>
    </xsl:template>
    
    <xsl:template match="paramId">
        <prop class="param-key">
            <xsl:apply-templates/>
        </prop>
    </xsl:template>
    
    <xsl:template match="value except params/map/value">
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- map, string, array, null, @key   -->
    
    <!--
            
Parents of 'map': ,components,satisfies,narratives,references,params            

Parents of 'string': maintainers,statuses,origins            

        -->
    
    
    
    <!-- Unwrapping -->
    <xsl:template match="satisfies | narratives | references | maintainers | statuses | origins">
        <xsl:apply-templates/>
    </xsl:template>
    
    
    <xsl:template match="components/map">
        <component>
            <xsl:apply-templates select="node()|@*"/>
        </component>
    </xsl:template> 
    <xsl:template match="satisfies/map">
        <part class="satisfies">
            <xsl:apply-templates select="node()|@*"/>
        </part>
    </xsl:template> 
    <xsl:template match="narratives/map">
        <p class="narrative">
            <xsl:apply-templates select="node()|@*"/>
        </p>
    </xsl:template> 
    <xsl:template match="references/map">
        <part class="reference">
            <xsl:apply-templates select="node()|@*"/>
        </part>
    </xsl:template> 
    <xsl:template match="params/map">
        <param>
            <xsl:apply-templates select="node()|@*"/>
        </param>
    </xsl:template>
    
    <xsl:template match="maintainers/string">
        <prop class="maintainer">
            <xsl:apply-templates select="node()|@*"/>
        </prop>
    </xsl:template>
    <xsl:template match="statuses/string">
        <prop class="status">
            <xsl:apply-templates select="node()|@*"/>
        </prop>
    </xsl:template>
    <xsl:template match="origins/string">
        <prop class="origin">
            <xsl:apply-templates select="node()|@*"/>
        </prop>
    </xsl:template>
    
    
    <xsl:template name="diagnostic">
        <xsl:comment expand-text="true">
            
Parents of 'map': { string-join(distinct-values(//map/name(..)), ',') }            

Parents of 'string': { string-join(distinct-values(//string/name(..)), ',') }            
<!--
{ for $n in (distinct-values(//map/name(..))) return "
&lt;xsl:template match=""" || $n || "/map"">
        &lt;map>
            &lt;xsl:apply-templates select=""node()|@*""/>
        &lt;/map>
    &lt;/xsl:template>"
}-->
        </xsl:comment>
    </xsl:template>
</xsl:stylesheet>
