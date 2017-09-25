<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all"
  >
  <!--<xsl:import href="oscal-functions.xsl"/>-->

  <!--<xsl:import href="oscal-browser-display.xsl"/>-->
  
  <xsl:strip-space elements="group control subcontrol part section component"/>
  
  <xsl:output indent="yes"/>

  <xsl:mode name="#default"        on-no-match="shallow-copy"/>
  
  <xsl:mode name="oscal:resolve"   on-no-match="shallow-copy"/>
  
  <xsl:mode name="copy"            on-no-match="shallow-copy"/>
  
  <xsl:mode name="filter-controls" on-no-match="shallow-copy"/>
  
  <!-- Frameworks and catalogs are resolved as themselves. -->
  <xsl:template match="catalog | framework | worksheet" mode="oscal:resolve #default">
    <xsl:apply-templates select="." mode="copy"/>
  </xsl:template>
  
  <xsl:template match="profile" mode="oscal:resolve #default">
    <!-- We need a wrapper element in case of more than one invocation -->
    <xsl:copy>
      <!-- So we copy ourselves as well in case a subsequent transformation wants to see -->
      <xsl:copy-of select="@*"/>
      <!-- Now we execute the traversal on the catalogs invoked -->
      <xsl:apply-templates select="title" mode="copy"/>
      <xsl:apply-templates select="invoke" mode="select-controls"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="invoke" mode="oscal:resolve">
    <xsl:apply-templates select="." mode="select-controls"/>
  </xsl:template>
  
  <xsl:template match="invoke" mode="report-invocation">
    
    <xsl:variable name="invocation" select="."/>
    <!-- $authority will be a catalog, framework or profile. -->
    <xsl:variable name="authority" select="document(@href,root(.))"/>
    
      <xsl:comment expand-text="true"> invoking a { $authority/*/local-name() }</xsl:comment>
      <xsl:copy-of select="*"/>
  </xsl:template>
  
  <xsl:template match="invoke" mode="select-controls">
    <xsl:param name="authorities-so-far" tunnel="yes" select="document-uri(/)" as="xs:anyURI+"/>
    <xsl:variable name="invocation" select="."/>
    <!-- $authority will be a catalog, framework or profile. -->
    <xsl:variable name="authority" select="document(@href,root(.))"/>
    <xsl:variable name="authorityURI" select="document-uri($authority)"/>
    
    <xsl:copy>
      <xsl:copy-of select="@href"/>
      
    <xsl:choose>
      <xsl:when test="$authorityURI = $authorities-so-far" expand-text="true">
        <ERROR>Can't resolve profile against {$authorityURI}, already invoked in this chain: {string-join($authorities-so-far,' / ')}</ERROR>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="." mode="report-invocation"/> 
        <xsl:apply-templates select="$authority/*" mode="filter-controls">
          <xsl:with-param name="invocation" tunnel="yes" select="$invocation"/>
          <xsl:with-param name="authorities-so-far" tunnel="yes" as="xs:anyURI+"
            select="$authorities-so-far, $authorityURI"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="profile" mode="filter-controls">
    <!-- $invocation will be the 'invoke' element from the calling profile. -->
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <!-- We are selecting controls from a profile, not a catalog.
      In turn it makes reference to its own authorities (profiles and/or catalogs).
      Plus modifies them and injects parameters etc.
      Hence we must recurse.
    Note that each pass gets to overwrite parameters in the previous pass. -->
    
    <!-- called-catalog is whatever is produced by processing the invocation and selecting its controls. -->
     <xsl:variable name="called-catalog">
       <xsl:apply-templates select="invoke" mode="select-controls"/>
     </xsl:variable>
    <!-- having resolved this, we will process that catalog, but filtering it against
         the calling invocation  -->
         <xsl:apply-templates select="$called-catalog" mode="filter-controls">
       <xsl:with-param name="invocation" tunnel="yes" select="$invocation"/>
     </xsl:apply-templates>
  </xsl:template>
  
  <!-- For now, everything comes as a framework. -->
  <xsl:template match="catalog | framework | worksheet" mode="filter-controls">
    <xsl:variable name="filtered-results">
      <xsl:apply-templates select="title" mode="#current"/>
      <xsl:apply-templates select="group | control | component" mode="filter-controls"/>
    </xsl:variable>
    <xsl:if test="exists($filtered-results/*)">
    <framework>
      <xsl:sequence select="$filtered-results"/>
    </framework>
    </xsl:if>
  </xsl:template>
    
  <xsl:template match="group" mode="filter-controls">
    <xsl:variable name="included">
      <xsl:apply-templates select="group | control | component" mode="#current"/>
    </xsl:variable>
    <!-- If the group contains nothing to be included, it isn't included either -->
    <xsl:if test="exists($included/*)">
      <xsl:copy>
        <xsl:apply-templates select="@*" mode="#current"/>
        <xsl:apply-templates select="title" mode="#current"/>
        <xsl:sequence select="$included"/>
      </xsl:copy>  
    </xsl:if>
  </xsl:template>
  
  <!--<xsl:template match="catalog/title | framework/title | worksheet/title | profile/title | group/title" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <xsl:text> [included in </xsl:text>
      <xsl:apply-templates select="$invocation/ancestor::profile[1]/title"/>
      <xsl:text>]</xsl:text>
    </xsl:copy>
  </xsl:template>-->
  
  <xsl:template match="control | component[oscal:classes(.)='control']" priority="3" mode="filter-controls">
    <!--A control or subcontrol is always excluded if it appears in invoke/exclude
    Otherwise, it is included if empty(invoke/include), exists(invoke/all)
    or exists(invoke/call[(@control-id | @subcontrol-id)=current()/@id]-->
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <!-- A control is included by 'all' or by default when no inclusion rule is given -->
    <xsl:variable name="included" as="xs:boolean" select="exists($invocation/include/all) or empty($invocation/include)"/>
    <xsl:variable name="excluded" as="xs:boolean" select="$invocation/exclude/call/@control-id = @id"/>
    <xsl:variable name="called"   as="xs:boolean" select="$invocation/include/call/@control-id = @id"/>
    <!--<xsl:copy-of select="$invocation"/>-->
    <xsl:if test="($included or $called) and not($excluded)">
      <component class="{oscal:classes-including(@class,'control')}">
        <xsl:copy-of select="@* except @class"/>
        <xsl:apply-templates mode="filter-controls"/>
        <xsl:apply-templates mode="augment" select="."/>
      </component>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="subcontrol | component[oscal:classes(.)='subcontrol']" priority="2" mode="filter-controls">
    <!-- Subcontrol logic is analogous to control logic for keeping.
      Extend this with (parameterized) defaults for handling subcontrols. -->
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
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
      <component class="{oscal:classes-including(@class,'subcontrol')}">
        <xsl:copy-of select="@* except @class"/>
        <xsl:apply-templates mode="filter-controls"/>
        <xsl:apply-templates mode="augment" select="."/>
      </component>
    </xsl:if>
  </xsl:template>


  <xsl:template match="control | subcontrol | component" mode="augment">
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    
    <xsl:copy-of select="key('alteration-by-target',@id,$invocation)/augment/*"/>
  </xsl:template>
  
  
  <!-- When a catalog is filtered through a profile, its parameters are overwritten
       by parameters passed in from the invocation. -->
  <xsl:template match="param/value" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$invocation)/value,.)[1]"/>
  </xsl:template>
  
  <xsl:template match="param/desc" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$invocation)/desc,.)[1]"/>
  </xsl:template>
  
  
  <xsl:template match="control/* | subcontrol/* | component/*" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(invoke)" required="yes"/>
    <!-- boolean comes back as true() if a 'remove' element in the invocation matches
         by id of the parent and class of the matching component -->
    <xsl:variable name="remove_me" select="key('alteration-by-target',../@id,$invocation)/remove/@targets/tokenize(.,'\s+') = oscal:classes(.)"/>
    <xsl:if test="not($remove_me)">
      <xsl:next-match/>
    </xsl:if>
    
  </xsl:template>
  
  <xsl:key name="element-by-id" match="*[@id]" use="@id"/>
  
  <xsl:key name="param-settings" match="oscal:set-param" use="@param-id"/>
  
  <xsl:key name="alteration-by-target" match="alter" use="@control-id | @subcontrol-id"/>

<!-- OSCAL*2018 -->

  <!-- Returns a set of controls or components marked as controls for a profile. -->
  <xsl:function name="oscal:resolved-controls" as="element()*">
    <!--saxon:memo-function="yes" xmlns:saxon="http://saxon.sf.net/"-->
    <xsl:param name="who" as="document-node()"/>
    <xsl:sequence select="oscal:resolve($who)//(control | component[contains-token(@class,'control')])"/> 
  </xsl:function>
  
  <!-- Returns a set of subcontrols or components marked as subcontrols for a profile. -->
  <xsl:function name="oscal:resolved-subcontrols" as="element()*">
    <xsl:param name="who" as="document-node()"/>
    <xsl:sequence select="oscal:resolve($who)//(subcontrol | component[contains-token(@class,'subcontrol')])"/> 
  </xsl:function>
  
  <!-- Expect a profile to be resolved. If a catalog or framework, this should return a copy of the input. -->
  <xsl:function name="oscal:resolve" as="document-node()" saxon:memo-function="yes" xmlns:saxon="http://saxon.sf.net/">
    <xsl:param name="who" as="node()"/>
    <xsl:document>
      <xsl:apply-templates select="$who" mode="oscal:resolve"/>
    </xsl:document>
  </xsl:function>
  
  
  
  
  <!-- returns sequence of tokens including passed value, but non-duplicatively -->
  <xsl:function name="oscal:classes-including" as="xs:string">
    <xsl:param name="class" as="attribute(class)"/>
    <xsl:param name="value" as="xs:string"/>
    <xsl:sequence select="string-join((tokenize($class,'\s+')[. ne $value],$value), ' ')"/>
  </xsl:function>

  <xsl:function name="oscal:classes" as="xs:string*">
    <xsl:param name="who" as="element()"/>
    <!-- HTML is not case sensitive so neither are we -->
    <xsl:sequence select="tokenize($who/@class/lower-case(.), '\s+')"/>
  </xsl:function>
  
  
</xsl:stylesheet>
