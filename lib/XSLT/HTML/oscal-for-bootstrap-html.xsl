<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns="http://www.w3.org/1999/xhtml"
  
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  exclude-result-prefixes="oscal">

  <xsl:output indent="yes"/>
  
  <xsl:strip-space elements="*"/>
  <xsl:preserve-space elements="p pre li i a u em b"/>

  <xsl:template match="/">
    <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>NIST SP800-53 rev 4</title>
      <meta charset="utf-8" />
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
      <style type="text/css">
        .insert::before {
        content: "[Assignment: ";
        }
        .insert::after {
        content: "]";
        }
        .insert {
        background: #eee;
        font-style: italic;
        }
        .objectives ol {
        list-style: none;
        padding-left:1.2em;
        }
        .assessment ol {
        list-style: none;
        padding-left:1.2em;
        }
      </style>
    </head>
    <body class="{local-name(/*)}">
      <div class="container-fluid">
        <div class="row">
          <main class="col-md-12">
            <xsl:apply-templates/>
          </main>
        </div>
      </div>
      <xsl:call-template name="jQuery-script"/>
      
      </body>
    
    </html>
  </xsl:template>
  
  <xsl:template name="jQuery-script">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"/>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous">
        <xsl:comment> safe script </xsl:comment>
      </script>
  </xsl:template>
  
  <xsl:template match="oscal:catalog | oscal:worksheet | oscal:framework | /*">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="oscal:profile">
    <div class="profile">
      <xsl:apply-templates select="oscal:title"/>
      <xsl:apply-templates select="oscal:import"/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:import">
    <div class="invoking">
    <xsl:apply-templates select="." mode="display-invocation"/>
    <xsl:apply-templates select="oscal:import | oscal:framework"/>
    </div>
  </xsl:template>
      
  <xsl:template match="oscal:import/oscal:framework">
    <div class="framework" id="{generate-id(.)}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="/*/oscal:title">
    <h1>
      <xsl:apply-templates/>
    </h1>
    <hr class="hr"/>
  </xsl:template>
  
  <xsl:template match="oscal:title">
    <h2 class="title">
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  
  
  <xsl:template match="oscal:declarations"/>
    
  
  <xsl:template match="oscal:group">
    <xsl:variable name="new-id">
      <xsl:apply-templates select="." mode="new-id"/>
    </xsl:variable>
    <div class="group" id="{$new-id}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!--<xsl:key name="declarations" match="oscal:control-spec" use="@type"/>
  
  <xsl:key name="declarations" match="oscal:property | oscal:statement | oscal:parameter"
    use="concat(@context,'#',@role)"/>-->
  
  <xsl:key name="element-by-id"  match="*[@id]" use="@id"/>
  
  <xsl:template match="oscal:control | oscal:component">
    <div class="{local-name()}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
      <xsl:if test="oscal:part[@class='assessment']">
          <div class="part assessments">
            <xsl:apply-templates mode="title" select="oscal:part[@class='assessment'][1]"/>
            <xsl:apply-templates select="oscal:part[@class='assessment']" mode="in"/>
          </div>
      </xsl:if>
        
      <xsl:apply-templates select="oscal:references" mode="include"/>
      <xsl:if test="not(oscal:references)">
        <h4>References: <i style="font-weight: normal">None</i></h4>
      </xsl:if>
      <!-- impact table went here -->
    </div>
    <!-- flattening out -->
    <xsl:apply-templates select="oscal:subcontrol | oscal:component" mode="include"/>
  </xsl:template>
  
  <!-- dropped in default traversal -->
  <xsl:template match="oscal:subcontrol"/>
  
  <xsl:template match="oscal:subcontrol" mode="include">
    <div class="{local-name()}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!-- Check out xsl:template[@mode='impact-table'] in the original SP800-53 rendering XSL
       for drawing the impact table in HTML -->
  
  <xsl:template match="oscal:group" mode="make-label">
    <span class="badge badge-secondary">
      <xsl:value-of select="substring-before(descendant::oscal:prop[@class='name'][1],'-')"/>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:control | oscal:subcontrol | oscal:component" mode="make-label">
    <span class="badge badge-secondary">
      <xsl:value-of select="oscal:prop"/>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:group/oscal:title">
    <div class="bg-light border-1 border-secondary">
      <h1>
        <xsl:apply-templates select=".." mode="make-label"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
      </h1>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:control/oscal:title | oscal:subcontrol/oscal:title | oscal:component/oscal:title">
    <h2>
      <xsl:apply-templates mode="make-label" select=".."/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </h2>
  </xsl:template>
  
  <!-- Pulled into title or otherwise handled -->
  <xsl:template match="oscal:prop[@class='name']"/>
  
  <xsl:template match="oscal:prop[@class='priority']"/>
  <xsl:template match="oscal:prop[@class='baseline-impact']"/>
  
  
  <xsl:template name="make-title">
    <!-- $runins are properties to be inserted into the title inline, such as numbering -->
    <xsl:param name="runins"/>
    <h3>
      <xsl:if test="$runins"><!-- doing extra work here to stay in XSLT 1.0 *and* avoid helpful Saxon warnings -->
        <xsl:apply-templates select="$runins" mode="run-in"/>
      </xsl:if>
      <xsl:for-each select="oscal:title">
        <xsl:apply-templates/>
      </xsl:for-each>
    </h3>
  </xsl:template>
  
  <xsl:template match="oscal:part">
    <div class="part {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates select="." mode="title"/>
      <xsl:apply-templates select="." mode="part-number"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='assessment']/oscal:prop[@class='method']">
    <p><span class="method">
      <xsl:call-template name="title-case-me"/>
    </span>
    </p>
  </xsl:template>

  <xsl:variable name="upper">ABCDEFGHIJKLMNOPQRSTUVWXYZ</xsl:variable>
  <xsl:variable name="lower">abcdefghijklmnopqrstuvwxyz</xsl:variable>
  
  <xsl:template name="title-case-me">
    <xsl:variable name="me" select="string(.)"/>
    <xsl:value-of select="substring($me,1,1)"/>
    <xsl:value-of select="translate(substring($me,2),$upper,$lower)"/>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='statement']">
    <div class="part {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='objective']">
    <div class="part {@class}">
      <xsl:copy-of select="@id"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <!--<xsl:template match="oscal:part[@class='assessment']" mode="in">
      <xsl:apply-templates/>
  </xsl:template>-->
  
  <!-- tucked in -->
  <xsl:template match="oscal:part[@class='objective']//oscal:part[@class='objective']"/>
  
  <xsl:template match="oscal:part[@class='assessment']"/>
  
  <xsl:template match="oscal:part[@class='item']"/>
  
  <xsl:template match="oscal:part" mode="tuck-in">
      <xsl:apply-templates/>
      <xsl:apply-templates select="following-sibling::oscal:part[1][@class=current()/@class]" mode="tuck-in"/>
  </xsl:template>
  
 
  <xsl:template priority="2" match="oscal:part[@class='item']/oscal:part[@class='item']/oscal:p |
    oscal:part[@class='objective']/oscal:part[@class='objective']/oscal:p">
    <li>
      <xsl:apply-templates mode="make-label" select="parent::oscal:part[@class='item']"/>
      <xsl:apply-templates/>
      <xsl:if test="following-sibling::oscal:part[1][@class=current()/../@class]">
        <ol type="1">
          <xsl:apply-templates select="following-sibling::oscal:part[1][@class=current()/../@class]" mode="tuck-in"/>
        </ol>
      </xsl:if>
    </li>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='item']/oscal:p |
    oscal:part[@class='objective']/oscal:p">
    <p>
      <xsl:apply-templates mode="make-label" select="parent::oscal:part[@class='item']"/>
      <xsl:apply-templates/>
      <xsl:if test="following-sibling::oscal:part[1][@class=current()/../@class]">
        <ol type="a">
          <xsl:apply-templates select="following-sibling::oscal:part[1][@class=current()/../@class]" mode="tuck-in"/>
        </ol>
      </xsl:if>
    </p>
  </xsl:template>
  
  
  <xsl:template match="oscal:part[@class='objective']" mode="make-label">
    <xsl:variable name="control-label" select="translate((ancestor::oscal:control | ancestor::oscal:subcontrol)[last()]/oscal:prop[@class='name'],' ','')"/>
    <xsl:value-of select="substring-after(oscal:prop[@class='name'],$control-label)"/>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  <xsl:template priority="2" match="oscal:part[@class='objective']/oscal:part[@class='objective']">
    <xsl:apply-templates select="oscal:p"/>
    <!--<xsl:if test="oscal:part">
      <ol>
        <xsl:apply-templates select="oscal:part"/>
      </ol>
    </xsl:if>-->
  </xsl:template>
  
  
  <xsl:template match="oscal:part[@class='assessment']" mode="in">
    <div class="part assessment">
      <xsl:apply-templates select="oscal:prop"/>
      <ol>
        <xsl:apply-templates select="oscal:p"/>
      </ol>
    </div>
  </xsl:template>
  <xsl:template priority="10" match="oscal:part//oscal:part" mode="title"/>
  
  <xsl:template match="oscal:part" mode="part-number"/>
  
  <xsl:template match="oscal:part[oscal:prop[@class='name']]" mode="part-number">
    <xsl:variable name="inherited-no" select="ancestor::*[oscal:prop[@class='name']][1]/oscal:prop[@class='name']"/>
    <xsl:variable name="inherited-trimmed" select="translate($inherited-no,' ','')"/>
    <p class="part-number">
      <xsl:value-of select="substring-after(translate(oscal:prop[@class='name'],' ',''),$inherited-trimmed)"/>
    </p>
  </xsl:template>
  
  <xsl:template match="oscal:param"/>
  <!--<xsl:template match="oscal:param">
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
  </xsl:template>-->
  
  <xsl:template mode="inline" match="oscal:param/oscal:desc"/>
  
  <xsl:template mode="inline" match="oscal:param/oscal:value">
    <xsl:apply-templates/>
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
  
  <xsl:template match="oscal:p[@class = 'object']">
    <li class="object">
      <input type="checkbox" class="box"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  
  <xsl:template match="oscal:prop" mode="label">
    <span class="label">
      <xsl:value-of select="@class"/>
      <xsl:text>: </xsl:text>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='statement']" mode="title">
    <!--<h4>Control</h4>-->
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
    <h3>Potential Assessments, Methods and Objects:</h3>
  </xsl:template>
  
  <xsl:template match="oscal:part[@class='objective']//oscal:part[@class='objective']" priority="2" mode="title"/>
    
  <xsl:template match="*" mode="title">
    <span class="subst"><xsl:value-of select="@class"/></span>
  </xsl:template>
  
  <xsl:template match="oscal:p">
    <p class="p">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="oscal:pre">
    <pre class="pre">
      <xsl:apply-templates/>
    </pre>
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
        <!--<a href="#{@id}">
          <xsl:apply-templates select="." mode="param-id-block"/>
        </a>-->
        <xsl:apply-templates mode="inline"/>
        <xsl:if test="not(oscal:value | oscal:label)">
          <span class="value">
            <xsl:apply-templates select="oscal:value" mode="param-value"/>
            <xsl:if test="not(oscal:value)">[NO PARAMETER VALUE GIVEN]</xsl:if>
          </span>
        </xsl:if>
      </xsl:for-each>
      <xsl:if test="not($closest-param)">[NO PARAMETER ASSIGNED]</xsl:if>
    </span>
  </xsl:template>

  <xsl:template match="oscal:param" mode="param-id-block">
    <span class="param-id">
      <xsl:value-of select="@id"/>
    </span>
    <xsl:text> </xsl:text>
  </xsl:template>
  
  
  <xsl:template match="oscal:ul">
    <ul class="ol">
      <xsl:apply-templates/>
    </ul>
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
      <xsl:text>cf </xsl:text>
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
    <div class="references">
      <h4>References</h4>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:ref">
     <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="oscal:std | oscal:citation">
    <li class="reference">
      <a href="{@href}">
        <xsl:apply-templates/>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="oscal:withdrawn">
    <span class="withdrawn">
      <xsl:text>Withdrawn: </xsl:text>
      <xsl:apply-templates/>
    </span>
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

  
  <xsl:template match="oscal:section">
    <div class="section">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:code | oscal:q | oscal:b | oscal:i | oscal:em | oscal:sup | oscal:sub">
    <xsl:element name="{local-name()}" namespace="http://www.w3.org/1999/xhtml">
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
  

  <xsl:template priority="10" match="*[normalize-space(@id)]" mode="new-id">
    <xsl:value-of select="@id"/>
  </xsl:template>
  
  <xsl:template match="oscal:group[oscal:control|oscal:component]" mode="new-id">
    <xsl:value-of select="substring-before((oscal:control|oscal:component)[1]/@id,'.')"/>
  </xsl:template>
  
  <!-- only if not matching another 'new-id' template -->
  <xsl:template match="*" mode="new-id">
    <xsl:value-of select="generate-id(.)"/>
  </xsl:template>
  
  <xsl:template match="oscal:catalog | oscal:framework | oscal:section | oscal:group | oscal:control | oscal:subcontrol | oscal:component" mode="toc">
    <xsl:variable name="new-id">
      <xsl:apply-templates select="." mode="new-id"/>
    </xsl:variable>
    <div class="toc">
      <p class="toc-line"><a href="#{$new-id}">
        <xsl:for-each select="oscal:prop[@class='name'] | oscal:prop[@class='number']">
          <xsl:apply-templates/>
          <xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:apply-templates select="oscal:title" mode="inline"/>
      </a></p>
      <xsl:apply-templates mode="toc" select="oscal:section | oscal:group | oscal:control | oscal:subcontrol | oscal:component"/>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:title" mode="inline">
    <xsl:apply-templates/>
  </xsl:template>
  
  
  <xsl:template match="oscal:import" mode="display-invocation">
    <div class="invocation">
      <p>
        <xsl:value-of select="@href"/>
        <xsl:text> ➭ </xsl:text>
        <xsl:apply-templates select="*[not(self::oscal:framework)]" mode="display-invocation"/>
      </p>
    </div>
  </xsl:template>
  
  <xsl:template match="oscal:import/oscal:include" mode="display-invocation">
    <span class="subst">Included:</span>
    <xsl:apply-templates mode="display-invocation"/>
  </xsl:template>
  
  <xsl:template match="oscal:import/oscal:exclude" mode="display-invocation">
    <span class="subst">Excluded:</span>
    <xsl:apply-templates mode="display-invocation"/>
  </xsl:template>
  
  
  <xsl:template match="oscal:import/oscal:include/oscal:all" mode="display-invocation">
    <xsl:text> ALL </xsl:text>
  </xsl:template>
  
  <xsl:template match="oscal:import/*/oscal:call[@control-id]" mode="display-invocation">
    <span class="invoking">
      <span class="subst">Control </span>
      <xsl:value-of select="@control-id"/>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:import/*/oscal:call[@subcontrol-id]" mode="display-invocation">
    <span class="invoking">
      <span class="subst">Subcontrol </span>
      <xsl:value-of select="@subcontrol-id"/>
    </span>
  </xsl:template>
  
  <xsl:template match="oscal:set-param" mode="display-invocation">
    <span class="invoking">
      <span class="subst">
        <xsl:text>Parameter </xsl:text>
        <xsl:value-of select="@id"/>
      </span>
      <xsl:for-each select="oscal:desc"> (<xsl:value-of select="."/>)</xsl:for-each>
      <xsl:text>: </xsl:text>
      <xsl:apply-templates select="oscal:value" mode="display-invocation"/>
    </span>
  </xsl:template>
  
</xsl:stylesheet>