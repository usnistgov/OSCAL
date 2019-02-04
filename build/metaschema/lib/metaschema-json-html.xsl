<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="xs m">

<!-- Purpose: XSLT 1.0 stylesheet for simple display of Metaschema in browsers (HTML) -->
<!-- Input:   Metaschema -->
<!-- Output:  HTML  -->
<!-- Note:    An XSLT 1.0 stylesheet may even work in your browser (try FF)  -->

<xsl:import href="metaschema-common-html.xsl"/>
   
   
   
<xsl:output indent="yes"/>
   
   <xsl:template match="/">
      <html>
         <head>
            <xsl:call-template name="css"/>
         </head>
         <body>
            <xsl:apply-templates/>
         </body>
      </html>
   </xsl:template>

   <xsl:template match="m:METASCHEMA">
      <div class="METASCHEMA">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template match="m:METASCHEMA/m:schema-name">
      <h2 class="title">
         <xsl:apply-templates/>
         <xsl:text>: JSON Schema</xsl:text>
      </h2>
   </xsl:template>
   
   <xsl:template priority="5"
      match="m:define-flag[not(@show-docs='json' or @show-docs='xml json')] |
      m:define-field[not(@show-docs='json' or @show-docs='xml json')] |
      m:define-assembly[not(@show-docs='json' or @show-docs='xml json')]"/>
   
   <xsl:key name="single-invocations" match="m:define-flag | m:define-field | m:define-assembly"
      use="m:flag/@name | m:model//m:field/@named | m:model//m:assembly/@named"/>
   
   <xsl:key name="group-invocations" match="m:define-field | m:define-assembly"
      use="m:model//m:fields/@named | m:model//m:assemblies/@named"/>
   
   <xsl:template match="m:define-flag">
      <div class="define-flag" id="{@name}">
         <h3>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> object</h3>
         <xsl:apply-templates/>
         <xsl:apply-templates select="." mode="occurrence"/>
      </div>
   </xsl:template>
   
   <xsl:template match="m:define-flag" mode="occurrence">
      <div class="remarks">
         <p><xsl:apply-templates select="@name"/>
         <xsl:text> will appear as a string property except as noted.</xsl:text>
      </p>
         <xsl:call-template name="invocations"/>
      </div>
   </xsl:template>
   
   <xsl:template  match="m:define-field">
      <div class="define-field" id="{@name}">
         <h3>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> object</h3>
         <xsl:apply-templates select="m:formal-name | m:description"/>
         <xsl:apply-templates select="." mode="occurrence"/>
         <xsl:variable name="to-props" select="m:flag | @as[.='string'] | @as[.='mixed'] | self::node()[not(@as)]"/>
         <xsl:if test="$to-props">
            <div class="model">
               <p>The <xsl:apply-templates select="@name"/>
                  <xsl:text> object has </xsl:text>
                  <xsl:choose>
                     <xsl:when test="count($to-props) &gt; 1">properties:</xsl:when>
                     <xsl:otherwise>a property:</xsl:otherwise>
                  </xsl:choose>
               </p>
               <ul>
                  <xsl:apply-templates select="m:flag" mode="model"/>
                  <xsl:apply-templates select="." mode="value-property"/>
               </ul>
            </div>
         </xsl:if>
         <xsl:apply-templates select="m:remarks"/>
         <xsl:apply-templates select="m:example"/>
      </div>
   </xsl:template>
   
   <xsl:template  match="m:define-field[@as='boolean']">
      <div class="define-field" id="{@name}">
         <h3>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> object</h3>
         <xsl:apply-templates select="m:formal-name | m:description"/>
         <xsl:apply-templates select="." mode="occurrence"/>
            <div class="model">
               <p><xsl:apply-templates select="@name"/> takes a Boolean value.</p>
            </div>
         <xsl:apply-templates select="m:remarks"/>
         <xsl:apply-templates select="m:example"/>
      </div>
   </xsl:template>
   
   <xsl:template mode="value-property" match="*[@as='empty']"/>
      
   <xsl:template mode="value-property" match="*">
      <li>String <code class="name">STRVALUE</code></li>
   </xsl:template>
   
   <xsl:template mode="value-property" match="*[@as='mixed']">
      <li>String <code class="name">RICHTEXT</code> (supports OSCAL markdown)</li>
   </xsl:template>
   
   <xsl:template match="m:define-field" mode="occurrence">
      <div class="remarks">
         <p><xsl:apply-templates select="@name"/>
         <xsl:text> will appear as a string property.</xsl:text>
      </p>
         <xsl:call-template name="invocations"/>
      </div>
   </xsl:template>
   
   <xsl:template match="m:define-field[m:flag] | m:define-assembly" mode="occurrence">
      <div class="remarks">
      <p><xsl:for-each select="@name">
         <xsl:call-template name="link-with-indefinite-article"/>
      </xsl:for-each>
         <xsl:text> will appear as </xsl:text>
         <xsl:choose>
            <xsl:when test="key('group-invocations', @name)/@address">a (labeled) property of an object <code class="name"><xsl:value-of select="@group-as"/></code>.</xsl:when>
            <xsl:when test="key('single-invocations', @name)">a property on an object.</xsl:when>
            <xsl:when test="key('group-invocations', @name)">a data value in an array property.</xsl:when>
            <xsl:when test="@name=/m:METASCHEMA/@root">an object, a property of the root object.</xsl:when>
         </xsl:choose>
      </p>
         <xsl:call-template name="invocations"/>
      </div>
   </xsl:template>
   
   <xsl:template name="invocations">
      <!-- objects can be (especially) addressed only by flags, so single-invocations is enough -->
      <xsl:variable name="labeling-invocations" select="key('single-invocations', @name)[@address=current()/@name]"/>
      <xsl:if test="$labeling-invocations">
         <p>
            <xsl:text> This value is given implicitly as the label of a property
               </xsl:text>
            <xsl:for-each select="$labeling-invocations">
               <xsl:if test="(position() = 2) and (position() = last())"> or </xsl:if>
               <xsl:if test="(position() > 2) and (position() = last())">, or </xsl:if>
               <xsl:if test="(position() > 1) and not(position() = last())">, </xsl:if>
               <a class="name" href="#{@name}"><xsl:value-of select="@name"/></a>
               <xsl:text> (on object </xsl:text>
               <code class="name"><xsl:value-of select="@group-as"/></code>
               <xsl:text>)</xsl:text>
            </xsl:for-each>
            <xsl:text>. The property name (label) value is taken to be its </xsl:text>
            <a class="name" href="#{@name}"><xsl:apply-templates select="@name"/></a>
            <xsl:text>.</xsl:text>
         </p>
      </xsl:if>


      <xsl:if test="key('group-invocations', @name)[@address=current()/@name]">
         <p>
            <xsl:text>On </xsl:text>
            <xsl:for-each select="key('group-invocations', @name)[@address=current()/@name]">
               <xsl:if test="(position() > 1) and not(position() = last())">, </xsl:if>
               <xsl:if test="(position() > 1) and (position() = last())"> and </xsl:if>
               <a class="name" href="#{@name}"><xsl:apply-templates select="@name"/></a>
            </xsl:for-each>, it appears unlabelled, as a member of the array (property) <code
               class="name"><xsl:value-of select="@group-as"/></code>.<xsl:text/>
         </p>
      </xsl:if>
      <xsl:if test="key('single-invocations', @name)[not(@address=current/@name)]">
         <p>
            <xsl:text>As an explicit property, </xsl:text>
            <code name="name"><xsl:value-of select="@name"/></code>
            <xsl:text> appears on </xsl:text>
            <xsl:for-each select="key('single-invocations', @name)[not(@address=current/@name)]">
               <xsl:if test="(position() > 1) and not(position() = last())">, </xsl:if>
               <xsl:if test="(position() > 1) and (position() = last())"> and </xsl:if>
               <a class="name" href="#{@name}"><xsl:apply-templates select="@name"/></a>
            </xsl:for-each>.<xsl:text/>
         </p>
      </xsl:if>


   </xsl:template>
   
   
   <xsl:template match="m:define-assembly">
      <div class="define-assembly" id="{@name}">
         <h3>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> object</h3>
         <!-- No mention of @group-as on XML side       -->
         
         <xsl:apply-templates select="m:formal-name | m:description"/>
         <xsl:apply-templates select="." mode="occurrence"/>
         <xsl:apply-templates select="m:model"/>
         <xsl:apply-templates select="m:remarks"/>
         <xsl:apply-templates select="m:example"/>
      </div>
   </xsl:template>

   <xsl:template match="@name | @named">
      <code class="name"><xsl:value-of select="."/></code>
   </xsl:template>
   
   
   
   <xsl:template match="@datatype"/>
   
   <xsl:template match="@address">
      <code>
         <xsl:value-of select="."/>
      </code>
   </xsl:template>
   
   <xsl:template match="@required">
      <i> (required)</i>
   </xsl:template>
   
   <xsl:template match="m:flag"/>
   
   <xsl:template match="m:flag[@name=../@address]" mode="model"/>
      
   <xsl:template match="m:flag" mode="model">
      <li>
         <xsl:text>String </xsl:text>
         <a href="#{@name}" class="name">
            <xsl:apply-templates select="@name"/>
         </a>
         <!--<xsl:apply-templates select="@datatype"/>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>-->
         <xsl:apply-templates select="m:description" mode="model"/>
         <xsl:apply-templates select="m:remarks" mode="model"/>
      </li>
   </xsl:template>
   
   
   <!-- Empty model elements (whether by accident or design) will be dropped. -->
   <xsl:template match="m:model[not(*)]" priority="3"/>
      
   <xsl:template match="m:model">
      <div class="model">
         <p>
            <xsl:for-each select="../@name">
               <xsl:call-template name="link-with-indefinite-article"/>
            </xsl:for-each>
            <xsl:text> object has</xsl:text>
            <xsl:choose>
               <xsl:when test="count(../m:flag | *) &gt; 1"> the  following properties:</xsl:when>
               <xsl:otherwise> the property</xsl:otherwise>
            </xsl:choose>
         </p>
         <ul>
            <xsl:apply-templates select="../m:flag" mode="model"/>
           <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>
   
   <xsl:template match="m:prose" priority="5">
      <li>An array <code class="name">prose</code>, containing strings of markdown.</li>
   </xsl:template>
   
   <xsl:template name="link-with-indefinite-article">
      <xsl:text>A</xsl:text>
      <xsl:if test="not(translate(substring(., 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
      <xsl:text> </xsl:text>
      <a class="name" href="#{.}"><xsl:value-of select="."/></a>
   </xsl:template>

   <xsl:template  match="m:assembly | m:field">
      <li>
         <xsl:for-each select="@named">
            <xsl:call-template name="link-with-indefinite-article"/>
         </xsl:for-each>
         <xsl:text> object </xsl:text>
         <xsl:apply-templates select="@required"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="m:description" mode="model"/>
         <xsl:apply-templates select="m:remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="*" mode="cardinality"> (<i>zero or one</i>)</xsl:template>
   
   <xsl:template match="*[@required='yes']" mode="cardinality"> (<i>one</i>)</xsl:template>
   
   <xsl:template  match="m:assemblies | m:fields">
      <li>
         <xsl:text>An array </xsl:text>
         <code class="name"><xsl:apply-templates select="@group-as"/></code>
         <xsl:text> containing </xsl:text>
         <a class="name" href="#{@named}"><xsl:apply-templates select="@named"/></a>
         <xsl:text> data items </xsl:text>
         <xsl:apply-templates select="@required"/>
         <xsl:text> </xsl:text>
         <xsl:apply-templates select="m:description" mode="model"/>
         <xsl:apply-templates select="m:remarks" mode="model"/>
      </li>
   </xsl:template>

   
   <xsl:template match="m:code[. = /*/*[@show-docs='json' or @show-docs='xml json']/@name][not(.=ancestor::*/@name)]" name="link-item">
      <a href="#{.}" class="name">
         <xsl:apply-templates/>
      </a>
   </xsl:template>
   
   <xsl:template name="css">
      <style type="text/css">
