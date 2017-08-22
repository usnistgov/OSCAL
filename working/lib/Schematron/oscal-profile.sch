<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <xsl:key name="element-by-id" match="*[exists(@id)]" use="@id"/>

  <sch:pattern>
    <sch:rule context="oscal:invoke">
      <sch:assert test="exists(document(@href))">Catalog '<sch:value-of select="@href"/>' not found</sch:assert>
    </sch:rule>
    <sch:rule context="oscal:call">
      <sch:let name="catalog-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="catalog" value="document($catalog-file)"/>
      <sch:assert test="empty($catalog) or empty(@control-id) or exists(key('element-by-id',@control-id,$catalog)/self::oscal:control)">Referenced catalog '<sch:value-of select="$catalog-file"/>'
        has no control with @id '<sch:value-of select="@control-id"/>'</sch:assert>
      <sch:assert test="empty($catalog) or empty(@subcontrol-id) or exists(key('element-by-id',@subcontrol-id,$catalog)/self::oscal:subcontrol)">Referenced catalog '<sch:value-of select="$catalog-file"/>'
        has no subcontrol with @id '<sch:value-of select="@control-id"/>'</sch:assert>
    </sch:rule>
    <sch:rule context="oscal:param">
      <sch:let name="catalog-file" value="ancestor::oscal:invoke/@href"/>
      <sch:let name="catalog" value="document($catalog-file)"/>
      <sch:assert test="matches(@id,'\S')">Parameter has no valid @id</sch:assert>
      <sch:assert test="empty($catalog) or not(matches(@id,'\S')) or exists(key('element-by-id',@id,$catalog)/self::oscal:param)">Referenced catalog '<sch:value-of select="$catalog-file"/>'
        has no parameter with @id '<sch:value-of select="@id"/>'</sch:assert>
    </sch:rule>
  </sch:pattern>
  
</sch:schema>