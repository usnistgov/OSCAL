<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:template name="mh:message-handler">
        <xsl:param name="text" as="xs:string"/>
        <xsl:param name="message-type" as="xs:string?"/><!-- e.g., 'Error', 'Warning' -->
        <xsl:param name="error-code" as="xs:string?"/>
        <xsl:param name="terminate" as="xs:boolean" select="false()"/>
        <xsl:message expand-text="yes" terminate="{$terminate}">{
            string-join(($message-type, $error-code, $text),': ')
            }</xsl:message>
    </xsl:template>

</xsl:stylesheet>