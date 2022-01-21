<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math o"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0">

    <!-- Purpose: perform operations supporting the selection stage of OSCAL profile resolution. -->
    <!-- XSLT version: 3.0 -->

    <xsl:strip-space elements="catalog group control param guideline select part
        metadata back-matter annotation party person org rlink address resource role responsible-party citation
        profile import merge custom modify include-controls exclude-controls set alter add"/>

    <!--<xsl:param name="profile-origin-uri"   required="yes" as="xs:anyURI"/>-->
    <xsl:param name="uri-stack-in" select="()" as="xs:anyURI*"/>

<!-- The default processing is to pass everything through.
     Note: The source catalog includes other contents besides selected controls
           that may be required in the result. Examples are elements in the back
           matter, loose parameters (not declared inside controls) and groups and
           their contents apart from controls.
           These elements are also copied into the result.
           A post-process (filter) will be applied to remove them in a later stage. -->

    <xsl:template match="* | @*" mode="#all">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <!-- Making the default handling explicit. -->
    <xsl:template match="comment() | processing-instruction()" mode="#all"/>

    <!-- We catch the unmoded template only once, at the top; other matches will be in mode o:select   -->
    <xsl:template match="profile">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="o:select" select="node() | @*">
                <xsl:with-param name="uri-stack" tunnel="yes" select="$uri-stack-in"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>

<!-- We reach a profile document in mode o:select only by way of an import/@href (see below)
     when we do, we have to see to it that we haven't already been called; if
     not, we execute the Ourobouros function, which calls the parent wrapper RESOLVE pipeline
     to return a catalog. -->
    <xsl:template match="profile" mode="o:select">
        <xsl:param name="uri-stack" tunnel="yes" select="()"/>
        <!-- $uri-stack contains an import call stack trace from the point of entry -->
        <xsl:variable name="uri-here" select="base-uri(.)"/>
        <xsl:if test="not($uri-here = $uri-stack)">
          <!--<xsl:sequence select="o:resolve-profile(.,$uri-stack)"/>-->
            <xsl:copy copy-namespaces="no">
                <opr:warning>
                    <xsl:text>profile '</xsl:text>
                    <xsl:value-of select="$uri-here"/>
                    <xsl:text>' picked up - and dropped - on import - we do only catalogs so far</xsl:text>
                </opr:warning>
                <!--<xsl:apply-templates mode="o:select" select="node() | @*">
                    <xsl:with-param name="uri-stack" tunnel="yes" select="$uri-stack,$uri-here"/>
                </xsl:apply-templates>-->
            </xsl:copy>
        </xsl:if>

    </xsl:template>

    <xsl:template match="catalog" mode="o:select">
        <selection opr:src="{document-uri(root())}">
            <xsl:copy-of select="@* except @xsi:*" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>
            <!--<xsl:attribute name="opr:base" select="document-uri(root())"/>-->
            <xsl:apply-templates mode="#current"/>
        </selection>
    </xsl:template>

    <!--<xsl:template match="catalog/metadata" mode="o:select">
        <metadata>
            <new-metadata-here/>
        </metadata>
    </xsl:template>-->

    <xsl:key name="cross-reference" match="resource" use="'#' || @uuid"/>

    <xsl:template priority="2" mode="o:select" match="import[starts-with(@href,'#')]">
        <xsl:apply-templates mode="o:import" select="key('cross-reference',@href)">
            <xsl:with-param name="import-instruction" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="resource" mode="o:import">
        <xsl:variable name="linked-xml" select="child::rlink[ends-with(@href,'.xml') or matches(@media-type,'xml')][1]"/>
        <xsl:choose>
            <xsl:when test="exists($linked-xml)">
        <xsl:apply-templates mode="o:select" select="o:resource-or-warning($linked-xml/@href)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="yes"
                    expand-text="yes">Document not acquired for resource with uuid {@uuid
                    }: No rlink with media-type='xml' or href ending with '.xml'</xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template priority="1" mode="o:select" match="import">

