<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  

  <xsl:include href="oscal-functions.xsl"/>
  
  <xsl:variable name="ids" select="//@id/lower-case(normalize-space(.))"/>
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations"
    value="/oscal:catalog/ ( oscal:declarations[empty(@href)], oscal:declarations/document(@href,/)/oscal:declarations )[1]"/>
  
  <sch:pattern>
<!-- Since we support retrieving elements by flags either classes or
      (fallback) element names, we avoid ambiguities by forbidding the
      use of the element names as classes. -->
    <sch:rule context="oscal:declarations//*"/>
    <sch:rule context="*[matches(@class,'\S')]">
      <sch:let name="interdicted" value="oscal:classes(.)[.=('control','group','stmt','prop','param','feat','title')]"/>
      <sch:let name="plural" value="count($interdicted) ne 1"/>
      <sch:assert test="empty($interdicted)">
        @class <sch:value-of select="if ($plural) then 'values ' else 'value '"/>
        <sch:value-of select="oscal:sequence($interdicted)"/> 
        <sch:value-of select="if ($plural) then 'are' else 'is'"/> not allowed.
      </sch:assert>
      
      <!-- Error if the same class is given to two different element types -->
      <sch:let name="me" value="."/>
      <xsl:variable name="rivals" select="key('elements-by-class',oscal:classes($me))
        [not(local-name(.) = local-name($me))]"/>
       <sch:assert test="empty($rivals)"><sch:value-of select="name(.)"/>
       is assigned the same classes as element(s)
       <xsl:value-of select="oscal:sequence(distinct-values($rivals/local-name(.)))"/> in the same document.</sch:assert>
      
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
  
  
  
  <sch:pattern>
    
    <!--<sch:rule context="oscal:assign | oscal:select"/>-->
<!-- XXX reimplement against 'singleton' settings in declaration   -->
    <sch:rule context="oscal:title | oscal:references | oscal:link"/>
    
    <sch:rule context="oscal:control">
      <sch:assert test="empty(ancestor::oscal:control)">Controls must not be inside controls. (Use subcontrols for that.)</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:subcontrol">
      <sch:assert test="exists(ancestor::oscal:control)">Subcontrol appears outside a control.</sch:assert>
      <sch:assert test="empty(ancestor::oscal:feat)">Subcontrol may not appear inside a feature.</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:group"/>
    
    <sch:rule context="oscal:stmt[empty(@class)]"/>
    
    <sch:rule context="oscal:div"/>
    
    <!-- Next rule doesn't match elements pre-empted in the last rules. -->
    <sch:rule context="oscal:control/* | oscal:group/* | oscal:subcontrol/* | oscal:feat/*">
      <sch:let name="me" value="."/>
      <sch:let name="classes" value="oscal:classes($me)"/>
      
      <sch:assert test="exists($classes)">
        Element <sch:value-of select="name()"/> must be assigned a class.</sch:assert>
      
      <sch:report test="count($classes) gt 1" role="warning">Overloading classes is a bad idea.</sch:report>
      
    </sch:rule>
  </sch:pattern>

  <!--<xsl:key name="components-by-class" match="prop[matches(@class,'\S')] | param[matches(@class,'\S')] | stmt[matches(@class,'\S')]" use="oscal:classes(.)"/>-->
  
  <xsl:key name="elements-by-class" match="*[matches(@class,'\S')][empty(ancestor::oscal:declarations)]" use="oscal:classes(.)"/>
  
  
  
</sch:schema>