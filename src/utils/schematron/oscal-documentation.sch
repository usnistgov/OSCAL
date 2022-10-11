<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xmlns:nm="http://csrc.nist.gov/ns/metaschema"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0">

    <sch:ns uri="http://csrc.nist.gov/ns/oscal/metaschema/1.0" prefix="m"/>
    <sch:ns uri="http://csrc.nist.gov/ns/metaschema" prefix="nm"/>
    
    <sch:pattern>
        <sch:rule context="m:description">
            <sch:assert role="error" test="ends-with(.,'.')" id="description-ends-with-dot">Description should end with a period.</sch:assert>
            <sch:assert role="error" test="string-length(.) gt 6" id="description-long-enough">Description is too short.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>