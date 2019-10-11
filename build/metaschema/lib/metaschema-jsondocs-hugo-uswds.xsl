<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet  version="3.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="#all">

   <!-- Purpose: XSLT 3.0 stylesheet for Metaschema display (HTML): JSON version -->
   <!-- Input:   Metaschema -->
   <!-- Output:  HTML  -->

   <xsl:import href="metaschema-common-html.xsl"/>

   <xsl:param name="schema-path" select="document-uri(/)"/>

   <xsl:variable name="metaschema-code" select="/*/short-name || '-json'"/>

   <xsl:variable name="datatype-page" as="xs:string">../../datatypes</xsl:variable>
   
   <xsl:strip-space elements="*"/>

   <xsl:preserve-space elements="p li pre i b em strong a code q"/>

   <xsl:output indent="yes"/>

   <!-- ^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V -->

   <xsl:template name="cross-links">
      <xsl:variable name="schema-base" select="replace($metaschema-code,'-json$','')"/>
      <div style="float:right">
         <!--<button disabled="disabled" class="button-xml-off">XML</button>-->
         <a href="../xml-schema/#{$schema-base}-xml_{ @name}">
            <button class="schema-link">Switch to XML</button>
         </a>
      </div>
   </xsl:template>

   <xsl:template match="define-flag">
      <div class="definition define-flag" id="{@name}">
         <xsl:call-template name="definition-header"/>
         <xsl:apply-templates select="description"/>
         <xsl:apply-templates select="." mode="representation-in-json"/>
         <xsl:for-each-group select="key('references',@name)/parent::*" group-by="true()">
            <p><xsl:text>Appears as a property on: </xsl:text>
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
         <xsl:apply-templates select="." mode="representation-in-json"/>
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
               <p xsl:expand-text="true">The <code>{@name}</code> object { $modal } additionally have { $noun }:</p>
               <ul>
                  <!--<xsl:apply-templates select="." mode="representation-in-json"/>-->
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

   <xsl:template match="define-assembly">
      <div class="definition define-assembly" id="{@name}">
         <xsl:call-template name="definition-header"/>
         <xsl:apply-templates select="formal-name | description"/>
         <xsl:call-template name="group-label"/>
         <xsl:if test="@name = $home/METASCHEMA/@root">
            <h5>
               <code xsl:expand-text="true">{ @name }</code> is the root (containing) object of this schema. </h5>
         </xsl:if>
         <xsl:call-template name="appears-in"/>
         <xsl:apply-templates select="model"/>
         <xsl:call-template name="remarks-group"/>
         <xsl:apply-templates select="example"/>
         <xsl:call-template name="report-module"/>
      </div>
   </xsl:template>

   <xsl:template match="*" mode="representation-in-json">
      <h1>oops</h1>
   </xsl:template>

   <xsl:template match="define-flag"  mode="representation-in-json">
      <xsl:apply-templates select="@as-type" mode="#current"/>
      <xsl:if test="empty(@as-type)"><p>A string property.</p></xsl:if>
   </xsl:template>

   <xsl:template match="define-flag/@as-type"  mode="representation-in-json">
      <p>
         <xsl:text>A string property </xsl:text>
         <xsl:apply-templates select="." mode="metaschema-type"/>
         <xsl:text>.</xsl:text>
      </p>
   </xsl:template>

   <xsl:template priority="2" match="define-flag[@as-type='string']"  mode="representation-in-json">
      <p>A string property.</p>
   </xsl:template>

   <xsl:template match="define-field" mode="representation-in-json">
      <p>
        <xsl:text>A string property</xsl:text> 
        <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
         <xsl:text>.</xsl:text>
      </p>
   </xsl:template>
   
   <xsl:template priority="2" match="define-field[exists(flag)]" mode="representation-in-json">
      <p>An object with a string property, 
         <xsl:apply-templates select="." mode="field-value-key"/>
      <xsl:text>, of type </xsl:text>
      <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
      </p>
   </xsl:template>
   
   <xsl:template match="define-field" mode="field-value-key">
      <xsl:text>labeled </xsl:text>
      <code>
        <xsl:value-of select="$string-value-label"/>
      </code>
   </xsl:template>
   
   <xsl:template match="define-field[@as-type='markup-line']" mode="field-value-key">
      <xsl:text>labeled </xsl:text>
      <code><xsl:value-of select="$markup-line-label"/></code>
   </xsl:template>
   
   <xsl:template match="define-field[@as-type='markup-multiline']" mode="field-value-key">
      <xsl:text>labeled </xsl:text>
      <code><xsl:value-of select="$markup-multiline-label"/></code>
   </xsl:template>
   
   <xsl:template priority="2" match="define-field[exists(json-value-key)]" mode="field-value-key">
      <xsl:text>labeled </xsl:text>
      <code><xsl:value-of select="json-value-key"/></code>
   </xsl:template>

   <xsl:template priority="3" match="define-field[exists(json-value-key/@flag-name)]" mode="field-value-key">
      <xsl:text>whose label is taken as a value for a </xsl:text>
      <code><xsl:value-of select="@flag-name"/></code>
      <xsl:text> property</xsl:text>
   </xsl:template>

   <xsl:template priority="3" match="define-field[exists(flag)][exists(@as-type)]" mode="representation-in-json">
      <p>
         <xsl:text>An object with a string property </xsl:text>
      </p>
   </xsl:template>
   
   
   <xsl:template priority="4" match="define-field[exists(json-value-key)]" mode="representation-in-json">
         <p>
            <xsl:text>An object with property </xsl:text> 
            <code><xsl:value-of select="json-value-key"/></code>
            <xsl:apply-templates select="@as-type" mode="metaschema-type"/>
         </p>
   </xsl:template>

   <xsl:template priority="3" match="define-field[exists(json-value-key/@flag-name)]" mode="representation-in-json">
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
   <xsl:variable name="markup-line-label">RICHTEXT</xsl:variable>
   <xsl:variable name="markup-multiline-label">PROSE</xsl:variable>

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
            <p>This object appears <i>unlabeled</i> in an array called <code xsl:expand-text="true"
               >{ @group-as }</code>.</p>
         </xsl:when>
         <xsl:otherwise/>
      </xsl:choose>
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
            <a id="{../@name}-{@name}"><xsl:apply-templates select="@name"/></a>
         </xsl:if>
         <xsl:text> property </xsl:text>
         <xsl:apply-templates select="@as-type"/>
         <xsl:apply-templates select="@required"/>
         <xsl:if test="not(@required)"> (<i>optional</i>)</xsl:if>
         <xsl:apply-templates select="if (description) then description else key('definitions', @name)/description" mode="model"/>
         <xsl:apply-templates select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
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
         <xsl:apply-templates
               select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
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
         <xsl:apply-templates
               select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
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
         <xsl:apply-templates select="if (allowed-values) then allowed-values else key('definitions', @ref)/allowed-values"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[group-as/@in-json='BY_KEY'] | field[group-as/@in-json='BY_KEY']" priority="2">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:choose>
               <xsl:when test="@max-occurs = '1' or empty(@max-occurs)">A labeled </xsl:when>
               <xsl:otherwise>Labeled </xsl:otherwise>
            </xsl:choose>
            <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text expand-text="true"> object{ if (@max-occurs='1' or empty(@max-occurs)) then '' else 's' } </xsl:text>
            <xsl:apply-templates select="." mode="occurrence-code"/>
         </p>
         <xsl:apply-templates select="if (description) then description else $definition/description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[group-as/@in-json='ARRAY'] | field[group-as/@in-json='ARRAY']" priority="2">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:text>An array labeled </xsl:text>
            <!--<xsl:text>A</xsl:text>
         <xsl:if test="not(translate(substring(@ref, 1, 1), 'AEIOUaeiuo', ''))">n</xsl:if>
         <xsl:text> </xsl:text>-->
            <b><xsl:value-of select="group-as/@name"/></b>, containing <a href="#{@ref}">
               <xsl:apply-templates select="@ref"/>
            </a>
            <xsl:text> objects, labeled </xsl:text>
            <b><xsl:value-of select="group-as/@name"/></b>
         </p>
         <xsl:apply-templates select="." mode="occurrence-code"/>
         <xsl:apply-templates select="if (description) then description else $definition/description" mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <xsl:template match="assembly[exists(group-as)] | field[exists(group-as)]">
      <xsl:variable name="definition" select="key('definitions',@ref)"/>
      <li>
         <p>
            <xsl:text>Labeled </xsl:text>
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
            select="if (description) then description else $definition/description"
            mode="model"/>
         <xsl:apply-templates select="remarks" mode="model"/>
      </li>
   </xsl:template>

   <!-- remarks are kept if @class='xml' or no class is given -->

   <xsl:template match="remarks[@class != 'json']" priority="2"/>

   <xsl:template match="remarks[@class = 'json']/p[1]">
      <p class="p">
         <span class="usa-tag">JSON</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

      <xsl:template match="example">
      <xsl:variable name="example-no" select="'example' || count(.|preceding-sibling::example)"/>
      <div class="example">
         <h3>
            <button aria-expanded="true"
               aria-controls="{ ../@name }_{$example-no}_json">
               <xsl:text>Example</xsl:text>
               <xsl:for-each select="description">: <xsl:apply-templates/></xsl:for-each>
            </button>
         </h3>
         <div id="{ ../@name }_{ $example-no }_json" class="example-content">
            <xsl:apply-templates select="remarks"/>
            <pre>
               <!-- 'doe' span can be wiped in post-process, but permits disabling output escaping -->
               <span class="doe">&#xA;{{&lt; highlight json "linenos=table" > }}&#xA;</span>
               <xsl:apply-templates select="*" mode="jsonize"/>
               <span class="doe">&#xA;{{ &lt;/ highlight > }}&#xA;</span>
            </pre>
         </div>
      </div>
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

   <xsl:template mode="occurrence-requirements occurrence-code" match="*">
      <i class="occurrence">
         <xsl:next-match/>
      </i>
   </xsl:template>

   <xsl:template mode="metaschema-type" match="flag">string property <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>
   <xsl:template mode="metaschema-type" match="field">string property <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>

   <!--Calls function in metaschema-docs-util.xsl -->
   <xsl:template
      mode="metaschema-type" match="field[m:has-properties(.)]">object, with labeled value <xsl:apply-templates select="@as-type" mode="#current"/></xsl:template>

   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='ARRAY']" expand-text="true">array of { if ( m:has-properties(.)) then 'objects' else 'strings' }.</xsl:template>

   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='SINGLETON_OR_ARRAY']">{ if ( m:has-properties(.)) then 'object' else 'string' } (when a singleton) or array { if ( m:has-properties(.)) then 'objects' else 'strings' } (when multiple)</xsl:template>
   <xsl:template mode="metaschema-type" priority="2" match="field[group-as/@in-json='BY_KEY']">object (with label)</xsl:template>

   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='ARRAY']">array</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='SINGLETON_OR_ARRAY']">object (when a singleton) or array (when multiple)</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly[group-as/@in-json='BY_KEY']">object (with label)</xsl:template>
   <xsl:template mode="metaschema-type" match="assembly">object (with object properties)</xsl:template>
   <xsl:template mode="metaschema-type" match="any">ANY</xsl:template>
   <xsl:template mode="metaschema-type" match="description | remarks"/>

   <xsl:template mode="metaschema-type" match="@as-type">
      <xsl:text> (type </xsl:text>
      <a href="{$datatype-page}/#{lower-case(.)}">
         <xsl:value-of select="."/>
      </a>
      <xsl:text>)</xsl:text>
   </xsl:template>
   
   <xsl:template mode="metaschema-type" match="@as-type[.='empty']"/>

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


   <!-- ^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V -->

   <!-- only works when XML-to-JSON converter is in the import tree -->
   <xsl:template match="description | remarks" mode="jsonize"/>

   <!-- no namespace for JSON -->
   <xsl:template match="METASCHEMA/namespace"/>

</xsl:stylesheet>
