<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="text" use-character-maps="delimiters"/>
   <!-- METASCHEMA docs production -->
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:import href="file:/home/wendell/Documents/OSCAL/schema/demo/oscal-test-xml-converter.xsl"/>
   <xsl:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
   <xsl:import href="../lib/metaschema-json-html.xsl"/>
   <xsl:param name="json-file" as="xs:string?" select="()"/>
   <xsl:param name="json-indent" as="xs:string">yes</xsl:param>
   <xsl:variable name="imported" select="/METASCHEMA/import/document(@href,/)"/>
   <xsl:variable name="all-references" select="//flag/@name | //model//*/@named"/>
   <xsl:variable name="here-declared"
                 as="element()*"
                 select="//define-flag | //define-field | //define-assembly"/>
   <xsl:key name="definitions"
            match="define-flag | define-field | define-assembly"
            use="@name"/>
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
            <html>
               <body>
                  <xsl:apply-templates/>
                  <xsl:apply-templates select="$imported/key('definitions',$all-references,.)[not(@name=$here-declared/(@name|@named))]"/>
               </body>
            </html>
         </xsl:for-each>
      </xsl:variable>
      <xsl:apply-templates select="$html" mode="md"/>
   </xsl:template>
   <xsl:template match="description | remarks" mode="jsonize"/>
   <xsl:template match="*" mode="jsonize">
      <xsl:apply-templates select="." mode="xml2json"/>
   </xsl:template>
   <xsl:template match="example">
      <div class="example">
         <xsl:variable name="json-xml">
            <xsl:apply-templates select="*" mode="jsonize"/>
         </xsl:variable>
         <xsl:variable name="rectified">
            <xsl:apply-templates select="$json-xml" mode="rectify"/>
         </xsl:variable>
         <xsl:apply-templates select="description"/>
         <pre class="json">
            <xsl:if test="exists($rectified/map)"
                    xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
               <xsl:value-of select="xml-to-json($rectified,$write-options)"/>
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
                       xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
                       select="document('base-example.xml',.)/descendant::single-required-field[1][1]"/>
         <xsl:for-each select="$target/..">
            <xsl:copy copy-namespaces="no">
               <xsl:copy-of select="$target" copy-namespaces="no"/>
            </xsl:copy>
         </xsl:for-each>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
