<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:param name="json-file"/>
    
    <xsl:template match="/">
        <html>
            <body>
                <xsl:if test="matches($json-file,'\S')">
                    <p class="source">Source file <xsl:value-of select="$json-file"/></p>
                </xsl:if>
                <xsl:for-each-group select="//part[@class='satisfies']" group-by="prop[@class='status']">
                    <div class="satisfies">
                        <h3>
                            <xsl:value-of select="current-grouping-key()"/>
                        </h3>
                        <p>Counting <xsl:value-of select="count(current-group()/prop[@class=('control-name','subcontrol-name')])"/><!-- (<xsl:value-of select="count(current-group())"/>)--></p>
                        <p><xsl:value-of select="current-group()/prop[@class=('control-name','subcontrol-name')]" separator=", "/></p>
                    </div>
                </xsl:for-each-group>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>