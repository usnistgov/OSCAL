<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:file="http://expath.org/ns/file"
  xmlns:p="http://www.w3.org/ns/xproc"

  xmlns="http://www.w3.org/1999/xhtml"

  exclude-result-prefixes="#all"
  version="3.0"
  expand-text="true">
  
<!-- Reads directory on file system and writes out a manifest of its contents.
  For XSLTs and XProcs, lists file dependencies (echoes calls on xsl:import, xsl:include, document() function etc.)
  Produces simple HTML suitable for auto-conversion into markdown
  e.g., pipeline this with a markdown serializer to produce a file auto-manifest.md
  -->
  
<!-- Next: connect up into pipeline for production of md
     Run and refine (checking against Gitlab)
     
  -->
  
  <xsl:param name="dirpath" as="xs:string"/>
  
  <xsl:template match="/*"/>
  
  <xsl:template match="/" name="go">
    <xsl:if test="$dirpath castable as xs:anyURI">
      <html>
        <body>
          <xsl:for-each-group select="file:list($dirpath, true())" group-by="replace(., '.*\.', '')">
            <div>
              <h3>{ current-grouping-key() }</h3>
              <xsl:apply-templates select="current-group()"/>
            </div>
          </xsl:for-each-group>
        </body>
      </html>
    </xsl:if>
  </xsl:template>

  <xsl:template match=".">
    <div>
      <h4> 
        <xsl:sequence select="."/>
      </h4>
    </div>
  </xsl:template>
  
  <xsl:template match=".[ends-with(.,'md')]"/>
  
  <xsl:template match=".[ends-with(.,'xsl') or ends-with(.,'xslt') or ends-with(.,'xpl')]">
    <xsl:variable name="filepath"  select="$dirpath || '/' || ."/>
    <xsl:if test="matches($filepath, '(xml|xpl|sch|xsl|xslt)$')">
      <div>
        <h4>
          <xsl:sequence select="."/>
        </h4>
        <xsl:apply-templates select="document($filepath)/*" mode="report"/>
      </div>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="xsl:stylesheet | xsl:transform" mode="report">
    <xsl:variable name="templatecount" select="count(xsl:template)"/>
    <p>XSLT stylesheet version { @version } ({ $templatecount } { if ($templatecount eq 1) then 'template' else 'templates' })</p>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="xsl:stylesheet/xsl:param" mode="report">
    <p>Runtime parameter <code>{ @name }</code> { @as/(' as ' || .) }</p>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  <xsl:template match="comment()[matches(.,'^\s*(OSCAL|Purpose|Dependencies|Input|Output|Note|Limitations?):')]"  mode="report">
    <p>
      <xsl:value-of select="normalize-space(.)"/>
    </p>
  </xsl:template>
  
  <xsl:template match="xsl:include | xsl:import" mode="report">
    <p>Compile-time dependency ({ name() }) <code>{ @href }</code></p>
  </xsl:template>
  
  <xsl:template match="p:declare-step | p:pipeline" mode="report">
    <xsl:variable name="stepcount" select="count(.//p:xslt | .//p:identity)"/>
    <p>XProc pipeline version { @version } ({ $stepcount } { if ($stepcount eq 1) then 'step' else 'steps' })</p>
    <xsl:apply-templates mode="#current"/>
  </xsl:template>
  
  
  <xsl:template match="p:document" mode="report">
    <p>Runtime dependency: <code>{ @href }</code></p>
  </xsl:template>
  
  <xsl:template match="text()" mode="report"/>
  
</xsl:stylesheet>