<!-- OSCAL issue        -->
        <xsl:variable name="linked-resource" select="key('cross-reference',@href)"/>
        <xsl:apply-templates select="$linked-resource" mode="o:import">
            <xsl:with-param name="import-instruction" select="." tunnel="yes"/>
        </xsl:apply-templates>
        <xsl:apply-templates mode="#current" select="o:resource-or-warning(@href)">
            <xsl:with-param name="import-instruction" select="." tunnel="yes"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- We want a group even if there is nothing to put in it, for potential merging downstream  -->
    <xsl:template match="group" mode="o:select">
        <xsl:copy copy-namespaces="no">
            <!-- add an ID for downstream processing when the source has none -->
            <xsl:call-template name="add-process-id"/>
            <xsl:apply-templates mode="o:select" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template name="add-process-id" as="attribute(opr:id)">
        <xsl:param name="context" select="." as="element()"/>
        <xsl:attribute name="opr:id" namespace="http://csrc.nist.gov/ns/oscal/profile-resolution">
            <xsl:value-of
                select="concat(opr:catalog-identifier($context/root()/o:catalog), '#', $context/(@id, generate-id())[1])"/>
        </xsl:attribute>
    </xsl:template>

    <xsl:function name="opr:catalog-identifier" as="xs:string">
        <xsl:param name="catalog" as="element(o:catalog)"/>
        <xsl:sequence select="$catalog/(@uuid,document-uri(root(.)))[1]"/>
    </xsl:function>

    <!-- A control is included if it is selected by the provided import instruction -->
    <xsl:template match="control" mode="o:select" as="element(o:control)?">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:if test="o:selects($import-instruction,.)">
            <xsl:copy copy-namespaces="no">
                <xsl:call-template name="add-process-id"/>
                <xsl:apply-templates mode="#current" select="node() | @*"/>
            </xsl:copy>
        </xsl:if>
    </xsl:template>

    <!-- Parameters are always passed through until later stages. -->
    <xsl:template match="param" mode="o:select">
        <xsl:copy copy-namespaces="no">
            <xsl:call-template name="add-process-id"/>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <!-- A citation or resource is included if it is targeted as an internal link -->
    <!--<xsl:template match="back-matter/*" mode="o:select">
        <xsl:param name="import-instruction" tunnel="yes" required="yes"/>
        <xsl:variable name="called-by" select="key('internal-links',@id)"/>
        <xsl:variable name="calling-params" select="$called-by/ancestor::param"/>
        <xsl:variable name="calling-controls" select="($called-by/ancestor::control[1],$calling-params/key('param-insertions',@id)/ancestor::control[1])"/>

        <xsl:if test="some $c in $calling-controls satisfies o:selects($import-instruction,$c)">
            <xsl:next-match/>
        </xsl:if>
    </xsl:template>-->

    <!-- Function o:selects($importing,$candidate) returns a true or false
         depending on whether the import calls the candidate control  -->

<!-- @with-child-controls='yes' is recursive - given on a control it brings all control descendants, not only children   -->
    <xsl:function name="o:selects" as="xs:boolean">
        <xsl:param name="importing" as="element(o:import)"/>
        <xsl:param name="candidate" as="element(o:control)"/>
        <xsl:variable name="include-reasons" as="xs:boolean+">
