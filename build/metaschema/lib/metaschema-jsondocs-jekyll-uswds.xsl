<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="3.0"
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
   <xsl:variable name="metaschema-code" select="/*/short-name || '-json'"/>
   
   <xsl:strip-space elements="*"/>

   <xsl:preserve-space elements="p li pre i b em strong a code q"/>

   <xsl:output indent="yes"/>

   <xsl:variable name="home" select="/METASCHEMA"/>

   <xsl:variable name="all-references" select="//flag/@name | //model//*/@named"/>

   <xsl:key name="definitions" match="define-flag | define-field | define-assembly" use="@name"/>
   <xsl:key name="references" match="flag"             use="@name"/>
   <xsl:key name="references" match="field | assembly | fields | assemblies" use="@named"/>
   
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

   <xsl:template match="METASCHEMA">
      <xsl:variable name="definitions" select="define-assembly | define-field | define-flag"/>
      <div class="METASCHEMA">
         <xsl:apply-templates select="* except $definitions"/>
         <xsl:for-each select="key('definitions', @root)">
            <h5>
               <xsl:text>The root object of this schema is </xsl:text>
               <a href="#{@name}">
                  <xsl:apply-templates select="@name"/>
               </a>
            </h5>
           <!-- <xsl:call-template name="make-element-map"/>-->
         </xsl:for-each>
         <xsl:apply-templates select="$definitions"/>
      </div>
   </xsl:template>

   
   <xsl:template match="METASCHEMA/schema-name">
      <h2>
         <xsl:apply-templates/>
         <xsl:text>: Schema Reference</xsl:text>
      </h2>
   </xsl:template>

   <xsl:template match="METASCHEMA/namespace"/>

  <!-- <xsl:template priority="5"
      match="
         define-flag[not(@show-docs = 'xml' or @show-docs = 'xml json')] |
         define-field[not(@show-docs = 'xml' or @show-docs = 'xml json')] |
         define-assembly[not(@show-docs = 'xml' or @show-docs = 'xml json')]"/>-->




   <xsl:template match="define-flag">
      <xsl:variable name="imported" select="/*/import[@name=current()/@acquire-from]/document(@href,$home)"/>
      <xsl:variable name="definition" select="if (exists($imported)) then key('definitions',@name,$imported) else ."/>
      <div class="definition define-flag" id="{@name}">
         <header>
         <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-primary-alt-lightest usa-color-text">
            <xsl:apply-templates select="$definition/formal-name" mode="inline"/>: <xsl:apply-templates
               select="@name"/> object</h4>
            <xsl:call-template name="cross-links"/>
         </header>
         <xsl:apply-templates select="@datatype"/>
         <xsl:apply-templates/>
         <xsl:for-each-group select="key('references',@name)/parent::*" group-by="true()">
            <p><xsl:text>This object appears as a property on: </xsl:text>
               <xsl:for-each select="current-group()">
                  <xsl:if test="not(position() eq 1)">, </xsl:if>
                  <xsl:apply-templates select="." mode="link-here"/>               
               </xsl:for-each>.</p>
         </xsl:for-each-group>
         
      </div>
   </xsl:template>
   
   <xsl:template name="cross-links">
      <xsl:variable name="alt-schema" select="replace($metaschema-code,'-json$','-xml')"/>
      <div style="float:right">
         <a href="/OSCAL/docs/schemas/{ $alt-schema }/#{ $alt-schema }_{ @name}">
            <button>XML</button>
         </a>
         <button disabled="disabled">JSON</button>
      </div>
   </xsl:template>

   <xsl:template match="define-field">
      <xsl:variable name="imported" select="/*/import[@name=current()/@acquire-from]/document(@href,$home)"/>
      <!--XXX rewire for new import logic -->
      <xsl:variable name="definition" select="if (exists($imported)) then key('definitions',@name,$imported) else ."/>
      <div class="definition define-field" id="{@name}">
         <header>
         <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-primary-alt-lightest">
            <xsl:apply-templates select="$definition/formal-name" mode="inline"/>: <xsl:apply-templates
               select="@name"/> string object</h4>
            <xsl:call-template name="cross-links"/>
            <xsl:call-template name="group-label"/>
         </header>
         <xsl:for-each select="$definition">
            <xsl:choose>
               <xsl:when test="@as = 'mixed'">
                  <p>Supports Markdown</p>
               </xsl:when>
               <xsl:when test="@as = 'boolean'">
                  <p>A Boolean value</p>
               </xsl:when>
            </xsl:choose>
            <xsl:apply-templates select="formal-name | description"/>
            <xsl:if test="exists(flag)">
               <xsl:variable name="modal">
                  <xsl:choose>
                     <xsl:when test="every $f in (flag) satisfies $f/@required='yes'">must</xsl:when>
                     <xsl:otherwise>may</xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <xsl:variable name="noun">
                  <xsl:choose>
                     <xsl:when test="count(flag) gt 1">(string) properties</xsl:when>
                     <xsl:otherwise>a (string) property</xsl:otherwise>
                  </xsl:choose>
               </xsl:variable>
               <div class="model">
                  <p xsl:expand-text="true">The {@name} object { $modal } have { $noun }:</p>
                  <ul>
                     <xsl:apply-templates select="flag" mode="model"/>
                  </ul>
               </div>
               <!--<xsl:call-template name="uswds-table">
                  <xsl:with-param name="property-set" select="flag"/>
               </xsl:call-template>-->
            </xsl:if>
            <xsl:apply-templates select="remarks"/>
            <xsl:apply-templates select="example"/>
            <xsl:for-each-group select="key('references',@name)/ancestor::model/parent::*" group-by="true()">
               <p><xsl:text>This object appears as a property on: </xsl:text>
                  <xsl:for-each select="current-group()">
                     <xsl:if test="not(position() eq 1)">, </xsl:if>
                     <xsl:apply-templates select="." mode="link-here"/>               
                  </xsl:for-each>.</p>
            </xsl:for-each-group>
         </xsl:for-each>
      </div>
   </xsl:template>

   <xsl:template name="group-label">
      <xsl:choose>
         <xsl:when test="exists(child::key)">
            <p>This object appears, with a label, as a property of an object called <code xsl:expand-text="true"
               >{ @group-as }</code>.</p>
         </xsl:when>
         <xsl:when test="matches(@group-as, '\S')">
            <p>This object appears <i>unlabelled</i> in an array called <code xsl:expand-text="true"
               >{ @group-as }</code>.</p>
         </xsl:when>
         <xsl:otherwise>
            
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="define-assembly">
      <xsl:variable name="imported" select="/*/import[@name=current()/@acquire-from]/document(@href,$home)"/>
      <xsl:variable name="definition" select="if (exists($imported)) then key('definitions',@name,$imported) else ."/>
      
      <div class="definition define-assembly" id="{@name}">
      <header>
         <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-primary-alt-lightest">
            <xsl:apply-templates select="$definition/formal-name" mode="inline"/>: <xsl:apply-templates
               select="@name"/> object</h4>
         <xsl:call-template name="cross-links"/>
         <xsl:call-template name="group-label"/>
      </header>
         <!-- No mention of @group-as on XML side       -->
         <xsl:if test="@name = ../@root">
            <h5>
               <code xsl:expand-text="true">{ @name }</code> is the root (containing) object of
               this schema. </h5>
         </xsl:if>
         <xsl:for-each select="$definition">
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:apply-templates select="model"/>
         <xsl:apply-templates select="remarks"/>
         <xsl:apply-templates select="example"/>
         <!--<xsl:call-template name="uswds-table">
            <xsl:with-param name="property-set"
               select="flag | (model//* except model//(choice | description/descendant-or-self::* | remarks/descendant-or-self::*))"
            />
         </xsl:call-template>-->
         </xsl:for-each>
         <xsl:for-each-group select="key('references',@name)/ancestor::model/parent::*" group-by="true()">
            <p><xsl:text>This object appears as a property on: </xsl:text>
               <xsl:for-each select="current-group()">
                  <xsl:if test="not(position() eq 1)">, </xsl:if>
                  <xsl:apply-templates select="." mode="link-here"/>               
            </xsl:for-each>.</p>
         </xsl:for-each-group>
      </div>
   </xsl:template>

   <xsl:template match="define-assembly | define-field | define-flag" mode="link-here">
      <a href="#{ @name }"><xsl:value-of select="@name"/></a>
   </xsl:template>
   
   <xsl:template match="@name | @named">
      <code>
         <xsl:value-of select="."/>
      </code>
   </xsl:template>

   <xsl:template match="define-flag/@name | flag/@name">
      <code>
         <xsl:value-of select="."/>
      </code>
   </xsl:template>

   <xsl:template match="@group-as">
      <xsl:text> (group as </xsl:text>
      <code>
         <xsl:value-of select="."/>
      </code>)<xsl:text/>
   </xsl:template>

   <xsl:template match="@datatype"/>
   
   <xsl:template match="define-flag/@datatype">
      <p>Object of type <code><xsl:value-of select="."/></code></p>
   </xsl:template>
   
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
         <xsl:apply-templates mode="link-here" select="key('definitions',@ref)"/>
         <xsl:if test="empty(@ref)">
            <xsl:apply-templates select="@name"/>
         </xsl:if>
         <xsl:text> property </xsl:text>
         <xsl:apply-templates select="@datatype"/>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>
         <xsl:apply-templates select="if (description) then description else key('definitions', @name)/description" mode="model"/>
         <xsl:if test="valid-values or key('definitions', @named)/valid-values">
            <xsl:apply-templates select="if (valid-values) then valid-values else key('definitions', @named)/valid-values"/>
         </xsl:if>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>


   <!-- Empty model elements (whether by accident or design) will be dropped.
     NB: at a later point, we may support model/@acquire-from
     at present we have @acquire-from only on definitions. -->
   <xsl:template match="model[not(*)]" priority="3"/>

   <xsl:template match="model">
      <div class="model">
         <p>The <xsl:apply-templates select="../@name"/> object has the following members (properties):</p>
         <ul>
            <xsl:apply-templates select="../flag" mode="model"/>
            <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>

   <xsl:template match="assembly | field">
      <li>
         <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@named, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
         <a href="#{@named}">
            <xsl:apply-templates select="@named"/>
         </a>
         <xsl:text expand-text="true"> object </xsl:text>
         <xsl:apply-templates select="." mode="cardinality"/>
         
         <xsl:apply-templates select="if (description) then description else key('definitions', @named)/description" mode="model"/>
         <xsl:if test="valid-values or key('definitions', @named)/valid-values">
           <xsl:apply-templates select="if (valid-values) then valid-values else key('definitions', @named)/valid-values"/>
         </xsl:if>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>
   
   <xsl:template match="assemblies | fields">
      <xsl:variable name="definition" select="key('definitions',@named)"/>
      <li>An array labelled
         <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@named, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
         <b><xsl:value-of select="@group-as"/></b>, containing
         <a href="#{@named}">
            <xsl:apply-templates select="@named"/>
         </a>
         <xsl:text expand-text="true"> objects </xsl:text>
         <xsl:apply-templates select="." mode="cardinality"/>
         
         <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>
   
   <xsl:template match="*" mode="cardinality"> (<i>optional</i>)</xsl:template>
   <xsl:template match="*[@required = 'yes']" mode="cardinality"> (<i>required</i>)</xsl:template>
   <!-- 'assemblies' and 'fields' may not be marked @required so no 'one or more' -->

   <xsl:template match="example[empty(* except (description | remarks))]"/>

   <xsl:template match="example">
      <xsl:variable name="n" select="count(. | preceding-sibling::example)"/>
      <ul class="usa-accordion-bordered">
         <!--<li>
            <button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_example{$n}_xml">XML</button>
            <div id="{ ../@name }_example{$n}_xml" class="usa-accordion-content">
               <xsl:text>&#xA;{% highlight xml %}</xsl:text>
               <xsl:apply-templates select="*" mode="as-example"/>
               <xsl:text>&#xA;{% endhighlight %}&#xA;</xsl:text>
            </div>
         </li>-->
         <li>
            <button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_example{$n}_json">
               <xsl:text>Example</xsl:text>
               <xsl:for-each select="description">: <xsl:apply-templates/></xsl:for-each></button>
            <div id="{ ../@name }_example{$n}_json" class="usa-accordion-content">
               <xsl:text>&#xA;{% highlight json %}</xsl:text>
               <xsl:apply-templates select="*" mode="jsonize"/>
               <xsl:text>&#xA;{% endhighlight %}&#xA;</xsl:text>
               <xsl:apply-templates select="remarks"/>
            </div>
         </li>
      </ul>
   </xsl:template>

  

   <xsl:output name="jsonish" indent="yes" method="text" use-character-maps="delimiters"/>

   <xsl:character-map name="delimiters">
      <xsl:output-character character="&lt;" string="\u003c"/>
      <xsl:output-character character="&gt;" string="\u003e"/>
   </xsl:character-map>

   <xsl:param name="json-indent" as="xs:string">yes</xsl:param>

   <xsl:mode name="rectify" on-no-match="shallow-copy"/>

   <xsl:template mode="rectify" xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
      match="/*/@key | array/*/@key"/>

   <xsl:variable name="write-options" as="map(*)" expand-text="true">
      <xsl:map>
         <xsl:map-entry key="'indent'">{ $json-indent='yes' }</xsl:map-entry>
      </xsl:map>
   </xsl:variable>

   <!-- Modes xml2json and rectify are in the XML-to-JSON conversion XSLTs for the different formats respectively -->
   <xsl:template match="*" mode="jsonize">
      <xsl:variable name="xpath-json">
         <xsl:apply-templates select="." mode="xml2json"/>
      </xsl:variable>
      <xsl:variable name="rectified">
         <xsl:apply-templates select="$xpath-json" mode="rectify"/>
      </xsl:variable>
      <xsl:choose>
         <!--  this test fails when the modes are not available, so a text brick comes back with no elements -->
         <xsl:when test="exists($rectified/*) and empty($rectified/(node() except *))">
            <xsl:value-of select="xml-to-json($rectified, $write-options)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text expand-text="true">Example for '{ parent::example/../@name }' not JSONized -- </xsl:text>
            <xsl:copy-of select="$xpath-json"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   
   <xsl:template match="code[. = /*/*[@show-docs = 'xml' or @show-docs = 'xml json']/@name]">
      <a href="#{.}">
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <!--<xsl:template name="uswds-table" expand-text="true">
      <xsl:param name="property-set" select="()"/>
      
      <table>
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
               <!-\-{% for prop in schema_element.properties %}-\->
               <tr>
                  <th scope="row">
                     <span>
                        <xsl:for-each select="(@name | @named)">
                           <a class="name" href="#{.}">
                              <xsl:value-of select="."/>
                           </a>
                        </xsl:for-each>
                     </span>
                  </th>
                  <td>
                     <xsl:apply-templates select="." mode="metaschema-type"/>
                  </td>
                  <td>
                     <xsl:apply-templates select="." mode="cardinality"/>
                  </td>
                  <td>
                     <xsl:apply-templates select="description | remarks"/>
                  </td>
               </tr>
            </xsl:for-each>
            <!-\- {% endfor %}-\->
         </tbody>
      </table>
      
   </xsl:template>-->
   
   <xsl:template mode="metaschema-type" match="flag">string property</xsl:template>
   <xsl:template mode="metaschema-type" match="field">string property <xsl:apply-templates select="@as" mode="#current"/></xsl:template>
   <xsl:template mode="metaschema-type" match="fields">array of string properties <xsl:apply-templates select="@as" mode="#current"/></xsl:template>
   <xsl:template mode="metaschema-type" match="@as"/>
   <xsl:template mode="metaschema-type" match="@as[.='mixed']"> (may contain Markdown)</xsl:template>
   <xsl:template mode="metaschema-type" match="@as[.='empty']"> (with no value given)</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly">object (with object properties)</xsl:template>
   <xsl:template mode="metaschema-type" match="assemblies">array of objects</xsl:template>
   <xsl:template mode="metaschema-type" match="prose">Reserved for prose</xsl:template>
   <xsl:template mode="metaschema-type" match="any">ANY</xsl:template>
   <xsl:template mode="metaschema-type" match="description | remarks"/>
   
   <xsl:template match="*" mode="metaschema-type">
      <xsl:message>Matching <xsl:value-of select="local-name()"/></xsl:message>
   </xsl:template>
   
   
   <xsl:template name="css">
      <style type="text/css">
         html,
         body {
         }
         
         pre {
             color: darkgrey
         }
         .tag {
             color: black;
             font-family: monospace;
             font-size: 80%;
             font-weight: bold
         }
         
         pre.json {
             color: darkblue
         }
         
         .METASCHEMA {
         }
         
         .title {
         }
         
         .define-assembly,
         .define-field,
         .define-flag {
             margin-top: 1ex;
             margin-bottom: 1ex;
             border: thin inset black;
             padding: 0.5em
         }
         
         .define-assembly *,
         .define-field *,
         .define-flag * {
             margin: 0em
         }
         
         
         pre {
             padding: 0.5em;
             background-color: gainsboro
         }
         
         .define-assembly {
         }
         
         .define-field {
         }
         
         .define-flag {
         }
         
         .flag {
         }
         
         .formal-name {
             font-size: 120%;
             font-weight: bold;
             font-family: sans-serif;
             margin: 0.5em 0em
         }
         
         .description {
             font-size: 90%;
             font-family: sans-serif;
             margin: 0.5em 0em
         }
         
         .remarks {
         }
         
         .remarks p {
             margin-top: 0.5em
         }
         // .remarks > p:first-child { margin-top: 0em }
         
         .model {
             margin-top: 1em
         }
         
         .field {
         }
         
         .fields {
         }
         
         .assembly {
         }
         
         .assemblies {
         }
         
         .choice {
         }
         
         .example {
             margin-top: 1em
         }
         
         .prose {
         }
         
         
         .p {
         }
         
         .code {
             display: inline;
         }
         .q {
             display: inline;
         }
         .em {
             display: inline;
         }
         .strong {
             display: inline;
         }
         
         .name {
             color: midnightblue;
             background-color: lavender;
             font-family: monospace;
             font-size: 90%
         }
         
         a {
             text-decoration: none
         }
         a:hover {
             text-decoration: underline
         }
         
         ul.e_map {
             font-family: monospace;
             list-style-type: none
         }
         li.e_map {
             margin: 0em
         }
         .map_label {
             font-family: serif;
             color: darkgrey
         }</style>
   </xsl:template>

</xsl:stylesheet>