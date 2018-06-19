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
    
    <sch:let name="imported-schemas" value="(/m:METASCHEMA/m:import/document(@href),/)[1]"/>
    
    <sch:pattern>
        <sch:rule context="/m:METASCHEMA">
            <sch:assert test="@use=*/@name">METASCHEMA/@use should be one of <sch:value-of select="string-join(*/@name,', ')"/></sch:assert>
        </sch:rule>
        <sch:rule context="/m:METASCHEMA/m:title"/>
        <sch:rule context="/m:METASCHEMA/m:import">
            <sch:assert test="exists(document(@href)/m:METASCHEMA)">Can't find a metaschema at <sch:value-of select="@href"/></sch:assert>
            <sch:report test="empty($imported-schemas/m:METASCHEMA)">Don't see imported schemas</sch:report>
        </sch:rule>
        <sch:rule context="m:define-assembly | m:define-field | m:define-flag">
            <sch:assert test="empty(@show-docs) or @show-docs=('xml', 'json', 'xml json')">Value
                of @show-docs should be 'xml', 'json', or 'xml json'</sch:assert>
            <sch:report test="@name=('p','ul','ol','pre')">Can't use name '<sch:value-of select="@name"/>': it's reserved for prose.</sch:report>
            <sch:assert test="count( key('declaration-by-name',@name) | key('declaration-by-name',@name,$imported-schemas) ) ge 1">Not a distinct declaration</sch:assert>
            <sch:report test="@name = ../*/@group-as">Clashing name with group name: <sch:value-of select="@name"/></sch:report>
            <sch:report test="@group-as = ../*/@name">Clashing group name with name: <sch:value-of select="@name"/></sch:report>
            <sch:assert test="empty(@address) or m:flag/@name=@address">Definition set to address by '<sch:value-of select="@address"/>', but no flag with that name is declared.</sch:assert>
        </sch:rule>

        <!--<sch:rule context="define-field[@address-by='id']/*">
            <sch:assert test="empty(*)">Line defined as string may not have attributes</sch:assert>
        </sch:rule>-->
        <sch:rule context="m:define-field[@as='boolean']/*">
            <sch:assert test="empty(*)">Property defined as boolean may not have attributes</sch:assert>
        </sch:rule>

        <sch:rule context="m:flag">
            <sch:let name="decl" value="key('declaration-by-name',@name) | key('declaration-by-name',@name,$imported-schemas)"/>
            
            <sch:assert test="exists($decl)" role="warning">No declaration found for '<sch:value-of select="@name"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the declaration has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:assert test="not(@name=../@address) or @required='yes'">Definition set to address by '<sch:value-of select="@name"/>', but its flag is not required.</sch:assert>
        </sch:rule>
        
        <sch:rule context="m:prose">
            <sch:assert test="count(../m:prose) eq 1">Prose may not appear in more than one position in a part</sch:assert>
        </sch:rule>
        <!-- 'choice' is not subjected to rules for other elements inside 'model' -->
        <sch:rule context="m:choice"/>
        <sch:rule context="m:model//*">
            <sch:let name="decl" value="key('declaration-by-name',@named) | key('declaration-by-name',@named,$imported-schemas)"/>
            
            <sch:assert test="exists($decl)">No declaration found for '<sch:value-of select="@named"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@group-as) or (@group-as = $decl/@group-as)">Declaration group name doesn't match: here is '<sch:value-of select="@group-as"/>' but the declaration has '<sch:value-of select="$decl/@group-as"/>'</sch:assert>
            <sch:assert test="empty($decl) or empty(@address) or ($decl/@address = @address)">The target definition has <sch:value-of select="if (exists($decl/@address)) then ('address ''' || $decl/@address || '''') else 'no address'"/></sch:assert>
            <sch:assert test="empty($decl) or empty(@address) or ($decl/m:flag/@name = @address)">The target definition has no flag named '<sch:value-of select="@address"/>'</sch:assert>
            <sch:assert test="empty($decl) or empty(@address) or not($decl/m:flag/@name = @address) or ($decl/m:flag[@name = current()/@address]/@required='yes')">The target definition has no required flag named <sch:value-of select="@address"/></sch:assert>
            
            
            <sch:report test="@named = ../(* except current())/@named">Everything named the same must appear together</sch:report>
            <sch:report test="@named = ../*/@group-as">Clashing name with group name: <sch:value-of select="@named"/></sch:report>
            <sch:report test="@group-as = ../*/@named">Clashing group name with name: <sch:value-of select="@named"/></sch:report>
        </sch:rule>
    </sch:pattern>

</sch:schema>