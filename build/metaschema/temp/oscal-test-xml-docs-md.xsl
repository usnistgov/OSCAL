<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                exclude-result-prefixes="#all"><!-- METASCHEMA docs production --><!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
   <xsl:import href="../lib/metaschema-xml-html.xsl"/>
   <xsl:variable name="home" select="/"/>
   <xsl:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag"
            use="@name"/>
   <xsl:output method="text"/>
   <xsl:template priority="5"
                 match="define-assembly[exists(@acquire-from)] |             define-field[exists(@acquire-from)] |             define-flag[exists(@acquire-from)]"
                 expand-text="true">
      <xsl:variable name="defining" select="@name"/>
      <xsl:variable name="module" select="@acquire-from"/>
      <xsl:variable name="definition"
                    select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, $home))"/>
      <xsl:apply-templates select="$definition"/>
      <xsl:if test="empty($definition)"><!-- No definition found for { $defining } in { $module } at { /METASCHEMA/import[@name=$module]/@href }--></xsl:if>
   </xsl:template>
   <xsl:template match="node() | @*" mode="expand-example">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="node() | @*" mode="#current"/>
      </xsl:copy>
   </xsl:template>
   <xsl:variable name="expanded">
      <xsl:apply-templates mode="expand-example" select="/"/>
   </xsl:variable>
   <xsl:template match="/">
      <xsl:variable name="html">
         <xsl:for-each select="$expanded/*">
            <html xmlns="http://www.w3.org/1999/xhtml">
               <body>
                  <xsl:apply-templates/>
               </body>
            </html>
         </xsl:for-each>
      </xsl:variable>
      <xsl:apply-templates select="$html" mode="md"/>
   </xsl:template>
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:template match="example[@href='base-example.xml'][@path='/descendant::single-required-field[1]']"
                 mode="expand-example">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="node() | @*" mode="#current"/>
         <xsl:copy-of select="document( resolve-uri(@href,base-uri(.)))/descendant::single-required-field[1]"
                      copy-namespaces="no"
                      xpath-default-namespace="urn:fakeup"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
