<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="3.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">

   <!-- Purpose: XSLT 3.0 stylesheet for Metaschema display (HTML): XML version -->
   <!-- Input:   Metaschema -->
   <!-- Output:  HTML  -->

   <xsl:import href="metaschema-common-html.xsl"/>

   <xsl:param name="schema-path" select="document-uri(/)"/>

   <xsl:variable name="metaschema-code" select="/*/short-name || '-xml'"/>

   <xsl:variable name="datatype-page" as="xs:string">../../datatypes</xsl:variable>
   
   <xsl:strip-space elements="*"/>

   <xsl:preserve-space elements="p li pre i b em strong a code q"/>

   <xsl:output indent="yes"/>

   <!-- ^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V -->

   <xsl:template name="cross-links">
      <xsl:variable name="schema-base" select="replace($metaschema-code,'-xml$','')"/>
      <div class="crosslink">
         <a href="../json-schema/#{$schema-base}-json_{ @name}">
            <button class="schema-link">Switch to JSON</button>
         </a>
      </div>
   </xsl:template>

   <xsl:template match="define-flag">
      <div class="definition define-flag" id="{@name}">
         <xsl:call-template name="definition-header"/>
         <xsl:apply-templates select="description"/>
         <xsl:apply-templates select="." mode="representation-in-xml"/>
         <xsl:for-each-group select="key('references',@name)/parent::*" group-by="true()">
            <p><xsl:text>This attribute appears on: </xsl:text>
               <xsl:for-each select="current-group()">
                  <xsl:if test="position() gt 1 and last() ne 2">, </xsl:if>
                  <xsl:if test="position() gt 1 and position() eq last()"> and </xsl:if>
                  <xsl:apply-templates select="." mode="link-here"/>
               </xsl:for-each>.</p>
         </xsl:for-each-group>
         <xsl:call-template name="remarks-group"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template match="define-field">
      <div class="definition define-field" id="{@name}">
         <xsl:call-template name="definition-header"/>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:apply-templates mode="representation-in-xml" select="."/>
         <xsl:call-template name="appears-in"/>
         <xsl:if test="exists(flag)">
            <xsl:variable name="modal">
               <xsl:choose>
                  <xsl:when test="every $f in (flag) satisfies $f/@required = 'yes'"
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

   <xsl:template match="define-assembly">
      <div class="definition define-assembly" id="{@name}">
         <xsl:call-template name="definition-header"/>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:if test="@name = $home/METASCHEMA/@root">
            <h5>
               <code xsl:expand-text="true">{ @name }</code> is the root (containing) element of
               this schema. </h5>
         </xsl:if>
         <xsl:call-template name="appears-in"/>
         <xsl:apply-templates select="model"/>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>


   <xsl:template name="appears-in">
      <xsl:for-each-group select="key('references', @name)/ancestor::model/parent::*"
         group-by="true()">
         <p><xsl:text>This element appears inside: </xsl:text>
            <xsl:for-each select="current-group()">
               <xsl:if test="position() gt 1 and last() ne 2">, </xsl:if>
               <xsl:if test="position() gt 1 and position() eq last()"> and </xsl:if>
               <xsl:apply-templates select="." mode="link-here"/>
            </xsl:for-each>.</p>
      </xsl:for-each-group>
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
      <li class="model-entry">
         <p>
            <xsl:apply-templates mode="link-here" select="key('definitions', @ref)"/>
            <xsl:if test="empty(@ref)">
               <a id="{../@name}-{@name}">
                  <xsl:apply-templates select="@name"/>
               </a>
            </xsl:if>
            <xsl:text> attribute </xsl:text>
            <xsl:apply-templates select="." mode="metaschema-type"/>
            <xsl:apply-templates select="." mode="requirement"/>
            <xsl:apply-templates select="if (description) then description else key('definitions', @name)/description" mode="model"/>
         </p>
         <xsl:apply-templates select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="*" mode="requirement">
      <i> [optional]</i>
   </xsl:template>

   <xsl:template match="*[exists(@required)]" mode="requirement">
      <i> [required]</i>
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
      <li class="model-entry">
         <p>
            <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@ref, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text expand-text="true"> element{ if (@max-occurs != '1') then 's' else '' } </xsl:text>
            <xsl:apply-templates select="." mode="metaschema-type"/>
            <xsl:apply-templates select="." mode="occurrence-code"/>
            <xsl:apply-templates mode="model"
               select="if (description) then description else key('definitions', @ref)/description"/>
         </p>
         <xsl:apply-templates
            select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <!-- remarks are kept if @class='xml' or no class is given -->
   <xsl:template match="remarks[@class != 'xml']" priority="2"/>

   <xsl:template match="remarks[@class = 'xml']/p[1]">
      <p class="p">
         <span class="usa-tag">XML</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="remarks/p" mode="model #default">
      <p class="p">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="example">
      <xsl:variable name="example-no" select="'example' || count(.|preceding-sibling::example)"/>
      <div class="example">
         <h3>
            <button aria-expanded="true"
               aria-controls="{ ../@name }_{$example-no}_xml">
               <xsl:text>Example</xsl:text>
               <xsl:for-each select="description">: <xsl:apply-templates/></xsl:for-each>
            </button>
         </h3>
         <div id="{ ../@name }_{ $example-no }_xml" class="example-content">
            <xsl:apply-templates select="remarks"/>
            <pre>
               <!-- 'doe' span can be wiped in post-process, but permits disabling output escaping -->
               <span class="doe">&#xA;{{&lt; highlight xml "linenos=table" > }}&#xA;</span>
               <xsl:apply-templates select="*" mode="as-example"/>
               <span class="doe">&#xA;{{ &lt;/ highlight > }}&#xA;</span>
            </pre>
         </div>
      </div>
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


   <xsl:template mode="occurrence-requirements occurrence-code" match="*">
      <i>
         <xsl:next-match/>
      </i>
   </xsl:template>

   <xsl:template match="define-flag" mode="representation-in-xml">
      <p>An attribute<xsl:apply-templates select="." mode="metaschema-type"/></p>
   </xsl:template>

   <xsl:template match="define-field" mode="representation-in-xml">
      <xsl:variable name="unwrapped-references" select="key('references',@name)[@in-xml='UNWRAPPED']"/>
      <p>An element<xsl:apply-templates select="." mode="metaschema-type"/></p>

      <xsl:if test="exists($unwrapped-references)">
         <p>
            <xsl:text>When appearing in </xsl:text>
            <xsl:for-each select="distinct-values($unwrapped-references/ancestor::model/../@name)">
               <xsl:if test="position() gt 1 and last() ne 2">, </xsl:if>
               <xsl:if test="position() gt 1 and position() eq last()"> or </xsl:if>
               <a href="#{ . }" xsl:expand-text="true">{ . }</a>
            </xsl:for-each>
            <xsl:text> this element is </xsl:text>
            <em>implicit</em>
            <xsl:text>; only its contents appear.</xsl:text>
         </p>
      </xsl:if>
   </xsl:template>

   <xsl:template match="field | assembly" mode="metaschema-type">
      <xsl:apply-templates select="key('definitions',@ref)" mode="#current"/>
   </xsl:template>

   
   <xsl:template mode="metaschema-type" match="flag | define-flag | define-field">
      <xsl:variable name="given-type" select="(@as-type, key('definitions',@ref)/@as-type,'string')[1]"/>
      <xsl:text> </xsl:text>
      <b>
         <xsl:text>(</xsl:text>
         <a href="{$datatype-page}/#{(lower-case($given-type))}">
            <xsl:apply-templates mode="#current" select="$given-type"/>
         </a>
         <xsl:text>)</xsl:text>
      </b>
      <xsl:text> </xsl:text>
   </xsl:template>

   <xsl:template mode="metaschema-type" match="define-assembly"/>

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
