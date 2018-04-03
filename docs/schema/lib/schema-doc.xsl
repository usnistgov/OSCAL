<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math oscal"
    expand-text="true"
    version="3.0">
    
    <xsl:import href="xsd-exploder.xsl"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- overriding imported template   -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:variable name="oscal-docs" select="/"/>
    
    <!--<!-\- The entire set must be included since declarations call declarations in other modules. -\->
    <xsl:variable name="schema-files" select="distinct-values(//oscal:prop[contains-token(@class,'xsd')]) ! resolve-uri(.,$oscal-docs)"/>
    
    <xsl:variable name="schema-sources" as="document-node()">
        <xsl:document>
            <xsl:sequence select="$schema-files ! doc(.)"/>
        </xsl:document>
    </xsl:variable>
    -->
    
    
    <!--<xsl:template match="/*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="node()"/>
            <xsl:for-each-group select="//oscal:prop[@class='xsd']" group-by=".">
              <xsl:for-each select="document(current-grouping-key(),/)">
                  <group class="exploded-declarations">
                      <prop class="xsd">{ current-grouping-key() }</prop>
                      <xsl:apply-templates/>
                  </group>
              </xsl:for-each>
            </xsl:for-each-group>
        </xsl:copy>
    </xsl:template>-->
    
    <xsl:template match="oscal:component[@class='attribute-description']" expand-text="true">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:apply-templates select="." mode="schema-extract"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="oscal:component[@class='element-description']">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
            <xsl:apply-templates select="." mode="schema-extract"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="oscal:component[@class='attribute-description']" mode="schema-extract">
        <xsl:variable name="tag" select="oscal:prop[@class='tag']"/>
        <xsl:element name="part" namespace="http://csrc.nist.gov/ns/oscal/1.0">
            <xsl:attribute name="class">schema-docs</xsl:attribute>
            <xsl:variable name="schema-module" select="ancestor::oscal:group/oscal:prop[contains-token(@class,'xsd')]/document(.,.)/*"/>
            <xsl:variable name="assembled-schema" select="oscal:assemble-schema($schema-module)"/>
            <xsl:for-each-group select="$assembled-schema//xs:attribute[@name = $tag]"
                group-by="@use = 'required'">
                <xsl:variable name="permissibility"
                    select="if (current-grouping-key()) then 'Required on '
                            else 'Allowed on '"/>
                <li>
                    <xsl:value-of select="$permissibility"/>
                     <xsl:for-each-group
                        select="current-group()/oscal:elements-for-attribute-declaration(.)"
                        group-by="@name">
                        <xsl:if test="position() gt 1">, </xsl:if>
                        <code>
                            <xsl:value-of select="current-grouping-key()"/>
                        </code>
                    </xsl:for-each-group>
                </li>
            </xsl:for-each-group>
        </xsl:element>
        
    </xsl:template>
    
    <xsl:template match="oscal:component[@class = 'element-description']" mode="schema-extract"
        expand-text="true">
        <xsl:variable name="tag" select="oscal:prop[@class = 'tag']"/>
        <xsl:variable name="nominal-schema"
            select="ancestor::oscal:group/oscal:prop[@class = 'xsd']"/>
        <!--<xsl:message> nominal schema is { $nominal-schema }</xsl:message>-->
        <xsl:element name="part" namespace="http://csrc.nist.gov/ns/oscal/1.0">
            <xsl:attribute name="class">schema-docs</xsl:attribute>
            <!--<xsl:text expand-text="true"> schema { document-uri(/) }</xsl:text>-->

            <xsl:variable name="declarations"
                select="document($nominal-schema, /)/*/xs:element[@name = $tag]"/>
            <!--<xsl:text expand-text="true">{ count($declarations) }</xsl:text>-->

            <xsl:variable name="exploded">
                <xsl:apply-templates select="$declarations" mode="explode"/>
            </xsl:variable>
            <!--<xsl:copy-of select="$declarations"/>-->
            <xsl:copy-of select="$exploded"/>
            <xsl:apply-templates select="$exploded" mode="oscalize"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template priority="4" match="/element[elements[empty(*)]]" mode="oscalize" expand-text="true">
        <p>This element is empty</p>
    </xsl:template>
    
    <xsl:template priority="3" match="/element" mode="oscalize" expand-text="true">
        <ul>
            <xsl:apply-templates mode="#current"/>
        </ul>
    </xsl:template>
    
    <xsl:template priority="5" match="/element[@type='xs:string']" mode="oscalize" expand-text="true">
        <p><i>Contains text</i></p>
    </xsl:template>
    
    
    <xsl:template match="element//element" mode="oscalize" expand-text="true">
        <li>element <em>{ @name }</em>{ if (@minOccurs='0') then ' (optional)' else '' }, containing:
            <ul>
                <xsl:apply-templates mode="#current"/>
            </ul>
        </li>
    </xsl:template>
    
    <xsl:template priority="2" match="element//element[@type='xs:string']" mode="oscalize" expand-text="true">
        <li>contains text</li>
    </xsl:template>
    
    
    <xsl:template match="element//element[empty(* except annotation)]" priority="2" mode="oscalize" expand-text="true">
        <li>element <code>{ @name | @ref }</code>
            <xsl:if test="empty(parent::optionalRepeatable|parent::choice)">
                <xsl:apply-templates select="." mode="cardinality"/>
            </xsl:if>
        </li>
    </xsl:template>
    
    <xsl:template mode="cardinality" priority="1" match="element"> (mandatory)</xsl:template>
    <xsl:template mode="cardinality" priority="5" match="choice/element"> (once)</xsl:template>
    <xsl:template mode="cardinality" priority="10" match="element[@maxOccurs='unbounded']"> (at least one)</xsl:template>
    <xsl:template mode="cardinality" priority="20" match="element[@minOccurs='0']"> (optional)</xsl:template>
    <xsl:template mode="cardinality" priority="30" match="element[@minOccurs='0'][@maxOccurs='unbounded']"> (zero or more)</xsl:template>
    
    
    
    <xsl:template match="attribute" mode="oscalize" expand-text="true">
        <li>attribute <code>@{ @name }</code>{ if (@use='required') then ' (required)' else ' (optional)' }<xsl:text/>
          <xsl:apply-templates select="@type" mode="#current"/>
        </li>
    </xsl:template>
    
    <xsl:template match="attribute/@type" mode="oscalize" expand-text="true"> valid to constraints for type '{ QName('http://www.w3.org/2001/XMLSchema',.) ! local-name-from-QName(.) }'</xsl:template>
    
    <xsl:template match="choice" mode="oscalize" expand-text="true">
        <li>as needed (at least one):<ul>
            <xsl:apply-templates mode="#current"/>
        </ul>
        </li>
    </xsl:template>
    
    <xsl:template match="optionalRepeatable" mode="oscalize" expand-text="true">
        <li>as needed:<ul>
            <xsl:apply-templates mode="#current"/>
        </ul>
        </li>
    </xsl:template>
    
    <xsl:template match="optionalRepeatable/optionalRepeatable" mode="oscalize" expand-text="true">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="elements" mode="oscalize" expand-text="true">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="mixed" mode="oscalize" expand-text="true">
        <li>text content</li>
    </xsl:template>
    
    <xsl:template match="mixed[exists(*)]" mode="oscalize" expand-text="true">
        <li>text content, possibly mixed with
          <ul>
              <xsl:apply-templates mode="#current"/>
          </ul>
        </li>
    </xsl:template>
    
    <xsl:template match="*" mode="oscalize">
        <li><xsl:value-of select="(name(),@*!(name() || ':' || .))" separator=" "/></li>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
</xsl:stylesheet>