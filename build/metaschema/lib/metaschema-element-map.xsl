<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">
   
   <xsl:output indent="yes" method="html"/>
   <!-- Context node for this template is the definition of the root element or object ...  -->
<!-- first: traverse set of definitions to build a tree
     second: prune the tree to remove duplicate listings
     third: pass this model through a rendering pass to produce a set of nested lists -->
   
   <xsl:key name="definitions" match="define-assembly | define-field | define-flag" use="@name"/>
   <xsl:key name="references"  match="assembly | field"                             use="@ref"/>
   <xsl:key name="references"  match="flag"                                         use="@ref"/>
   
   <xsl:import href="metaschema-docs-util.xsl"/>
   
   <xsl:key name="elements-by-name" match="*" use="@name"/>
   
   <!--<xsl:variable name="home" select="/"/>-->
   
   <xsl:variable name="root-definition" select="/*/*[@name = /*/@root]"/>

   <xsl:variable name="surrogate-tree">
      <xsl:apply-templates select="$root-definition" mode="build">
         <xsl:with-param name="minOccurs">1</xsl:with-param>
      </xsl:apply-templates>
   </xsl:variable>
   <xsl:variable name="pruned-tree">
      <xsl:apply-templates select="$surrogate-tree" mode="prune"/>
   </xsl:variable>
   
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
   
   <xsl:template match="/">
      <html lang="en">
         <head>
            <title>Schema ToC</title>
            <style type="text/css">
