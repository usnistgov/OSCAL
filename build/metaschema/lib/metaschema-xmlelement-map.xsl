<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">
   
   <xsl:param as="xs:string" name="model-label">oscal-catalog-xml</xsl:param>
   
   <xsl:variable as="xs:string" name="path-to-docs" select="'../../schemas/' || $model-label"/>
   
   <xsl:output indent="yes" method="html"/>
   <!-- Context node for this template is the definition of the root element or object ...  -->
<!-- first: traverse set of definitions to build a tree
     second: prune the tree to remove duplicate listings
     third: pass this model through a rendering pass to produce a set of nested lists -->
   
  <xsl:import href="metaschema-docs-util.xsl"/>
   
   <!--<xsl:variable name="home" select="/"/>-->
   
   
   <!--<xsl:template name="jekyll-template">
      <xsl:text>-\-\-&#xA;</xsl:text>
      <xsl:text>title: Schema map test&#xA;</xsl:text>
      <xsl:text>description: Schema map test&#xA;</xsl:text>
      <xsl:text>permalink: /schema-map/&#xA;</xsl:text>
      <xsl:text>layout: post&#xA;-\-\-&#xA;</xsl:text>
      <xsl:apply-templates mode="html-render" select="$pruned-tree"/>
   </xsl:template>-->
   
    
<!-- For debugging, to produce standalone HTML, call template 'make-page' in metaschema-docs-util.xsl  -->
   
   <xsl:template match="/" mode="static-view">
      <div class="OM-map">
         <xsl:apply-templates select="$pruned-tree/*" mode="html-render"/>
      </div>
   </xsl:template>
   
   <xsl:template match="/">
      <div class="OM-map">
         <xsl:variable name="html-basic">
            <xsl:apply-templates select="$surrogate-tree/*" mode="html-render"/>
         </xsl:variable>
         <xsl:apply-templates select="$html-basic" mode="elaborate"/>
      </div>
   </xsl:template>
   
   <xsl:template mode="html-render" match="@m:*"/>
   
   <xsl:template match="*" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <xsl:text>&lt;</xsl:text>
         <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
            <xsl:value-of select="@name"/>
         </a>
         <xsl:apply-templates select="m:flag" mode="#current"/>
         <xsl:if test="not(matches($contents,'\S'))">/</xsl:if>
         <xsl:text>></xsl:text>
         <xsl:if test="matches($contents,'\S')">
            <xsl:sequence select="$contents"/>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>></xsl:text>
         </xsl:if>
         <xsl:call-template name="cardinality-note"/>
      </p>
   </xsl:template>

   <!-- matching assemblies containing children other than flags after pruning -->
   <xsl:template match="m:assembly[exists(* except m:flag)]" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <div class="OM-entry{ ' open'[$first] }">
         <p>
            <span class="OM-view_switcher"/>
            <xsl:text>&lt;</xsl:text>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
               <xsl:value-of select="@name"/>
            </a>
            <xsl:apply-templates select="m:flag" mode="#current"/>
            <xsl:text>&gt;</xsl:text>
            <xsl:call-template name="cardinality-note"/>
         </p>
         <xsl:sequence select="$contents"/>
         <p>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>></xsl:text>
         </p>
      </div>
   </xsl:template>
   
   <xsl:template match="m:flag" mode="html-render">
      <xsl:text> </xsl:text>
      <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @link }">
         <xsl:value-of select="@name"/>
      </a>
      <xsl:text>="</xsl:text>
      <span class="OM-emph">
         <xsl:value-of select="(@as-type,'string')[1]"/>
      </span>
      <xsl:text>"</xsl:text>
   </xsl:template>
   
   <xsl:template mode="html-render" match="m:field[@as-type='markup-multiline'][not(@wrap-xml='yes')]">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <a href="../../schemas/datatype"><i>Prose contents (paragraphs, lists, headers and tables)</i></a>
      </p>
   </xsl:template>
   
   <xsl:template name="cardinality-note">
      <xsl:text> </xsl:text>
      <span class="OM-cardinality">
         <xsl:apply-templates select="." mode="occurrence-code"/>
      </span>
   </xsl:template>
   
   <!--<xsl:template name="cardinality-note">
      <xsl:variable name="note">
         <xsl:variable name="singleton" select="@m:maxOccurs = '1'"/>
         <xsl:variable name="required" select="not(@m:minOccurs = '0')"/>
         <xsl:if test="$singleton">one only</xsl:if>
         <xsl:if test="$required">
            <xsl:if test="$singleton">, </xsl:if>
            <xsl:text>required</xsl:text>
         </xsl:if>
         <xsl:if test="not(@m:minOccurs='1')">, at least <xs:value-of select="@minOccurs"/></xsl:if>
         <xsl:if test="not(@m:maxOccurs=('unbounded','1'))">, at most <xs:value-of select="@maxOccurs"/></xsl:if>
      </xsl:variable>
      <xsl:if test="matches($note, '\S')" expand-text="true">
         <span class="lit"> ({ $note })</span>
      </xsl:if>
   </xsl:template>-->
   
   <xsl:template mode="contents" match="m:assembly">
      <div class="OM-map">
         <xsl:apply-templates select="* except m:flag" mode="html-render"/>
      </div>
   </xsl:template>
   
   <!-- We don't have to do flags here since they are promoted into attribute syntax. -->
   <xsl:template mode="contents" match="m:field">
      <span class="OM-emph">string</span>
   </xsl:template>
   
   <xsl:template mode="contents" match="m:field[matches(@as-type,'\S')]">
      <span class="OM-emph">
        <xsl:value-of select="@as-type"/>
      </span>
   </xsl:template>

   
</xsl:stylesheet>