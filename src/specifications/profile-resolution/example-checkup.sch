<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:uuid="java:java.util.UUID">
    
    <sch:ns prefix="oscal" uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    <sch:ns prefix="uuid"  uri="java:java.util.UUID"/>
    
    <xsl:key name="elements-by-id" match="*[exists(@id)]" use="@id"/>
    
<!-- For validating catalogs and profiles against constraints not checked by their schemas, to help ensure test viability   -->
    <sch:pattern>
        <sch:rule context="oscal:profile | oscal:catalog">
            <sch:assert test="matches(@uuid,'\S')"
                sqf:fix="add-uuid"><sch:name/> is missing uuid</sch:assert>
            <!--<sch:let name="presumed-id" value="replace(document-uri(/),'^.*/','') ! replace(.,'\.[^\.]*$','')"/>
            <sch:assert test="@id = $presumed-id">Document @id is not aligned with the file name: expecting <sch:value-of select="$presumed-id"/> 
            </sch:assert>-->
        </sch:rule>
        
        <sch:rule context="oscal:control | oscal:group | oscal:param">
            <sch:assert test="empty(@id) or count(key('elements-by-id',@id)) = 1">Duplicate @id appears</sch:assert>
        </sch:rule>
        
        <sch:rule context="oscal:import">
            <sch:assert test="starts-with(@href,'#') or exists(document(@href,/)/*)">No document is found at import @href target 
                <sch:value-of select="@href"/>.</sch:assert>
        </sch:rule>
        <sch:rule context="oscal:resource/oscal:rlink">
            <sch:assert test="matches(@href,'^https?:/') or exists(document(@href,/)/*)">No document is found at rlink @href target 
                <sch:value-of select="@href"/>.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern>
        <sch:rule context="oscal:last-modified">
            <sch:assert test=". castable as xs:dateTime"
                sqf:fix="datestamp-file"><sch:name/> not a dateTime (argh)</sch:assert>
            <!--<sch:assert role="warning" test="(current-dateTime() - xs:dateTime(.)) &lt; xs:dayTimeDuration('P1D')"
                sqf:fix="datestamp-file"><sch:name/> date stamp is more than a day old</sch:assert>-->
            
        </sch:rule>
    </sch:pattern>
    
    <sqf:fixes>
        <sqf:fix id="add-uuid">
            <sqf:description>
                <sqf:title>Refresh uuid with UUID</sqf:title>
            </sqf:description>
            <!--<sqf:add node-type="attribute" target="uuid" select="uuid:randomUUID()"/>-->
        </sqf:fix>
        <sqf:fix id="datestamp-file">
            <sqf:description>
                <sqf:title>Stamp date-time</sqf:title>
            </sqf:description>
            <!--<sqf:replace match="o:last-modified" target="o:last-modified" node-type="element" select="current-dateTime()"/>-->
            <sqf:stringReplace match="text()" regex="^.*$">
                <sch:value-of select="current-dateTime()"/>
            </sqf:stringReplace>
        </sqf:fix>
    </sqf:fixes>
</sch:schema>