<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0"
                xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="xs m">
   
   <xsl:template match="m:METASCHEMA/m:short-name">
      <p>The short name (file identifier) for this schema shall be <i><xsl:apply-templates/></i>. It is used internally when an
         identifier is called for, and may appear in file names of schema artifacts.</p>
   </xsl:template>
   
   <xsl:template match="m:description" mode="model">
      <xsl:text>: </xsl:text>
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="m:remarks/m:p" mode="model">
      <br class="br"/>
      <xsl:apply-templates/>
   </xsl:template>
   
   <xsl:template match="m:choice">
      <li class="choice">A choice between
         <ul>
           <xsl:apply-templates/>
         </ul>
      </li>
   </xsl:template>

   <xsl:template  match="m:example">
      <div class="example">
         <h4>Example</h4>
      <pre class="example">
         <xsl:apply-templates select="*" mode="serialize"/>
      </pre>
      </div>
   </xsl:template>

   <xsl:template match="m:prose">
      <li class="prose">Prose contents (paragraphs and lists)</li>
   </xsl:template>

   <xsl:template  match="m:remarks">
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
      <xsl:element name="{local-name()}">
         <xsl:apply-templates/>
      </xsl:element>
   </xsl:template>
</xsl:stylesheet>