<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
    
<!-- Purpose: Produce an XSLT supporting production of XML-oriented metaschema documentation pertaining
        to a particular catalog type.
        
        In the XML pipeline this XSLT can be minimal, producing an XSLT that does little but
        provide for expansion of examples while calling a generic XSLT (also in this subdirectory)
        to do most of the actual conversion work.
        
        NB that outputs must support serialization into JSON, i.e. plain text. -->
        
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting production of metaschema documentation, in HTML format. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>

    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:template match="METASCHEMA">
        <xslt:stylesheet version="3.0"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            exclude-result-prefixes="#all">
            
            
            
            <xsl:comment> METASCHEMA docs production </xsl:comment>
            
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
    </xsl:template>
    
    <!--<example href="base-example.xml" path="/descendant::single-required-field[1]">
        <description>An example in a remote document</description>
    </example>-->
    
    <!-- XXX This has to go b/c @acquire-from objects won't have examples ... but, do we want em?  -->
    <!--<xsl:template match="METASCHEMA//*">
        <xsl:if test="exists(descendant::example)">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>-->
    
    <xsl:template match="text()"/>
    
    <xsl:template priority="2" match="example[matches(@href,'\S')][matches(@path,'\S')]">
        <xslt:template
            match="example[@href='{ encode-for-uri(@href) }'][@path='{normalize-space(@path)}']" mode="expand-example">
            <xslt:copy copy-namespaces="no">
                <xslt:apply-templates select="node() | @*" mode="#current"/>
                <!-- NB: ns should be dynamic (driven by metaschema) -->
                
                <xslt:copy-of select="document( resolve-uri(@href,base-uri(.))){@path}" copy-namespaces="no"
                    xpath-default-namespace="{$target-namespace}"/>
            </xslt:copy>
        </xslt:template>
    </xsl:template>
    
    <xsl:template name="furniture">
        
        <xslt:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
        <xslt:import href="../lib/metaschema-xml-html.xsl"/>
        
        <xslt:variable name="home" select="/"/>
        <xslt:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag" use="@name"/>
        
        <!-- output method must be text for good markdown including unescaped code snips   -->
        <xslt:output method="text"/>
        
        <xslt:template priority="5"
            match="define-assembly[exists(@acquire-from)] |
            define-field[exists(@acquire-from)] |
            define-flag[exists(@acquire-from)]"
            expand-text="true">
            <xslt:variable name="defining" select="@name"/>
            <xslt:variable name="module" select="@acquire-from"/>
            <xslt:variable name="definition"
                select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, $home))"/>
            <xslt:apply-templates select="$definition"/>
            <xslt:if test="empty($definition)">
               <xsl:comment> No definition found for { $defining } in { $module } at { /METASCHEMA/import[@name=$module]/@href }</xsl:comment>
                    </xslt:if>
        </xslt:template>
        
        <xslt:template match="node() | @*" mode="expand-example">
            <xslt:copy copy-namespaces="no">
                <xslt:apply-templates select="node() | @*" mode="#current"/>
            </xslt:copy>
        </xslt:template>
        
        <xslt:variable name="expanded">
            <xslt:apply-templates mode="expand-example" select="/"/>
        </xslt:variable>
        
        <!-- XXX template here to intercept @acquire-from see produce-xsd.xsl           -->
                
        <xslt:template match="/">
            <xslt:variable name="html">
                <xslt:for-each select="$expanded/*">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                        <body>
                            <xslt:apply-templates/>
                            <!--<xslt:apply-templates select="$imported/key('definitions',$all-references,.)[not(@name=$here-declared/(@name|@named))]"/>-->
                        </body>
                    </html>
                    
                </xslt:for-each>
            </xslt:variable>
            <!--<xsl:copy-of select="$html"/>-->
            <xslt:apply-templates select="$html" mode="md"/>
        </xslt:template>
 
    </xsl:template>
 
</xsl:stylesheet>