<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/xhtml"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">

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
   <xsl:import href="metaschema-docs-util.xsl"/>

   <xsl:param name="schema-path" select="document-uri(/)"/>

   <xsl:variable name="metaschema-code" select="/*/short-name || '-xml'"/>

   <xsl:strip-space elements="*"/>

   <xsl:preserve-space elements="p li pre i b em strong a code q"/>

   <xsl:output indent="yes"/>

   <xsl:variable name="home" select="/METASCHEMA"/>

   <xsl:variable name="all-references" select="//flag/@name | //model//*/@ref"/>

   <!--<xsl:variable name="here-declared" as="element()*" select="//define-flag | //define-field | //define-assembly"/>-->

   <xsl:key name="definitions" match="define-flag | define-field | define-assembly" use="@name"/>
   <xsl:key name="references" match="flag"             use="@name | @ref"/>
   <xsl:key name="references" match="field | assembly" use="@ref"/>

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
      <xsl:variable name="definitions" select="define-assembly | define-field | define-flag"/>
      <div class="METASCHEMA usa-content">
         <p><span class="usa-label">Schema download</span>
            <xsl:text> </xsl:text>
            <a href="{$schema-path}">
               <xsl:value-of select="replace($schema-path,'^.*/','')"/></a>
         </p>
         <xsl:apply-templates select="* except $definitions"/>
      </div>
      <xsl:apply-templates select="$definitions"/>
   </xsl:template>

   <xsl:template match="METASCHEMA/schema-name">
      <!--<h2>
         <xsl:apply-templates/>
         <xsl:text>: Schema Reference</xsl:text>
      </h2>-->
   </xsl:template>

   <xsl:template match="METASCHEMA/namespace">
      <p><span class="usa-label">XML namespace</span>
         <xsl:text> </xsl:text>
         <code>
            <xsl:apply-templates/>
         </code></p>
   </xsl:template>

   <xsl:template match="define-assembly | define-field | define-flag" mode="link-here">
      <a href="#{ @name }"><xsl:value-of select="@name"/></a>
   </xsl:template>



   <xsl:template match="define-flag">
      <div class="definition define-flag" id="{@name}">
         <header>
            <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-cool-blue-lightest">
            <xsl:apply-templates select="formal-name" mode="inline"/>: <xsl:apply-templates
               select="@name"/> attribute</h4>
            <xsl:call-template name="cross-links"/>
         </header>
         <xsl:apply-templates mode="state-type" select="."/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="key('references',@name)/parent::*" group-by="true()">
            <p><xsl:text>This attribute appears on: </xsl:text>
               <xsl:for-each select="current-group()">
                  <xsl:if test="not(position() eq 1)">, </xsl:if>
                  <xsl:apply-templates select="." mode="link-here"/>
               </xsl:for-each>.</p>
         </xsl:for-each-group>
         <xsl:call-template name="remarks-group"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:variable name="github-base" as="xs:string">https://github.com/usnistgov/OSCAL/tree/master</xsl:variable>

   <xsl:template name="report-module"/>

   <xsl:template name="report-module-really">
         <xsl:variable name="metaschema-path" select="substring-after(.,'OSCAL/')"/>
      <xsl:for-each select="@module">
         <p class="usa-color-gray-lightest usa-color-text usa-color-text-primary-darkest" xsl:expand-text="yes">
            <xsl:text>Module defined: </xsl:text>
            <a href="{ $github-base}/{ $metaschema-path}">{
               replace(.,'.*/','') }</a></p>
      </xsl:for-each>
   </xsl:template>

   <xsl:template name="cross-links">
      <xsl:variable name="alt-schema" select="replace($metaschema-code,'-xml$','-json')"/>
      <div style="float:right">
         <!--<button disabled="disabled" class="button-xml-off">XML</button>-->
         <a href="/OSCAL/docs/schemas/{ $alt-schema }/#{ $alt-schema }_{ @name}">
            <button class="button-json-on">Switch to JSON</button>
         </a>
      </div>
   </xsl:template>

   <xsl:template match="define-field">
      <div class="definition define-field" id="{@name}">
         <header>
            <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-cool-blue-lighter">
               <xsl:apply-templates select="formal-name" mode="inline"/>:
                  <xsl:apply-templates select="@name"/> element</h4>
            <xsl:call-template name="cross-links"/>
         </header>
         <xsl:apply-templates mode="state-type" select="."/>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:call-template name="appears-in"/>
         <xsl:if test="exists(flag)">
            <xsl:variable name="modal">
               <xsl:choose>
                  <xsl:when
                     test="
                        every $f in (flag)
                           satisfies $f/@required = 'yes'"
                     >must</xsl:when>
                  <xsl:otherwise>may</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <xsl:variable name="noun">
               <xsl:choose>
                  <xsl:when test="count(flag) gt 1">attributes</xsl:when>
                  <xsl:otherwise>the attribute</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <div class="model">
               <p xsl:expand-text="true">The <code>{@name}</code> element { $modal } have { $noun }:</p>
               <ul>
                  <xsl:apply-templates select="flag" mode="model"/>
               </ul>
            </div>
         </xsl:if>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template name="remarks-group">
      <xsl:for-each-group select="remarks[not(@class != 'xml')]" group-by="true()">
         <div class="remarks-group usa-color-gray-lightest" style="padding: 0.5em; margin-bottom: 0.5em">
            <h5 style="margin-top: 0.5em">Remarks</h5>
            <xsl:apply-templates select="current-group()"/>
         </div>
      </xsl:for-each-group>
   </xsl:template>


   <xsl:template name="appears-in">
      <xsl:for-each-group select="key('references', @name)/ancestor::model/parent::*"
         group-by="true()">
         <p><xsl:text>This element appears inside: </xsl:text>
            <xsl:for-each select="current-group()">
               <xsl:if test="not(position() eq 1)">, </xsl:if>
               <xsl:apply-templates select="." mode="link-here"/>
            </xsl:for-each>.</p>
      </xsl:for-each-group>
   </xsl:template>

   <xsl:template match="define-assembly">
      <div class="definition define-assembly" id="{@name}">
         <header>
            <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-cool-blue-lighter">
               <xsl:apply-templates select="formal-name" mode="inline"/>:
                  <xsl:apply-templates select="@name"/> element</h4>
            <xsl:call-template name="cross-links"/>
         </header>
         <xsl:if test="@name = $home/METASCHEMA/@root">
            <h5>
               <code xsl:expand-text="true">{ @name }</code> is the root (containing) element of
               this schema. </h5>
         </xsl:if>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:call-template name="appears-in"/>
         <xsl:apply-templates select="model"/>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template match="@name | @ref">
      <code>
         <xsl:value-of select="."/>
      </code>
   </xsl:template>

   <xsl:template match="define-flag/@name | flag/@name">
      <code>
         <xsl:value-of select="."/>
      </code>
   </xsl:template>

   <xsl:template match="flag"/>

   <xsl:template match="flag" mode="model">
      <li>
         <xsl:apply-templates mode="link-here" select="key('definitions',@ref)"/>
         <xsl:if test="empty(@ref)">
           <a id="{../@name}-{@name}"><xsl:apply-templates select="@name"/></a><xsl:apply-templates select="@name"/>
        </xsl:if>
         <xsl:text> attribute </xsl:text>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="empty(@required)"> (<i>optional</i>)</xsl:if>
         <xsl:apply-templates select="." mode="metaschema-type"/>
         <xsl:apply-templates select="if (description) then description else key('definitions', @name)/description" mode="model"/>
         <xsl:apply-templates select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="@required">
      <i> (required)</i>
   </xsl:template>

   <xsl:template match="model[not(*)]" priority="3"/>

   <xsl:template match="model">
      <div class="model">
         <p>The <xsl:apply-templates select="../@name"/> element has the following contents<xsl:if
               test="count(*) > 1"> (in order)</xsl:if>:</p>
         <ul>
            <xsl:apply-templates select="../flag" mode="model"/>
            <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>

   <xsl:template match="any">
      <li>Any element (in a foreign namespace)</li>
   </xsl:template>

   <xsl:template match="assembly | field">
      <li>
         <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@ref, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
         <a href="#{@ref}">
            <xsl:apply-templates select="@ref"/>
         </a>
         <xsl:text expand-text="true"> element{ if (@max-occurs != '1') then 's' else '' } </xsl:text>
         <xsl:apply-templates select="." mode="occurrence-code"/>
         <xsl:apply-templates select="." mode="metaschema-type"/>
         <xsl:apply-templates select="if (description) then description else key('definitions', @ref)/description" mode="model"/>
         <xsl:apply-templates select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <!-- remarks are kept if @class='xml' or no class is given -->
   <xsl:template match="remarks[@class != 'xml']" priority="2"/>

   <xsl:template match="remarks[@class = 'xml']/p[1]">
      <p class="p">
         <span class="usa-label">XML</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="example[empty(* except (description | remarks))]"/>

   <xsl:template match="example">
      <xsl:variable name="example-no" select="'example' || count(.|preceding-sibling::example)"/>
      <ul class="usa-accordion-bordered">
         <li>
            <button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_{$example-no}_xml">
               <xsl:text>Example</xsl:text>
            <xsl:for-each select="description">: <xsl:apply-templates/></xsl:for-each></button>
            <!--<button class="usa-accordion-button" aria-expanded="true"
               aria-controls="{ ../@name }_{$example-no}_xml">XML</button>-->
            <!--{% capture <xsl:value-of select="$example-no" disable-output-escaping="yes"/> %}<xsl:apply-templates select="*" mode="as-example"/>{% endcapture %}-->
            <div id="{ ../@name }_{ $example-no }_xml" class="usa-accordion-content">
               <!--<xsl:text>&#xA;{% highlight xml %}</xsl:text>-->
               <!--{{ <xsl:value-of select="$example-no"/> }}-->
               <xsl:apply-templates select="remarks"/>
               <pre>
                 <xsl:apply-templates select="*" mode="as-example"/>
                </pre>
               <!--<xsl:text>&#xA;{% endhighlight %}&#xA;</xsl:text>-->
            </div>
         </li>
     </ul>
   </xsl:template>

   <xsl:template match="text()[not(matches(.,'\S'))]" mode="serialize">
      <xsl:param name="hot" select="false()"/>
      <xsl:if test="$hot">
         <xsl:value-of select="."/>
      </xsl:if>
   </xsl:template>

   <xsl:template match="*" mode="serialize">
