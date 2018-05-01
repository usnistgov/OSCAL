<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:xw="http://csrc.nist.gov/ns/oscal/xslt/util"
  exclude-result-prefixes="xs xw"
  
  
  version="3.0">
  
<!-- For tweaking OSCAL documents eg SP800-53/A -->

  <xsl:mode on-no-match="shallow-copy"/>
   
<!-- Saxon is so persnickety -->
  <xsl:template match="/controls" xpath-default-namespace="http://scap.nist.gov/schema/sp800-53/feed/2.0">
    <xsl:next-match/>
  </xsl:template>
  
  <xsl:template match="text()">
    <xsl:apply-templates select="$operations">
      <xsl:with-param name="original" select="."/>
    </xsl:apply-templates>
  </xsl:template>
  
<!-- Text munging operations borrowed by the developer from another project
     (open source) placing it here into the public domain. -->
  
  <xsl:variable name="operations" expand-text="yes" as="element(xw:sequence)">
    <sequence xmlns="http://csrc.nist.gov/ns/oscal/xslt/util">
      
<!-- In three places, Selection (one or more) is given incorrectly with ; not : so we fix that.   -->
      <match replace="(one or more):">\(one or more\);</match>
      
<!-- Plus a bunch of character level errors have crept in; this cleans them up (for SP800-rev4 ONLY)     -->
      <match replace="system’s">system�s</match>
      <match replace="user’s">user�s</match>
      <match replace="organization’s">organization�s</match>
      <match replace="individual’s">individual�s</match>
      <match replace="drivers’">drivers�</match>
      <match replace="today’s">today�s</match>
      <match replace="application’s">application�s</match>
      
      <match replace="“dirty words”">�dirty words�</match>
      <match replace="“app stores”">�app stores.�</match>
      <match replace="“ping,” “ls,” “ipconfig,">�ping,� �ls,� �ipconfig,�</match>
      
      <match replace="policies—a">policies�a</match>
      <match replace="indirectly—that is">indirectly�that is</match>
      <match replace="notifications—or">notifications�or</match>
      
      
      
    </sequence>
  </xsl:variable>
  
      
  <xsl:template match="xw:sequence" as="xs:string">
    <xsl:param name="original" as="text()"/>
    <xsl:param name="starting" as="xs:string" select="string($original)"/>
    <xsl:iterate select="*">
      <xsl:param name="original" select="$original" as="text()"/>
      <xsl:param name="str"      select="$starting" as="xs:string"/>
      <xsl:on-completion select="$str"/>
      <xsl:next-iteration>
        <xsl:with-param name="original" select="$original"/>
        <xsl:with-param name="str">
          <xsl:apply-templates select=".">
            <xsl:with-param name="original" select="$original"/>
            <xsl:with-param name="str"      select="$str"/>
          </xsl:apply-templates>
        </xsl:with-param>
      </xsl:next-iteration>
    </xsl:iterate>
  </xsl:template>
  
  <xsl:template match="xw:match">
    <xsl:param name="str" required="yes" as="xs:string"/>
    <!-- permits empty xsw:match as a no-op -->
    <xsl:choose>
      <xsl:when test="matches(.,'\S')">
        <xsl:sequence select="replace($str,string(.),(@replace,'')[1], 's')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:sequence select="$str"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="xw:message">
    <xsl:param name="str" required="yes" as="xs:string"/>
    <xsl:message>
      <xsl:value-of select="."/>
    </xsl:message>
  </xsl:template>
  
   
</xsl:stylesheet>