<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml"
    
    exclude-result-prefixes="xs math m"
    version="3.0">
    
    <xsl:output indent="yes"/>
<!-- Utility stylesheet for Metascheme docs generation.   -->
    
    <xsl:key name="definitions" match="define-assembly | define-field | define-flag" use="@name"/>
    <xsl:key name="references"  match="assembly | field"                             use="@ref"/>
    <xsl:key name="references"  match="flag"                                         use="@ref"/>
    
    <xsl:key name="surrogates-by-name" match="*" use="@name"/>
    
    <xsl:variable name="serialization-settings">
        <output:serialization-parameters xmlns:output="http://www.w3.org/2010/xslt-xquery-serialization">
            <output:indent value="yes"/>
        </output:serialization-parameters>
    </xsl:variable>
    
    <xsl:variable name="root-definition" select="/*/*[@name = /*/@root]"/>
    
    <xsl:variable name="surrogate-tree">
        <xsl:apply-templates select="$root-definition" mode="build">
            <xsl:with-param name="minOccurs">1</xsl:with-param>
        </xsl:apply-templates>
    </xsl:variable>
    
    <xsl:variable name="pruned-tree">
        <xsl:apply-templates select="$surrogate-tree" mode="prune"/>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:apply-templates select="$root-definition" mode="build">
            <xsl:with-param name="minOccurs">1</xsl:with-param>
        </xsl:apply-templates>
        <!--<xsl:sequence select="$surrogate-tree"/>-->
        <!--<xsl:sequence select="serialize($surrogate-tree,$serialization-settings/*)"/>-->
    </xsl:template>
        
    <!-- Debugging entry point -->
    <xsl:template name="make-page">
        <html lang="en">
            <head>
                <title>Schema ToC</title>
                <style type="text/css">
 
 div.OM-map { margin-top: 0ex; margin-bottom: 0ex; margin-left: 2em; font-family: monospace; font-weight: bold } 
 
 .OM-entry { border: medium solid white }
 .OM-entry:hover { border: medium solid steelblue }
 .OM-entry.hide_me:hover { border: medium solid white }
 
 div.OM-map p { margin: 0ex }
 
 span.OM-lit, .OM-cardinality { font-family: serif; font-weight: normal; color: midnightblue }
 
 .OM-cardinality  { color: blue }
 
 .OM-map a { color: inherit; text-decoration: none }
 
 .OM-map a:hover { text-decoration: underline }
 
 .hide_me { display: none }
                </style>
                <script type="text/javascript">
                    <xsl:text xml:space="preserve">
function switch_view(who,flag) {
  var view_here      = document.getElementById(who);
  var collapsed_view = view_here.children[0];
  var expanded_view  = view_here.children[1];

  collapsed_view.classList.toggle(flag);
  expanded_view.classList.toggle(flag);
}

