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


   <!-- only works when XML-to-JSON converter is in the import tree -->
   <xsl:template match="description | remarks" mode="jsonize"/>
   
   
   
<!--
   
{% for collection in site.collections %}
{% if collection.label != "posts" %}
<h2 id="{{ collection.label }}">{{ collection.title }}</h2>

<h3>Elements</h3>

{% for schema_element in collection.docs %}
{% if schema_element.position == 0 %}{% continue %}{% endif %}

<h4 id="{{ collection.label }}_{{ schema_element.title }}"><code>{{ schema_element.title}}</code></h4>

{{ schema_element.content | markdownify }}

<table class="usa-table-borderless">
  <caption>Properties</caption>
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Description</th>
      <th scope="col">Cardinality</th>
    </tr>
  </thead>
  <tbody>
    {% for prop in schema_element.properties %}
    <tr>
      <th scope="row"><span class="usa-label">{{ prop.name }}</span></th>
      <td>{{ prop.description }}</td>
      <td>{{ prop.cardinality }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

{% if schema_element.snippets %}
<h6>Snippets</h6>

<ul class="usa-accordion-bordered">
  {% if schema_element.snippets.xml %}
  <li>
    <button class="usa-accordion-button" aria-expanded="true" aria-controls="{{ schema_element.title }}_a1">XML</button>
    <div id="{{ schema_element.title }}_a1" class="usa-accordion-content">
      {% capture snippet %}
      ```xml
      {{ schema_element.snippets.xml }}
      ```
      {% endcapture %}
      {{ snippet | markdownify }}
    </div>
  </li>
  {% endif %}
  {% if schema_element.snippets.json %}
  <li>
    <button class="usa-accordion-button" aria-expanded="true" aria-controls="{{ schema_element.title }}_a2">JSON</button>
    <div id="{{ schema_element.title }}_a2" class="usa-accordion-content">
      {% capture snippet %}
      ```json
      {{ schema_element.snippets.json }}
      ```
      {% endcapture %}
      {{ snippet | markdownify }}
    </div>
  </li>
  {% endif %}
  {% if schema_element.snippets.yaml %}
  <li>
    <button class="usa-accordion-button" aria-expanded="true" aria-controls="{{ schema_element.title }}_a3">YAML</button>
    <div id="{{ schema_element.title }}_a3" class="usa-accordion-content">
      {% capture snippet %}
      ```yaml
      {{ schema_element.snippets.yaml }}
      ```
      {% endcapture %}
      {{ snippet | markdownify }}
    </div>
  </li>
  {% endif %}
</ul>
{% endif %}

<hr />
{% endfor %}
{% endif %}
{% endfor %}

   -->
   <xsl:template match="METASCHEMA">
      <div class="METASCHEMA">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template match="METASCHEMA/schema-name">
      <h2 class="title">
         <xsl:apply-templates/>
         <xsl:text>: Schema Reference</xsl:text>
      </h2>
   </xsl:template>
   
   <xsl:template match="METASCHEMA/namespace">
      <p>The XML namespace for elements conformant to this schema: <code><xsl:apply-templates/></code></p>
   </xsl:template>
   
   <xsl:template name="uswds-table" expand-text="true">
      <xsl:param name="property-set" select="()"/>
      
      <table class="usa-table-borderless">
         <caption>Properties</caption>
         <thead>
            <tr>
               <th scope="col">Name</th>
               <th scope="col">Metaschema type</th>
               <th scope="col">Cardinality</th>
               <th scope="col">Description / Remarks</th>
            </tr>
         </thead>
         <tbody>
            <xsl:for-each select="$property-set">
            <!--{% for prop in schema_element.properties %}-->
            <tr>
               <th scope="row"><span class="usa-label">
                  <a class="name" href="#{@name | @named}"><xsl:apply-templates select="@name | @named"/></a></span></th>
               <td><xsl:apply-templates select="." mode="metaschema-type"/></td>
               <td><xsl:apply-templates select="." mode="cardinality"/></td>
               <td>
                  <xsl:apply-templates select="description | remarks"/>
               </td>
            </tr>
            </xsl:for-each><!-- {% endfor %}-->
         </tbody>
      </table>
      
   </xsl:template>
   
   <xsl:template mode="metaschema-type" match="flag"                  >flag</xsl:template>
   <xsl:template mode="metaschema-type" match="field    | fields"     >field</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly | assemblies" >assembly</xsl:template>
   <xsl:template mode="metaschema-type" match="prose"                 >Reserved for prose</xsl:template>
   <xsl:template mode="metaschema-type" match="any"                   >ANY</xsl:template>
   <xsl:template mode="metaschema-type" match="description | remarks"/>
   
   <xsl:template match="*" mode="metaschema-type">
      <xsl:message>Matching <xsl:value-of select="local-name()"/></xsl:message>
   </xsl:template>
   
   <xsl:template priority="5"
      match="define-flag[not(@show-docs='xml' or @show-docs='xml json')] |
      define-field[not(@show-docs='xml' or @show-docs='xml json')] |
      define-assembly[not(@show-docs='xml' or @show-docs='xml json')]"/>
   
   
   
   
   <xsl:template match="define-flag">
      <div class="define-flag" id="{@name}">
         <h4 id="{/*/short-name}_{@name}">
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> flag</h4>
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   <xsl:template  match="define-field">
      <div class="define-field" id="{@name}">
         <h4  id="{/*/short-name}_{@name}">
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> field</h4>
         <xsl:choose>
            <xsl:when test="@as='mixed'"><p>Supports inline encoding</p></xsl:when>
            <xsl:when test="@as='boolean'"><p>True whenever given (presence signifies Boolean value)</p></xsl:when>
         </xsl:choose>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:if test="flag">
            <div class="model">
               <p>The <xsl:apply-templates select="@name"/> field may have flags:</p>
               <ul>
                  <xsl:apply-templates select="flag" mode="model"/>
               </ul>
            </div>
            <xsl:call-template name="uswds-table">
               <xsl:with-param name="property-set" select="flag"/>
            </xsl:call-template>
         </xsl:if>
         <xsl:apply-templates select="remarks"/>
         <xsl:apply-templates select="example"/>
      </div>
   </xsl:template>
   
   <xsl:template match="define-assembly">
      <div class="define-assembly" id="{@name}">
         <h4 id="{/*/short-name}_{@name}">
            <xsl:apply-templates select="formal-name" mode="inline"/>:
            <xsl:apply-templates select="@name"/> assembly</h4>
         <!-- No mention of @group-as on XML side       -->
         
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:apply-templates select="model"/>
         <xsl:apply-templates select="remarks"/>
         <xsl:apply-templates select="example"/>|
         <xsl:call-template name="uswds-table">
            <xsl:with-param name="property-set" select="flag | (model//* except model//(choice | description/descendant-or-self::* | remarks/descendant-or-self::*))"/>
         </xsl:call-template>
      </div>
   </xsl:template>

   <xsl:template match="@name | @named">
      <code class="name"><xsl:value-of select="."/></code>
   </xsl:template>
   
   <xsl:template match="define-flag/@name | flag/@name">
      <code class="name"><xsl:value-of select="."/></code>
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
         <xsl:text>Flag </xsl:text>
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
         <p>The <xsl:apply-templates select="../@name"/> assembly has the following contents <xsl:if test="count(*) > 1"> (in order)</xsl:if>:</p>
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
         <xsl:text expand-text="true"> { local-name() } </xsl:text>
         <xsl:apply-templates select="." mode="cardinality"/>
            
          <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="*" mode="cardinality"> (<i>zero or one</i>)</xsl:template>
   
   <xsl:template match="*[@required='yes']" mode="cardinality"> (<i>one</i>)</xsl:template>
   
   <xsl:template  match="assemblies | fields">
      <li class="assemblies">
         <a class="name" href="#{@named}">
            <xsl:apply-templates select="@named"/></a> 
         <xsl:text expand-text="true"> { local-name(.) } (</xsl:text>
         <i>zero or more</i>
         <xsl:text>)</xsl:text>
         <xsl:apply-templates select="description | remarks" mode="model"/> 
      </li>
   </xsl:template>

   <xsl:template match="example[empty(* except (description | remarks))]"/>
   
   <xsl:template match="example">
      <xsl:variable name="n" select="count(.|preceding-sibling::example)"/>
      <ul class="usa-accordion-bordered">
         <li>
            <button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_example{$n}_xml">XML</button>
            <div id="{ ../@name }_example{$n}_xml" class="usa-accordion-content">
               <pre class="xml">
            <!--<xsl:text xml:space="preserve">&#xA;</xsl:text>-->
           <xsl:apply-templates select="*" mode="as-example"/>
         </pre>
            </div>
         </li>
         <li>
            <button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_example{$n}_json">JSON</button>
            <div id="{ ../@name }_example{$n}_json" class="usa-accordion-content">
               <pre class="json">
                  <xsl:text xml:space="preserve">&#xA;</xsl:text>
                  <xsl:apply-templates select="*" mode="jsonize"/>
               </pre>
            </div>
         </li>
      </ul>

      <xsl:apply-templates select="description"/>

      <xsl:apply-templates select="remarks"/>

   </xsl:template>
   
   
   <xsl:output name="jsonish"
      indent="yes" method="text" use-character-maps="delimiters"/>
   
   <xsl:character-map name="delimiters">
      <xsl:output-character character="&lt;" string="\u003c"/>
      <xsl:output-character character="&gt;" string="\u003e"/>
   </xsl:character-map>
   
   <xsl:param name="json-indent" as="xs:string">yes</xsl:param>
   
   <xsl:mode name="rectify" on-no-match="shallow-copy"/>
   
   <xsl:template mode="rectify"
      xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
      match="/*/@key | array/*/@key"/>

   <xsl:variable name="write-options" as="map(*)" expand-text="true">
      <xsl:map>
         <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
      </xsl:map>
   </xsl:variable>
   
   <xsl:template match="*" mode="jsonize">
      <xsl:variable name="xpath-json">
         <xsl:apply-templates select="." mode="xml2json"/>
      </xsl:variable>
      <xsl:variable name="rectified">
         <xsl:apply-templates select="$xpath-json" mode="rectify"/>
      </xsl:variable>
      <!--<xsl:copy-of select="$xpath-json"/>-->
         <xsl:value-of select="xml-to-json($rectified, $write-options)"/>
      
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

pre.json { color: darkblue }

.METASCHEMA { }

.title { }

.define-assembly,
.define-field,
.define-flag      { margin-top: 1ex; margin-bottom: 1ex; border: thin inset black; padding: 0.5em }

.define-assembly *,
.define-field    *,
.define-flag     *  { margin: 0em }

.define-assembly div { margin-top: 1em }

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