<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"

  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="#all">

  <!-- Purpose: from OSCAL profile input, produce a representation of all controls called with insertions, alterations, modifications and settings applied. -->
  <!-- Dependencies: working links to valid control catalogs in OSCAL XML. -->

  <xsl:strip-space elements="group control part section component"/>

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
    <xsl:apply-templates select="." mode="echo"/>
  </xsl:template>

  <xsl:template match="*" mode="process-profile">
    <xsl:param name="so-far"/>
    <xsl:apply-templates select="." mode="echo"/>
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
      <xsl:attribute name="href" select="resolve-uri(@href,document-uri(/))"/>

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
        <xsl:sequence select="$filtered-results"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="profile" mode="import">
    <xsl:message terminate="yes">Matched profile unexpectedly</xsl:message>
  </xsl:template>

  <xsl:template match="section" mode="import"/>

  <xsl:template match="group" mode="import">
    <xsl:apply-templates select="group | control | component" mode="#current"/>
    <!--<xsl:variable name="included">
      <xsl:apply-templates select="group | control | component" mode="#current"/>
    </xsl:variable>
    <!-\- If the group contains nothing to be included, it isn't included either -\->
    <xsl:if test="exists($included/*)">
      <xsl:copy>
        <xsl:apply-templates select="@*" mode="#current"/>
        <xsl:attribute name="process-id" select="generate-id()"/>
        <xsl:apply-templates select="title" mode="#current"/>
        <xsl:sequence select="$included"/>
      </xsl:copy>
    </xsl:if>-->
  </xsl:template>

  <!--<xsl:template match="catalog/title | framework/title | worksheet/title | profile/title | group/title" mode="filter-controls">
    <xsl:param name="invocation" tunnel="yes" as="element(import)" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <xsl:text> [included in </xsl:text>
      <xsl:apply-templates select="$invocation/ancestor::profile[1]/title"/>
      <xsl:text>]</xsl:text>
    </xsl:copy>
  </xsl:template>-->

  <xsl:function name="oscal:matched" as="xs:boolean">
    <!-- $comp should be a control or component -->
    <xsl:param name="comp" as="element()"/>
    <!-- $imp will be an import element -->
    <xsl:param name="invocation" as="element()"/>
    <xsl:variable name="included" as="xs:boolean" select="exists($invocation/include/all) or empty($invocation/include)"/>
    <xsl:variable name="matched" select="some $re in ($invocation/include/match/@pattern ! ('^' || . || '$') ) satisfies (matches($comp/@id,$re))"/>
    <xsl:variable name="ancestor-control" select="$comp/(ancestor::control | ancestor::requirement[oscal:classes(.)='control'] )"/>
    <xsl:variable name="subcontrol-matched" select="some $re in ($invocation/include/match[@with-child-controls='yes']/@pattern ! ('^' || . || '$') ) satisfies (matches($ancestor-control/@id,$re))"/>
    <!--<xsl:variable name="control-implied" select="some $re in ($invocation/include/match[@with-control='yes']/@pattern ! ('^' || . || '$') ) satisfies (matches($comp/subcontrol/@id,$re))"/>-->

    <xsl:variable name="unmatched" select="some $re in ($invocation/exclude/match/@pattern ! ('^' || . || '$') ) satisfies (matches($comp/@id,$re))"/>

    <xsl:sequence select="($included or $matched or $subcontrol-matched) and not($unmatched)"/>
  </xsl:function>

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


    <xsl:choose>
      <!-- The control is included: go for it -->
      <xsl:when test="($included or oscal:matched(.,$invocation) or $called) and not($excluded)">
        <xsl:copy>
          <xsl:copy-of select="@*"/>
          <!--<xsl:comment expand-text="true"> invoked by { $invocation/../title } { document-uri($invocation/root()) }</xsl:comment>-->
          <!--<xsl:apply-templates mode="#current" select="* except (subcontrol | component[oscal:classes(.)='subcontrol'])"/>-->
          <xsl:apply-templates mode="#current"/>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <!-- The control is not included but it is not impossible than a subcontrol is included anyway -->
        <xsl:apply-templates select="control" mode="import">
          <xsl:with-param name="orphan" select="true()"/>
        </xsl:apply-templates>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template match="processing-instruction()" mode="import"/>



  <!-- Default merge behavior:
         collapses duplicates where possible
         inserts subcontrols into their controls (if warranted by ... what?)
         flags errors for
           controls in conflict (or are there collapsing rules)
           orphan subcontrols remaining -->



  <xsl:template match="merge" mode="process-profile">
    <xsl:param name="so-far"/>
    <!--<xsl:sequence select="$so-far"/>-->
    <xsl:variable name="merge-spec" select="."/>
    <xsl:variable name="merged">
      <merged>
        <!-- $so-far is giving us a sequence of imported controls and subcontrols, some of which may be nested, so representing all the import trees. -->
        <xsl:variable name="included" select="$so-far//control"/>
        <xsl:choose>
          <xsl:when test="exists($merge-spec/custom)">

            <!-- In this branch, a customized organization will be provided for them, so they are not grouped (by catalog) as below, going in ...  -->
            <!-- Problem: what to do about clashing IDs (across catalogs) in this case? -->

            <xsl:apply-templates select="$merge-spec/custom" mode="build">
              <xsl:with-param name="controls" tunnel="yes" select="$included"/>
            </xsl:apply-templates>

          </xsl:when>
          <xsl:otherwise>

            <xsl:for-each-group select="$included" group-by="parent::importing/@href">
              <group source="{current-grouping-key()}">

                <!-- If the merge spec says as-is, we do that -->
                <xsl:apply-templates select="$merge-spec/as-is" mode="rebuild">
                  <xsl:with-param name="catalog" select="document(current-grouping-key())/*"/>
                  <xsl:with-param name="controls" tunnel="yes" select="current-group()"/>
                </xsl:apply-templates>
                <!-- nb different mode here -->

                <xsl:if test="empty($merge-spec/(as-is | custom))">
                  <xsl:for-each-group select="current-group()" group-by="@id">
                    <xsl:call-template name="emit-component">
                      <xsl:with-param name="control-set" select="current-group()"/>
                      <xsl:with-param name="combining" select="$merge-spec/combine"/><!-- XXXX -->
                    </xsl:call-template>
                  </xsl:for-each-group>
                  <!--<xsl:sequence select="current-group()"/>-->
                </xsl:if>

              </group>
            </xsl:for-each-group>

          </xsl:otherwise>
        </xsl:choose>
      </merged>
    </xsl:variable>
    <!--<xsl:sequence select="$merged"/>-->

    <xsl:for-each select="$so-far/*">
      <xsl:copy>
        <xsl:copy-of select="@*"/>
        <xsl:copy-of select="node()"/>
        <xsl:sequence select="$merged"/>
      </xsl:copy>
    </xsl:for-each>
    <xsl:apply-templates select="." mode="echo"/>


  </xsl:template>


  <xsl:template match="as-is" mode="rebuild">
    <xsl:param name="catalog"  select="()" as="element(catalog)?"/>
    <xsl:apply-templates select="$catalog" mode="rebuild">
      <xsl:with-param name="merge-spec" tunnel="true" select=".."/>
    </xsl:apply-templates>
  </xsl:template>

  <!-- Mode 'rebuild' traverses a home catalog and rebuilds it, containing only the controls and subcontrols
     included. -->
  <xsl:mode name="rebuild" on-no-match="shallow-copy"/>

  <xsl:template match="comment() | processing-instruction()" mode="rebuild"/>

  <xsl:template match="catalog | group" mode="rebuild">
    <xsl:param name="controls" tunnel="yes" select="()"/>
    <xsl:if test="$controls/@id = .//control/@id">
      <xsl:copy>
        <xsl:apply-templates mode="rebuild"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>


  <!-- in 'rebuild' mode, the controls are matched in their original structure,
       but must then be emitted (now not the originals, but the proxies) according to the merge/combine rules. -->
  <xsl:template   mode="rebuild" match="control | component">
    <xsl:param    name="controls"   tunnel="yes" select="()"/>
    <xsl:param    name="merge-spec" tunnel="yes" as="element(merge)"/>
    <xsl:variable name="here"  select="."/>

    <xsl:for-each-group select="$controls[@id=$here/@id]" group-by="true()">
      <xsl:call-template name="emit-component">
        <xsl:with-param name="combining"   select="$merge-spec/combine"/>
        <xsl:with-param name="control-set" select="current-group()"/>
      </xsl:call-template>
    </xsl:for-each-group>
      <!--<xsl:for-each-group select="$controls[@id=$here/@id]" group-by="true()">
        <control id="{$here/@id}">
          <xsl:if test="exists(current-group()[matches(@class,'\s')])">
            <xsl:attribute name="class" select="distinct-values(current-group()/tokenize(@class,'\s+'))"/>
          </xsl:if>
          <xsl:apply-templates select="current-group()/*" mode="#current"/>
        </control>
      </xsl:for-each-group>-->
  </xsl:template>



  <xsl:template name="emit-component">
    <xsl:param name="combining" as="element(combine)?"/>
    <xsl:param name="control-set"/>
    <xsl:for-each-group select="$control-set" group-by="true()">
      <xsl:choose>
        <xsl:when test="$combining/@method = 'use-first'">
          <xsl:copy-of select="$control-set[1]"/>
        </xsl:when>
        <xsl:when test="$combining/@method = 'merge'">
          <xsl:element name="{$control-set[1]/name()}">
            <xsl:copy-of select="$control-set/@*"/>

            <xsl:for-each-group
              select="$control-set/(* except (component | references))"
              group-by="local-name() || ':' || @class || ':' || normalize-space(.)">
              <xsl:copy-of select="."/>
              <!-- just one -->
            </xsl:for-each-group>

            <xsl:apply-templates mode="#current" select="$control-set/component"/>

            <xsl:for-each-group select="$control-set/references/*"
              group-by="local-name() || ':' || @class || ':' || normalize-space(.)">
              <references>
                <xsl:copy-of select="."/>
              </references>
            </xsl:for-each-group>

          </xsl:element>
        </xsl:when>

        <!-- catches value 'keep' or anything else -->
        <xsl:otherwise>
          <!-- catches value 'keep' or anything else -->
          <xsl:copy-of select="$control-set"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>
  </xsl:template>



  <xsl:template match="custom" mode="build">
    <!-- tunnel parameter $controls holds controls and maybe loose subcontrols -->
    <xsl:copy>
      <xsl:apply-templates mode="#current">
        <xsl:with-param name="merge-spec" tunnel="true" select=".."/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="call" mode="build">
    <xsl:param name="controls" tunnel="yes" select="()"/>
    <xsl:variable name="calling" select="."/>

    <xsl:call-template name="emit-component">
      <xsl:with-param name="combining" select="ancestor::merge/combine" />
      <xsl:with-param name="control-set" select="$controls[@id=$calling/(@control-id|@subcontrol-id)]"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template match="match" mode="build">
    <xsl:param name="controls" tunnel="yes" select="()"/>
    <xsl:variable name="calling" select="."/>

    <xsl:call-template name="emit-component">
      <xsl:with-param name="combining" select="ancestor::merge/combine" />
      <xsl:with-param name="control-set" select="$controls[matches(@id,$calling/@pattern ! ('^' || . || '$'))]"/>
    </xsl:call-template>
  </xsl:template>

  <!-- mode 'build' matches the proxy structure given in the profile, pulling included
       controls and subcontrols to populate itself. -->
  <xsl:mode name="build" on-no-match="shallow-copy"/>

  <xsl:template match="comment() | processing-instruction()" mode="build"/>


  <xsl:template match="*" mode="echo"/>

  <!-- Next, matching 'modify' - we pass the 'resolution' document into a filter that
       rewrites parameter values and patches controls, wrt the stipulated modifications. -->

  <xsl:template match="modify" mode="process-profile">
    <xsl:param name="so-far"/>
    <xsl:variable name="modifications" select="."/>
    <xsl:for-each select="$so-far/resolution">
      <xsl:copy>
        <xsl:copy-of select="*|node()"/>
        <xsl:apply-templates select="child::merged" mode="patch">
          <xsl:with-param name="modifications" tunnel="yes" select="$modifications"/>
    </xsl:apply-templates>

      </xsl:copy>
    </xsl:for-each>

    <!--<xsl:apply-templates select="." mode="echo"/>-->
  </xsl:template>

