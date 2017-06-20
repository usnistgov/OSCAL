<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  
   
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations" value="/oscal:catalog/oscal:declarations/(.[exists(*)],document(@href))[1]"/>
  
  <sch:pattern>
    <sch:rule context="*[exists(@type)]">
      <sch:report test="normalize-space(@type)=('control','group','stmt','prop')">
        @type value <sch:value-of select="@type"/> not allowed
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern>
    
<!--  Constraints over declarations - very important!  -->
    <sch:rule context="oscal:property | oscal:statement | oscal:parameter">
      <sch:let name="me" value="."/>
      <sch:let name="look-the-same" value="
       ../(* except $me)[oscal:declares(.) = oscal:declares($me)]"/>
      <sch:assert test="empty($look-the-same)">Declaration clashes with another declaration.</sch:assert>
      <sch:report test="true"><sch:value-of select="oscal:declares(.)"/></sch:report>
    </sch:rule>
    
    <sch:rule context="oscal:assign | oscal:select"/>
    
    <sch:rule context="oscal:title"/>
    <sch:rule context="oscal:group | oscal:control"/>
    
    <sch:rule context="oscal:control/* | oscal:group/*">
      <sch:let name="me" value="."/>
      <!-- <sch:report test="oscal:match-token($me) = (../* except $me)/oscal:match-token(.)">
        More than one '<sch:value-of select="@role"/>' appears in this <sch:value-of select="name(..)"/> (<sch:value-of select="oscal:match-token(..)"/>).
      </sch:report>-->
      <xsl:variable name="name" select="(@role,local-name(.))[1]"/>
      <!-- Note $ilk is a sequence, one token for @type if given, one for the parent's local name. -->
      <xsl:variable name="ilk"  select="../@type,local-name(..)"/>
      <sch:let name="signatures" value="for $i in ($ilk) return string-join(($i,$name),'/')"/>
      <sch:let name="same-role" value="../(* except $me)[(@role,local-name(.))[1]=$name]"/>
      <sch:assert test="empty($same-role)">
        role '<sch:value-of select="@role"/>' appears more than once inside this <sch:value-of select="name(..)"/>.</sch:assert>
      
      <!-- Only properties, statements and parameters with roles must also be declared;
           other declarations come for free. -->
      <sch:let name="matching-declarations" value="key('declarations',$signatures,$declarations)"/>
      <sch:assert test="empty(@role) or exists($matching-declarations)">No declaration found for <sch:name/> '<sch:value-of select="@role"/>' in this location</sch:assert>
      
      <sch:let name="regex-requirements" value="$matching-declarations/oscal:regex"/>
      <sch:assert test="empty($regex-requirements) or (every $r in ($regex-requirements) satisfies matches(.,$r))">
        Value of property '<sch:value-of select="@role"/>' is expected to match (regex/es) '<xsl:value-of select="$regex-requirements/concat('''',.,'''')" separator=", "/>'</sch:assert>
      
      <sch:let name="id-requirement" value="$matching-declarations/oscal:identifier"/>
      <!--<sch:report test="exists($id-requirement)">I C ID</sch:report>-->
      <!--<sch:let name="comrades" value="key('prop-by-role',@role)"/>
      <sch:report test="true()">We have <sch:value-of select="count($comrades)"/> of '<sch:value-of select="."/>'</sch:report>-->
      <sch:assert test="empty($id-requirement) or empty((key('prop-by-role',@role) except $me)[.=$me])">
        Value of property '<sch:value-of select="@role"/>' is expected to be unique to this property (instance) within the document.</sch:assert>
      
      <sch:let name="value-requirements" value="$matching-declarations/oscal:value"/>
      <sch:assert test="empty($value-requirements) or (. = $value-requirements)">
        Value of property '<sch:value-of select="@role"/>' is expected to be one of <xsl:value-of select="$value-requirements/concat('''',.,'''')" separator=", "/></sch:assert>
      
      
    </sch:rule>
    
  </sch:pattern>
 
 <xsl:key name="prop-by-role" match="oscal:prop" use="@role"/>
  
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
  
  
  <xsl:variable name="source" select="/"/>
  
  <xsl:key name="declarations" match="oscal:declarations/*" use="oscal:declares(.)"/>
  
  <xsl:function name="oscal:declares" as="xs:string*">
    <xsl:param name="d" as="element()"/>
    <!-- delivers a sequence of strings for a declaration indicating the
         signature values -->
    <xsl:sequence select="for $c in (tokenize($d/@where,'\s+')) return string-join(( $c, $d/@role ),'/')"/>
  </xsl:function>
  
 
  
</sch:schema>