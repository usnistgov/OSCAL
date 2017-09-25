<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">
  
  <xsl:template match="/">
    <html>
      <head>
        <xsl:apply-templates select="descendant::oscal:title[1]" mode="title"/>
        <style type="text/css">

.control { margin:1em; padding: 1em; border: thin dotted black }
.control > *:first-child { margin-top: 0em }

h1, h2, h3, h4, h5, h6 { font-family: sans-serif }
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
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  
  <!--<xsl:key name="declarations" match="oscal:control-spec" use="@type"/>
  
  <xsl:key name="declarations" match="oscal:property | oscal:statement | oscal:parameter"
    use="concat(@context,'#',@role)"/>-->
  
  <xsl:key name="assignment"  match="oscal:param" use="@id"/>
  
  <xsl:template match="oscal:control | oscal:subcontrol | oscal:component | oscal:part">
    <div class="{local-name()} {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:call-template name="make-title">
        <xsl:with-param name="runins" select="oscal:prop[@class='name']"/>
      </xsl:call-template>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!-- Picked up in parent -->
  <xsl:template match="oscal:control/oscal:title"/>
  
  <xsl:template name="make-title">
    <xsl:param name="runins" select="/.."/>
    <h3>
      <xsl:apply-templates select="$runins" mode="run-in"/>
      <xsl:for-each select="@class">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>] </xsl:text>
      </xsl:for-each>
      
      <xsl:for-each select="oscal:title">
        <xsl:apply-templates/>
      </xsl:for-each>
    </h3>
  </xsl:template>
  
  <xsl:template match="oscal:prop" mode="run-in">
    <span class="run-in subst">
      <xsl:apply-templates/>
    </span>
    <xsl:text> </xsl:text>
  </xsl:template>
      
  <xsl:template match="oscal:param">
    <p class="param">
      <span class="subst">
        <xsl:for-each select="@id">
          <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>: </xsl:text>
      </span>
        <xsl:apply-templates/>
      </p>
    
  </xsl:template>
  
  <xsl:template match="oscal:prop[@class='name']"/>
  
  <xsl:template match="oscal:prop">
    <p class="prop {@class}">
      <span class="subst">
        <xsl:apply-templates select="." mode="title"/>
        <xsl:text>: </xsl:text>
      </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="*" mode="title">
    <xsl:value-of select="@class"/>
  </xsl:template>
  
  <xsl:template match="oscal:p">
    <p class="p">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="oscal:insert">
    <xsl:variable name="param-id" select="@param-id"/>
    <xsl:variable name="closest-param" select="ancestor-or-self::*/oscal:param[@id=$param-id][last()]"/>
    <!-- Providing substitution via declaration not yet supported -->
      <span class="insert">
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
  
  <xsl:template match="oscal:stmt">
    <div class="stmt {@role}">
      <xsl:apply-templates select="." mode="title"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="oscal:xref">
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
  
  <xsl:template match="oscal:citation">
    <p class="citation">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="oscal:div">
    <section class="div">
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  <xsl:template match="oscal:code">
    <code class="code">
      <xsl:apply-templates/>
    </code>
  </xsl:template>
  <xsl:template match="oscal:q">
    <q class="q">
      <xsl:apply-templates/>
    </q>
  </xsl:template>
  
  
</xsl:stylesheet>