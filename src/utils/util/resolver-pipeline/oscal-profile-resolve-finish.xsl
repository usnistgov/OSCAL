<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:opr="http://csrc.nist.gov/ns/oscal/profile-resolution"
    exclude-result-prefixes="xs math o opr"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" >
    
    <!-- XSLT 2.0 so as to validate against XSLT 3.0 constructs -->
    
    <xsl:template match="* | @*" mode="#all">
        <xsl:copy>
            <xsl:apply-templates mode="#current" select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
<!-- remove opqr and xsi namespaces -->

<!-- consider sorting elements in metadata, groups and controls into expected order -->
    
<!-- filter back-matter -->

</xsl:stylesheet>