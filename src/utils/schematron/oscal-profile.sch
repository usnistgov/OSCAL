<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">

  
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  <xsl:key name="call-by-id"       match="oscal:import//oscal:call | oscal:set" use="@control-id | @subcontrol-id | @param-id"/>
  <xsl:key name="alteration-by-id" match="oscal:alter"                  use="@control-id | @subcontrol-id"/>
  
  <sch:pattern>
    <sch:rule context="oscal:import//oscal:call[@control-id]">
      <sch:assert test="count(key('call-by-id',@control-id,..)) = 1">Control (<sch:value-of select="@control-id"/>) should not be <sch:value-of select="local-name(..)"/>d more than once.</sch:assert>
      <sch:assert test="empty(key('call-by-id',@control-id) except key('call-by-id',@control-id,..) )">Control (<sch:value-of select="@control-id"/>) should not be both included and excluded, or invoked more than once.</sch:assert>
    </sch:rule>
    <sch:rule context="oscal:set" >
      <sch:assert test="count(key('call-by-id',@param-id)) = 1">Parameter (<sch:value-of select="@param-id"/>) may not be set more than once.</sch:assert>
    </sch:rule>
    <sch:rule context="oscal:alter" >
      <sch:assert test="count(key('alteration-by-id',(@control-id|@subcontrol-id))) = 1">Alteration may not be declared more than once for a control or subcontrol (<sch:value-of select="@control-id|@subcontrol-id"/>).</sch:assert>
    </sch:rule>
</sch:pattern>
  
    
</sch:schema>