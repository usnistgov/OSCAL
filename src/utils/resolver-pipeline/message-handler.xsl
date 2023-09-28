<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:mh="http://csrc.nist.gov/ns/message"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="#all"
    version="3.0">
    
    <xsl:template name="mh:message-handler" as="processing-instruction()">
        <xsl:param name="text" as="xs:string"/>
        <xsl:param name="message-type" as="xs:string?"/><!-- e.g., 'Error', 'Warning' -->
        <xsl:param name="error-code" as="xs:string?"/>
        <xsl:param name="terminate" as="xs:boolean" select="false()"/>
        <xsl:variable name="joined-string" as="xs:string"
            select="string-join(($message-type, $error-code, $text),': ')"/>
        <xsl:processing-instruction name="message-handler" expand-text="yes">{
            if ($terminate) then 'Terminating ' else ''
            }{
            $joined-string
            }</xsl:processing-instruction>
        <!-- Above, line break inside the text value template instead of outside it
             prevents the output PI from including the line break. -->
    </xsl:template>

</xsl:stylesheet>