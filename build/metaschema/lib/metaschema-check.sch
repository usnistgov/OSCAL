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
    <xsl:key name="invocation-by-ref" match="m:assembly[exists(@ref)] | m:field[exists(@ref)] | m:flag[exists(@ref)]" use="@ref"/>
    <xsl:key name="flags-by-name" match="m:define-flag | m:flag[@name]" use="@name"/>
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/metaschema/1.0" prefix="m"/>
    
    <xsl:variable name="example-ns" select="'http://csrc.nist.gov/ns/oscal/example'"/>
    
    <sch:let name="home" value="/m:METASCHEMA"/>
    
    <sch:let name="prose-names" value="document('../xml/oscal-prose-module.xsd')/*/xs:element/@name"/>
    
    <!--<xsl:include href="oscal-datatypes-check.xsl"/>-->
    <!--<xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>-->
    
    <xsl:import href="metaschema-compose.xsl"/>
        
<!--  grouping name can't be the same as the name
      group-as is present whenever not(@max-occurs = 1) -->
    <sch:pattern>
        <sch:rule context="m:define-assembly | m:define-field | m:define-flag">
            <!-- $compleat assembles all definitions from all modules (in metaschema-compose.xsl)  -->
            <sch:let name="contenders" value="key('definition-by-name',@name,$compleat)"/>
            <sch:assert role="warning" test="count( $contenders ) = 1">Definition for '<sch:value-of select="@name"/>' is not unique in this metaschema;  cf <xsl:value-of select="$contenders/../@module" separator=", "/>.</sch:assert>
            <sch:assert test="exists(m:formal-name)">formal-name missing from <sch:name/></sch:assert>
            <sch:assert test="exists(m:description)">description missing from <sch:name/></sch:assert>
            <sch:assert test="empty(self::m:define-assembly) or exists(m:model)">model missing from <sch:name/></sch:assert>
            <sch:assert test="not(@as-type='boolean') or empty(m:flag)">Property defined as boolean may not have flags.</sch:assert>
            <sch:assert test="not(key('invocation-by-ref',@name)/m:group-as/@in-json='BY_KEY') or exists(m:json-key)"><sch:value-of select="substring-after(local-name(),
            'define-')"/> is assigned a json key, but no 'json-key' is given</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE','PROSE')">Names "STRVALUE", "RICHTEXT" or "PROSE" (reserved names)</sch:report>
        </sch:rule>

        <sch:rule context="m:json-key">
            <!--<sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists(@name|@ref)">Flag declaration must have 'name' or 'ref'</sch:assert>
            <sch:assert test="count(@name|@ref) eq 1">Flag declaration may be by name or reference, not both (remove @name or @ref)</sch:assert>
            <sch:assert test="count(../*[(@name|@ref) = current()/(@name|@ref)]) eq 1">Only one flag (or key) may be named 
                <sch:value-of select="@name"/>
            </sch:assert>
            <sch:assert test="empty(@ref) or exists($decl)" role="warning">No definition found for '<sch:value-of select="@name"/>' <sch:name/></sch:assert>
            <sch:assert test="empty(@ref) or empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the definition has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>-->
            <!--<sch:report test="@name=('RICHTEXT','STRVALUE','PROSE')">Key should not be named "STRVALUE", "RICHTEXT" or "PROSE" (reserved names)</sch:report>-->
            <sch:assert test="@flag-name = ../m:flag/(@name | @ref)">JSON key indicates no flag on this <sch:value-of select="substring-after(local-name(..),'define-')"/>
            <xsl:if test="exists(../m:flag)">Should be (one of) <xsl:value-of select="../m:flag/(@name|@ref)" separator=", "/></xsl:if></sch:assert>
        </sch:rule>
        
        <sch:rule context="m:json-value-key">
            <sch:report test="exists(@flag-name) and matches(.,'\S')">JSON value key may be set to a value or a flag's value, but not both.</sch:report>
            <sch:assert test="empty(@flag-name) or @flag-name=../m:flag/(@name|@ref)">flag '<sch:value-of select="@flag-name"/>' not found for JSON value key</sch:assert>
        </sch:rule>
        
        <sch:rule context="m:allowed-values/m:enum">
            <sch:assert test="not(@value = preceding-sibling::*/@value)">Value '<sch:value-of select="@value"/>' may only be
            specified once for flag '<sch:value-of select="../../@name"/>'.</sch:assert>
            <!-- XXX <sch:assert test="empty(../../@as-type) or (@name castable as ../../@as-type)">Value proposed is not valid to the nominal type</sch:assert>-->
            <sch:assert test="m:datatype-validate(@value,../../@as-type)">Value '<sch:value-of select="@value"/>' is not a valid token of type <sch:value-of select="../../@as-type"/></sch:assert>
        </sch:rule>

        <sch:rule context="m:flag">
            <sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists(@name|@ref)">Flag declaration must have 'name' or 'ref'</sch:assert>
            <sch:assert test="count(@name|@ref) eq 1">Flag declaration may be by name or reference, not both (remove @name or @ref)</sch:assert>
            <sch:assert test="exists(@name) or (exists(@ref) and not(exists(@as-type)))">A flag referencing an existing declaration must not specify a data type</sch:assert>
            
            <sch:assert test="not((@name|@ref)=../m:json-value-key/@flag-name) or @required='yes'">A flag declared as a value key must be required (@required='yes')</sch:assert>
            <sch:assert test="count(../*[(@name|@ref) = current()/(@name|@ref)]) eq 1">Only one flag may be named 
                <sch:value-of select="(@name|@ref)"/></sch:assert>
            <sch:assert test="empty(@ref) or exists($decl)" role="warning">No definition found for '<sch:value-of select="@ref"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty(@ref) or empty($decl) or empty(@datatype) or (@datatype = $decl/@datatype)" role="warning">Flag data type doesn't match: the definition has '<sch:value-of select="$decl/@datatype"/>'</sch:assert>
            <sch:report test="@name=('RICHTEXT','STRVALUE','PROSE')">Flag should not be named "STRVALUE", "RICHTEXT" or "PROSE" (reserved names)</sch:report>
        <!--    <sch:report test="@as-type != key('flags-by-name',@name,$composed-metaschema)/@as-type">Flag is declared with datatype '<sch:value-of select="@as-type"/>' while other flags with that name show datatype
                <sch:value-of select="string-join(((key('flags-by-name',@name) except .)/@as-type ! ('''' || . || '''')),', ')"/></sch:report>
        -->
        </sch:rule>
        
        <!-- 'choice' is not subjected to rules for other elements inside 'model' -->
        <sch:rule context="m:choice"/>

        <sch:rule context="m:field | m:assembly">
            <sch:let name="decl" value="key('definition-by-name',@ref,$composed-metaschema)"/>
            <sch:assert test="exists($decl)">No definition found for '<sch:value-of select="@ref"/>' <sch:value-of select="local-name()"/></sch:assert>
            <sch:assert test="empty($decl) or (m:group-as/@in-json='BY_KEY') or empty($decl/m:json-key)">Target definition for { @ref} designates a json key, so
            the invocation should have group-as/@in-json='BY_KEY'</sch:assert>
            <sch:report test="@ref = ../(* except current())/@ref">Everything named the same must appear together</sch:report>
            <sch:report test="@ref = group-as/@name">Clashing name with group name: <sch:value-of select="@ref"/></sch:report>
            
            <sch:assert test="matches(m:group-as/@name,'\S') or not((@max-occurs/number() gt 1) or (@max-occurs='unbounded'))">Unless @max-occurs is 1,
            a grouping name (group-as/@name) must be given</sch:assert>

            <sch:assert test="exists(@name) or (exists(@ref) and not(exists(@as-type)))">A field referencing an existing declaration must not specify a data type</sch:assert>
            
            <sch:assert test="$decl/@as-type='markup-multiline' or not(@in-xml='UNWRAPPED')">Only 'markup-multiline' fields may be unwrapped in XML.</sch:assert>
            <sch:report test="(@in-xml='UNWRAPPED') and (@max-occurs!='1')">An 'unwrapped' field must have a max occurrence of 1</sch:report>
            <sch:report test="key('invocation-by-ref',@ref)/@in-xml != key('invocation-by-ref',@ref)/@in-xml">All fields '<sch:value-of select="@ref"/>" should have @in-xml set the same.</sch:report>
            <sch:assert test="not(@in-xml='UNWRAPPED') or not($decl/@as-type='markup-multiline') or not(preceding-sibling::*[@in-xml='UNWRAPPED']/key('definition-by-name',@ref)/@as-type='markup-multiline')">Only one field may be marked
            as 'markup-multiline' (without xml wrapping) within a model.</sch:assert>
        </sch:rule>

        <sch:rule context="m:group-as">
            <sch:let name="decl" value="key('definition-by-name',../@ref,$composed-metaschema)"/>
            <sch:let name="name" value="@name"/>
            <sch:assert test="count(../../*/(. | m:group-as)[(@name|@ref) = $name]) eq 1">Name clash on '<sch:value-of select="@name"/>'</sch:assert>
            <sch:report test="../@max-occurs/number() = 1">"group-as" should not be given when max-occurs is 1.</sch:report>
            <sch:assert test="not(@in-json='BY_KEY') or $decl/m:json-key/@flag-name=$decl/m:flag/(@name|@ref)">Cannot group by key since the definition of <sch:value-of select="name(..)"/>
                '<sch:value-of select="../@ref"/>' has no json-key specified. Consider adding a json-key to the '<sch:value-of select="../@ref"/>' definition, or using a different 'in-json' setting.</sch:assert>
            <!--<sch:assert test="not(@in-json='BY_KEY')">BOO</sch:assert>-->
        </sch:rule>

        <sch:rule context="m:example/m:description | m:example/m:remarks"/>
            
        <sch:rule context="m:example/*">
            <sch:let name="ns" value="/m:METASCHEMA/m:namespace"/>
          <sch:assert test="empty($example-ns) or namespace-uri(.) eq $example-ns">Unexpected namespace: examples should use namespace '<sch:value-of select="$example-ns"/>'</sch:assert>
        </sch:rule>
        
        <sch:rule context="m:p">
            <sch:assert test="matches(.,'\S')">Empty paragraph (is likely to distort rendition)</sch:assert>
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
            <!--FIX:<sch:assert test="empty(@group-as) or count($composed-metaschema//*[@group-as=current()/@group-as]) eq 1">Group name (@group-as) assignment is not unique to this assembly definition</sch:assert>-->
            <!--FIX:<sch:report test="$composed-metaschema//*/@name = current()/@group-as">Group name (@group-as) assignment clashes with a name in this metaschema</sch:report>-->
        </sch:rule>
        <sch:rule context="m:define-field">
            <sch:assert role="warning" test="@name = $composed-metaschema//m:field/@ref">Definition for field '<sch:value-of select="@name"/>' is not used.</sch:assert>
