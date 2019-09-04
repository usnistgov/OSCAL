<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns="http://www.w3.org/1999/xhtml"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all"
   xmlns:fn="http://www.example.com/fn">


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

   <xsl:variable name="metaschema-code" select="/*/short-name || '-json'"/>


   <xsl:strip-space elements="*"/>

   <xsl:preserve-space elements="p li pre i b em strong a code q"/>

   <xsl:output indent="yes"/>

   <xsl:variable name="home" select="/METASCHEMA"/>

   <xsl:variable name="all-references" select="//flag/@name | //model//*/@ref"/>

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


   <!-- only works when XML-to-JSON converter is in the import tree -->
   <xsl:template match="description | remarks" mode="jsonize"/>

   <xsl:template match="METASCHEMA">
      <xsl:variable name="definitions" select="define-assembly | define-field | define-flag"/>
      <div class="METASCHEMA">
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

   <xsl:template match="METASCHEMA/namespace"/>

  <!-- <xsl:template priority="5"
      match="
         define-flag[not(@show-docs = 'xml' or @show-docs = 'xml json')] |
         define-field[not(@show-docs = 'xml' or @show-docs = 'xml json')] |
         define-assembly[not(@show-docs = 'xml' or @show-docs = 'xml json')]"/>-->

   <xsl:template match="define-flag">
      <div class="definition define-flag" id="{@name}">
         <header>
         <h4 id="{$metaschema-code}_{@name}" class="usa-color-text usa-color-green-lighter usa-color-text">
            <xsl:apply-templates select="formal-name" mode="inline"/>: <xsl:apply-templates
               select="@name"/> object</h4>
            <xsl:call-template name="cross-links"/>
         </header>
         <xsl:apply-templates select="@as-type"/>
         <xsl:apply-templates select="description"/>
         <xsl:for-each-group select="key('references',@name)/parent::*" group-by="true()">
            <p><xsl:text>Appears as a property on: </xsl:text>
               <xsl:for-each select="current-group()">
                  <xsl:if test="not(position() eq 1)">, </xsl:if>
                  <xsl:apply-templates select="." mode="link-here"/>
               </xsl:for-each>.</p>
         </xsl:for-each-group>
         <xsl:call-template name="remarks-group"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template name="cross-links">
      <xsl:variable name="alt-schema" select="replace($metaschema-code,'-json$','-xml')"/>
      <div style="float:right">
         <a href="/OSCAL/docs/schemas/{ $alt-schema }/#{ $alt-schema }_{ @name}">
            <button class="button-xml-on">Switch to XML</button>
         </a>
         <!--<button  class="button-json-off" disabled="disabled">JSON</button>-->
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

   <xsl:template name="remarks-group">
      <xsl:for-each-group select="remarks[not(@class != 'xml')]" group-by="true()">
         <div class="remarks-group usa-color-gray-lightest" style="padding: 0.5em; margin-bottom: 0.5em">
            <h5 style="margin-top: 0.5em">Remarks</h5>
            <xsl:apply-templates select="current-group()"/>
         </div>
      </xsl:for-each-group>
   </xsl:template>

   <xsl:template match="define-field">
      <div class="definition define-field" id="{@name}">
         <header>
            <h4 id="{$metaschema-code}_{@name}"
               class="usa-color-text usa-color-green-lighter">
               <xsl:apply-templates select="formal-name" mode="inline"/>:
                  <xsl:apply-templates select="@name"/> object</h4>
            <xsl:call-template name="cross-links"/>
            <xsl:call-template name="group-label"/>
         </header>
         <xsl:choose>
            <xsl:when test="@as = 'mixed'">
               <p>Supports Markdown</p>
            </xsl:when>
            <xsl:when test="@as = 'boolean'">
               <p>A Boolean value</p>
            </xsl:when>
         </xsl:choose>
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
                  <xsl:when test="count(flag) gt 1">(string) properties</xsl:when>
                  <xsl:otherwise>a (string) property</xsl:otherwise>
               </xsl:choose>
            </xsl:variable>
            <div class="model">
               <p xsl:expand-text="true">The <code>{@name}</code> object { $modal } have { $noun }:</p>
               <ul>
                  <xsl:apply-templates select="." mode="json-value-property"/>
                  <!-- sorting so json-key and json-value-key flags come up first -->
                  <xsl:apply-templates select="flag" mode="model">
                     <xsl:sort select="boolean((@name|@ref)=../(json-key|json-value-key)/@flag-name) ! number()" order="descending"/>
                  </xsl:apply-templates>
               </ul>
            </div>
            <!--<xsl:call-template name="uswds-table">
                  <xsl:with-param name="property-set" select="flag"/>
               </xsl:call-template>-->
         </xsl:if>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template match="define-field" mode="json-value-property">
      <li>
         <p>A string property, labeled <code>STRVALUE</code></p>
      </li>
   </xsl:template>
   <xsl:template match="define-field[@as-type = 'markup-line']" mode="json-value-property">
      <li>
         <p>a string property to be processed as a Markdown line, labeled <code>RICHTEXT</code></p>
      </li>
   </xsl:template>
   <xsl:template match="define-field[@as-type = 'markup-multiline']" mode="json-value-property">
      <li><p>a string property to be processed as a Markdown page, labeled <code>PROSE</code></p></li>
   </xsl:template>

   <xsl:template priority="2" match="define-field[exists(json-value-key)]" mode="json-value-property">
      <li>
         <p>
            <code><xsl:value-of select="json-value-key"/></code>
            <xsl:text> property</xsl:text>
            <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
         </p>
      </li>
   </xsl:template>

   <xsl:template priority="3" match="define-field[exists(json-value-key/@flag-name)]" mode="json-value-property">
      <xsl:variable name="other-flags" select="flag[not((@name|@ref)=../json-value-key/@flag-name)]/(@name|@ref)/string()"/>
      <xsl:text>a string property</xsl:text>
      <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
      <xsl:text>, not labeled </xsl:text>
      <xsl:for-each select="$other-flags">
         <xsl:if test="position() gt 1 and last() gt 2">,</xsl:if>
         <xsl:if test="position() eq last()"> or</xsl:if>
         <xsl:text> </xsl:text>
         <code xsl:expand-text="true">{ . }</code>
      </xsl:for-each>
      <xsl:text>, whose label can be taken as the value of (implicit) property </xsl:text>
      <code>
         <xsl:value-of select="json-value-key/@flag-name"/>
      </code>
      <xsl:apply-templates select="flag[(@name|@ref)=../json-value-key/@flag-name]/@as-type" mode="metaschema-type"/>
   </xsl:template>

   <xsl:variable name="string-value-label">STRVALUE</xsl:variable>
   <xsl:variable name="markdown-value-label">RICHTEXT</xsl:variable>
   <xsl:variable name="markdown-multiline-label">PROSE</xsl:variable>

   <xsl:template name="appears-in">
      <xsl:for-each-group select="key('references', @name)/ancestor::model/parent::*"
         group-by="true()">
         <p><xsl:text>This object appears as a property on: </xsl:text>
            <xsl:for-each select="current-group()">
               <xsl:if test="not(position() eq 1)">, </xsl:if>
               <xsl:apply-templates select="." mode="link-here"/>
            </xsl:for-each>.</p>
      </xsl:for-each-group>
   </xsl:template>

   <xsl:template name="group-label">
      <xsl:choose>
         <!--<xsl:when test="exists(child::json-key)">
            <p>This object appears, with a label, as a property of an object called <code xsl:expand-text="true"
               >{ group-as/@name }</code>.</p>
         </xsl:when>-->
         <xsl:when test="matches(group-as/@name, '\S')">
            <p>This object appears <i>unlabelled</i> in an array called <code xsl:expand-text="true"
               >{ @group-as }</code>.</p>
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="define-assembly">
      <div class="definition define-assembly" id="{@name}">
         <header>
            <h4 id="{$metaschema-code}_{@name}"
               class="usa-color-text usa-color-green-lighter">
               <xsl:apply-templates select="formal-name" mode="inline"/>: <xsl:apply-templates
                  select="@name"/> object</h4>
            <xsl:call-template name="cross-links"/>
            <xsl:call-template name="group-label"/>
         </header>
         <!-- No mention of @group-as on XML side       -->
         <xsl:if test="@name = ../@root">
            <h5>
               <code xsl:expand-text="true">{ @name }</code> is the root (containing) object of this
               schema. </h5>
         </xsl:if>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:call-template name="appears-in"/>
         <xsl:apply-templates select="model"/>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template match="define-assembly | define-field | define-flag" mode="link-here">
      <a href="#{ @name }"><xsl:value-of select="@name"/></a>
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

   <xsl:template match="@group-as">
      <xsl:text> (group as </xsl:text>
      <code>
         <xsl:value-of select="."/>
      </code>)<xsl:text/>
   </xsl:template>

   <xsl:template match="@as-type"/>

   <xsl:template match="define-flag/@as-type">
      <p>A string conforming to constraints of type <code><xsl:value-of select="."/></code></p>
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
            <a id="{../@name}-{@name}"><xsl:apply-templates select="@name"/></a><xsl:apply-templates select="@name"/>
         </xsl:if>
         <xsl:text> property </xsl:text>
         <xsl:apply-templates select="@as-type"/>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>
         <xsl:apply-templates select="if (description) then description else key('definitions', @name)/description" mode="model"/>
         <xsl:if test="valid-values or key('definitions', @ref)/valid-values">
            <xsl:apply-templates select="if (valid-values) then valid-values else key('definitions', @ref)/valid-values"/>
         </xsl:if>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="flag[(@name|@ref)=../json-value-key/@flag-name]" mode="model">
      <xsl:variable name="other-flags" select="../(flag except current())/(@name|@ref)/string()"/>
      <li>
         <p>
            <i>Implicitly</i>
            <xsl:text>, a property </xsl:text>
            <xsl:apply-templates mode="link-here" select="key('definitions', @ref)"/>
            <xsl:if test="empty(@ref)">
               <xsl:apply-templates select="@name"/>
            </xsl:if>
            <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
            <xsl:text>: </xsl:text>
            <i><xsl:text>this value will appear as the </xsl:text>
               <b>key</b>
               <xsl:text>(label) of a property of the parent </xsl:text>
               <code style="font-style: normal" xsl:expand-text="true">{ ../@name }</code>
               <xsl:text> JSON object, not labeled </xsl:text>
               <xsl:for-each select="$other-flags">
                  <xsl:if test="position() gt 1 and last() gt 2">,</xsl:if>
                  <xsl:if test="position() eq last()"> or</xsl:if>
                  <xsl:text> </xsl:text>
                  <code xsl:expand-text="true">{ . }</code>
               </xsl:for-each>
            </i>
         </p>
         <xsl:apply-templates mode="model"
            select="if (description) then description else key('definitions', @name)/description"/>
         <xsl:if test="valid-values or key('definitions', @ref)/valid-values">
            <xsl:apply-templates
               select="if (valid-values) then valid-values else key('definitions', @ref)/valid-values"/>
         </xsl:if>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="flag[(@name|@ref)=../json-key/@flag-name]" mode="model">
      <xsl:message expand-text="true">{ ../@name }</xsl:message>
      <li>
         <p>
            <i>Implicitly</i>
            <xsl:text>, a property </xsl:text>
            <xsl:apply-templates mode="link-here" select="key('definitions', @ref)"/>
            <xsl:if test="empty(@ref)">
               <xsl:apply-templates select="@name"/>
            </xsl:if>
            <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
            <xsl:text>: </xsl:text>
            <i>this value will appear as the <b>key</b> (label) of the parent <code style="font-style: normal" xsl:expand-text="true">{ ../@name }</code> JSON object</i>
         </p>
         <xsl:apply-templates mode="model"
            select="if (description) then description else key('definitions', @name)/description"/>
         <xsl:if test="valid-values or key('definitions', @ref)/valid-values">
            <xsl:apply-templates
               select="if (valid-values) then valid-values else key('definitions', @ref)/valid-values"/>
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
            <xsl:apply-templates select="../flag" mode="model">
               <!-- sorting so json-key comes up first -->
               <xsl:sort select="boolean((@name|@ref)=../json-key/@flag-name) ! number()" order="descending"/>
            </xsl:apply-templates>
            <xsl:apply-templates/>
         </ul>
      </div>
   </xsl:template>

   <xsl:template match="assembly | field">
      <li>
         <p>
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text expand-text="true"> object </xsl:text>
            <xsl:apply-templates select="." mode="occurrence-code"/>
         </p>
         <xsl:apply-templates select="if (description) then description else key('definitions', @ref)/description" mode="model"/>
         <xsl:if test="valid-values or key('definitions', @ref)/valid-values">
           <xsl:apply-templates select="if (valid-values) then valid-values else key('definitions', @ref)/valid-values"/>
         </xsl:if>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[group-as/@in-json='BY_KEY'] | field[group-as/@in-json='BY_KEY']" priority="2">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:choose>
               <xsl:when test="@max-occurs = '1' or empty(@max-occurs)">A labelled </xsl:when>
               <xsl:otherwise>Labelled </xsl:otherwise>
            </xsl:choose>
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text expand-text="true"> object{ if (@max-occurs='1' or empty(@max-occurs)) then '' else 's' } </xsl:text>
            <xsl:apply-templates select="." mode="occurrence-code"/>
         </p>
         <xsl:apply-templates select="if (description) then description else $definition/description" mode="model"/>

         <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[group-as/@in-json='ARRAY'] | field[group-as/@in-json='ARRAY']" priority="2">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:text>An array labelled </xsl:text>
            <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@ref, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
            <b><xsl:value-of select="group-as/@name"/></b>, containing <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text> objects, labelled </xsl:text>
            <b><xsl:value-of select="group-as/@name"/></b>
         </p>
         <xsl:apply-templates select="." mode="occurrence-code"/>
         <xsl:apply-templates select="if (description) then description else $definition/description" mode="model"/>

         <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[exists(group-as)] | field[exists(group-as)]">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:text>Labelled </xsl:text>
            <b>
               <xsl:value-of select="group-as/@name"/>
            </b>
            <xsl:text>, an array containing </xsl:text>
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text> objects, or a single </xsl:text>
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text> object </xsl:text>
            <xsl:apply-templates select="." mode="occurrence-code"/>
         </p>
         <xsl:apply-templates
            select="
               if (description) then
                  description
               else
                  $definition/description"
            mode="model"/>

         <xsl:apply-templates select="description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <!-- remarks are kept if @class='xml' or no class is given -->
   <xsl:template match="remarks[@class != 'json']" priority="2"/>

   <xsl:template match="remarks[@class = 'json']/p[1]">
      <p class="p">
         <span class="usa-label">JSON</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

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


   <xsl:template mode="metaschema-type" match="flag">string property <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>
   <xsl:template mode="metaschema-type" match="field">string property <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>
   <xsl:template mode="metaschema-type" match="field[m:has-properties(.)]">object, with labeled value <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>

   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='ARRAY']" expand-text="true">array of { if ( m:has-properties(.)) then 'objects' else 'strings' }.</xsl:template>
   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='SINGLETON_OR_ARRAY']">{ if ( m:has-properties(.)) then 'object' else 'string' } (when a singleton) or array { if ( m:has-properties(.)) then 'objects' else 'strings' } (when multiple)</xsl:template>
   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='BY_KEY']">object (with label)</xsl:template>

   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='ARRAY']">array</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='SINGLETON_OR_ARRAY']">object (when a singleton) or array (when multiple)</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='BY_KEY']">object (with label)</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly">object (with object properties)</xsl:template>
   <xsl:template mode="metaschema-type" match="any">ANY</xsl:template>
   <xsl:template mode="metaschema-type" match="description | remarks"/>

   <xsl:template mode="metaschema-type" match="@as-type"> (type <xsl:value-of select="."/>)</xsl:template>
   <xsl:template mode="metaschema-type" match="@as-type[.='markdown-line']"> (may contain inline Markdown)</xsl:template>
   <xsl:template mode="metaschema-type" match="@as-type[.='markdown-multiline']"> (may contain Markdown paragraphs)</xsl:template>
   <xsl:template mode="metaschema-type" match="@as-type[.='empty']"> (with no value given)</xsl:template>


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