<!--function switch_view(who,flag) {
  var view_here     = document.getElementById(who);
  var collapsed_view = view_here.children[0];
  var expanded_view = view_here.children[1];

  collapsed_view.classList.toggle(flag);
  expanded_view.classList.toggle(flag); }-->
                    </xsl:text>
                    
                </script>
            </head>
            <body>
                <!--<pre style="float:left">
               <xsl:value-of select="serialize($pruned-tree, $serialization-settings/* )"/>
            </pre>-->
                <details>
                    <summary>Surrogate tree display</summary>
                <pre>
               <xsl:value-of select="serialize($surrogate-tree, $serialization-settings/* )"/>
            </pre>
                </details>
                <details open="open">
                    <summary>Display</summary>
                <xsl:variable name="html-rendering">
                    <xsl:apply-templates mode="html-render" select="$surrogate-tree"/>
                </xsl:variable>
                <!--<div class="OM-map" style="float:left; width:40%">
                    <xsl:copy-of select="$html-rendering"/>
                </div>-->
                <div class="OM-map">
                    <xsl:apply-templates select="$html-rendering/*" mode="elaborate"/>
                </div>
                </details>                
                
            </body>
        </html>
    </xsl:template>
    <!--  Testing entry point  -->
    <!--<xsl:template name="test">
        <ul>
          <xsl:apply-templates select="$tests/*" mode="test"/>
        </ul>
    </xsl:template>-->
    
    <!--<xsl:variable name="tests">
        <field name="implicit-required" min-occurs="1"/>
        <field name="optional-one-only" min-occurs="0" max-occurs="1"/>
        <field name="optional-unbounded" min-occurs="0" max-occurs="unbounded"/>
        <field name="at-least-three-unbounded" min-occurs="3" max-occurs="unbounded"/>
        <field name="required-one-only" min-occurs="1" max-occurs="1"/>
        <field name="one-or-two" min-occurs="1" max-occurs="2"/>
        <field name="required-ten-or-less" min-occurs="1" max-occurs="10"/>
        <field name="exactly-five" min-occurs="5" max-occurs="5"/>
        <field name="a-myriad-at-most" min-occurs="0" max-occurs="10000"/>
    </xsl:variable>-->
    
    <xsl:template match="*" mode="test">
        <li xsl:expand-text="true">{ @name } -- <xsl:apply-templates select="." mode="occurrence-requirements"/></li>
    </xsl:template>
    
    
    <xsl:template match="*" mode="prune">
        <!-- we want to prune any element that isn't first
           in breadth-first traversal
      this is the first of the nodes with the fewest ancestors -->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="m:keep-me(.)">
                    <xsl:copy-of select="m:flag"/>
                    <xsl:apply-templates mode="prune"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="echo">yes</xsl:attribute>
                    <xsl:copy-of select="m:flag"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:copy>
    </xsl:template>
    
    <!-- copied above -->
    <xsl:template match="m:flag" mode="prune"/>
    
    <xsl:function name="m:keep-me" as="xs:boolean">
        <xsl:param name="who" as="element()"/>
        <xsl:apply-templates select="$who" mode="keep-me"/>
    </xsl:function>
    
    <xsl:template mode="keep-me" priority="1" match="m:assembly[@name='control']//*" as="xs:boolean">
        <xsl:sequence select=". is key('surrogates-by-name',@name,ancestor::m:assembly[@name='control'])[1]"/>
    </xsl:template>
    
    <xsl:template mode="keep-me" match="*[@name = //m:assembly[@name='control']//*/@name]" as="xs:boolean">
        <xsl:sequence select="false()"/>
    </xsl:template>
    
    <!--<xsl:template mode="keep-me" match="*" as="xs:boolean">
      <xsl:sequence select="true()"/>
   </xsl:template>-->
    
    <xsl:template mode="keep-me" match="*" as="xs:boolean">
        <xsl:variable name="shallowest" select="min(key('surrogates-by-name',@name)/count(ancestor-or-self::*))"/>
        <xsl:sequence select=". is key('surrogates-by-name',@name)[count(ancestor-or-self::*)=$shallowest][1]"/>
    </xsl:template>
    
