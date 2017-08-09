<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xjs="http://github.com/wendellpiez/XMLjellysandwich"
                xmlns:ixsl="http://saxonica.com/ns/interactiveXSLT"
                version="3.0"
                extension-element-prefixes="ixsl"
                xpath-default-namespace="http://scap.nist.gov/schema/oscal">

<!--Starter XSLT written courtesy of XML Jelly Sandwich -->
 
 <xsl:variable name="source" select="/"/>
  
  <xsl:variable name="filtered-catalog">
    <xsl:apply-templates select="$source"/>
  </xsl:variable>
  
<!-- NB this stylesheet assumes classes are never overloaded in the OSCAL source
     i.e. rule matches(@class,'^\i\c*$') applies -->
  <xsl:template name="xmljellysandwich_pack">
    <!-- Target page components by assigning transformation results to them via their IDs in the host page. -->
    <xsl:result-document href="#xmljellysandwich_css" method="ixsl:replace-content">
      <xsl:call-template name="css"/>
    </xsl:result-document>
    
    <xsl:result-document href="#xmljellysandwich_body">
      <xsl:apply-templates/>
    </xsl:result-document>
  
    <xsl:result-document href="#xmljellysandwich_directory">
      <form>
        <table id="baseline_key">
      <xsl:for-each-group select="//prop[@class='baseline-impact']" group-by="normalize-space(.)">
        <tr>
          <td><xsl:value-of select="current-grouping-key()"/>
            (<xsl:value-of select="count(key('controldiv-by-baseline-impact',current-grouping-key(),ixsl:page()))"/>)</td>
          <td><input type="radio" name="baseline" value="{current-grouping-key()}"/></td>
          <!-- check for @checked='checked' when the time comes -->
        </tr>
      </xsl:for-each-group>
          <tr><td colspan="2"><input name="allclear" type="reset"/></td></tr>
            
      </table>
      </form>
    </xsl:result-document>
  </xsl:template>
  
  <xsl:template match="input[@name='allclear']" mode="ixsl:onclick" xpath-default-namespace="">
    <xsl:apply-templates select="//div[xjs:classes(.)=('control','subcontrol')]" mode="switch"/>
  </xsl:template>
  
  <xsl:template match="input[@name='baseline']" mode="ixsl:onclick" xpath-default-namespace="">
    <xsl:variable name="this" select="."/>
    <xsl:message>Checked: <xsl:value-of select="@checked"/></xsl:message>
    <!-- We could simply tweak the display but instead we wish to run the entire filter
         from the top to include only selected controls in our full control set
    This filters controls for further processing such as parameter assignment -->
    
    <xsl:apply-templates select="//div[xjs:classes(.)=('control','subcontrol')]" mode="switch"/>
    
    <xsl:apply-templates select="key('controldiv-by-baseline-impact',normalize-space($this/@value))" mode="switch">
      <xsl:with-param name="switching">selected</xsl:with-param>
      <!-- select="if (ixsl:get($this,'checked')) then 'selected' else 'excluded'"/>-->
      
    </xsl:apply-templates>
  </xsl:template>
  
  <xsl:key name="controldiv-by-baseline-impact" match="div[xjs:classes(.)=('control','subcontrol')]"
    use="p[xjs:has-class(.,'baseline-impact')]/span[@class='value']" xpath-default-namespace=""/>
  
  <xsl:template match="*" mode="switch">
    <xsl:param name="switching">excluded</xsl:param>
    <ixsl:set-attribute name="class" select="string-join(($switching, @class/tokenize(.,'\s+')[not(.=('selected','excluded'))]),' ')"/>
  </xsl:template>
  
    <xsl:template match="catalog">
      <div class="catalog">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template match="declarations"/>

   <xsl:template match="group">
     <div class="group{@class/concat(' ',.)}">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

  
  
  <xsl:template  match="control">
    <div class="control excluded{@class/concat(' ',.)}">
      <xsl:apply-templates/>
      <!--<xsl:for-each-group select="*" group-adjacent="@class">
        <xsl:choose>
          <xsl:when test="current-grouping-key()=('description','objective')">
            <div class="{current-grouping-key()}-group">
              <xsl:apply-templates select="current-group()"/>
            </div>        </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="current-group()"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each-group>-->
    </div>
  </xsl:template>
  
  <xsl:template  match="subcontrol">
    <div class="subcontrol excluded{@class/concat(' ',.)}">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="prop">
    <p class="prop{@class/concat(' ',.)}">
      <xsl:apply-templates select="." mode="label"/>
      <span class="value">
        <xsl:apply-templates/>
      </span>
    </p>
  </xsl:template>
  
  <xsl:template match="link">
    <p class="link{@rel/concat(' ',.)}">
      <xsl:apply-templates select="." mode="label"/>
      <span class="value">
        <xsl:apply-templates/>
      </span>
    </p>
  </xsl:template>
  
  <xsl:template match="prop[@class='number']"/>
  
  
  
   <xsl:template match="feat">
     <div class="feat{@class/concat(' ',.)}">
       <xsl:apply-templates select="." mode="label"/>
       <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template  match="stmt">
      <div class="stmt{@class/concat(' ',.)}">
        <xsl:apply-templates select="." mode="label"/>
        <xsl:apply-templates select="* except link[@rel='related']"/>
        <xsl:for-each-group select="link[@rel='related']" group-by="true()">
          <xsl:variable name="noun" select="if (count(current-group()) eq 1) then 'control' else 'controls'"/>
          <div class="related">
            <h5 class="label" xsl:expand-text="yes">Related {$noun}:</h5>
            <xsl:apply-templates select="current-group()" mode="inline"/>
          </div>
        </xsl:for-each-group>
      </div>
   </xsl:template>
  
  <xsl:template match="feat[@class=('statement','objective','statement-item')]" mode="label"/>
  
  <xsl:template match="prop[@class=('description','decision')]" mode="label"/>
  
  <xsl:template match="feat[@class=('assessment')]" mode="label">
    <h5 class="label">
      <xsl:value-of select="@class"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="prop[@class='method']"/>
    </h5>
  </xsl:template>
  
  <xsl:template match="prop[@class='method']"/>
  
  <xsl:template match="prop[@class='object']" mode="label">▸ </xsl:template>
  
  <xsl:template match="link[@class='related']" mode="label"/>
  
  
  <xsl:template match="link[@rel='related']" mode="inline">
    <span class="related">
      <xsl:apply-templates/>
    </span>
    <xsl:if test="not(position() eq last())">, </xsl:if>
  </xsl:template>
    
  
  <xsl:template match="stmt[@class='guidance']" mode="label">
    <h3>Supplemental Guidance</h3>
  </xsl:template>
  
  
   <xsl:template match="references">
      <div class="references">
        <h3>References</h3>
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template match="ref">
      <div class="ref">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

  <xsl:template  match="title | prop[@class=('description','decision')]" priority="10">
      <p class="{local-name()}{@class/concat(' ',.)}">
        <xsl:for-each select="../prop[@class='number']">
          <span class="num">
          <xsl:apply-templates/>
          </span>
          <xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="p">
      <p class="p">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="citation">
      <p class="citation">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

  <xsl:template match="prop" mode="label">
    <span class="label">
      <xsl:value-of select="@class"/>
      <xsl:text> </xsl:text>
    </span>
  </xsl:template>
  
  <xsl:template match="stmt" mode="label">
    <h3 class="label">
      <xsl:value-of select="(@class,'Statement')[1]"/>
      <xsl:text> </xsl:text>
    </h3>
  </xsl:template>
  
  <xsl:template match="feat" mode="label">
    <h5 class="label">
      <xsl:value-of select="@class"/>
    </h5>
  </xsl:template>
  
  <xsl:template match="link" mode="label">
    <span class="label">link: </span>
  </xsl:template>
  
  <xsl:template name="css">
      <style type="text/css">
