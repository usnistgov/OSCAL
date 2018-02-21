<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  exclude-result-prefixes="#all"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  version="2.0">

  <!-- Data extraction and mapping from ISO EPUB into (draft) OSCAL -->

  <xsl:strip-space elements="body div table tbody tr td"/>
  
  <xsl:output indent="yes"/>

  <xsl:template match="/">
    <catalog>
      <title>ISO/IEC 27002</title>
      <declarations>
        <declare-prop context="control-category" class="number">
          <required/>
          <identifier/>
          <regex>^\d\d?$</regex>
        </declare-prop>
        <declare-prop context="clause" class="number">
          <required/>
          <identifier/>
          <calc><inherit/><autonum>.1</autonum></calc>
        </declare-prop>
        <declare-part context="clause" class="objective">
          <required/>
        </declare-part>
        <declare-prop context="iso-27002" class="number">
          <required/>
          <identifier/>
          <calc><inherit/><autonum>.1</autonum></calc></declare-prop>
        <declare-part context="control" class="description">
          <required/>
        </declare-part>
        <declare-part context="control" class="guidance"/>
        <declare-part context="control" class="information"/>
      </declarations>
      
      <xsl:apply-templates select="/*/body/div/div[@class = 'MainContent'][2]"/>
    </catalog>

  </xsl:template>

  <xsl:variable name="statement-headers" as="element()*">
    <title>Control</title>
    <title>Implementation guidance</title>
    <title>Other information</title>
  </xsl:variable>

  <xsl:template match="div[@class = 'MainContent']">
    <xsl:variable name="after-intro" select="h1[@id = 'toc_marker-9']/(. | following-sibling::*)"/>
    <xsl:variable name="in-bibliography" select="h1[@id = 'toc_marker-58']/(.|following-sibling::*)"/>
    <xsl:for-each-group select="$after-intro except $in-bibliography" group-starting-with="h1">
      <xsl:variable name="category-head" select="current-group()/self::h1"/>
      <group class="control-category">
        <xsl:apply-templates select="$category-head" mode="no-num"/>
        <xsl:apply-templates select="$category-head" mode="num"/>
        <xsl:for-each-group select="current-group() except $category-head" group-starting-with="h2">
          <xsl:variable name="clause-head" select="current-group()/self::h2"/>
          <group class="clause">
            <xsl:variable name="first-control-head" select="(current-group()/self::h3)[1]"/>
            <xsl:variable name="controls"
              select="$first-control-head | current-group()[. >> $first-control-head]"/>

            <!-- Before the controls comes a title and a statement -->
            
            <xsl:apply-templates select="$clause-head" mode="no-num"/>
            <xsl:apply-templates select="$clause-head" mode="num"/>
            
            <xsl:apply-templates select="current-group() except ($clause-head|$controls)"/>
            
            <xsl:for-each-group select="$controls" group-starting-with="h3">
              <control class="iso-27002">
