<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <!--
        Tests OSCAL for tightness.
        Use IN ADDITION to appropriate schema validation
        Applies to profiles, catalogs, and resolution results (catalogs)
    -->
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="o"/>
    
    <xsl:key name="internal-link" match="o:*[starts-with(@href,'#')]" use="@href"/>
    
    <xsl:key name="internal-resource" match="o:resource" use="'#' || @uuid"/>
    
    <sch:pattern>
        <sch:rule context="o:link[@rel='resource']">
            <sch:assert test="exists(key('internal-resource',@href))">Link corresponds to no resource in this document.</sch:assert>
        </sch:rule>
        <sch:rule context="o:resource">
            <sch:let name="exception" value="o:prop[@name='keep']/@value='always'"/>
            <sch:assert test="$exception or exists(key('internal-link',('#' || @uuid)))">Resource has no links.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
</sch:schema>