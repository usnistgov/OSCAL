<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">


<!--
# extra-schema constraints:
#  prose may not appear twice among siblings i.e. count(prose) is never gt 1
#  @ref may not be repeated among siblings
#  same w/ @group-as
#  likewise @ref may not equal any @group-as
#  @ref always resolves (to some /*/*/@name)
-->

    <xsl:key name="definition-by-name" match="m:define-assembly | m:define-field | m:define-flag" use="@name"/>
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/metaschema/1.0" prefix="m"/>
    
    <xsl:variable name="example-ns" select="'http://csrc.nist.gov/ns/oscal/example'"/>
    <sch:let name="home" value="/m:METASCHEMA"/>
    
    <sch:let name="prose-names" value="document('../xml/oscal-prose-module.xsd')/*/xs:element/@name"/>
    
    <!--<xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>-->
    
    <xsl:import href="metaschema-compose.xsl"/>
        
    <sch:pattern>
        
        <sch:rule context="m:define-assembly | m:define-field | m:define-flag">
            <sch:assert role="warning" test="count(key('definition-by-name',@name)) = 1">Definition for '<sch:value-of select="@name"/>' is not unique in this metaschema module (only the last one found will be used)</sch:assert>
            <sch:assert test="exists(m:formal-name)">formal-name missing from <sch:name/></sch:assert>
            <sch:assert test="exists(m:description)">description missing from <sch:name/></sch:assert>
            <sch:assert test="empty(self::m:define-assembly) or exists(m:model)">model missing from <sch:name/></sch:assert>
            <sch:report test="@name=$prose-names">Can't use name '<sch:value-of select="@name"/>': it's reserved for prose.</sch:report>
            <!--<sch:assert test="count( key('definition-by-name',@name) | key('definition-by-name',@name,$imported-schemas) ) ge 1">Not a distinct definition</sch:assert>-->
            <sch:report test="@name = ../*/@group-as">Clashing name with group name: <sch:value-of select="@name"/></sch:report>
            <sch:report test="@group-as = ../*/@name">Clashing group name with name: <sch:value-of select="@name"/></sch:report>
            <sch:assert test="empty(@address) or m:flag/@name=@address">Definition set to address by '<sch:value-of select="@address"/>', but no flag with that name is declared.</sch:assert>
            <sch:assert test="matches(@group-as,'\S') or empty(self::m:define-assembly) or empty($composed-metaschema//m:assembly[exists(@max-occurs) and string(@max-occurs) != '0'][@ref=current()/@name])">Assembly can appear multiply but has no grouping name (@group-as). See definition(s) for <xsl:value-of separator=", " select="$composed-metaschema//m:assembly[exists(@max-occurs) and string(@max-occurs) != '0'][@ref=current()/@name]/ancestor::m:define-assembly/@name"/></sch:assert>
            <sch:assert test="matches(@group-as,'\S') or empty(self::m:define-field) or empty($composed-metaschema//m:field[exists(@max-occurs) and string(@max-occurs) != '0'][@ref=current()/@name])">Field can appear multiply but has no grouping name (@group-as). See definition(s) for <xsl:value-of separator=", " select="$composed-metaschema//m:field[exists(@max-occurs) and string(@max-occurs) != '0'][@ref=current()/@name]/ancestor::m:define-assembly/@name"/></sch:assert>
            <sch:assert test="not(@as='boolean') or empty(m:flag)">Property defined as boolean may not have flags.</sch:assert>
        </sch:rule>

        <!--<sch:rule context="define-field[@address-by='id']/*">
            <sch:assert test="empty(*)">Line defined as string may not have attributes</sch:assert>
        </sch:rule>-->
        

        <sch:rule context="m:key">
            <sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists(@name|@ref)">Flag declaration must have 'name' or 'ref'</sch:assert>
            <sch:assert test="count(@name|@ref) eq 1">Flag declaration may be by name or reference, not both (remove @name or @ref)</sch:assert>
            
            <sch:assert test="count(../*[(@name|@ref) = current()/(@name|@ref)]) eq 1">Only one flag (or key) may be named 
                <sch:value-of select="@name"/>
            </sch:assert>
            <sch:assert test="empty(@ref) or exists($decl)" role="warning">No definition found for '<sch:value-of select="@name"/>' <sch:name/></sch:assert>
            <sch:assert test="empty(@ref) or empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the definition has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE')">Key should not be named "STRVALUE" or "RICHTEXT" (reserved names)</sch:report>
        </sch:rule>
        
        <sch:rule context="m:value-key">
            <sch:assert test="not(parent::define-field) or matches(.,'\S')">Inside a field definition, a value-key must be
                given with a literal value</sch:assert>
            <sch:assert test="not(parent::flag) or empty(node())">Inside a flag reference, a value-key must be empty
                (serving to declare the flag as the value key)</sch:assert>
        </sch:rule>
        
        <sch:rule context="m:valid-values/m:value">
            <sch:assert test="not(@name = preceding-sibling::*/@name)">Value '<sch:value-of select="@name"/>' may only be
            specified once for flag '<sch:value-of select="../../@name"/>'.</sch:assert>
        </sch:rule>
        <sch:rule context="m:flag">
            <sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists(@name|@ref)">Flag declaration must have 'name' or 'ref'</sch:assert>
            <sch:assert test="count(@name|@ref) eq 1">Flag declaration may be by name or reference, not both (remove @name or @ref)</sch:assert>
            
            <sch:assert test="empty(m:value-key) or @required='yes'">A flag declared as a value key must be required (@required='yes')</sch:assert>
            <sch:assert test="empty(m:value-key) or empty(../m:value-key)">A flag may not be marked as a value key when its field has a (literal) value key.</sch:assert>
            <sch:assert test="empty(m:value-key) or (count(../m:flag/m:value-key) eq 1)">Only one flag may be marked as a value key on a field.</sch:assert>
            <sch:assert test="count(../*[(@name|@ref) = current()/(@name|@ref)]) eq 1">Only one flag (or key or value-key) may be named 
                <sch:value-of select="(@name|@ref)"/></sch:assert>
            <sch:assert test="empty(@ref) or exists($decl)" role="warning">No definition found for '<sch:value-of select="@ref"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty(@ref) or empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the definition has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE')">Flag should not be named "STRVALUE" or "RICHTEXT" (reserved names)</sch:report>
        </sch:rule>
        
        <sch:rule context="m:prose">
            <sch:assert test="count(../m:prose) eq 1">Prose may not appear in more than once in a model</sch:assert>
        </sch:rule>
        <!-- 'choice' is not subjected to rules for other elements inside 'model' -->
        <sch:rule context="m:choice"/>
        <sch:rule context="m:field | m:assembly">
            <sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists($decl)">No definition found for '<sch:value-of select="@ref"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert role="warning" test="empty($decl) or exists(self::m:field|self::m:assembly) or exists($decl/@group-as)">Reference is made to <sch:value-of select="local-name()"/> '<sch:value-of select="@ref"/>', but their definition does not give a group name.</sch:assert>
            
            <sch:report test="@ref = ../(* except current())/@ref">Everything named the same must appear together</sch:report>
            <sch:report test="@ref = ../*/@group-as">Clashing name with group name: <sch:value-of select="@ref"/></sch:report>
            <sch:report test="@group-as = ../*/@ref">Clashing group name with name: <sch:value-of select="@ref"/></sch:report>
        </sch:rule>
        
        <sch:rule context="m:example/m:description | m:example/m:remarks"/>
            
        <sch:rule context="m:example/*">
            <sch:let name="ns" value="/m:METASCHEMA/m:namespace"/>
          <sch:assert test="empty($example-ns) or namespace-uri(.) eq $example-ns">Unexpected namespace: examples should use namespace '<sch:value-of select="$example-ns"/>'</sch:assert>
        </sch:rule>
    </sch:pattern>


    <sch:pattern>
        <sch:rule context="/m:METASCHEMA">
            <sch:assert test="@root=*/@name">METASCHEMA/@root should be one of <sch:value-of select="string-join(*/@name,', ')"/></sch:assert>
            <sch:assert test="exists(m:schema-version)" role="warning">Metaschema schema version must be set for any top-level metaschema</sch:assert>
        </sch:rule>
        <sch:rule context="/m:METASCHEMA/m:title"/>
        <sch:rule context="/m:METASCHEMA/m:import">
            <sch:report role="warning" test="document-uri(/) = resolve-uri(@href,document-uri(/))">Schema can't import itself</sch:report>
            <sch:assert test="exists(document(@href)/m:METASCHEMA)">Can't find a metaschema at <sch:value-of select="@href"/></sch:assert>
            <!--<sch:report test="empty($imported-schemas/m:METASCHEMA)">Don't see imported schemas</sch:report>-->
        </sch:rule>
       
        <sch:rule context="m:define-assembly">
            <sch:assert role="warning" test="@name = ($composed-metaschema//m:assembly/@ref | /m:METASCHEMA/@root)">Definition for assembly '<sch:value-of select="@name"/>' is not used.</sch:assert>
            <sch:assert test="empty(@group-as) or count($composed-metaschema//*[@group-as=current()/@group-as]) eq 1">Group name (@group-as) assignment is not unique to this assembly definition</sch:assert>
            <sch:report test="$composed-metaschema//*/@name = current()/@group-as">Group name (@group-as) assignment clashes with a name in this metaschema</sch:report>
        </sch:rule>
        <sch:rule context="m:define-field">
            <sch:assert role="warning" test="@name = $composed-metaschema//m:field/@ref">Definition for field '<sch:value-of select="@name"/>' is not used.</sch:assert>
            <sch:assert test="empty(@group-as) or count($composed-metaschema//*[@group-as=current()/@group-as]) eq 1">Group name (@group-as) assignment is not unique to this field definition</sch:assert>
            <sch:report test="$composed-metaschema//*/@name = current()/@group-as">Group name (@group-as) assignment clashes with a name in this metaschema</sch:report>
        </sch:rule>
        <sch:rule context="m:define-flag">
            <sch:assert role="warning" test="@name = ($composed-metaschema//m:flag/@ref | $composed-metaschema//m:key/@ref)">Definition for flag '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:assembly">
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">Assembly invocation does not point to an assembly definition.
            We expect one of <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-assembly/@name" separator=", "/></sch:assert>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-field/@name">'<sch:value-of select="@ref"/>' is a field, not an assembly.</sch:report>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@ref"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:field">
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-field/@name">Field invocation does not point to a field definition.
                We expect one of <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-field/@name" separator=", "/></sch:assert>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">'<sch:value-of select="@ref"/>' is an assembly, not a field.</sch:report>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@ref"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:flag[exists(@ref)]">
            <!--<sch:assert test="empty(@name)">Flag with 'ref' may not also have 'name'.</sch:assert>-->
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name and exists($composed-metaschema/m:METASCHEMA/m:define-flag)">Flag invocation does not point to a flag definition. 
                <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-flag/@name" separator=", "/></sch:assert>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-field/@name">'<sch:value-of select="@name"/>' is a field, not a flag.</sch:report>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">'<sch:value-of select="@name"/>' is an assembly, not a flag.</sch:report>
        </sch:rule>
        <!-- The following rule is preempted by the last one and should fire only for flag[exists(@name)]
             since @name or @flag is required (tested by a rule above) -->
        <sch:rule context="m:flag">
            <sch:assert test="exists(child::m:formal-name)">Named flag expects a 'formal-name'</sch:assert>
            <sch:assert test="exists(child::m:description)">Named flag expects a 'description'</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>