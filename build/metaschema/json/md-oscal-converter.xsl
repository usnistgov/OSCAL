<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:m="http://csrc.nist.gov/ns/oscal/1.0/md-convertor"
    exclude-result-prefixes="xs m"
    version="3.0">

    <xsl:output indent="yes"/>

    <xsl:param name="target-ns" as="xs:string?">http://csrc.nist.gov/ns/oscal/1.0</xsl:param>

    <xsl:template name="xsl:initial-template" match="/">
        <!--<xsl:copy-of select="$tag-replacements"/>-->
        <!--<xsl:copy-of select="$examples"/>-->
        <xsl:call-template name="parse">
            <xsl:with-param name="markdown-str" select="string($examples)"/>
        </xsl:call-template>
        <!--<xsl:for-each select="$line-example">
            <xsl:apply-templates select="text()" mode="infer-inlines"/>
        </xsl:for-each>-->
    </xsl:template>

    <!-- Markdown pseudoparser in XSLT  -->

<!-- This XSLT processes plain text, parsing markdown into an HTML-flavored XML
     The outer parse processes block levels
     Within lines, a pseudoparser takes over for inlines
     The pseudoparsing approach is to skip parsing by casting directly
       from markdown notational constructs into XML syntax, and then
       attempting to parse that.
       If the attempt succeeds, we deliver the XML.
       If it fails we deliver the text as given.
    The outer parse must be configured by hand.
    The inner parse is table-driven.
    -->

    <!-- Mappings:
        *** becomes <strong><em>
        ** becomes <strong>
        * becomes <em>
        ` becomes <code>
        ~ becomes <sub>
        ^ becomes <sup>
        " becomes <q>
        ()[] becomes <a href>
        ![]() becomes <img alt src>
        
    First, we have to escape characters that will be construed as markup
    i.e. < and & to &lt; and &amp;
    (we can ignore quotes as long as our markup has no attributes only elements)
    -->
    
    <xsl:template name="parse">
        
<!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        -->
        <!-- $str may be passed in, or we can process the current node -->
        <xsl:param name="markdown-str" as="xs:string" required="yes"/>
        <xsl:variable name="str" select="string($markdown-str) => replace('\\n','&#xA;')"/>
        
        <xsl:variable name="starts-with-code"   select="matches($str,'^```')"/>
        
<!-- Blocks is split between code blocks and everything else -->
        <xsl:variable name="blocks">
            <xsl:for-each-group select="tokenize($str, '\n')"
                group-starting-with=".[matches(., '^```')]">
                <xsl:variable name="this-is-code" select="not((position() mod 2) + number($starts-with-code))"/>
                <m:p><!-- Adding an attribute flag when this is a code block, code='code' -->
                    <xsl:if test="$this-is-code">
                        <xsl:variable name="language" expand-text="true"
                            select="(replace(.,'^```','') ! normalize-space(.))[matches(.,'\S')]"/>
                        <xsl:attribute name="code" select="if ($language) then $language else 'code'"/>
                    </xsl:if>
                    <xsl:value-of select="string-join(current-group()[not(matches(., '^```'))],'&#xA;')"/>
                </m:p>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:variable name="rough-blocks">
            <xsl:apply-templates select="$blocks" mode="parse-block"/>
        </xsl:variable>
        <xsl:variable name="flat-structures">
            <xsl:apply-templates select="$rough-blocks" mode="mark-structures"/>
        </xsl:variable>
        <!-- for debugging <xsl:copy-of select="$flat-structures"/>-->
        
        <xsl:variable name="nested-structures">
            <xsl:apply-templates select="$flat-structures" mode="build-structures"/>
        </xsl:variable>
        <!-- for debugging <xsl:copy-of select="$nested-structures"/>-->
        
        <xsl:variable name="fully-marked">
            <xsl:apply-templates select="$nested-structures" mode="infer-inlines"/>
        </xsl:variable>
        
        <xsl:apply-templates select="$fully-marked" mode="cast-ns"/>
        
    </xsl:template>

    <xsl:template match="*" mode="copy mark-structures build-structures infer-inlines">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Matches blocks marked as code  -->
    <xsl:template mode="parse-block" priority="1" match="m:p[exists(@code)]" expand-text="true">
        <xsl:element name="m:pre" namespace="{ $target-ns }">
            <xsl:element name="code" namespace="{ $target-ns }">
                <xsl:for-each select="@code[not(.='code')]">
                    <xsl:attribute name="class">language-{.}</xsl:attribute>
                </xsl:for-each>
                <xsl:value-of select="string(.)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
