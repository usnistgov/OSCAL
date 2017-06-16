<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  
   
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations" value="/oscal:catalog/oscal:declarations/(.[exists(*)],document(@href))[1]"/>
  
  <sch:pattern>
    
<!--  Constraints over declarations - very important!  -->
    <sch:rule context="oscal:property | oscal:statement | oscal:parameter">
      <sch:let name="me" value="."/>
      <sch:let name="look-the-same" value="
       ../(* except $me)[oscal:declares(.) = oscal:declares($me)]"/>
      <sch:assert test="empty($look-the-same)">Declaration clashes with another declaration.</sch:assert>
      <sch:report test="true"><sch:value-of select="oscal:declares(.)"/></sch:report>
    </sch:rule>
    
    <sch:rule context="oscal:assign | oscal:select">
    </sch:rule>
    <sch:rule context="oscal:title">
    </sch:rule>
    
    <sch:rule context="oscal:control/*">
      <sch:let name="me" value="."/>
      <!-- <sch:report test="oscal:match-token($me) = (../* except $me)/oscal:match-token(.)">
        More than one '<sch:value-of select="@handle"/>' appears in this <sch:value-of select="name(..)"/> (<sch:value-of select="oscal:match-token(..)"/>).
      </sch:report>-->
      <xsl:variable name="name" select="(@handle,local-name(.))[1]"/>
      <!-- Note $ilk is a sequence, one token for @type if given, one for the parent's local name. -->
      <xsl:variable name="ilk"  select="../@type,local-name(..)"/>
      <sch:let name="signatures" value="for $i in ($ilk) return string-join(($i,$name),'/')"/>
      <sch:let name="same-handle" value="../(* except $me)[(@handle,local-name(.))[1]=$name]"/>
      <sch:assert test="empty($same-handle)">
        handle '<sch:value-of select="@handle"/>' appears more than once inside this <sch:value-of select="name(..)"/>.</sch:assert>
      
      <!-- Only properties, statements and parameters with handles must also be declared;
           other declarations come for free. -->
      <sch:assert test="empty(@handle) or exists(key('declarations',$signatures,$declarations))">No declaration found for <sch:name/> '<sch:value-of select="@handle"/>'</sch:assert>
    </sch:rule>
    
  </sch:pattern>
 
  <sch:pattern>
    <sch:rule context="oscal:p//* | oscal:list//*"/>
    
   
    
    <!-- Not yet validating properties against declarations in/for groups. -->
    <!--<sch:rule context="oscal:control/oscal:prop | oscal:control/oscal:stmt">
      <sch:let name="me"          value="."/>
      
      
      <sch:let name="catalog-entry" value="$declarations/key('declarations',oscal:signature($me),.)"/>
      <sch:let name="controlled"    value="$declarations/key('control-spec',oscal:signature($me/parent::oscal:control[1]),.)"/>
      <!-\- If the control lookup fails, the test is silenced -\->
      <sch:assert test="exists($catalog-entry) or empty($controlled)">
        <sch:name/> can't be named '<sch:value-of select="@name"/>' (no such <sch:name/> known in control of type '<sch:value-of select="ancestor::oscal:control[1]/@type"/>'
      </sch:assert>
      
      <sch:let name="is-enumerated" value="exists($catalog-entry/oscal:value)"/>
      <sch:assert test="empty($catalog-entry) or not($is-enumerated) or (. = $catalog-entry/oscal:value)">
        '<sch:value-of select="."/>' is not permitted as a value for (<sch:name/>) <sch:value-of select="@name"/>: try
        <sch:value-of select="string-join($catalog-entry/oscal:value,', ')"/>
      </sch:assert>
      
      <!-\-<sch:let name="regex-requirement" value="$catalog-entry/oscal:regex"/>
      <sch:assert test="empty($catalog-entry) or empty($regex-requirement) or matches(.,$regex-requirement)">
        '<sch:value-of select="."/>' is not permitted as a value for property <sch:value-of select="@name"/>: expected to match 
        regular expression '<sch:value-of select="$regex-requirement"/>'</sch:assert>
      -\->
      <sch:let name="id-requirement" value="$catalog-entry/oscal:identifier"/>
      <sch:assert test="empty($catalog-entry) or empty($id-requirement) or empty(key('prop-by-value',normalize-space(.)) except .)">
        (prop) <sch:value-of select="@name"/> '<sch:value-of select="."/>' appears more than once within the document.</sch:assert>
      
      <!-\-<sch:report test="exists($catalog-entry) and not(. = $catalog-entry/oscal:VALUE)">
        <sch:value-of select="."/> isn't recognized for prp[@name='<sch:value-of select="$me/@name"/>']
      </sch:report>-\->
    </sch:rule>
-->
  </sch:pattern>
  
  <!-- signature concatenates the handle with the handle of the parent, where
       $handle = (@handle, @type, local-name(.))[1]
       except in declarations, which expand to multiple signatures, one
       for each declared context. -->
  <!--<xsl:key name="by-signature" match="*" use="oscal:signature(.)"/>-->
  
 <!-- <sch:pattern>
    
    <sch:rule context="oscal:control/*">
      <sch:let name="me" value="."/>
      <sch:let name="declaration" value="$declarations/key('by-signature',oscal:signature($me),.)"/>
      <sch:report test="true()"><sch:value-of select="oscal:signature($me)"/></sch:report>
      <sch:report test="exists($declaration)">
        Declaration found for <sch:name/>
      </sch:report>
    </sch:rule>
  </sch:pattern>-->
  
  <!--<xsl:key name="prop-by-value" match="oscal:prop" use="normalize-space(.)"/>-->

  <!--<xsl:key name="control-spec"
    match="oscal:declarations/oscal:control-spec | oscal:declarations//oscal:property | oscal:declarations//oscal:statement"
    use="oscal:signature(.)"/>-->
  
  <!--<xsl:key name="declaration-by-handle" match="declarations/*" use="oscal:match-token(.)"-->
  <!-- For a property or statement in a control ( prop | stmt) ,
    or a control property or statement declaration, the control label concatenates their name with the given control type.
    Things go awry of course when names or organizations are out of order. -->
  <!-- A signature combines the handle of the element with its parent.
       Ordinarily this will be ./@handle, ../@type.
       Note that this logic collapses names, handles and types together 
         so stmt[@handle='guidance'] has the same handle as a 'guidance' element. -->
       
  <!-- Declarations have multiple signatures, configuring them to match
        arbitrary statements and properties (by handling logic) -->
  
  <xsl:variable name="source" select="/"/>
  
  <xsl:key name="declarations" match="oscal:declarations/*" use="oscal:declares(.)"/>
  
  <xsl:function name="oscal:declares" as="xs:string*">
    <xsl:param name="d" as="element()"/>
    <!-- delivers a sequence of strings for a declaration indicating the
         signature values -->
    <xsl:sequence select="for $c in (tokenize($d/@where,'\s+')) return string-join(( $c, $d/@handle ),'/')"/>
  </xsl:function>
  
 
  
</sch:schema>