<?xml version="1.0" encoding="UTF-8"?>
<sch:schema
    xmlns:s="http://csrc.nist.gov/ns/oscal/specml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    
    <!--Use for validating XSpec tests.
    
    Assesses coverage by:
      reporting where bindings to tests are broken
      reporting examples or results not found -->
    
    <sch:ns uri="http://www.jenitennison.com/xslt/xspec" prefix="x"/>
    <sch:ns uri="http://csrc.nist.gov/ns/oscal/specml"   prefix="s"/>
    
    <sch:let name="specxml" value="/processing-instruction('specification')/document(normalize-space(.),.)"/>
    
    <xsl:key name="requirement-codes" match="s:req" use="@id"/>
    
    <sch:pattern>
        <sch:rule context="x:description/processing-instruction('specification')">
            <sch:assert test="exists(document(normalize-space(.),.))">No specification found at <sch:value-of select="."/></sch:assert>
        </sch:rule>
        <sch:rule context="x:scenario">
                <sch:assert test="exists(processing-instruction('requirement')) or exists(@pending)">Scenario given without any test bindings</sch:assert>
            
            <!-- Turn these on when ready -->
            <sch:report role="warning" test="false() and exists(@pending)" sqf:fix="remove-pending">Test is pending</sch:report>
            <sch:assert role="info" test="true() or exists(@pending)" sqf:fix="add-pending-deployment add-pending-repair add-pending-update add-pending-discussion">Test is ready</sch:assert>
            <sqf:fix id="remove-pending">
                <sqf:description>
                    <sqf:title>Stage as ready</sqf:title>
                </sqf:description>
                <sqf:delete match="@pending"/>
            </sqf:fix>
            <!--<sqf:fix id="add-pending-selecting">
                <sqf:description>
                    <sqf:title>Add pending</sqf:title>
                </sqf:description>
                
                <sqf:user-entry name="pending_value" default="'discussion'">
                    <sqf:description>
                        <sqf:title>Pending value</sqf:title>
                    </sqf:description>
                    
                </sqf:user-entry>
                <sqf:add node-type="attribute" target="pending" select="$pending_value"/>                
            </sqf:fix>-->
            <sqf:fix id="add-pending-deployment">
                <sqf:description>
                    <sqf:title>Restage pending deployment</sqf:title>
                </sqf:description>
                
                <sqf:add node-type="attribute" target="pending">deployment</sqf:add>
            </sqf:fix>
            <sqf:fix id="add-pending-repair">
                <sqf:description>
                    <sqf:title>Restage pending repair</sqf:title>
                </sqf:description>
                <sqf:add node-type="attribute" target="pending">repair</sqf:add>
            </sqf:fix>
            <sqf:fix id="add-pending-update">
                <sqf:description>
                    <sqf:title>Restage pending update</sqf:title>
                </sqf:description>
                <sqf:add node-type="attribute" target="pending">update</sqf:add>
            </sqf:fix>
            <sqf:fix id="add-pending-discussion">
                <sqf:description>
                    <sqf:title>Restage pending discussion</sqf:title>
                </sqf:description>
                <sqf:add node-type="attribute" target="pending">discussion</sqf:add>
            </sqf:fix>
        </sch:rule>
        
        <sch:rule context="x:scenario/processing-instruction('requirement')">
            <sch:let name="requirement-id" value="normalize-space(.)"/>
            <sch:assert test="exists($specxml/key('requirement-codes',$requirement-id))">Rule not found in spec</sch:assert>
        </sch:rule>
        <sch:rule context="x:context[exists(@href)]">
            <sch:assert test="exists(../@pending) or (resolve-uri(@href,document-uri(/)) => doc-available())">No test input found in location <sch:value-of select="@href"/></sch:assert>
        </sch:rule>
        <sch:rule context="x:expect[exists(@href)]">
            <sch:assert test="exists(../@pending) or (resolve-uri(@href,document-uri(/)) => doc-available())">No test result found in location <sch:value-of select="@href"/></sch:assert>
        </sch:rule>
    </sch:pattern>
      
    
      
</sch:schema>