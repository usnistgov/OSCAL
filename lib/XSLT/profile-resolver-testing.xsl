<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="#all"
    
    version="3.0">
    
    <xsl:import href="profile-resolver.xsl"/>
    
    <xsl:template match="/">
        <xsl:apply-templates mode="oscal:resolve"/>
    </xsl:template>
</xsl:stylesheet>