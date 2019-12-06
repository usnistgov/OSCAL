
declare namespace xsl = "http://www.w3.org/1999/XSL/Transform";
<xsl:stylesheet version="1.0">{
let $library := 
  <docs>
    <doc>file:/C:/Users/wap1/Documents/usnistgov/OSCAL/src/specifications/profile-resolution/profile-resolution-working-specml.xml</doc>
  </docs>
  
let $doc-set := $library/doc/doc(.)

for $n in distinct-values($doc-set//*/local-name())
return <xsl:template match="{$n}">
    
  <xsl:apply-templates/>
  </xsl:template>
  }
  </xsl:stylesheet>