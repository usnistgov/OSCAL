<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
  
<!-- For validating oscal-oscal.xml against the schema (XSD) it purportedly describes.
  
  * Are all elements in the schema matched by components (via their prop[@class='tag']?
  * Are all component[@class='element-description'] matched by elements declared in the schema?
  
  tbd: the same, for attributes.
  
  -->
  
  <!-- Tweak to validate against either interim or final XSD
    lib/XSD/oscal-interim.xsd
    lib/XSD/oscal-documented.xsd
    -->
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>
  
  <sch:let name="schema-files" value="'../../schema/xml/XSD/oscal-core-interim.xsd', '../../schema/xml/XSD/oscal-profile-interim.xsd'"/>
  <sch:let name="schemas" value="document($schema-files)"/>
  
  <sch:let name="element-declarations"  value="$schemas//xsd:element[exists(@name)]"/>
  <sch:let name="element-documentation" value="//oscal:component[@class='element-description']"/>
  
  <sch:pattern>
    <sch:rule context="/*">
      <!--<sch:report test="true()"><sch:value-of select="count($element-declarations)"/></sch:report>-->
      <sch:let name="undocumented-declarations" value="$element-declarations[not(@name=$element-documentation/oscal:prop[@class='tag'])]"/>
      <sch:assert test="empty($undocumented-declarations)">
        Schemas <sch:value-of select="$schema-files"/> declare/s 
        <sch:value-of select="if (count($undocumented-declarations) eq 1) then 'this element, which is' else 'these elements, which are' "/>
        undocumented: <sch:value-of select="string-join($undocumented-declarations/@name, ', ')"/>
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:component[@class='element-description']">
      <sch:let name="gi" value="oscal:prop[@class='tag']"/>
      <sch:assert test="exists($element-declarations[@name=$gi])">This element description corresponds to no declaration in <xsl:value-of separator=", " select="$schema-files"/></sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:part[@class='description']">
      <sch:let name="exception" value="not(../@class='element-description')"/>
      <sch:assert role="warning" test="matches(string(.),'\S')">No description</sch:assert>
      <sch:assert test="empty(* except oscal:p[1]) or $exception">Description may contain only a single paragraph, with a sentence fragment (no periods)</sch:assert>
      <sch:report test="matches(normalize-space(.),'\.$') and not($exception)">Description ends in a period</sch:report>
      <sch:report test="matches(normalize-space(.),'\.\s*[A-Z]') and not($exception)">Description may be more than a descriptive sentence fragment</sch:report>
      
    </sch:rule>
    
    <sch:rule context="oscal:prop[@class='full_name']">
      <sch:report test="contains(string(.),'--')">Improper element name</sch:report>
    </sch:rule>
    
    <sch:rule context="oscal:prop | oscal:stmt">
      <sch:assert role="warning" test="matches(string(.),'\S')"><sch:name/> is empty</sch:assert>
    </sch:rule>
    
  </sch:pattern>
  
</sch:schema>