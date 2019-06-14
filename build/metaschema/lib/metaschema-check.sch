<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">


<!--
# extra-schema constraints:
#  prose may not appear twice among siblings i.e. count(prose) is never gt 1
#  @named may not be repeated among siblings
#  same w/ @group-as
#  likewise @named may not equal any @group-as
#  @named always resolves (to some /*/*/@name)
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
        <!--<sch:rule context="m:define-assembly[exists(@acquire-from)] | m:define-field[exists(@acquire-from)] | m:define-flag[exists(@acquire-from)]">
            <sch:assert test="count(key('definition-by-name',@name)) = 1">Definition for '<sch:value-of select="@name"/>' is not unique in this metaschema</sch:assert>
            <sch:assert test="empty(child::*)">An acquired definition may not have its own contents</sch:assert>
            <sch:let name="this-name"   value="@name"/>
            <sch:let name="target-name" value="@acquire-from"/>
            <sch:let name="target"      value="/m:METASCHEMA/m:import[@name=$target-name]"/>
            
            <sch:let name="module" value="$target/document(@href,.)/m:METASCHEMA"/>
            <sch:assert test="exists($target)">No metaschema is imported for acquisition '<sch:value-of select="$target-name"/>' </sch:assert>
            <sch:assert test="empty($target) or exists($module)">No metaschema is found for metaschema '<sch:value-of select="$target-name"/>' at <sch:value-of select="$target/@href"/> </sch:assert> 
            <sch:let name="acquired" value="$module/key('definition-by-name',$this-name,.)"/>
            <sch:assert test="exists($acquired)">No definition is found for <sch:value-of select="substring-after(local-name(),'define-')"/>  <sch:value-of select="@name"/> in imported metaschema '<sch:value-of select="$target-name"/>' at <sch:value-of select="$target/@href"/> </sch:assert> 
            <sch:assert test="empty($acquired/@acquire-from)">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' is also acquired (from module '<sch:value-of select="$acquired/@acquire-from"/>'); please import from the original metaschema</sch:assert>
            
            <sch:assert test="empty(@address) or exists($acquired/@address)">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' should have the same 'address' setting.</sch:assert>
            <sch:assert test="empty((.|$acquired)/@address) or @address=$acquired/@address">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' is addressed by ''</sch:assert>
            <sch:let name="acquired-refs" value="$acquired/m:model//(m:flag | m:field | m:assembly | m:fields | m:assemblies)"/>
            <sch:let name="not-acquired"  value="$acquired-refs[empty(key('definition-by-name',@named,$home))]"/>
            <sch:assert test="empty($not-acquired)">Failed to acquire a model for <sch:value-of select="string-join($not-acquired/(name() || '[@named=''' || @named || ''']'),', ')"/></sch:assert>
            
        </sch:rule>-->
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
            <sch:assert test="matches(@group-as,'\S') or empty(self::m:define-assembly) or empty($composed-metaschema//m:assemblies[@named=current()/@name])">Assembly is used in groups ("assemblies") but has no grouping name (@group-as). See definition(s) for <xsl:value-of separator=", " select="$composed-metaschema//m:assemblies[@named=current()/@name]/ancestor::m:define-assembly/@name"/></sch:assert>
            <sch:assert test="matches(@group-as,'\S') or empty(self::m:define-field) or empty($composed-metaschema//m:fields[@named=current()/@name])">Field is used in groups ("fields") but has no grouping name (@group-as). See definition(s) for <xsl:value-of separator=", " select="$composed-metaschema//m:fields[@named=current()/@name]/ancestor::m:define-assembly/@name"/></sch:assert>
            <sch:assert test="not(@as='boolean') or empty(m:flag)">Property defined as boolean may not have flags.</sch:assert>
        </sch:rule>

        <!--<sch:rule context="define-field[@address-by='id']/*">
            <sch:assert test="empty(*)">Line defined as string may not have attributes</sch:assert>
        </sch:rule>-->
        

        <sch:rule context="m:key">
            <sch:assert test="count(../*[@name = current()/@name]) eq 1">Only one flag (or key) may be named 
                <sch:value-of select="@name"/>
            </sch:assert>
        </sch:rule>
        
        <sch:rule context="m:value-key">
            <sch:assert test="not(parent::define-field) or matches(.,'\S')">Inside a field definition, a value-key must be
                given with a literal value</sch:assert>
            <sch:assert test="not(parent::flag) or empty(node())">Inside a flag reference, a value-key must be empty
                (serving to declare the flag as the value key)</sch:assert>
        </sch:rule>
        
        <sch:rule context="m:flag">
            <sch:let name="decl" value="key('definition-by-name',@name,$composed-metaschema)"/>
            <sch:assert test="empty(m:value-key) or @required='yes'">A flag declared as a value key must be required (@required='yes')</sch:assert>
            <sch:assert test="empty(m:value-key) or empty(../m:value-key)">A flag may not be marked as a value key when its field has a (literal) value key.</sch:assert>
            <sch:assert test="empty(m:value-key) or (count(../m:flag/m:value-key) eq 1)">Only one flag may be marked as a value key on a field.</sch:assert>
            <sch:assert test="count(../*[@name = current()/@name]) eq 1">Only one flag (or key or value-key) may be named 
                <sch:value-of select="@name"/></sch:assert>
            <sch:assert test="exists($decl)" role="warning">No definition found for '<sch:value-of select="@name"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the definition has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE')">Flag should not be named "STRVALUE" or "RICHTEXT" (reserved names)</sch:report>
        </sch:rule>
        
        <sch:rule context="m:prose">
            <sch:assert test="count(../m:prose) eq 1">Prose may not appear in more than once in a model</sch:assert>
        </sch:rule>
        <!-- 'choice' is not subjected to rules for other elements inside 'model' -->
        <sch:rule context="m:choice"/>
        <sch:rule context="m:field | m:fields | m:assembly | m:assemblies">
            <sch:let name="decl" value="key('definition-by-name',@named,$composed-metaschema)"/>
            <sch:assert test="exists($decl)">No definition found for '<sch:value-of select="@named"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert role="warning" test="empty($decl) or exists(self::m:field|self::m:assembly) or exists($decl/@group-as)">Reference is made to <sch:value-of select="local-name()"/> '<sch:value-of select="@named"/>', but their definition does not give a group name.</sch:assert>
            <sch:assert test="(empty($decl/@address) and empty(@address)) or ($decl/@address = @address)">The referenced definition has <sch:value-of select="if (exists($decl/@address)) then ('address ''' || $decl/@address || '''') else 'no address'"/></sch:assert>
            <!--<sch:assert test="exists($decl/@acquire-from) or empty(@address) or ($decl/m:flag/@name = @address)">The referenced definition has no flag named '<sch:value-of select="@address"/>'</sch:assert>
            <sch:assert test="empty($decl/@acquire-from) or empty(@address) or not($decl/m:flag/@name = @address) or ($decl/m:flag[@name = current()/@address]/@required='yes')">The target definition has no required flag named <sch:value-of select="@address"/></sch:assert>-->
            
            
            <sch:report test="@named = ../(* except current())/@named">Everything named the same must appear together</sch:report>
            <sch:report test="@named = ../*/@group-as">Clashing name with group name: <sch:value-of select="@named"/></sch:report>
            <sch:report test="@group-as = ../*/@named">Clashing group name with name: <sch:value-of select="@named"/></sch:report>
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
            <sch:assert role="warning" test="@name = ($composed-metaschema//m:assembly/@named | $composed-metaschema//m:assemblies/@named | /m:METASCHEMA/@root)">Definition for assembly '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:define-field">
            <sch:assert role="warning" test="@name = ($composed-metaschema//m:field/@named | $composed-metaschema//m:fields/@named)">Definition for field '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:define-flag">
            <sch:assert role="warning" test="@name = //m:flag/@name">Definition for flag '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:assembly | m:assemblies">
            <sch:assert test="@named = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">Assembly invocation does not point to an assembly definition.
            We expect one of <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-assembly/@name" separator=", "/></sch:assert>
            <sch:report test="@named = $composed-metaschema/m:METASCHEMA/m:define-field/@name">'<sch:value-of select="@named"/>' is a field, not an assembly.</sch:report>
            <sch:report test="@named = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@named"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:field | m:fields">
            <sch:assert test="@named = $composed-metaschema/m:METASCHEMA/m:define-field/@name">Field invocation does not point to a field definition.
                We expect one of <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-field/@name" separator=", "/></sch:assert>
            <sch:report test="@named = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">'<sch:value-of select="@named"/>' is an assembly, not a field.</sch:report>
            <sch:report test="@named = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@named"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:flag">
            <sch:assert test="@name = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">Flag invocation does not point to a flag definition.
                We expect one of <xsl:value-of select="$composed-metaschema/m:METASCHEMA/m:define-flag/@name" separator=", "/></sch:assert>
            <sch:report test="@name = $composed-metaschema/m:METASCHEMA/m:define-field/@name">'<sch:value-of select="@name"/>' is a field, not a flag.</sch:report>
            <sch:report test="@name = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">'<sch:value-of select="@name"/>' is an assembly, not a flag.</sch:report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>