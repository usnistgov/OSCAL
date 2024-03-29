<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:x="http://www.jenitennison.com/xslt/xspec"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
    version="3.0">

    <xsl:output indent="yes"/>

<!-- This XSLT produces a set of file-oriented XSpecs binding to files named in the Specification document
//req/@eg values -->

    <xsl:template match="/">
        <xsl:text>&#xA;</xsl:text>
        <xsl:comment expand-text="true"> autogenerated { current-dateTime() } following model in example-set.xspec</xsl:comment>
        <xsl:processing-instruction name="xml-model">href="lib/xspec-test-dev.sch" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"</xsl:processing-instruction>
        <xsl:processing-instruction name="xml-stylesheet">type="text/css" href="lib/xspec-oxygen.css"</xsl:processing-instruction>
        <xsl:processing-instruction name="specification" expand-text="true">{ replace(document-uri(/),'.*/','') }</xsl:processing-instruction>
        <x:description stylesheet="../../utils/util/resolver-pipeline/oscal-profile-RESOLVE.xsl"
            run-as="external">

            <!-- x:description/@run-as='external' permits the context item to be determined dynamically per scenario
                cf https://github.com/xspec/xspec/wiki/External-Transformation#global-context-item
                
                helper function for cleaning up whitespace:
                  see https://github.com/xspec/xspec/wiki/Integrating-Your-Own-Test-Helpers for
                  for an example see https://github.com/xspec/xspec/blob/master/tutorial/helper/ws-only-text/href_stylesheet.xspec
    -->

            <x:helper stylesheet="lib/oscal-profile-test-helper.xsl"/>
            <!-- looking at all the profile documents in the same directory as this XSLT -->

            <xsl:apply-templates select="*" mode="make-file-scenario"/>

        </x:description>

    </xsl:template>

    <xsl:template match="SPECIFICATION" mode="make-file-scenario" expand-text="true">
        <xsl:for-each-group select="descendant::req" group-by="@eg/tokenize(.,'\s+')">
            <x:scenario label="{ current-grouping-key() }">
                <x:context href="requirement-tests/{ current-grouping-key() }"/>
                <xsl:apply-templates select="current-group()"
                    mode="make-file-scenario">
                    <xsl:with-param name="filename" select="current-grouping-key()"/>
                </xsl:apply-templates>
            </x:scenario>
        </xsl:for-each-group>
    </xsl:template>

    <xsl:template match="head" mode="make-file-scenario"/>
        

    <xsl:template match="section" mode="test-header">
        <!--<xsl:apply-templates select="parent::section" mode="#current"/>-->
        <!--<xsl:text> </xsl:text>-->
        <xsl:number level="multiple" format="1.1"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates select="head"/>
        <xsl:text> | </xsl:text>
    </xsl:template>
    
    <xsl:template match="req" mode="test-header">
        <xsl:apply-templates select="ancestor::section[1]" mode="#current"/>
        <xsl:text> </xsl:text>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!--<xsl:template match="req" mode="make-file-scenario" expand-text="true">
        <xsl:variable name="me" select="."/>
        <xsl:variable name="test-header">
            <xsl:apply-templates select="$me" mode="test-header"/>
        </xsl:variable>
            
        <x:scenario label="{ $test-header => normalize-space() }">
            <xsl:if test="not(matches(@eg,'\S'))">
                <xsl:attribute name="pending">[dev]</xsl:attribute>
            </xsl:if>
            <xsl:iterate select="@eg/tokenize(.,'\s+')">
            <xsl:call-template name="make-file-scenario">
                <xsl:with-param name="req-id" select="$me/@id"/>
                <xsl:with-param name="filename" select="."/>
            </xsl:call-template>
        </xsl:iterate>
        </x:scenario>
        
    </xsl:template>-->
    
    <xsl:template match="req" mode="make-file-scenario" expand-text="true">
        <xsl:param name="filename" as="xs:string" required="true"/>
        <xsl:variable name="filepath" as="xs:string">requirement-tests/{$filename}</xsl:variable>
        <xsl:variable name="test-header">
            <xsl:apply-templates select="." mode="test-header"/>
        </xsl:variable>
        
        <x:scenario label="{ $test-header => normalize-space() }">
            <xsl:text>&#xA;      </xsl:text>
            <xsl:processing-instruction name="requirement">{ @id } </xsl:processing-instruction>
            <!--<x:context href="requirement-tests/{ $filename }"/>-->
            
            <x:expect label="Resolution of { $filename }" select="opr:scrub(.)"
                href="requirement-tests/output-expected/{ replace($filename,'\.xml$','_RESOLVED') }.xml"/>
        </x:scenario>
    </xsl:template>

    <xsl:template match="xref" expand-text="true">
        <xsl:text>[Section {@rid}]</xsl:text>
    </xsl:template>
</xsl:stylesheet>
