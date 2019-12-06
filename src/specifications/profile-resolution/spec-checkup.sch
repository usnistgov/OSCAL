<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/specml" prefix="os"/>

    <sch:pattern>
        <sch:rule context="os:section">
            <sch:assert test="count(ancestor::os:section) lt 5">section is too deep</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>
