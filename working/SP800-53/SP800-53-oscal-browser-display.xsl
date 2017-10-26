<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="oscal">
  
  <xsl:template match="/">
    <html>
      <head>
        <title>
        <xsl:value-of select="descendant::oscal:title[1]"/>
        </title>
        <xsl:copy-of select="$css"/>
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

  <xsl:variable name="css">
    <style type="text/css">
      
      .control { margin:1em; padding: 1em; border: thin solid black }
      .subcontrol { margin-top: 0.5em; padding: 1em; border: thin dotted black }
      .control > *:first-child, .subcontrol > *:first-child { margin-top: 0em }
      
      h1, h2, h3, h4, h5, h6 { font-family: sans-serif; margin-bottom: 0em }
      h3 { font-size: 120% }
      
      // div, section { border-left: thin solid black; padding-left: 0.5em; margin-left: 0.5em }
      // div.part { border: none; padding: 0em; margin: 0em }
      .part {  }
      
      section h3     { font-size: 160% }
      section h3     { font-size: 140% }
      div h3         { font-size: 130% }
      div div h3     { font-size: 120% }
      div div div h3 { font-size: 110% }
      
      p, div.param { margin-top: 0.4em; margin-bottom: 0.2em }
      p { line-height: 160% }
      p:first-child { margin-top: 0ex }
      
      div.param { background-color: lightgreen; border: thin solid green; font-size: 80%; padding: 0.3em }
      
      .param p { margin: 0em }
      
      p.object { padding-left: 2em; text-indent: -2em }
      
      p.link { display: inline-block; padding: 0.1em; background-color: aliceblue; border: medium solid blue; padding-right: 0.2em; margin-right: 0.2em }
      p.link.broken { background-color: lemonchiffon; border: medium solid darkorange; text-decoration: line-through }
      .part td { vertical-align: text-top; padding-top: 0em; padding-bottom: 0em }
      
      .insert, .choice { border: thin solid black; padding: 0.1em; background-color: skyblue }
      .unassigned { border: thin solid red; background-color: pink}
      .desc { color: darkgreen }
      .insert .desc { font-size: 90% }
      .value { font-style: italic; text-decoration: underline }
      
      .param-id { font-size: 90%; font-family: sans-serif; font-weight: bold; background-color: black; color: white }
      .insert .param-id { font-size: 80% }
      
      .withdrawn { font-weight: bold; font-style: italic }
      
      .box { vertical-align: middle; width: 2em }
      .subst  { color: midnightblue; font-family: sans-serif; font-style: normal; font-weight: normal; font-size; 85% } 
      
      .impact-table { width: 100%; collapse: collapsed; font-family: sans-serif }
      .impact-table td { padding: 0.5em; background-color: lightgrey; border: thin solid black }
      
      li { list-style-type: square }
      a { text-decoration: none }
      
    </style>
  </xsl:variable>
  

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
  
  <xsl:key name="element-by-id"  match="*[@id]" use="@id"/>
  
  <xsl:template match="oscal:control">
    <div class="{local-name()}">
      <xsl:copy-of select="@id"/>
      <xsl:call-template name="make-title">
        <xsl:with-param name="runins" select="oscal:prop[@class = 'name']"/>
      </xsl:call-template>
      <xsl:apply-templates/>
      <xsl:if test="oscal:subcontrol">
        <div class="enhancements">
          <h4>Control enhancements</h4>
          <xsl:apply-templates select="oscal:subcontrol" mode="include"/>
        </div>
      </xsl:if>
      <xsl:apply-templates select="oscal:references" mode="include"/>
      <xsl:if test="not(oscal:references)">
        <h4>References: <i style="font-weight: normal">None</i></h4>
      </xsl:if>
      <xsl:apply-templates select="self::oscal:control[not(oscal:part//oscal:withdrawn)]"
        mode="impact-table"/>
    </div>
  </xsl:template>
  
  <!-- dropped in default traversal -->
  <xsl:template match="oscal:subcontrol"/>
  
  <xsl:template match="oscal:subcontrol" mode="include">
    <div class="{local-name()}">
      <xsl:copy-of select="@id"/>
      <xsl:call-template name="make-title">
        <xsl:with-param name="runins" select="oscal:prop[@class='name']"/>
      </xsl:call-template>
      <xsl:apply-templates/>
      <xsl:apply-templates select="self::oscal:control[not(oscal:part//oscal:withdrawn)]" mode="impact-table"/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:control" mode="impact-table">
    <xsl:variable name="me" select="."/>
    <h4>Priority and baseline allocation</h4>
    <table class="impact-table">
      <tbody>
        <tr>
          <td>
            <xsl:value-of select="oscal:prop[@class='priority']"/>
          </td>
          <xsl:call-template name="impact-cell">
            <xsl:with-param name="impact">LOW</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="impact-cell">
            <xsl:with-param name="impact">MODERATE</xsl:with-param>
          </xsl:call-template>
          <xsl:call-template name="impact-cell">
            <xsl:with-param name="impact">HIGH</xsl:with-param>
          </xsl:call-template>
        </tr>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:template name="impact-cell">
    <xsl:param name="impact">HIGH</xsl:param>
    <xsl:variable name="control-no" select="oscal:prop[@class = 'name']"/>
    <td style="width:30%">
      <b>
        <xsl:choose>
          <xsl:when test="$impact = 'MODERATE'">MOD</xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$impact"/>
          </xsl:otherwise>
        </xsl:choose>
      </b>
      <xsl:text> </xsl:text>
      <xsl:choose>
        <!-- XXX Check out AC-17-->
        <!-- When the control doesn't have the baseline impact, it's not selected -->
        <xsl:when test="not(oscal:prop[@class = 'baseline-impact'] = $impact)">Not selected</xsl:when>
        <!-- The control has the baseline impact, but no subcontrol has it ...
             list the control. -->
        <xsl:when test="not(oscal:subcontrol/oscal:prop[@class = 'baseline-impact'] = $impact)">
          <xsl:value-of select="oscal:prop[@class = 'name']"/>
        </xsl:when>
        <!-- Otherwise, list all subcontrols that have the baseline impact ... ex AC-17, CP-6 -->
        <xsl:otherwise>
          <xsl:for-each
          select="oscal:subcontrol[oscal:prop[@class = 'baseline-impact'] = $impact]">
            <xsl:choose>
              <xsl:when test="position() = 1"><xsl:value-of select="oscal:prop[@class = 'name']"/></xsl:when>
              <xsl:otherwise>
                <xsl:text> </xsl:text>
                <xsl:value-of select="substring-after(oscal:prop[@class = 'name'],$control-no)"/>      
              </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each></xsl:otherwise>

      </xsl:choose>
    </td>
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
  
  <xsl:template match="oscal:part">
    <xsl:apply-templates select="." mode="title"/>
    <div class="part {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates select="." mode="part-number"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='assessment']/oscal:prop[@class='method']"/>

  
  <xsl:template match="oscal:part[ancestor::oscal:part | descendant::oscal:part]">
    <xsl:apply-templates select="." mode="title"/>
    <table class="part">
      <xsl:copy-of select="@id"/>
      <tbody>
      <tr>
        <td>
          <xsl:apply-templates select="." mode="part-number"/>
        </td>
        <td>
          <xsl:apply-templates/>
        </td>
      </tr>
      </tbody>
    </table>
    
  </xsl:template>
  
  <xsl:template priority="10" match="oscal:part[ancestor::oscal:part | descendant::oscal:part]" mode="title"/>
  
  <xsl:template match="oscal:part" mode="part-number"/>
  
  <xsl:template match="oscal:part[oscal:prop[@class='name']]" mode="part-number">
    <xsl:variable name="inherited-no" select="ancestor::*[oscal:prop[@class='name']][1]/oscal:prop[@class='name']"/>
    <xsl:variable name="inherited-trimmed" select="translate($inherited-no,' ','')"/>
    <p class="part-number">
      <xsl:value-of select="substring-after(translate(oscal:prop[@class='name'],' ',''),$inherited-trimmed)"/>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:part/oscal:prop[@class='name']"/>
  
  <xsl:template match="oscal:param">
    <xsl:variable name="target" select="key('element-by-id',@target)"/>
    <div class="param">
      <xsl:copy-of select="@id"/>
        <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="oscal:param/oscal:desc">
    <p class="desc">
      <span class="subst">Parameter:</span>
      <xsl:text> </xsl:text>
      <xsl:apply-templates select=".." mode="param-id-block"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:param/oscal:value">
    <p class="value">
      <span class="subst">Value:</span>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  
  
  <!-- Pulled into impact table -->
  <xsl:template match="oscal:prop[@class='priority'] | oscal:prop[@class='baseline-impact']"/>
  
  
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
  
  <xsl:template match="oscal:p[@class = 'object']">
    <p class="object">
      <input type="checkbox" class="box"/>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:prop" mode="label">
    <span class="subst">
      <xsl:value-of select="@class"/>
      <xsl:text>: </xsl:text>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='statement']" mode="title">
    <h4>Control</h4>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='guidance']" mode="title">
    <h4>Supplemental guidance</h4>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='objective']" mode="title">
    <h4>
      <xsl:text>Objective</xsl:text>
      <xsl:if test="oscal:part">s</xsl:if>
    </h4>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='assessment']" mode="title">
    <h4>
      <xsl:text>Assessment: </xsl:text>
      <xsl:value-of select="oscal:prop[@class='method']"/>
    </h4>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='objective']//oscal:part[@class='objective']" priority="2" mode="title"/>
    
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

