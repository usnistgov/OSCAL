<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">
  
<!-- Quick little Schematron for checking link integrity from
     profile //call/@control-id *only*
     and *only* when catalogs, not profiles, are sourced.
  
  A more complete error check will resolve profile sources as well as query catalogs.
  
  -->
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  <xsl:key name="resource-fetch" match="oscal:resource" use="'#' || @id"/>
  
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
    <sch:rule context="oscal:import/*/oscal:call">
      <sch:let name="importing" value="oscal:get-import(../parent::oscal:import)"/>
      <sch:let name="not-a-catalog" value="empty($importing/oscal:catalog)"/>
      
      <sch:assert test="$not-a-catalog or (@control-id = $importing//oscal:control/@id)">No control found with @id='<sch:value-of select="@control-id"/>'</sch:assert>
    </sch:rule>
  </sch:pattern>
  
    
</sch:schema>