<!-- outside blocks marked as code, we split wherever we have double LF -->
    <xsl:template mode="parse-block" match="m:p" expand-text="true">
        <xsl:for-each select="tokenize(string(.),'\n\s*\n')[normalize-space(.)]">
            <m:p>
                <xsl:value-of select="replace(.,'^\s*\n','')"/>
            </m:p>
        </xsl:for-each>
    </xsl:template>
    
    <!-- Returns true for a line found to be a table row demarcator -->
    <xsl:function name="m:is-table-row-demarcator" as="xs:boolean">
        <xsl:param name="line" as="xs:string"/>
        <xsl:sequence select="matches($line,'^[\|\-:\s]+$')"/>
    </xsl:function>
    
    <xsl:function name="m:is-table" as="xs:boolean">
        <xsl:param name="line" as="element(m:p)"/>
        <xsl:variable name="lines" select="tokenize($line,'\s*\n')[matches(.,'\S')]"/>
        <xsl:sequence select="(every $l in $lines satisfies matches($l,'^\|')) and (some $l in $lines satisfies m:is-table-row-demarcator($l))"/>
    </xsl:function>
    
    <xsl:template mode="mark-structures" priority="5" match="m:p[m:is-table(.)]">
        <xsl:variable name="rows">
            <xsl:for-each select="tokenize(string(.),'\s*\n')">
                <m:tr>
                    <xsl:value-of select="."/>
                </m:tr>
            </xsl:for-each>
        </xsl:variable>
        <m:table>
           <xsl:apply-templates select="$rows/m:tr" mode="make-row"/>
        </m:table>
    </xsl:template>
    
    <xsl:template match="m:tr[m:is-table-row-demarcator(string(.))]" priority="5" mode="make-row"/>
    
    <xsl:template match="m:tr" mode="make-row">
        <m:tr>
            <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
                <m:td>
                    <xsl:value-of select="."/>
                </m:td>
            </xsl:for-each>
        </m:tr>
    </xsl:template>
    
    <xsl:template match="m:tr[some $f in (following-sibling::tr) satisfies m:is-table-row-demarcator(string($f))]" mode="make-row">
        <m:tr>
            <xsl:for-each select="tokenize(string(.), '\s*\|\s*')[not(position() = (1,last())) ]">
                <m:th>
                    <xsl:value-of select="."/>
                </m:th>
            </xsl:for-each>
        </m:tr>
    </xsl:template>
    
    <xsl:template mode="mark-structures" match="m:p[matches(.,'^#')]">
        <!-- 's' flag is dot-matches-all, so \n does not impede -->
        <m:p header-level="{ replace(.,'[^#].*$','','s') ! string-length(.) }">
            <xsl:value-of select="replace(.,'^#+\s*','') ! replace(.,'\s+$','')"/>
        </m:p>
    </xsl:template>
        
    <xsl:variable name="li-regex" as="xs:string">^\s*(\*|\d+\.)\s</xsl:variable>
    
    <xsl:template mode="mark-structures" match="m:p[matches(.,$li-regex)]">
        <m:list>
            <xsl:for-each-group group-starting-with=".[matches(.,$li-regex)]" select="tokenize(., '\n')">
                <m:li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}"
                    type="{ if (matches(.,'\s*\d')) then 'ol' else 'ul' }">
                    <xsl:for-each select="current-group()[normalize-space(.)]">
                        <xsl:if test="not(position() eq 1)"><m:br/></xsl:if>
                        <xsl:value-of select="replace(., $li-regex, '')"/>
                    </xsl:for-each>
                </m:li>
            </xsl:for-each-group>
        </m:list>
    </xsl:template>
    
    <!-- Bulleted lists begin with '* ' following spaces. -->
    <!--<xsl:template mode="mark-lists" match="p[matches(.,'^\s*\*')]">
        <ul>
            <xsl:for-each-group group-starting-with=".[matches(.,'^\s*\*')]" select="tokenize(., '\n')">
                <li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}">
                    <xsl:for-each select="current-group()">
                        <xsl:if test="not(position() eq 1)"><br/></xsl:if>
                        <xsl:value-of select="replace(., '^\s*\*?\s+', '')"/>
                    </xsl:for-each>
                </li>
            </xsl:for-each-group>
        </ul>
    </xsl:template>-->

    <!-- Numbered lists start with a numeral + '. ' following spaces --> 
    <!--<xsl:template mode="mark-lists" match="p[matches(.,'^\s*\d\d*\.')]">
        <ol>
            <xsl:for-each-group group-starting-with=".[matches(.,'^\s*\d\d*\.')]" select="tokenize(., '\n')">
                <li level="{ replace(.,'\S.*$','') ! floor(string-length(.) div 2)}">
                    <xsl:for-each select="current-group()">
                        <xsl:if test="not(position() eq 1)"><br/></xsl:if>
                        <xsl:value-of select="replace(., '^\s*\d\d*\.?\s+', '')"/>
                    </xsl:for-each>
                </li>
            </xsl:for-each-group>
        </ol>
    </xsl:template>-->
    
    <xsl:template mode="build-structures" match="m:p[@header-level]">
        <xsl:variable name="level" select="(@header-level[6 >= .],6)[1]"/>
        <xsl:element name="m:h{$level}" namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
    <!-- to test: mixed list types. -->
    <xsl:template mode="build-structures" match="m:list" name="nest-lists">
        <!-- Starting at level 0 and grouping  -->
        <!--        -->
        <xsl:param name="level" select="0"/>
        <xsl:param name="group" select="m:li"/>

        <xsl:variable name="this-type" select="$group[1]/@type"/>
         <!--first, splitting ul from ol groups -->
        <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level and not(@type = preceding-sibling::*[1]/@type)]">-->    
        <!--<xsl:for-each-group select="$group" group-starting-with="*[@level = $level]">-->    
        <xsl:element name="m:{ $group[1]/@type }" namespace="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
            <xsl:for-each-group select="$group" group-starting-with="m:li[(@level = $level) or not(@type = preceding-sibling::*[1]/@type)]">
                <xsl:choose>
                    <xsl:when test="@level = $level (: checking first item in group :)">
                        <m:li>
                            <!--<xsl:copy-of select="@level"/>-->
                            <xsl:apply-templates mode="copy"/>
                            <xsl:if test="current-group()/@level > $level (: go deeper? :)">
                                <xsl:call-template name="nest-lists">
                                    <xsl:with-param name="level" select="$level + 1"/>
                                    <xsl:with-param name="group" select="current-group()[@level > $level]"/>
                                </xsl:call-template>
                            </xsl:if>
                        </m:li>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- fallback for skipping levels -->
                            <m:li>
                                <!-- level="{$level}"-->
                                <xsl:call-template name="nest-lists">
                                    <xsl:with-param name="level" select="$level + 1"/>
                                    <xsl:with-param name="group" select="current-group()"/>
                                </xsl:call-template>
                            </m:li>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
        </xsl:element>
        <!--</xsl:for-each-group>-->
    </xsl:template>

    <xsl:template match="m:pre//text()" mode="infer-inlines">
        <xsl:copy-of select="."/>
    </xsl:template>
        
    <xsl:template match="text()" mode="infer-inlines">
        <xsl:variable name="markup">
            <xsl:apply-templates select="$tag-replacements/m:rules">
                <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:try select="parse-xml-fragment($markup)">
            <xsl:catch select="."/>
        </xsl:try>
    </xsl:template>
    
     
    <xsl:template mode="cast-ns" match="*">
        <xsl:element name="{local-name()}" namespace="{ $target-ns }">
            <xsl:copy-of select="@*[matches(.,'\S')]"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>


    <!-- Match 'rules' passing in $original to receive original back
        as a fully-replaced string. -->
    <xsl:template match="m:rules" as="xs:string">

        <!-- Original is only provided for processing text nodes -->
        <xsl:param name="original" as="text()?" tunnel="yes"/>
        <xsl:param name="starting" as="xs:string" select="string($original)"/>
        <xsl:iterate select="*">
            <xsl:param name="original" select="$original" as="text()?"/>
            <xsl:param name="str" select="$starting" as="xs:string"/>
            <xsl:on-completion select="$str"/>
            <xsl:next-iteration>
                <xsl:with-param name="str">
                    <xsl:apply-templates select=".">
                        <xsl:with-param name="str" select="$str"/>
                    </xsl:apply-templates>
                </xsl:with-param>
            </xsl:next-iteration>
        </xsl:iterate>
    </xsl:template>

    <xsl:template match="m:replace" expand-text="true">
        <xsl:param name="str" as="xs:string"/>
        <!--<xsl:value-of>replace({$str},{@match},{string(.)})</xsl:value-of>-->
        <xsl:sequence select="replace($str, @match, string(.))"/>
        <!--<xsl:copy-of select="."/>-->
    </xsl:template>

    <xsl:variable name="tag-replacements" xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
        <rules>
            <!-- first, literal replacements -->
            <replace match="&amp;"  >&amp;amp;</replace>
            <replace match="&lt;"   >&amp;lt;</replace>
            <!-- next, explicit escape sequences -->
            <replace match="\\&quot;">&amp;quot;</replace>
            <!--<replace match="\\&#39;">&amp;apos;</replace>-->
            <replace match="\\\*"   >&amp;#x2A;</replace>
            <replace match="\\`"    >&amp;#x60;</replace>
            <replace match="\\~"    >&amp;#x7E;</replace>
            <replace match="\\^"    >&amp;#x5E;</replace>
            
            <!-- then, replacements based on $tag-specification -->
            <xsl:for-each select="$tag-specification/*">
                <xsl:variable name="match-expr">
                    <xsl:apply-templates select="." mode="write-match"/>
                </xsl:variable>
                <xsl:variable name="repl-expr">
                    <xsl:apply-templates select="." mode="write-replace"/>
                </xsl:variable>
                
                <replace match="{$match-expr}">
                    <xsl:sequence select="$repl-expr"/>
                </replace>
                
            </xsl:for-each>
        </rules>
    </xsl:variable>
    
    

    <xsl:variable name="tag-specification" as="element(m:tag-spec)" xmlns="http://csrc.nist.gov/ns/oscal/1.0/md-convertor">
        <tag-spec>
            <!-- The XML notation represents the substitution by showing both delimiters and tags  -->
            <!-- Note that text contents are regex notation for matching so * must be \* -->
            
            <q>"<text/>"</q>
            
            <img         alt="!\[{{$noclosebracket}}\]" src="\({{$nocloseparen}}\)"/>
            <insert param-id="\{{\{{{{$nws}}\}}\}}"/>
            
            <a href="\[{{$nocloseparen}}\]">\(<text not="\)"/>\)</a>
            <code>`<text/>`</code>
            <strong>
                <em>\*\*\*<text/>\*\*\*</em>
            </strong>
            <strong>\*\*<text/>\*\*</strong>
            <em>\*<text/>\*</em>
            <sub>~<text/>~</sub>
            <sup>\^<text/>\^</sup>
        </tag-spec>
    </xsl:variable>
    
    <xsl:template match="*" mode="write-replace">
        <!-- we can write an open/close pair even for an empty element b/c
             it will be parsed and serialized -->
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
        <!-- coercing the order to ensure correct formation of regegex       -->
        <xsl:apply-templates mode="#current" select="@*"/>
        <xsl:text>&gt;</xsl:text>

        <xsl:apply-templates mode="#current" select="*"/>

        <xsl:text>&lt;/</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="*" mode="write-match">
        <xsl:apply-templates select="@*, node()" mode="write-match"/>
    </xsl:template>
    
    <xsl:template match="@*[matches(., '\{\$text\}')]" mode="write-match">
        <xsl:value-of select="replace(., '\{\$text\}', '(.*)?')"/>
    </xsl:template>
    
    <xsl:template match="@*[matches(., '\{\$nocloseparen\}')]" mode="write-match">
        <xsl:value-of select="replace(., '\{\$nocloseparen\}', '([^\\(]*)?')"/>
    </xsl:template>
    
    <xsl:template match="@*[matches(., '\{\$noclosebracket\}')]" mode="write-match">
        <xsl:value-of select="replace(., '\{\$noclosebracket\}', '([^\\[]*)?')"/>
    </xsl:template>
    
    <xsl:template match="@*[matches(., '\{\$nws\}')]" mode="write-match">
        <!--<xsl:value-of select="."/>-->
        <!--<xsl:value-of select="replace(., '\{\$nws\}', '(\S*)?')"/>-->
        <xsl:value-of select="replace(., '\{\$nws\}', '\\s*(\\S+)?\\s*')"/>
    </xsl:template>
    
    <xsl:template match="m:text" mode="write-replace">
        <xsl:text>$1</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:insert/@param-id" mode="write-replace">
        <xsl:text> param-id='$1'</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:a/@href" mode="write-replace">
        <xsl:text> href='$2'</xsl:text>
        <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
    </xsl:template>
    
    <xsl:template match="m:img/@alt" mode="write-replace">
        <xsl:text> alt='$1'</xsl:text>
        <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
    </xsl:template>
    
    <xsl:template match="m:img/@src" mode="write-replace">
        <xsl:text> src='$2'</xsl:text>
        <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
    </xsl:template>
    
    <xsl:template match="m:text" mode="write-match">
        <xsl:text>(.*?)</xsl:text>
    </xsl:template>
    
    <xsl:template match="m:text[@not]" mode="write-match">
        <xsl:text expand-text="true">([^{ @not }]*?)</xsl:text>
    </xsl:template>
    
    <!--<xsl:template match="m:text" mode="write-match">
        <xsl:variable name="match-char"
            select="if (matches(@not,'\S')) then ('[' || @not || ']') else '.'"/>
        <xsl:text expand-text="true">({ $match-char }*?)</xsl:text>
    </xsl:template>-->
    
    <xsl:variable name="line-example" xml:space="preserve"> { insertion } </xsl:variable>
    
     <xsl:variable name="examples" xml:space="preserve">
        <p>**Markdown** and even " quoted text" and **more markdown**</p>
        <p>

