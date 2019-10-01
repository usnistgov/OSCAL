<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
    
<!-- Purpose: Produce an XSLT supporting bidirectional XML-JSON syntax negotiation based on constraints declared in a netaschema -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting bidirectional transformation. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>
    
    <xsl:variable name="string-value-label">STRVALUE</xsl:variable>
    <xsl:variable name="markdown-value-label">RICHTEXT</xsl:variable>
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>
    <xsl:key name="definitions-by-flags"  match="define-field | define-assembly" use="flag/(@ref|@name)"/>
    <xsl:key name="definitions-by-fields" match="define-assembly" use="model//field/@ref"/>
    <xsl:key name="references-by-name" match="assembly[exists(@ref)] | field[exists(@ref)]" use="@ref"/>
    
    <!-- Produces composed metaschema (imports resolved) -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    
    
    <xsl:template match="/">
        <!--<xsl:apply-templates select="METASCHEMA"/>-->
        <xsl:apply-templates select="$composed-metaschema/METASCHEMA"/>
    </xsl:template>
    
    <xsl:template match="METASCHEMA">
        <XSLT:stylesheet version="3.0"
            xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
            exclude-result-prefixes="#all">
            <!-- helping out the spliced-in XSLT with a namespace declaration -->
            <xsl:namespace name="m">http://csrc.nist.gov/ns/oscal/1.0/md-convertor</xsl:namespace>
            <XSLT:output indent="yes" method="xml"/>
            
            <xsl:comment expand-text="true"> OSCAL { @root} conversion stylesheet supports JSON->XML conversion </xsl:comment>
            
            <XSLT:param name="target-ns" as="xs:string?" select="'{$composed-metaschema/METASCHEMA/namespace/normalize-space(.)}'"/>
            <!--<XSLT:param name="target-ns" as="xs:string?" select="'{namespace/normalize-space(.)}'"/>-->
            
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            
            <!--<xsl:apply-templates select="*"/>-->
            <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>
            
            <!-- copying in templates from md-oscal-converter.xsl - everything but top-level parameters -->
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            <xsl:comment> Markdown converter</xsl:comment>
            <xsl:copy-of select="document('md-oscal-converter.xsl')/xsl:*/(xsl:* except (xsl:param|xsl:variable[@name='examples']|xsl:template[@name='xsl:initial-template']))"/>
        </XSLT:stylesheet>
    </xsl:template>
    
    <xsl:template match="title"/>
    
    <xsl:template match="/METASCHEMA/*" priority="-0.2"/>
    
    <!-- flag references in definitions don't need templates since their declarations produce them.   -->
    <xsl:template match="flag[@ref]" mode="make-template"/>
      
     <!-- local flag definitions (given in field or assembly definitions) do require templates --> 
     <xsl:template match="flag[@name]" mode="make-template" expand-text="true">
        <!-- Making a template to match a flag in context of its parent -->
        <xsl:comment> 000 Handling flag "{ ../@name}/@{ @name }" 000 </xsl:comment>
        
        <xsl:variable name="match-step" expand-text="yes" as="xs:string">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="match-patterns" as="xs:string*">
            <xsl:for-each select="..">
                <xsl:variable name="group-names" select="distinct-values(key('references-by-name',@name)/group-as/@name)"/>
                <xsl:value-of>
                    <xsl:text>*[@key='{@name}']/{$match-step}</xsl:text>
                    <xsl:for-each select="$group-names">
                        <xsl:text> | *[@key='{ . }']/{$match-step}</xsl:text>
                        <xsl:text> | array[@key='{ . }']/*/{$match-step}</xsl:text>
                    </xsl:for-each>
                </xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
         <xsl:comment> suppressing when matched in json2xml traversal</xsl:comment>
         <XSLT:template match="{string-join($match-patterns,' | ')}" priority="7" mode="json2xml"/>
         
        <XSLT:template priority="3" match="{string-join($match-patterns,' | ')}" mode="as-attribute">
            <XSLT:attribute name="{@name}">
                <XSLT:apply-templates mode="#current"/>
            </XSLT:attribute>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template match="define-flag" expand-text="true">
        <!-- Flags won't be producing elements in the regular traversal -->
        <xsl:comment> 000 Handling flag @{ @name } 000 </xsl:comment>
        <xsl:variable name="flag-name" select="@name"/>
        <XSLT:template match="*[@key='{@name}']" priority="6" mode="json2xml"/>
        
        <xsl:variable name="match-step" expand-text="yes" as="xs:string">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="match-patterns" as="xs:string*">
            <xsl:for-each select="key('definitions-by-flags', $flag-name)[not(json-value-key/@flag-name=$flag-name)]">
                <xsl:variable name="group-names"
                    select="distinct-values(key('references-by-name', @name)/group-as/@name)"/>
                <xsl:value-of>
                    <xsl:text>*[@key='{@name}']/{$match-step}</xsl:text>
                    <xsl:for-each select="$group-names">
                        <xsl:text> | *[@key='{ . }']/{$match-step}</xsl:text>
                        <xsl:text> | array[@key='{ . }']/*/{$match-step}</xsl:text>
                        <!-- when json-key is set the grandparent is a map -->
                        <xsl:text> | map[@key='{ . }']/*/{$match-step}</xsl:text>
                    </xsl:for-each>
                </xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
        <xsl:if test="exists($match-patterns)">
            <XSLT:template priority="2" match="{string-join($match-patterns,' | ')}"
                mode="as-attribute">
                <XSLT:attribute name="{@name}">
                    <XSLT:apply-templates mode="#current"/>
                </XSLT:attribute>
            </XSLT:template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="define-flag/* | define-field/* | define-assembly/*"/>
            
    <!-- 'any' keyword not handled  -->
    <xsl:template match="any" priority="10"/>
    
    <xsl:template match="model | choice" priority="3">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="model//*">
        <XSLT:apply-templates mode="#current" select="*[@key=({string-join((@ref/('''' || . || ''''),group-as/@name/('''' || . || '''')),', ')})]"/>    
    </xsl:template>
    
    <xsl:template priority="2" match="model//*[group-as/@in-xml='GROUPED']">
        <XSLT:for-each-group group-by="true()" select="*[@key=({string-join((@ref/('''' || . || ''''),group-as/@name/('''' || . || '''')),', ')})]">
            <XSLT:element name="{group-as/@name}" namespace="{$target-namespace}">
                <XSLT:apply-templates mode="#current" select="current-group()"/>    
            </XSLT:element>
        </XSLT:for-each-group>
    </xsl:template>
    
    <!--<xsl:template match="model/prose" priority="2">
        <XSLT:apply-templates mode="#current" select="*[@key='prose']"/>    
    </xsl:template>-->
    
    <xsl:template match="define-field" mode="text-key">
        <xsl:value-of select="$string-value-label"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as-type='markup-line']" mode="text-key">
        <xsl:value-of select="$markdown-value-label"/>
    </xsl:template>
    
    <!-- does not get a key since the object's name will be the key
        <xsl:template match="define-field[@as-type='markup-multiline']" mode="text-key">PROSE</xsl:template>-->
    
    
    <xsl:template priority="3" match="define-field[matches(json-value-key,'\S')]" mode="text-key">
        <xsl:value-of select="json-value-key"/>
    </xsl:template>
    
    <xsl:template priority="2" match="define-field[matches(json-value-key/@flag-name,'\S')]" mode="text-key">
        <XSLT:value-of select="string[@key='{ json-value-key/@flag-name }']"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as-type='markup-multiline']">
        <xsl:variable name="group-names" select="distinct-values(key('references-by-name',@name)/group-as/@name)"/>
        <xsl:variable name="single-match" as="xs:string" expand-text="true">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="group-matches" as="xs:string*" select="$group-names ! ('*[@key=''' || . || ''']  | array[@key=''' || . || ''']/*')"/>
        <xsl:variable name="field-match" select="string-join(($single-match,$group-matches),' | ')"/>
        
        <xsl:comment expand-text="yes">{ $field-match }</xsl:comment>
        <XSLT:template match="{$field-match}" priority="5" mode="json2xml">
            <xsl:choose>
                <xsl:when test="key('references-by-name',@name)/@in-xml='UNWRAPPED'">
                    <xsl:apply-templates select="." mode="field-text"/>
                </xsl:when>
                <xsl:otherwise>
                    <XSLT:element name="{@name}" namespace="{$target-namespace}">
                        <xsl:apply-templates select="." mode="field-text"/>            
                    </XSLT:element>
                </xsl:otherwise>
            </xsl:choose>
        </XSLT:template>
        <!--<xsl:for-each select="json-key | json-value-key">
            <xsl:message expand-text="yes">{ local-name()} is ignored on field { ../@name } of type 'markup-multiline' </xsl:message>
        </xsl:for-each>-->
    </xsl:template>
        
    <xsl:template match="define-field" expand-text="true">
        <!-- $text-value-key returns an empty string for fields defined with json-value-key/@flag-name -->
        <xsl:variable name="text-value-key" as="xs:string">
            <xsl:apply-templates select="." mode="text-key"/>
        </xsl:variable>
        
        <xsl:variable name="group-names" select="distinct-values(key('references-by-name',@name)/group-as/@name)"/>
        <xsl:variable name="single-match" as="xs:string" expand-text="true">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="group-matches" as="xs:string*" select="$group-names ! ('*[@key=''' || . || ''']  | array[@key=''' || . || ''']/*')"/>
        <xsl:variable name="root-match" as="xs:string?" select="if (@name=../@root) then '/map[empty(@key)]' else ()"/>
        <xsl:variable name="field-match" select="string-join(($single-match,$group-matches,$root-match),' | ')"/>
        
        <!--<xsl:variable name="field-match" as="xs:string">*[@key='{@name}']{
            @group-as/(' | *[@key=''' || . || '''] | array[@key=''' || . || ''']/*') }{
            if (@name=../@root) then ' | /map[empty(@key)]' else ()}</xsl:variable>-->
        <xsl:comment> 000 Handling field "{ @name }" 000 </xsl:comment>
        <xsl:comment> 000 NB - template matching 'array' overrides this one 000 </xsl:comment>
        <!--<xsl:variable name="callers" select="key('definitions-by-fields',@name,$composed-metaschema)"/>-->
        <!--<xsl:comment expand-text="yes">{ $callers/(@name, @group-as) }</xsl:comment>-->
        <!--<xsl:variable name="full-field-match">
            <xsl:for-each select="$callers/@name">
                <xsl:if test="not(position() eq 1)"> | </xsl:if>
                <xsl:text expand-text="true">*[@key='{.}']/{ $field-match}</xsl:text>
            </xsl:for-each>
            <xsl:for-each select="$callers/@group-as">
                <xsl:text expand-text="true"> | *[@key='{.}']/{ $field-match} | *[@key='{.}']/*/{ $field-match} </xsl:text>
            </xsl:for-each>
        </xsl:variable>-->
        <!--<xsl:comment expand-text="yes">{ $full-field-match }</xsl:comment>-->
        <xsl:comment expand-text="yes">{ $field-match }</xsl:comment>
        
        <XSLT:template match="{$field-match}" priority="5" mode="json2xml">
            <XSLT:element name="{@name}" namespace="{$target-namespace}">
                <xsl:for-each select="json-key">
                    <XSLT:attribute name="{@flag-name}" select="../@key"/>
                </xsl:for-each>
                <XSLT:apply-templates select="*" mode="as-attribute"/>
                <xsl:apply-templates select="." mode="field-text"/>
            </XSLT:element>
        </XSLT:template>
        
        
        <!-- A template to place the key value on an attribute      -->
        <xsl:for-each select="child::json-key">
            <XSLT:template priority="2" match="({ $field-match})/string[@key='{@flag-name}']" mode="as-attribute">
                <XSLT:attribute name="{@flag-name}">
                    <XSLT:apply-templates mode="#current"/>
                </XSLT:attribute>
            </XSLT:template>
        </xsl:for-each>
        
        <!-- BUT - we want to prevent the value field (indicated by value key) from appearing as
        an attribute (in this context only) -->
        <xsl:for-each select="json-value-key[empty(@flag-name)]">
            <XSLT:template
                match="({$field-match})/string[@key='{.}']"
                mode="as-attribute"/>
            <!-- AND - for this context, we override the template that would otherwise suppress the value from appearing in mode json2xml -->
            <XSLT:template priority="8"
                match="({$field-match})/string[@key='{.}']"
                mode="json2xml">
                <XSLT:apply-templates mode="#current"/>
            </XSLT:template>
            
        </xsl:for-each>
        
        <!-- when a field has json-value-key/@flag-name, we need a template
             to match the field with the value key and make an
             attribute for it, {name}={label} -->
        <xsl:if test="matches(json-value-key/@flag-name,'\S')">
            <xsl:variable name="value-key-name"   select="json-value-key/@flag-name"/>
            <xsl:variable name="flag-names" select="flag[not((@name|@ref)=$value-key-name)]/(@name,@ref)[1]"/>
            <xsl:variable name="reserved-names" select="$flag-names/string(), $string-value-label,$markdown-value-label"/>
            
