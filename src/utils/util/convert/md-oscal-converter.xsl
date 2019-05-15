<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs o"
    version="3.0">

    <xsl:output indent="yes"/>

    <xsl:param name="target-ns" as="xs:string?">urn:booya</xsl:param>
    <!-- TO DO: Headers, tables and numbered lists   -->

    <!-- Markdown pseudoparser in XSLT  -->

    <!-- Mappings:
        *** becomes <strong><em>
        ** becomes <strong>
        * becomes <em>
        ` becomes <code>
        ~ becomes <sub>
        ^ becomes <sup>
        " becomes <q>
        ()[] becomes <a href>
        
        We manage this by casting syntax to tagging, then attempting to parse the tagging (when it is available).
    First, we have to escape characters that will be construed as markup
    i.e. < and & to &lt; and &amp;
    (we can ignore quotes as long as our markup has no attributes only elements)
    
    casting delimiter-string pairs to tags
    trying to parse (eheh) - wf error drops back
      to show raw syntax
    -->

    
    
    
    <xsl:template match="/">
        <xsl:element name="examples" namespace="{$target-ns}">
            <xsl:apply-templates select="$examples/*" mode="parse"/>
        </xsl:element>
    </xsl:template>

    <xsl:template mode="parse" match=".">
        
<!-- First, group according to ``` delimiters btw codeblocks and not
        within codeblock, escape & and < (only)
        within not-codeblock split lines at \n\s*\n
        
        -->
        <xsl:variable name="str" select="string(.)"/>
        <xsl:variable name="starts-with-code" select="matches($str,'^```')"/>
        
        <xsl:variable name="blocks">
            <xsl:for-each-group select="tokenize($str, '\n')"
                group-starting-with=".[matches(., '^```')]">
                <xsl:variable name="this-is-code" select="not((position() mod 2) + number($starts-with-code))"/>
                <p><!-- Adding an attribute flag when this is a code block, code='code' -->
                    <xsl:if test="$this-is-code">
                        <xsl:variable name="language" expand-text="true"
                            select="(replace(.,'^```','') ! normalize-space(.))[matches(.,'\S')]"/>
                        <xsl:attribute name="code" select="if ($language) then $language else 'code'"/>
                    </xsl:if>
                    <xsl:value-of select="string-join(current-group()[not(matches(., '^```'))],'&#xA;')"/>
                </p>
            </xsl:for-each-group>
        </xsl:variable>
        
        <xsl:variable name="rough-blocks">
            <xsl:apply-templates select="$blocks" mode="parse-block"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$rough-blocks"/>-->
        <xsl:variable name="list-blocks">
            <xsl:apply-templates select="$rough-blocks" mode="mark-lists"/>
        </xsl:variable>
        <xsl:variable name="nested-list-blocks">
            <xsl:apply-templates select="$list-blocks" mode="nest-lists"/>
        </xsl:variable>
        
        <xsl:variable name="fully-marked">
            <xsl:apply-templates select="$nested-list-blocks" mode="infer-inlines"/>
        </xsl:variable>
        
        <xsl:apply-templates select="$fully-marked" mode="cast-ns"/>
        
    </xsl:template>

    <xsl:template match="*" mode="copy mark-lists nest-lists infer-inlines">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template mode="parse-block" priority="1" match="p[exists(@code)]" expand-text="true">
        <xsl:element name="pre" namespace="{ $target-ns }">
            <xsl:element name="code" namespace="{ $target-ns }">
                <xsl:for-each select="@code[not(.='code')]">
                    <xsl:attribute name="class">language-{.}</xsl:attribute>
                </xsl:for-each>
                <xsl:value-of select="string(.)"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
