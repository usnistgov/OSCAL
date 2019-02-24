<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="xs">

<!-- Purpose: XSLT 3.0 stylesheet for Metaschema display (HTML): XML version -->
<!-- Input:   Metaschema -->
<!-- Output:  HTML  -->
<!-- The XML version translates metaschema jargon into XML terminology. Another module does the same for JSON/object terminology.  -->

<!-- Planning: 
       Stand up to run
       Develop to AW's Liquid template
       Header/metadata info?
   
   -->
<xsl:import href="metaschema-common-html.xsl"/>
   
<xsl:strip-space elements="*"/>

<xsl:preserve-space elements="p li pre i b em strong a code q"/>
   
<xsl:output indent="yes"/>
   
   <xsl:variable name="home" select="METASCHEMA"/>
   
   <!--<xsl:variable name="imported" select="/METASCHEMA/import/document(@href,/)"/>-->
   
   <xsl:variable name="all-references" select="//flag/@name | //model//*/@named"/>
   
   <!--<xsl:variable name="here-declared" as="element()*" select="//define-flag | //define-field | //define-assembly"/>-->
   
   <xsl:key name="definitions" match="define-flag | define-field | define-assembly" use="@name"/>
   
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

   <xsl:template match="METASCHEMA">
      <div class="METASCHEMA">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template match="METASCHEMA/schema-name">
      <h2 class="title">
         <xsl:apply-templates/>
         <xsl:text>: XML Schema</xsl:text>
      </h2>
   </xsl:template>
   
   <xsl:template priority="5"
      match="define-flag[not(@show-docs='xml' or @show-docs='xml json')] |
      define-field[not(@show-docs='xml' or @show-docs='xml json')] |
      define-assembly[not(@show-docs='xml' or @show-docs='xml json')]"/>
   
   <xsl:template match="define-flag">
      <div class="define-flag" id="{@name}">
         <h3>
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> attribute</h3>
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template  match="define-field">
      <div class="define-field" id="{@name}">
         <h3>
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> element</h3>
         <xsl:choose>
            <xsl:when test="@as='mixed'"><p>Supports inline encoding</p></xsl:when>
            <xsl:when test="@as='boolean'"><p>True whenever given (presence signifies Boolean value)</p></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:if test="flag">
            <div class="model">
               <p>The <xsl:apply-templates select="@name"/> element supports:</p>
               <ul>
                  <xsl:apply-templates select="flag" mode="model"/>
               </ul>
            </div>
         </xsl:if>
         <xsl:apply-templates select="remarks"/>
         <xsl:apply-templates select="example"/>
      </div>
   </xsl:template>
   
   <xsl:template match="define-assembly">
      <div class="define-assembly" id="{@name}">
         <h3>
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> element</h3>
         <!-- No mention of @group-as on XML side       -->
         
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:apply-templates select="model"/>
         <xsl:apply-templates select="remarks"/>
         <xsl:apply-templates select="example"/>
      </div>
   </xsl:template>

   <xsl:template match="@name | @named">
      <code class="name">&lt;<xsl:value-of select="."/>></code>
   </xsl:template>
   
   <xsl:template match="define-flag/@name | flag/@name">
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
   
   <xsl:template match="flag"/>
   
   <xsl:template match="flag" mode="model">
      <li>
         <xsl:text>Attribute </xsl:text>
         <a href="#{@name}" class="name">
            <xsl:apply-templates select="@name"/>
         </a>
         <xsl:apply-templates select="@datatype"/>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>
         <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>
   
   
   <!-- Empty model elements (whether by accident or design) will be dropped.
     NB: at a later point, we may support model/@acquire-from
     at present we have @acquire-from only on definitions. -->
   <xsl:template match="model[not(*)]" priority="3"/>
      
   <xsl:template match="model">
      <div class="model">
         <p>The <xsl:apply-templates select="../@name"/> element has the following contents <xsl:if test="count(*) > 1"> (in order)</xsl:if>:</p>
         <ul>
            <xsl:apply-templates select="../flag" mode="model"/>
           <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>

   
   
   <xsl:template  match="assembly | field">
      <li>
         <xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@named,1,1),'AEIOUaeiuo',''))">n</xsl:if>
         <xsl:text> </xsl:text>
         <a class="name" href="#{@named}"><xsl:apply-templates select="@named"/></a>
         <xsl:text> element </xsl:text>
         <xsl:apply-templates select="." mode="cardinality"/>
            
          <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="*" mode="cardinality"> (<i>zero or one</i>)</xsl:template>
   
   <xsl:template match="*[@required='yes']" mode="cardinality"> (<i>one</i>)</xsl:template>
   
   <xsl:template  match="assemblies | fields">
      <li class="assemblies">
         <a class="name" href="#{@named}"><xsl:apply-templates select="@named"/></a> elements (<i>zero or more</i>)<xsl:text/>                <xsl:apply-templates select="description | remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="example[empty(* except (description | remarks))]"/>
   
    <xsl:template match="example">
         <xsl:apply-templates select="description"/>
         <pre class="xml">
            <xsl:text xml:space="preserve">&#xA;</xsl:text>
           <xsl:apply-templates select="*" mode="as-example"/>
         </pre>
         <xsl:apply-templates select="remarks"/>
      
   </xsl:template>
   
  <!-- <xsl:template mode="get-example" match="example">
      <xsl:apply-templates select="*" mode="as-example"/>
   </xsl:template>-->
   
    <!--Not available in SaxonHE.-->
    <!--<xsl:template mode="get-example" match="example[@href castable as xs:anyURI]">
      <xsl:variable name="example">
        <xsl:evaluate context-item="document(@href)" xpath="@path"  namespace-context="."/>
      </xsl:variable>
      <xsl:apply-templates select="$example/*" mode="as-example"/>
   </xsl:template>-->
   
   <xsl:template match="m:*" xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0" mode="as-example"/>
      
   <xsl:template match="*" mode="as-example">
      <xsl:apply-templates select="." mode="serialize"/>
   </xsl:template>
   
   
   <xsl:template match="code[. = /*/*[@show-docs='xml' or @show-docs='xml json']/@name]">
      <a href="#{.}" class="name">&lt;<xsl:text/>
         <xsl:apply-templates/>><xsl:text/>
      </a>
   </xsl:template>
   
  
   <xsl:template name="css">
      <style type="text/css">
html, body {  }

pre { color: darkgrey }
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

.name { color: midnightblue; background-color: lavender;
        font-family: monospace; font-size: 90% }

a { text-decoration:none }
a:hover { text-decoration: underline }


</style>
   </xsl:template>

</xsl:stylesheet>