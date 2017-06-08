<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <sch:rule context="oscal:prop">
      <sch:report test="@name = (../oscal:prop except .)/@name">
        Property name <sch:value-of select="@name"/> duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:stmt">
      <sch:report test="@name = (../(oscal:stmt | oscal:group/oscal:stmt) except .)/@name">
        NB '<sch:value-of select="@name"/>' duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations" value="/oscal:catalog/oscal:declarations/(.[exists(*)],document(@href))[1]"/>
  
  <sch:pattern>
<!--  Contraints over declarations - very important!  -->
    <sch:rule context="oscal:control-spec//oscal:property | oscal:control-spec//oscal:statement">
      <sch:let name="name" value="@name"/><!-- sorry bout that :-> -->
      <sch:let name="named-alike" value="ancestor::oscal:control-spec//(oscal:property | oscal:statement)[@name=$name]"/>
      <sch:assert test="empty($named-alike except .)"><sch:name/>/@name '<sch:value-of select="$name"/>' is not unique within this control</sch:assert>
    </sch:rule>
    
  </sch:pattern>
  
  <sch:pattern>
    <sch:rule context="oscal:p//* | oscal:list//*"/>
    
    
    <sch:rule context="oscal:control">
      <sch:let name="here"          value="."/>
      <sch:let name="catalog-entry" value="key('control-spec',oscal:signature(.),$declarations)"/>
      <sch:assert test="exists($catalog-entry)">
        <sch:name/> not recognized; signature '<sch:value-of select="oscal:signature(.)"/>'
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:prop | oscal:stmt">
      <sch:let name="here"          value="."/>
      <sch:let name="catalog-entry" value="key('control-spec',oscal:signature(.),$declarations)"/>
      <sch:let name="controlled"    value="parent::control[1]/key('control-spec',oscal:signature(.),$declarations)"/>
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
      
      <!--<sch:report test="exists($catalog-entry) and not(. = $catalog-entry/oscal:VALUE)">
        <sch:value-of select="."/> isn't recognized for prp[@name='<sch:value-of select="$here/@name"/>']
      </sch:report>-->
    </sch:rule>

  </sch:pattern>
  
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
  
<!-- Our validation function, 'okay()', returns true for any property whose value conforms to specifications given in the document declarations
     for properties of its name within its control type.
     -->
  
    
    
    
    <!--<xsl:function name="oscal:okay" as="xs:boolean">
      <xsl:param name="who" as="element()"/>
    <!-\- writing a little XPath -\->
    <xsl:value-of>
    <xsl:for-each select="$who/ancestor-or-self::*[ancestor::oscal:catalog]">
      <xsl:if test="position() gt 1">/</xsl:if>
      <xsl:value-of select="name(.)"/>
      <xsl:for-each select="@name">[@name='<xsl:value-of select="."/>']</xsl:for-each>
    </xsl:for-each>
    </xsl:value-of>
  </xsl:function>-->
</sch:schema>