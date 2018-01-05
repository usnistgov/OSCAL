<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all">

  <xsl:strip-space elements="group control subcontrol part section component"/>
  
  <xsl:output indent="yes"/>

  <xsl:mode name="#default"      on-no-match="shallow-copy"/>
  
  <xsl:mode name="oscal:resolve" on-no-match="shallow-copy"/>
  
  <xsl:mode name="copy"          on-no-match="shallow-copy"/>
  
  <xsl:mode name="import"        on-no-match="shallow-copy"/>
  
  <!-- 'filter-merge' mode post-processes merged results to remove duplicated data -->
  <xsl:mode name="filter-merge" on-no-match="shallow-copy"/>
  
  <!-- Extension point for merge-time enhancement here recording import provenance (otherwise lost in merge) -->
  <xsl:mode name="merge-enhance" on-no-match="shallow-copy"/>
  
  <xsl:mode name="patch"         on-no-match="shallow-copy"/>
  
  
<!-- Presumes new model (import*, merge? modify)
  1. Test import* across multiple deep imports
  2. Refine aggregation w/o merge logic
  3. Install / test merge logic
  4. Reimplement modify logic
  -->
  
  <!-- Frameworks and catalogs are resolved as themselves (for now). -->
  <xsl:template match="catalog | framework | worksheet" mode="oscal:resolve #default">
    <xsl:apply-templates select="." mode="copy"/>
  </xsl:template>
  
  <!-- Profiles, however, must be executed ... -->
  <xsl:template match="profile" mode="oscal:resolve #default">
    <!-- each child of profile indicates a filter:
      import: adds a new selection of controls
      merge: merges replicated catalog structures
      modify: propagates changes and parameter values -->
      
      <xsl:iterate select="*">
        <!-- $so-far starts with only a flag -->
        <xsl:param name="so-far">
          <resolution profile="{document-uri(/)}"/>
        </xsl:param>
        <xsl:on-completion select="$so-far"/>
        <xsl:next-iteration>
          <xsl:with-param name="so-far">
            <!-- now process the import, merge or modify as a proxy -->
            <xsl:apply-templates select="." mode="process-profile">
              <xsl:with-param name="so-far" select="$so-far"/>
            </xsl:apply-templates>
          </xsl:with-param>
        </xsl:next-iteration>
      </xsl:iterate>
  </xsl:template>
  
<!-- 'process-profile' mode drives the application of semantics of
      profile element children 'import', 'merge' and 'modify' -->
  
