<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0">
    
    <sch:ns prefix="o"     uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    <sch:ns prefix="oscal" uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    
    <!-- This Schematron checks the representation of labels in SP800-53
           - labels given on controls and their parts correspond to their @id values
           - labels are formatted correctly and represent the order of the document
             by incrementing regularly -->
         
    <sch:pattern>
        <sch:rule context="oscal:part[@name='item']/oscal:prop[@name='label']">
            <xsl:variable name="number-format">
                <xsl:apply-templates mode="number-format" select=".."/>
            </xsl:variable>
            <!-- returns true() when $parent-label is empty -->
            <xsl:variable name="expected">
                <xsl:number count="oscal:part[@name='item']" format="{$number-format}"/>
            </xsl:variable>
            <sch:assert test=". = $expected">Label issue: expected '<sch:value-of select="$expected"/>'</sch:assert>
        </sch:rule>
        
        <!-- Preempted by the preceding rule, this rule matches label properties not directly inside part[@name='item'] -->
        <sch:rule context="oscal:prop[@name='label']">
            <sch:let name="parent-label" value="parent::*/../oscal:prop[@name='label']"/>
            <!-- returns true() when $parent-label is empty -->
            <sch:assert test="starts-with(.,$parent-label)">Label hierarchy issue</sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:control">
            <sch:let name="expected-id" value="o:reduce-label(oscal:prop[@name='label'])"/>
            <sch:assert test="@id = $expected-id">Expected id to be '<sch:value-of select="$expected-id"/>'</sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:control/oscal:part[@name='statement']">
            <sch:let name="expected-id" value="../@id || '_smt'"/>
            <sch:assert test="@id = $expected-id">Expected id to be '<sch:value-of select="$expected-id"/>'</sch:assert>
        </sch:rule>

        <sch:rule context="oscal:part[@name='statement']/oscal:part[@name='statement']">
            <sch:let name="owner" value="(ancestor::oscal:control)[1]"/>
            <xsl:variable name="reckoning">
                <xsl:number count="oscal:part[@name='statement']/oscal:part[@name='statement']" level="multiple" format=".a.1"/>
            </xsl:variable>
            <sch:let name="expected-id" value="$owner/@id || '_smt' || $reckoning"/>
            <sch:assert test="@id = $expected-id">Expected id to be '<sch:value-of select="$expected-id"/>'</sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:control/oscal:part[@name='objective']">
            <sch:let name="expected-id" value="../@id || '_obj'"/>
            <sch:assert test="@id = $expected-id">Expected id to be '<sch:value-of select="$expected-id"/>'</sch:assert>
        </sch:rule>
        
        
<!-- OBJECTIVE IDS
            An 'objective' id has two parts, before and after '_obj' called $head and $tail
     One but not the other of these has an incremented value.
     The other must be the same as the parent.
     If neither or both are the same we have an error.
     
     calling the kind that increments the head, a 'matcher'
     calling the kind that increments the tail, a 'brancher' -->
<!-- when the head is incremented, it should be calculable relative to other
     front-incremented values (heads, numbered relative to the root of the control)
     when the tail is incremented, similarly, within the scope of elements with the same head -->

        <sch:rule context="oscal:part[@name = 'objective']/oscal:part[@name = 'objective']">

            <sch:let name="owner" value="ancestor::oscal:control[1]"/>

            <sch:let name="my-head" value="o:head(.)"/>
            <sch:let name="my-tail" value="o:tail(.)"/>
            <sch:assert test="(o:head(.) = o:head(..)) or (o:tail(.) = o:tail(..))">Head or tail must match</sch:assert>
            <!-- $maps when the head increments, meaning we map to a new element -->
            <sch:let name="maps" value="$my-tail = (o:tail(..), '')"/>
            <!-- $extends when the head is the same but we extend for more detail (the tail changes) -->
            <sch:let name="extends" value="o:head(.) = o:head(..)"/>

            <!-- When $maps, we expect the mapping portion (the head) to be regular      -->
            <xsl:variable name="id-for-mapper">
                <xsl:value-of select="o:head(..)"/>
                <xsl:number count="oscal:part/oscal:part"
                    format="{ if (matches(o:head(..),'\d$')) then '.a' else '.1' }"/>
                <xsl:text>_obj</xsl:text>
                <xsl:value-of select="$my-tail"/>
            </xsl:variable>

            <sch:assert test="not($maps) or @id = $id-for-mapper"> Expecting @id to be
                    '<sch:value-of select="$id-for-mapper"/>' </sch:assert>

            <xsl:variable name="id-for-extender">
                <xsl:value-of select="../@id"/>
                <xsl:number count="oscal:part/oscal:part"
                    format="{ if (matches(../@id,'\d$')) then '.a' else '.1' }"/>
            </xsl:variable>
            <sch:assert test="not($extends) or @id = $id-for-extender"> Expecting @id to be
                    '<sch:value-of select="$id-for-extender"/>' </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <xsl:function name="o:head" as="xs:string">
        <xsl:param name="who" as="element()"/>
        <xsl:sequence select="substring-before($who/@id,'_obj')"/>
    </xsl:function>
    
    <xsl:function name="o:tail" as="xs:string">
        <xsl:param name="who" as="element()"/>
        <xsl:sequence select="substring-after($who/@id,'_obj')"/>
    </xsl:function>
    
    <xsl:function name="o:reduce-label">
        <xsl:param name="what"/>
        <xsl:value-of select="lower-case($what) ! replace(., '\(', '.') ! replace(., '\)', '') ! replace(.,'\.$','')"/>
    </xsl:function>
    
    <xsl:template mode="number-format" priority="1" match="oscal:part[@name='item']">a.</xsl:template>
    <xsl:template mode="number-format" priority="2" match="oscal:part[@name='item']/oscal:part[@name='item']">1.</xsl:template>
    <xsl:template mode="number-format" priority="3" match="oscal:control/oscal:control//oscal:part[@name='item']">(a)</xsl:template>
    <xsl:template mode="number-format" priority="4" match="oscal:control/oscal:control//oscal:part[@name='item']/oscal:part[@name='item']">(1)</xsl:template>
</sch:schema>