<!-- 'insert' is a site of injection for a parameter value
     its param contains a description and (optionally) a value -->
  <xsl:template match="oscal:insert">
    <xsl:variable name="closest-param"
      select="ancestor-or-self::*/oscal:param[@id=current()/@param-id][last()]"/>
    <!-- Providing substitution via declaration not yet supported -->
    <xsl:variable name="unassigned">
      <xsl:if test="not($closest-param)"> unassigned</xsl:if>
    </xsl:variable>
    <span class="insert{$unassigned}">
      <xsl:for-each select="$closest-param">
        <a href="#{@id}">
          <xsl:apply-templates select="." mode="param-id-block"/>
        </a>
      <span class="value">
        <xsl:apply-templates select="oscal:value"
          mode="param-value"/>
        <xsl:if test="not(oscal:value)">[NO PARAMETER VALUE GIVEN]</xsl:if>
      </span>
      <xsl:text> </xsl:text>
      <span class="desc">
        <xsl:text> [</xsl:text>
        <!-- walking around the template matching oscal:param/oscal:desc -->
        <xsl:for-each select="oscal:desc">
          <xsl:apply-templates/>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
      </span>
      </xsl:for-each>
      <xsl:if test="not($closest-param)">[NO PARAMETER ASSIGNED]</xsl:if>
    </span>
  </xsl:template>

  <xsl:template match="oscal:param" mode="param-id-block">
    <span class="param-id">
      <xsl:text>&#xA0;</xsl:text>
      <xsl:value-of select="@id"/>
      <xsl:text>&#xA0;</xsl:text>
    </span>
    <xsl:text> </xsl:text>
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
      <a>
        <xsl:copy-of select="@href"/>
        <xsl:choose>
          <xsl:when test="normalize-space()">
            <xsl:apply-templates/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@href"/>
          </xsl:otherwise>
        </xsl:choose>
      </a>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:link[starts-with(@href,'#')]">
    <xsl:variable name="target" select="key('element-by-id',substring-after(@href,'#'))"/>
    <p class="link">
      <xsl:if test="not($target)">
        <xsl:attribute name="class">broken link</xsl:attribute>
      </xsl:if>
      <span class="subst">cf </span>
      <a>
        <xsl:copy-of select="@href"/>
        <xsl:choose>
          <xsl:when test="normalize-space()">
            <xsl:apply-templates/>
          </xsl:when>
          <!-- Link not broken -->
          <xsl:when test="$target">
            <xsl:apply-templates select="$target" mode="link-text"/>
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
        
  <!-- dropped in default traversal -->
  <xsl:template match="oscal:references"/>
  
  <xsl:template match="oscal:references" mode="include">
    <section class="references">
      <h4>References</h4>
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
      <xsl:text>Withdrawn: </xsl:text>
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