<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="xs">
   
   <xsl:output indent="yes" method="html"/>
   <!-- Context node for this template is the definition of the root element or object ...  -->
<!-- first: traverse set of definitions to build a tree
     second: prune the tree to remove duplicate listings
     third: pass this model through a rendering pass to produce a set of nested lists -->
   
   <xsl:key name="definitions" match="define-assembly | define-field | define-flag" use="@name"/>
   <xsl:key name="references"  match="assembly | assemblies | field | fields"       use="@named"/>
   <xsl:key name="references"  match="flag"                                         use="@name"/>
   
   <xsl:key name="elements-by-name" match="*" use="name()"/>
   
   <xsl:variable name="home" select="/"/>
   
   <xsl:variable name="root-definition" select="/*/*[@name = /*/@root]"/>

   <xsl:variable name="surrogate-tree">
      <xsl:apply-templates select="$root-definition" mode="build"/>
   </xsl:variable>
   <xsl:variable name="pruned-tree">
      <xsl:apply-templates select="$surrogate-tree" mode="prune"/>
   </xsl:variable>
   
   <xsl:template name="jekyll-template">
      <xsl:text>---&#xA;</xsl:text>
      <xsl:text>title: Schema map test&#xA;</xsl:text>
      <xsl:text>description: Schema map test&#xA;</xsl:text>
      <xsl:text>permalink: /schema-map/&#xA;</xsl:text>
      <xsl:text>layout: post&#xA;---&#xA;</xsl:text>
      <xsl:apply-templates mode="html-render" select="$pruned-tree"/>
   </xsl:template>
   
   <xsl:template match="/">
      <html lang="en">
         <head>
            <title>Schema ToC</title>
            <style type="text/css">
