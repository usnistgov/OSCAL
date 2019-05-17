<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  <xsl:include href="oscal-functions.xsl"/>
  
  <xsl:key name="elements-by-class" match="*[matches(@class,'\S')][empty(ancestor::oscal:declarations)]" use="oscal:classes(.)"/>
  
  <!-- May (should) be redundant given schema constraints -->
  <sch:pattern>
    <sch:rule context="oscal:control">
      <sch:assert test="empty(ancestor::oscal:control)">Controls may not appear inside controls</sch:assert>
      <sch:assert test="empty(ancestor::oscal:part)">Controls may not appear inside parts</sch:assert>
    </sch:rule>    
    <sch:rule context="oscal:subcontrol">
      <sch:assert test="exists(ancestor::oscal:control)">Subcontrols may not appear outside controls</sch:assert>
      <sch:assert test="empty(ancestor::oscal:part)">Subcontrols may not appear inside parts</sch:assert>
    </sch:rule>    
  </sch:pattern>
  
  <sch:pattern>
<!-- Since we support retrieving elements by flags either classes or
      (fallback) element names, we avoid ambiguities by forbidding the
      use of the element names as classes. -->
    <sch:rule context="oscal:declarations//*"/>
    <sch:rule context="*[matches(@class,'\S')]">
      <sch:let name="interdicted" value="oscal:classes(.)[.=('control','group','part','prop','param','title')]"/>
      <sch:let name="plural" value="count($interdicted) ne 1"/>
      <sch:assert test="empty($interdicted)">
        @class <sch:value-of select="if ($plural) then 'values ' else 'value '"/>
        <sch:value-of select="oscal:sequence($interdicted)"/> 
        <sch:value-of select="if ($plural) then 'are' else 'is'"/> not allowed.
      </sch:assert>
      
      <!--<!-\- Error if the same class is given to two different element types -\->
      <sch:let name="me" value="."/>
      <xsl:variable name="rivals" select="key('elements-by-class',oscal:classes($me))
        [not(local-name(.) = local-name($me))]"/>
       <sch:assert test="empty($rivals)"><sch:value-of select="name(.)"/>
       is assigned the same classes as element(s)
       <xsl:value-of select="oscal:sequence(distinct-values($rivals/local-name(.)))"/> in the same document.</sch:assert>-->
      
      <!--
       Warning against assigning same values to @class and @id or do we care?        
        <sch:let name="seen-classes" value="oscal:classes(.)[.=$ids]"/>
      <sch:let name="plural" value="count($seen-classes) ne 1"/>
      <sch:assert role="warning" test="empty($seen-classes)">
        <sch:value-of select="if ($plural) then 'class values ' else 'class value '"/>
        <sch:value-of select="oscal:sequence($seen-classes)"/>
        <sch:value-of select="if ($plural) then ' replicate id values' else 'replicates an id value'"/>
        elsewhere in the document.</sch:assert>-->
    </sch:rule>
  </sch:pattern>
  
  
  
</sch:schema>