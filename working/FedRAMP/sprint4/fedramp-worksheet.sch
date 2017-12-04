<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>
    
    
    <sch:pattern>
        
        <sch:rule context="oscal:param/oscal:value">
            <sch:assert role="warning" test="not(. = ../oscal:desc)">Value is unassigned</sch:assert>
        </sch:rule>
        <sch:rule context="oscal:prop[@class='worksheet_baselines']">
            <sch:assert test="contains(../oscal:prop[@class='authority_baselines'],.)">Baselines in worksheet vary from authority </sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    
</sch:schema>