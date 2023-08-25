<?xml version="1.0" encoding="UTF-8"?>
<!--
     Entity resolver for OSCAL Metaschemas
     
     This stylesheet:
     1. Copies an input metaschema module, resolving all external entities
     2. Replace all import/@href's to match a given $importHrefSuffix parameter
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:metaschema="http://csrc.nist.gov/ns/oscal/metaschema/1.0">
    <xsl:output omit-xml-declaration="no" indent="yes"/>
    
    <xsl:param name="importHrefSuffix" select="'RESOLVED'"/>
    
    <!--
         XSLT1.0 compatible string replacement
         
         Via https://gist.github.com/ijy/6572481
    -->
    <xsl:template name="string-replace">
        <xsl:param name="string" />
        <xsl:param name="replace" />
        <xsl:param name="with" />
        
        <xsl:choose>
            <xsl:when test="contains($string, $replace)">
                <xsl:value-of select="substring-before($string, $replace)" />
                <xsl:value-of select="$with" />
                <xsl:call-template name="string-replace">
                    <xsl:with-param name="string" select="substring-after($string,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="with" select="$with" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$string" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!-- Simple identity transform, resolving entities implicitly -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- Transform import/@href using $importHrefSuffix -->
    <xsl:template match="metaschema:import/@href">
        <xsl:attribute name="href">
            <!-- oscal_poam_metaschema.xml => oscal_poam_metaschema_$importHrefSuffix.xml -->
            <xsl:call-template name="string-replace">
                <xsl:with-param name="string" select="." />
                <xsl:with-param name="replace" select="'.xml'" />
                <xsl:with-param name="with" select="concat('_', $importHrefSuffix, '.xml')" />
            </xsl:call-template>
        </xsl:attribute>
    </xsl:template>
</xsl:stylesheet>