<!-- 'patch' mode implements modification.  -->
  <xsl:template match="merged" mode="patch">
    <modified>
      <xsl:apply-templates mode="#current"/>
    </modified>
  </xsl:template>

  <xsl:template match="control | component[empty(ancestor::component)]" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>

    <xsl:copy-of select="key('alteration-by-target',@id,$modifications)/add[empty(@target)][@position='before']/*"/>

    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates select="title" mode="#current"/>
      <xsl:copy-of select="key('alteration-by-target',@id,$modifications)/add[empty(@target)][@position='starting']/*"/>

      <xsl:apply-templates select="* except title" mode="#current"/>
      <!--<xsl:message expand-text="true">{ string-join((* except title)/(name() || '#' || @id), ', ') }</xsl:message>-->

      <xsl:copy-of select="key('alteration-by-target',@id,$modifications)/add[empty(@target)][empty(@position) or @position='ending']/*"/>

    </xsl:copy>
  </xsl:template>

<!--   -->
  <xsl:function name="oscal:removable" as="xs:boolean">
    <xsl:param name="who" as="node()"/>
    <xsl:param name="mods" as="element(modify)"/>
    <xsl:variable name="home" select="($who/ancestor::control | $who/ancestor::component)[last()]"/>
    <xsl:variable name="alterations" select="key('alteration-by-target',$home/@id,$mods)"/>
    <xsl:variable name="removals" select="$alterations/remove"/>

    <xsl:sequence select="some $r in $removals satisfies oscal:remove-match($who,$r)"/>
  </xsl:function>

  <xsl:function name="oscal:remove-match">
    <xsl:param name="who" as="node()"/>
    <xsl:param name="removal" as="element(remove)"/>
    <xsl:variable name="item-okay"  select="empty($removal/@item-name) or ($removal/@item-name = local-name($who))"/>
    <xsl:variable name="id-okay"    select="empty($removal/@id-ref)    or ($removal/@id-ref = $who/@id)"/>
    <xsl:variable name="class-okay" select="empty($removal/@class-ref) or ($removal/@class-ref = oscal:classes($who))"/>
    <xsl:sequence select="exists($removal/(@item-name|@id-ref|@class-ref)) and ($item-okay and $id-okay and $class-okay)"/>
  </xsl:function>


  <xsl:template match="control//* | component//*" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:variable name="here" select="."/>
    <xsl:variable name="home" select="(ancestor::control | ancestor-or-self::component)[last()]"/>
    <xsl:variable name="alterations" select="key('alteration-by-target',$home/@id,$modifications)"/>
    <!-- Key retrievals scoped to alterations...   -->
    <xsl:variable name="patches-to-id" select="$alterations/key('addition-by-target',$here/@id,.)"/>
    <xsl:variable name="patches-to-class" select="$alterations/key('addition-by-target',$here/oscal:classes(.),.)"/>

    <!-- $patches-before contains 'add' elements marked as patching before this element, either by its @id
      or if bound by its @class, iff it is the first of its class in the containing control
     -->
    <xsl:variable name="patches-before" select="$patches-to-id[@position='before'] |
      $patches-to-class[$here is ($home/descendant::*[oscal:classes(.)=oscal:classes($here)])[1] ][@position='before']"/>

    <xsl:copy-of select="$patches-before/*"/>
    <xsl:if test="not(oscal:removable(.,$modifications))">
      <xsl:copy>
        <xsl:apply-templates select="@*" mode="#current"/>

        <xsl:variable name="patches-starting" select="$patches-to-id[@position='starting'] |
          $patches-to-class[$here is ($home/descendant::*[oscal:classes(.)=oscal:classes($here)])[1] ][@position='starting']"/>
        <xsl:copy-of select="$patches-starting/*"/>

        <xsl:apply-templates select="node()" mode="#current"/>

        <xsl:variable name="patches-ending" select="$patches-to-id[empty(@position) or @position='ending' or not(@position=('before','after','starting','ending'))] |
          $patches-to-class[$here is ($home/descendant::*[oscal:classes(.)=oscal:classes($here)])[last()] ][empty(@position) or @position='ending']"/>
        <xsl:copy-of select="$patches-ending/*"/>
      </xsl:copy>
    </xsl:if>

    <!-- Reverse logic for 'after' patches. Note that elements inside descendant subcontrols or components are excluded from consideration.    -->
    <xsl:variable name="patches-after" select="$patches-to-id[@position='after'] |
      $patches-to-class[$here is ($home/descendant::*[oscal:classes(.)=oscal:classes($here)])[last()] ]
      [@position='after']"/>
    <xsl:copy-of select="$patches-after/*"/>

  </xsl:template>


  <!-- When a catalog is filtered through a profile, its parameters are overwritten
       by parameters passed in from the invocation. -->

