<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/specml"
    version="3.0">

    <xsl:import href="specml-html-xslt1.xsl"/>

    <xsl:template match="cf">
        <details style="border: thin solid black; padding: 0.5em">
            <summary>
                <xsl:next-match/>
            </summary>
            <pre class="cf">
               <xsl:sequence select="serialize(document(@file, /))"/>
      </pre>
        </details>
    </xsl:template>

</xsl:stylesheet>
