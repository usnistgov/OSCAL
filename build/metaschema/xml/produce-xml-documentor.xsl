<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
<<<<<<< HEAD
    xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
    
<!-- Purpose: Produce an XSLT supporting production of metaschema documentation.
=======
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
    
<!-- Purpose: Produce an XSLT supporting production of XML-oriented metaschema documentation pertaining
        to a particular catalog type.
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
        
        In the XML pipeline this XSLT can be minimal, producing an XSLT that does little but
        provide for expansion of examples while calling a generic XSLT (also in this subdirectory)
        to do most of the actual conversion work.
        
        NB that outputs must support serialization into JSON, i.e. plain text. -->
        
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting production of metaschema documentation, in HTML format. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
<<<<<<< HEAD
    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>

    <xsl:param name="example-converter-xslt-path" as="xs:string" expand-text="true">../../util/convert/{/METASCHEMA/short-name}-xml-converter.xsl</xsl:param>
    
    <xsl:variable name="example-converter-xslt" select="resolve-uri($example-converter-xslt-path,document-uri(/))"/>
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:template match="METASCHEMA">
        <XSLT:stylesheet version="3.0"
=======
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>

    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:template match="METASCHEMA">
        <xslt:stylesheet version="3.0"
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            exclude-result-prefixes="#all">
            
            
<<<<<<< HEAD
            <xsl:text>&#xA;</xsl:text>
            <xsl:comment> METASCHEMA docs production </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates/>


        </XSLT:stylesheet>
=======
            
            <xsl:comment> METASCHEMA docs production </xsl:comment>
            
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
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
<<<<<<< HEAD
        <XSLT:template
            match="example[@href='{ encode-for-uri(@href) }'][@path='{normalize-space(@path)}']" mode="expand-example">
            <XSLT:copy copy-namespaces="no">
                <XSLT:apply-templates select="node() | @*" mode="#current"/>
                <!-- NB: ns should be dynamic (driven by metaschema) -->
                
                <XSLT:copy-of select="document( resolve-uri(@href,base-uri(.))){@path}" copy-namespaces="no"
                    xpath-default-namespace="{$target-namespace}"/>
            </XSLT:copy>
        </XSLT:template>
=======
        <xslt:template
            match="example[@href='{ encode-for-uri(@href) }'][@path='{normalize-space(@path)}']" mode="expand-example">
            <xslt:copy copy-namespaces="no">
                <xslt:apply-templates select="node() | @*" mode="#current"/>
                <!-- NB: ns should be dynamic (driven by metaschema) -->
                
                <xslt:copy-of select="document( resolve-uri(@href,base-uri(.))){@path}" copy-namespaces="no"
                    xpath-default-namespace="{$target-namespace}"/>
            </xslt:copy>
        </xslt:template>
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
    </xsl:template>
    
    <xsl:template name="furniture">
        
<<<<<<< HEAD
        <!--<XSLT:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>-->
        <XSLT:import href="{$example-converter-xslt}"/>
        <XSLT:import href="../lib/metaschema-xmldocs-jekyll-uswds.xsl"/>
        <XSLT:preserve-space elements="*"/>
        
        <XSLT:variable name="home" select="/"/>
        <XSLT:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag" use="@name"/>
        
        <!-- output method must be text for good markdown including unescaped code snips   -->
        <XSLT:output method="text"/>
        
        <XSLT:template priority="5"
=======
        <xslt:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
        <xslt:import href="../lib/metaschema-xml-html.xsl"/>
        
        <xslt:variable name="home" select="/"/>
        <xslt:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag" use="@name"/>
        
        <!-- output method must be text for good markdown including unescaped code snips   -->
        <xslt:output method="text"/>
        
        <xslt:template priority="5"
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
            match="define-assembly[exists(@acquire-from)] |
            define-field[exists(@acquire-from)] |
            define-flag[exists(@acquire-from)]"
            expand-text="true">
<<<<<<< HEAD
            <XSLT:variable name="defining" select="@name"/>
            <XSLT:variable name="module" select="@acquire-from"/>
            <XSLT:variable name="definition"
                select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, $home))"/>
            <XSLT:apply-templates select="$definition"/>
            <XSLT:if test="empty($definition)">
                <XSLT:comment expand-text="true"> No definition found for { $defining } in { $module } at { /METASCHEMA/import[@name=$module]/@href }</XSLT:comment>
                    </XSLT:if>
        </XSLT:template>
        
        <XSLT:template match="node() | @*" mode="expand-example">
            <XSLT:copy copy-namespaces="no">
                <XSLT:apply-templates select="node() | @*" mode="#current"/>
            </XSLT:copy>
        </XSLT:template>
        
        <XSLT:variable name="expanded">
            <XSLT:apply-templates mode="expand-example" select="/"/>
        </XSLT:variable>
        
        <!-- XXX template here to intercept @acquire-from see produce-xsd.xsl           -->
                
        <XSLT:template match="/">
            <XSLT:variable name="html">
                <XSLT:for-each select="$expanded/*">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                        <head>
                            <XSLT:call-template name="css"/>
                        </head>
                        <body>
                            <XSLT:apply-templates/>
                            <!--<XSLT:apply-templates select="$imported/key('definitions',$all-references,.)[not(@name=$here-declared/(@name|@named))]"/>-->
                        </body>
                    </html>
                    
                </XSLT:for-each>
            </XSLT:variable>
            <XSLT:copy-of select="$html"/>
            <!--<XSLT:apply-templates select="$html" mode="md"/>-->
        </XSLT:template>
 
        
=======
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
 
>>>>>>> 7ebbaa79bacb3ab7e872be6e015eb868c73334ad
    </xsl:template>
 
</xsl:stylesheet>