<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all">
   <xsl:output indent="yes" method="xml"/>
   <!-- METASCHEMA conversion stylesheet supports JSON->XML conversion -->
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <xsl:output indent="yes"/>
   <xsl:strip-space elements="*"/>
   <xsl:preserve-space elements="string"/>
   <xsl:param name="json-file" as="xs:string"/>
   <xsl:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/>
   <xsl:template match="/">
      <xsl:choose>
         <xsl:when test="exists($json-xml/map)">
            <xsl:apply-templates select="$json-xml" mode="json2xml"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates mode="json2xml"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="array" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="array[@key='prose']/*" priority="5" mode="json2xml"><!-- This will have to be post-processed to render markdown into markup -->
      <xsl:element name="p" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="#current"/>
      </xsl:element>
   </xsl:template>
   <xsl:template match="string[@key='RICHTEXT']" mode="json2xml">
      <xsl:comment> Not yet handling markdown </xsl:comment>
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template match="string[@key='STRVALUE']" mode="json2xml">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="*"/>
   <xsl:template mode="as-attribute" match="map">
      <xsl:apply-templates mode="#current"/>
   </xsl:template>
   <xsl:template mode="as-attribute" match="string[@key='id']" priority="0.4">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 00000000000000000000000000000000000000000000000000000000000000 -->
   <!-- 000 Handling assembly "catalog" 000 -->
   <xsl:template match="*[@key='catalog'] | *[@key='control-catalog']/* | /map[empty(@key)]"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="catalog" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('declarations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('section', 'sections')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('control', 'controls')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "declarations" 000 -->
   <xsl:template match="*[@key='declarations']" priority="2" mode="json2xml">
      <xsl:element name="declarations" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "section" 000 -->
   <xsl:template match="*[@key='section'] | *[@key='sections']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="section" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=('section', 'sections')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "group" 000 -->
   <xsl:template match="*[@key='group'] | *[@key='groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="group" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'params')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('control', 'controls')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "control" 000 -->
   <xsl:template match="*[@key='control'] | *[@key='controls']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="control" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'params')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('subcontrol', 'subcontrols')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "subcontrol" 000 -->
   <xsl:template match="*[@key='subcontrol'] | *[@key='subcontrols']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="subcontrol" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'params')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='subcontrol']/string[@key='id'] | *[@key='subcontrols']/*/string[@key='{@address}']"/>
   <!-- 000 Handling field "title" 000 -->
   <xsl:template match="*[@key='title']" priority="2" mode="json2xml">
      <xsl:element name="title" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "prop" 000 -->
   <xsl:template match="*[@key='prop'] | *[@key='props']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="prop" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "param" 000 -->
   <xsl:template match="*[@key='param'] | *[@key='params']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('label')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc', 'descriptions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('constraint', 'constraints')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('guideline', 'guidance')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('select')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='param']/string[@key='id'] | *[@key='params']/*/string[@key='{@address}']"/>
   <!-- 000 Handling field "label" 000 -->
   <xsl:template match="*[@key='label']" priority="2" mode="json2xml">
      <xsl:element name="label" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "desc" 000 -->
   <xsl:template match="*[@key='desc'] | *[@key='descriptions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="desc" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "constraint" 000 -->
   <xsl:template match="*[@key='constraint'] | *[@key='constraints']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="constraint" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "guideline" 000 -->
   <xsl:template match="*[@key='guideline'] | *[@key='guidance']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="guideline" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "value" 000 -->
   <xsl:template match="*[@key='value']" priority="2" mode="json2xml">
      <xsl:element name="value" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "select" 000 -->
   <xsl:template match="*[@key='select']" priority="2" mode="json2xml">
      <xsl:element name="select" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('choice', 'alternatives')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "choice" 000 -->
   <xsl:template match="*[@key='choice'] | *[@key='alternatives']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="choice" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "part" 000 -->
   <xsl:template match="*[@key='part'] | *[@key='parts']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="part" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "link" 000 -->
   <xsl:template match="*[@key='link'] | *[@key='links']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="link" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "references" 000 -->
   <xsl:template match="*[@key='references']" priority="2" mode="json2xml">
      <xsl:element name="references" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('ref', 'refs')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "ref" 000 -->
   <xsl:template match="*[@key='ref'] | *[@key='refs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="ref" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('citation', 'citations')]"/>
         <xsl:apply-templates mode="#current" select="*[@key='prose']"/>
         <xsl:apply-templates mode="#current" select="*[@key=()]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "citation" 000 -->
   <xsl:template match="*[@key='citation'] | *[@key='citations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="citation" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='TEXT']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "id" 000 -->
   <xsl:template match="*[@key='id']" mode="json2xml"/>
   <xsl:template match="*[@key='catalog']/*[@key='id'] | *[@key='control-catalog']/*/*[@key='id'] | *[@key='section']/*[@key='id'] | *[@key='sections']/*/*[@key='id'] | *[@key='group']/*[@key='id'] | *[@key='groups']/*/*[@key='id'] | *[@key='control']/*[@key='id'] | *[@key='controls']/*/*[@key='id'] | *[@key='subcontrol']/*[@key='id'] | *[@key='subcontrols']/*/*[@key='id'] | *[@key='prop']/*[@key='id'] | *[@key='props']/*/*[@key='id'] | *[@key='param']/*[@key='id'] | *[@key='params']/*/*[@key='id'] | *[@key='desc']/*[@key='id'] | *[@key='descriptions']/*/*[@key='id'] | *[@key='part']/*[@key='id'] | *[@key='parts']/*/*[@key='id'] | *[@key='references']/*[@key='id'] | *[@key='ref']/*[@key='id'] | *[@key='refs']/*/*[@key='id'] | *[@key='citation']/*[@key='id'] | *[@key='citations']/*/*[@key='id']"
                 mode="as-attribute">
      <xsl:attribute name="id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class" 000 -->
   <xsl:template match="*[@key='class']" mode="json2xml"/>
   <xsl:template match="*[@key='section']/*[@key='class'] | *[@key='sections']/*/*[@key='class'] | *[@key='group']/*[@key='class'] | *[@key='groups']/*/*[@key='class'] | *[@key='control']/*[@key='class'] | *[@key='controls']/*/*[@key='class'] | *[@key='subcontrol']/*[@key='class'] | *[@key='subcontrols']/*/*[@key='class'] | *[@key='prop']/*[@key='class'] | *[@key='props']/*/*[@key='class'] | *[@key='param']/*[@key='class'] | *[@key='params']/*/*[@key='class'] | *[@key='part']/*[@key='class'] | *[@key='parts']/*/*[@key='class']"
                 mode="as-attribute">
      <xsl:attribute name="class">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "href" 000 -->
   <xsl:template match="*[@key='href']" mode="json2xml"/>
   <xsl:template match="*[@key='declarations']/*[@key='href'] | *[@key='link']/*[@key='href'] | *[@key='links']/*/*[@key='href'] | *[@key='citation']/*[@key='href'] | *[@key='citations']/*/*[@key='href']"
                 mode="as-attribute">
      <xsl:attribute name="href">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "test" 000 -->
   <xsl:template match="*[@key='test']" mode="json2xml"/>
   <xsl:template match="*[@key='constraint']/*[@key='test'] | *[@key='constraints']/*/*[@key='test']"
                 mode="as-attribute">
      <xsl:attribute name="test">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "rel" 000 -->
   <xsl:template match="*[@key='rel']" mode="json2xml"/>
   <xsl:template match="*[@key='link']/*[@key='rel'] | *[@key='links']/*/*[@key='rel']"
                 mode="as-attribute">
      <xsl:attribute name="rel">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "how-many" 000 -->
   <xsl:template match="*[@key='how-many']" mode="json2xml"/>
   <xsl:template match="*[@key='select']/*[@key='how-many']" mode="as-attribute">
      <xsl:attribute name="how-many">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "depends-on" 000 -->
   <xsl:template match="*[@key='depends-on']" mode="json2xml"/>
   <xsl:template match="*[@key='param']/*[@key='depends-on'] | *[@key='params']/*/*[@key='depends-on']"
                 mode="as-attribute">
      <xsl:attribute name="depends-on">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "model-version" 000 -->
   <xsl:template match="*[@key='model-version']" mode="json2xml"/>
   <xsl:template match="*[@key='catalog']/*[@key='model-version'] | *[@key='control-catalog']/*/*[@key='model-version']"
                 mode="as-attribute">
      <xsl:attribute name="model-version">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
</xsl:stylesheet>
