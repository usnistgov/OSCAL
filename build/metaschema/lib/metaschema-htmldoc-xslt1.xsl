<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="1.0"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                xmlns="http://www.w3.org/1999/xhtml"
                exclude-result-prefixes="xs m">
   
   
   
   <xsl:template match="m:METASCHEMA/m:short-name">
      <p>
         <span class="usa-tag">Short name</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <xsl:template match="m:METASCHEMA/m:schema-version">
      <p>
         <span class="usa-tag">Schema version</span>
         <xsl:text> </xsl:text>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <xsl:template match="m:description" mode="model">
      <xsl:text> </xsl:text>
      <span class="model-description">
         <xsl:apply-templates/>
      </span>
   </xsl:template>
   
   <xsl:template match="m:choice">
      <li class="choice">A choice between:
         <ul>
           <xsl:apply-templates/>
         </ul>
      </li>
   </xsl:template>

   <!--<xsl:template  match="m:example">
      <div class="example">
         <pre class="example font-mono-sm">
           <xsl:apply-templates select="*" mode="serialize"/>
         </pre>
      </div>
   </xsl:template>-->

   <xsl:template match="m:prose">
      <li class="prose">Prose contents (paragraphs and lists)</li>
   </xsl:template>

   <xsl:template match="m:allowed-values">
      <xsl:choose>
        <xsl:when test="@allow-other and @allow-other='yes'">
          <p>The value may be locally defined, or one of the following:</p>
        </xsl:when>
        <xsl:otherwise>
          <p>The value must be one of the following:</p>
        </xsl:otherwise>
      </xsl:choose>
      <ul>
        <xsl:apply-templates/>
      </ul>   
   </xsl:template>

   <xsl:template match="m:allowed-values/m:enum">
     <li><strong><xsl:value-of select="@value"/></strong><xsl:if test="node()">: <xsl:apply-templates/></xsl:if></li>     
   </xsl:template>

  <xsl:template match="m:remarks">
     <div class="remarks">
         <xsl:apply-templates/>
      </div>
   </xsl:template>
   
   
   <xsl:template match="m:formal-name"/>
      
   <xsl:template match="m:formal-name" mode="inline">
      <b class="formal-name">
         <xsl:apply-templates/>
      </b>
   </xsl:template>

   <xsl:template match="m:description">
      <p class="description">
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <xsl:template match="m:example/m:description">
      <p class="description">
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   
   <!--<xsl:template match="m:example/m:remarks">
      <div class="remarks">
          <xsl:apply-templates/>
      </div>
   </xsl:template>-->
   
   <xsl:template  match="m:p">
      <p class="p">
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   
   <xsl:template match="m:code">
      <code>
         <xsl:apply-templates/>
      </code>
   </xsl:template>
   
   <xsl:template match="m:q">
      <q>
         <xsl:apply-templates/>
      </q>
   </xsl:template>

   <xsl:template match="m:em | m:strong | m:b | m:i | m:u">
      <xsl:element name="{local-name(.)}" namespace="http://www.w3.org/1999/xhtml">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>

   <xsl:template match="m:a">
     <a href="{@href}"><xsl:apply-templates/></a>
   </xsl:template>
    
   <xsl:template match="*" mode="serialize">
      <!--<xsl:call-template name="indent-for-pre"/>-->
      
      <code class="tag">&lt;<xsl:value-of select="name(.)"/>
         <xsl:for-each select="@*">
            <xsl:text> </xsl:text>
            <xsl:value-of select="name()"/>
            <xsl:text>="</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
         </xsl:for-each>
         <xsl:text>&gt;</xsl:text>
      </code>
      
      <xsl:apply-templates mode="serialize">
         <xsl:with-param name="hot" select="boolean(text()[normalize-space(.)])"/>
      </xsl:apply-templates>
      
      <!--<xsl:if test="not(text()[normalize-space(.)])">
         <xsl:call-template name="indent-for-pre">
            <xsl:with-param name="endtag" select="true()"/>
         </xsl:call-template>
      </xsl:if>-->
      <code class="tag">&lt;/<xsl:value-of select="name(.)"/>
         <xsl:text>&gt;</xsl:text>
      </code>
   </xsl:template>
   
   <xsl:template name="indent-for-pre">
      <xsl:param name="endtag" select="false()"/>
      <!-- Pretty heavy duty doing this under XSLT 1.0 -->
      <xsl:variable name="inline" select="boolean(../text()[normalize-space(.)])"/>
      <xsl:variable name="all-ancestors" select="ancestor::*"/>
      <xsl:variable name="example-ancestors" select="ancestor::m:example/ancestor::*"/>
      <xsl:variable name="depth" select="count($all-ancestors) - count($example-ancestors)"/>
      
      <xsl:if test="not($inline)">
         <!-- No CR for the first one -->
         <xsl:if test="boolean(preceding-sibling::*) or not(parent::m:example) or $endtag">
            <xsl:text>&#xA;</xsl:text>
         </xsl:if>
         <!-- check out the ancient method for a loop -->
         <xsl:for-each select="ancestor::*[position() &lt; $depth]">
            <xsl:text>  </xsl:text>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   
   <xsl:template match="text()" mode="serialize">
      <xsl:param name="hot" select="boolean(../text()[normalize-space(.)])"/>
      <xsl:if test="$hot">
         <xsl:value-of select="."/>
      </xsl:if>
   </xsl:template>
   
   
   
</xsl:stylesheet>