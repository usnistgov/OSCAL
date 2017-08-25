<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:oscal="http://scap.nist.gov/schema/oscal"
  xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="oscal">
  
<!-- A bare-bones OSCAL display suitable for browser rendering or conversion into Markdown.
     Written and optimized for oscal-oscal.xml.
     XSLT 1.0 (so it will run in your browser)
  -->
  
  <xsl:template match="/">
    <html>
      <head>
        <xsl:apply-templates select="descendant::oscal:title[1]" mode="title"/>
        <style type="text/css">

.control { margin:1em; padding: 1em; border: thin dotted black }
.control > *:first-child { margin-top: 0em }

h1, h2, h3, h4, h5, h6 { font-family: sans-serif; margin: 0em }
h3 { font-size: 120% }

div, section { border-left: thin solid black; padding-left: 0.5em; margin-left: 0.5em }

section h3     { font-size: 160% }
section h3     { font-size: 140% }
div h3         { font-size: 130% }
div div h3     { font-size: 120% }
div div div h3 { font-size: 110% }

.param { font-style: italic }
.insert, .choice { border: thin solid black; padding: 0.1em }

.subst  { color: midnightblue; font-family: sans-serif; font-sizea; 85% } 

.param .em { font-style: roman }

.tag:before { content: '&lt;' }
.tag:after  { content: '&gt;' }
.code { font-family: monospace }
        </style>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="oscal:catalog">
    <div class="catalog">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:title">
    <h2 class="title">
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  
  <xsl:template match="oscal:declarations"/>
    
    <xsl:template match="oscal:title" mode="title">
      <xsl:value-of select="."/>
    </xsl:template>
  
  <xsl:template match="oscal:group">
    <section class="group">
      <xsl:copy-of select="@class | @id"/>
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  
  <!--<xsl:key name="declarations" match="oscal:control-spec" use="@type"/>
  
  <xsl:key name="declarations" match="oscal:property | oscal:statement | oscal:parameter"
    use="concat(@context,'#',@role)"/>-->
  
  <!--<xsl:key name="assignment"  match="oscal:param" use="@target"/>-->
  
  
  <xsl:template match="oscal:control">
    <div class="control {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:if test="@class='element-description' and oscal:prop[@class='tag']">
        <!--Remember we are writing XSLT 1.0 here, we have to do everything the hard way-->
        <xsl:attribute name="id">
          <xsl:text>tag_</xsl:text>
          <xsl:value-of select="oscal:prop[@class='tag']"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:call-template name="make-title">
        <xsl:with-param name="runins" select="oscal:prop[@class='tag'] | oscal:prop[@class='full_name']"/>
      </xsl:call-template>
      
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!-- Picked up in parent, by default this element is suppressed -->
  <xsl:template match="oscal:control/oscal:title"/>
  
  <xsl:template name="make-title">
    <xsl:param name="runins" select="/.."/>
    <xsl:apply-templates select=".." mode="title">
      <xsl:with-param name="runins" select="$runins"/>
    </xsl:apply-templates>
    
    <xsl:for-each select="oscal:title">
      <xsl:apply-templates/>
    </xsl:for-each>
    <!--<h3>
      <xsl:apply-templates select="$runins" mode="run-in"/>
      
    </h3>-->
  </xsl:template>
  
  <xsl:template match="oscal:prop" mode="run-in">
    <span class="run-in subst {@class}">
      <xsl:apply-templates/>
    </span>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="oscal:param">
    <p class="param">
      <span class="subst">
        <xsl:for-each select="@target">
          <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>: </xsl:text>
      </span>
        <xsl:apply-templates/>
      </p>
    
  </xsl:template>
  
  <xsl:template match="oscal:prop[@class='tag'] | oscal:prop[@class='full_name'] "/>
  
  
  <xsl:template match="oscal:prop">
    <p class="prop {@class}">
      <span class="subst">
        <xsl:apply-templates select="." mode="title"/>
        <xsl:text>: </xsl:text>
      </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="*[@class='description']" mode="title"/>
    
  <xsl:template match="*" mode="title">
    <xsl:param name="runins" select="/.."/>
    <xsl:variable name="how-deep" select="count(ancestor-or-self::*) + 1"/>
    <xsl:element name="h{$how-deep}">
      <xsl:copy-of select="@class"/>
      <xsl:apply-templates mode="run-in" select="$runins"/>
      <xsl:value-of select="@class"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="oscal:p">
    <p class="p">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="oscal:inject">
    <xsl:variable name="param" select="@param-id"/>
    <xsl:variable name="closest-param" select="ancestor-or-self::*/oscal:param[@id=$param][last()]"/>
    <!-- Providing substitution via declaration not yet supported -->
      <span class="inject">
      <xsl:for-each select="$closest-param">
        <span class="subst">
          <xsl:apply-templates/>
        </span>
      </xsl:for-each>
      <xsl:if test="not($closest-param)">
        <xsl:apply-templates/>
      </xsl:if>
    </span>
  </xsl:template>

  <xsl:template match="oscal:ol">
    <ol class="ol">
      <xsl:apply-templates/>
    </ol>
  </xsl:template>
  <xsl:template match="oscal:li">
    <li class="li">
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="oscal:part">
    <div class="part {@class}">
      <xsl:apply-templates select="." mode="title"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

<!-- They're all internal links (they better be) -->
  <xsl:template match="oscal:a[contains(@href,'#')]">
    <a class="xref">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:value-of select="substring-after(.,'#')"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  <xsl:template match="oscal:a">
    <a class="xref">
      <xsl:copy-of select="@href"/>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  <xsl:template match="oscal:references">
    <section class="references">
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  
  <xsl:template match="oscal:ref">
    <div class="ref">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="oscal:std">
    <p class="std">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="oscal:extensions">
    <div class="extensions">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="oscal:withdrawn">
    <span class="withdrawn">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="oscal:em">
    <em class="em">
      <xsl:apply-templates/>
    </em>
  </xsl:template>
  <xsl:template match="oscal:select">
    <div class="select">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  <xsl:template match="oscal:choice">
    <p class="choice">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="oscal:citation">
    <p class="citation">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <!--<xsl:template match="oscal:div">
    <section class="div">
      <xsl:apply-templates/>
    </section>
  </xsl:template>-->
  
  <xsl:variable name="all-tags" select="//oscal:prop[@class='tag']"/>
  
  <xsl:template match="oscal:code">
    <code class="code">
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  
  <xsl:template match="oscal:code[.=//oscal:prop[@class='tag']]">
    <a href="#tag_{.}" class="code">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  
  <xsl:template match="oscal:q">
    <q class="q">
      <xsl:apply-templates/>
    </q>
  </xsl:template>
  
  <xsl:template match="@class">
    <span class="{local-name()}">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
  
</xsl:stylesheet>