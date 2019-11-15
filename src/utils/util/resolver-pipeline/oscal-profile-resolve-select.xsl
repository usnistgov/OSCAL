<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math o"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">
    
<!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:strip-space elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include exclude set alter add"/>
    
    <xsl:template match="* | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="profile">
        <xsl:copy>
            <xsl:apply-templates mode="o:select" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="catalog/metadata" mode="o:select">
        <!-- make new metadata here -->
    </xsl:template>
    
    
    <xsl:template match="import" mode="o:select">
        <xsl:apply-templates mode="#current" select="document(@href)">
            <xsl:with-param name="import-instruction" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!-- We want a group only if there is something to put in it.  -->
    <xsl:template match="group" mode="o:select">
        <xsl:copy>
            <!-- add an ID for downstream processing when the source has none -->
            <xsl:if test="empty(@id)">
                <xsl:attribute name="id">#<xsl:value-of select="concat('#',(@id,generate-id())[1])"/></xsl:attribute>    
            </xsl:if>
            <xsl:apply-templates mode="o:select" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- A control is included if it is selected by the provided import instruction -->
    <xsl:template match="control" mode="o:select">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:if test="o:selects($import-instruction,.)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:key name="param-insertions" match="insert" use="@param-id"/>
    
    <!-- A parameter is included if it is selected by the provided import instruction -->
    <xsl:template match="param" mode="o:select">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:variable name="used-in" select="key('param-insertions',@id)/ancestor::control[1]"/>   
        <xsl:if test="some $c in $used-in satisfies o:selects($import-instruction,$c)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <xsl:key name="internal-links" match="a[starts-with(@href,'#')] | link[starts-with(@href,'#')]" use="substring-after(@href,'#')"/>
    
    <!-- A citation or resource is included if it is targeted as an internal link -->
    <xsl:template match="back-matter/*" mode="o:select">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:variable name="called-by" select="key('internal-links',@id)"/>
        <xsl:variable name="calling-params" select="$called-by/ancestor::param"/>   
        <xsl:variable name="calling-controls" select="($called-by/ancestor::control[1],$calling-params/key('param-insertions',@id)/ancestor::control[1])"/>   
        
        <xsl:if test="some $c in $calling-controls satisfies o:selects($import-instruction,$c)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>
    
    <!-- Function o:selects($importing,$candidate) returns a true or false
         depending on whether the import calls the candidate control  -->
    <xsl:function name="o:selects" as="xs:boolean">
        <xsl:param name="importing" as="element(o:import)"/>
        <xsl:param name="candidate" as="element(o:control)"/>
        <xsl:variable name="include-reasons" as="xs:boolean+">
<!-- we are not optimizing for performance here; nothing is done to prevent all checks even if the first passes -->
            <xsl:sequence select="empty($importing/include)"/>
            <xsl:sequence select="exists($importing/include/all)"/>
            <xsl:sequence select="some $c in ($importing/include/call)
                                  satisfies ($c/@control-id = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/include/call[o:calls-children(.)])
                                  satisfies ($c/@control-id = $candidate/../@id)"/>
            <xsl:sequence select="some $m in ($importing/include/match)
                                  satisfies (matches($candidate/@id,$m/@pattern))"/>
            <xsl:sequence select="some $m in ($importing/include/match[o:calls-children(.)])
                                  satisfies (matches($candidate/../@id,$m/@pattern))"/>
        </xsl:variable>
        <xsl:variable name="exclude-reasons" as="xs:boolean+">
            <xsl:sequence select="exists($candidate/parent::control) and $importing/include/all/@with-child-controls='no'"/>
            <xsl:sequence select="some $c in ($importing/exclude/call)
                                  satisfies ($c/@control-id = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/exclude/call[o:calls-children(.)])
                                  satisfies ($c/@control-id = $candidate/../@id)"/>
            <xsl:sequence select="some $m in ($importing/exclude/match)
                                  satisfies (matches($candidate/@id,$m/@pattern))"/>
            <xsl:sequence select="some $m in ($importing/exclude/match[o:calls-children(.)])
                                  satisfies (matches($candidate/../@id,$m/@pattern))"/>
        </xsl:variable>
        <xsl:sequence select="exists($include-reasons[.]) and empty($exclude-reasons[.])"/>
    </xsl:function>
    
    <xsl:function name="o:calls-children" as="xs:boolean">
        <xsl:param name="caller" as="element()"/>
        <xsl:sequence select="$caller/@with-child-controls='yes'"/>
    </xsl:function>


</xsl:stylesheet>