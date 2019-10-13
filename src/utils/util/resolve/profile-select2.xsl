<?xml version="1.0" encoding="UTF-8"?>
   <XSLT:stylesheet version="3.0"
        xmlns:XSLT="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        
        xmlns="http://csrc.nist.gov/ns/oscal/1.0"
        xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
        
        xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
        exclude-result-prefixes="#all"
        default-mode="oscal:filter">
        
        
        <XSLT:mode name="oscal:filter"       on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:propagate" on-no-match="shallow-copy"/>
        <XSLT:mode name="oscal:copy-branch"  on-no-match="deep-copy"/>
        
        <XSLT:strip-space elements="catalog metadata group requirement control part param"/>
        
        <XSLT:output indent="yes"/>
        
        <XSLT:template match="catalog" mode="oscal:filter">
            <XSLT:copy>
                <XSLT:apply-templates mode="#current" select="@*"/>
                <XSLT:apply-templates mode="#current"/>
            </XSLT:copy>
        </XSLT:template>
        
        <XSLT:template match="/*/@id" mode="oscal:filter">
            <XSLT:attribute name="id" expand-text="true">PROFILERESULTS-{.}</XSLT:attribute>
        </XSLT:template>
        
        <XSLT:template match="metadata" mode="oscal:filter"/>
        
        <XSLT:template priority="2" match="group" mode="oscal:filter">
            <XSLT:apply-templates mode="#current"/>
        </XSLT:template>
        
        <XSLT:template priority="3" match="control" mode="oscal:filter">
            <XSLT:apply-templates select="." mode="oscal:propagate"/>
        </XSLT:template>
        
        <XSLT:template match="control" mode="oscal:propagate">
            <XSLT:copy>
                <XSLT:apply-templates select="@* | node()" mode="oscal:filter"/>
            </XSLT:copy>
        </XSLT:template>
        
        <XSLT:template match="group/*" mode="oscal:filter"/>
        
    </XSLT:stylesheet>