html, body { background-color: cornsilk }

pre { color: darkgrey }>
.tag { color: black; font-family: monospace; font-size: 80%; font-weight: bold }

.METASCHEMA { }

.title { }

.define-assembly,
.define-field,
.define-flag      { margin-top: 1ex; margin-bottom: 1ex; border: thin inset black; padding: 0.5em }

.define-assembly *,
.define-field    *,
.define-flag     *  { margin: 0em }

.define-assembly > div { margin-top: 1em }

pre { padding: 0.5em; background-color: gainsboro }

.define-assembly { }

.define-field { }

.define-flag { }

.flag { }

.formal-name { font-size: 120%; font-weight: bold; font-family: sans-serif; margin: 0.5em 0em }

.description { font-size: 90%; font-family: sans-serif; margin: 0.5em 0em; background-color: aliceblue; padding: 0.5em }

.remarks { }

.remarks p { margin-top: 0.5em }
// .remarks > p:first-child { margin-top: 0em }

.model { margin-top: 1em }

.field { }

.fields { }

.assembly { }

.assemblies { }

.choice { }

.example { margin-top: 1em }

.prose { }


.p { }

.code {  display: inline; }
.q {  display: inline; }
.em {  display: inline; }
.strong {  display: inline; }

.name { color: midnightblue; background-color: lavender;
        font-family: monospace }

a { text-decoration:none }
a:hover { text-decoration: underline }


</style>
   </xsl:template>

</xsl:stylesheet>