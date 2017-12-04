<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output indent="yes"/>
<!-- To do:
    Work against a profile not only a catalog (invoking resolution XSLT)
    Produce an annotated copy of the framework, not a profile
    -->
    <xsl:template match="framework">
        <xsl:processing-instruction name="xml-model">href="../lib/Schematron/oscal-profile.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-model">href="../lib/oscal-profile-working.rnc" type="application/relax-ng-compact-syntax"</xsl:processing-instruction>
        
        <profile>
            <xsl:for-each-group select="//link" group-by="substring-before(@href,'#')">
                <invoke href="{current-grouping-key()}">
                    <include>
                        <xsl:for-each-group select="//link[@rel/tokenize(.,'\s+')=('control','subcontrol')]" group-by="substring-after(@href,'#')">
                            <xsl:variable name="call-type" select="('control','subcontrol')[.=current-group()/@rel/tokenize(.,'\s+')][1]"/>
                            <call>
                            <xsl:attribute name="{$call-type}-id" select="current-grouping-key()"/>
                            </call>
                            <xsl:apply-templates select="../param" mode="params"/>
                        </xsl:for-each-group>
                        
                    </include>
                    
            </invoke>
            </xsl:for-each-group>
        </profile>
    </xsl:template>
    
    
    
    <xsl:template match="param" mode="params">
        <xsl:variable name="insertions" select="..//insert[@param-id=current()/@id]"/>
       <xsl:copy>
           <xsl:copy-of select="@*"/>
           <!--<xsl:comment expand-text="true"> inserted into {$insertions/(ancestor::part | ancestor::subcontrol | ancestor::control)[last()]/prop[@class='name']} </xsl:comment>-->
           <xsl:copy-of select="value"/>
       </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>