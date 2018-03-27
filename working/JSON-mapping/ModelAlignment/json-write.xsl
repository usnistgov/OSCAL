<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="some_xml">
        <map xmlns="http://www.w3.org/2005/xpath-functions"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://www.w3.org/2005/xpath-functions file:/home/wendell/Documents/C2Labs/ATLAS/analysis/xml-json.xsd">
            <array key="mine">
                <string>here</string>
            </array>
        </map>
        
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:value-of select="xml-to-json($some_xml)"/>
    </xsl:template>
    
</xsl:stylesheet>