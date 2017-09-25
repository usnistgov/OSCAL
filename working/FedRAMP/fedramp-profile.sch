<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>
    
    
    <sch:pattern>
        
        <sch:rule context="oscal:set-param/oscal:value">
            <sch:report role="warning" test=". = ../oscal:desc">Value is unassigned</sch:report>
        </sch:rule>
        <sch:rule context="oscal:part[@class='parameters']">
            <sch:report test="true()">Check parameters</sch:report>
        </sch:rule>
        <sch:rule context="oscal:prop">
            <sch:report role="warning" test="true()">Check property '<sch:value-of select="@class"/>'</sch:report>
        </sch:rule>
        
    </sch:pattern>
    
    
</sch:schema>