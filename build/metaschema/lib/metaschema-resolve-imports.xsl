<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:m="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    exclude-result-prefixes="xs math m"
    version="3.0">
    
<!-- Not to be used standalone, this XSLT is called by produce-xsd.xsl and produce-json-schema.xsl
    
    it depends on declarations for $root-name and for key('definitions-by-name') -->
    
    <xsl:output indent="yes"/>
    
    
    <xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>
   
    
    <!--<xsl:template match="/">
        <BOO>
        <xsl:copy-of select="$all-definitions"/>
        </BOO>
    </xsl:template>-->
    
    <!-- $given-definitions pulls all definitions from all modules into a
         sequence of siblings, guarding against circular imports -->
    <xsl:variable name="given-definitions">
        <m:definitions>
            <xsl:apply-templates mode="acquire-definitions" select="/">
                <xsl:with-param name="so-far" tunnel="true" select="document-uri(/)"/>
            </xsl:apply-templates>
        </m:definitions>
    </xsl:variable>
    <!-- remove all definitions overridden by a subsequent definition (higher-ranked by order of import) -->
    <xsl:variable name="distinct-definitions">
        <!-- we keep the wrapper to make key retrieval and sibling traversal robust -->
        <m:definitions>
            <xsl:sequence select="$given-definitions/m:definitions/*[not(@name=following-sibling::*/@name)]"/>
        </m:definitions>
    </xsl:variable>
    <!--working down from the top, we collect all references to definitions actually to be used in this schema-->
    
    <xsl:variable name="all-definitions" as="document-node()">
         <xsl:variable name="all-references" as="xs:string*">
            <xsl:apply-templates mode="collect-references" select="$distinct-definitions/m:definitions/*[@name=$root-name]">
                <xsl:with-param tunnel="yes" name="ref-stack" select="()"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:document>
        <!-- finally we filter to include only the definitions named among the references -->
          <xsl:sequence select="$distinct-definitions/m:definitions/*[@name=($all-references,$root-name)]"/>
        </xsl:document>
    </xsl:variable>
    
    <xsl:template match="METASCHEMA" mode="acquire-definitions">
        <xsl:apply-templates select="import" mode="acquire-definitions"/>
        <xsl:copy-of select="define-field | define-flag | define-assembly"/>
    </xsl:template>
    
    <xsl:template match="import" mode="acquire-definitions">
        <xsl:param name="so-far" tunnel="yes" required="yes"/>
        <xsl:variable name="uri" select="resolve-uri(@href,document-uri(/))"/>
        <xsl:choose>
            <xsl:when test="$uri = $so-far">
                <xsl:comment expand-text="true">Warning: circular import of { $uri } skipped</xsl:comment>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="document($uri)/METASCHEMA" mode="acquire-definitions">
                    <xsl:with-param name="so-far" select="$so-far,$uri"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!-- Mode 'collect references' collects a set of strings naming definitions
     we actually need, by traversing the definitions tree from the root;
     recursive models are accounted for -->
    <xsl:template match="define-assembly" mode="collect-references">
        <xsl:param name="ref-stack" tunnel="yes" required="yes"/>
        <xsl:if test="not(@name = $ref-stack)">
            <xsl:sequence select="flag/string(@name)"/>
            <xsl:apply-templates select="model" mode="#current">
                <xsl:with-param tunnel="true" name="ref-stack" select="$ref-stack,@name"/>
            </xsl:apply-templates>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="define-field" mode="collect-references">
        <xsl:sequence select="flag/string(@name)"/>
    </xsl:template>
    
    <xsl:template match="model | model//*" mode="collect-references">
        <xsl:apply-templates mode="#current"/>  
    </xsl:template>
    
    <!-- Matching inside the $distinct-definitions variable, so traversing only applicable definitions -->
    <xsl:template priority="10" match="field | fields | assembly | assemblies" mode="collect-references">
        <xsl:sequence select="string(@named)"/>
        <xsl:apply-templates select="key('definition-by-name',@named,root())" mode="#current"/>
    </xsl:template>
        
    <!--hitting anything but a define-assembly, we are done collecting references-->
    <xsl:template match="* | text()" mode="collect-references"/>
    
</xsl:stylesheet>