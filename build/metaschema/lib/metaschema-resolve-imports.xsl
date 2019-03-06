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
    
    <!--<xsl:variable name="root-name" select="/METASCHEMA/@root/string(.)"/>
    
    <xsl:key name="definition-by-name" match="define-flag | define-field | define-assembly" use="@name"/>-->
   
   
    
    <xsl:variable name="all-definitions" as="element()*">
        <!-- copy all definitions from all modules, in order from first to last (lowest to highest) -->
        <xsl:variable name="given-definitions">
            <m:definitions>
                <xsl:apply-templates mode="acquire-definitions" select="/"/>
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
        <xsl:variable name="all-references" as="xs:string*">
            <xsl:apply-templates mode="collect-references" select="$distinct-definitions/m:definitions/*[@name=$root-name]"/>
        </xsl:variable>
        <!-- finally we filter to include only the definitions named among the references -->
        <xsl:sequence select="$distinct-definitions/m:definitions/*[@name=($all-references,$root-name)]"/>
    </xsl:variable>
    
    <xsl:template match="METASCHEMA" mode="acquire-definitions">
        <xsl:apply-templates select="import" mode="acquire-definitions"/>
        <xsl:copy-of select="define-field | define-flag | define-assembly"/>
    </xsl:template>
    
    <xsl:template match="import" mode="acquire-definitions">
        <xsl:apply-templates select="document(@href,/)/METASCHEMA" mode="acquire-definitions"/>
    </xsl:template>
    
    <xsl:template match="define-assembly" mode="collect-references">
        <xsl:sequence select="flag/string(@name)"/>
        <xsl:apply-templates select="model" mode="#current"/>  
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