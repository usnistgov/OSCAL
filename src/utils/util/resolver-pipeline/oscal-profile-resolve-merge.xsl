<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math o"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
<!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:template match="* | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="profile">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="metadata"/>
            <xsl:apply-templates select="catalog" mode="o:no-merge"/>
            <xsl:apply-templates select="modify"/>
            <xsl:apply-templates select="back-matter"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="import" mode="o:no-merge">
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template match="profile[merge/as-is=('true','1')]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="metadata"/>
            <xsl:call-template name="o:merging">
                <xsl:with-param name="merging" select="catalog"/>
            </xsl:call-template>
            <!-- copying 'modify' unchanged through this transformation --> 
            <xsl:apply-templates select="modify"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="o:merging">
        <xsl:param name="merging" select="()"/>
        <xsl:for-each-group select="$merging" group-by="@id">
            <xsl:variable name="merged" select="current-group()"/>
            <xsl:for-each select="$merged[1]">
                <xsl:copy>
                    <xsl:copy-of select="$merged/@*"/>
                    <xsl:call-template name="o:merging">
                        <xsl:with-param name="merging" select="current-group()/group"/>
                    </xsl:call-template>
                    <xsl:apply-templates select="$merging/ancestor::profile" mode="o:merge-controls">
                        <xsl:with-param name="controls" select="current-group()/control"/>
                    </xsl:apply-templates>
                    <xsl:for-each select="current-group()">
                        <xsl:apply-templates mode="o:merge"/>
                    </xsl:for-each>
                </xsl:copy>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>

    <!-- 'visitor pattern' uses the profile element as a handler for dispatching control merge logic
         for a set of controls -->
    <xsl:template priority="10" match="profile[merge/combine/@method='merge']" mode="o:merge-controls">
        <xsl:param name="controls" as="element(o:control)*" select="()"/>
        <xsl:call-template name="o:merging">
            <xsl:with-param name="merging" select="$controls"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template priority="10" match="profile[merge/combine/@method='use-first']" mode="o:merge-controls">
        <xsl:param name="controls" as="element(o:control)*" select="()"/>
        <xsl:sequence select="$controls[1]"/>
    </xsl:template>
    
    <!--[merge/combine/@method='keep'] is the default handling -->
    <xsl:template priority="5" match="profile" mode="o:merge-controls">
        <xsl:param name="controls" as="element(o:control)*" select="()"/>
        <xsl:sequence select="$controls"/>
    </xsl:template>
    
    
    <xsl:template match="group" mode="o:no-merge">
        <xsl:apply-templates select="group | control" mode="#current"/>
    </xsl:template>    

</xsl:stylesheet>