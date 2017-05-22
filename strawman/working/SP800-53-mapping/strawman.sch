<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <sch:rule context="oscal:group/oscal:prp">
      <sch:report test="@name != ../oscal:prp/@name">
        Group member name variance: <sch:value-of select="@name"/> could be <sch:value-of select="distinct-values(../oscal:prp/@name)"/>
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:prp">
      <sch:report test="@name = (../oscal:prp except .)/@name">
        Property name <sch:value-of select="@name"/> duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:group/oscal:nb">
      <sch:report test="@flag != (../oscal:nb)/@flag">
        Group member name variance: <sch:value-of select="@flag"/> could be <sch:value-of select="distinct-values(../oscal:nb/@flag)"/>
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:nb">
      <sch:report test="@flag = (../(oscal:nb | oscal:group/oscal:nb) except .)/@flag">
        NB '<sch:value-of select="@flag"/>' duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:let name="catalog" value="document('800-53-controls-map.xml')/oscal:control-set"/>
  
  <sch:pattern>
    <sch:rule context="/oscal:control-set/oscal:control">
      <sch:let name="here"           value="."/>
      <sch:let name="property-names" value="$catalog/oscal:control/oscal:prp/@name"/>
      <sch:let name="missing-props"  value="$property-names[not(.=$here/oscal:prp/@name)]"/>
      
      <sch:assert test="empty($missing-props)">
        Can't find property/ies (child::prp) with @name <sch:value-of select="string-join($missing-props,', ')"/>
      </sch:assert>
    </sch:rule>

    <sch:rule context="/oscal:control-set/oscal:control/oscal:prp">
      <sch:let name="here"           value="."/>
      <sch:let name="catalog-entry" value="$catalog/oscal:control/oscal:prp[@name=$here/@name]"/>
      <sch:assert test=". = $catalog-entry/oscal:VALUE">
        <sch:value-of select="."/> isn't recognized for prp[@name='<sch:value-of select="$here/@name"/>']
      </sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>