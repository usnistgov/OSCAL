<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt3"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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

    <xsl:key name="declaration-by-name" match="m:define-assembly | m:define-field | m:define-flag" use="@name"/>
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/metaschema/1.0" prefix="m"/>
    
    <sch:let name="home" value="/m:METASCHEMA"/>
    
    <sch:pattern>
        <sch:rule context="m:define-assembly[exists(@acquire-from)] | m:define-field[exists(@acquire-from)] | m:define-flag[exists(@acquire-from)]">
            <sch:assert test="count(key('declaration-by-name',@name)) = 1">Definition for '<sch:value-of select="@name"/>' is not unique in this metaschema</sch:assert>
            <sch:assert test="empty(child::*)">An acquired definition may not have its own contents</sch:assert>
            <sch:let name="this-name"   value="@name"/>
            <sch:let name="target-name" value="@acquire-from"/>
            <sch:let name="target"      value="/m:METASCHEMA/m:import[@name=$target-name]"/>
            
            <sch:let name="module" value="$target/document(@href,.)/m:METASCHEMA"/>
            <sch:assert test="exists($target)">No metaschema is imported for acquisition '<sch:value-of select="$target-name"/>' </sch:assert>
            <sch:assert test="empty($target) or exists($module)">No metaschema is found for metaschema '<sch:value-of select="$target-name"/>' at <sch:value-of select="$target/@href"/> </sch:assert> 
            <sch:let name="acquired" value="$module/key('declaration-by-name',$this-name,.)"/>
            <sch:assert test="exists($acquired)">No definition is found for <sch:value-of select="substring-after(local-name(),'define-')"/>  <sch:value-of select="@name"/> in imported metaschema '<sch:value-of select="$target-name"/>' at <sch:value-of select="$target/@href"/> </sch:assert> 
            <sch:assert test="empty($acquired/@acquire-from)">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' is also acquired (from module '<sch:value-of select="$acquired/@acquire-from"/>'); please import from the original metaschema</sch:assert>
            
            <sch:assert test="empty(@address) or exists($acquired/@address)">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' should have the same 'address' setting.</sch:assert>
            <sch:assert test="empty((.|$acquired)/@address) or @address=$acquired/@address">Definition for <sch:value-of select="substring-after(local-name(),'define-')"/> '<sch:value-of select="@name"/>' in imported metaschema '<sch:value-of select="$target-name"/>' is addressed by ''</sch:assert>
            <sch:let name="acquired-refs" value="$acquired/m:model//(m:flag | m:field | m:assembly | m:fields | m:assemblies)"/>
            <sch:let name="not-acquired"  value="$acquired-refs[empty(key('declaration-by-name',@named,$home))]"/>
            <sch:assert test="empty($not-acquired)">Failed to acquire a model for <sch:value-of select="string-join($not-acquired/(name() || '[@named=''' || @named || ''']'),', ')"/></sch:assert>
            
        </sch:rule>
        <sch:rule context="m:define-assembly | m:define-field | m:define-flag">
            <sch:assert test="count(key('declaration-by-name',@name)) = 1">Definition for '<sch:value-of select="@name"/>' is not unique in this metaschema</sch:assert>
            <sch:assert test="exists(m:formal-name)">formal-name missing from <sch:name/></sch:assert>
            <sch:assert test="exists(m:description)">description missing from <sch:name/></sch:assert>
            <sch:assert test="empty(self::m:define-assembly) or exists(m:model)">model missing from <sch:name/></sch:assert>
            <sch:assert test="empty(@show-docs) or @show-docs=('xml', 'json', 'xml json')">Value
                of @show-docs should be 'xml', 'json', or 'xml json'</sch:assert>
            <sch:report test="@name=('p','ul','ol','pre')">Can't use name '<sch:value-of select="@name"/>': it's reserved for prose.</sch:report>
            <!--<sch:assert test="count( key('declaration-by-name',@name) | key('declaration-by-name',@name,$imported-schemas) ) ge 1">Not a distinct declaration</sch:assert>-->
            <sch:report test="@name = ../*/@group-as">Clashing name with group name: <sch:value-of select="@name"/></sch:report>
            <sch:report test="@group-as = ../*/@name">Clashing group name with name: <sch:value-of select="@name"/></sch:report>
            <sch:assert test="empty(@address) or m:flag/@name=@address">Definition set to address by '<sch:value-of select="@address"/>', but no flag with that name is declared.</sch:assert>
            
            <sch:assert test="not(@as='boolean') or empty(m:flag)">Property defined as boolean may not have flags (try 'empty')</sch:assert>
        </sch:rule>

        <!--<sch:rule context="define-field[@address-by='id']/*">
            <sch:assert test="empty(*)">Line defined as string may not have attributes</sch:assert>
        </sch:rule>-->
        

        <sch:rule context="m:flag">
            <sch:let name="decl" value="key('declaration-by-name',@name)"/>
            
            <sch:assert test="exists($decl)" role="warning">No declaration found for '<sch:value-of select="@name"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the declaration has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:assert test="not(@name=../@address) or @required='yes'">Definition set to address by '<sch:value-of select="@name"/>', but its flag is not required.</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE')">Flag should not be named "STRVALUE" or "RICHTEXT" (reserved names)</sch:report>
        </sch:rule>
        
        <sch:rule context="m:prose">
            <sch:assert test="count(../m:prose) eq 1">Prose may not appear in more than once in a model</sch:assert>
        </sch:rule>
        <!-- 'choice' is not subjected to rules for other elements inside 'model' -->
        <sch:rule context="m:choice"/>
        <sch:rule context="m:field | m:fields | m:assembly | m:assemblies">
            <sch:let name="decl" value="key('declaration-by-name',@named)"/>
            <sch:assert test="exists($decl)">No declaration found for '<sch:value-of select="@named"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@group-as) or (@group-as = $decl/@group-as)">Declaration group name doesn't match: here is '<sch:value-of select="@group-as"/>' but the declaration has '<sch:value-of select="$decl/@group-as"/>'</sch:assert>
            <sch:assert test="empty($decl) or empty(@address) or ($decl/@address = @address)">The target definition has <sch:value-of select="if (exists($decl/@address)) then ('address ''' || $decl/@address || '''') else 'no address'"/></sch:assert>
            <sch:assert test="exists($decl/@acquire-from) or empty(@address) or ($decl/m:flag/@name = @address)">The target definition has no flag named '<sch:value-of select="@address"/>'</sch:assert>
            <sch:assert test="empty($decl/@acquire-from) or empty(@address) or not($decl/m:flag/@name = @address) or ($decl/m:flag[@name = current()/@address]/@required='yes')">The target definition has no required flag named <sch:value-of select="@address"/></sch:assert>
            
            
            <sch:report test="@named = ../(* except current())/@named">Everything named the same must appear together</sch:report>
            <sch:report test="@named = ../*/@group-as">Clashing name with group name: <sch:value-of select="@named"/></sch:report>
            <sch:report test="@group-as = ../*/@named">Clashing group name with name: <sch:value-of select="@named"/></sch:report>
        </sch:rule>
        
        <sch:rule context="m:example/m:description | m:example/m:remarks"/>
            
        <sch:rule context="m:example/*">
            <sch:let name="ns" value="/m:METASCHEMA/m:namespace"/>
            <sch:assert test="empty($ns) or namespace-uri(.) eq $ns">Unexpected namespace: examples should use namespace '<sch:value-of select="$ns"/>'</sch:assert>
        </sch:rule>
    </sch:pattern>


    <sch:pattern>
        <sch:rule context="/m:METASCHEMA">
            <sch:assert test="@root=*/@name">METASCHEMA/@root should be one of <sch:value-of select="string-join(*/@name,', ')"/></sch:assert>
        </sch:rule>
        <sch:rule context="/m:METASCHEMA/m:title"/>
        <sch:rule context="/m:METASCHEMA/m:import">
            <sch:report role="warning" test="document-uri(/) = resolve-uri(@href,document-uri(/))">Schema can't import itself</sch:report>
            <sch:assert test="exists(document(@href)/m:METASCHEMA)">Can't find a metaschema at <sch:value-of select="@href"/></sch:assert>
            <!--<sch:report test="empty($imported-schemas/m:METASCHEMA)">Don't see imported schemas</sch:report>-->
        </sch:rule>
        <sch:rule context="m:define-assembly">
            <sch:assert role="warning" test="@name = (//m:assembly/@named | //m:assemblies/@named | /m:METASCHEMA/@root)">Definition for assembly '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:define-field">
            <sch:assert role="warning" test="@name = (//m:field/@named | //m:fields/@named)">Definition for field '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:define-flag">
            <sch:assert role="warning" test="@name = //m:flag/@name">Definition for flag '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:assembly | m:assemblies">
            <sch:assert test="@named = /*/m:define-assembly/@name">Assembly invocation does not point to an assembly definition.</sch:assert>
            <sch:report test="@named = /*/m:define-field/@name">'<sch:value-of select="@named"/>' is a field, not an assembly.</sch:report>
            <sch:report test="@named = /*/m:define-flag/@name">'<sch:value-of select="@named"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:field | m:fields">
            <sch:assert test="@named = /*/m:define-field/@name">Field invocation does not point to a field definition.</sch:assert>
            <sch:report test="@named = /*/m:define-assembly/@name">'<sch:value-of select="@named"/>' is an assembly, not a field.</sch:report>
            <sch:report test="@named = /*/m:define-flag/@name">'<sch:value-of select="@named"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:flag">
            <sch:assert test="@name = /*/m:define-flag/@name">Flag invocation does not point to a flag definition.</sch:assert>
            <sch:report test="@name = /*/m:define-field/@name">'<sch:value-of select="@name"/>' is a field, not a flag.</sch:report>
            <sch:report test="@name = /*/m:define-assembly/@name">'<sch:value-of select="@name"/>' is an assembly, not a flag.</sch:report>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>