<!-- Fields become scalars except when they have flags showing: in the JSON, flags for json-key are shown as labels not values;
     fields with flags for json values (json-value-key/@flag-name) are objects even if they could otherwise be reduced to scalars. -->
    <xsl:template mode="json-object" match="define-assembly |
        define-field[exists(flag[(@name|@ref) != ../json-key/@flag-name ])]">OBJECT</xsl:template>
    
   <xsl:template mode="json-object" match="*">
        <xsl:param name="maxOccurs" select="'1'"/>
        <xsl:choose>
            <xsl:when test="$maxOccurs = '1'">SCALAR</xsl:when>
            <xsl:otherwise>ARRAY</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--<xsl:template mode="json-object" match="model//field[empty(group-as)] | model//assembly[empty(group-as)]">
        <xsl:apply-templates select="key('definitions', @ref)" mode="json-object">
            <xsl:with-param name="maxOccurs" select="(@max-occurs,'1')[1]"></xsl:with-param>
        </xsl:apply-templates>
    </xsl:template>-->
    
    
    <!--<xsl:template mode="json-object" priority="1" match="define-field[empty(flag[not(@name|@ref=../json-key/@flag-name)])]">STRING</xsl:template>-->
    
    <xsl:template match="define-assembly | define-field" mode="build">
        <xsl:param name="minOccurs" select="'0'"/>
        <xsl:param name="maxOccurs" select="'1'"/>
        <xsl:param name="group-name" select="()"/>
        <xsl:param name="group-json" select="()"/>
        <xsl:param name="group-xml" select="()"/>
        <xsl:param name="in-xml" select="()"/>
        <xsl:param name="visited" select="()" tunnel="true"/>
        <xsl:variable name="type" select="replace(local-name(),'^define\-','')"/>
        
        <xsl:element name="m:{ $type }" namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0">
            <xsl:apply-templates select="@*" mode="build"/>
            <xsl:attribute name="min-occurs" select="$minOccurs"/>
            <xsl:attribute name="max-occurs" select="$maxOccurs"/>
            <xsl:attribute name="json-type">
                <xsl:apply-templates select="." mode="json-object">
                    <xsl:with-param name="maxOccurs" select="$maxOccurs"/>
                </xsl:apply-templates>
            </xsl:attribute>
            <xsl:for-each select="$in-xml"><!-- UNWRAPPED or WITH_WRAPPER - supports unwrapped markup-multiline fields -->
                <xsl:attribute name="in-xml" select="."/>
            </xsl:for-each>
            <xsl:for-each select="$group-xml"><!-- GROUPED or UNGROUPED - introduces a grouping element for the group -->
                <xsl:attribute name="group-xml" select="."/>
            </xsl:for-each>
            <xsl:for-each select="$group-json"><!-- ARRAY (default), SINGLETON_OR_ARRAY, BY_KEY --> 
                <xsl:attribute name="group-json" select="."/>
            </xsl:for-each>
            
            <xsl:apply-templates select="json-key, json-value-key" mode="build"/>
            <xsl:for-each select="$group-name">
                <xsl:attribute name="group-name" select="."/>
            </xsl:for-each>
            <xsl:if test="not(@name = $visited)">
                    <xsl:apply-templates select="flag" mode="build"/>
                    <xsl:apply-templates select="model" mode="build">
                        <xsl:with-param name="visited" tunnel="true" select="$visited, string(@name)"/>
                    </xsl:apply-templates>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    
    <xsl:template mode="build" match="json-value-key[matches(@flag-name,'\S')]">
        <xsl:attribute name="json-value-flag" select="@flag-name"/>
    </xsl:template>
    
    <xsl:template mode="build" match="json-value-key">
        <xsl:attribute name="{ local-name() }" select="."/>
    </xsl:template>
    
    <xsl:template mode="build" match="json-key">
        <xsl:attribute name="json-key-flag" select="@flag-name"/>
    </xsl:template>
    
    <xsl:template match="@module | @ref" mode="build"/>
    
    <xsl:template match="@*" mode="build">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="flag" mode="build">
        <m:flag max-occurs="1" min-occurs="{if (@required='yes') then 1 else 0}" json-type="SCALAR">
            <xsl:attribute name="name" select="(@name,@ref)[1]"/>
            <xsl:attribute name="link" select="(@ref,../@name)[1]"/>
            <xsl:apply-templates select="@*" mode="build"/>
        </m:flag>
    </xsl:template>
    
    <xsl:template match="text()" mode="build"/>
    
    <xsl:template mode="build" match="model//field | model//assembly">
        <xsl:apply-templates mode="build" select="key('definitions', @ref)">
            <xsl:with-param name="minOccurs" select="(@min-occurs,'0')[1]"/>
            <xsl:with-param name="maxOccurs" select="(@max-occurs,'1')[1]"/>
            <xsl:with-param name="group-name" select="group-as/@name"/>
            <xsl:with-param name="group-json" select="group-as/@in-json"/>
            <xsl:with-param name="group-xml" select="group-as/@in-xml"/>
            <xsl:with-param name="in-xml" select="@in-xml"/>
        </xsl:apply-templates>
    </xsl:template>
    
    <!--<xsl:template mode="build" match="description | remarks">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="build" match="*">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>-->
    
    
    <!-- Returns true when a field must become an object, not a string, due to having
     flags that must be properties. -->
    <xsl:function name="m:has-properties" as="xs:boolean">
        <xsl:param name="who" as="element(m:field)"/>
        <xsl:sequence select="exists($who/flag[not((@name|@ref)=../(json-key | json-value-key)/@flag-name)])"/>
    </xsl:function>
    
    <xsl:template mode="occurrence-code" match="*">
        <xsl:variable name="minOccurs" select="(@min-occurs,'0')[1]"/>
        <xsl:variable name="maxOccurs" select="(@max-occurs,'1')[1] ! (if (. eq 'unbounded') then '&#x221e;' else .)"/>
        <xsl:text>[</xsl:text>
        <xsl:choose>
            <xsl:when test="$minOccurs = $maxOccurs" expand-text="true">{ $minOccurs }</xsl:when>
            <xsl:when test="number($maxOccurs) = number($minOccurs) + 1" expand-text="true">{ $minOccurs } or { $maxOccurs }</xsl:when>
            <xsl:otherwise expand-text="true">{ $minOccurs } to { $maxOccurs }</xsl:otherwise>
        </xsl:choose>
        <xsl:text>]</xsl:text>
    </xsl:template>
        
    
    <xsl:template mode="occurrence-requirements" match="*">
            <xsl:apply-templates select="@min-occurs" mode="#current"/>
            <xsl:if test="empty(@min-occurs)">optional</xsl:if>
            <xsl:text>, </xsl:text>
            <xsl:apply-templates select="@max-occurs" mode="#current"/>
            <xsl:if test="empty(@max-occurs)">one only</xsl:if>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" priority="2" match="*[@max-occurs='1' and @min-occurs='1']">
        <xsl:text>required, one (1) only</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" priority="1" match="*[@max-occurs=@min-occurs]">
        <xsl:text expand-text="true">required, exactly { m:spell-number(@min-occurs) }</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@min-occurs[.='0']">
        <xsl:text>optional</xsl:text>
    </xsl:template>
    
    <!--<xsl:template mode="occurrence-requirements" match="@min-occurs[empty(../@max-occurs) or ../@max-occurs='1']">
        <xsl:text>required</xsl:text>
    </xsl:template>-->
    
    <xsl:template mode="occurrence-requirements" match="@min-occurs">
        <xsl:text>required, at least </xsl:text>
        <xsl:value-of select="m:spell-number(.)"/>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@max-occurs[.='unbounded']">
        <xsl:text>as many as needed</xsl:text>
    </xsl:template>
    
    <xsl:template mode="occurrence-requirements" match="@max-occurs[.='1']"> one only</xsl:template>
        
    <xsl:template mode="occurrence-requirements" match="@max-occurs">
        <xsl:text expand-text="true">{ m:spell-number(.) } at most</xsl:text>
    </xsl:template>

    <xsl:function name="m:spell-number" as="xs:string">
        <xsl:param name="no" as="xs:integer"/>
        <xsl:variable name="num-year-string" select="format-number($no,'0001') || '-01-01'"/>
        <xsl:value-of>
            <xsl:sequence select="format-date(xs:date($num-year-string), '[Yw]')"/>
            <xsl:text expand-text="true"> ({ $no })</xsl:text>
        </xsl:value-of>
    </xsl:function>

    <xsl:function name="m:indefinite-article" as="xs:string">
        <xsl:param name="noun"/>
        <xsl:value-of>
            <xsl:text>a</xsl:text>
            <xsl:if test="matches($noun,'^[aeiouAEIOU]')"/>
        </xsl:value-of>
    </xsl:function>
    
    <xsl:template match="node() | @*" mode="elaborate truncate">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*" mode="elaborate"/>
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template mode="elaborate" match="html:div[contains-token(@class,'OM-entry')][exists(*[2])]" xmlns="http://www.w3.org/1999/xhtml">
        <xsl:variable name="localID" select="generate-id(.)"/>
        <xsl:variable name="open-me" select="contains-token(@class,'open')"/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:attribute name="id" select="$localID"/>
            <div class="collapsed{ ' hide_me'[$open-me] }">
                <xsl:apply-templates mode="truncate">
                    <xsl:with-param tunnel="true" name="whose" select="$localID"/>
                    <xsl:with-param tunnel="true" name="state" as="xs:string">collapsed</xsl:with-param>
                </xsl:apply-templates>
            </div>
            <div class="expanded{ ' hide_me'[not($open-me)] }">
                <xsl:apply-templates mode="elaborate">
                    <xsl:with-param tunnel="true" name="whose" select="$localID"/>
                    <xsl:with-param tunnel="true" name="state" as="xs:string">expanded</xsl:with-param>
                </xsl:apply-templates>
            </div>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="html:div/*" mode="truncate">
        <xsl:param tunnel="true" name="whose"/>
        <xsl:if test="position() eq 1">
            <xsl:variable name="two-ps" as="element()*">
                <xsl:apply-templates select="." mode="elaborate"/>
                <xsl:apply-templates select="../html:p[last()] except ." mode="elaborate"/>
            </xsl:variable>
            <xsl:for-each select="$two-ps[1]">
                <xsl:copy>
                    <xsl:copy-of select="@*"/>
                    <xsl:for-each select="$two-ps">
                        <xsl:apply-templates mode="elaborate"/>
                        <xsl:if test="position() eq 1">
                            <a class="expander-collapser" href="javascript:switch_view('{$whose}','hide_me')"> &#8230; </a>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:copy>
            </xsl:for-each>
            
        </xsl:if>
    </xsl:template>
    
<!-- span with class 'OM-view-switcher' is inserted upstream -->
    <xsl:template mode="elaborate truncate" match="html:span[contains-token(@class,'OM-view_switcher')]">
        <xsl:param tunnel="true" name="whose"/>
        <xsl:param tunnel="true" name="state"/>
        <a class="expander-collapser" href="javascript:switch_view('{$whose}','hide_me')">
            <xsl:choose>
                <xsl:when test="$state = 'collapsed'">+</xsl:when>
                <xsl:when test="$state = 'expanded'">-</xsl:when>
                <xsl:otherwise>.</xsl:otherwise>
            </xsl:choose>
        </a>
        <xsl:text> </xsl:text>
    </xsl:template>
    
    
</xsl:stylesheet>