<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

<!-- (This XSLT is broken until profile resolution is (re)stabilized -->
  <xsl:include href="../../../lib/XSLT/profile-resolver.xsl"/>
  <!-- included xslt has <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/> -->
<!--
    
    include/control-id 
    include/subcontrol-id
    exclude/control-id
    exclude/subcontrol-id
    param
    alter
  
  -->
  
  
  <!-- Resolved invocation is whatever we get for resolving the document element:
       either a catalog, or a profile resolved into a framework echoing a catalog. -->
  <!--<xsl:variable name="oscal-resolved" as="document-node()">
    <xsl:apply-templates select="/*" mode="oscal:resolve"/>
  </xsl:variable>-->
  
  <sch:pattern>    <!--<sch:rule context="oscal:invoke">
      <sch:let name="catalog-available" value="boolean(exists(document(@href)/oscal:catalog))"/>
      <!-\-<sch:assert test="exists(document(@href)) and empty(document(@href)/oscal:catalog)" role="warning"><sch:value-of select="@href"/>' is not a catalog</sch:assert>-\->
      <sch:assert test="$catalog-available or exists(document(@href))">Catalog '<sch:value-of select="@href"/>' not found</sch:assert>
    </sch:rule>-->
    
    <sch:rule context="oscal:import">
      
      <!--<sch:assert test="not(resolve-uri(@href,document-uri(/)) = (../oscal:import except .)/resolve-uri(@href,document-uri(/)) )" role="warning">
        More than one invocation on authority <sch:value-of select="resolve-uri(@href,document-uri(/))"/> is PROBABLY NOT WHAT YOU WANT.
      </sch:assert>-->

      <sch:let name="resource" value="if (doc-available(resolve-uri(@href, document-uri(/)))) then document(@href,/) else ()"/>
      
      <sch:assert test="exists($resource)">No resource found at <sch:value-of select="@href"/>...</sch:assert>
      
      <!--<sch:assert test="exists($resource)">No resource is found at <sch:value-of select="@href"/></sch:assert>-->
      
      <!-- Resolving just the import gives an imported/catalog with a selection of controls for just this import branch. -->
      <sch:let name="resolved"        value="oscal:resolve(.)"/>
      <!-- Saxon should be memoing these functions for efficiency --> 
      
      
<!-- Testing to see if 'all' might be used instead of a set of calls -->
      <sch:let name="explicit-calls" value="oscal:include/oscal:call"/>
<!-- unresolved is gotten by resolving the import's href, not the import itself (yes) -->
      <sch:let name="unresolved"     value="oscal:resolve($resource)"/>
      <sch:let name="excluded" value="($unresolved//(oscal:control|oscal:subcontrol|oscal:component)) except key('element-by-id',$explicit-calls/(@control-id|@subcontrol-id),$unresolved)"/>
      
      <sch:report role="warning" test="exists($resource) and (exists($explicit-calls[2]) and exists($excluded) and count($excluded) lt 4)">This invocation could use include/all, excluding only <xsl:value-of select="$excluded/@id" separator=", "/> (instead of <sch:value-of select="count($explicit-calls)"/> include/call elements)</sch:report>
      <sch:report role="warning" test="exists($resource) and (exists($explicit-calls[2]) and empty($excluded))">This invocation could use include/all (instead of <sch:value-of select="count($explicit-calls)"/> include/call elements): it calls all the controls in <sch:value-of select="@href"/> without excluding any</sch:report>
      
      <sch:let name="controls"    value="$resolved//(oscal:control | oscal:component[contains-token(@class,'control')] )"/>
      <sch:let name="subcontrols" value="$resolved//(oscal:subcontrol | oscal:component[contains-token(@class,'subcontrol')] )"/>
      
      <sch:let name="me" value="self::oscal:import"/>
      <sch:let name="other-controls" value="../(oscal:import except $me)/oscal:resolve(.)//(oscal:control | oscal:component[contains-token(@class,'control')] )"/>
      <sch:let name="other-subcontrols"
        value="../(oscal:import except $me)/oscal:resolve(.)//(oscal:subcontrol | oscal:component[contains-token(@class,'subcontrol')] )"/>
      
      <!--<sch:report test="true()">We have <xsl:value-of select="$resolved/name()" separator=", "/></sch:report>-->
      <sch:let name="contested" value="$controls[@id = $other-controls/@id] | $subcontrols[@id = $other-subcontrols/@id]"/>
      <sch:assert role="warning" test="empty($contested)">CONTESTED <xsl:value-of select="(if (count($contested) eq 1) then 'CONTROL ' else 'CONTROLS ') ||
        string-join($contested/@id,', ') || (if (count($contested) eq 1) then ' appears' else ' appear')"/> in more than one invoked resource.</sch:assert>
      
    </sch:rule>
    
    <sch:rule context="oscal:call">
      <!-- We expect a catalog, framework or resolved profile. Note we are not resolving the local invocation,
      as we do when checking it; instead we resolve only its (own) source or authority. -->
      <!--<sch:let name="resolved-invocation" value="oscal:resolve($authority)"/>-->
      
      <sch:let name="nominal-resource" value="ancestor::oscal:import/resolve-uri(@href,document-uri(/))"/>
      <sch:let name="invoked-resource" value="if (doc-available($nominal-resource)) then document($nominal-resource) else ()"/>
      <!-- resolved against its own rules, not filtered by this import -->
      <sch:let name="resolved-resource" value="oscal:resolve($invoked-resource)"/>
      <sch:let name="resource-type"  value="$invoked-resource/*/local-name(.)"/>
      <sch:let name="resource-title" value="$invoked-resource/*/title"/>
      
      <!--<sch:let name="catalog" value="document($catalog-file)/oscal:catalog"/>-->
      
      <sch:assert test="empty(@control-id) or empty($invoked-resource) or (oscal:resolved-controls($invoked-resource)/@id=@control-id)">No control with @id '<sch:value-of select="@control-id"/>' is found in referenced <sch:value-of select="$resource-type || ' ' || $resource-title"/> at '<sch:value-of select="$nominal-resource"/>'</sch:assert>
      <sch:assert test="empty(@subcontrol-id) or empty($invoked-resource) or (oscal:resolved-subcontrols($invoked-resource)/@id=@subcontrol-id)">no subcontrol with @id '<sch:value-of select="@subcontrol-id"/>' is found in referenced <sch:value-of select="$resource-type || ' ' || $resource-title"/> at '<sch:value-of select="$nominal-resource"/>'</sch:assert>
      
      <!--<sch:assert test="empty(@control-id) or not(parent::oscal:exclude) or exists(../../oscal:include/oscal:all)">
        Control is excluded but it hasn't been included
      </sch:assert>-->
    </sch:rule>
    
    <!--<sch:rule context="oscal:param/oscal:desc">
      <sch:let name="catalog-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="catalog" value="document($catalog-file)"/>
      <sch:let name="matching-param" value="key('element-by-id',../@id,$catalog)/self::oscal:param"/>
      <sch:assert test="empty($matching-param) or normalize-space(.) = normalize-space($matching-param/oscal:desc)" role="warning">
        Referenced parameter '<sch:value-of select="../@id"/>' has a different description: "<sch:value-of select="$matching-param/oscal:desc"/>"</sch:assert>
        
    </sch:rule>-->
  </sch:pattern>
  
</sch:schema>