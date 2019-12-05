<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="xs math o opr"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
    <!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:template match="* | @*" mode="#all">
        <xsl:copy copy-namespaces="no">
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
<!-- TODO; exception handling such as unmatched document element (i.e., not already 'catalog' with 'selection' children)    -->
    <!-- With no combination rule, we simply emit parameters and controls -->
    <xsl:template match="/*" priority="1">
        <!-- emitting nothing as this is input is erroneous; a catalog will match one of the following
            templates not this one. -->
    </xsl:template>
    
    <xsl:template match="catalog" priority="2">
        <xsl:copy-of select="."/>
    </xsl:template>
    
    <xsl:template match="catalog[exists(selection)]" priority="10">
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>
            <xsl:apply-templates select="selection"/>
            <xsl:apply-templates select="modify"/>
            <xsl:apply-templates select="back-matter"/>
        </catalog>
    </xsl:template>
    
    <xsl:template match="selection">
            <xsl:apply-templates select="param   | .//group/param"/>
            <xsl:apply-templates select="control | .//group/control"/>
    </xsl:template>
    
    <xsl:template priority="2" match="profile[merge/as-is=('true','1')]">
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>
            <xsl:variable name="merged-selections">
            <xsl:call-template name="o:merge-groups-asis">
                <xsl:with-param name="merging" select="selection"/>
            </xsl:call-template>
            </xsl:variable>
            <!-- not copying the selection elements only their contents -->
            <xsl:for-each select="$merged-selections/selection">
                <xsl:sequence select="*"/>
            </xsl:for-each>
            <!-- copying 'modify' unchanged through this transformation --> 
            <xsl:apply-templates select="modify"/>
        </catalog>
    </xsl:template>
    
    <xsl:template priority="3" match="profile[merge/custom]">
        <xsl:message>custom merge not supported yet</xsl:message>
        <catalog>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="metadata"/>


            <!-- copying 'modify' unchanged through this transformation -->
            <xsl:apply-templates select="modify"/>
        </catalog>
    </xsl:template>
    
    <xsl:template name="o:merge-groups-asis">
        <xsl:param name="merging" select="()"/>
        <xsl:for-each-group select="$merging" group-by="@opr:id">
            <xsl:variable name="merged" select="current-group()"/>
            <xsl:for-each select="$merged[1]">
                <xsl:copy copy-namespaces="no">
                    <xsl:apply-templates select="$merged/@*"/>
                    <xsl:apply-templates select="title"/>
                    <xsl:apply-templates select="$merged/(* except (title | param | control | group) )"/>
                    
                    <xsl:apply-templates select="$merging/ancestor::profile" mode="o:merge-elements">
                        <xsl:with-param name="elements" select="$merged/param"/>
                    </xsl:apply-templates>
                    <xsl:apply-templates select="$merging/ancestor::profile" mode="o:merge-elements">
                        <xsl:with-param name="elements" select="$merged/control"/>
                    </xsl:apply-templates>
                    
                    <xsl:call-template name="o:merge-groups-asis">
                        <xsl:with-param name="merging" select="$merged/group[exists(descendant::control)]"/>
                    </xsl:call-template>
                    
                </xsl:copy>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
    
    
    <!-- 'visitor pattern' uses the profile element as a handler for dispatching control merge logic
         for a set of controls.
         Think of this as a function "merge-elements" that merges an arbitrary set of elements
         with the combination method as an argument.
    -->
    
    <xsl:template priority="10" match="profile[merge/combine/@method='merge']" mode="o:merge-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <!-- All the elements coming in have the same name but different opr:id
             we operate on controls and parameters (not groups or group contents otherwise) -->
        <!-- further, we assume all controls or all parameters -->
        <xsl:if test="$elements/name() != $elements/name()">
            <opr:error> ... elements of different types combining ...</opr:error></xsl:if>
        <xsl:for-each-group select="$elements" group-by="@opr:id">
            <xsl:variable name="merged" select="current-group()"/>
            <xsl:for-each select="$merged[1]">
                <xsl:copy copy-namespaces="no">
                    <xsl:apply-templates select="$merged/@*"/>
                    <xsl:apply-templates select="$merged/*"/>
                    
                </xsl:copy>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:template>
    
    <xsl:template name="o:combine-merge-elements">
        <xsl:param name="merging" select="()"/>
        
    </xsl:template>
    
    <xsl:template priority="10" match="profile[merge/combine/@method='use-first']" mode="o:merge-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <xsl:apply-templates select="$elements[1]"/>
    </xsl:template>
    
    <!--[merge/combine/@method='keep'] is the default handling -->
    <xsl:template priority="5" match="profile" mode="o:merge-elements">
        <xsl:param name="elements" as="element()*" required="yes"/>
        <xsl:apply-templates select="$elements"/>
    </xsl:template>
    
    <xsl:template match="@opr:id"/>
</xsl:stylesheet>