<!-- import: adds control set by (recursively) calling profiles/catalogs -->
  
  <xsl:template match="import" mode="process-profile">
    <xsl:param name="so-far" as="document-node()"/>
    <xsl:variable name="imported">
      <!-- Returns the imported profile or catalog, including only the designated controls. It will be a 'resolution' element or an ERROR.-->
      <xsl:apply-templates select="." mode="import"/>
    </xsl:variable>
    <!-- Returning $so-far, except with the imported / filtered catalog spliced in -->
    <xsl:for-each select="$so-far/*">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:copy-of select="node()"/>
        <xsl:sequence select="$imported"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="*" mode="process-profile">
    <xsl:param name="so-far"/>
    <xsl:sequence select="$so-far"/>
  </xsl:template>
  
  <!-- Mode 'import' manages importing controls from catalogs or upstream profiles -->
  <xsl:template match="import" mode="import oscal:resolve">
    <xsl:param name="authorities-so-far" tunnel="yes" select="document-uri(/)" as="xs:anyURI+"/>
    
    
    <!--<xsl:param name="invocation" tunnel="yes" select="."/>-->
    <xsl:variable name="invocation" select="."/>
    
    
    <!-- $authority will be a catalog, framework or profile. -->
    <xsl:variable name="authority"    select="document(@href,root(.))"/>
    <!-- $authorityURI is a full path not whatever relative form was used -->
    <xsl:variable name="authorityURI" select="document-uri($authority)"/>
    
    <importing>
      <xsl:copy-of select="@href"/>

      <xsl:choose>
        <xsl:when test="$authorityURI = $authorities-so-far" expand-text="true">
          <ERROR>Can't resolve profile against {$authorityURI}, already imported in this chain:
            {string-join($authorities-so-far,' / ')}</ERROR>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="." mode="report-invocation"/>
          
          <!--    first we process ourselves with our own rules, returning a catalog, worksheet or (if a profile), a resolution. -->
          <!-- then we filter the resolution using the new import -->
          <xsl:variable name="interim">
            <xsl:apply-templates select="$authority" mode="oscal:resolve"/>
          </xsl:variable>
          <!-- Next we apply templates in mode 'import', passing ourselves in as the invocation -->
          <xsl:apply-templates select="$interim" mode="import">
            <xsl:with-param name="invocation" tunnel="yes" select="."/>
            <xsl:with-param name="authorities-so-far" tunnel="yes" as="xs:anyURI+"
              select="$authorities-so-far, $authorityURI"/>
          </xsl:apply-templates>
          <!--<xsl:copy-of  select="$interim"/>-->
        </xsl:otherwise>
      </xsl:choose>
    </importing>
  </xsl:template>
  
  <xsl:template match="import" mode="report-invocation">
    <xsl:variable name="invocation" select="."/>
    <!-- $authority will be a catalog, framework or profile. -->
    <xsl:variable name="authority" select="document(@href,root(.))"/>
    <xsl:comment expand-text="true"> importing { $authority/*/local-name() }</xsl:comment>
    <!--<xsl:copy-of select="*"/>-->
  </xsl:template>
  
  <xsl:template match="catalog | framework | worksheet | resolution" mode="import">
    <xsl:variable name="filtered-results">
      <xsl:apply-templates select="*" mode="#current"/>
    </xsl:variable>
    <xsl:if test="exists($filtered-results/*)">
      <xsl:copy>
        <xsl:sequence select="$filtered-results"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>

  <xsl:template match="profile" mode="import">
    <xsl:message terminate="yes">Bah! matched profile unexpectedly</xsl:message>
  </xsl:template>
  
  <xsl:template match="section" mode="import"/>
  
  <xsl:template match="group" mode="import">
    <xsl:variable name="included">
      <xsl:apply-templates select="group | control | component" mode="#current"/>
    </xsl:variable>
    <!-- If the group contains nothing to be included, it isn't included either -->
    <xsl:if test="exists($included/*)">
      <xsl:copy>
        <xsl:apply-templates select="@*" mode="#current"/>
        <xsl:attribute name="process-id" select="generate-id()"/>
        <xsl:apply-templates select="title" mode="#current"/>
        <xsl:sequence select="$included"/>
      </xsl:copy>  
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="catalog/title | framework/title | worksheet/title | profile/title | group/title" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <xsl:text> [included in </xsl:text>
      <xsl:apply-templates select="$invocation/ancestor::profile[1]/title"/>
      <xsl:text>]</xsl:text>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="control | component[oscal:classes(.)='control']" priority="3" mode="import">
    <!--A control or subcontrol is always excluded if it appears in import/exclude
    Otherwise, it is included if empty(import/include), exists(import/all)
    or exists(import/call[(@control-id | @subcontrol-id)=current()/@id]-->
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <!-- A control is included by 'all' or by default when no inclusion rule is given -->
    <xsl:variable name="included" as="xs:boolean" select="exists($invocation/include/all) or empty($invocation/include)"/>
    <xsl:variable name="excluded" as="xs:boolean" select="$invocation/exclude/call/@control-id = @id"/>
    <xsl:variable name="called"   as="xs:boolean" select="$invocation/include/call/@control-id = @id"/>
    <!--<xsl:copy-of select="$invocation"/>-->
    <xsl:if test="($included or $called) and not($excluded)">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:comment expand-text="true"> invoked by { $invocation/../title } { document-uri($invocation/root()) }
        </xsl:comment>
        <xsl:apply-templates mode="#current"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="subcontrol | component[oscal:classes(.)='subcontrol']" priority="2" mode="import">
    <!-- Subcontrol logic is analogous to control logic for keeping.
      Extend this with (parameterized) defaults for handling subcontrols. -->
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <!-- A subcontrol is included if all explicitly says to include all subcontrols, or
         if its containing controls is called and set @with-subcontrols -->
    <xsl:variable name="control" select="ancestor::control[1]"/>
    <xsl:variable name="included" select="(: include if with-subcontrols is on 'all'
      or on a corresponding 'call' :) 
      ($invocation/include/all/@with-subcontrols='yes') or
      ($invocation/include/call[@control-id  = $control/@id]/@with-subcontrols='yes')
      "/>
    <!-- Or it can be called on its own (no matter other settings) -->
    <xsl:variable name="called"   select="exists($invocation/include/call[@subcontrol-id  = current()/@id])"/>
    <!-- The subcontrol can still be excluded -->
    <xsl:variable name="excluded" select="exists($invocation/exclude/call[@subcontrol-id  = current()/@id])"/>
    <xsl:if test="($included or $called) and not($excluded)">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates mode="#current"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>


  <!-- Merge step:
  strips invocation hierarchy
  merges catalogs ('frameworks') -->
  <xsl:template match="merge" mode="process-profile">
    <xsl:param name="so-far"/>
    <xsl:for-each select="$so-far/*">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <!-- micropipeline first merges everything, then removes duplication -->
        <xsl:variable name="merged">
          <xsl:call-template name="merge-groups">
            <xsl:with-param name="groups" select="//(framework | catalog | worksheet)"/>
          </xsl:call-template>
        </xsl:variable>
        <!--<xsl:sequence select="$merged"/>-->
        <xsl:apply-templates select="$merged" mode="filter-merge"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:function name="oscal:group-signature" as="xs:string">
    <xsl:param name="who"/>
    <xsl:value-of select="string-join((local-name($who),$who/title,$who/prop[@class='name']),'|')"/>
  </xsl:function>
  
  <xsl:template name="merge-groups">
    <xsl:param name="groups" select="()"/>
    <xsl:for-each-group select="$groups" group-by="oscal:group-signature(.)">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:apply-templates select="current-group()/(* except group)" mode="merge-enhance">
          <xsl:sort select="@id"/>
        </xsl:apply-templates>
        <xsl:call-template name="merge-groups">
          <xsl:with-param name="groups" select="current-group()/group"/>
        </xsl:call-template>
      </xsl:copy>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template mode="merge-enhance" match="control | subcontrol | component">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
        <xsl:for-each select="ancestor::import[position() gt 1]">
          <xsl:sort select="count(ancestor::*)" order="descending"/>
          <prop name="import-provenance">
            <xsl:value-of select="@href"/>
          </prop>
        </xsl:for-each>
      <xsl:apply-templates mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="control | subcontrol | component" mode="filter-merge">
    <xsl:copy-of select="."/>
  </xsl:template>
  
  <xsl:template match="*" mode="filter-merge">
    <xsl:variable name="dibs" select="preceding-sibling::*[deep-equal(.,current())]"/>
    <xsl:if test="empty($dibs)">
      <xsl:copy>
        <xsl:apply-templates select="@*" mode="filter-merge"/>
        <xsl:apply-templates mode="#current"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
    
  
  <!-- Next, matching 'modify' - we pass the 'resolution' document into a filter that
       rewrites parameter values and patches controls, wrt the stipulated modifications. -->

  <!-- TODO Adds patches, replacing parameter and control contents. -->
  <xsl:template match="modify" mode="process-profile">
    <xsl:param name="so-far"/>
    <xsl:apply-templates select="$so-far" mode="patch">
      <xsl:with-param name="modifications" tunnel="yes" select="."/>
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="control | subcontrol | component" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="#current"/>
      <xsl:copy-of select="key('alteration-by-target',@id,$modifications)/augment/*"/>
    </xsl:copy>
  </xsl:template>
  
  <!-- When a catalog is filtered through a profile, its parameters are overwritten
       by parameters passed in from the invocation. -->
  <xsl:template match="param/value" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$modifications)/value,.)[1]"/>
  </xsl:template>
  
  <xsl:template match="param/desc" mode="filter-controls">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$modifications)/desc,.)[1]"/>
  </xsl:template>
  
  
  <xsl:template match="control/* | subcontrol/* | component/*" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <!-- boolean comes back as true() if a 'remove' element in the invocation matches
         by id of the parent and class of the matching component -->
    <xsl:variable name="remove_me" select="key('alteration-by-target',../@id,$modifications)/remove/@targets/tokenize(.,'\s+') = oscal:classes(.)"/>
    <xsl:if test="not($remove_me)">
      <xsl:next-match/>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:key name="param-settings" match="oscal:set-param" use="@param-id"/>
  
  <xsl:key name="alteration-by-target" match="alter" use="@control-id | @subcontrol-id"/>
  

<!-- Service functions: provided for Schematron etc. -->
  <!-- Returns a set of controls or components marked as controls for a profile. -->
  <xsl:function name="oscal:resolved-controls" as="element()*">
    <!--saxon:memo-function="yes" xmlns:saxon="http://saxon.sf.net/"-->
    <xsl:param name="who" as="document-node()?"/>
    <xsl:sequence select="oscal:resolve($who)//(control | component[contains-token(@class,'control')])"/> 
  </xsl:function>
  
  <!-- Returns a set of subcontrols or components marked as subcontrols for a profile. -->
  <xsl:function name="oscal:resolved-subcontrols" as="element()*">
    <xsl:param name="who" as="document-node()?"/>
    <xsl:sequence select="oscal:resolve($who)//(subcontrol | component[contains-token(@class,'subcontrol')])"/> 
  </xsl:function>
  
  <!-- Expect a profile to be resolved. If a catalog or framework, this should return a copy of the input. -->
  <xsl:function name="oscal:resolve" as="document-node()" saxon:memo-function="yes" xmlns:saxon="http://saxon.sf.net/">
    <xsl:param name="who" as="node()?"/>
    <xsl:document>
      <xsl:apply-templates select="$who" mode="oscal:resolve"/>
    </xsl:document>
  </xsl:function>
  
  <!-- returns sequence of tokens including passed value, but non-duplicatively -->
  <xsl:function name="oscal:classes-including" as="xs:string">
    <xsl:param name="class" as="attribute(class)?"/>
    <xsl:param name="value" as="xs:string"/>
    <xsl:sequence select="string-join((tokenize($class,'\s+')[. ne $value],$value), ' ')"/>
  </xsl:function>

  <xsl:function name="oscal:classes" as="xs:string*">
    <xsl:param name="who" as="element()"/>
    <!-- HTML is not case sensitive so neither are we -->
    <xsl:sequence select="tokenize($who/@class/lower-case(.), '\s+')"/>
  </xsl:function>
  
  <xsl:key name="element-by-id" match="*[@id]" use="@id"/>
  
  
  <oscal:hide-code>
    <!-- XXX to do: re-implement patching ...   -->
    <xsl:template match="profile" mode="filter-controls">
    <!-- $invocation will be the 'import' element from the calling profile. -->
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <!-- We are selecting controls from a profile, not a catalog.
      In turn it makes reference to its own authorities (profiles and/or catalogs).
      Plus modifies them and injects parameters etc.
      Hence we must recurse.
    Note that each pass gets to overwrite parameters in the previous pass. -->
    
    <!-- called-catalog is whatever is produced by processing the invocation and selecting its controls. -->
     <xsl:variable name="called-catalog">
       <xsl:apply-templates select="import" mode="select-controls"/>
     </xsl:variable>
    <!-- having resolved this, we will process that catalog, but filtering it against
         the calling invocation  -->
         <xsl:apply-templates select="$called-catalog" mode="filter-controls">
       <xsl:with-param name="invocation" tunnel="yes" select="$invocation"/>
     </xsl:apply-templates>
  </xsl:template>
  
  <xsl:template match="profile" mode="select-controls">
    <!-- $invocation will be the 'import' element from the calling profile. -->
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <!-- We are selecting controls from a profile, not a catalog.
      In turn it makes reference to its own authorities (profiles and/or catalogs).
      Plus modifies them and injects parameters etc.
      Hence we must recurse. -->
    
    <!-- called-catalog is whatever is produced by processing the invocation and selecting its controls. -->
    <!--<xsl:variable name="called-catalog">
      <xsl:apply-templates select="import" mode="select-controls"/>
    </xsl:variable>-->
    <!-- having resolved this, we will process that catalog, but filtering it against
         the calling invocation  -->
    <xsl:apply-templates select="import" mode="select-controls"/><!--
      <xsl:with-param name="invocation" tunnel="yes" select="$invocation"/>
    </xsl:apply-templates>-->
  </xsl:template>
  
  
    
  </oscal:hide-code>
  

  
</xsl:stylesheet>
