<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>
  
  <xsl:include href="oscal-functions.xsl"/>
   
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations"
    value="/oscal:catalog/ ( oscal:declarations[empty(@href)], oscal:declarations/document(@href,/)/oscal:declarations )[1]"/>
  
  <sch:pattern>
    <sch:rule context="oscal:catalog">
      <sch:assert test="exists($declarations)" role="warning">No declarations found (properties will not be checked).</sch:assert>
      
      <!--<sch:report test="true()"><sch:value-of select="oscal:sequence($declarations/*/local-name())"/></sch:report>-->
      
    </sch:rule>
    
    <!--  Constraints over declarations - very important!  -->
    <sch:rule context="oscal:declare-prop | oscal:declare-p | oscal:declare-param | oscal:declare-part">
      <sch:let name="me" value="."/>
      <!-- oscal:declares returns a set of strings indicating classes and context to which declarations are bound -->
      <sch:let name="look-the-same" value="
        ../(* except $me)[oscal:signatures(.) = oscal:signatures($me)]"/>
      <sch:assert test="empty($look-the-same)">Declaration clashes with another declaration.</sch:assert>
      <!--<sch:report test="true()"><sch:value-of select="oscal:sequence(oscal:signatures(.))"/></sch:report>-->
    </sch:rule>
  
    <!-- Constraints over groups, controls and enhancements (subcontrols, features)
         regarding required components (though not yet parameters) -->
    <sch:rule context="oscal:group | oscal:control | oscal:subcontrol | oscal:part">
      <xsl:variable name="this" select="."/>
      <xsl:variable name="matches"  select="oscal:classes($this),local-name($this)"/>
      <sch:let name="applicable" value="$declarations/key('declarations-by-context',$matches,$declarations)"/>
      
      <!--<sch:report test="true()" role="warning"><sch:value-of select="oscal:sequence($matches)"/> 
      
        <sch:value-of select="oscal:sequence($declarations/*/@context)"/>
      </sch:report>-->
      
      <!--<sch:assert role="warning" test="exists($applicable) or empty((oscal:param|oscal:prop|oscal:stmt|oscal:feat)/@class)">No declarations apply to this <sch:name/></sch:assert>-->
      
      <!-- Finding property declarations for required properties.  -->
      <sch:let name="required-property-declarations" value="$applicable/self::oscal:declare-prop[exists(oscal:required)]"/>
      <sch:let name="required-property-classes" value="$required-property-declarations/oscal:classes(.)"/>
      <!-- Identifying the classes of those that are not found among children -->
      <sch:let name="missing-property-classes" value="$required-property-classes[not(. = $this/child::*/oscal:classes(.))]"/>
      
      <sch:assert test="empty($missing-property-classes)">Required 
        <xsl:value-of select="if (count($missing-property-classes) gt 1) then 'properties are ' else 'property is'"/>
        missing: expecting <xsl:value-of select="oscal:sequence($missing-property-classes)"/>
        on <sch:name/> <sch:value-of select="oscal:sequence(oscal:classes($this) )"/></sch:assert>
      
      <!-- Same for paras -->
      <sch:let name="required-paragraph-declarations" value="$applicable/self::oscal:declare-p[exists(oscal:required)]"/>
      <sch:let name="required-paragraph-classes" value="$required-paragraph-declarations/oscal:classes(.)"/>
      
      <!-- Extend to support named statements e.g. <observations> not just stmt[@class] ? -->
      <sch:let name="missing-paragraph-classes" value="$required-paragraph-classes[not(. = $this/child::*/oscal:classes(.)) ]"/>
      <sch:assert test="empty($missing-paragraph-classes)">Required 
        <xsl:value-of select="if (count($missing-paragraph-classes) gt 1) then 'paras are ' else 'para is'"/>
        missing: expecting <xsl:value-of select="oscal:sequence($missing-paragraph-classes)"/>
        on <sch:name/> <sch:value-of select="oscal:sequence(oscal:classes($this) )"/>
      </sch:assert>
    </sch:rule>
   </sch:pattern>
  
