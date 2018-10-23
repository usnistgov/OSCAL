<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
                version="3.0"
                xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
                exclude-result-prefixes="#all"><!-- METASCHEMA docs production --><!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:import href="metaschema-xml-html.xsl"/>
   <xsl:output method="text"/>
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
                  <xsl:apply-templates select="$imported/key('definitions',$all-references,.)[not(@name=$here-declared/(@name|@named))]"/>
               </body>
            </html>
         </xsl:for-each>
      </xsl:variable>
      <xsl:apply-templates select="$html" mode="md"/>
   </xsl:template>
   <xsl:mode name="md" default-mode="md" on-no-match="shallow-skip"/>
   <xsl:template match="/"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml"><!-- Ensures XML output for XProc. Strip this element (or simply serialize using @method='text') to get your Markdown! -->
      <md>
         <xsl:apply-templates mode="#current"/>
      </md>
   </xsl:template>
   <xsl:variable name="lf1" xml:space="preserve"><xsl:text>
</xsl:text></xsl:variable>
   <xsl:variable name="lf2" xml:space="preserve"><xsl:text>

</xsl:text></xsl:variable>
   <xsl:template mode="md"
                 match="head"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
   <xsl:template match="h1 | h2 | h3 | h4 | h5 | h6"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="$lf2"/>
      <xsl:for-each select="1 to (replace(local-name(),'^h','') cast as xs:integer)">#</xsl:for-each>
      <xsl:text xml:space="preserve"> </xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="p[@class='toc-line']"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="$lf1"/>
      <xsl:text>&gt; </xsl:text>
      <xsl:for-each select="ancestor::div[@class='toc']" xml:space="preserve">  </xsl:for-each>
      <xsl:text>* </xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="blockquote"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="$lf1"/>
      <xsl:if test="empty(*)">&gt; </xsl:if>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="blockquote/p"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="$lf1"/>
      <xsl:text>&gt; </xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="p"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="$lf2"/>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml"><!-- double escaped! -->
      <xsl:text>&amp;lt;</xsl:text>
      <xsl:apply-templates mode="#current"/>
      <!-- Heh -->
      <xsl:text>&gt;</xsl:text>
   </xsl:template>
   <xsl:template match="div[contains-token(@class,'element-description')]/span[contains(@class,'tag')]"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text>@</xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="code | span[contains(@class,'code')]"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text>`</xsl:text>
      <xsl:apply-templates mode="#current"/>
      <xsl:text>`</xsl:text>
   </xsl:template>
   <xsl:template match="em | i"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text>*</xsl:text>
      <xsl:apply-templates mode="#current"/>
      <xsl:text>*</xsl:text>
   </xsl:template>
   <xsl:template match="strong | b"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text>**</xsl:text>
      <xsl:apply-templates mode="#current"/>
      <xsl:text>**</xsl:text>
   </xsl:template>
   <xsl:template match="q"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text>"</xsl:text>
      <xsl:apply-templates mode="#current"/>
      <xsl:text>"</xsl:text>
   </xsl:template>
   <xsl:key name="element-by-id"
            match="*[exists(@id)]"
            use="@id"
            xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
   <xsl:template match="a[starts-with(@href,'#')]"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:variable name="link-target"
                    select="key('element-by-id',substring-after(@href,'#'))"/>
      <xsl:text>[</xsl:text>
      <xsl:value-of select="replace(.,'&lt;','&amp;lt;')"/>
      <xsl:text>]</xsl:text>
      <xsl:text>(#</xsl:text>
      <xsl:value-of select="$link-target/*[1] =&gt; normalize-space() =&gt; lower-case() =&gt; replace('\s+','-') =&gt; replace('[^a-z\-\d]','')"/>
      <xsl:text>)</xsl:text>
   </xsl:template>
   <xsl:template match="pre"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text xml:space="preserve">

```</xsl:text>
      <xsl:value-of select="@class[.=('xml','json')]"/>
      <xsl:text xml:space="preserve">
</xsl:text>
      <xsl:value-of select="replace(.,'(^\n+|\n+$)','')"/>
      <xsl:text xml:space="preserve">
```
</xsl:text>
   </xsl:template>
   <xsl:template match="pre//text()"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="."/>
   </xsl:template>
   <xsl:template match="text()"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:value-of select="replace(.,'\s+',' ')"/>
   </xsl:template>
   <xsl:template match="ul"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text xml:space="preserve">
</xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="ul//ul"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="li"
                 mode="md"
                 xpath-default-namespace="http://www.w3.org/1999/xhtml">
      <xsl:text xml:space="preserve">
</xsl:text>
      <xsl:for-each select="../ancestor::ul">
         <xsl:text xml:space="preserve">  </xsl:text>
      </xsl:for-each>
      <xsl:text>* </xsl:text>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <!-- XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX -->
   <xsl:template match="example[@href='base-example.xml'][@path='/descendant::single-required-field[1]']"
                 mode="expand-example">
      <xsl:copy copy-namespaces="no">
         <xsl:apply-templates select="node() | @*" mode="#current"/>
         <xsl:copy-of select="document( resolve-uri(@href,base-uri(.)))/descendant::single-required-field[1]"
                      copy-namespaces="no"
                      xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"/>
      </xsl:copy>
   </xsl:template>
</xsl:stylesheet>
