<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <!-- parameters and assignments -->
    <sch:rule context="oscal:param">
      <sch:let name="me" value="."/>
      <sch:let name="targets" value="key('assignments-by-use',(@role|@id))"/>
      <sch:let name="echoes"  value="$targets[normalize-space(.)=normalize-space($me)]"/>
      <sch:assert test="empty($echoes)">Parameter value echoes its
        <xsl:value-of select="if (count($echoes) gt 1) then 'assignments' else 'assignment'"/>
        (look for assignments using <xsl:value-of select="$echoes/@use/concat('''',.,'''')" separator=", "/>)
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:assign">
      <sch:let name="me" value="."/>
      
      <sch:let name="target" value="key('parameter-by-key',normalize-space(@use))"/>
      <sch:assert test="not(matches(@use,'\S')) or exists($target)"  sqf:fix="add-param">No parameter found with @id or @role '<sch:value-of select="@use"/>'</sch:assert>
      <sqf:fix id="add-param">
        <xsl:variable name="id" select="normalize-space(@use)"/>
        
        <sqf:description>
          <sqf:title>Add parameter '<sch:value-of select="$id"/>'</sqf:title>
        </sqf:description>
        
        <!--<sqf:add node-type="attribute" target="use" select="$id"/>-->
        <sqf:add match="ancestor::oscal:control[1]">
          <param id="{$id}" xmlns="http://scap.nist.gov/schema/oscal">
            <xsl:copy-of select="$me/node()"/>
          </param>
        </sqf:add>
      </sqf:fix>
      


      <sch:assert test="matches(@use,'\S')" role="warning" sqf:fix="add-param-and-use">Indicate parameter for assignment</sch:assert>

      <sqf:fix id="add-param-and-use">
        <xsl:variable name="new_id"> 
          <xsl:value-of select="ancestor::oscal:control/oscal:prop[@role=('number','name','id')]"/>
          <xsl:number from="oscal:control" format="_a"/>
        </xsl:variable>
        <xsl:variable name="id" select="($me/@use[matches(.,'\S')],$new_id)[1]"/>
        
        <sqf:description>
          <sqf:title>Add parameter '<sch:value-of select="$id"/>'</sqf:title>
        </sqf:description>
        
        <sqf:add node-type="attribute" target="use" select="$id"/>
        <sqf:add match="ancestor::oscal:control[1]">
          <param id="{$id}" xmlns="http://scap.nist.gov/schema/oscal">
            <xsl:copy-of select="$me/node()"/>
          </param>
        </sqf:add>
      </sqf:fix>
    </sch:rule>
    
    
  </sch:pattern>

  <xsl:key name="assignments-by-use" match="*[matches(@use,'\S')]" use="@use"/>
  
  <xsl:key name="parameter-by-key" match="oscal:param" use="@id | @role"/>
  
  
  
</sch:schema>