<!--                <prop name="category">
                  <xsl:value-of select="$category-head/replace(normalize-space(), '^[\d\s\.]+', '')"
                  />
                </prop>
                <prop name="clause">
                  <xsl:value-of select="$clause-head/replace(normalize-space(), '^[\d\s\.]+', '')"/>
                </prop>-->
                <xsl:variable name="head" select="current-group()/self::h3"/>
                <xsl:apply-templates select="$head" mode="no-num"/>
                <xsl:apply-templates select="$head" mode="num"/>
                <xsl:for-each-group select="current-group() except $head"
                  group-starting-with="p[normalize-space(.) = $statement-headers]">
                  <xsl:variable name="statement-head"
                    select="current-group()[normalize-space(.) = $statement-headers]"/>
                  <xsl:choose>
                    <xsl:when test="$statement-head = 'Control'">
                      <part class="description">
                        <xsl:call-template name="structure-lines">
                          <xsl:with-param name="lines"
                            select="current-group() except $statement-head"/>
                        </xsl:call-template>
                      </part>
                    </xsl:when>
                    <xsl:when test="$statement-head = 'Implementation guidance'">
                      <part class="guidance">
                        <xsl:call-template name="structure-lines">
                          <xsl:with-param name="lines"
                            select="current-group() except $statement-head"/>
                        </xsl:call-template>
                      </part>
                    </xsl:when>
                    <xsl:when test="$statement-head = 'Other information'">
                      <part class="information">
                        <xsl:call-template name="structure-lines">
                          <xsl:with-param name="lines"
                            select="current-group() except $statement-head"/>
                        </xsl:call-template>
                      </part>
                    </xsl:when>
                    <xsl:otherwise>
                      <part class="{replace(lower-case(normalize-space($statement-head)),' ','-')}">
                        <xsl:call-template name="structure-lines">
                          <xsl:with-param name="lines"
                            select="current-group() except $statement-head"/>
                        </xsl:call-template>
                      </part>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each-group>
              </control>
            </xsl:for-each-group>
          </group>
        </xsl:for-each-group>
      </group>
    </xsl:for-each-group>

    <references>
      <xsl:apply-templates select="$in-bibliography" mode="bibliography"/>
    </references>
  </xsl:template>

  <xsl:template name="structure-lines">
    <xsl:param name="lines"/>
    <xsl:for-each-group select="$lines" group-adjacent="starts-with(@class, 'List-Number')">
      <xsl:choose>
        <xsl:when test="current-grouping-key()">
          <xsl:call-template name="two-level-list"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="current-group()"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each-group>
  </xsl:template>

  <xsl:template name="two-level-list">
    <ol>
      <xsl:for-each-group select="current-group()" group-starting-with="p[@class = 'List-Number']">
        <li>
          <xsl:apply-templates
            select="current-group()[1]/span[@class = 'List-Number-Spacing']/following-sibling::node()"/>
          <xsl:if test="exists(current-group()[2])">
            <ol>
              <xsl:apply-templates select="current-group() except current-group()[1]"/>
            </ol>
          </xsl:if>
        </li>

      </xsl:for-each-group>
    </ol>
  </xsl:template>

  <xsl:template match="p[starts-with(@class, 'List-Number')]">
    <li>
      <!-- All list items have numbers followed by a spacing span (we drop both) -->
      <xsl:apply-templates select="span[@class = 'List-Number-Spacing']/following-sibling::node()"/>
    </li>
  </xsl:template>

  <xsl:template match="h1 | h2 | h3" mode="#all">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>
  
  <!-- title will be implicit with 'references' wrapper -->
  <xsl:template match="h1" mode="bibliography" priority="5"/>
  
  <xsl:template match="h1 | h2 | h3" mode="no-num" priority="5">
    <title>
      <xsl:value-of select="replace(.,'^[\d\s\.]+','')"/>
    </title>
  </xsl:template>
  
  <xsl:template match="h1 | h2 | h3" mode="num" priority="5">
    <prop class="number">
      <xsl:value-of select="replace(.,'[^\d\.].*$','')"/>
    </prop>
  </xsl:template>
  
 
  <xsl:template match="p[starts-with(., 'Objective:')]">
    <part class="objective">
      <p>
        <xsl:apply-templates mode="tune">
          <xsl:with-param name="trim" tunnel="yes" as="xs:string">Objective: </xsl:with-param>
        </xsl:apply-templates>
      </p>
    </part>
  </xsl:template>

  <xsl:function name="oscal:obfusc" as="xs:string">
    <xsl:param name="some" as="xs:string"/>
    <xsl:value-of select="replace($some,'\w','X')"/>
  </xsl:function>
  
  <!--<xsl:template match="text()" mode="#all">
    <xsl:param tunnel="yes" name="trim"/>
    <xsl:value-of
      select="oscal:obfusc(
      if (matches($trim, '\S')) then
      replace(., $trim, '')
      else
      . )"
    />
  </xsl:template>
  
  <xsl:template match="a//text()" mode="#all">
    <xsl:param tunnel="yes" name="trim"/>
    <xsl:value-of
      select="if (matches($trim, '\S')) then
      replace(., $trim, '')
      else ."
    />
  </xsl:template>-->
  
  <xsl:template match="p | p//*" mode="#all">
    <xsl:element name="{local-name()}" namespace="http://csrc.nist.gov/ns/oscal/1.0">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="p" priority="2" mode="bibliography">
    <ref id="{a[1]/@id}">
      <citation>
        <xsl:analyze-string select="." regex="^\[\d+\]\s*">
          <xsl:matching-substring/>
          <xsl:non-matching-substring>
            <xsl:value-of select="."/>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
        <xsl:apply-templates/>
      </citation>
    </ref>
  </xsl:template>

  <xsl:template match="span" priority="2" mode="#all">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="a[not(matches(., '\S'))]" priority="3"/>

  <xsl:template match="a" priority="2">
    <a>
      <xsl:apply-templates/>
    </a>
  </xsl:template>

</xsl:stylesheet>
