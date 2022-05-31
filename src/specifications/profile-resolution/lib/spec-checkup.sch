<?xml version="1.0" encoding="UTF-8"?>
<sch:schema
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">

    <sch:ns uri="http://csrc.nist.gov/ns/oscal/specml" prefix="os"/>
    <sch:ns uri="http://www.jenitennison.com/xslt/xspec" prefix="x"/>
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="o"/>
    
    <sch:let name="test-filenames" value="/processing-instruction('specml-testset')/normalize-space(.)"/>
    <sch:let name="test-sets" value="document($test-filenames,/)"/>
    
    <sch:let name="known-tests" value="$test-sets/*/x:scenario/processing-instruction('requirement')/normalize-space(.)"/>
    
    <sch:pattern>
        <sch:rule context="os:section">
            <sch:assert test="count(ancestor::os:section) lt 5">section is too deep</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:let name="all-requirements" value="//os:req"/>
    
    <sch:pattern>
        <sch:rule context="os:req">
            <sch:let name="me" value="."/>
            <sch:assert test="count($all-requirements[@id=$me/@id]) eq 1">Requirement id '<sch:value-of select="@id"/>' is not distinct</sch:assert>
            
            <sch:report role="warning" test="empty(descendant::os:eg)">No example yet for requirement "<sch:value-of select="."/>"</sch:report>
            <!--<sch:let name="paths" value="descendant::os:eg"/>
            <sch:let name="missing-eg" value="$paths[not(doc-available( resolve-uri(.,base-uri($me)) ))]"/>
            <sch:assert test="empty($missing-eg)">No file found for example(s) <sch:value-of select="os:and-sequence($missing-eg)"/></sch:assert>
            
            <sch:let name="not-profile-eg" value="$paths[not(.=$missing-eg)][empty(document(.,$me)/o:profile)]"/>
            <sch:assert test="empty($not-profile-eg)">Example files(s) not an OSCAL profile: <sch:value-of select="os:and-sequence($not-profile-eg)"/></sch:assert>-->
            </sch:rule>
        
        <sch:rule context="os:eg">
            <sch:let name="stub" value="starts-with(.,'PENDING')"/>
            <sch:let name="missing" value="not(doc-available( resolve-uri(@href,base-uri(.)) ))"/>
            <sch:let name="not-profile-eg" value=".[not($missing)]/empty(document(@href,root())/o:profile) "/>
            <sch:report test="$missing and not($stub)">No file found for example(s) <sch:value-of select="@href"/></sch:report>
            <sch:report test="$not-profile-eg and not($stub)">Example <sch:value-of select="@href"/> is not an OSCAL profile</sch:report>
        </sch:rule>
    </sch:pattern>
    
    <xsl:function name="os:or-sequence" as="xs:string">
        <xsl:param name="seq" as="item()*"/>
        <xsl:value-of>
            <xsl:iterate select="$seq">
                <xsl:if test="position() gt 1">
                    <xsl:choose>
                        <xsl:when test="position() eq last()"> or </xsl:when>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:value-of select="."/>
            </xsl:iterate>
        </xsl:value-of>
    </xsl:function>
    
    <xsl:function name="os:and-sequence" as="xs:string">
        <xsl:param name="seq" as="item()*"/>
        <xsl:value-of>
            <xsl:iterate select="$seq">
                <xsl:if test="position() gt 1">
                    <xsl:choose>
                        <xsl:when test="position() eq last()"> and </xsl:when>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:value-of select="."/>
            </xsl:iterate>
        </xsl:value-of>
    </xsl:function>
    
</sch:schema>
