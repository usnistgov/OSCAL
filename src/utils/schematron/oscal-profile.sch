<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">

<!-- Rough check OSCAL Profile link checker Schematron
  
  Assuming an OSCAL profile that imports catalogs, this Schematron performs a sanity check
  on the major links (for inclusion, exclusion, parameter settings).
  
  TODO:
  - more granularity in alter (targets add/remove)
  - extend to cover referenced profiles (resolving them)
  -->

  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  <xsl:key name="control-call-by-id"       match="oscal:import//oscal:with-id" use="string(.)"/>
  <xsl:key name="setting-by-id"       match="oscal:set-parameter" use="@param-id"/>
  <xsl:key name="alteration-by-id" match="oscal:alter"         use="@control-id"/>

  <xsl:key name="resource-fetch" match="oscal:resource" use="'#' || @uuid"/>
  
  <xsl:function name="oscal:get-import" as="document-node()?">
    <xsl:param name="import" as="element(oscal:import)"/>
    <xsl:variable name="source" select="($import/key('resource-fetch',@href)/oscal:rlink/@href,$import/@href[. castable as xs:anyURI])[1]"/>
    <xsl:sequence select="document($source, $import)"/>
  </xsl:function>
  
  <sch:pattern>
    <sch:rule context="oscal:import">
      <sch:let name="importing" value="oscal:get-import(.)"/>
      
      <sch:assert test="exists($importing)">Nothing found at <sch:value-of select="@href"/>...</sch:assert>
      <sch:assert role="warning" test="exists($importing/oscal:catalog)">Not importing a catalog.</sch:assert>
    </sch:rule>
  
    <sch:rule context="oscal:import/*/oscal:with-id">
      <sch:let name="importing" value="oscal:get-import(../parent::oscal:import)"/>
      <sch:let name="not-a-catalog" value="empty($importing/oscal:catalog)"/>
      
      <sch:assert test="$not-a-catalog or (string(.) = $importing//oscal:control/@id)">No control found with @id='<sch:value-of select="string(.)"/>'</sch:assert>
      
      <sch:assert test="count(key('control-call-by-id', string())) = 1">Control (<sch:value-of select="string(.)"/>) should not be referenced (either imported or excluded) more than once.</sch:assert>
      <!--<sch:assert test="empty(key('call-by-id', string(), ..) except key('call-by-id', string(), ..) )">Control (<sch:value-of select="."/>) should not be both included and excluded, or invoked more than once.</sch:assert>-->
    </sch:rule>
    
    <sch:rule context="oscal:set-parameter" >
      <sch:let name="param-ref" value="string(@param-id)"/>
      <sch:let name="importing" value="ancestor::oscal:profile/child::oscal:import/oscal:get-import(.)"/>
      <sch:assert test="count(key('setting-by-id', $param-ref)) = 1">Parameter (<sch:value-of select="@param-id"/>) may not be set more than once.</sch:assert>
      <sch:assert test="$importing//oscal:param/@id = $param-ref">) No parameter '<sch:value-of select="$param-ref"/>' is found among imported catalogs.</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:alter" >
      <sch:let name="alter-ref" value="string(@control-id)"/>
      <sch:let name="importing" value="ancestor::oscal:profile/child::oscal:import/oscal:get-import(.)"/>
      <sch:assert test="count(key('alteration-by-id', @control-id)) = 1">Alteration should not be declared more than once (<sch:value-of select="@control-id"/>).</sch:assert>
      <!--<sch:report test="true()">boo</sch:report>-->
      <sch:assert test="($importing//oscal:control/@id = $alter-ref)">) No control '<sch:value-of select="$alter-ref"/>' is found among imported catalogs.</sch:assert>
    </sch:rule>
</sch:pattern>


</sch:schema>
