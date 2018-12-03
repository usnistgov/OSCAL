<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml" use-character-maps="delimiters"/>
   <!-- METASCHEMA docs production -->
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:import href="file:/C:/Users/wap1/Documents/OSCAL/schema/demo/oscal-test-xml-converter.xsl"/>
   <xsl:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
   <xsl:import href="../lib/metaschema-json-html.xsl"/>
   <xsl:variable name="home" select="/"/>
   <xsl:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag"
            use="@name"/>
   <xsl:template priority="5" mode="expand-example"
                 match="define-assembly[exists(@acquire-from)] |             define-field[exists(@acquire-from)] |             define-flag[exists(@acquire-from)]"
                 expand-text="true">
      <xsl:variable name="defining" select="@name"/>
      <xsl:variable name="module" select="@acquire-from"/>
      <xsl:variable name="definition"
                    select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, $home))"/>
      <xsl:apply-templates select="$definition" mode="#current"/>
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
   
   <!--<xsl:template match="/">
      <xsl:apply-templates mode="expand-example" select="/"/>
      
      <!-\-<xsl:for-each select="$expanded/*">
         <html>
            <body>
               <xsl:apply-templates/>
            </body>
         </html>
      </xsl:for-each>-\->
   </xsl:template>-->
   
   <xsl:template match="/">
      <xsl:variable name="html">
         <xsl:for-each select="$expanded/*">
            <html>
               <body>
                  <xsl:apply-templates/>
               </body>
            </html>
         </xsl:for-each>
      </xsl:variable>
      <xsl:apply-templates select="$html" mode="md"/>
   </xsl:template>
   
   <xsl:template match="description | remarks" mode="jsonize"/>
   
   <xsl:template match="*" mode="jsonize">
      <xsl:variable name="near-json">
        <xsl:apply-templates select="." mode="xml2json"/>
      </xsl:variable>
      <xsl:apply-templates select="$near-json" mode="rectify"/>
   </xsl:template>
   
   <xsl:template match="example">
      <div class="example">
         <xsl:variable name="json-xml">
            <xsl:apply-templates select="*" mode="jsonize"/>
         </xsl:variable>
         <xsl:apply-templates select="description"/>
         <pre class="json">
            <!--<xsl:copy-of select="$json-xml"/>-->
            <xsl:if test="exists($json-xml/map)"
                    xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
               <xsl:value-of select="xml-to-json($json-xml,$write-options)"/>
            </xsl:if>
         </pre>
         <xsl:apply-templates select="remarks"/>
      </div>
   </xsl:template>
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:template match="example[@href='base-example.xml'][@path='/descendant::single-required-field[1]']"
                 mode="expand-example">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="node() | @*" mode="#current"/>
         <xsl:variable name="target"
                       xpath-default-namespace="urn:fakeup"
                       select="document( resolve-uri(@href,base-uri(.)))/descendant::single-required-field[1][1]"/>
         <xsl:for-each select="$target/..">
            <xsl:copy copy-namespaces="no">
               <xsl:copy-of select="$target" copy-namespaces="no"/>
            </xsl:copy>
         </xsl:for-each>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
