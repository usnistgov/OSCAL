<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    <xsl:import href="message-handler.xsl"/>

    <xsl:variable name="oscal-ns" select="'http://csrc.nist.gov/ns/oscal/1.0'" as="xs:string"/>
    <xsl:variable name="at-most-one" as="xs:string+"
        select="(
        'metadata',
        'back-matter',
        'title',
        'published',
        'last-modified',
        'version',
        'oscal-version',
        'revisions',
        'document-id',
        'remarks'
        )"/>

    <xsl:template match="* | @* | processing-instruction('message-handler')" mode="#default">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <!-- Finalizing profile resolution into a catalog:
         - Reordering metadata, group and control contents to valid order
         - Removing loose orphan parameters
           - Orphans given inside controls are retained
         - Removing extra elements of types that permit at most one
           - Use [last()] instead of [1] to accommodate the case of
             replacing a title during modify phase. The modify phase
             adds the title following the original one.
           - Some uses of mode="all-or-last-only" are expected to behave
             just like mode="#current" if input documents are schema-valid
             but are included to avoid producing schema-invalid output.
         - Removing unclaimed inventory, defined as any 'resource'
           in back matter without something somewhere linking to it

    What we are not doing:
         - Removing broken links
         - Remove opr and xsi namespaces (that happens in the shell)
    -->
