<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <sch:rule context="oscal:group/oscal:prop">
      <sch:report test="@name != ../oscal:prop/@name">
        Group member name variance: <sch:value-of select="@name"/> could be <sch:value-of select="distinct-values(../oscal:prop/@name)"/>
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:prop">
      <sch:report test="@name = (../oscal:prop except .)/@name">
        Property name <sch:value-of select="@name"/> duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:group/oscal:stmt">
      <sch:report test="@name != (../oscal:stmt)/@name">
        Group member name variance: <sch:value-of select="@name"/> could be <sch:value-of select="distinct-values(../oscal:stmt/@name)"/>
      </sch:report>
    </sch:rule>
    <sch:rule context="oscal:stmt">
      <sch:report test="@name = (../(oscal:stmt | oscal:group/oscal:stmt) except .)/@name">
        NB '<sch:value-of select="@name"/>' duplicated in this <sch:value-of select="name(..)"/>.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:let name="catalog" value="document('800-53-controls-map.xml')/oscal:catalog"/>
  
  <sch:pattern>
    <sch:rule context="oscal:p//* | oscal:list//*"/>
    <sch:rule context="/oscal:catalog//*">
      <sch:let name="here"          value="."/>
      <sch:let name="catalog-entry" value="key('element-by-signature',oscal:signature(.),$catalog)"/>
      <sch:assert test="exists($catalog-entry)">
        Element with signature '<sch:value-of select="oscal:signature(.)"/>' isn't recognized.
      </sch:assert>
      <!--<sch:report test="exists($catalog-entry) and not(. = $catalog-entry/oscal:VALUE)">
        <sch:value-of select="."/> isn't recognized for prp[@name='<sch:value-of select="$here/@name"/>']
      </sch:report>-->
    </sch:rule>

  </sch:pattern>
  
  <xsl:key name="element-by-signature" match="*" use="oscal:signature(.)"/>
  
  <xsl:function name="oscal:signature" as="xs:string">
    <xsl:param name="who" as="element()"/>
    <!-- writing a little XPath -->
    <xsl:value-of>
    <xsl:for-each select="$who/ancestor-or-self::*[ancestor::oscal:catalog]">
      <xsl:if test="position() gt 1">/</xsl:if>
      <xsl:value-of select="name(.)"/>
      <xsl:for-each select="@name">[@name='<xsl:value-of select="."/>']</xsl:for-each>
    </xsl:for-each>
    </xsl:value-of>
  </xsl:function>
</sch:schema>