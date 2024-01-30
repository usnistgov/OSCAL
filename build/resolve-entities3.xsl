<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:math="http://www.w3.org/2005/xpath-functions/math"
   xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
   exclude-result-prefixes="xs math"
   version="3.0">
   
<!--
     Purpose: Process XML files through a parsing/serialization that resolves internal parsed entities.

     Also renames file references in METASCHEMA/import/@href
     using $importHrefSuffix to suffix the base name
       so for $importHrefSuffix='NEW'
       import href="a_metaschema_module.xml" becomes href="a_metaschema_module_NEW.xml"
     
     Otherwise this is an identity transform, so a diff over source and results should show only stated changes.
     
     Parameter: $importHrefSuffix is 'RESOLVED' by default
  
     XSpec: See the XSpec resolve-entities.xspec for functional testing, including the edge cases.

     Compared to old resolve-entities.xsl: This XSLT provides the same outputs
     for 'normal' inputs i.e. when import/@href ends in '.xml'.
   
     For extraordinary inputs it does a little differently.
     
   -->
   
   <!-- since whitespace is retained from input, it provides indenting
        - if (schema-based) strip-space is operative, switch @indent to 'yes'-->
   <xsl:output omit-xml-declaration="no" indent="no" encoding="ASCII"/>
   
   <xsl:param name="importHrefSuffix" select="'RESOLVED'"/>
   
   <!-- copying everything through -->
   <xsl:mode on-no-match="shallow-copy"/>
   
   <xsl:template match="import/@href">
      <xsl:param     name="splice"   select="'_' || $importHrefSuffix"/>
      
      <xsl:variable  name="basename" select="replace(.,'\.[^.]*$','')"/>
      <xsl:attribute name="href"     select="$basename || $splice || substring-after(.,$basename)"/>
   </xsl:template>
   
</xsl:stylesheet>