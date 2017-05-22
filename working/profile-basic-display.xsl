<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:oscal="http://scap.nist.gov/schema/oscal"
  version="1.0">
  
  <xsl:import href="oscal-basic-display.xsl"/>
  
  <xsl:template match="oscal:call">
    <xsl:variable name="catalog" select="document(ancestor::oscal:invoke/@href,/)"/>
    <xsl:apply-templates select="$catalog/oscal:catalog">
      <xsl:with-param name="caller" select="."/>
    </xsl:apply-templates>
    
  </xsl:template>
    
  <xsl:key name="control-by-id"    match="oscal:control" use="@id"/>
  <xsl:key name="subcontrol-by-id" match="oscal:subcontrol" use="@id"/>
  <xsl:key name="param-by-id"      match="oscal:param" use="@id"/>
  
    <xsl:template match="oscal:catalog">
      <xsl:param name="caller" select="/.."/>
      <xsl:apply-templates select="key('control-by-id',$caller/@control-id)"/>
      
      <!-- caller is gonna be an oscal:call with an @id we want -->
      
          </xsl:template>
  
    
    
      
</xsl:stylesheet>