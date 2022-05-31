<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">
    
<!--    For a profile, produces an HTML with views of sources and resolution result.
    
    Resolution results are read from `output-expected`
    (but they could be generated dynamically)
    -->
    
<!-- Limitations:
    Reads only catalogs as imports, not profiles
    Display is optimized for SP800-53/B case
      nested parts not shown in patches
      doesn't handle glob matching
      doesn't match remove except by @id
      
    -->
    <xsl:strip-space elements="*"/>
     
     <xsl:output method="html" html-version="5"/>
    
    
     
    <xsl:template match="/">
         <html>
             <head>
                 <xsl:call-template name="style"/>
             </head>
             <body>
                 <section id="import-maps">
                     <xsl:apply-templates select="*/child::import" mode="show-import"/>
                 </section>
                 <section id="profile-map">
                     <xsl:apply-templates select="*" mode="show-profile"/>
                 </section>
                 <section id="result-map">
                     <xsl:apply-templates select="*" mode="show-result"/>
                 </section>
             </body>
         </html>
     </xsl:template>
    
    <xsl:template match="import[starts-with(@href,'#')]" mode="show-import">
        <xsl:apply-templates select="." mode="head"/>
        <xsl:variable name="imported" select="key('cross-reference',@href)/rlink[ends-with(@href,'.xml') or matches(@media-type,'xml')][1]/@href"/>
        <xsl:call-template name="draw-import">
            <xsl:with-param name="href" select="$imported"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="import" mode="show-import">
        <xsl:apply-templates select="." mode="head"/>
        <xsl:call-template name="draw-import">
            <xsl:with-param name="href" select="@href"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="draw-import" expand-text="true">
        <xsl:param name="href" required="yes"/>
        <xsl:choose>
            <xsl:when test="doc-available(resolve-uri($href,document-uri(/)))">
                <xsl:for-each select="document($href)">
                    <h4>In { name(child::*) }<code> { $href }</code></h4>
                    <div class="docmap">
                        <xsl:apply-templates mode="drawtree"/>
                    </div>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise expand-text="true">
                <h5 style="font-style:italic">No document found at { $href }</h5>
            </xsl:otherwise>
        </xsl:choose>
        
        
    </xsl:template>
    
    
    <xsl:template match="import" mode="head" expand-text="true">
        <h3>Importing <code>{ @href }</code></h3>
    </xsl:template>
    
    
    
    <xsl:key name="cross-reference" match="resource" use="'#' || @id"/>
    <xsl:key name="cross-reference" match="resource" use="'#' || @uuid"/>
    
    <xsl:template match="profile" mode="show-profile" expand-text="true">
        <h3>Profile <code>{ document-uri(/) => replace('.*/','') }</code></h3>
        <div class="docmap">
            <xsl:apply-templates select="." mode="drawtree"/>
        </div>
    </xsl:template>
    
    <xsl:template match="profile" mode="show-result" expand-text="true">
        <xsl:variable name="where">{ /document-uri(.) }</xsl:variable>
        <xsl:variable name="resolvedname">{ $where => replace('.+/','') => replace('\.xml$','_RESOLVED.xml') }</xsl:variable>
        <xsl:variable name="resultpath">output-expected/{ $resolvedname }</xsl:variable>
        <h3>Result <code>{ $resultpath }</code></h3>
        <div class="docmap">
            <xsl:apply-templates select="document($resultpath,/)" mode="drawtree"/>
        </div>
    </xsl:template>
    
    <xsl:template match="metadata" mode="drawtree"/>
    
    <xsl:template match="back-matter" mode="drawtree"/>
    
    <xsl:template match="title | prop | link | param/*" mode="drawtree"/>
    
    <xsl:template match="set-parameter/*" mode="drawtree"/>
    
    <xsl:template match="text()" mode="drawtree"/>
    
    <xsl:template match="*" mode="drawtree">
        <details class="element" open="open">
            <summary>
            <div class="eflex">
                <xsl:apply-templates select="." mode="tag"/>
                <xsl:apply-templates select="." mode="contents"/>
            </div>
            </summary>
            <xsl:apply-templates mode="#current"/>
        </details>
    </xsl:template>
    
    <xsl:template match="param | part | *[empty(child::*)] | add | remove | set-parameter" priority="-0.1" mode="drawtree">
        <div class="element">
            <div class="eflex">
                <xsl:apply-templates select="." mode="tag"/>
                <xsl:apply-templates select="." mode="contents"/>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="*" mode="contents">
        <xsl:where-populated>
            <div class="cnts">
                <xsl:apply-templates select="@*" mode="contents"/>
            </div>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:template match="param | set-parameter | add"  mode="contents">
        <xsl:where-populated>
            <div class="cnts">
                <xsl:apply-templates select="*" mode="#current"/>
            </div>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:template match="group | control"  mode="contents">
        <xsl:where-populated>
            <div class="cnts">
                <xsl:apply-templates select="title" mode="contents"/>
            </div>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:template match="part"  mode="contents">
        <xsl:where-populated>
            <div class="cnts">
                <xsl:apply-templates select="descendant::insert" mode="contents"/>
            </div>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:template match="param/* | set-parameter/* | add/* | insert | title" mode="contents">
        <xsl:where-populated>
            <div class="cnts-row">
                <xsl:apply-templates select="." mode="tag"/>
            </div>
        </xsl:where-populated>
    </xsl:template>
    
    <xsl:template match="@*" mode="contents" expand-text="true"/>
    
    <xsl:template match="*" mode="tag" expand-text="true">
        <p class="tag">{ name() }</p>
    </xsl:template>
    
    <xsl:template match="profile | profile//*" priority="-0.1" mode="tag" expand-text="true">
        <p class="tag drctv">{ name() }</p>
    </xsl:template>
    
    <xsl:template match="import" mode="tag" expand-text="true">
        <p class="tag drctv">
            <xsl:text>import</xsl:text>
            <span class="flag">
                <xsl:apply-templates select="." mode="get-href"/>
            </span>
        </p>
    </xsl:template>
    
    <!-- support link to resource here -->
    <xsl:template mode="get-href" match="import">
        <xsl:value-of select="@href"/>
    </xsl:template>
    
    <xsl:template match="with-id" mode="tag" expand-text="true">
        <p class="flsb drctv tag ID_{ . }" onclick="flashClass('ID_{ . }')">with-id <span class="flag">{ . }</span></p>
    </xsl:template>
    
    <xsl:template match="set-parameter" mode="tag" expand-text="true">
        <p class="tag drctv flsb ID_{ @param-id }" onclick="flashClass('ID_{ @param-id }')">set-parameter <span class="flag">{ @param-id }</span></p>
    </xsl:template>
    
    <xsl:template match="alter" mode="tag" expand-text="true">
        <p class="flsb drctv tag ID_{ @control-id }" onclick="flashClass('ID_{ @control-id }')">alter <span class="flag">{ @control-id }</span></p>
    </xsl:template>
    
    <xsl:template match="group[exists(@id)]" mode="tag" expand-text="true">
        <p class="flsb tag ID_{ @id }" onclick="flashClass('ID_{ @id }')">{ local-name() } <span class="flag">{ @id }</span></p>
    </xsl:template>
    
    <xsl:template match="control | param" mode="tag" expand-text="true">
        <p class="tag flsb ID_{ @id }" onclick="flashClass('ID_{ @id }')">{ local-name() } <span class="flag">{ @id }</span></p>
    </xsl:template>
    
    <xsl:template match="resource" mode="tag" expand-text="true">
        <p class="tag flsb ID_{ @uuid }" onclick="flashClass('ID_{ @uuid }')">resource <span class="flag">{ @uuid }</span></p>
    </xsl:template>
    
    <xsl:template match="insert" mode="tag" expand-text="true">
        <p class="tag flsb ID_{ @id-ref}" onclick="flashClass('ID_{ @id-ref }')">insert <b>{ @type }</b> <span class="flag">{ @id-ref }</span></p>
    </xsl:template>
    
    <xsl:template match="combine" mode="tag" expand-text="true">
        <p class="tag drctv">combine <span class="flag">{ @method }</span></p>
    </xsl:template>
    
    <xsl:template match="as-is" mode="tag" expand-text="true">
        <p class="tag drctv">{ local-name() } <span class="flag">{ . }</span></p>
    </xsl:template>
    
    <xsl:template match="label | value" mode="tag" expand-text="true">
        <!-- link builds from @id or @param-id of param or set-parameter parent -->
        <xsl:variable name="id">ID_{ parent::*/(@id,@param-id)[1] }-{ local-name(.) }</xsl:variable>
        <p class="flsb tag { $id }" onclick="flashClass('{ $id }')">{ local-name() } <span class="flag">{ . }</span></p>
    </xsl:template>
    
    <xsl:template match="rlink" mode="tag" expand-text="true">
        <p class="tag">rlink <span class="flag">{ @href }</span></p>
    </xsl:template>
    
    <xsl:template match="title" mode="tag" expand-text="true">
        <p class="tag">title <span class="flag"><xsl:apply-templates select="." mode="inline"/></span></p>
    </xsl:template>

    <xsl:template match="prop[@id] | part[@id]" mode="tag" expand-text="true">
        <p class="flsb tag ID_{ @id }" onclick="flashClass('ID_{ @id }')"> { local-name(.) } <b>{ @name }</b> <span class="flag">{ @id }</span> { [1 to count(child::*) ] ! '▮' }</p>
    </xsl:template>
    
    
    <xsl:template match="prop | part" mode="tag" expand-text="true">
        <p class="tag">  { local-name(.) } <b>{ @name }</b><span class="flag">{ @value }</span></p>
    </xsl:template>
  
    <xsl:template match="usage | constraint | guideline | select" mode="tag" expand-text="true">
        <p class="flsb tag">{ local-name() } { (1 to count(child::*)) ! '▮' }</p>
    </xsl:template>
    
    <xsl:template match="include-controls/@with-child-controls" mode="contents" expand-text="true">
        <div class="cnts-row">
            <p class="tag drctv">with child controls <span class="flag">{ . } </span></p>
        </div>
    </xsl:template>
    
    <xsl:template match="remove/@*" mode="contents" expand-text="true">
        <div class="cnts-row">
            <p class="tag drctv">{ replace(local-name(.),'\-',' ') } <span class="flag">{ . } </span></p>
        </div>
    </xsl:template>
    

    <xsl:template name="style" xml:space="preserve">
      <style type="text/css">

