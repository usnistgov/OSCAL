<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  
   
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations"
    value="/oscal:catalog/ ( oscal:declarations[empty(@href)], oscal:declarations/document(@href,/)/oscal:declarations )[1]"/>
  
  <sch:pattern>
    <sch:rule context="*">
      <sch:report test="normalize-space(@type)=('control','group','stmt','prop')">
        @type value '<sch:value-of select="@type"/>' is not allowed (reserved name)
      </sch:report>
      <sch:report test="normalize-space(@role)=('control','group','stmt','prop')">
        @role value '<sch:value-of select="@role"/>' not allowed (reserved name)
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    
    <!--<sch:rule context="oscal:assign | oscal:select"/>-->
    
    <sch:rule context="oscal:title"/>
    
    <sch:rule context="oscal:control | oscal:group"/>
      
    <!-- Next rule doesn't match controls or groups since the last rule pre-empts it. -->
    <sch:rule context="oscal:control/* | oscal:group/*">
      <sch:let name="me" value="."/>
      <xsl:variable name="name" select="(@role,local-name(.))[1]"/>
      <sch:let name="same-role" value="../(* except $me)[(@role,local-name(.))[1]=$name]"/>
      <sch:assert test="empty($same-role)">
        role '<sch:value-of select="@role"/>' appears more than once inside this <sch:value-of select="name(..)"/>.</sch:assert>
    </sch:rule>
    
    
  </sch:pattern>


  
  
</sch:schema>