<!-- First a template to override any other templates matching objects of whatever name, where here the
            key name of the property represents the json-value-key value, not a flag name -->
            <XSLT:template priority="6"
                match="({$field-match})/string[not(@key=({string-join($reserved-names ! ('''' || . || ''''),',')}))]"
                mode="json2xml">
                <XSLT:apply-templates/>
            </XSLT:template>
            
            <!-- Now, a template to match where we want attributes - flags not reserved for the value key ...  -->
            <XSLT:template
                match="({$field-match})/string[not(@key=({string-join($reserved-names ! ('''' || . || ''''),',')}))]"
                mode="as-attribute">
                <XSLT:attribute name="{json-value-key/@flag-name}">
                    <XSLT:value-of select="@key"/>
                </XSLT:attribute>
            </XSLT:template>

        </xsl:if>

        
        <!-- array has @key='{$text-value-key}' only when an array has been collapsed into a map
             (for a 'collapsible' field definition) -->
        <xsl:if test="matches($text-value-key,'\S')">
            <xsl:for-each select="$group-names">

                <XSLT:template priority="3" mode="json2xml"
                    match="map[@key = '{ . }']/array[@key = '{$text-value-key}'] | array[@key = '{ . }']/map/array[@key = '{$text-value-key}']">
                    <!-- A supervening template matching a map will unspool itself as if it hadn't been compressed,
                 then apply templates to the resulting array(s) ... -->
                    <XSLT:variable name="expanded" as="element()*">
                        <array xmlns="http://www.w3.org/2005/xpath-functions" key="{ . }">
                            <XSLT:apply-templates mode="expand"
                                select="array[@key = '{$text-value-key}']/string"/>
                        </array>
                    </XSLT:variable>
                    <XSLT:apply-templates select="$expanded" mode="json2xml"/>
                </XSLT:template>

                <!-- Pre-processing template to expand compressed fields -->
                <XSLT:template mode="expand"
                    match="map[@key = '{ . }']/array[@key = '{$text-value-key}']/string | array[@key = '{ . }']/map/array[@key = '{$text-value-key}']/string">
                    <XSLT:variable name="me" select="."/>
                    <XSLT:for-each select="parent::array/parent::map">
                        <XSLT:copy>
                            <XSLT:copy-of select="* except array[@key = '{$text-value-key}']"/>
                            <string xmlns="http://www.w3.org/2005/xpath-functions"
                                key="{$text-value-key}">
                                <XSLT:value-of select="$me"/>
                            </string>
                        </XSLT:copy>
                    </XSLT:for-each>
                </XSLT:template>
            </xsl:for-each>
        </xsl:if>
        
        <!-- finally we make templates to match locally declared flags -->
        <xsl:apply-templates mode="make-template" select="flag"/>
        <!--<xsl:call-template name="drop-address"/>-->
    </xsl:template>
    
    <!-- We produce a template to override the assembly match on arrays
         (whose members represent the elements). -->
    
    <xsl:template match="define-field" mode="field-text">
        <xsl:variable name="key">
            <xsl:apply-templates select="." mode="text-key"/>
        </xsl:variable>
        <!-- self::string[empty(@key)] because sometimes a data point for
            an element is represented by an anonymous string inside a (named) array -->
        <XSLT:apply-templates select="string[@key='{$key}']" mode="json2xml"/>
        <!-- handling where promotion has made a simple value -->
        <XSLT:for-each select="self::string | self::boolean | self::number">
            <XSLT:apply-templates mode="json2xml"/>
        </XSLT:for-each>
    </xsl:template>
    
    <xsl:template match="define-field[matches(json-value-key/@flag-name,'\S')]" mode="field-text">
        <xsl:variable name="value-key" select="json-value-key/@flag-name"/>
        <xsl:variable name="flag-names" select="flag[not((@name,@ref)=$value-key)]/(@name|@ref)"/>
        <!--<xsl:variable name="reserved-names" select="$flag-names/string(), $string-value-label,$markdown-value-label"/>-->
        <XSLT:apply-templates select="string[not(@key=({
            string-join($flag-names ! ('''' || . || ''''),',')}))]" mode="json2xml"/>
    </xsl:template>
    
    <xsl:template priority="3" match="define-field[@as-type='markup-line']" mode="field-text">
        <xsl:variable name="key">
            <xsl:apply-templates select="." mode="text-key"/>
        </xsl:variable>
        <XSLT:for-each select="string[@key='{$key}'], self::string"><!-- XXX -->
            <xsl:call-template name="render-markdown-field"/>
        </XSLT:for-each>
    </xsl:template>
    
    <xsl:template priority="3" match="define-field[@as-type='markup-multiline']" mode="field-text">
        <xsl:variable name="key" select="@name"/>
        <XSLT:for-each select="string[@key='{$key}'], self::string"><!-- XXX -->
            <XSLT:call-template name="parse">
                <XSLT:with-param name="markdown-str" select="string(.)"/>
            </XSLT:call-template>
        </XSLT:for-each>
    </xsl:template>
    
    <xsl:template name="render-markdown-field">
        <XSLT:variable name="markup">
            <XSLT:apply-templates mode="infer-inlines"/>
        </XSLT:variable>
        <XSLT:apply-templates mode="cast-ns" select="$markup"/>
    </xsl:template>
    
    <xsl:template match="define-assembly">
        <xsl:variable name="group-names" select="distinct-values(key('references-by-name',@name)/group-as/@name)"/>
        <xsl:variable name="single-match" as="xs:string" expand-text="true">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="group-matches" as="xs:string*" select="$group-names ! ('array[@key=''' || . || ''']/* | map[@key=''' || . || ''']')"/>
        <xsl:variable name="root-match" as="xs:string?" select="if (@name=../@root) then '/map[empty(@key)]' else ()"/>
        
        <xsl:variable name="full-match" as="xs:string" select="string-join(($single-match,$group-matches,$root-match),' | ')"/>
        
        <xsl:comment> 000 Handling assembly "{ @name }" 000 </xsl:comment>
        <xsl:comment> 000 NB - template matching 'array' overrides this one 000 </xsl:comment>
        <xsl:variable name="assembly-construction">
            <XSLT:element name="{@name}" namespace="{$target-namespace}">
                <xsl:for-each select="child::json-key">
                    <XSLT:apply-templates select="@key" mode="as-attribute"/>
                </xsl:for-each>
                <XSLT:apply-templates mode="as-attribute"/>
                <xsl:apply-templates/>
            </XSLT:element>
        </xsl:variable>
        <XSLT:template match="{$full-match}" priority="4" mode="json2xml">
            <xsl:copy-of select="$assembly-construction"/>
        </XSLT:template>

        <xsl:if test="exists($group-names)">
            <xsl:for-each select="child::json-key">
                <xsl:variable name="group-name-seq" select="string-join($group-names ! ('''' || . || ''''),', ')"/>
                <XSLT:template match="map[@key=({ $group-name-seq })]" priority="5" mode="json2xml">
                    <XSLT:apply-templates mode="json2xml"/>
                </XSLT:template>
                <XSLT:template priority="2" match="map[@key=({ $group-name-seq })]/*/@key" mode="as-attribute">
                    <XSLT:attribute name="{@flag-name}">
                        <XSLT:value-of select="."/>
                    </XSLT:attribute>
                </XSLT:template>
                <XSLT:template match="map[@key=({ $group-name-seq })]/map" priority="3" mode="json2xml">
                    <xsl:copy-of select="$assembly-construction"/>
                </XSLT:template>
                
            </xsl:for-each>
           
        </xsl:if>
        <!-- finally we make templates to match locally declared flags -->
        <xsl:apply-templates mode="make-template" select="flag"/>
        <!--<xsl:call-template name="drop-address"/>-->
    </xsl:template>
 
    <xsl:template name="furniture">
        
        <XSLT:output indent="yes"/>
        
        <XSLT:strip-space elements="*"/>
        <XSLT:preserve-space elements="string"/>
        
        <XSLT:param name="json-file" as="xs:string?"/>
        
        <XSLT:variable name="using-json-file" select="replace($json-file,'^/','') ! ('file:///' || .)"/>
        
        <XSLT:variable name="json-xml" select="unparsed-text($using-json-file) ! json-to-xml(.)"/>
        
        <XSLT:template name="xsl:initial-template" match="/">
            <XSLT:choose>
                <XSLT:when test="matches($json-file,'\S') and exists($json-xml/map)">
                    <XSLT:apply-templates select="$json-xml" mode="json2xml"/>
                </XSLT:when>
                <XSLT:otherwise>
                    <XSLT:apply-templates mode="json2xml"/>
                </XSLT:otherwise>
            </XSLT:choose>
        </XSLT:template>
        
        <XSLT:template match="/map[empty(@key)]"
            priority="10"
            mode="json2xml">
            <XSLT:apply-templates mode="#current" select="*[@key=('{@root}')]"/>
        </XSLT:template>
        
        <XSLT:template match="array" priority="10" mode="json2xml">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>
        
        <XSLT:template match="string[@key='{$markdown-value-label}']" mode="json2xml">
            <!--<XSLT:apply-templates select="." mode="handle-inlines"/>-->
            <XSLT:call-template name="parse">
                <XSLT:with-param name="markdown-str" select="string(.)"/>
            </XSLT:call-template>
        </XSLT:template>
        
        <XSLT:template match="string[@key='{$string-value-label}']" mode="json2xml">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>
        
        <XSLT:template mode="as-attribute" match="*"/>
        
        <XSLT:template mode="as-attribute"  match="string[@key='id']" priority="0.4">
            <XSLT:attribute name="id">
                <XSLT:apply-templates mode="#current"/>
            </XSLT:attribute>
        </XSLT:template>
        
    </xsl:template>
    
</xsl:stylesheet>