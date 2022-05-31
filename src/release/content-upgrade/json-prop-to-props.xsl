<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
    xmlns="http://www.w3.org/2005/xpath-functions">
    
<!-- 
    Command line invocation:
    
    $ java -jar $SAXON_HOME/saxon-he-10.2.jar -xsl:json-prop-to-props.xsl -it json-input=YOUR.json

    where YOUR.json is your JSON file and the jar file is Saxon 10 or later.
    
    The process reads the file at this URL, parses it as JSON, maps it through a filter, and reports it back.
    
    -->
    
    <xsl:output method="text"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- The input JSON file -->
    <xsl:param name="json-input" select="'url to json file'"/>
    
    <!-- The initial template that process the JSON -->
    <xsl:template name="xsl:initial-template">
        <xsl:variable name="mapped-result">
            <xsl:apply-templates select="json-to-xml(unparsed-text($json-input))"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$mapped-result"/>-->
        <xsl:value-of select="xml-to-json($mapped-result)"/>
    </xsl:template>
    
    <xsl:template match="array[@key='prop']">
        <array key="props">
            <xsl:apply-templates/>
        </array>
    </xsl:template>
    
</xsl:stylesheet>