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
      <h1 class="title">
         <xsl:apply-templates/>
         <xsl:text>: XML Schema</xsl:text>
      </h1>
   </xsl:template>
   
   <xsl:template match="m:METASCHEMA/m:short-name">
      <p>The short name (file identifier) for this schema shall be <i><xsl:apply-templates/></i></p>
   </xsl:template>
   
   <xsl:template priority="5"
      match="m:define-flag[not(@show-docs='xml' or @show-docs='xml json')] |
      m:define-field[not(@show-docs='xml' or @show-docs='xml json')] |
      m:define-assembly[not(@show-docs='xml' or @show-docs='xml json')]"/>
   
   <xsl:template match="m:define-flag">
      <div class="define-flag" id="{@name}">
         <h2>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> attribute</h2>
         
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template  match="m:define-field">
      <div class="define-field" id="{@name}">
         <h2>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> element</h2>
         <xsl:choose>
            <xsl:when test="@as='mixed'"><p>Supports inline encoding</p></xsl:when>
            <xsl:when test="@as='boolean'"><p>True whenever given (presence signifies Boolean value)</p></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="m:formal-name | m:description"/>
         <xsl:if test="m:flag">
            <div class="model">
               <p>The <xsl:apply-templates select="@name"/> element supports:</p>
               <ul>
                  <xsl:apply-templates select="m:flag" mode="model"/>
               </ul>
            </div>
            
         </xsl:if>
         <xsl:apply-templates select="m:remarks"/>
         <xsl:apply-templates select="m:example"/>
      </div>
   </xsl:template>
   
   <xsl:template match="m:define-assembly">
      <div class="define-assembly" id="{@name}">
         <h2>
            <xsl:apply-templates select="m:formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> element</h2>
         <!-- No mention of @group-as on XML side       -->
         
         <xsl:apply-templates select="m:formal-name | m:description"/>
         <xsl:apply-templates select="m:model"/>
         <xsl:apply-templates select="m:remarks"/>
      </div>
   </xsl:template>

   <xsl:template match="@name | @named">
      <code class="name">&lt;<xsl:value-of select="."/>></code>
   </xsl:template>
   
   <xsl:template match="m:define-flag/@name | m:flag/@name">
      <code class="name">@<xsl:value-of select="."/></code>
   </xsl:template>
   
   <xsl:template match="@group-as">
      <xsl:text> (group as </xsl:text>
      <code>
         <xsl:value-of select="."/>
      </code>)<xsl:text/>
   </xsl:template>
   
   <xsl:template match="@datatype"/>
   
   <xsl:template match="@address">
      <xsl:text> (addressable by </xsl:text>
      <code>
         <xsl:value-of select="."/>
      </code>)<xsl:text/>
   </xsl:template>
   
   <xsl:template match="@required">
      <i> (required)</i>
   </xsl:template>
   
   <xsl:template match="m:flag"/>
   
   <xsl:template  match="m:flag" mode="model">
      <li>
            <xsl:text>Attribute </xsl:text>
            <a href="#{@name}" class="name">
               <xsl:apply-templates select="@name"/>
            </a>
            <xsl:apply-templates select="@datatype"/>
            <xsl:apply-templates select="@required"/>
            <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>
            <xsl:apply-templates select="m:description" mode="model"/>
         <xsl:apply-templates select="m:remarks" mode="model"/>
      </li>
   </xsl:template>
   
   
   <!-- Empty model elements (whether by accident or design) will be dropped. -->
   <xsl:template match="m:model[not(*)]" priority="3"/>
      
   <xsl:template match="m:model">
      <div class="model">
         <p>The <xsl:apply-templates select="../@name"/> element has the following contents <xsl:if test="count(*) > 1"> (in order)</xsl:if>:</p>
         <ul>
            <xsl:apply-templates select="../m:flag" mode="model"/>
           <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>

   <xsl:template  match="m:assembly | m:field">
      <li>
         <xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@named,1,1),'AEIOUaeiuo',''))">n</xsl:if>
         <xsl:text> </xsl:text>
         <a class="name" href="#{@named}"><xsl:apply-templates select="@named"/></a>
         <xsl:text> element </xsl:text>
         <xsl:apply-templates select="." mode="cardinality"/>
            
          <xsl:apply-templates select="m:description" mode="model"/>
         
         <xsl:apply-templates select="m:remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="*" mode="cardinality"> (<i>zero or one</i>)</xsl:template>
   
   <xsl:template match="*[@required='yes']" mode="cardinality"> (<i>one</i>)</xsl:template>
   
   <xsl:template  match="m:assemblies | m:fields">
      <li class="assemblies">
         <a class="name" href="#{@named}"><xsl:apply-templates select="@named"/></a> elements (<i>zero or more</i>)<xsl:text/>         
         
         <xsl:apply-templates select="m:description" mode="model"/>
      </li>
      <xsl:apply-templates select="m:remarks" mode="model"/>
   </xsl:template>

   <xsl:template match="m:description" mode="model">
      <xsl:text>: </xsl:text>
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="m:remarks/m:p" mode="model">
      <br class="br"/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="m:choice">
      <li class="choice">A choice between
         <ul>
           <xsl:apply-templates/>
         </ul>
      </li>
   </xsl:template>

   <xsl:template  match="m:example">
      <div class="example">
         <h4>Example</h4>
      <pre class="example">
         <xsl:apply-templates select="*" mode="serialize"/>
      </pre>
      </div>
   </xsl:template>

   <xsl:template match="m:prose">
      <li class="prose">Prose contents (paragraphs and lists)</li>
   </xsl:template>

   <xsl:template  match="m:remarks">
      <div class="remarks">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   
   <xsl:template  match="m:formal-name"/>
      
   <xsl:template  match="m:formal-name" mode="inline">
      <b class="formal-name">
         <xsl:apply-templates/>
      </b>
   </xsl:template>

   <xsl:template match="m:description">
      <p class="description">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template  match="m:prop">
      <p class="prop">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template  match="m:p">
      <p class="p">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   
   <xsl:template match="m:code">
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>
   
   <xsl:template match="m:code[. = /*/*[@show-as='xml' or @show-as='xml json']/@name]">
      <a href="#{.}" class="name">&lt;<xsl:text/>
         <xsl:apply-templates/>><xsl:text/>
      </a>
   </xsl:template>
   
   <xsl:template match="m:q">
      <q>
         <xsl:apply-templates/>
      </q>
   </xsl:template>

   <xsl:template match="m:em | m:strong | m:b | m:i | m:u">
      <xsl:element name="{local-name()}">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>


   <xsl:template name="css">
      <style type="text/css">
