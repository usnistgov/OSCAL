<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="#all"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >

    <xsl:template match="* | @*" mode="#all">
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
           - Some "[last()]" expressions are expected to have no effect
             if input documents are schema-valid but are included to
             avoid producing schema-invalid output.
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

    <xsl:template match="catalog">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="metadata[last()]"/>
            <xsl:apply-templates mode="#current" select="opr:*"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="control"/>
            <xsl:apply-templates mode="#current" select="group"/>
            <xsl:apply-templates mode="#current" select="back-matter[last()]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="metadata">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="title[last()]"/>
            <xsl:apply-templates mode="#current" select="published[last()]"/>
            <xsl:apply-templates mode="#current" select="last-modified[last()]"/>
            <xsl:apply-templates mode="#current" select="version[last()]"/>
            <xsl:apply-templates mode="#current" select="oscal-version[last()]"/>
            <xsl:apply-templates mode="#current" select="revisions[last()]"/>
            <xsl:apply-templates mode="#current" select="document-id"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <xsl:apply-templates mode="#current" select="link"/>
            <xsl:apply-templates mode="#current" select="role"/>
            <xsl:apply-templates mode="#current" select="location"/>
            <xsl:apply-templates mode="#current" select="party"/>
            <xsl:apply-templates mode="#current" select="responsible-party"/>
            <xsl:apply-templates mode="#current" select="remarks[last()]"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="group">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="title[last()]"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <xsl:apply-templates mode="#current" select="link"/>

            <xsl:apply-templates mode="#current" select="part"/>
            <xsl:apply-templates mode="#current" select="control"/>
            <xsl:apply-templates mode="#current" select="group"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="control">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <!-- Keep only the last title. There could be multiple titles if
                modify phase processed alter/add/title. -->
            <xsl:apply-templates mode="#current" select="title[last()]"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <xsl:apply-templates mode="#current" select="link"/>
            <xsl:apply-templates mode="#current" select="part"/>
            <xsl:apply-templates mode="#current" select="control"/>
        </xsl:copy>
    </xsl:template>

    <xsl:key name="param-insertions" match="insert[@type='param']" use="@id-ref"/>

    <!-- Suppress loose param elements that do not have corresponding insert element(s)
        and that do not have an explicit instruction to keep them. -->
    <xsl:template match="catalog/param[empty(key('param-insertions',@id))][not(prop[@name='keep'][@value='always'])]
        | group/param[empty(key('param-insertions',@id))][not(prop[@name='keep'][@value='always'])]"/>

    <!-- Don't copy back-matter wrapper if it has no contents in result -->
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
