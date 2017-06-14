<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  
  
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