body { display: grid; grid-template-columns: 1fr 1fr 1fr;
       grid-column-gap: 1vw;
       font-family: sans-serif }
       
body > section {  border: thin solid black; padding: 0.4em; margin-top: 1em; max-height: 90vh; overflow: auto }

.docmap p { margin: 0em }

.docmap .element { outline: medium solid transparent }
.docmap .element:hover { outline: medium solid #FDD7E4 }

.docmap details.element { padding-left: 1em; margin-top: 0.2em }
.docmap div.element { padding-left: 1em; margin-left: 1em; margin-top: 0.2em }

details.element:not([open]) div.cnts { display: none }

summary { display: list-item; list-style-position: outside; margin-left: 1em }

div.eflex { display: inline-flex; align-items: start; gap:0.2em }

div.eflex > * { flex: initial }

p.tag { display: inline-block; background-color: midnightblue; color: white; padding: 0.4em; border-radius: 0.2em  }
p.tag span.flag { display: inline-block; background-color: white; color: black;
  padding: 0.1em; margin-left: 0.5em; }

div.cnts  p.tag { margin-top:0.2em }
p.tag.drctv { background-color: slategrey }

div.cnts { display: inline-block; font-size: 80% }

p.flsb:hover { background-color: royalblue }

p.tag.ON { transition: background-color 0s, font-size 0.3s ease-out;
      font-size: 120%;
      background-color: steelblue !important }

      h3 code { background-color: gainsboro }

            </style>
            <script type="text/javascript" >
                 function flashClass(elemID) {
                 let ilk = document.getElementsByClassName(elemID);
                 for (let i of ilk) { i.classList.toggle('ON'); }
            }
            </script>
        </xsl:template>
     
</xsl:stylesheet>