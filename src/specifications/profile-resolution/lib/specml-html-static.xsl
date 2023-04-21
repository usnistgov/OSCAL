<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
    version="3.0"
    expand-text="true">

    <xsl:import href="specml-html-xslt1.xsl"/>

    <xsl:output method="xhtml" html-version="5.0" use-character-maps="html-safe"/>

    <xsl:character-map name="html-safe">
        <xsl:output-character character=">" string=">" />
    </xsl:character-map>

    <xsl:template match="SPECIFICATION">
        <html>
            <head>
                <title>{ child::head } Specification</title>
                <xsl:call-template name="css"/>
            </head>
            <body>
            <aside class="toc">
                <h3>{ child::head } Specification</h3>
                <xsl:call-template name="toc"/>
            </aside>
                <main>
                    <xsl:apply-templates/>
                </main>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="css">
        <xsl:variable name="display-font" as="xs:string"> 'Corbel', sans-serif </xsl:variable>
        <style type="text/css">

body {{ line-height: 140%; font-family: "Cambria", serif }}

* {{ box-sizing: border-box }}

aside.toc {{ position: fixed; overflow-y: scroll; max-width: 36%; top: 1em; bottom: 0px; font-family: { $display-font } }}
.toc ul   {{ list-style: none; padding-left: 1em }}

main      {{ margin-left: 40%; max-width: 48em }}

details {{ margin-top: 1.5em }}

details details {{ margin-left: 2em; border-left: thin solid black; padding-left: 1em }}

summary > * {{ display: inline }}

pre {{ white-space:  pre-wrap }}

h1, h2, h3, h4, h5, h6 {{  font-family: { $display-font } }}

code.src {{ font-size:90%; font-weight:bold; background-color: lightsteelblue; padding: 0.2em }}
code.tgt {{ font-size:90%; font-weight:bold; background-color: lemonchiffon; padding: 0.2em }}
b.term, b.xpath {{ font-family: { $display-font } }}

.secnum {{ padding: 0.2em; color: midnightblue; font-weight: bold; font-size: 110% }}

a {{ color: inherit }}
a.linked {{ color: inherit }}
.toc a {{ text-decoration: none }}


.example {{ padding: 0.5em; border: thin dotted black; margin-top: 1em  }}
.example > *:first-child {{ margin-top: 0em }}

.example.source_profile-tagging {{  background-color: lightsteelblue }}
.example.source_catalog-tagging {{  background-color: powderblue }}
.example.target_catalog-tagging {{  background-color: lemonchiffon }}

.revisit {{ font-style: italic; color: red; background-color: yellow }}

.xref {{ font-weight: bold; font-family: { $display-font } }}

        </style>
    </xsl:template>


    <xsl:template name="toc">
        <ul>
            <xsl:apply-templates mode="toc" select="section"/>
        </ul>
    </xsl:template>

    <xsl:template mode="toc" match="*"/>

    <xsl:template mode="toc" match="head">
        <a href="#{generate-id(.)}-head">
            <xsl:apply-templates select="." mode="header-text"/>
        </a>
    </xsl:template>

    <xsl:template mode="toc" match="section">
        <li>
            <xsl:apply-templates select="head" mode="toc"/>
            <xsl:for-each-group select="section" group-by="true()">
                <ul>
                    <xsl:apply-templates mode="toc" select="current-group()"/>
                </ul>
            </xsl:for-each-group>
        </li>
    </xsl:template>

    <xsl:template match="head" mode="header-text">
        <span class="secnum">
          <xsl:number level="multiple" count="section" format="1.1"/>
        </span>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="section">
        <details open="open">
            <summary>
                <xsl:apply-templates select="head"/>
            </summary>
            <xsl:apply-templates select="* except head"/>
        </details>
    </xsl:template>

    <xsl:template match="cf">
        <details style="border: thin solid black; padding: 0.5em">
            <summary>
                <xsl:next-match/>
            </summary>
            <pre class="cf">
               <xsl:variable name="cleaned-up-sample">
                   <xsl:apply-templates mode="cleanup-sample" select="document(@file, /)"/>
               </xsl:variable>
               <xsl:sequence select="serialize($cleaned-up-sample)"/>
      </pre>
        </details>
    </xsl:template>

    <xsl:template match="mapping">
      <xsl:apply-templates/>
        <xsl:for-each select="attribute::unit-test">
            <p class="unit-test">Unit test: <a href="{.}">{ . }</a></p>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tagging" mode="tagging-label">
        <h4 class="label">Source data:</h4>
    </xsl:template>

    <xsl:template match="tagging[@whose='target_catalog']" mode="tagging-label">
        <h4 class="label">Target (catalog):</h4>
    </xsl:template>

    <xsl:template match="tagging[@whose='source_catalog']" mode="tagging-label">
        <h4 class="label">Source (catalog):</h4>
    </xsl:template>

    <xsl:template match="tagging[@whose='source_profile']" mode="tagging-label">
        <h4 class="label">Source (profile):</h4>
    </xsl:template>

    <xsl:template match="tagging">
        <div class="{@whose}-tagging example">
            <xsl:apply-templates select="." mode="tagging-label"/>
         <xsl:next-match/>
        </div>
    </xsl:template>

    <xsl:template match="xsi:* | @xsi:*" mode="cleanup-sample" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/>

    <xsl:template match="* | @*" mode="cleanup-sample">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates select="@* | node()" mode="#current"/>
        </xsl:copy>
    </xsl:template>

</xsl:stylesheet>