div.map { margin-top: 0ex; margin-bottom: 0ex; margin-left: 2em; font-family: monospace; font-weight: bold; color: midnightblue } 
div.map p { margin: 0ex }
span.lit { font-family: serif; font-weight: normal; color: darkgrey }
a { color: inherit; text-decoration: none }
a:hover { text-decoration: underline }

            </style>
         </head>
         <body>
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
         <xsl:if test="m:keep-me(.)">
            <xsl:apply-templates mode="prune"/>
         </xsl:if>
      </xsl:copy>
   </xsl:template>

   <xsl:function name="m:keep-me" as="xs:boolean">
      <xsl:param name="who" as="element()"/>
      <xsl:apply-templates select="$who" mode="keep-me"/>
   </xsl:function>
   
   <xsl:template mode="keep-me" priority="1" match="m:control/*" as="xs:boolean">
      <xsl:sequence select="true()"/>
   </xsl:template>
   
   <xsl:template mode="keep-me" match="*[name() = //m:control/*/name()]" as="xs:boolean">
      <xsl:sequence select="false()"/>
   </xsl:template>
   
   <xsl:template mode="keep-me" match="*" as="xs:boolean">
      <xsl:variable name="depth" select="min(key('elements-by-name',name(.))/count(ancestor-or-self::*))"/>
      <xsl:sequence select=". is key('elements-by-name',name(.))[count(ancestor-or-self::*)=$depth][1]"/>
   </xsl:template>
   
   <xsl:template match="define-assembly | define-field" mode="build">
      <xsl:param name="singleton" select="false()"/>
      <xsl:param name="required" select="false()"/>
      <xsl:param name="visited" select="()" tunnel="true"/>
      <xsl:variable name="imported" select="/*/import[@name=current()/@acquire-from]/document(@href,$home)"/>
      <xsl:variable name="this-model" select="(model,$imported/key('definitions',current()/@name,.)/model)[1]"/>
      <xsl:element name="m:{ @name }" namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0">
         <xsl:attribute name="m:type" select="replace(local-name(),'^define\-','')"/>
         <xsl:attribute name="m:singleton" select="$singleton"/>
         <xsl:attribute name="m:required"  select="$required"/>
         <xsl:for-each select="@as">
            <xsl:attribute name="m:as"  select="."/>
         </xsl:for-each>
         <xsl:for-each select="flag">
            <xsl:attribute name="{ @name }" select="(@datatype,'string')[1]"/>
         </xsl:for-each>
         <xsl:if test="not(@name = $visited)">
            <xsl:apply-templates select="$this-model" mode="build">
               <xsl:with-param name="visited" tunnel="true" select="$visited, string(@name)"/>
            </xsl:apply-templates>
         </xsl:if>
      </xsl:element>
   </xsl:template>

   <xsl:template match="text()" mode="build"/>
   
   <xsl:template mode="build" match="model//field | model//assembly">
      <xsl:apply-templates mode="build" select="key('definitions', @named, $home)">
         <xsl:with-param name="singleton" select="true()"/>
         <xsl:with-param name="required" select="@required = ('yes', 'true')"/>
      </xsl:apply-templates>
   </xsl:template>
   
   <xsl:template mode="build" match="model//fields | model//assemblies">
      <xsl:apply-templates mode="build" select="key('definitions', @named, $home)"/>
   </xsl:template>
   
   <xsl:template mode="build" match="prose">
      <m:prose/>
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
      <div>
      <h3>Schema map</h3>
         <p>Elements are optional unless noted as <q>required</q>, and repeatable unless noted as <q>one only</q>.</p>
      <div class="map">
         <xsl:apply-templates mode="html-render"/>
      </div>
      </div>
   </xsl:template>

   <xsl:template mode="html-render" match="@m:*"/>
   
   <xsl:template match="*" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <p>
         <xsl:text>&lt;</xsl:text>
         <a class="name" href="#{local-name()}">
            <xsl:value-of select="local-name()"/>
         </a>
         <xsl:apply-templates select="@*" mode="#current"/>
         <xsl:if test="not(matches($contents,'\S'))">/</xsl:if>
         <xsl:text>></xsl:text>
         <xsl:if test="matches($contents,'\S')">
            <xsl:sequence select="$contents"/>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>></xsl:text>
         </xsl:if>
         <xsl:call-template name="cardinality-note"/>
      </p>
   </xsl:template>

   <xsl:template match="*[@m:type='assembly']" mode="html-render">
      <xsl:variable name="contents">
         <xsl:apply-templates select="." mode="contents"/>
      </xsl:variable>
      <div>
         <p>
            <xsl:text>&lt;</xsl:text>
            <a class="name" href="#{local-name()}">
               <xsl:value-of select="local-name()"/>
            </a>
            <xsl:apply-templates select="@*" mode="#current"/>
            <xsl:call-template name="cardinality-note"/>
         </p>
         <xsl:sequence select="$contents"/>
         <p>
            <xsl:text>&lt;/</xsl:text>
            <xsl:value-of select="local-name()"/>
            <xsl:text>></xsl:text>
         </p>
      </div>
   </xsl:template>
   
   <xsl:template name="cardinality-note">
      <xsl:variable name="note">
         <xsl:variable name="singleton" select="@m:singleton = 'true'"/>
         <xsl:variable name="required" select="@m:required = 'true'"/>
         <xsl:if test="$singleton">one only</xsl:if>
         <xsl:if test="$required">
            <xsl:if test="$singleton">, </xsl:if>
            <xsl:text>required</xsl:text>
         </xsl:if>
      </xsl:variable>
      <xsl:if test="matches($note, '\S')" expand-text="true">
         <span class="lit"> ({ $note })</span>
      </xsl:if>
   </xsl:template>
   
   <xsl:template mode="contents" match="*[@m:type='assembly']">
      <div class="map">
         <xsl:apply-templates mode="html-render"/>
      </div>
   </xsl:template>
   
   <xsl:template mode="contents" match="*[@m:type='field']">
      <span class="lit">string value</span>
   </xsl:template>

   <xsl:template mode="contents" priority="2" match="*[@m:type='field'][@m:as = 'mixed']">
      <span class="lit">mixed content</span>
   </xsl:template>
   
   <xsl:template mode="contents" priority="2" match="*[@m:type='field'][@m:as = ('boolean,empty')]"/>

   

   
   <xsl:template mode="html-render" match="m:prose">
      <p><i>Prose contents (paragraphs, lists, headers and tables)</i></p>
   </xsl:template>

   <xsl:template match="@*" mode="html-render">
      <xsl:text> </xsl:text>
      <a class="name" href="#{local-name()}">
         <xsl:value-of select="local-name()"/>
      </a>
      <xsl:text>="</xsl:text>
      <span class="lit">
         <xsl:text>{</xsl:text>
        <xsl:value-of select="."/>
         <xsl:text>}</xsl:text>
      </span>
      <xsl:text>"</xsl:text>

   </xsl:template>
</xsl:stylesheet>