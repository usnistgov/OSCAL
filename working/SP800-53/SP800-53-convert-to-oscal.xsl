<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet   version="2.0"
  
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:feed="http://scap.nist.gov/schema/sp800-53/feed/2.0"
  xmlns:html="http://www.w3.org/1999/xhtml"
  xmlns:xlink="https://www.w3.org/TR/xlink/"
  xpath-default-namespace="http://scap.nist.gov/schema/sp800-53/2.0"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
   exclude-result-prefixes="#all"
  >

  <xsl:strip-space elements="feed:controls feed:control description html:div html:ol supplemental-guidance references control-enhancements control-enhancement objectives objective decisions decision potential-assessments potential-assessment withdrawn statement"/>


  <xsl:output indent="yes"/>
  
  <xsl:variable name="source" select="/"/>
  
  <xsl:variable name="objectives" select="if (true()) then document('800-53a-objectives.xml',$source) else ()"/>
  
  <xsl:template match="feed:controls">
    <catalog>
      <title>NIST SP800-53</title>
      <declarations href="SP800-53-declarations.xml"/>

      <xsl:for-each-group select="feed:control" group-by="family">
        <group class="family">
          <title><xsl:value-of select="current-grouping-key()"/></title>
          <xsl:apply-templates select="current-group()"/>
        </group>
      </xsl:for-each-group>
    </catalog>
  </xsl:template>
  
  <xsl:template match="feed:control">
    <control class="SP800-53">
      <xsl:variable name="this" select="."/>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="* except (title | references)"/>
      <xsl:apply-templates mode="integrate-objectives" select="$objectives/key('control-by-no',$this/number/replace(.,'\s',''),.)"/>
      <xsl:apply-templates select="control-enhancements/control-enhancement"/>
      <xsl:apply-templates select="references"/>    
    </control>
  </xsl:template>
  
  <!--suppressed in default traversal-->
  <xsl:template match="control-enhancements"/>
  
  <!-- space has to be stripped to integrate across disparities -->
  <xsl:key match="feed:control | control-enhancement" name="control-by-no" use="replace(number,'\s','')"/>
  
  <xsl:template mode="integrate-objectives" match="feed:control[exists(withdrawn)] | control-enhancement[exists(withdrawn)]"/>
    
    
    <xsl:template mode="integrate-objectives" match="feed:control | control-enhancement">
      <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template mode="integrate-objectives" match="title | number | control-enhancements"/>
  
  <xsl:template mode="integrate-objectives" match="feed:control/* | control-enhancement/*" priority="-0.1">
    <xsl:apply-templates select="." mode="#default"/>
  </xsl:template>
  
  <xsl:template match="title">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>
  
  <!-- Accounted for by 'div' grouping. -->
  <xsl:template match="family"/>
  
  <xsl:template match="control-class">
    <prop class="{name()}">
      <xsl:apply-templates/>
    </prop>
  </xsl:template>
  
<!--  <xsl:template match="family">
    <xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
  </xsl:template>
-->  

  <xsl:template match="number">
    <prop class="name">
      <xsl:apply-templates/>
    </prop>
  </xsl:template>
  
  <xsl:template match="descriptions | decisions | objectives | potential-assessments">
      <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="references">
    <references>
      <!--<xsl:apply-templates select="." mode="group-label"/>-->
      <xsl:apply-templates/>
    </references>
  </xsl:template>
  
  <xsl:template match="control-enhancement">
    <subcontrol class="SP800-53-enhancement">
      <xsl:variable name="this" select="."/>
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="@* except @sequence" mode="asElement"/>
      
      <xsl:apply-templates select="* except title"/>
      <xsl:apply-templates mode="integrate-objectives"
        select="$objectives/key('control-by-no',$this/number/replace(.,'\s',''),/)"/>
    </subcontrol>
  </xsl:template>
  
  <xsl:template match="statement">
    <part class="statement">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="statement/statement" priority="2">
    <part class="item">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="statement/statement/statement" priority="3">
    <part class="item">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="statement/description">
      <p class="description">
        <xsl:apply-templates select="@*" mode="asElement"/>
        <xsl:apply-templates/>
      </p>
  </xsl:template>
  
  <xsl:template match="related">
    <link rel="related" href="#{normalize-space(.)}">
      <xsl:apply-templates/>
    </link>
  </xsl:template>
  
  <xsl:template match="description">
      <p>
        <xsl:apply-templates/>
      </p>
  </xsl:template>
  
  <!-- In latest sp80053a, objective is recursive,
       resulting in nested part//part -->
  
  <xsl:template match="objective">
    <part class="objective">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="supplemental-guidance">
    <part class="guidance">
      <xsl:apply-templates select="@*" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="decision">
    <p class="decision">
        <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="@*" mode="asElement">
    <prop class="{name()}"><xsl:value-of select="."/></prop>
  </xsl:template>
  
  <xsl:template match="@sequence" mode="asElement"/>
  
  <xsl:template match="potential-assessment">
    <part class="assessment">
      <xsl:apply-templates select="@* except @sequence" mode="asElement"/>
      <xsl:apply-templates/>
    </part>
  </xsl:template>
  
  <xsl:template match="object">
    <p class="object">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="priority | baseline-impact">
    <xsl:comment> <xsl:value-of select="local-name()"/>
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."/>
      <xsl:text>) will be projected by baselines </xsl:text> 
    </xsl:comment>
    <!--<prop class="{name()}">
      <xsl:apply-templates/>
    </prop>-->  
  </xsl:template>

  <xsl:template match="reference">
    <ref>
       <xsl:apply-templates/>
    </ref>
  </xsl:template>
  
  <xsl:template match="item">
    <citation>
      <!-- NISO STS -->
      <xsl:apply-templates select="@href"/>
      <!--<xsl:comment> or STS &lt;std> ... </xsl:comment>-->
      <xsl:apply-templates/>
    </citation>
  </xsl:template>
  
  <xsl:template match="@href">
    <xsl:attribute name="href">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>
  
  <xsl:template match="html:div">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="html:div[exists(child::text()[matches(.,'\S')])]">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  

  <xsl:template match="withdrawn">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="incorporated-into">
    <link rel="incorporated-into" href="#{normalize-space(.)}">
      <xsl:apply-templates/>
    </link>
  </xsl:template>
  
  <xsl:template match="html:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!--<xsl:template match="html:ol">
    <list list-type="ordered">
      <xsl:apply-templates/>
    </list>
  </xsl:template>
  
  
  <xsl:template match="html:li">
    <list-item>
      <p>
        <!-\-<xsl:copy-of select="@class"/>-\->
        <xsl:apply-templates select="node() except html:ol"/>
      </p>
      <!-\- safe since in the input, nested html lists are always at the ends of their items. -\->
      <xsl:apply-templates select="html:ol"/>
    </list-item>
  </xsl:template>

  <!-\- Sorry ... -\->
  <xsl:template match="html:em">
    <italic>
      <xsl:apply-templates/>
    </italic>
  </xsl:template>-->
  
  <xsl:template match="html:*">
    <xsl:element name="{local-name()}">
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="*">
    <xsl:message terminate="no">
      <xsl:value-of select="name()"/>
      <xsl:text> NOT MATCHED </xsl:text>
    </xsl:message>
    <xsl:next-match/>
  </xsl:template>
  
</xsl:stylesheet>