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
    <xsl:key name="callers-by-flags" match="define-field | define-assembly" use="flag/@name"/>
    
    <!-- Produces composed metaschema (imports resolved) -->
    <xsl:import href="../lib/metaschema-compose.xsl"/>
    
    <xsl:template match="/">
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
            
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            
            <xsl:apply-templates select="$composed-metaschema/METASCHEMA/*"/>
            
            <!-- copying in templates from md-oscal-converter.xsl - everything but top-level parameters -->
            <xsl:comment> 00000000000000000000000000000000000000000000000000000000000000 </xsl:comment>
            <xsl:comment> Markdown converter</xsl:comment>
            <xsl:copy-of select="document('md-oscal-converter.xsl')/xsl:*/(xsl:* except (xsl:param|xsl:variable[@name='examples']|xsl:template[@name='xsl:initial-template']))"/>
        </XSLT:stylesheet>
    </xsl:template>
    
    <xsl:template match="title"/>
    
    <xsl:template match="/METASCHEMA/*" priority="-0.2"/>
    
    <xsl:template match="define-flag" expand-text="true">
        <!-- Flags won't be producing elements in the regular traversal -->
        <xsl:comment> 000 Handling flag "{ @name }" 000 </xsl:comment>
        
        <XSLT:template match="*[@key='{@name}']" mode="json2xml"/>
        <xsl:variable name="match-step" expand-text="yes" as="xs:string">*[@key='{@name}']</xsl:variable>
        <xsl:variable name="match-patterns" as="xs:string*">
            <xsl:for-each select="key('callers-by-flags',@name)">
                <xsl:value-of>
                    <xsl:text>*[@key='{@name}']/{$match-step}</xsl:text>
                    <xsl:if test="matches(@group-as, '\i\c*')">
                        <xsl:text> | *[@key='{@group-as}']/{$match-step}</xsl:text>
                        <xsl:text> | array[@key='{@group-as}']/*/{$match-step}</xsl:text>
                    </xsl:if>
                </xsl:value-of>
            </xsl:for-each>
        </xsl:variable>
        <XSLT:template match="{string-join($match-patterns,' | ')}" mode="as-attribute">
            <XSLT:attribute name="{@name}">
                <XSLT:apply-templates mode="#current"/>
            </XSLT:attribute>
        </XSLT:template>
    </xsl:template>

    <xsl:template match="define-flag/* | define-field/* | define-assembly/*"/>
            
    <!-- 'any' keyword not handled  -->
    <xsl:template match="any" priority="10"/>
    
    <xsl:template match="model | choice" priority="2">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="model//*">
        <xsl:variable name="definition" select="key('definition-by-name',@named)"/>
        <XSLT:apply-templates mode="#current" select="*[@key=({string-join((@named/('''' ||. || ''''),$definition/@group-as/('''' || . || '''')),', ')})]"/>    
    </xsl:template>
    
    <xsl:template match="model/prose" priority="2">
        <XSLT:apply-templates mode="#current" select="*[@key='prose']"/>    
    </xsl:template>
    
    <xsl:template match="define-field" mode="text-key"             >STRVALUE</xsl:template>
    <xsl:template match="define-field[@as='mixed']" mode="text-key">RICHTEXT</xsl:template>
    
    <xsl:template match="define-field[exists(value-key)]" mode="text-key">
        <xsl:for-each select="value-key/@name">
            <XSLT:value-of select="string[@key='{.}']"/>
        </xsl:for-each>
        <xsl:if test="empty(value-key/@name)">
            <xsl:value-of select="value-key"/>
        </xsl:if>
    </xsl:template>
    
    
    <xsl:template match="define-field" expand-text="true">
        <xsl:variable name="text-value-key" as="xs:string">
            <xsl:apply-templates select="." mode="text-key"/>
        </xsl:variable>
        <xsl:variable name="field-match" as="xs:string">*[@key='{@name}']{
            @group-as/(' | *[@key=''' || . || '''] | array[@key=''' || . || ''']/*') }{
            if (@name=../@root) then ' | /map[empty(@key)]' else ()}</xsl:variable>
        <xsl:comment> 000 Handling field "{ @name }" 000 </xsl:comment>
        <xsl:comment> 000 NB - template matching 'array' overrides this one 000 </xsl:comment>
        <XSLT:template match="{$field-match}" priority="2" mode="json2xml">
            <XSLT:element name="{@name}" namespace="{$target-namespace}">
                <xsl:for-each select="@address">
                    <XSLT:attribute name="{.}" select="../@key"/>
                </xsl:for-each>
                <XSLT:apply-templates select="*" mode="as-attribute"/>
                <xsl:apply-templates select="." mode="field-text"/>
            </XSLT:element>
        </XSLT:template>
        
        <xsl:if test="matches(@group-as,'\S')">
            <XSLT:template match="map[@key='{@group-as}'][array/@key='{$text-value-key}']" priority="3" mode="json2xml">
<!-- A supervening template matching a map will unspool itself as if it hadn't been compressed, into an array,
                then apply templates to that ... -->
                <XSLT:variable name="expanded" as="element()*">
                    <array xmlns="http://www.w3.org/2005/xpath-functions" key="{@group-as}">
                      <XSLT:apply-templates mode="expand" select="array[@key='{$text-value-key}']/string"/>
                    </array>
                </XSLT:variable>
                <XSLT:apply-templates select="$expanded" mode="json2xml"/>
            </XSLT:template>
            <XSLT:template mode="expand" match="map[@key='{@group-as}']/array[@key='{$text-value-key}']/string">
                <XSLT:variable name="me" select="."/>
                <XSLT:for-each select="parent::array/parent::map">
                    <XSLT:copy>
                        <XSLT:copy-of select="* except array[@key='{$text-value-key}']"/>
                        <string xmlns="http://www.w3.org/2005/xpath-functions" key="{$text-value-key}">
                            <XSLT:value-of select="$me"/>
                        </string>
                    </XSLT:copy>
               </XSLT:for-each>
            </XSLT:template>
        </xsl:if>
        <xsl:call-template name="drop-address"/>
    </xsl:template>
    
    <!-- We produce a template to override the assembly match on arrays
         (whose members represent the elements). -->
    
    
    
    <!-- When there are no flags, we don't have to isolate the contents of a field -->
    <xsl:template match="define-field" mode="field-text">
        <XSLT:apply-templates mode="json2xml"/>
    </xsl:template>
    
    <xsl:template match="define-field[@as='mixed']" mode="field-text">
        <XSLT:variable name="markup">
            <XSLT:apply-templates mode="infer-inlines"/>
        </XSLT:variable>
        <XSLT:apply-templates mode="cast-ns" select="$markup"/>
    </xsl:template>
    
    <xsl:template priority="2" match="define-field[exists(flag)]" mode="field-text">
        <!-- XXX to do: fetch value for alternative label       -->
        <XSLT:apply-templates mode="json2xml" select="string[@key=('{$string-value-label}','{$markdown-value-label}')]"/>
    </xsl:template>
    
    <xsl:template match="define-assembly" expand-text="true">
        
        <xsl:variable name="assembly-match" as="xs:string">*[@key='{@name}']{ @group-as/(' | *[@key=''' || . || '''] | array[@key=''' || . || ''']/*') }{ if (@name=../@root) then ' | /map[empty(@key)]' else ()}</xsl:variable>
        
        <xsl:comment> 000 Handling assembly "{ @name }" 000 </xsl:comment>
        <xsl:comment> 000 NB - template matching 'array' overrides this one 000 </xsl:comment>
        <XSLT:template match="{$assembly-match}" priority="2" mode="json2xml">
            <XSLT:element name="{@name}" namespace="{$target-namespace}">
                <xsl:for-each select="@address">
                    <XSLT:attribute name="{.}" select="@key"/>
                </xsl:for-each>
                <XSLT:apply-templates mode="as-attribute"/>
                <xsl:apply-templates/>
            </XSLT:element>
        </XSLT:template>
        <xsl:call-template name="drop-address"/>
    </xsl:template>
    
    <xsl:template name="drop-address">
        <!-- When a flag is promoted as an address, it appears in the JSON as a label, so no attribute should be made in the regular traversal. -->
        <xsl:if test="matches(@address, '\i\c*')">
            <XSLT:template mode="as-attribute" priority="2"
                match="*[@key='{@name}']/string[@key='{@address}']{ @group-as/(' | ' || '*[@key=''' || . || ''']/*/string[@key=''{@address}'']') }"
            />
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="furniture">
        
        <XSLT:output indent="yes"/>
        
        <XSLT:strip-space elements="*"/>
        <XSLT:preserve-space elements="string"/>
        
        <XSLT:param name="json-file" as="xs:string"/>
        
        <XSLT:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/>
        
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
        
        <XSLT:template match="array[@key='prose']" priority="11" mode="json2xml">
            <XSLT:variable name="text-contents" select="string-join(string,'&#xA;')"/>
            <XSLT:call-template name="parse">
                <XSLT:with-param name="str" select="$text-contents"/>
            </XSLT:call-template>
        </XSLT:template>
        
        <XSLT:template match="string[@key='prose']" priority="11" mode="json2xml">
            <XSLT:call-template name="parse">
                <XSLT:with-param name="str" select="string(.)"/>
            </XSLT:call-template>
        </XSLT:template>
        
        <!-- drops all strings except those expecting the inline markup -->
        <XSLT:template match="string" mode="handle-inlines"/>
        
        <XSLT:template match="string[@key='{$markdown-value-label}']" mode="json2xml handle-inlines">
            <XSLT:variable name="markup">
                <XSLT:apply-templates mode="infer-inlines"/>
            </XSLT:variable>
            <XSLT:apply-templates mode="cast-ns" select="$markup"/>
        </XSLT:template>
        
        <XSLT:template match="string[@key='{$string-value-label}']" mode="json2xml">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>
        
        <XSLT:template mode="as-attribute" match="*"/>
        
        <!--<XSLT:template mode="as-attribute" match="map">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>-->
        
        <XSLT:template mode="as-attribute"  match="string[@key='id']" priority="0.4">
            <XSLT:attribute name="id">
                <XSLT:apply-templates mode="#current"/>
            </XSLT:attribute>
        </XSLT:template>
        
    </xsl:template>
    
</xsl:stylesheet>