div.OM-map { margin-top: 0ex; margin-bottom: 0ex; margin-left: 2em; font-family: monospace; font-weight: bold; color: midnightblue } 
div.OM-map p { margin: 0ex }
span.OM-lit { font-family: serif; font-weight: normal; color: darkgrey }
.OM-map a { color: inherit; text-decoration: none }
.OM-map a:hover { text-decoration: underline }

            </style>
         </head>
         <body>
            <!--<pre>
               <xsl:value-of select="serialize($pruned-tree, $serialization-settings/* )"/>
            </pre>-->
            <!--<pre>
               <xsl:value-of select="serialize($surrogate-tree, $serialization-settings/* )"/>
            </pre>-->
            <xsl:apply-templates mode="html-render" select="$pruned-tree"/>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="*" mode="prune">
      <!-- we want to prune any element that isn't first
           in breadth-first traversal
      this is the first of the nodes with the fewest ancestors -->
      <xsl:copy>
         <xsl:copy-of select="@*"/>
         <xsl:copy-of select="m:flag"/>
         <xsl:if test="m:keep-me(.)">
            <xsl:apply-templates mode="prune"/>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <!-- copied above -->
   <xsl:template match="m:flag" mode="prune"/>
   
   <xsl:function name="m:keep-me" as="xs:boolean">
      <xsl:param name="who" as="element()"/>
      <xsl:apply-templates select="$who" mode="keep-me"/>
   </xsl:function>
   
   <xsl:template mode="keep-me" priority="1" match="m:assembly[@name='control']//*" as="xs:boolean">
      <xsl:sequence select=". is key('elements-by-name',@name,ancestor::m:assembly[@name='control'])[1]"/>
   </xsl:template>
   
   <xsl:template mode="keep-me" match="*[@name = //m:assembly[@name='control']//*/@name]" as="xs:boolean">
      <xsl:sequence select="false()"/>
   </xsl:template>
   
   <!--<xsl:template mode="keep-me" match="*" as="xs:boolean">
      <xsl:sequence select="true()"/>
   </xsl:template>-->
   
   <xsl:template mode="keep-me" match="*" as="xs:boolean">
      <xsl:variable name="depth" select="min(key('elements-by-name',@name)/count(ancestor-or-self::*))"/>
      <xsl:sequence select=". is key('elements-by-name',@name)[count(ancestor-or-self::*)=$depth][1]"/>
   </xsl:template>
   
   <xsl:template match="define-assembly | define-field" mode="build">
      <xsl:param name="minOccurs" select="'0'"/>
      <xsl:param name="maxOccurs" select="'1'"/>
      <xsl:param name="visited" select="()" tunnel="true"/>
      <xsl:variable name="type" select="replace(local-name(),'^define\-','')"/>
      
      <xsl:element name="m:{ $type }" namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0">
         <xsl:apply-templates select="@*" mode="build"/>
         <xsl:attribute name="min-occurs" select="$minOccurs"/>
         <xsl:attribute name="max-occurs" select="$maxOccurs"/>
         <xsl:apply-templates select="flag" mode="build"/>
         <xsl:if test="not(@name = $visited)">
            <xsl:apply-templates select="model" mode="build">
               <xsl:with-param name="visited" tunnel="true" select="$visited, string(@name)"/>
            </xsl:apply-templates>
         </xsl:if>
      </xsl:element>
   </xsl:template>
   
   <xsl:template match="@module | @ref" mode="build"/>
   
   <xsl:template match="@*" mode="build">
     <xsl:copy-of select="."/>
   </xsl:template>
   
   <xsl:template match="flag" mode="build">
         <m:flag>
            <xsl:attribute name="name" select="(@name,@ref)[1]"/>
            <xsl:apply-templates select="@*" mode="build"/>
         </m:flag>
   </xsl:template>

   <xsl:template match="text()" mode="build"/>
   
   <xsl:template mode="build" match="model//field | model//assembly">
      <xsl:apply-templates mode="build" select="key('definitions', @ref)">
         <xsl:with-param name="minOccurs" select="(@min-occurs,'0')[1]"/>
         <xsl:with-param name="maxOccurs" select="(@max-occurs,'1')[1]"/>
      </xsl:apply-templates>
   </xsl:template>
   
   
   
   <!--<xsl:template mode="build" match="choice">
      <m:choice>
         <xsl:apply-templates mode="#current"/>
      </m:choice>
   </xsl:template>-->
   
   <xsl:template mode="build" match="description | remarks">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   
   <xsl:template mode="build" match="*">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   
   

   <xsl:template match="/" mode="html-render">
      <div class="OM-map">
         <xsl:apply-templates mode="html-render"/>
      </div>
   </xsl:template>

   <xsl:template mode="html-render" match="@m:*"/>
   
   <xsl:template match="*" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <p>
         <xsl:text>&lt;</xsl:text>
         <a class="OM-name" href="#{@name}">
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

   <xsl:template match="m:assembly[exists(* except m:flag)]" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <div>
         <p>
            <xsl:text>&lt;</xsl:text>
            <a class="OM-name" href="#{ @name }">
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
   
   <xsl:template mode="html-render" match="m:field[@as-type='markup-multiline'][not(@wrap-xml='yes')]">
      <p><i>Prose contents (paragraphs, lists, headers and tables)</i></p>
   </xsl:template>
   
   <xsl:template name="cardinality-note">
      <xsl:text> </xsl:text>
      <i class="OM-cardinality">
         <xsl:apply-templates select="." mode="occurrence-requirements"/>
      </i>
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
   
   <xsl:template mode="contents" match="m:field">
      <span class="OM-lit">string value</span>
   </xsl:template>
   
   <xsl:template mode="contents" match="m:field[matches(@as-type,'\S')]">
      <span class="OM-lit">
        <xsl:value-of select="@as-type"/>
      </span>
   </xsl:template>
   
   <xsl:template match="m:flag" mode="html-render">
      <xsl:text> </xsl:text>
      <a class="OM-name" href="#{ @name }">
         <xsl:value-of select="@name"/>
      </a>
      <xsl:text>="</xsl:text>
      <span class="OM-lit">
         <xsl:text>{</xsl:text>
        <xsl:value-of select="(@as-type,'string')[1]"/>
         <xsl:text>}</xsl:text>
      </span>
      <xsl:text>"</xsl:text>

   </xsl:template>
</xsl:stylesheet>