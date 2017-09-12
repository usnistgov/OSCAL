<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>
  

  <sch:pattern>
    <sch:rule context="oscal:link | oscal:a">
      <sch:let name="href" value="@href[matches(.,'\S')]"/>
      <sch:let name="is-anchor" value="exists(self::oscal:a)"/>
      <sch:assert role="warning" test="exists($href)"><sch:value-of select="local-name() || 'nchor'[$is-anchor]"/> missing @href</sch:assert>
      <sch:assert test="empty($href) or ($href castable as xs:anyURI)">An @href must be a URI</sch:assert>
      <sch:assert test="empty($href[starts-with(.,'#')]) or exists(key('internal-links',$href))">Internal link is broken.</sch:assert>
    </sch:rule>
    
  </sch:pattern>

  <xsl:key name="internal-links" match="*[exists(@id)]" use="concat('#',@id)"/>
  
  
</sch:schema>