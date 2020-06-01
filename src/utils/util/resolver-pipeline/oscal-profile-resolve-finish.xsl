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
           reordering metadata, group and control contents to valid order
           removing loose orphan parameters
             orphans given inside controls are retained
           removing unclaimed inventory
             defined as any 'citation' or 'resource' in back matter
               without something somewhere linking to it
               
               
         What we are not doing:
           removing broken links
           remove opqr and xsi namespaces (that happens in the shell)   
    -->
<!-- An XQuery run on a metaschema can return a sequence of instructions
    
    let $where := 'metadata'
    for $n in (//*:define-assembly[@name=$where]/*:model/*/(@name | @ref))
    return <apply-templates mode="#current" select="{ $n }"/>
    
    -->
    
    <xsl:param name="path-to-source" as="xs:string?"/>
    
    <xsl:template match="metadata/link[@rel='resolution-source']">
        <!-- splicing together a path with '/' -->
        <link rel="resolution-source" href="{string-join(
            ($path-to-source[matches(.,'\S')],replace(@href,'.*/','')), '/')}">
            <xsl:apply-templates></xsl:apply-templates>
        </link>
    </xsl:template>

    <xsl:template match="catalog">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="metadata"/>
            <xsl:apply-templates mode="#current" select="opr:*"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="control"/>
            <xsl:apply-templates mode="#current" select="group"/>
            <xsl:apply-templates mode="#current" select="back-matter"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="metadata">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="title"/>
            <xsl:apply-templates mode="#current" select="published"/>
            <xsl:apply-templates mode="#current" select="last-modified"/>
            <xsl:apply-templates mode="#current" select="version"/>
            <xsl:apply-templates mode="#current" select="oscal-version"/>
            <xsl:apply-templates mode="#current" select="doc-id"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <xsl:apply-templates mode="#current" select="link"/>
            <xsl:apply-templates mode="#current" select="role"/>
            <xsl:apply-templates mode="#current" select="party"/>
            <xsl:apply-templates mode="#current" select="responsible-party"/>
            <xsl:apply-templates mode="#current" select="remarks"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="group">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="title"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="prop"/>
       
            <xsl:apply-templates mode="#current" select="part"/>
            <xsl:apply-templates mode="#current" select="control"/>
            <xsl:apply-templates mode="#current" select="group"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="control">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="@*"/>
            <xsl:apply-templates mode="#current" select="title"/>
            <xsl:apply-templates mode="#current" select="param"/>
            <xsl:apply-templates mode="#current" select="prop"/>
            <xsl:apply-templates mode="#current" select="annotation"/>
            <xsl:apply-templates mode="#current" select="link"/>
            <xsl:apply-templates mode="#current" select="part"/>
            <xsl:apply-templates mode="#current" select="control"/>
        </xsl:copy>
    </xsl:template>
 
  <xsl:key name="param-insertions" match="insert" use="@param-id"/>
    
  <xsl:template match="catalog/param[empty(key('param-insertions',@id))]
      | group/param[empty(key('param-insertions',@id))]"/>

    <!-- Don't copy back-matter wrapper if it has no contents in result -->
    <xsl:template match="back-matter">
        <xsl:where-populated>
            <xsl:next-match/>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:key name="cross-reference" match="*[starts-with(@href,'#')]" use="substring-after(@href,'#')"/>
    
    <xsl:template match="resource[empty(key('cross-reference',(@id,@uuid)))][not(prop[@name='keep']='always')]"/>
    
</xsl:stylesheet>