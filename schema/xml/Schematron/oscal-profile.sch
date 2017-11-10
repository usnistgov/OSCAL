<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">

  
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  

  <xsl:include href="../../../working/lib/XSLT/profile-resolver.xsl"/>
  <!-- included xslt has <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/> -->
<!--
    
    include/control-id 
    include/subcontrol-id
    exclude/control-id
    exclude/subcontrol-id
    param
    alter
  
  -->
  <sch:pattern>
    <sch:rule context="oscal:invoke">
      <sch:assert test="not(resolve-uri(@href,document-uri(/)) = preceding-sibling::oscal:invoke/resolve-uri(@href,document-uri(/)) )">
        More than one invocation on authority <sch:value-of select="resolve-uri(@href,document-uri(/))"/> is NOT GOING TO WORK OUT WELL.
      </sch:assert>
      
      
      <sch:let name="authority-file" value="@href"/>
      <sch:let name="authority"      value="document($authority-file,/)"/>
      <sch:let name="authority-type" value="$authority/local-name(*)"/>
      <sch:let name="authority-title" value="$authority/*/title"/>
      <!-- We expect a catalog, framework or resolved profile. -->
      <sch:let name="resolved-invocation" value="oscal:resolve($authority)"/>
      <sch:let name="controls" value="oscal:resolved-controls($authority)"/>
      <sch:let name="subcontrols" value="oscal:resolved-controls($authority)"/>
      
      <sch:let name="me" value="self::oscal:invoke"/>
      <sch:let name="other-controls" value="../(oscal:invoke except $me)/oscal:resolved-controls(
        document(@href,.) )"/>
      <sch:let name="other-subcontrols" value="../(oscal:invoke except $me)/oscal:resolved-subcontrols(
        document(@href,.) )"/>
      
      <!--<sch:report test="true()">We have <xsl:value-of select="$controls/@id" separator=", "/></sch:report>-->
      <sch:let name="contested" value="$controls[@id = $other-controls/@id] | $subcontrols[@id = $other-subcontrols/@id]"/>
      <sch:assert test="empty($contested)">CONTESTED <xsl:value-of select="(if (count($contested) eq 1) then 'CONTROL ' else 'CONTROLS ') ||
        string-join($contested/@id,', ') || (if (count($contested) eq 1) then 'appears ' else 'appear ')"/> appear in more than one invoked resource.</sch:assert>
      
    </sch:rule>
    
    <sch:rule context="oscal:include/oscal:call">
      <sch:assert test="not(@control-id = preceding-sibling::*/@control-id)">Control (<sch:value-of select="@control-id"/>) cannot be included more than once.</sch:assert>
      <sch:assert test="not(@subcontrol-id = preceding-sibling::*/@subcontrol-id)">Subcontrol (<sch:value-of select="@control-id"/>) cannot be included more than once.</sch:assert>
      <sch:assert test="not(@subcontrol-id = (../../*/*/@control-id))">A subcontrol will not have the same identifier (<sch:value-of select="@subcontrol-id"/>) as a control from the same catalog or profile.</sch:assert>      
      <sch:assert test="empty(@control-id) or not(@control-id = ../../oscal:exclude/oscal:call/@control-id)">Control is both included and excluded.</sch:assert>      
      <sch:assert test="empty(@subcontrol-id) or not(@subcontrol-id = ../../oscal:exclude/oscal:call/@subcontrol-id)">Subcontrol is both included and excluded.</sch:assert>      
      
    </sch:rule>
    <sch:rule context="oscal:exclude/oscal:call">
      <sch:assert test="not(@control-id = preceding-sibling::*/@control-id)">Control (<sch:value-of select="@control-id"/>) cannot be excluded more than once.</sch:assert>
      <sch:assert test="not(@subcontrol-id = preceding-sibling::*/@subcontrol-id)">Subcontrol (<sch:value-of select="@control-id"/>) cannot be excluded more than once.</sch:assert>
      <sch:assert test="not(@subcontrol-id = (../../*/*/@control-id))">A subcontrol will not have the same identifier (<sch:value-of select="@subcontrol-id"/>) as a control from the same catalog or profile.</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:invoke/oscal:set-param">
      <sch:assert test="not(@id = preceding-sibling::oscal:set-param/@param-id)">Parameter <sch:value-of select="@id"/> is declared more than once.</sch:assert>
    </sch:rule>
    <sch:rule context="oscal:invoke/oscal:alter">
      <sch:assert test="not(@id = preceding-sibling::oscal:alter/@id)">Alteration <sch:value-of select="@id"/> is declared more than once.</sch:assert>
    </sch:rule>
    
    
