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
   
   <xsl:variable name="serialization-settings">
      <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
         <output:indent value="yes"/>
      </output:serialization-parameters>
   </xsl:variable>
   
   <!-- For debugging, to produce standalone HTML, call template 'make-page' in metaschema-docs-util.xsl  -->
   
   <xsl:template match="/">
      <div class="OM-map">
         <xsl:apply-templates select="$pruned-tree/*" mode="html-render"/>
      </div>
   </xsl:template>

   <xsl:template mode="html-render" match="@m:*"/>
   
   <xsl:template match="*" mode="html-render">
      <p class="OM-entry">
         <xsl:text>{ '</xsl:text>
         <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
            <xsl:value-of select="@name"/>
         </a>
         <xsl:text>': </xsl:text>
         <xsl:apply-templates select="." mode="contents"/>
         <xsl:text> }</xsl:text>
         <xsl:if test="not(position() eq last())">, </xsl:if>
      </p>
   </xsl:template>

   <xsl:template match="m:assembly" mode="html-render">
      <div class="OM-entry">
         <p>
            <xsl:text>{ '</xsl:text>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
               <xsl:value-of select="@name"/>
            </a>
            <xsl:text>': </xsl:text>
         </p>
         <xsl:apply-templates select="." mode="contents"/>
         <p>
            <xsl:text>}</xsl:text>
            <xsl:if test="not(position() eq last())">, </xsl:if>
         </p>
      </div>
   </xsl:template>
   
   <xsl:template mode="html-render" match="m:field[@as-type='markup-multiline'][not(@wrap-xml='yes')]">
      <p class="OM-entry"><a href="../../schemas/oscal-prose"><i>Prose contents (paragraphs, lists, headers and tables)</i></a></p>
   </xsl:template>
   
   <!--<xsl:template name="cardinality-note">
      <xsl:text> </xsl:text>
      <i class="OM-cardinality">
         <xsl:apply-templates select="." mode="occurrence-requirements"/>
      </i>
   </xsl:template>-->
   
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
         <xsl:apply-templates select="*" mode="html-render"/>
      </div>
   </xsl:template>
   
   <xsl:template mode="contents" match="m:field | m:flag">
      <span class="OM-lit">string value</span>
   </xsl:template>
   
   <xsl:template mode="contents" match="m:field[matches(@as-type,'\S')] | m:flag[matches(@as-type,'\S')]">
      <span class="OM-lit">
        <xsl:value-of select="@as-type"/>
      </span>
   </xsl:template>
   
   
</xsl:stylesheet>