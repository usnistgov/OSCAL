<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
  xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0">
  
  <sch:ns uri="http://csrc.nist.gov/ns/oscal/1.0" prefix="oscal"/>

  <xsl:key name="assignments-by-use" match="oscal:insert[exists(@param-id)]" use="@param-id"/>
  
  <xsl:key name="parameter-by-id" match="oscal:param[exists(@id)]" use="@id"/>
  
  <sch:pattern>
    <!--
    o orphan assignment
      o assign/@param-id points to parameter
      o assign/@param-id points to parameter in scope
      o quickfix to add param or pointer to param?
    o orphan parameter (as warning)
    o assignment has no param/value or default - as warning
      o quickfix: add param value for assignment
   -->
    <sch:rule context="oscal:insert">
      <sch:let name="my-param" value="key('parameter-by-id',normalize-space(@param-id))"/>      
      <sch:assert test="exists($my-param)" sqf:fix="add-new-param">Insertion has no parameter</sch:assert>
      <!--sqf:fix="move-param"-->
      <sch:assert test="empty($my-param) or exists($my-param intersect ancestor::*/oscal:param)" >Indicated parameter '<sch:value-of select="@param-id"/>' is not in scope</sch:assert>
      <sch:assert test="empty($my-param) or exists($my-param/oscal:value)" role="warning" sqf:fix="add-param-value">Indicated parameter '<sch:value-of select="@param-id"/>' has no value given</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:param">
      <sch:let name="my-assignments" value="key('assignments-by-use',normalize-space(@id))"/>
      <sch:assert test="exists($my-assignments) or ancestor::oscal:component" role="warning">Parameter is used nowhere.</sch:assert>
    </sch:rule>
    
    <sch:rule context="oscal:param/oscal:value">
      <sch:assert role="warning" test="not(. = ../oscal:desc)">Parameter value echoes description.</sch:assert>
    </sch:rule>
    
  </sch:pattern>
  
    <sqf:fixes>
      <!-- XXX Add quickfix use-param to select from available parameters? -->
      <sqf:fix id="add-new-param">
        <xsl:variable name="me" select="."/>
        <xsl:variable name="home" select="(ancestor::oscal:control | ancestor::oscal:subcontrol)[last()]"/>
        <xsl:variable name="id_guess">
          <xsl:for-each select="ancestor::oscal:control">
            <xsl:value-of select="(@id,oscal:prop[@class=('number','name','id')])[1]"/>
            <xsl:number value="count(.|.//oscal:param)" format="_a"/>
          </xsl:for-each>
        </xsl:variable>
        <sqf:description>
          <sqf:title>Add parameter for assignment</sqf:title>
        </sqf:description>
        
        <sqf:user-entry name="param_id" default="{if (empty(key('parameter-by-id',$id_guess))) then $id_guess else generate-id()}">
          <sqf:description>
            <sqf:title>Parameter id</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:user-entry name="param_value">
          <sqf:description>
            <sqf:title>Parameter value</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        
        <sqf:add node-type="attribute" target="use" select="$param_id"/>
        
        <sqf:add use-when="empty($home/(oscal:title|oscal:param))" match="$home">
          <param id="{$param_id}">
            <xsl:copy-of select="$me/node()"/>
            <value><xsl:value-of select="$param_value"/></value>
          </param>
        </sqf:add>
        <sqf:add use-when="exists($home/oscal:title) and empty($home/oscal:param)" position="after" match="$home/oscal:title">
          <param id="{$param_id}">
            <xsl:copy-of select="$me/node()"/>
            <value><xsl:value-of select="$param_value"/></value>
          </param>
        </sqf:add>
        <sqf:add use-when="exists($home/oscal:param)" position="after" match="(ancestor::oscal:control|ancestor::oscal:subcontrol)[last()]/oscal:param[last()]">
          <param id="{$param_id}">
            <xsl:copy-of select="$me/node()"/>
            <value><xsl:value-of select="$param_value"/></value>
          </param>
        </sqf:add>
      </sqf:fix>
      <sqf:fix id="add-param-value">
        <sqf:description>
          <sqf:title>Add parameter value</sqf:title>
        </sqf:description>
        <sqf:user-entry name="param_value">
          <sqf:description>
            <sqf:title>Parameter value</sqf:title>
          </sqf:description>
        </sqf:user-entry>
        <sqf:add match="$my-param" position="last-child">
          <value><xsl:value-of select="$param_value"/></value>
        </sqf:add>
        
        
        </sqf:fix>
    </sqf:fixes>
  
</sch:schema>