<!-- outside blocks marked as code, we have paragraphs and lists -->
    <xsl:template mode="parse-block" match="p" expand-text="true">
        <xsl:for-each select="tokenize(string(.),'\n\s*\n')[normalize-space(.)]">
            <p>
                <xsl:value-of select="replace(.,'(^\s+|\s+$)','')"/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template mode="mark-lists" match="p[matches(.,'^\s*\*')]">
        <ul>
            <xsl:for-each select="tokenize(., '\n')">
                <li level="{ replace(.,'\S.*$','') ! ceiling(string-length(.) div 2)}">
                    <xsl:value-of select="replace(., '^\s*\*\s*', '')"/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template mode="nest-lists" match="ul" name="nest-lists">
        <!-- Starting at level 0 and grouping       -->
        <xsl:param name="level" select="0"/>
        <xsl:param name="group" select="li"/>
        <ul>
            <xsl:for-each-group select="$group" group-starting-with="li[@level = $level]">
                <!-- fallback for skipping levels -->
                <xsl:choose>
                    <xsl:when test="@level = $level (: checking first item in group :)">
                        <xsl:copy>
                            <!--<xsl:copy-of select="@level"/>-->
                            <xsl:apply-templates mode="copy"/>
                            <xsl:if test="current-group()/@level > $level (: go deeper? :)">
                                <xsl:call-template name="nest-lists">
                                    <xsl:with-param name="level" select="$level + 1"/>
                                    <xsl:with-param name="group" select="current-group()[@level > $level]"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:copy>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- fallback for skipping levels -->
                        <ul>
                            <li>
                                <!-- level="{$level}"-->
                                <xsl:call-template name="nest-lists">
                                    <xsl:with-param name="level" select="$level + 1"/>
                                    <xsl:with-param name="group" select="current-group()"/>
                                </xsl:call-template>
                            </li>
                        </ul>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each-group>
        </ul>
    </xsl:template>

    <xsl:template match="pre//text()" mode="infer-inlines">
        <xsl:copy-of select="."/>
    </xsl:template>
        
    <xsl:template match="text()" mode="infer-inlines">
        <xsl:variable name="markup" expand-text="true">
            <xsl:apply-templates select="$tag-replacements/o:rules">
                <xsl:with-param name="original" tunnel="yes" as="text()" select="."/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:try select="parse-xml-fragment($markup)">
            <xsl:catch expand-text="yes" select="."/>
        </xsl:try>
    </xsl:template>
    
     
    <xsl:template mode="cast-ns" match="*">
        <xsl:element name="{local-name()}" namespace="{ $target-ns }">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>


    <!-- Match 'rules' passing in $original to receive original back
        as a fully-replaced string. -->
    <xsl:template match="o:rules" as="xs:string">

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

    <xsl:template match="o:replace" expand-text="true">
        <xsl:param name="str" as="xs:string"/>
        <!--<xsl:value-of>replace({$str},{@match},{string(.)})</xsl:value-of>-->
        <xsl:sequence select="replace($str, @match, string(.))"/>
        <!--<xsl:copy-of select="."/>-->
    </xsl:template>

    <xsl:variable name="tag-replacements" xmlns="http://csrc.nist.gov/ns/oscal/1.0">
        <rules>
            <!-- first, literal replacements -->
            <replace match="&amp;"  >&amp;amp;</replace>
            <replace match="&lt;"   >&amp;lt;</replace>
            <replace match="\\&#34;">&amp;quot;</replace>
            <replace match="\\\*"   >&amp;#2A;</replace>
            <replace match="\\`"    >&amp;#60;</replace>
            <replace match="\\~"    >&amp;#7E;</replace>
            <replace match="\\^"    >&amp;#5E;</replace>
            
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
    
    

    <xsl:variable name="tag-specification" as="element(o:tag-spec)" xmlns="http://csrc.nist.gov/ns/oscal/1.0">
        <tag-spec>
            <!-- The XML notation represents the substitution by showing both delimiters and tags  -->
            <q>"<insert/>"</q>
            <a href="\[{{$insert}}\]">\(<insert/>\)</a>
            <code>`<insert/>`</code>
            <strong>
                <em>\*\*\*<insert/>\*\*\*</em>
            </strong>
            <strong>\*\*<insert/>\*\*</strong>
            <em>\*<insert/>\*</em>
            <sub>~<insert/>~</sub>
            <sup>\^<insert/>\^</sup>
        </tag-spec>
    </xsl:variable>
    
    <xsl:template match="*" mode="write-replace">
        <xsl:text>&lt;</xsl:text>
        <xsl:value-of select="local-name()"/>
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
    
    <xsl:template match="@*[matches(., '\{\$insert\}')]" mode="write-match">
        <xsl:value-of select="replace(., '\{\$insert\}', '(.*)?')"/>
    </xsl:template>
    
    <xsl:template match="o:insert" mode="write-replace">
        <xsl:text>$1</xsl:text>
    </xsl:template>
    
    <xsl:template match="o:a/@href" mode="write-replace">
        <xsl:text> href="$2"</xsl:text>
        <!--<xsl:value-of select="replace(.,'\{\$insert\}','\$2')"/>-->
    </xsl:template>
    
    <xsl:template match="o:insert" mode="write-match">
        <xsl:text>(.*?)</xsl:text>
    </xsl:template>
    
    <xsl:variable name="examples" xml:space="preserve">
        <p>Extra long x
            y and z
            
            
            

And interesting.

And many paragraphs!

* One item in a list
* Another item in a list
  * Sublist
   * subsublist
* Item three

```xml
&lt;xsl:for-each ...

... select ...>
```

And Prose!

```
and more code
```

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