html, body { font-size: 10pt }

pre { color: darkgrey }
.tag { color: black; font-family: monospace; font-size: 80%; font-weight: bold }

code.name { color: midnightblue; background-color: lavender }

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

.description { font-size: 90%; font-family: sans-serif; margin: 0.5em 0em }

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

a.name { font-family: monospace; font-size: 90% }
a { text-decoration:none }
a:hover { text-decoration: underline }


</style>
   </xsl:template>

  
   <xsl:template match="*" mode="serialize">
      

      <xsl:call-template name="indent-for-pre"/>

      <code class="tag">&lt;<xsl:value-of select="name(.)"/>
         <xsl:for-each select="@*">
            <xsl:text> </xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
         </xsl:for-each>
         <xsl:text>&gt;</xsl:text>
      </code>

      <xsl:apply-templates mode="serialize">
         <xsl:with-param name="hot" select="boolean(text()[normalize-space(.)])"/>
      </xsl:apply-templates>

      <xsl:if test="not(text()[normalize-space(.)])">
        <xsl:call-template name="indent-for-pre">
           <xsl:with-param name="endtag" select="true()"/>
        </xsl:call-template>
      </xsl:if>
      <code class="tag">&lt;/<xsl:value-of select="name(.)"/>
         <xsl:text>&gt;</xsl:text>
      </code>
   </xsl:template>
   
   <xsl:template name="indent-for-pre">
      <xsl:param name="endtag" select="false()"/>
      <!-- Pretty heavy duty doing this under XSLT 1.0 -->
      <xsl:variable name="inline" select="boolean(../text()[normalize-space(.)])"/>
      <xsl:variable name="all-ancestors" select="ancestor::*"/>
      <xsl:variable name="example-ancestors" select="ancestor::m:example/ancestor::*"/>
      <xsl:variable name="depth" select="count($all-ancestors) - count($example-ancestors)"/>
      
      <xsl:if test="not($inline)">
         <!-- No CR for the first one -->
         <xsl:if test="boolean(preceding-sibling::*) or not(parent::m:example) or $endtag">
           <xsl:text>&#xA;</xsl:text>
         </xsl:if>
         <!-- check out the ancient method for a loop -->
         <xsl:for-each select="ancestor::*[position() &lt; $depth]">
            <xsl:text>  </xsl:text>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   
   <xsl:template match="text()" mode="serialize">
      <xsl:param name="hot" select="boolean(../text()[normalize-space(.)])"/>
      <xsl:if test="$hot">
         <xsl:value-of select="."/>
      </xsl:if>
   </xsl:template>

  

<!--

   <xsl:function name="XJS:classes">
      <xsl:param name="who" as="element()"/>
      <xsl:sequence select="tokenize($who/@class, '\s+') ! lower-case(.)"/>
   </xsl:function>

   <xsl:function name="XJS:has-class">
      <xsl:param name="who" as="element()"/>
      <xsl:param name="ilk" as="xs:string"/>
      <xsl:sequence select="$ilk = XJS:classes($who)"/>
   </xsl:function> -->
</xsl:stylesheet>