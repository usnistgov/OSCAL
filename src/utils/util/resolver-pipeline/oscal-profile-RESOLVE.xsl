<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:u="http://csrc.nist.gov/ns/uuid"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <!--

    An XSLT 3.0 stylesheet using XPath 3.1 functions including transform()

    This XSLT orchestrates a sequence of transformations over its input.

    The first transformation, "selection", aggregates the source with external (referenced) contents.

    Subsequent transformations, "merge" and "modify", are self-contained: all inputs are included.

    -->

    <xsl:output method="xml" indent="yes"/>

    <!-- uuid-method-choice.xsl has global parameters
        $uuid-method, $top-uuid, and $uuid-service. -->
    <xsl:import href="uuid-method-choice.xsl"/>

    <xsl:strip-space
        elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include exclude set alter add"/>

    <!-- Turning $trace to 'on' will
         - emit runtime messages with each transformation, and
         - retain processing instructions from message-handler.xsl in results. -->
    <xsl:param name="trace" as="xs:string">off</xsl:param>

    <!-- Turning $save-intermediate to 'on' will save the intermediate file from
        each transformation of the input profile. Intermediate files from
        processing imported profiles are not saved. -->
    <xsl:param name="save-intermediate" as="xs:string">off</xsl:param>

    <xsl:param name="uri-stack" as="xs:anyURI*" select="()"/>
    
    <!-- $path-to-source should point back to the location of the source catalog (or profile) from its result,
         so '..' is appropriate when writing results down a directory. -->
    <xsl:param name="path-to-source" as="xs:string?"/>

    <xsl:variable name="louder" select="$trace = 'on'"/>

    <xsl:variable name="home" select="/"/>
    <xsl:variable name="home-filename" select="$home/base-uri() => replace('.*/','')"/>

    <!-- If true, do not record profile URI in output catalog's source-profile
        metadata, due to privacy or security concerns. -->
    <xsl:param name="hide-source-profile-uri" as="xs:boolean" select="false()"/>

    <!-- The $transformation-sequence declares transformations to be applied in order. -->
    <xsl:variable name="transformation-sequence">
        <opr:transform version="3.0">oscal-profile-resolve-select.xsl</opr:transform>
        <opr:transform version="3.0">oscal-profile-resolve-metadata.xsl</opr:transform>
        <opr:transform version="3.0">oscal-profile-resolve-merge.xsl</opr:transform>
        <opr:transform version="3.0">oscal-profile-resolve-modify.xsl</opr:transform>
        <opr:transform version="3.0">oscal-profile-resolve-finish.xsl</opr:transform>
        <opr:terminate-if-severe-errors/>
        <opr:finalize/>
    </xsl:variable>

    <xsl:variable name="terminating-message" as="xs:string" select="'Terminating '"/>

    <!-- Entry point traps the root node of the source and passes it down the chain of transformation references -->
    <xsl:template match="/" name="profile-resolve">
        <xsl:param name="source" select="." as="document-node()"/>
        <!-- Each element inside $transformation-sequence is processed in turn.
             Each represents a stage in processing.
             The result of each processing step is passed to the next step as its input, until no steps are left. -->
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="yes">RESOLVING PROFILE { base-uri($source) } </xsl:with-param>
        </xsl:call-template>
        <xsl:iterate select="$transformation-sequence/*">
            <xsl:param name="doc" select="$source" as="document-node()"/>
            <xsl:on-completion select="$doc"/>
            <xsl:variable name="transform-result">
                <xsl:apply-templates mode="opr:execute" select=".">
                    <xsl:with-param name="sourcedoc" select="$doc"/>
                </xsl:apply-templates>                
            </xsl:variable>
            <xsl:if test="$save-intermediate eq 'on'">
                <xsl:result-document href="{'intermediate-' || string(count(.|preceding-sibling::*)) || '.xml'}">
                    <xsl:sequence select="$transform-result"/>
                </xsl:result-document>
            </xsl:if>
            <xsl:next-iteration>
                <xsl:with-param name="doc" select="$transform-result"/>
            </xsl:next-iteration>
        </xsl:iterate>
    </xsl:template>


    <xsl:template mode="opr:provide-parameters" match="opr:transform"/>
    
    <xsl:template mode="opr:provide-parameters" match="opr:transform[.='oscal-profile-resolve-metadata.xsl']">
        <xsl:map-entry key="QName('','top-uuid-computed')">
            <xsl:call-template name="u:determine-uuid"/>
        </xsl:map-entry>
        <xsl:map-entry key="QName('','hide-source-profile-uri')" select="$hide-source-profile-uri"/>
    </xsl:template>

    <xsl:template mode="opr:provide-parameters" match="opr:transform[.='oscal-profile-resolve-select.xsl']">
        <xsl:map-entry key="QName('','trace')" select="$trace"/>
    </xsl:template>

    <!-- for opr:transformation, the semantics are "apply this XSLT" -->
    <xsl:template mode="opr:execute" match="opr:transform">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:variable name="xslt-spec" select="."/>
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true">Step { count(.|preceding-sibling::*) } start : document { $home-filename }, XSLT { $xslt-spec }</xsl:with-param>
        </xsl:call-template>
        <xsl:variable name="runtime-params" as="map(xs:QName,item()*)">
            <xsl:map>
                <xsl:map-entry key="QName('','profile-origin-uri')" select="base-uri($home)"/>
                <xsl:map-entry key="QName('','path-to-source')"     select="$path-to-source"/>
                <xsl:map-entry key="QName('','uri-stack-in')"       select="($uri-stack, base-uri($home))"/>
                <xsl:apply-templates select="." mode="opr:provide-parameters"/>
            </xsl:map>
        </xsl:variable>
        <!--<xsl:variable name="runtime" select="map {
                    'xslt-version': xs:decimal($xslt-spec/@version),
                    'stylesheet-location': string($xslt-spec),
                    'source-node': $sourcedoc,
                    'stylesheet-params': $runtime-params
                    }"/>-->
        <xsl:variable name="runtime" as="map(xs:string, item())">
            <xsl:map>
                <xsl:map-entry key="'xslt-version'" select="xs:decimal($xslt-spec/@version)"/>
                <xsl:map-entry key="'stylesheet-location'" select="string($xslt-spec)"/>
                <xsl:map-entry key="'source-node'" select="$sourcedoc"/>
                <xsl:map-entry key="'stylesheet-params'" select="$runtime-params"/>
            </xsl:map>
        </xsl:variable>

        <!-- The function returns a map; primary results are under 'output'
             unless a base output URI is given
             https://www.w3.org/TR/xpath-functions-31/#func-transform -->
        <xsl:sequence select="transform($runtime)?output"/>
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true">Step { count(.|preceding-sibling::*) } end   : document { $home-filename }, XSLT { $xslt-spec }</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- If there were any terminating error messages, issue the first one and
            stop. In this case, the output document has no elements. -->
    <xsl:template mode="opr:execute" match="opr:terminate-if-severe-errors">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true">Step { count(.|preceding-sibling::*) }       : document { $home-filename }, check for severe errors</xsl:with-param>
        </xsl:call-template>
        <xsl:for-each select="$sourcedoc/descendant::processing-instruction('message-handler')[starts-with(.,$terminating-message)]">
            <xsl:message terminate="yes" expand-text="yes">{.}</xsl:message>
        </xsl:for-each>
        <!-- If we reach this point, pass $sourcedoc back for the next pipeline step. -->
        <xsl:sequence select="$sourcedoc"/>
    </xsl:template>

    <!-- The finalize step performs any last cleanup. -->
    <xsl:template mode="opr:execute" match="opr:finalize">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true">Step { count(.|preceding-sibling::*) }       : document { $home-filename }, finalize</xsl:with-param>
        </xsl:call-template>
        <xsl:apply-templates select="$sourcedoc" mode="opr:finalize"/>
    </xsl:template>

    <!-- Not knowing any better, any other execution step passes through its source. -->
    <xsl:template mode="opr:execute" match="*">
        <xsl:param name="sourcedoc" as="document-node()"/>
        <xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true">Step { count(.|preceding-sibling::*) } : { name() }</xsl:with-param>
        </xsl:call-template>
        <xsl:sequence select="$sourcedoc"/>
    </xsl:template>

    <!-- Mode 'opr:finalize' makes final adjustments. -->

    <!-- Here we wipe traces of XSD.   -->
    <xsl:template mode="opr:finalize" match="@xsi:*"/>

    <!-- Likewise, intermediate processing directives. -->
    <xsl:template mode="opr:finalize" match="opr:* | @opr:*"/>

    <!-- But process warnings and errors from steps in the pipeline. -->
    <xsl:template mode="opr:finalize" match="processing-instruction('message-handler')">
        <xsl:if test="$louder">
            <xsl:copy-of copy-namespaces="no" select="."/>
        </xsl:if>
        <xsl:message expand-text="yes">{.}</xsl:message>
    </xsl:template>

    <!-- In 'finalize' mode, copying everything else without namespaces. -->
    <xsl:template mode="opr:finalize" match="node() | @*">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="node() | @*" mode="#current"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template name="alert">
        <xsl:param name="msg"/>
        <xsl:if test="$louder">
            <xsl:message>
                <xsl:sequence select="$msg"/>
            </xsl:message>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
