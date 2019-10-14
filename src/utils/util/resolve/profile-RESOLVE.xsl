<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0" xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0" xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    xmlns:fn="http://www.example.com/fn">

    <xsl:output indent="yes"/>

    <!-- Purpose: from OSCAL profile input, produce a representation of all controls called with insertions, alterations, modifications and settings applied. -->
    <!-- Primary input: an OSCAL profile -->
    <!-- Secondary inputs: control catalogs referenced from profile import statements. -->

    <!-- A higher-order transformation works by producing a template set and then applying them
            together as a filter over the imported catalogs -->

    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>
    <xsl:param name="write-xslt" as="xs:string">yes</xsl:param>
    <xsl:param name="tracing" as="xs:boolean" select="$write-xslt = 'yes'"/>

    <xsl:variable name="filter-location" select="/*/@id || '-resolver.xsl'"/>

    <xsl:template match="profile">
        <xsl:param tunnel="yes" name="visited" select="()"/>

        <xsl:variable name="rough-resolution-xslt">
            <xsl:apply-templates select="." mode="make-resolver"/>
        </xsl:variable>
        <xsl:variable name="resolution-xslt">
            <xsl:apply-templates select="$rough-resolution-xslt" mode="rinse-resolver"/>
        </xsl:variable>

        <xsl:variable name="resolution-result">
            <xsl:variable name="runtime"
                select="
                    map {
                        'xslt-version': 3.0,
                        'source-node': (.),
                        'default-mode': xs:QName('oscal:filter'),
                        'stylesheet-node': $resolution-xslt,
                        'stylesheet-params': map {xs:QName('visited'): $visited}
                    }"/>

            <!-- The function fn:transform() returns a map, whose primary results are under 'output'
         unless a base output URI is given
         https://www.w3.org/TR/xpath-functions-31/#func-transform -->

            <xsl:sequence select="transform($runtime)?output"/>

        </xsl:variable>
        <xsl:sequence select="$resolution-result"/>
        <xsl:if test="$tracing">
            <xsl:result-document href="{$filter-location}" indent="yes">
                <xsl:sequence select="$resolution-xslt"/>
            </xsl:result-document>
        </xsl:if>
    </xsl:template>

    <!-- Before we can run it, we have to 'rinse' the resolver stylesheet,
         to clear it of problems such as template clashes -->

    <xsl:mode name="rinse-resolver" on-no-match="shallow-copy"/>

    <!--Function permits us to key templates by 'clash' criteria - same match, same priority
    this is not adequate in general (clashing templates do not always have the same match as literal)
    but adequate for us).-->
    <xsl:function name="oscal:template-matcher" as="xs:string">
        <xsl:param name="template" as="element(xsl:template)"/>
        <xsl:value-of select="$template/@match || ($template/@priority ! ('/' || .))"/>
    </xsl:function>

    <xsl:key name="matching" match="xsl:template" use="oscal:template-matcher(.)"/>

    <!-- 'rinse-resolver' removes duplicate templates produced by garbage input -->
    <xsl:template match="xsl:template" mode="rinse-resolver">
        <xsl:if test=". is key('matching', oscal:template-matcher(.))[1]">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>

    <xsl:template match="profile" mode="make-resolver">
        <XSLT:stylesheet version="3.0" xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
            default-mode="oscal:resolve">

            <xsl:call-template name="profile-base"/>

            <xsl:call-template name="catalog-base"/>

            <xsl:apply-templates select="import" mode="make-selector"/>
            <xsl:apply-templates select="merge" mode="build-merge"/>
        </XSLT:stylesheet>
    </xsl:template>

    <xsl:template match="import" mode="make-selector">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <!-- Given by itself, an include statement has the effect of suppressing everything
     nb this is necessary b/c the default behavior is to include everything, which
     we have templates to support when no include statement appears at all
    only an exclude or just a bare import (which ends up including everything) -->
    <xsl:template match="import/include" mode="make-selector">
        <XSLT:template priority="10" match="control" mode="oscal:propagate"/>
        <!-- but by applying templates inside, we produce templates to copy
             whatever we are including after all -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <xsl:template match="import/include/all" mode="make-selector">
        <XSLT:template priority="11" match="control" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:resolve"/>
            </XSLT:copy>
        </XSLT:template>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <xsl:template match="import/include/call" mode="make-selector">
        <xsl:variable name="matcher" expand-text="true">control[@id='{@control-id}']</xsl:variable>
        <xsl:variable name="include-subcontrols" select="@with-child-controls = ('true', '1')"/>
        <XSLT:template priority="11" match="{$matcher}" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:resolve"/>
            </XSLT:copy>
        </XSLT:template>
        <xsl:if test="$include-subcontrols">
            <XSLT:template priority="11" match="{$matcher||'/control'}" mode="oscal:propagate">
                <XSLT:copy>
                    <XSLT:apply-templates select="@* | node()" mode="oscal:resolve"/>
                </XSLT:copy>
            </XSLT:template>
        </xsl:if>
    </xsl:template>

    <!-- Mode build-merge provides template to provided the build the result structure. They are prioritized starting with 100
    to ensure they override 'selector' templates, to which they will cascade logic -->
    <xsl:template match="merge" mode="build-merge">
        <!-- A template to produce the outputs -->
        <!--<XSLT:template match="profile" mode="oscal:resolve" priority="100">
            <XSLT:apply-templates mode="oscal:fetch"
                select="import/key('resource-fetch', @href)"/>
            <XSLT:next-match/>
        </XSLT:template>-->

        <!-- the merge direction itself is dropped -->
        <XSLT:template match="merge" mode="oscal:resolve" priority="100"/>

        <!-- next, the templates for configuring the merge -->
        <xsl:apply-templates mode="#current"/>
    </xsl:template>

    <!-- combine[@method='keep'] is assumed until later   -->
    <xsl:template match="merge/combine | merge/as-is"/>

    <xsl:template match="merge/custom" mode="build-merge">
        <xsl:if test="exists(descendant::call)">
            <XSLT:key name="controls-by-id" match="control" use="@id"/>
            <XSLT:variable name="imported-controls">
                <XSLT:apply-templates select="/profile/import" mode="oscal:resolve"/>
            </XSLT:variable>
        </xsl:if>
        <!-- overriding the base template -->
        <XSLT:template match="profile" mode="oscal:resolve" priority="100">
            <catalog id="RESOLVED_CUSTOMIZED-{ancestor::profile/@id}">
                <!-- traversing the merge/custom to build a 'pull' -->
                <xsl:apply-templates mode="#current"/>
                  
            </catalog>
        </XSLT:template>
    
        
    </xsl:template>
    
    <xsl:template match="merge/custom//*" mode="build-merge">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template priority="2" match="merge/custom//call" mode="build-merge">
        <XSLT:apply-templates mode="oscal:resolve" select="key('controls-by-id','{@control-id}',$imported-controls)"/>
    </xsl:template>
    
    
    <xsl:template priority="5" match="as-is[. = ('true', '1')]" mode="build-merge">
        <XSLT:template priority="100" match="group" mode="oscal:resolve">
            <XSLT:variable name="resolved-contents">
                <XSLT:apply-templates select="group | control" mode="oscal:resolve"/>
            </XSLT:variable>
            <XSLT:if test="exists($resolved-contents/*)">
                <XSLT:apply-templates select="." mode="oscal:propagate"/>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template priority="101" match="group/title | group/param | group/prop | group/part"
            mode="oscal:resolve">
            <XSLT:apply-templates select="." mode="oscal:propagate"/>
        </XSLT:template>
    </xsl:template>

    <xsl:template name="catalog-base">
        <XSLT:template match="catalog" mode="oscal:resolve">
            <group>
                <XSLT:apply-templates mode="#current" select="@*"/>
                <XSLT:apply-templates mode="#current"/>
            </group>
        </XSLT:template>

        <XSLT:template match="/*/@id" mode="oscal:resolve">
            <XSLT:attribute name="id" expand-text="true">PROFILE-RESULTS-{.}</XSLT:attribute>
        </XSLT:template>

        <XSLT:template match="metadata" mode="oscal:resolve"/>

        <XSLT:template priority="2" match="group" mode="oscal:resolve">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>

        <XSLT:template priority="3" match="control" mode="oscal:resolve">
            <XSLT:apply-templates select="." mode="oscal:propagate"/>
        </XSLT:template>

        <XSLT:template match="group/*" mode="oscal:resolve"/>

        <XSLT:template match="*" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:resolve"/>
            </XSLT:copy>
        </XSLT:template>


    </xsl:template>

    <xsl:template name="profile-base">
        <XSLT:strip-space elements="catalog metadata group requirement control part param"/>

        <XSLT:output indent="yes"/>

        <XSLT:mode name="oscal:resolve" on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:propagate" on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:copy-branch" on-no-match="deep-copy"/>

        <XSLT:template match="profile" mode="oscal:resolve">
            <catalog id="RESOLVED-{@id}">
                <XSLT:apply-templates select="import" mode="#current"/>
                <XSLT:apply-templates select="merge" mode="#current"/>
                <XSLT:apply-templates select="modify" mode="#current"/>
            </catalog>
        </XSLT:template>

        <XSLT:key name="resource-fetch" match="resource" use="'#' || @id"/>

        <XSLT:template match="resource[rlink/@href castable as xs:anyURI]" mode="oscal:fetch">
            <XSLT:apply-templates select="document(rlink/@href, /)" mode="oscal:resolve"/>
        </XSLT:template>

        <!-- For now, each import is traversed separately, meaning we can get duplicated groups
             repair this by grouping either/both imports/@hrefs and resource targets -->
        <XSLT:template match="profile/import" mode="oscal:resolve">
            <XSLT:if test="starts-with(@href, '#')">
                <XSLT:apply-templates select="key('resource-fetch', @href)" mode="oscal:fetch"/>
            </XSLT:if>
        </XSLT:template>

        <XSLT:template match="comment()" mode="#all"/>
    </xsl:template>
    
</xsl:stylesheet>
