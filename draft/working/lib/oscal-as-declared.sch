<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  
   
  
<!-- Declarations are the contents of local declarations, if present, or the document at href if locally empty.  -->
  <sch:let name="declarations"
    value="/oscal:catalog/ ( oscal:declarations[empty(@href)], oscal:declarations/document(@href,/)/oscal:declarations )[1]"/>
  
  <sch:pattern>
    <sch:rule context="oscal:catalog">
      <sch:assert test="exists($declarations)" role="warning">No declarations found (properties will not be checked).</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:group | oscal:control">
      <xsl:variable name="here" select="."/>
      <xsl:variable name="ilk"  select="@type/string(.),local-name(..)"/>
      <sch:let name="applicable" value="$declarations/key('declarations-by-match',$ilk,.)"/>
      <!--<sch:assert role="warning" test="exists($applicable)">No declarations apply to this <sch:name/></sch:assert>-->
      <sch:let name="required-property-declarations" value="$applicable[exists(oscal:required)]/self::oscal:property"/>
      <sch:let name="required-property-roles" value="$required-property-declarations/@role/string(.)"/>
      <sch:let name="missing-properties" value="$required-property-roles[not(. = $here/oscal:prop/@role)]"/>
      <sch:assert test="empty($required-property-declarations) or empty($missing-properties)">Required 
        <xsl:value-of select="if (count($missing-properties) gt 1) then 'properties are ' else 'property is'"/>
        missing on <sch:name/> <sch:value-of select="@type/concat('''',.,'''')"/>;
        we expect <xsl:value-of select="for $m in $missing-properties return concat('''',$m,'''')" separator=", "/></sch:assert>
      
      <sch:let name="required-statement-declarations" value="$applicable[exists(oscal:required)]/self::oscal:statement"/>
      <sch:let name="required-statement-roles" value="$required-statement-declarations/(@role/string(.),local-name(.))[1]"/>
      <!-- Extend the next line to support named statements e.g. <observations> not just stmt[@role] -->
      <sch:let name="missing-statements" value="$required-statement-roles[not(. = $here/oscal:stmt/@role)]"/>
      <sch:assert test="empty($required-statement-declarations) or empty($missing-statements)">Required 
        <xsl:value-of select="if (count($missing-statements) gt 1) then 'statements are ' else 'statement is'"/>
        missing on <sch:name/> <sch:value-of select="@type/concat('''',.,'''')"/>;
        we expect <xsl:value-of select="for $m in $missing-statements return concat('''',$m,'''')" separator=", "/></sch:assert>
    </sch:rule>
    
    <!--  Constraints over declarations - very important!  -->
    <sch:rule context="oscal:property | oscal:statement | oscal:parameter">
      <sch:let name="me" value="."/>
      <sch:let name="look-the-same" value="
        ../(* except $me)[oscal:declares(.) = oscal:declares($me)]"/>
      <sch:assert test="empty($look-the-same)">Declaration clashes with another declaration.</sch:assert>
      <sch:report test="true"><sch:value-of select="oscal:declares(.)"/></sch:report>
    </sch:rule>
    
    
    <sch:rule context="oscal:control/* | oscal:group/*">
      <sch:let name="me" value="."/>
      <!-- <sch:report test="oscal:match-token($me) = (../* except $me)/oscal:match-token(.)">
        More than one '<sch:value-of select="@role"/>' appears in this <sch:value-of select="name(..)"/> (<sch:value-of select="oscal:match-token(..)"/>).
      </sch:report>-->
      <xsl:variable name="name" select="(@role,local-name(.))[1]"/>
      <!-- Note $ilk is a sequence, one token for @type if given, one for the parent's local name. -->
      <xsl:variable name="ilk"  select="../@type,local-name(..)"/>
      <sch:let name="signatures" value="for $i in ($ilk) return string-join(($i,$name),'/')"/>
      
      <!-- Only properties, statements and parameters with roles must also be declared;
           other declarations come for free. -->
      <sch:let name="matching-declarations" value="$declarations/key('declarations-by-role',$signatures,.)"/>
      <sch:assert test="empty(@role) or empty($declarations) or exists($matching-declarations)">No declaration found for <sch:name/> '<sch:value-of select="@role"/>' in this location</sch:assert>
      
      <sch:let name="regex-requirements" value="$matching-declarations/oscal:regex"/>
      <sch:assert test="empty($regex-requirements) or (every $r in ($regex-requirements) satisfies matches(.,$r))">
        Value of property '<sch:value-of select="@role"/>' is expected to match regex
        <xsl:value-of select="if (count($regex-requirements) gt 1) then '(one of) regexes' else 'regex'"/>
        <xsl:value-of select="$regex-requirements/concat('''',.,'''')" separator=", "/>'</sch:assert>
      
      <sch:let name="id-requirement" value="$matching-declarations/oscal:identifier"/>
      <!--<sch:report test="exists($id-requirement)">I C ID</sch:report>-->
      <!--<sch:let name="comrades" value="key('prop-by-role',@role)"/>
      <sch:report test="true()">We have <sch:value-of select="count($comrades)"/> of '<sch:value-of select="."/>'</sch:report>-->
      <sch:assert test="empty($id-requirement) or empty((key('prop-by-role',@role) except $me)[.=$me])">
        Value of property '<sch:value-of select="@role"/>' is expected to be unique to this property (instance) within the document.</sch:assert>
      
      <sch:let name="value-requirements" value="$matching-declarations/oscal:value"/>
      <xsl:variable name="resolved-values" as="element()*">
        <xsl:apply-templates select="$value-requirements" mode="expand-values">
          <!-- we pass $me as the who-cares -->
          <xsl:with-param tunnel="yes" name="who-cares" select="$me"/>
        </xsl:apply-templates>
      </xsl:variable>
      <sch:assert test="empty($value-requirements) or (. = $resolved-values)">
        Value of property '<sch:value-of select="@role"/>' is expected to be 
        <xsl:value-of select="if (count($resolved-values) gt 1) then 'one of ' else ''"/>
        <xsl:value-of select="$resolved-values/concat('''',.,'''')" separator=", "/></sch:assert>
      
      
    </sch:rule>
    
  </sch:pattern>
 
 <xsl:key name="prop-by-role" match="oscal:prop" use="@role"/>
  
  <sch:pattern>
    <sch:rule context="oscal:p//* | oscal:list//*"/>
   </sch:pattern>
  
  
  <!--<xsl:variable name="source" select="/"/>
  
  -->
  <xsl:key name="declarations-by-role" match="oscal:declarations/*" use="oscal:declares(.)"/>
  
  <xsl:key name="declarations-by-match" match="oscal:declarations/*" use="tokenize(normalize-space(@context),'\s+')"/>
  
  <xsl:function name="oscal:declares" as="xs:string*">
    <xsl:param name="d" as="element()"/>
    <!-- delivers a sequence of strings for a declaration indicating the
         signature values -->
    <xsl:sequence select="for $c in (tokenize($d/@context,'\s+')) return string-join(( $c, $d/@role ),'/')"/>
  </xsl:function>
  
  <xsl:template match="oscal:value" mode="expand-values">
    <xsl:variable name="expanded">
      <xsl:apply-templates mode="expand-values"/>
    </xsl:variable>
    <xsl:copy><xsl:value-of select="normalize-space($expanded)"/></xsl:copy>
  </xsl:template>

  <xsl:template match="oscal:inherit" mode="expand-values">
    <xsl:param name="who-cares" required="yes" tunnel="yes"/>
    <xsl:variable name="from" as="attribute()" select="(@from , parent::oscal:value/parent::oscal:property/@role)[1]"/>
    <xsl:variable name="benefactor"
      select="$who-cares/../ancestor::*[oscal:prop/@role=$from][1]/oscal:prop[@role=$from]"/>
    <xsl:value-of select="normalize-space($benefactor)"/>
    <xsl:if test="empty($benefactor)">[RESOLUTIONFAIL]</xsl:if>
  </xsl:template>

  <xsl:template match="oscal:autonum" mode="expand-values">
    <xsl:param name="who-cares" required="yes" tunnel="yes"/>
    <xsl:param name="call" select="."/>
    <xsl:variable name="expanded">
      <!-- single level numbering of element among its siblings of the same name. -->
      <xsl:for-each select="$who-cares/..">
        <xsl:number format="{($call/@format,'A')[1]}"/>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="normalize-space($expanded)"/>
  </xsl:template>
  
</sch:schema>