<!-- An XQuery run on a metaschema can return a sequence of instructions

    let $where := 'metadata'
    for $n in (//*:define-assembly[@name=$where]/*:model/*/(@name | @ref))
    return <apply-templates mode="#current" select="{ $n }"/>

    Caveat: This query does not account for elements that can occur at most once,
    or aliasing via use-name.
    -->

    <xsl:template match="*" mode="all-or-last-only">
        <xsl:variable name="this" select="." as="element()"/>
        <xsl:variable name="following-siblings-of-same-element-type" as="xs:integer"
            select="count(following-sibling::*[local-name(.) = local-name($this)][namespace-uri(.) = namespace-uri($this)])"/>
        <xsl:choose>
            <xsl:when test="namespace-uri($this) = $oscal-ns and not(local-name($this) = $at-most-one)">
                <!-- OSCAL element that is not limited to at most one instance in its parent -->
                <xsl:apply-templates select="." mode="#default"/>
            </xsl:when>
            <xsl:when test="namespace-uri($this) != $oscal-ns">
                <!-- Non-OSCAL element -->
                <xsl:apply-templates select="." mode="#default"/>
            </xsl:when>
            <xsl:when test="$following-siblings-of-same-element-type gt 1">
                <!-- Element type is limited to at most one instance in its parent, and
                    there will be at least one following sibling to produce a warning
                    another following sibling to copy to result. This case is a no-op. -->
            </xsl:when>
            <xsl:when test="$following-siblings-of-same-element-type = 1">
                <!-- Element type is limited to at most one instance in its parent, and this is the next to last one -->
                <xsl:variable name="instances-of-same-element-type" as="xs:integer"
                    select="count(parent::*/*[local-name(.) = local-name($this)][namespace-uri(.) = namespace-uri($this)])"/>
                <xsl:call-template name="mh:message-handler">
                    <xsl:with-param name="text" expand-text="yes">Found {$instances-of-same-element-type
                        } elements of type &lt;{local-name($this)}>. Only the last will be present in result.</xsl:with-param>
                    <xsl:with-param name="message-type">Warning</xsl:with-param>
                    <xsl:with-param name="terminate" select="false()"/>
                </xsl:call-template>        
            </xsl:when>
            <xsl:otherwise>
                <!-- Element type is limited to at most one instance in its parent, and this is the last one -->
                <xsl:apply-templates select="." mode="#default"/>
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>

    <xsl:template name="process-expected-child-elements">
        <xsl:param name="expected-child-element-names" as="xs:string+" required="yes"/>
        <xsl:variable name="context" as="element()" select="."/>
        <xsl:for-each select="$expected-child-element-names">
            <xsl:variable name="this-child-name" as="xs:string" select="."/>
            <xsl:apply-templates mode="all-or-last-only"
                select="$context/*[namespace-uri(.) = $oscal-ns][local-name(.) = $this-child-name]"/>
        </xsl:for-each>
        <!-- Pass through messages for handling in oscal-profile-RESOLVE.xsl -->
        <xsl:apply-templates select="$context/processing-instruction('message-handler')"/>
    </xsl:template>
    
    <xsl:template name="report-unexpected-child-elements">
        <xsl:param name="expected-child-element-names" as="xs:string+" required="yes"/>
        <xsl:variable name="context" as="element()" select="."/>
        <xsl:for-each select="*[not(self::opr:*)][not(
            local-name(.)=$expected-child-element-names
            and namespace-uri(.)=$oscal-ns
            )]">
            <xsl:call-template name="mh:message-handler">
                <xsl:with-param name="text" expand-text="yes">Element of type &lt;{local-name(.)}> is not valid inside &lt;{
                    local-name($context)}> and will not be present in result.</xsl:with-param>
                <xsl:with-param name="message-type">Error</xsl:with-param>
                <xsl:with-param name="terminate" select="false()"/>
            </xsl:call-template>
        </xsl:for-each>        
    </xsl:template>

    <xsl:template match="catalog">
        <xsl:variable name="context" select="." as="element(catalog)"/>
        <xsl:variable name="expected-oscal-children" as="xs:string+"
            select="('metadata','param','control','group','back-matter')"/>
        <!-- Construct portion of result. -->
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <!-- opr:* elements can occur in catalog. Put them at the top, for convenience. -->
            <xsl:apply-templates mode="all-or-last-only" select="opr:*"/>
            <xsl:call-template name="process-expected-child-elements">
                <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
            </xsl:call-template>
        </xsl:copy>        
        <!-- Report unexpected element types. -->
        <xsl:call-template name="report-unexpected-child-elements">
            <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="metadata">
        <xsl:variable name="expected-oscal-children" as="xs:string+"
            select="('title','published','last-modified','version','oscal-version',
            'revisions','document-id','prop','link','role','location','party','responsible-party','remarks')"/>
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:call-template name="process-expected-child-elements">
                <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
            </xsl:call-template>
        </xsl:copy>
        <xsl:call-template name="report-unexpected-child-elements">
            <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="group">
        <xsl:variable name="expected-oscal-children" as="xs:string+"
            select="('title','param','prop','link','part','control','group')"/>
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:call-template name="process-expected-child-elements">
                <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
            </xsl:call-template>
        </xsl:copy>
        <xsl:call-template name="report-unexpected-child-elements">
            <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="control">
        <xsl:variable name="expected-oscal-children" as="xs:string+"
            select="('title','param','prop','link','part','control')"/>
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:call-template name="process-expected-child-elements">
                <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
            </xsl:call-template>
        </xsl:copy>
        <xsl:call-template name="report-unexpected-child-elements">
            <xsl:with-param name="expected-child-element-names" select="$expected-oscal-children"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:key name="param-insertions" match="insert[@type='param']" use="@id-ref"/>

    <!-- Suppress loose param elements that do not have corresponding insert element(s)
        and that do not have an explicit instruction to keep them. -->
    <xsl:template match="catalog/param[empty(key('param-insertions',@id))][not(prop[@name='keep'][@value='always'])]
        | group/param[empty(key('param-insertions',@id))][not(prop[@name='keep'][@value='always'])]"/>

    <!-- Process back-matter, but if it has no contents in result then suppress wrapper. -->
    <xsl:template match="back-matter">
        <xsl:where-populated>
            <xsl:next-match/>
        </xsl:where-populated>
    </xsl:template>

    <xsl:key name="cross-reference" match="*[starts-with(@href,'#')]" use="substring-after(@href,'#')"/>

    <!-- Suppress resource elements that are not referenced and that do not
        have an explicit instruction to keep them. -->
    <xsl:template match="resource[empty(key('cross-reference',@uuid))][not(prop[@name='keep'][@value='always'])]"/>

</xsl:stylesheet>
