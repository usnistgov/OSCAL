<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"

   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">

   <xsl:param as="xs:string" name="model-label">oscal-catalog-xml</xsl:param>

   <xsl:variable as="xs:string" name="path-to-docs" select="'../json-schema/'"/>

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

   <xsl:template mode="html-render" match="m:flag[(@name)= ../@json-key-flag]"/>



   <xsl:template priority="2" match="*[@group-json='BY_KEY'][@json-type='SCALAR']" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <span class="OM-name">
            <xsl:text>{{ "{{" }}</xsl:text>
            <xsl:value-of select="@json-key-flag"/>
            <xsl:text>}}</xsl:text>
         </span>
         <span class="OM-lit">
            <xsl:text>, labeling </xsl:text>
            <xsl:if test="@max-occurs='1'">
               <xsl:value-of select="m:indefinite-article(@name)"/>
               <xsl:text> </xsl:text>
            </xsl:if>
         </span>
         <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
            <xsl:value-of select="@name"/>
         </a>
         <xsl:text>: </xsl:text>
         <xsl:apply-templates select="." mode="contents-inline"/>
         <xsl:call-template name="cardinality-note"/>
         <xsl:if test="not(position() eq last())">
            <span class="OM-lit">,</span></xsl:if>
      </p>
   </xsl:template>

   <xsl:template priority="2" match="*[@group-json='BY_KEY']" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <div class="OM-entry{ ' open'[$first] }">
         <p>
            <span class="OM-view_switcher"/>
            <span class="OM-name">
               <xsl:text>{{ "{{" }}</xsl:text>
               <xsl:value-of select="@json-key-flag"/>
               <xsl:text>}}</xsl:text>
            </span>
            <span class="OM-lit">
               <xsl:text>, labeling </xsl:text>
               <xsl:if test="@max-occurs='1'">
                  <xsl:value-of select="m:indefinite-article(@name)"/>
                  <xsl:text> </xsl:text>
               </xsl:if>
            </span>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
               <xsl:value-of select="@name"/>
            </a>
            <span class="OM-lit"> object<xsl:if test="not(@max-occurs='1')">s</xsl:if>: </span>
            <xsl:call-template name="cardinality-note"/>
            <span class="OM-lit"> {</span>

         </p>
         <xsl:apply-templates select="." mode="contents-as-block"/>
         <p>
            <span class="OM-lit">
               <xsl:text> }</xsl:text>
               <xsl:if test="not(position() eq last())">, </xsl:if>
            </span>
         </p>
      </div>
   </xsl:template>

   <xsl:template match="*[@json-type='OBJECT']" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <div class="OM-entry{ ' open'[$first] }">
         <p>
            <span class="OM-view_switcher"/>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
               <xsl:value-of select="@name"/>
            </a>
            <xsl:text>: </xsl:text>
            <xsl:call-template name="cardinality-note"/>
            <span class="OM-lit"> {</span>
         </p>
         <xsl:apply-templates select="." mode="contents-as-block"/>
         <p>
            <span class="OM-lit">
               <xsl:text> }</xsl:text>
               <xsl:if test="not(position() eq last())">, </xsl:if>
            </span>
         </p>
      </div>
   </xsl:template>


   <xsl:template match="*[@json-type='ARRAY']" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <div class="OM-entry{ ' open'[$first] }">
         <p>
            <span class="OM-view_switcher"/>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ @name }">
               <xsl:value-of select="(@group-name,@name)[1]"/>
            </a>
            <xsl:text>: </xsl:text>
            <xsl:call-template name="cardinality-note"/>
            <span class="OM-lit"> [ {</span>
         </p>
         <xsl:apply-templates select="." mode="contents-as-block"/>
         <p>
            <span class="OM-lit">
               <xsl:text>} ]</xsl:text>
               <xsl:if test="not(position() eq last())">, </xsl:if>
            </span>
         </p>
      </div>
   </xsl:template>



   <!--<xsl:template match="m:field[@as-type='markup-multiline'][not(@wrap-xml='yes')]" mode="html-render">
      <p class="OM-entry"><a href="../../schemas/oscal-prose"><i>Prose contents (paragraphs, lists, headers and tables)</i></a></p>
   </xsl:template>-->


   <xsl:template match="m:field[@json-type='SCALAR']" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ (@link,@name)[1] }">
            <xsl:value-of select="@name"/>
         </a>
         <xsl:text>: </xsl:text>
         <xsl:apply-templates select="." mode="contents-inline"/>
         <xsl:call-template name="cardinality-note"/>
         <xsl:if test="not(position() eq last())">
            <span class="OM-lit">,</span></xsl:if>
      </p>
   </xsl:template>

   <xsl:template priority="5" match="m:field[@json-type='SCALAR'][exists(m:flag[not(@name=../(json-key|json-value-key)/@flag-name)])]" mode="html-render">
       <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <div class="OM-entry{ ' open'[$first] }">
         <p>
            <span class="OM-view_switcher"/>
            <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ (@link,@name)[1] }">
               <xsl:value-of select="@name"/>
            </a>
            <xsl:text>: </xsl:text>
            <xsl:call-template name="cardinality-note"/>
            <span class="OM-lit"> {</span>
         </p>
         <xsl:apply-templates select="." mode="contents-as-block"/>
         <p><span class="OM-lit">} <xsl:if test="not(position() eq last())">,</xsl:if></span></p>
      </div>
   </xsl:template>

   <xsl:template mode="html-render" match="m:flag[@name= ../@json-value-flag]">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <span class="OM-name">
            <xsl:text>{{ "{{" }}</xsl:text>
            <xsl:value-of select="@name"/>
            <xsl:text>}}: </xsl:text>
         </span>
         <xsl:apply-templates select="." mode="contents-inline"/>
         <xsl:call-template name="cardinality-note"/>
         <xsl:if test="not(position() eq last())"><span class="OM-lit">,</span></xsl:if>
      </p>
   </xsl:template>

   <xsl:template match="*" mode="html-render">
      <xsl:variable name="first" select=". is key('surrogates-by-name',@name)[1]"/>
      <p class="OM-entry{ ' open'[$first] }">
         <a class="OM-name" href="{ $path-to-docs }#{ $model-label}_{ (@link,@name)[1] }">
            <xsl:value-of select="@name"/>
         </a>
         <xsl:text>: </xsl:text>
         <xsl:apply-templates select="." mode="contents-inline"/>
         <xsl:call-template name="cardinality-note"/>
         <xsl:if test="not(position() eq last())"><span class="OM-lit">,</span></xsl:if>
      </p>
   </xsl:template>

   <xsl:template name="cardinality-note">
     <!-- <b class="OM-cardinality">
         <xsl:choose>
            <xsl:when test="@min-occurs = '1'">required</xsl:when>
            <xsl:otherwise>optional</xsl:otherwise>
         </xsl:choose>
      </b>-->
      <xsl:text> </xsl:text>
      <span class="OM-cardinality">
        <xsl:apply-templates select="." mode="occurrence-code"/>
      </span>
   </xsl:template>

   <xsl:template name="array-cardinality"/>

   <!--<xsl:template name="array-cardinality">
      <b class="OM-cardinality">
         <xsl:call-template name="occurrences"/>
      </b>
   </xsl:template>-->

   <!-- <xsl:template name="occurrences">
      <xsl:param name="leader" select="''"/>
      <xsl:value-of select="$leader"/>
      <xsl:choose>
         <xsl:when test="@max-occurs = '1'">
            <xsl:text>one only</xsl:text>
         </xsl:when>
         <xsl:when test="@min-occurs = @max-occurs">
            <xsl:text>exactly </xsl:text>
            <xsl:value-of select="m:spell-number(@min-occurs)"/>
         </xsl:when>
         <xsl:when test="number(@min-occurs) gt 1">
            <xsl:text>at least </xsl:text>
            <xsl:value-of select="m:spell-number(@min-occurs)"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="not(@max-occurs = '1' or (@min-occurs = @max-occurs))">
         <xsl:choose>
            <xsl:when test="@max-occurs = 'unbounded'">as many as needed</xsl:when>
            <xsl:otherwise>
               <xsl:text>at most </xsl:text>
               <xsl:value-of select="m:spell-number(@max-occurs)"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>-->

   <xsl:template mode="contents-as-block" match="*">
      <div class="OM-map">
         <xsl:apply-templates select="." mode="value"/>
         <xsl:apply-templates select="*" mode="html-render"/>
      </div>
   </xsl:template>

   <xsl:template mode="contents-inline" match="*">
      <xsl:apply-templates select="." mode="datatype"/>
   </xsl:template>


   <xsl:template mode="value" match="m:assembly"/>

   <xsl:template match="*" mode="value">
      <p class="OM-entry">
         <span class="OM-name">STRVALUE: </span>
         <xsl:apply-templates select="." mode="datatype"/>
         <span class="OM-cardinality"> [0 or 1]</span>

         <xsl:if test="m:flag[not(@name=../(json-key | json-value-key)/@flag-name)]"><span class="OM-lit">,</span></xsl:if>
      </p>
   </xsl:template>

   <xsl:template match="*[@as-type='markup-line']" mode="value">
      <p class="OM-entry">
         <span class="OM-name">RICHTEXT: </span>
         <xsl:apply-templates select="." mode="datatype"/>
         <span class="OM-cardinality"> [0 or 1]</span>
         <xsl:if test="m:flag[not((@name | @ref) = ../(json-key | json-value-key)/@flag-name)]">
            <span class="OM-lit">,</span>
         </xsl:if>
      </p>
   </xsl:template>


   <xsl:template match="*[@json-value-flag=m:flag/@name]" mode="value datatype"/>

   <xsl:template match="*" mode="datatype">
      <span class="OM-emph">string</span>
   </xsl:template>

   <xsl:template priority="2" match="*[@as-type='markup-multiline']" mode="datatype">
      <span class="OM-emph">text, parsed as Markdown (multiple lines)</span>
   </xsl:template>

   <xsl:template match="*[exists(@as-type)]" mode="datatype">
      <span class="OM-emph">
         <xsl:value-of select="@as-type"/>
      </span>
   </xsl:template>

   <xsl:template priority="2" match="*[@as-type='empty']" mode="value"/>


</xsl:stylesheet>
