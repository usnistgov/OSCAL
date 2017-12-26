<?xml version="1.0" encoding="UTF-8"?>
<fo:root xsl:version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:variable name="svg-file" select="document-uri(/)"/>
    <xsl:variable name="height" select="/svg:svg/@height"/>
    <xsl:variable name="width" select="/svg:svg/@width"/>
    
    <fo:layout-master-set>
        <fo:simple-page-master master-name="svg"
            page-height="{$height}" page-width="{$width}">
            <fo:region-body/>
        </fo:simple-page-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="svg">
        <fo:flow flow-name="xsl-region-body">
            <fo:block>
                <fo:external-graphic src="{$svg-file}"/>
            </fo:block>
        </fo:flow>
    </fo:page-sequence>
</fo:root>