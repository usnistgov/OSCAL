<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:oscal="http://scap.nist.gov/schema/oscal">
  
  <xsl:template match="/">
    <html>
      <head>
        <xsl:apply-templates select="descendant::oscal:title[1]" mode="title"/>
        <style type="text/css">

.control { margin:1em; padding: 1em; border: thin dotted black }
.control > *:first-child { margin-top: 0em }

h1, h2, h3, h4, h5, h6 { font-family: sans-serif; margin-bottom: 0em }
h3 { font-size: 120% }

div, section { border-left: thin solid black; padding-left: 0.5em; margin-left: 0.5em }
div.component { border: none; padding: 0em; margin: 0em }

section h3     { font-size: 160% }
section h3     { font-size: 140% }
div h3         { font-size: 130% }
div div h3     { font-size: 120% }
div div div h3 { font-size: 110% }

p { margin-top: 0.4em; margin-bottom: 0.2em }
p:first-child { margin-top: 0ex }

p.link { display: inline-block; padding: 0.1em; background-color: aliceblue; border: medium solid blue; margin-right: 0.2em }

.component td { vertical-align: text-top; padding-top: 0em; padding-bottom: 0em }

.param { font-style: italic }
.assign, .choice { border: thin solid black; padding: 0.1em }
.unassigned { border: thin solid red; background-color: pink}
.assignment-value { color: grey; font-weight: bold }
.assign .assignment-value { font-size: 80%; font-weight: normal }

.subst  { color: midnightblue; font-family: sans-serif; font-size; 85% } 
 
