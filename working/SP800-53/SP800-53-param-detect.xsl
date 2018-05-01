<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  exclude-result-prefixes="xs math"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0"
  xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
  version="3.0">
  
<!-- For tweaking OSCAL documents eg SP800-53/A -->

<!-- 
    1. Provide @id to all controls, subcontrols and features with prop[@class='name']
    2. Infer and install 'assign' and 'withdrawn' elements where appropriate
       (string matching) nb 'assign' is a placeholder to be picked up by a next step;
       it is not valid in the target (where it will be 'insert', along with a parameter 
       declaration elsewhere)
    3. Also, we copy references to the end (preliminary to linking to them there).
  -->
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="catalog">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:apply-templates/>
      <references>
        <xsl:for-each-group select="//citation" group-by="normalize-space(.)">
          <xsl:sort select="current-grouping-key()"  lang="en"/>
          <ref id="ref{ format-number(position(),'001') }">
            <xsl:copy-of select="current-group()[1]"/>
          </ref>
        </xsl:for-each-group>
      </references>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="control | subcontrol | part" mode="id" as="xs:string">
    <xsl:for-each select="prop[@class='name']">
      <xsl:attribute name="id" select="translate(.,'()[]','..--') ! replace(.,'\C','.') ! lower-case(.)"/>
    </xsl:for-each>
    <xsl:if test="not(prop/@class='name')">OOPS</xsl:if>
  </xsl:template>
  
  <xsl:template match="control | subcontrol | part">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <xsl:if test="prop/@class = 'name'">
        <xsl:attribute name="id">
          <xsl:apply-templates select="." mode="id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:key name="control-by-name" match="control | subcontrol" use="prop[@class='name']"/>
  
  <xsl:template match="link">
    <xsl:copy>
      <xsl:for-each select="key('control-by-name',.)">
      <xsl:attribute name="href">
        <xsl:text>#</xsl:text>
        <xsl:apply-templates select="." mode="id"/>
      </xsl:attribute>
      </xsl:for-each>
     
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
      
  <xsl:template match="text()">
    <xsl:analyze-string select="." regex="\[(Assignment|Withdrawn)[^\]]*\]">
      <xsl:matching-substring>
        <xsl:choose>
          <xsl:when test="regex-group(1)='Withdrawn'">
            <withdrawn>
            <xsl:value-of select="replace(.,'Withdrawn:\s*','') => replace('[\[\]]','')"/>
          </withdrawn>
          </xsl:when>
          <xsl:otherwise>
        <assign>
          <xsl:value-of select="replace(.,'Assignment:\s*','') => replace('[\[\]]','')"/>
        </assign>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="."/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <xsl:template match="*" mode="escape-assign">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="assign" mode="escape-assign">
    <xsl:text>#assign></xsl:text>
    <xsl:apply-templates mode="#current"/>
    <xsl:text>&lt;assign#</xsl:text>
  </xsl:template>
  
  
  
  
  
  <xsl:template match="." mode="restore-assign">
    <xsl:analyze-string select="." regex="#assign>([^&lt;]*)&lt;assign#">
      <xsl:matching-substring>
        <assign>
          <xsl:value-of select="regex-group(1)"/>
        </assign>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:value-of select="replace(.,'\]$','')"/><!-- btw we drop terminal closing brackets going through -->
      </xsl:non-matching-substring>
    </xsl:analyze-string>
  </xsl:template>
  
  <!-- We can cheat this way because this is the only inline markup we have; no sibling anchors
     or inline formatting to worry about; the only thing in the way is those pesky "assignments" we want ... 
      we know this by static analysis of the source data: returns //text()[matches(.,'\[Select')]/.. only description
      elements, and empty(//description/*) is true ... -->
  
  <xsl:template match="p[matches(., '\[Select')]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
    <xsl:variable name="marked-assigns">
      <!-- Continuing in the default mode will pluck out <assign> elements ...     -->
        <xsl:apply-templates/>
    </xsl:variable>
    <!-- here we rewrite them so to get a string again   -->
    <xsl:variable name="escaped-assigns" as="xs:string">
      <xsl:value-of><!-- coercing to text node convertible to string -->
        <xsl:apply-templates mode="escape-assign" select="$marked-assigns"/>
      </xsl:value-of>
    </xsl:variable>
    <!-- Now with the 'safe' string we proceed to for the analysis of the selection ... -->
    <!--<xsl:value-of select="$escaped-assigns"/>-->
    <!--<xsl:apply-templates mode="restore-assign" select="$escaped-assigns"/>-->
    
    
    <xsl:analyze-string select="$escaped-assigns" regex="\[Selection[^\]]*\]">
      <xsl:matching-substring>
        <selection>
          <xsl:apply-templates select="regex-group(0)" mode="process-selection"/>
        </selection>
      </xsl:matching-substring>
      <xsl:non-matching-substring>
        <xsl:apply-templates select="." mode="restore-assign"/>
      </xsl:non-matching-substring>
    </xsl:analyze-string>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="." mode="process-selection">
<!-- It is very fortunate that our data hitherto never has more than one selection per description   -->
    <xsl:variable name="this" select="."/>
    <!-- A selection is delimited by : following the label (and optional cardinality rule) and then ; for the individual selections   -->
    <xsl:for-each select="tokenize(.,':\s*')">
      <xsl:if test="position() gt 2"><xsl:message>Ooops do not expect more than one colon in "<xsl:value-of select="$this"/>" </xsl:message></xsl:if>
      <xsl:choose>
        <xsl:when test="matches(.,'^\[Selection')">
          <xsl:value-of select="replace(.,'\[Selection\s*','')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:for-each select="tokenize(.,'\s*;\s*')">
          <choice>
            <xsl:apply-templates select="." mode="restore-assign"/>
          </choice>
          </xsl:for-each>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>