<!--            <sch:assert role="info" test="not(@as-type='markup-multiline') or (@unwrap-xml='no') or empty(m:flag)">Multiline markup fields must have no flags, unless unwrap-xml='yes' - use an assembly with an unwrapped multiline field</sch:assert>
-->            <!--FIX:<sch:assert test="empty(@group-as) or count($composed-metaschema//*[@group-as=current()/@group-as]) eq 1">Group name (@group-as) assignment is not unique to this field definition</sch:assert>-->
            <!--FIX:<sch:report test="$composed-metaschema//*/@name = current()/@group-as">Group name (@group-as) assignment clashes with a name in this metaschema</sch:report>-->
        </sch:rule>
        <sch:rule context="m:define-flag">
            <sch:assert role="warning" test="@name = $composed-metaschema//m:flag/@ref">Definition for flag '<sch:value-of select="@name"/>' is not used.</sch:assert>
        </sch:rule>
        <sch:rule context="m:assembly[exists(@ref)]">
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">Assembly '<xsl:value-of select="@ref"/>' invocation does not point to an assembly definition.
            We expect one of <xsl:value-of select="m:sort($composed-metaschema/m:METASCHEMA/m:define-assembly/@name)" separator=", "/></sch:assert>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-field/@name">'<sch:value-of select="@ref"/>' is a field, not an assembly.</sch:report>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@ref"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:field[exists(@ref)]">
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-field/@name">Field invocation '<xsl:value-of select="@ref"/>' does not point to a field definition.
                We expect one of <xsl:value-of select="m:sort($composed-metaschema/m:METASCHEMA/m:define-field/@name)" separator=", "/></sch:assert>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-assembly/@name">'<sch:value-of select="@ref"/>' is an assembly, not a field.</sch:report>
            <sch:report test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name">'<sch:value-of select="@ref"/>' is a flag, not an assembly.</sch:report>
        </sch:rule>
        <sch:rule context="m:flag[exists(@ref)]">
            <!--<sch:assert test="empty(@name)">Flag with 'ref' may not also have 'name'.</sch:assert>-->
            <!-- TODO: make the following work for overriding allowed-values -->
            <sch:assert test="@ref = $composed-metaschema/m:METASCHEMA/m:define-flag/@name or parent::m:field/@ref or parent::m:assembly/@ref">Flag invocation '<xsl:value-of select="@ref"/>' does not point to a flag definition. 
                <xsl:value-of select="m:sort($composed-metaschema/m:METASCHEMA/m:define-flag/@name)" separator=", "/></sch:assert>
            <!-- TODO: make the following work for overriding allowed-values -->
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

    <xsl:function name="m:sort" as="item()*">
        <xsl:param name="seq" as="item()*"/>
        
        <xsl:for-each select="$seq">
            <xsl:sort select="."/>
            <xsl:sequence select="."/>
        </xsl:for-each>
    </xsl:function>
    
    <xsl:include href="oscal-datatypes-check.xsl"/>
    
</sch:schema>