<!-- goes $hot when inline markup is found  -->
      <xsl:param name="hot" select="false()"/>
      <!--<xsl:if test="not($hot)">
        <xsl:call-template name="indent-for-pre"/>
      </xsl:if>-->
      <xsl:text>&#xA;&lt;</xsl:text>
      <xsl:value-of select="local-name(.)"/>
      <xsl:for-each select="@*">
         <xsl:text> </xsl:text>
         <xsl:value-of select="local-name()"/>
         <xsl:text>="</xsl:text>
         <xsl:value-of select="."/>
         <xsl:text>"</xsl:text>
      </xsl:for-each>
      <xsl:text>&gt;</xsl:text>

      <xsl:apply-templates mode="serialize">
         <xsl:with-param name="hot" select="$hot or boolean(text()[normalize-space(.)])"/>
      </xsl:apply-templates>

      <!--<xsl:if test="not($hot)">
         <xsl:call-template name="indent-for-pre"/>
      </xsl:if>-->
      <xsl:if test="not(text()[normalize-space(.)])">&#xA;</xsl:if>
      <xsl:text>&lt;/</xsl:text>
      <xsl:value-of select="local-name(.)"/>
      <xsl:text>&gt;</xsl:text>
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

  <!-- mode as-example filters metaschema elements from elements representing examples -->
   <xsl:template match="m:*" xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
      mode="as-example"/>

   <xsl:template match="*" mode="as-example">
      <xsl:apply-templates select="." mode="serialize"/>
   </xsl:template>


   <xsl:template match="code[. = (//@name except ancestor::*/@name)]">
      <a href="#{.}">
         <xsl:next-match/>
      </a>
   </xsl:template>

   <xsl:template mode="occurrence-requirements occurrence-code" match="*">
      <i class="color-primary">
         <xsl:next-match/>
      </i>
   </xsl:template>

   <xsl:template match="define-flag" mode="state-type">
      <p>An attribute<xsl:apply-templates select="." mode="metaschema-type"/></p>
   </xsl:template>

   <xsl:template match="define-field" mode="state-type">
      <p>An element<xsl:apply-templates select="." mode="metaschema-type"/></p>
   </xsl:template>

   <xsl:template match="field | assembly" mode="metaschema-type">
      <xsl:apply-templates select="key('definitions',@ref)" mode="#current"/>
   </xsl:template>

   <xsl:template mode="metaschema-type" match="flag | define-flag | define-field[exists(@as-type)]">
      <xsl:text>, type </xsl:text>
      <b>
         <xsl:apply-templates mode="#current" select="@as-type"/>
         <xsl:if test="empty(@as-type)">string</xsl:if>
      </b>
   </xsl:template>


   <xsl:template mode="metaschema-type" match="define-field">, with text contents</xsl:template>
   <xsl:template mode="metaschema-type" match="*[@as-type='markup-line']"      priority="2">, with mixed text and (inline prose) element contents</xsl:template>
   <xsl:template mode="metaschema-type" match="*[@as-type='markup-multiline']" priority="2">, as prose content: paragraphs, lists etc.</xsl:template>
   <xsl:template mode="metaschema-type" match="define-assembly">, with element contents</xsl:template>

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

         .assembly {
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