<!-- Next, validating the values inside controls and control objects against matching declarations -->
  <sch:pattern>
    <sch:rule context="oscal:ul | oscal:ol | oscal:pre">
      <!--To do: find a way to declare controls as (not) permissive of this stuff ?-->
    </sch:rule>
    
    
    
    <!-- Exempted from declaration rules; other children of control, group, enhancement must be declared
         and will match the next rule. -->
    <!-- Note that we have no mechanism for declaring (and constraining) controls, subcontrols or groups,
         but we are expected to declare features. -->
    <sch:rule context="oscal:p[empty(@class)] | oscal:param | oscal:title |
      oscal:group | oscal:section | oscal:control | oscal:subcontrol | oscal:link | oscal:references"/>

    <sch:rule context="oscal:control/* | oscal:group/* | oscal:subcontrol/* | oscal:part/*">
      <xsl:variable name="this" select="."/>

      <sch:let name="signatures" value="
        for $cx in ($this/../(oscal:classes(.),local-name(.)) ),
            $cl in (oscal:classes($this)) return string-join(($cx,$cl),'/')"/>
      
      <sch:let name="matching-declarations" value="$declarations/key('declarations-by-signature',$signatures,.)"/>
      
      <!--<sch:report test="true()" role="info">Seeing <sch:value-of select="count($matching-declarations)"/> matching declarations <xsl:value-of select="string-join($matching-declarations/name(),', ')"/> </sch:report>-->
      
      <sch:assert test="empty($matching-declarations) or count($matching-declarations)=1">More than one matching declaration found for <sch:name/> (signatures <sch:value-of select="oscal:sequence($signatures)"/>)
      </sch:assert>
      <sch:assert test="empty(@class) or empty($declarations/*) or exists($matching-declarations)">No declaration found for <sch:name/> <sch:value-of select="oscal:sequence(oscal:classes(.))"/> in this location</sch:assert>
      
      <sch:let name="regex-requirements" value="$matching-declarations/oscal:regex"/>
      
      <!--<sch:report test="true()" role="warning"><sch:value-of select="oscal:sequence($regex-requirements)"/></sch:report>-->
      
      <sch:assert test="empty($regex-requirements) or (every $r in ($regex-requirements) satisfies matches(.,$r))">
        Value of property '<sch:value-of select="oscal:classes(.)"/>' is expected to match regex
        <xsl:value-of select="if (count($regex-requirements) gt 1) then '(one of) regexes' else 'regex'"/>
        <xsl:value-of select="oscal:sequence($regex-requirements)"/>'</sch:assert>
      
      <sch:let name="singleton-requirement" value="$matching-declarations/oscal:singleton"/>
      <sch:let name="single-classes" value="$singleton-requirement/oscal:classes(..)[.=oscal:classes($this)]"/>
      <sch:let name="competitors" value="$this/../*[oscal:classes(.)=$single-classes]"/>
     
      <sch:assert test="empty($singleton-requirement) or empty($competitors except $this)">
        Value of property (<sch:value-of select="oscal:sequence($single-classes)"/>) is expected to be unique to this property (instance) within the document.</sch:assert>
      
      <sch:let name="id-requirements" value="$matching-declarations/oscal:identifier"/>
      <sch:let name="id-classes" value="$id-requirements/oscal:classes(..)[.=oscal:classes($this)]"/>
      <sch:let name="cohort" value="key('prop-by-value',normalize-space($this))[oscal:classes(.)=$id-classes]"/>
      
      <sch:assert test="empty($id-requirements) or empty($cohort except $this)">
        Value of property (<sch:value-of select="oscal:sequence($id-classes)"/>) is expected to be unique to this property (instance) within the document.</sch:assert>
      
      <sch:let name="value-requirements" value="$matching-declarations/oscal:value"/>
      <!--<sch:let name="value-classes" value="$value-requirements/oscal:classes(..)[.=oscal:classes($this)]"/>-->
      <sch:let name="value-classes" value="$value-requirements/oscal:classes(..)[.=oscal:classes($this)]"/>
      <sch:assert test="empty($value-requirements) or (. = $value-requirements)">
        Value of property <sch:value-of select="oscal:sequence(distinct-values($value-classes))"/> is expected to be 
        <xsl:value-of select="if (count($value-requirements) gt 1) then 'one of ' else ''"/>
        <xsl:value-of select="$value-requirements/concat('''',.,'''')" separator=", "/></sch:assert>
      
    <sch:let name="calc-requirements" value="$matching-declarations/oscal:calc"/>
      <sch:let name="calc-classes" value="$calc-requirements/oscal:classes(..)[.=oscal:classes($this)]"/>
      <xsl:variable name="resolved-calcs" as="element()*">
        <xsl:apply-templates select="$calc-requirements" mode="calculate">
          <!-- we pass $me as the who-cares -->
          <xsl:with-param tunnel="yes" name="who-cares" select="$this"/>
        </xsl:apply-templates>
      </xsl:variable>
      <sch:assert test="empty($calc-requirements) or (. = $resolved-calcs)">
        Value of property <sch:value-of select="oscal:sequence(distinct-values($calc-classes))"/> is expected to be <xsl:value-of select="if (count($calc-requirements) gt 1) then 'one of ' else ''"/>
        <xsl:value-of select="$resolved-calcs/concat('''',.,'''')" separator=", "/></sch:assert>
  
    </sch:rule>
    
  </sch:pattern>
 
 <xsl:key name="prop-by-value" match="oscal:prop" use="normalize-space(.)"/>
  
  
  
  <!--<xsl:variable name="source" select="/"/>
  
  -->
  
  <!--use="tokenize(normalize-space(lower-case(@context)),'\s')"-->
  <!-- For any control, groups or enhancement we may need (all) the declarations, as indicated by @context. -->
 
  <xsl:key name="declarations-by-context" match="oscal:declarations/*" use="tokenize(normalize-space(lower-case(@context)),'\s')"/>
  
  