<!-- we are not optimizing for performance here; nothing is done to prevent all checks even if the first passes -->
            <!--<xsl:sequence select="empty($importing/include)"/>-->
            <xsl:sequence select="exists($importing/include-all)"/>
            <xsl:sequence select="some $c in ($importing/include-controls/with-id)
                                  satisfies ($c = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/include-controls[o:calls-parents(.)]/with-id)
                satisfies ($c = $candidate/descendant::control/@id)"/>
            <xsl:sequence select="some $c in ($importing/include-controls[o:calls-children(.)]/with-id)
                satisfies ($c = $candidate/ancestor::control/@id)"/>
            <xsl:sequence select="some $m in ($importing/include-controls/matching[@pattern != ''])
                                  satisfies (matches($candidate/@id,$m/@pattern/o:glob-as-regex(string(.)) ))"/>
            <xsl:sequence select="some $m in ($importing/include-controls[o:calls-parents(.)]/matching[@pattern != '']), $a in $candidate/descendant::control 
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/include-controls[o:calls-children(.)]/matching[@pattern != '']), $a in $candidate/ancestor::control 
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
        </xsl:variable>
        <xsl:variable name="exclude-reasons" as="xs:boolean+">
            <xsl:sequence select="exists($candidate/parent::control) and $importing/include-all/@with-child-controls='no'"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls/with-id) satisfies ($c = $candidate/@id)"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls[o:calls-parents(.)]/with-id)
                satisfies ($c = $candidate/descendant::control/@id)"/>
            <xsl:sequence select="some $c in ($importing/exclude-controls[o:calls-children(.)]/with-id)
                satisfies ($c = $candidate/ancestor::control/@id)"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls/matching[@pattern != ''])
                satisfies (matches($candidate/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls[o:calls-parents(.)]/matching[@pattern != '']), $a in $candidate/descendant::control
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
            <xsl:sequence select="some $m in ($importing/exclude-controls[o:calls-children(.)]/matching[@pattern != '']), $a in $candidate/ancestor::control
                satisfies (matches($a/@id,$m/@pattern/o:glob-as-regex(string(.))))"/>
        </xsl:variable>
        <!-- predicate [.] filters reasons as booleans -->
        <xsl:sequence select="exists($include-reasons[.]) and empty($exclude-reasons[.])"/>
    </xsl:function>

    <xsl:function name="o:calls-children" as="xs:boolean">
        <xsl:param name="caller" as="element()"/>
        <xsl:sequence select="$caller/@with-child-controls='yes'"/>
    </xsl:function>

    <xsl:function name="o:calls-parents" as="xs:boolean">
        <xsl:param name="caller" as="element()"/>
        <xsl:sequence select="not($caller/@with-parent-controls='no')"/>
    </xsl:function>

    <!-- Returns a document when found, a fatal error when not. -->
    <xsl:function name="o:resource-or-warning" as="document-node()">
        <xsl:param name="href" as="attribute(href)"/>
        <xsl:variable name="resolved-href" select="resolve-uri($href,$href/base-uri())"/>
        <xsl:assert test="doc-available($resolved-href)"
            expand-text="yes">Document not acquired: {$href} resolved as {
        $resolved-href} (as OSCAL XML)</xsl:assert>
                <xsl:sequence select="document($resolved-href)"/>
    </xsl:function>

    <xsl:include href="oscal-profile-resolve-functions.xsl"/>

    <xsl:function name="o:resolve-profile">
        <xsl:param name="profile" as="element(profile)"/>
        <xsl:param name="uri-stack" as="xs:anyURI*"/>
        <xsl:variable name="runtime-params" as="map(xs:QName,item()*)">
            <xsl:map>
                <xsl:map-entry key="QName('','profile-origin-uri')" select="base-uri($profile)"/>
                <xsl:map-entry key="QName('','path-to-source')"     select="'.'"/>
                <xsl:map-entry key="QName('','uri-stack-in')"       select="$uri-stack"/>
            </xsl:map>
        </xsl:variable>
        <xsl:variable name="runtime" as="map(xs:string, item())">
            <xsl:map>
                <xsl:map-entry key="'xslt-version'"        select="3.0"/>
                <xsl:map-entry key="'stylesheet-location'" select="'oscal-profile-RESOLVE.xsl'"/>
                <xsl:map-entry key="'source-node'"         select="root($profile)"/>
                <xsl:map-entry key="'stylesheet-params'"   select="$runtime-params"/>
            </xsl:map>
        </xsl:variable>

        <!-- The function returns a map; primary results are under 'output'
             unless a base output URI is given
             https://www.w3.org/TR/xpath-functions-31/#func-transform -->
        <xsl:sequence select="transform($runtime)?output"/>
        <!--<xsl:call-template name="alert">
            <xsl:with-param name="msg" expand-text="true"> ... applied step { count(.|preceding-sibling::*) }: XSLT { $xslt-spec } ... </xsl:with-param>
        </xsl:call-template>-->
    </xsl:function>


</xsl:stylesheet>
