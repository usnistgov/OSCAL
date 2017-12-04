<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:import href="../lib/XSLT/profile-resolver.xsl"/>
    
<!-- Apply to the FedRAMP 'worksheet' framework to enhance it with info pulled from the necessary control
    catalog.  -->
    
    <xsl:output indent="yes"/>
<!-- To do:
    Work against a profile not only a catalog (invoking resolution XSLT)
    Produce an annotated copy of the framework, not a profile
    
    In it:
    
    for controls that match by ID and for those that match by title but not ID
      (as well as for those w/ attribution clashes i.e. one things ID, another's title)
    report whether/how matches (by ID and/or Title)
    report when titles vary
    report when identifiers vary
    report when baseline impacts vary
    interpolate parameters
    provide links to referenced controls
    
    for components that have no matching controls
    
    report when a control is not found in the sourced profile (but it is found in a catalog)
    report when a control is found nowhere in the authority chain
    
    -->

    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="framework">
        <xsl:processing-instruction name="xml-model">href="../lib/Schematron/oscal-as-declared.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">href="../lib/Schematron/oscal-as-declared.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="../lib/CSS/oscal.css"</xsl:processing-instruction>
        <xsl:text>&#xA;</xsl:text>
        <!-- can't just next-match since the imported stylesheet will intercept -->
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>

    <xsl:param name="authority-file" select="'../SP800-53/MODERATE-baseline-profile-oscal.xml'"/>
    
    <xsl:variable name="authority">
<!-- A resolved authority will be a 'profile' element containing copies of 'invoke' elements with 
            their 'framework' element results (of resolution) containing (filtered) catalog controls  -->
        <xsl:apply-templates mode="oscal:resolve" select="document($authority-file)/*"/>
    </xsl:variable>
    
    <xsl:key name="component-by-name-prop" match="group | control | subcontrol | component" use="prop[@class='name']/replace(.,'\s+',' ')"/>
    
    <xsl:key name="component-by-title" match="group | control | subcontrol | component" use="title/replace(.,'\s+',' ')"/>
    
    <xsl:template match="framework/title">
        <xsl:next-match/>
        <section class="file_provenance">
            <title>resource provenance</title>
          <p xsl:expand-text="true"> OSCAL worksheet annotation of '{ replace(document-uri(/),'.*/','') }' against authority '{ $authority-file }' </p>
        </section>
    </xsl:template>
    
    <xsl:template match="component">
        <xsl:variable name="my-name" select="prop[@class = 'name']/replace(., '\s+', ' ')"/>
        <xsl:variable name="my-title" select="title/replace(., '\s+', ' ')"/>
        <xsl:variable name="matching-components"
            select="
                key('component-by-name-prop', $my-name, $authority) |
                key('component-by-title', $my-title, $authority)"/>

        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:choose>
                <xsl:when test="empty($matching-components)">
                    <!-- No match at all -->
                    <xsl:apply-templates select="title"/>
                    <prop class="worksheet-annotation"> NO MATCH IN CATALOG </prop>
                    <xsl:apply-templates select="* except title"/>
                </xsl:when>
                <xsl:when test="count($matching-components) = 1">
                    <!-- Clear match no multiplicity or ambiguity; we match a single component
                     by name, title or both. -->
                    <xsl:apply-templates select="title"/>
                    
                    <xsl:apply-templates select="$matching-components" mode="write-link"/>
                    
                    <xsl:for-each
                        select="$matching-components/title[not(replace(., '\s+', ' ') = $my-title)]">
                        <prop class="authority_title">
                            <xsl:apply-templates/>
                        </prop>
                    </xsl:for-each>
                    <xsl:for-each
                        select="
                            $matching-components/prop[@class = 'name']
                            [not(replace(., '\s+', ' ') = $my-name)]">
                        <xsl:call-template name="produce-with-class">
                            <xsl:with-param name="new-class">other_name</xsl:with-param>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:apply-templates
                        select="$matching-components//param except $matching-components//(subcontrol | component)//param"
                        mode="params"/>
                    <xsl:apply-templates select="prop[@class = 'name']"/>
                    
                    <xsl:apply-templates select="." mode="write-baselines"/>
                    <xsl:apply-templates select="$matching-components" mode="write-baselines">
                        <xsl:with-param name="whose">authority</xsl:with-param>
                    </xsl:apply-templates>
                    <xsl:apply-templates select="* except (title | prop[@class = 'name'])"/>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates/>
                    <xsl:for-each select="$matching-components">
                        <xsl:call-template name="produce-with-class"/>
                    </xsl:for-each>
                </xsl:otherwise>

            </xsl:choose>
        </xsl:copy>


    </xsl:template>
    
    <xsl:template match="prop[@class='baseline-impact']"/>
    
    <xsl:template match="component | control | subcontrol" mode="write-link">
        <link rel="{distinct-values((tokenize(@class,'\s+'),local-name(.))) }" href="{$authority-file}#{@id}">
            <xsl:value-of select="prop[@class = 'name']"/>
        </link>
    </xsl:template>
    
    <xsl:template match="component | control | subcontrol" mode="write-baselines">
        <xsl:param name="whose" as="xs:string">worksheet</xsl:param>
        <prop class="{$whose}_baselines">
            <xsl:value-of select="prop[contains-token(@class,'baseline-impact')]" separator=" "/>
        </prop>
    </xsl:template>
    
    <xsl:template name="produce-with-class" match="*" mode="amend-class">
        <xsl:param name="new-class" as="xs:string">matching</xsl:param>
        <xsl:copy>
            <xsl:copy-of select="@* except @class"/>
            <xsl:attribute name="class"
                select="string-join((tokenize(@class, '\s+')[not(. = $new-class)], $new-class), ' ')"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="control | subcontrol" mode="link">
        <xsl:attribute name="{local-name()}-id" select="@id"/>
    </xsl:template>
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
       <xsl:copy>
           <xsl:copy-of select="@*"/>
           <xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control | ancestor::component)/(@class/('.' || .) || @id/('#' || .) )} </xsl:comment>
           <xsl:copy-of select="desc, value"/>
       </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>