<!-- Each declaration has multiple signatures, a function of its class(es) and context(s).
     Note that both can be overloaded (not that that is a good idea)
     although clashing signatures provoke errors. -->
  <!-- We use this to retrieve the particular declarations that (may) apply to any
       given control component. -->
  <xsl:key name="declarations-by-signature" match="oscal:declarations/*" use="oscal:signatures(.)"/>
  
   
  <xsl:function name="oscal:signatures" as="xs:string*">
    <xsl:param name="d" as="element()"/>
    <!-- delivers a sequence of strings for a declaration indicating the
         signature values 
      declarations may have multiple classes and multiple contexts (nominal parent classes) indicated by @context -->
    <xsl:for-each select="tokenize($d/@context/normalize-space(lower-case(.)),'\s')">
      <xsl:variable name="context" select="."/>
      <xsl:for-each select="oscal:classes($d)">
      <xsl:value-of select="string-join(($context,.),'/')"/>
      </xsl:for-each>
    </xsl:for-each>
<!-- So for context=""   -->
  </xsl:function>
  
  
  <xsl:template match="oscal:calc" mode="calculate">
    <xsl:copy>
      <xsl:apply-templates mode="calculate"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="oscal:inherit" mode="calculate">
    <xsl:param name="who-cares" required="yes" tunnel="yes"/>
    <xsl:variable name="named-classes" select="tokenize(@from/normalize-space(string(.)),'\s')"/>
    <xsl:variable name="matching-classes" select="if (empty($named-classes))
      then parent::oscal:calc/parent::oscal:declare-prop/oscal:classes(.) else $named-classes"/>
    
    <xsl:variable name="forebear"
      select="$who-cares/../ancestor::*[oscal:prop/oscal:classes(.)=$matching-classes][1]/
                oscal:prop[oscal:classes(.)=$matching-classes]"/>
    <xsl:value-of select="normalize-space($forebear)"/>
    <xsl:if test="empty($forebear)">[RESOLUTIONFAIL]</xsl:if>
  </xsl:template>

  <xsl:template match="oscal:autonum" mode="calculate">
    <xsl:param name="who-cares" required="yes" tunnel="yes"/>
    <xsl:param name="call" select="."/>
    <xsl:variable name="expanded">
      <!-- single level numbering of element among its siblings of the same name. -->
      <xsl:for-each select="$who-cares/..">
        <xsl:variable name="among" select="oscal:classes(.)"/>
        <xsl:number format="{($call/string(.),'A')[1]}" count="*[oscal:classes(.)=$among]"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="normalize-space($expanded)"/>
  </xsl:template>
  
</sch:schema>