</sch:pattern>
  
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
    
    <sch:rule context="oscal:call | oscal:set-param | oscal:alter">
      <sch:let name="authority-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="authority"      value="document($authority-file)"/>
      <sch:let name="authority-type" value="$authority/local-name(*)"/>
      <sch:let name="authority-title" value="$authority/*/title"/>
      <!-- We expect a catalog, framework or resolved profile. -->
      <sch:let name="resolved-invocation" value="oscal:resolve($authority)"/>
      
      <!--<sch:let name="catalog" value="document($catalog-file)/oscal:catalog"/>-->
      <sch:assert test="empty(@control-id) or exists(key('element-by-id',@control-id,$resolved-invocation)/(self::oscal:control|self::oscal:component[contains-token(.,'control')]) )">Referenced <sch:value-of select="$authority-type || ' ' || $authority-title"/> at '<sch:value-of select="$authority-file"/>'
        has no control with @id '<sch:value-of select="@control-id"/>'</sch:assert>
      <sch:assert test="empty(@subcontrol-id) or exists(key('element-by-id',@subcontrol-id,$resolved-invocation)/(self::oscal:subcontrol|self::oscal:component[contains-token(.,'subcontrol')]))">Referenced <sch:value-of select="$authority-type || ' ' || $authority-title"/> at '<sch:value-of select="$authority-file"/>'
        has no subcontrol with @id '<sch:value-of select="@control-id"/>'</sch:assert>
      <sch:assert test="empty(@param-id) or exists(key('element-by-id',@param-id,$resolved-invocation)/self::oscal:param)">Referenced <sch:value-of select="$authority-type || ' ' || $authority-title"/> at '<sch:value-of select="$authority-file"/>'
        has no parameter with @id '<sch:value-of select="@param-id"/>'</sch:assert>
      <sch:report role="warning" test="(@control-id | @subcontrol-id | @param-id) = preceding-sibling::oscal:call/(@control-id | @subcontrol-id | @param-id)">Repeated call on
      '<sch:value-of select="@control-id | @subcontrol-id | @param-id"/>' will be ignored</sch:report>
      
      <!--<sch:assert test="empty(@control-id) or not(parent::oscal:exclude) or exists(../../oscal:include/oscal:all)">
        Control is excluded but it hasn't been included
      </sch:assert>-->
    </sch:rule>
    
    <sch:rule context="oscal:set-param">
      <sch:let name="catalog-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="catalog" value="document($catalog-file)"/>
      <sch:assert test="matches(@id,'\S')">Parameter has no valid @id</sch:assert>
      
      <sch:let name="matching-param" value="key('element-by-id',@id,$catalog)/self::oscal:param"/>
      <sch:assert test="empty($catalog) or not(matches(@id,'\S')) or exists($matching-param)">Referenced catalog '<sch:value-of select="$catalog-file"/>'
        has no parameter with @id '<sch:value-of select="@id"/>'</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:param/oscal:desc">
      <sch:let name="catalog-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="catalog" value="document($catalog-file)"/>
      <sch:let name="matching-param" value="key('element-by-id',../@id,$catalog)/self::oscal:param"/>
      <sch:assert test="empty($matching-param) or normalize-space(.) = normalize-space($matching-param/oscal:desc)" role="warning">
        Referenced parameter '<sch:value-of select="../@id"/>' has a different description: "<sch:value-of select="$matching-param/oscal:desc"/>"</sch:assert>
        
    </sch:rule>
  </sch:pattern>
  
</sch:schema>