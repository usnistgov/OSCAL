<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <sch:ns prefix="oscal" uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    
    <xsl:key name="elements-by-id" match="*[exists(@id)]" use="@id"/>
    
<!-- For validating catalogs and profiles against constraints not checked by their schemas, to help ensure test viability   -->
    <sch:pattern>
        <sch:rule context="oscal:profile | oscal:catalog">
            <sch:let name="presumed-id" value="replace(document-uri(/),'^.*/','') ! replace(.,'\.[^\.]*$','')"/>
            <sch:assert test="@id = $presumed-id">Document @id is not aligned with the file name: expecting <sch:value-of select="$presumed-id"/> 
            </sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:control | oscal:group | oscal:param">
            <sch:assert test="empty(@id) or count(key('elements-by-id',@id)) = 1">Duplicate @id appears</sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:import">
            <sch:assert test="starts-with(@href,'#') or exists(document(@href,/)/*)">No document is found at import @href target 
                <sch:value-of select="@href"/>.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>