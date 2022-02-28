<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:o="http://csrc.nist.gov/ns/oscal/specml"
   xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="o">

   <xsl:strip-space elements="o:SPECIFICATION o:div o:ul o:li o:section o:mapping o:cf"/>

   <xsl:output method="html" omit-xml-declaration="yes"/>

   <xsl:template match="o:SPECIFICATION">
      <body>
         <xsl:apply-templates/>
      </body>
   </xsl:template>

   <!-- suppress since the page template produces the page header from YAML metadata -->
   <xsl:template match="o:SPECIFICATION/o:head">

   </xsl:template>

   <xsl:template match="o:head" mode="header-text">
     <xsl:apply-templates/>
   </xsl:template>

   <xsl:template match="o:head">
      <h1 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h1>
   </xsl:template>

   <xsl:template priority="1" match="o:section/o:head">
      <h2 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h2>
   </xsl:template>

   <xsl:template priority="2" match="o:section/o:section/o:head">
      <h3 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h3>
   </xsl:template>

   <xsl:template priority="2" match="o:div/o:head">
      <h3 class="divhead" id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h3>
   </xsl:template>

   <xsl:template priority="3" match="o:section/o:section/o:section/o:head">
      <h4 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h4>
   </xsl:template>

   <xsl:template priority="4" match="o:section/o:section/o:section/o:section/o:head">
      <h5 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h5>
   </xsl:template>

   <xsl:template priority="5" match="o:section/o:section/o:section/o:section/o:section/o:head">
      <h6 id="{generate-id()}-head">
         <xsl:apply-templates select="." mode="header-text"/>
      </h6>
   </xsl:template>

   <xsl:template match="o:p">
      <p>
        <xsl:apply-templates/>
      </p>
   </xsl:template>

   <xsl:template match="o:term">
      <b class="{local-name()}">
        <xsl:apply-templates/>
      </b>
   </xsl:template>

   <xsl:template match="o:q">
      <q class="{local-name()}">
         <xsl:apply-templates/>
      </q>
   </xsl:template>

   <!--<xsl:template match="o:div">
      <div class="{local-name()}">
         <xsl:apply-templates/>
      </div>
   </xsl:template>-->

   <xsl:template match="o:src">
      <code class="src">
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="o:tgt">
      <code class="tgt">
         <xsl:apply-templates/>
      </code>
   </xsl:template>
   
   <xsl:template match="o:int">
      <code class="int">
         <xsl:apply-templates/>
      </code>
   </xsl:template>
   
   <xsl:template match="o:ul">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>

   <xsl:key match="*[@id]" use="@id" name="by-id"/>

   <xsl:template match="o:xref">
      <xsl:text>[See: </xsl:text>
      <xsl:for-each select="key('by-id',@rid)/o:head">
         <a href="#{generate-id()}-head" class="xref">
            <xsl:apply-templates select="." mode="header-text"/>
         </a>
      </xsl:for-each>
      <xsl:text>]</xsl:text>
   </xsl:template>

   <xsl:template match="o:li">
      <li>
         <xsl:apply-templates/>
      </li>
   </xsl:template>

   <xsl:template match="o:code">
      <code class="{local-name()}">
         <xsl:apply-templates/>
      </code>
   </xsl:template>

   <xsl:template match="o:a">
      <a class="{local-name()}">
         <xsl:copy-of select="@href"/>
         <xsl:apply-templates/>
      </a>
   </xsl:template>

   <xsl:template match="o:em">
      <em class="{local-name()}">
         <xsl:apply-templates/>
      </em>
   </xsl:template>
   
   <xsl:template match="o:req">
      <span class="{local-name()} {@level}">
         <xsl:copy-of select="@id"/>
         <xsl:apply-templates select="." mode="reqlabel"/>
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   
   <xsl:template match="o:req" mode="reqlabel">
      <span class="reqlabel">
         <xsl:value-of select="@id"/>
      </span>
   </xsl:template>
   
   <xsl:template match="o:xpath">
      <b class="{local-name()}">
         <xsl:apply-templates/>
      </b>
   </xsl:template>

   <!--<xsl:template match="o:section">
      <section class="{local-name()}">
         <xsl:apply-templates/>
      </section>
   </xsl:template>-->

   <xsl:template match="o:mapping">
      <div class="mapping">
         <xsl:apply-templates/>
      </div>
   </xsl:template>

   <xsl:template match="o:tagging">
      <pre class="{local-name()}">
         <xsl:apply-templates/>
      </pre>
   </xsl:template>

   <xsl:template match="o:revisit">
      <span class="revisit">
        <xsl:apply-templates/>
      </span>
   </xsl:template>

   <xsl:template match="o:cf">
      <p class="{local-name()}">
         <b>See file:</b>
         <xsl:text> </xsl:text>
         <code class="filename">
            <xsl:value-of select="@file"/>
         </code>
      </p>
   </xsl:template>

</xsl:stylesheet>
