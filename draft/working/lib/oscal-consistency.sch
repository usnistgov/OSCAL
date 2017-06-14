<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <sch:rule context="oscal:prop | oscal:stmt | oscal:param | oscal:assign | oscal:select">
      <sch:let name="here" value="."/>
      <sch:report test="@name = (../* except $here)/@name">
        More than one '<sch:value-of select="@name"/>' (<!--<sch:value-of select="string-join(distinct-values(../*[@name=$here/@name]/name(.)),', ')"/>-->) appears in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations" value="/oscal:catalog/oscal:declarations/(.[exists(*)],document(@href))[1]"/>
  
  <sch:pattern>
<!--  Constraints over declarations - very important!  -->
    <sch:rule context="oscal:control-spec//oscal:property | oscal:control-spec//oscal:statement | oscal:declarations//oscal:parameter">
      <sch:let name="name" value="@name"/><!-- sorry bout that :-> -->
      <sch:let name="named-alike" value="
        (ancestor-or-self::oscal:control-spec)/(*/oscal:property | */oscal:statement | */oscal:parameter)[@name=$name]"/>
      <sch:assert test="empty($named-alike except .)"><sch:name/>/@name '<sch:value-of select="$name"/>' is not unique within this control</sch:assert>
    </sch:rule>
  </sch:pattern>

  <sch:pattern>
    <sch:rule context="oscal:p//* | oscal:list//*"/>
    
    <sch:rule context="oscal:control">
      <sch:let name="here"          value="."/>
      <sch:let name="catalog-entry" value="$declarations/key('control-spec',oscal:signature($here),.)"/>
      <sch:assert test="exists($catalog-entry) or empty($declarations)">
        <sch:name/> not recognized; signature '<sch:value-of select="oscal:signature(.)"/>'
      </sch:assert>
      <sch:let name="requirements" value="$catalog-entry/oscal:required/*"/>
      <sch:let name="missing"      value="$requirements[not(@name=$here/*/@name)]"/>
      <sch:assert test="empty($catalog-entry) or empty($missing)">
        <sch:value-of select="@type"/> control is missing <sch:value-of select="string-join($missing/@name,', ')"/>
      </sch:assert>
    </sch:rule>
    
    <!-- Not yet validating properties against declarations in/for groups. -->
    <sch:rule context="oscal:control/oscal:prop | oscal:control/oscal:stmt">
      <sch:let name="here"          value="."/>
      <sch:let name="catalog-entry" value="$declarations/key('control-spec',oscal:signature($here),.)"/>
      <sch:let name="controlled"    value="$declarations/key('control-spec',oscal:signature($here/parent::oscal:control[1]),.)"/>
      <!-- If the control lookup fails, the test is silenced -->
      <sch:assert test="exists($catalog-entry) or empty($controlled)">
        <sch:name/> can't be named '<sch:value-of select="@name"/>' (no such <sch:name/> known in control of type '<sch:value-of select="ancestor::oscal:control[1]/@type"/>'
      </sch:assert>
      
      <sch:let name="is-enumerated" value="exists($catalog-entry/oscal:value)"/>
      <sch:assert test="empty($catalog-entry) or not($is-enumerated) or (. = $catalog-entry/oscal:value)">
        '<sch:value-of select="."/>' is not permitted as a value for (<sch:name/>) <sch:value-of select="@name"/>: try
        <sch:value-of select="string-join($catalog-entry/oscal:value,', ')"/>
      </sch:assert>
      
      <sch:let name="regex-requirement" value="$catalog-entry/oscal:regex"/>
      <sch:assert test="empty($catalog-entry) or empty($regex-requirement) or matches(.,$regex-requirement)">
        '<sch:value-of select="."/>' is not permitted as a value for property <sch:value-of select="@name"/>: expected to match 
        regular expression '<sch:value-of select="$regex-requirement"/>'</sch:assert>
      
      <sch:let name="id-requirement" value="$catalog-entry/oscal:identifier"/>
      <sch:assert test="empty($catalog-entry) or empty($id-requirement) or empty(key('prop-by-value',normalize-space(.)) except .)">
        (prop) <sch:value-of select="@name"/> '<sch:value-of select="."/>' appears more than once within the document.</sch:assert>
      
      <!--<sch:report test="exists($catalog-entry) and not(. = $catalog-entry/oscal:VALUE)">
        <sch:value-of select="."/> isn't recognized for prp[@name='<sch:value-of select="$here/@name"/>']
      </sch:report>-->
    </sch:rule>

  </sch:pattern>
  
  <xsl:key name="prop-by-value" match="oscal:prop" use="normalize-space(.)"/>

  <xsl:key name="control-spec"
    match="oscal:declarations/oscal:control-spec | oscal:declarations//oscal:property | oscal:declarations//oscal:statement"
    use="oscal:signature(.)"/>
  
  <!-- For a property or statement in a control ( prop | stmt) ,
    or a control property or statement declaration, the control label concatenates their name with the given control type.
    Things go awry of course when names or organizations are out of order. -->
  <xsl:function name="oscal:signature" as="xs:string?">
    <xsl:param name="who" as="element()"/>
    <xsl:sequence select="string-join(($who/
      (ancestor-or-self::oscal:control-spec | ancestor-or-self::oscal:control[1])/@type,$who/@name),'-')"/>
  </xsl:function>
  

</sch:schema>