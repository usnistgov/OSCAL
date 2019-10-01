<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:json="http://www.w3.org/2005/xpath-functions"
  queryBinding="xslt2">
  
  <sch:ns prefix="json" uri="http://www.w3.org/2005/xpath-functions"/>

  <xsl:key name="roles" match="json:map[@key='metadata']/json:map[@key='roles']|json:map[@key='metadata']/json:array[@key='roles']/json:map" use="json:string[@key='id']"/>
  <xsl:key name="system-roles" match="json:map[@key='system-roles']" use="json:map/@key"/>
  <xsl:key name="parties" match="json:map[@key='metadata']/json:map[@key='parties' and json:string[@key='id']] | json:map[@key='metadata']/json:array[@key='parties']/json:map[json:string[@key='id']]" use="json:string[@key='id']"/>

  <sch:pattern>
    <sch:rule context="json:string[@key='role-id']">
      <sch:assert test="exists(key('roles',.))">Referenced role-id not defined in this document: <sch:value-of select="."/>. Must be one of: <sch:value-of select="ancestor::json:map[@key='system-security-plan']/json:map[@key='metadata']/(json:map[@key='roles']|json:array[@key='roles']/json:map)/json:string[@key='id'e]"/></sch:assert>
    </sch:rule>
    <sch:rule context="json:map[@key='metadata']/json:map[@key='parties'] | json:map[@key='metadata']/json:array[@key='parties']/json:map">
      <sch:assert test="not(json:string[@key='id']) or
        self::json:map[@key='parties'] or (count(preceding-sibling::json:map/json:string[@key='id' and text() = json:string[@key='id']]) = 0 and count(following-sibling::json:map/json:string[@key='id' and text() = json:string[@key='id']]) = 0)">Duplicate party identifier:  <sch:value-of select="json:string[@key='id']"/></sch:assert>
    </sch:rule>

    <sch:rule context="json:map[@key='system-roles']">
      <sch:assert test="count(json:map) = count(distinct-values(json:map/@key))">Duplicate system roles:  <sch:value-of select="string-join(distinct-values(json:map[@key = following-sibling::json:map/@key or @key = preceding-sibling::json:map/@key]/@key),', ')"/></sch:assert>
    </sch:rule>

    <sch:rule context="json:map[@key='responsible-parties']/json:string[@key='party-ids'] | json:map[@key='responsible-parties']/json:array[@key='party-ids']/json:string | json:array[@key='responsible-parties']/json:map/json:string[@key='party-ids'] | json:array[@key='responsible-parties']/json:map/json:array[@key='party-ids']/json:string">
      <sch:assert test="exists(key('parties',.))">Referenced party-id not defined in metadata: <sch:value-of select="."/>. Must be one of: <sch:value-of select="ancestor::json:map[@key='system-security-plan']/json:map[@key='metadata']/(json:map[@key='parties']|json:array[@key='parties']/json:map)"/></sch:assert>
    </sch:rule>

    <sch:rule context="json:map[@key='responsible-parties'] | json:array[@key='responsible-parties']/json:map">
      <sch:assert test="exists(key('parties',json:string[@key='system-role-id']))">Referenced system-role-id not defined in this document: <sch:value-of select="json:string[@key='system-role-id']"/>. Must be one of: <sch:value-of select="ancestor::json:map[@key='system-implementation']/json:map[@key='system-roles']/json:map/@key"/></sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>