<!-- @priority 12 overrides the template above (matching anything inside controls for patching) -->
  <xsl:template match="param" mode="patch" priority="12">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates mode="patch" select="desc"/>
      <xsl:if test="empty(desc)">
        <xsl:copy-of select="key('param-settings',@id,$modifications)/desc"/>
      </xsl:if>
      <xsl:apply-templates mode="patch" select="label"/>
      <xsl:if test="empty(label)">
        <xsl:copy-of select="key('param-settings',@id,$modifications)/label"/>
      </xsl:if>
      <xsl:apply-templates mode="patch" select="value"/>
      <xsl:if test="empty(value)">
        <xsl:copy-of select="key('param-settings',@id,$modifications)/value"/>
      </xsl:if>
    </xsl:copy>

  </xsl:template>

  <!-- set-param/desc overrides param/desc -->
  <xsl:template match="param/desc"  mode="patch" priority="10">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>

    <xsl:copy-of select="(key('param-settings',parent::param/@id,$modifications)/desc,.)[1]"/>
  </xsl:template>

  <xsl:template match="param/label" mode="patch" priority="10">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$modifications)/label,.)[1]"/>
  </xsl:template>

  <!-- same for param/value -->
  <xsl:template match="param/value" mode="patch" priority="10">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <xsl:copy-of select="(key('param-settings',parent::param/@id,$modifications)/value,.)[1]"/>
  </xsl:template>



  <!--<xsl:template match="control/* | subcontrol/* | component/*" mode="patch">
    <xsl:param name="modifications" tunnel="yes" as="element(modify)" required="yes"/>
    <!-\- boolean comes back as true() if a 'remove' element in the invocation matches
         by id of the parent and class of the matching component -\->
    <xsl:variable name="remove_me" select="key('alteration-by-target',../@id,$modifications)/remove/@targets/tokenize(.,'\s+') = oscal:classes(.)"/>
    <xsl:if test="not($remove_me)">
      <xsl:next-match/>
    </xsl:if>
  </xsl:template>-->


  <xsl:key name="param-settings" match="oscal:set-param" use="@param-id"/>

  <xsl:key name="alteration-by-target" match="alter" use="@control-id"/>

<!-- additions (modify/alter/add elements) can be applied using either class value or id:
     however the key must be scoped to within the control (or subcontrol)
     -->
  <xsl:key name="addition-by-target" match="add" use="@target"/>


  <!-- Service functions: provided for Schematron etc. DON'T MESS WITH THESE OR YOU'LL BREAK IT. -->
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






</xsl:stylesheet>
