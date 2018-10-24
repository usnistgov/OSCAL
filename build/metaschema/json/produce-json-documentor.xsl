<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
    version="3.0"
    xmlns="http://www.w3.org/1999/xhtml"
    
    xmlns:xslt="http://csrc.nist.gov/ns/oscal/metaschema/xslt-alias"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    
    >
    
<!-- Purpose: Produce an XSLT supporting production of JSON-oriented metaschema documentation pertaining
        to a particular metaschema-defined document type such as OSCAL catalog or profile.
        
        In the case of the JSON docs production XSLT, the particular XML->JSON for the document type
        must be bound in, for those element to be converted (XMl->JSON) for display. This is done by
        wiring in the *expected* file name of the converter XSLT to a parameter, whose value can be
        overridden at runtime.
               
        In doing so, external pointers (to sample files) are resolved to templates that may be executed in schema production. -->
<!-- Input:   A Metaschema -->
<!-- Output:  An XSLT, supporting production of metaschema documentation, in markdown format. -->

    <xsl:output indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:namespace-alias stylesheet-prefix="xslt" result-prefix="xsl"/>
    
    <xsl:param name="example-converter-xslt-path" as="xs:string" expand-text="true">../../util/convert/{/METASCHEMA/short-name}-xml-converter.xsl</xsl:param>
    
    <xsl:variable name="example-converter-xslt" select="resolve-uri($example-converter-xslt-path,document-uri(/))"/>
    
    <xsl:template match="METASCHEMA">
        
        <xslt:stylesheet version="3.0"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
            xpath-default-namespace="http://csrc.nist.gov/ns/oscal/metaschema/1.0"
            exclude-result-prefixes="#all">
            
            <!-- $delimiters is declared in the imported conversion XSLT  -->
            <xslt:output indent="yes" method="text" use-character-maps="delimiters"/>
            
            <xsl:comment> METASCHEMA docs production </xsl:comment>
            
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:call-template  name="furniture"/>
            <xsl:comment> XHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHXXHHX </xsl:comment>
            <xsl:apply-templates/>


        </xslt:stylesheet>
    </xsl:template>

    <xsl:template match="METASCHEMA//*">
        <xsl:if test="exists(descendant::example)">
            <xsl:apply-templates/>
        </xsl:if>
    </xsl:template>
    
    <xsl:template priority="2" match="example[matches(@href,'\S')][matches(@path,'\S')]">
        <xslt:template
            match="example[@href='{ encode-for-uri(@href) }'][@path='{normalize-space(@path)}']" mode="expand-example">
            
            <xslt:copy copy-namespaces="no">
                <xslt:apply-templates select="node() | @*" mode="#current"/>
                <xslt:variable name="target"                      xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0" select="document('{@href}',.){@path}[1]"/>
                <!--<xslt:message expand-text="yes">I see { count($target) }, called { $target/name() } </xslt:message>-->
                <xslt:for-each select="$target/..">
                    <xslt:copy copy-namespaces="no">
                        <xslt:copy-of select="$target" copy-namespaces="no"/>
                    </xslt:copy>
                </xslt:for-each>
            </xslt:copy>
        </xslt:template>
        
    </xsl:template>
    
    
    <xsl:template name="furniture">
                
        <xslt:import href="{$example-converter-xslt}"/>
        <xslt:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>
        
        <xslt:import href="../lib/metaschema-json-html.xsl"/>
        <!--<xslt:output method="text"/>-->
        <xslt:param name="json-file" as="xs:string?" select="()"/>
        <xslt:param name="json-indent" as="xs:string">yes</xslt:param>
        
        <xslt:variable name="imported" select="/METASCHEMA/import/document(@href,/)"/>
        
        <xslt:variable name="all-references" select="//flag/@name | //model//*/@named"/>
        
        <xslt:variable name="here-declared" as="element()*" select="//define-flag | //define-field | //define-assembly"/>
        
        <xslt:key name="definitions" match="define-flag | define-field | define-assembly" use="@name"/>
        
        <xslt:template match="node() | @*" mode="expand-example">
            <xslt:copy copy-namespaces="no">
                <xslt:apply-templates select="node() | @*" mode="#current"/>
            </xslt:copy>
        </xslt:template>
        
        <xslt:variable name="expanded">
            <xslt:apply-templates mode="expand-example" select="/"/>
        </xslt:variable>
        
        <xslt:template match="/">
            <xslt:variable name="html">
                <xslt:for-each select="$expanded/*">
                    <html xmlns="http://www.w3.org/1999/xhtml">
                        <body>
                            <xslt:apply-templates/>
                            <xslt:apply-templates select="$imported/key('definitions',$all-references,.)[not(@name=$here-declared/(@name|@named))]"/>
                        </body>
                    </html>
                </xslt:for-each>
            </xslt:variable>
            <xslt:apply-templates select="$html" mode="md"/>
        </xslt:template>
        
        <xslt:template match="description | remarks" mode="jsonize"/>
        
        <xslt:template match="*" mode="jsonize">
            <xslt:apply-templates select="." mode="xml2json"/>
        </xslt:template>
        
        <xslt:template match="example">
            <!--<xslt:message expand-text="true">- expanding example ... {string-join(*/name(),' ... ') }</xslt:message> -->
            <div class="example">
                <xslt:variable name="json-xml">
                    <xslt:apply-templates select="*" mode="jsonize"/>
                </xslt:variable>
                <xslt:variable name="rectified">
                    <xslt:apply-templates select="$json-xml" mode="rectify"/>
                </xslt:variable>
                <xslt:apply-templates select="description"/>
                <pre class="json">
            <xslt:if test="exists($rectified/map)" xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
              <xslt:value-of select="xml-to-json($rectified,$write-options)"/>
            </xslt:if>
         </pre>
                <xslt:apply-templates select="remarks"/>
            </div>
        </xslt:template>
        
 
        
        
        <!--<xslt:import href="{$example-converter-xslt}"/>
        <!-\-<xslt:import href="../../../util/publish/XSLT/html-to-markdown.xsl"/>-\->
        <xslt:import href="metaschema-json-html.xsl"/>
        
        <!-\- output method must be text for good markdown including unescaped code snips   -\->
        <xslt:output method="text"/>
        
        <xslt:param name="json-file" as="xs:string?" select="()"/>
        <xslt:param name="json-indent" as="xs:string">yes</xslt:param>
        <xslt:template match="/">
            <xslt:variable name="html">
                <xslt:apply-imports/>
            </xslt:variable>
            <!-\-<xslt:copy-of select="$html"/>-\->
            <xslt:apply-templates select="$html" mode="md"/>
        </xslt:template>
        
        <xslt:template match="example">
            <div class="example">
                <xslt:variable name="json-xml">
                    <xslt:apply-templates select="* except m:*" mode="xml2json"/>
                </xslt:variable>
                <!-\- mode 'rectified' scrubs unwanted labels from JSON -\->
                <xslt:variable name="rectified">
                    <xslt:apply-templates select="$json-xml" mode="rectify"/>
                </xslt:variable>
                
                <xslt:apply-templates select="description"/>
                
                <pre class="json">
                
           <xslt:value-of select="xml-to-json($rectified,$write-options)"/>
         </pre>
                <xslt:apply-templates select="m:remarks"/>
            </div>
        </xslt:template>-->
        
    </xsl:template>
</xsl:stylesheet>