Just a plain old \* star, and another \* ...

See the FedRAMP Documents page under Key Cloud Service Provider (CSP) Documents, Plan of Action &amp; Milestones (POA&amp;M) Template Completion Guide [https://www.fedramp.gov/documents/](https://www.fedramp.gov/documents/)
 
Paragraph, \n\nand new paragraph
            
## My test file!   has an &amp; ampersand         

Bit of `code` here and there, such as one might have along with *italics*.

no insertion here: { ac-4.4_prm_2 } 

An anchor looks like [this](this.file) or  [that](that.file)
 
Extra long x
            y and z **strong** and **bold**
            

Here's a text with a *parameter* insertion: {{ insert }}

{{insert-me}}            

And interesting.

And many paragraphs!

* One item in a list, with "quoted text"
* Another item in a list
  * Sublist
    * subsublist
* Item three

```xml
&lt;xsl:for-each ...

... select ...>
```

Some paragraphs have ![images](http://www.links.com) in them, sometimes ![many](../many/links)

And Prose!

```
and more code
```

2. List okay
  2. sublist 1
  2. sublist 2
    with more text
2. More list okay

    * Broken list
  * What?
* Levels missing

* something or other

And stuff.

        </p>
        <p>Here's a markdown string.</p>

         <p>This `string should *break` (overlap)*</p>
        
         <p>`code` may occasionally turn up `in the middle`.</p>
        
         <p>Here's a ***really interesting*** markdown string.</p>
        
         <p>Some paragraphs might have [links elsewhere](https://link.org).</p>
    </xsl:variable>
    
</xsl:stylesheet>