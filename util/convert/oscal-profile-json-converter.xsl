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
   <!-- 000 Handling assembly "profile" 000 -->
   <xsl:template match="*[@key='profile'] | *[@key='profiles']/* | /map[empty(@key)]"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="profile" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('import', 'imports')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('merge')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('modify')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "import" 000 -->
   <xsl:template match="*[@key='import'] | *[@key='imports']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="import" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('include')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('exclude')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "merge" 000 -->
   <xsl:template match="*[@key='merge']" priority="2" mode="json2xml">
      <xsl:element name="merge" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('combine')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('as-is')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('custom')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "combine" 000 -->
   <xsl:template match="*[@key='combine']" priority="2" mode="json2xml">
      <xsl:element name="combine" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "as-is" 000 -->
   <xsl:template match="*[@key='as-is']" priority="2" mode="json2xml">
      <xsl:element name="as-is" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "method" 000 -->
   <xsl:template match="*[@key='method']" mode="json2xml"/>
   <xsl:template match="*[@key='combine']/*[@key='method']" mode="as-attribute">
      <xsl:attribute name="method">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling assembly "custom" 000 -->
   <xsl:template match="*[@key='custom'] | *[@key='customs']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="custom" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "group" 000 -->
   <xsl:template match="*[@key='group'] | *[@key='groups']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="group" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('group', 'groups')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "modify" 000 -->
   <xsl:template match="*[@key='modify'] | *[@key='modifys']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="modify" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('set-param', 'param-settings')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('alter', 'alterations')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "include" 000 -->
   <xsl:template match="*[@key='include'] | *[@key='includes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="include" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('all')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "all" 000 -->
   <xsl:template match="*[@key='all']" priority="2" mode="json2xml">
      <xsl:element name="all" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "call" 000 -->
   <xsl:template match="*[@key='call'] | *[@key='id-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="call" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "match" 000 -->
   <xsl:template match="*[@key='match'] | *[@key='pattern-selectors']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="match" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "exclude" 000 -->
   <xsl:template match="*[@key='exclude'] | *[@key='excludes']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="exclude" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('call', 'id-selectors')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('match', 'pattern-selectors')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "set-param" 000 -->
   <xsl:template match="*[@key='set-param'] | *[@key='param-settings']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="set-param" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:attribute name="id" select="../@key"/>
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('label')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('desc', 'descriptions')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('constraint', 'constraints')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('value')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('select')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
      </xsl:element>
   </xsl:template>
   <xsl:template mode="as-attribute"
                 priority="2"
                 match="*[@key='set-param']/string[@key='id'] | *[@key='param-settings']/*/string[@key='{@address}']"/>
   <!-- 000 Handling assembly "alter" 000 -->
   <xsl:template match="*[@key='alter'] | *[@key='alterations']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="alter" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('remove', 'removals')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('add', 'additions')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling field "remove" 000 -->
   <xsl:template match="*[@key='remove'] | *[@key='removals']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="remove" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="json2xml" select="*[@key='VALUE']"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling assembly "add" 000 -->
   <xsl:template match="*[@key='add'] | *[@key='additions']/*"
                 priority="2"
                 mode="json2xml">
      <xsl:element name="add" namespace="http://csrc.nist.gov/ns/oscal/1.0">
         <xsl:apply-templates mode="as-attribute"/>
         <xsl:apply-templates mode="#current" select="*[@key=('title')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('param', 'params')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('prop', 'props')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('link', 'links')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('part', 'parts')]"/>
         <xsl:apply-templates mode="#current" select="*[@key=('references')]"/>
      </xsl:element>
   </xsl:template>
   <!-- 000 Handling flag "control-id" 000 -->
   <xsl:template match="*[@key='control-id']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='control-id'] | *[@key='id-selectors']/*/*[@key='control-id'] | *[@key='alter']/*[@key='control-id'] | *[@key='alterations']/*/*[@key='control-id']"
                 mode="as-attribute">
      <xsl:attribute name="control-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "with-control" 000 -->
   <xsl:template match="*[@key='with-control']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='with-control'] | *[@key='id-selectors']/*/*[@key='with-control'] | *[@key='match']/*[@key='with-control'] | *[@key='pattern-selectors']/*/*[@key='with-control']"
                 mode="as-attribute">
      <xsl:attribute name="with-control">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "with-subcontrols" 000 -->
   <xsl:template match="*[@key='with-subcontrols']" mode="json2xml"/>
   <xsl:template match="*[@key='all']/*[@key='with-subcontrols'] | *[@key='call']/*[@key='with-subcontrols'] | *[@key='id-selectors']/*/*[@key='with-subcontrols'] | *[@key='match']/*[@key='with-subcontrols'] | *[@key='pattern-selectors']/*/*[@key='with-subcontrols']"
                 mode="as-attribute">
      <xsl:attribute name="with-subcontrols">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "subcontrol-id" 000 -->
   <xsl:template match="*[@key='subcontrol-id']" mode="json2xml"/>
   <xsl:template match="*[@key='call']/*[@key='subcontrol-id'] | *[@key='id-selectors']/*/*[@key='subcontrol-id'] | *[@key='alter']/*[@key='subcontrol-id'] | *[@key='alterations']/*/*[@key='subcontrol-id']"
                 mode="as-attribute">
      <xsl:attribute name="subcontrol-id">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "pattern" 000 -->
   <xsl:template match="*[@key='pattern']" mode="json2xml"/>
   <xsl:template match="*[@key='match']/*[@key='pattern'] | *[@key='pattern-selectors']/*/*[@key='pattern']"
                 mode="as-attribute">
      <xsl:attribute name="pattern">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "order" 000 -->
   <xsl:template match="*[@key='order']" mode="json2xml"/>
   <xsl:template match="*[@key='match']/*[@key='order'] | *[@key='pattern-selectors']/*/*[@key='order']"
                 mode="as-attribute">
      <xsl:attribute name="order">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "position" 000 -->
   <xsl:template match="*[@key='position']" mode="json2xml"/>
   <xsl:template match="*[@key='add']/*[@key='position'] | *[@key='additions']/*/*[@key='position']"
                 mode="as-attribute">
      <xsl:attribute name="position">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "class-ref" 000 -->
   <xsl:template match="*[@key='class-ref']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='class-ref'] | *[@key='removals']/*/*[@key='class-ref']"
                 mode="as-attribute">
      <xsl:attribute name="class-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "id-ref" 000 -->
   <xsl:template match="*[@key='id-ref']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='id-ref'] | *[@key='removals']/*/*[@key='id-ref']"
                 mode="as-attribute">
      <xsl:attribute name="id-ref">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
   <!-- 000 Handling flag "item-name" 000 -->
   <xsl:template match="*[@key='item-name']" mode="json2xml"/>
   <xsl:template match="*[@key='remove']/*[@key='item-name'] | *[@key='removals']/*/*[@key='item-name']"
                 mode="as-attribute">
      <xsl:attribute name="item-name">
         <xsl:apply-templates mode="#current"/>
      </xsl:attribute>
   </xsl:template>
</xsl:stylesheet>