li { list-style-type: square }
.param .em { font-style: roman }

        </style>
      </head>
      <body class="{local-name(/*)}">
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="oscal:catalog | oscal:collection">
      <xsl:apply-templates/>
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

  <!--<xsl:template match="oscal:declarations">
    <x class="declarations">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:control-spec">
    <x class="control-spec">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:required">
    <x class="required">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:property">
    <x class="property">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:value">
    <x class="value">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:identifier">
    <x class="identifier">
      <apply-templates/>
    </x>
  </xsl:template>
  <xsl:template match="oscal:regex">
    <x class="regex">
      <apply-templates/>
    </x>
  </xsl:template>
  
  <xsl:template match="oscal:optional">
    <x class="optional">
      <apply-templates/>
    </x>
  </xsl:template>
  
  <xsl:template match="oscal:statement">
    <div class="statement">
      <apply-templates/>
    </div>
  </xsl:template>-->
  
  <xsl:template match="oscal:group">
    <section class="group">
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  
  <!--<xsl:key name="declarations" match="oscal:control-spec" use="@type"/>
  
  <xsl:key name="declarations" match="oscal:property | oscal:statement | oscal:parameter"
    use="concat(@context,'#',@role)"/>-->
  
  <xsl:key name="parameter-by-target"  match="oscal:param" use="@target"/>
  
  <xsl:key name="element-by-id"  match="*[@id]" use="@id"/>
  
  <xsl:template match="oscal:control | oscal:subcontrol">
    <div class="{local-name()}">
      <xsl:copy-of select="@id"/>
      <xsl:call-template name="make-title">
        <xsl:with-param name="runins" select="oscal:prop[@class='name']"/>
      </xsl:call-template>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!-- Picked up in parent -->
  <xsl:template match="oscal:control/oscal:title | oscal:subcontrol/oscal:title"/>

  <!-- Pulled into title -->
  <xsl:template match="oscal:control/oscal:prop[@class='name'] | oscal:subcontrol/oscal:prop[@class='name']"/>
  
  <xsl:template name="make-title">
    <xsl:param name="runins" select="/.."/>
    <h3>
      <xsl:apply-templates select="$runins" mode="run-in"/>
      <xsl:for-each select="oscal:title">
        <xsl:apply-templates/>
      </xsl:for-each>
    </h3>
  </xsl:template>
  
  <xsl:template match="oscal:comp">
    <xsl:apply-templates select="." mode="title"/>
    <div class="component">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates select="." mode="component-number"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='assessment']">
    <xsl:apply-templates select="." mode="title"/>
    <ul class="assessment">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='assessment']/oscal:prop[@class='method']"/>
  
  <xsl:template match="oscal:comp[@class='assessment']/oscal:prop[@class='object']">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="oscal:comp[ancestor::oscal:comp | descendant::oscal:comp]">
    <xsl:apply-templates select="." mode="title"/>
    <table class="component">
      <xsl:copy-of select="@id"/>
      <tbody>
      <tr>
        <td>
          <xsl:apply-templates select="." mode="component-number"/>
        </td>
        <td>
          <xsl:apply-templates/>
        </td>
      </tr>
      </tbody>
    </table>
    
  </xsl:template>
  
  <xsl:template match="oscal:comp[ancestor::oscal:comp | descendant::oscal:comp]" mode="title"/>
  
  <xsl:template match="oscal:comp" mode="component-number"/>
  
  <xsl:template match="oscal:comp[oscal:prop[@class='name']]" mode="component-number">
    <xsl:variable name="inherited-no" select="ancestor::*[oscal:prop[@class='name']][1]/oscal:prop[@class='name']"/>
    <xsl:variable name="inherited-trimmed" select="translate($inherited-no,' ','')"/>
    <p class="component-number">
      <xsl:value-of select="substring-after(translate(oscal:prop[@class='name'],' ',''),$inherited-trimmed)"/>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:comp/oscal:prop[@class='name']"/>
  
  <xsl:template match="oscal:param">
    <p class="param">
      <span class="subst">
        <xsl:text>Parameter </xsl:text>
        <xsl:for-each select="key('element-by-id',@target)">
          <span class="assignment-value">
            <xsl:apply-templates/>
          </span>
        </xsl:for-each>
        <xsl:text> (target </xsl:text>
        <xsl:for-each select="@target">
          <xsl:value-of select="."/>
        </xsl:for-each>
        <xsl:text>): </xsl:text>
      </span>
        <xsl:apply-templates/>
      
    </p>
    
  </xsl:template>
  
  <xsl:template match="oscal:prop">
    <p class="prop {@class}">
      <xsl:apply-templates select="." mode="label"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="oscal:prop" mode="run-in">
    <span class="run-in subst">
      <xsl:apply-templates/>
    </span>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template match="oscal:prop[@class='decision']" mode="label"/>
  
  <xsl:template match="oscal:prop" mode="label">
    <span class="subst">
      <xsl:value-of select="@class"/>
      <xsl:text>: </xsl:text>
    </span>
    
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='statement']" mode="title">
    <h4>Control</h4>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='guidance']" mode="title">
    <h4>Supplemental guidance</h4>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='objective']" mode="title">
    <h4>
      <xsl:text>Objective</xsl:text>
      <xsl:if test="oscal:comp">s</xsl:if>
    </h4>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='assessment']" mode="title">
    <h4>
      <xsl:text>Assessment: </xsl:text>
      <xsl:value-of select="oscal:prop[@class='method']"/>
    </h4>
  </xsl:template>
  
  <xsl:template match="oscal:comp[@class='objective']//oscal:comp[@class='objective']" priority="2" mode="title"/>
    
  <xsl:template match="*" mode="title">
    <xsl:value-of select="@class"/>
  </xsl:template>
  
  <xsl:template match="*" mode="title">
    <xsl:value-of select="@class"/>
  </xsl:template>
  
  <xsl:template match="*" mode="title">
    <xsl:value-of select="@class"/>
  </xsl:template>
  
  <xsl:template match="oscal:p">
    <p class="p">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="oscal:assign">
    <xsl:variable name="id" select="@id"/>
    <xsl:variable name="closest-param" select="ancestor-or-self::*/oscal:param[contains(@target,$id)][last()]"/>
    <!-- Providing substitution via declaration not yet supported -->
    <xsl:variable name="unassigned">
      <xsl:if test="not($closest-param)"> unassigned</xsl:if>
    </xsl:variable>
    <xsl:variable name="result">
      <xsl:apply-templates/>
    </xsl:variable>
      <span class="assign{$unassigned}">
      <xsl:for-each select="$closest-param">
        <span class="subst">
          <xsl:apply-templates/>
        </span>
      </xsl:for-each>
        <xsl:choose>
      <xsl:when test="$closest-param">
        <span class="assignment-value">
          <xsl:text> [</xsl:text>
          <xsl:copy-of select="$result"/>
          <xsl:text>]</xsl:text>
        </span>
      </xsl:when>
          <xsl:otherwise>
            <xsl:copy-of select="$result"/>
          </xsl:otherwise>
        </xsl:choose>
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

  <xsl:template match="oscal:a">
    <a>
      <xsl:copy-of select="@href"/>
      <xsl:apply-templates/>
    </a>
  </xsl:template>
  
  <xsl:template match="oscal:link">
    <p class="link">
      <span class="subst">cf </span>
    <a>
      <xsl:copy-of select="@href"/>
      <xsl:choose>
        <xsl:when test="normalize-space()">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="starts-with(@href,'#')">
          <xsl:apply-templates select="key('element-by-id',substring-after(@href,'#'))" mode="link-text"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@href"/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
    </p>
  </xsl:template>
  
  <xsl:template match="*" mode="link-text">
    <xsl:choose>
      <xsl:when test="oscal:prop[@class='name']">
        <xsl:value-of select="oscal:prop[@class='name']"/>
      </xsl:when>
      <xsl:otherwise>[Error: no 'name' property on link target]</xsl:otherwise>
    </xsl:choose>
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
  
  <xsl:template match="oscal:section">
    <section class="div">
      <xsl:apply-templates/>
    </section>
  </xsl:template>
  
  <xsl:template match="oscal:code | oscal:q | oscal:b | oscal:i | oscal:em | oscal:sup | oscal:sub">
    <xsl:element name="{local-name()}">
      <xsl:for-each select="@class">
        <xsl:attribute name="class">
          <xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
            
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="@class">
    <span class="{local-name()}">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>
  
</xsl:stylesheet>