html, body { font-size: 10pt }
div { margin-left: 1rem }

#xmljellysandwich_body { max-width: 80% }

.control > div, .subcontrol > div { margin-left: 0em }

.tag { color: green; font-family: sans-serif; font-size: 80%; font-weight: bold }


.catalog { }

.title { }

.control > .title { font-size: 140% }
.subcontrol > .title { font-size: 120% }

.declarations { }

.group { }

.control { }

.prop { }

.feat { }

.stmt { }

.p { }

.link { }

.references { }

.ref { }

.citation { }

.subcontrol { }

.label { font-family: sans-serif; font-size: 80%; font-weight: bold }

#xmljellysandwich_directory table { margin-left: 85%; font-size: 90%; margin-top: 1em; float: right; position: fixed;
  padding: 0.5em; background-color: lightsteelblue }

.selected { color: black }
.excluded { color: grey }

.control > .statement { border: thin solid black; margin-left: 0em; padding: 0.5em  }

.decision { border-left: thin solid black; padding-left: 1em  }

div.excluded div { display: none }

.control { border: thin solid black; padding: 0.5em; margin-top: 0.5em }
.subcontrol { border: thin dotted black; padding: 0.5em; margin-top: 0.5em }
.control * { margin-top: 0.5em; margin-bottom: 0em }
.control *:first-child { margin-top: 0em }

div.ref, div.related { margin-left: 0em; padding: 0.25em; background-color: lightsteelblue }
      </style>
   </xsl:template>



   <xsl:template priority="-0.4"
                 match="catalog | declarations | group | control | feat | stmt | references | ref | subcontrol">
      <div class="{name()}">
         <div class="tag">
            <xsl:value-of select="name()"/>: </div>
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template priority="-0.4" match="title | prop | p | link | citation">
      <p class="{name()}">
         <span class="tag">
            <xsl:value-of select="name()"/>: </span>
         <xsl:apply-templates/>
      </p>
   </xsl:template>



   <xsl:function name="xjs:classes">
      <xsl:param name="who" as="element()"/>
      <xsl:sequence select="tokenize($who/@class, '\s+') ! lower-case(.)"/>
   </xsl:function>

   <xsl:function name="xjs:has-class">
      <xsl:param name="who" as="element()"/>
      <xsl:param name="ilk" as="xs:string"/>
      <xsl:sequence select="$ilk = xjs:classes($who)"/>
   </xsl:function>
</xsl:stylesheet>
