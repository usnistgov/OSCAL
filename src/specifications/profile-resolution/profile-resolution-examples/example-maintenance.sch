<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <sch:ns prefix="o" uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    
    <sch:pattern>
        <sch:rule context="o:last-modified">
            <sch:assert test=". castable as xs:dateTime"
                sqf:fix="datestamp-file"><sch:name/> not a dateTime (argh)</sch:assert>
            <sch:assert role="warning" test="(current-dateTime() - xs:dateTime(.)) &lt; xs:dayTimeDuration('P1D')"
                sqf:fix="datestamp-file"><sch:name/> date stamp is more than a day old</sch:assert>
            
        </sch:rule>
    </sch:pattern>
    
    <sqf:fixes>
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