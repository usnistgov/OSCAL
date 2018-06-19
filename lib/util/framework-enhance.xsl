<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
<!-- Purpose: Enhances OSCAL tagging with *purported* links by performing lookups
     in a catalog and rewriting the links as resolved. A demonstration. -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="link">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="." mode="tag-href"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Catalog URL is absolute or relative to document -->
    <xsl:param name="catalog-path" as="xs:string" required="yes"/>
    <xsl:param name="frameworkURI" as="xs:string" required="yes"/>
    
    <xsl:variable name="source" select="/"/>
    <xsl:variable name="catalog"      select="document(resolve-uri($catalog-path,$frameworkURI))"/>
    <xsl:variable name="catalog-okay" select="exists($catalog/(catalog|framework))"/>
    
    <xsl:param name="key-property" as="xs:string">name</xsl:param>

    <xsl:key   name="component-by-key"
        match="component | control | subcontrol"
        use="child::prop[contains-token(@class,$key-property)]"/>
    
    <!-- pops an href pointing to a target. Can also warn (w/ comments)
         if resolution fails or misses (again @rel, e.g.) -->
    <xsl:template match="link" mode="tag-href">
        <xsl:variable name="value" select="normalize-space(.)"/>
        <xsl:variable name="target" select="$catalog/key('component-by-key',$value)"/>
      <xsl:for-each select="$target">
          <xsl:attribute name="href">
              <xsl:value-of select="$catalog-path || '#' || @id"/>
          </xsl:attribute>
      </xsl:for-each>  
        <xsl:if test="empty($target)">
            <xsl:comment expand-text="true"> No $target at { $target } </xsl:comment>
        </xsl:if>
        <xsl:if test="not($catalog-okay)">
            <xsl:comment expand-text="true"> Catalog (framework) at { $catalog-path } is NOT okay</xsl:comment>
        </xsl:if>
        <!-- if empty($target) or not($catalog-okay) etc. produce warnings here? -->
    </xsl:template>
    
    
</xsl:stylesheet>