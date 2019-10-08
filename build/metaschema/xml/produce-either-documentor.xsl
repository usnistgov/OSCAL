<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    
    xmlns:XSLT="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias">
    
<!-- Purpose: Produce an XSLT supporting production of metaschema documentation.
        
        In the XML pipeline this XSLT can be minimal, producing an XSLT that does little but
        provide for expansion of examples while calling a generic XSLT (also in this subdirectory)
        to do most of the actual conversion work.
        
        NB that outputs must support serialization into JSON, i.e. plain text. -->
        
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting production of metaschema documentation, in HTML format. -->

<!-- nb A schema and Schematron for the metaschema format should be found nearby. -->

    <!-- 'xml' or 'json' -->
    <xsl:param name="target-format" as="xs:string" required="yes"/>
    
    <xsl:variable name="source-format">
        <xsl:choose>
            <xsl:when test="$target-format='xml'">json</xsl:when>
            <xsl:otherwise>xml</xsl:otherwise>
        </xsl:choose>
        
    </xsl:variable>
    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="XSLT" result-prefix="xsl"/>

    <xsl:param name="schema-path" as="xs:string" select="document-uri(/)"/>

    <xsl:param name="example-converter-xslt" as="xs:string" required="yes"/>
    
    <!--<xsl:variable name="example-converter-xslt" select="resolve-uri($example-converter-xslt-path,$schema-path)"/>-->
    
    <xsl:variable name="target-namespace" select="string(/METASCHEMA/namespace)"/>
    
    <xsl:template match="METASCHEMA">
        <XSLT:stylesheet version="3.0"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            exclude-result-prefixes="#all">
            
            
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
        <XSLT:template
            match="example[@href='{ encode-for-uri(@href) }'][@path='{normalize-space(@path)}']" mode="expand-example">
            <XSLT:copy copy-namespaces="no">
                <XSLT:apply-templates select="node() | @*" mode="#current"/>
                <!-- NB: ns should be dynamic (driven by metaschema) -->
                
                <XSLT:copy-of select="document( resolve-uri(@href,base-uri(.))){@path}" copy-namespaces="no"
                    xpath-default-namespace="{$target-namespace}"/>
            </XSLT:copy>
        </XSLT:template>
    </xsl:template>
    
    <xsl:template name="furniture">
        
        <!--<XSLT:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>-->
        <xsl:if test="$target-format='json'">
          <XSLT:import href="{$example-converter-xslt}"/>
        </xsl:if>
        <XSLT:import href="../lib/metaschema-{$target-format}docs-hugo-uswds.xsl"/>
        <XSLT:preserve-space elements="*"/>
        
        <XSLT:param name="schema-path" select="'{ $schema-path }'"/>
        
        <XSLT:variable name="home" select="/"/>
        <!--<XSLT:key name="declarations-by-name"
            match="define-field | define-assembly | define-flag" use="@name"/>-->
        
        <!-- output method must be text for good markdown including unescaped code snips   -->
        <!--<XSLT:output method="text"/>-->
        
        <!--<XSLT:template priority="5"
            match="define-assembly[exists(@acquire-from)] |
            define-field[exists(@acquire-from)] |
            define-flag[exists(@acquire-from)]"
            expand-text="true">
            <XSLT:variable name="defining" select="@name"/>
            <XSLT:variable name="module" select="@acquire-from"/>
            <XSLT:variable name="definition"
                select="/METASCHEMA/import[@name = $module]/key('declarations-by-name', $defining, document(@href, $home))"/>
            <XSLT:apply-templates select="$definition"/>
            <XSLT:if test="empty($definition)">
                <XSLT:comment expand-text="true"> No definition found for { $defining } in { $module } at { /METASCHEMA/import[@name=$module]/@href }</XSLT:comment>
                    </XSLT:if>
        </XSLT:template>-->
        
        <XSLT:template match="node() | @*" mode="expand-example">
            <XSLT:copy copy-namespaces="no">
                <XSLT:apply-templates select="node() | @*" mode="#current"/>
            </XSLT:copy>
        </XSLT:template>
        
        <XSLT:variable name="expanded">
            <XSLT:apply-templates mode="expand-example" select="/"/>
        </XSLT:variable>
        
        <XSLT:template match="/">
            <XSLT:variable name="html">
                <XSLT:for-each select="$expanded">
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
 
        
    </xsl:template>
 
</xsl:stylesheet>
