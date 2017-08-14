<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <sch:ns uri="http://scap.nist.gov/schema/oscal" prefix="oscal"/>
  
  <sch:pattern>
    <!-- parameters and assignments -->
    <sch:rule context="oscal:param">
      <sch:let name="me" value="."/>
      <!-- Note targets must be within scope of parameter parent -->
      <sch:let name="targets" value="key('assignments-by-use',@id,..)"/>
      <sch:let name="echoes"  value="$targets[normalize-space(.)=normalize-space($me)]"/>
      <sch:assert test="empty($echoes)">Parameter value repeats the text
        to which it is assigned
        <!--<xsl:value-of select="if (count($echoes) gt 1) then 'assignments' else 'assignment'"/>-->
        (look for assignments using <xsl:value-of select="$echoes/(@use|@id)/concat('''',.,'''')" separator=", "/>)
      </sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:assign">
      <sch:let name="me" value="."/>
      
      <sch:let name="my-params" value="key('parameter-by-id',normalize-space(@use))"/>
      
      <sch:assert test="not(normalize-space(.) = $my-params[last()])" role="warning">
        Parameter value echoes assignment value.
      </sch:assert>
      
      <sch:assert test="not(matches(@use,'\S')) or exists($my-params)"  sqf:fix="add-param">No parameter found with @id '<sch:value-of select="@use"/>'</sch:assert>
      
      <sch:assert test="matches(@use,'\S')" role="warning" sqf:fix="add-param">Indicate parameter for assignment</sch:assert>

      
    </sch:rule>
    
    
  </sch:pattern>
  
    <sqf:fixes>
      <sqf:fix id="add-param">
        <xsl:variable name="new_id"> 
          <xsl:value-of select="ancestor::oscal:control/oscal:prop[@class=('number','name','id')]"/>
          <xsl:number from="oscal:control" format="_a"/>
        </xsl:variable>
        <xsl:variable name="id" select="($me/@use[matches(.,'\S')],$new_id)[1]"/>
        
        <sqf:description>
          <sqf:title>Add parameter '<sch:value-of select="$id"/>'</sqf:title>
        </sqf:description>
        <sch:let name="home" value="(ancestor::oscal:control|ancestor::oscal:subcontrol)[last()]"/>
        
        <sqf:add node-type="attribute" target="use" select="$id" use-when="empty(@use)"/>
        
        <sqf:add use-when="empty($home/oscal:title)"
          match="(ancestor::oscal:control|ancestor::oscal:subcontrol)[last()]">
          <param id="{$id}" xmlns="http://scap.nist.gov/schema/oscal">
            <xsl:copy-of select="$me/node()"/>
          </param>
        </sqf:add>
        <sqf:add use-when="exists($home/oscal:title)" position="after" match="(ancestor::oscal:control|ancestor::oscal:subcontrol)[last()]/oscal:title">
          <param id="{$id}" xmlns="http://scap.nist.gov/schema/oscal">
            <xsl:copy-of select="$me/node()"/>
          </param>
        </sqf:add>
      </sqf:fix>
    </sqf:fixes>

  <xsl:key name="assignments-by-use" match="oscal:assign[@use|@id]" use="@use | @id"/>
  
  <xsl:key name="parameter-by-id" match="oscal:param" use="@id"/>
  
  <!--<xsl:key name="parameter-by-target" match="oscal:param" use="tokenize(@target,'\s+')"/>-->
  
  
  
</sch:schema>