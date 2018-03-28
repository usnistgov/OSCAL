<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    xmlns="http://www.w3.org/2005/xpath-functions"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="#all">
    
    
    <xsl:output indent="yes"/>
    
    
<!-- Takes OSCAL especially SP800-53-flavored OSCAL and produces JSON
        as per requirements
     for ATLAS
    
    Wendell Piez for C2 Labs February 2018 -->
    
    <!-- 
        
        we want results like
        
       
        <map xmlns="http://www.w3.org/2005/xpath-functions">
   <map key="controls">
      <array key="control">
         <map>
            <string key="family">ACCESS CONTROL</string>
            <string key="number">AC-1</string>
            <string key="title">ACCESS CONTROL POLICY AND PROCEDURES</string>
            <string key="description">This control addresses the establishment of policy and procedures for the
   
    this conforms to schema analysis/xml-json.xsd, which describes the requirements for the
    XML mapping format (for JSON targets) specified by XPath and implemented by the XPath xml-to-json() function.
    
    Producing such XML, that is, produces stable JSON for free, with mapping issues exposed in the transformation.
    
    -->
    
    <xsl:template match="/">
        <map>
            <xsl:apply-templates/>
        </map>
    </xsl:template>
    
    <xsl:template match="catalog">
        <map key="catalog">
            <xsl:apply-templates select="title, declarations"/>
            <xsl:call-template name="groups-then-controls"/>
        </map>
    </xsl:template>
    
    <xsl:template match="group">
        <map>
            <xsl:apply-templates select="title"/>
            <xsl:call-template name="groups-then-controls"/>
        </map>
    </xsl:template>
    
    <xsl:template name="groups-then-controls">
        <xsl:for-each-group select="group" group-by="true()">
            <array key="groups">
                <xsl:apply-templates select="current-group()"/>
            </array>
        </xsl:for-each-group>
        <xsl:for-each-group select="control" group-by="true()">
            <array key="controls">
                <xsl:apply-templates select="current-group()"/>
            </array>
        </xsl:for-each-group>
    </xsl:template>
    
    <!-- Map full declarations in subsequent pass - -->
    <xsl:template match="declarations">
        <map key="declarations">
            <xsl:apply-templates mode="as-string" select="@*"/>
        </map>
    </xsl:template>

    <xsl:template mode="as-string" match="@* | *">
        <xsl:param name="key" select="local-name()"/>
        <string key="{$key}">
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
    
    <xsl:template mode="prose" match="*">
        <string key="prose">
            <xsl:for-each select="p | ul | ol">
                <xsl:value-of select="oscal:serialize(.)"/>
            </xsl:for-each>
        </string>
    </xsl:template>
    
    <xsl:function name="oscal:serialize" as="xs:string">
        <xsl:param name="who" as="node()"/>
        <xsl:variable name="no-ns">
            <xsl:apply-templates select="$who" mode="serialize"/>
        </xsl:variable>
        <!-- Note we have to cast off delimiters after serializing -->
        <xsl:value-of select="serialize($no-ns)"/>
        <!--<xsl:value-of select="serialize($no-ns) => replace('&lt;','\\u003c') => replace('&gt;','\\u003e')"/>"/>-->
    </xsl:function>
    
    <xsl:template mode="escaped" match="*">
        <xsl:param name="key">value</xsl:param>
        <string key="{$key}">
            <xsl:value-of select="node()/oscal:serialize(.)"/>
        </string>
    </xsl:template>
    
    <xsl:template match="control | subcontrol">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="param | prop | part | link | subcontrol"/>
            </xsl:call-template>
            <!--<xsl:apply-templates/>-->
        </map>
    </xsl:template>
    
    <xsl:template name="elems-arrayed">
        <xsl:param name="elems" as="element()*" select="*"/>
            <xsl:for-each-group select="$elems" group-by="local-name()">
                <array key="{current-grouping-key()}s">
                    <xsl:apply-templates select="current-group()"/>
                </array>
            </xsl:for-each-group>
    </xsl:template>
        
       
    
    <xsl:template match="title">
        <string key="title">
            <xsl:value-of select="."/>
        </string>
    </xsl:template>
    
    <xsl:template match="param">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            <xsl:apply-templates mode="as-string" select="*"/>
        </map>
    </xsl:template>
    
    <xsl:template match="prop">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            <xsl:apply-templates mode="as-string" select=".">
                <xsl:with-param name="key">value</xsl:with-param>
            </xsl:apply-templates>
        </map>
    </xsl:template>
    
    <xsl:template match="part">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            <xsl:apply-templates mode="prose" select="."/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="param | prop | part | link"/>
            </xsl:call-template>
        </map>
    </xsl:template>
    
    <xsl:template match="link">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            <xsl:apply-templates mode="escaped" select=".[matches(.,'\S')]"/>
        </map>
    </xsl:template>
    
    
   <xsl:key name="parameters" match="param" use="@id"/>
    
   <xsl:template match="references"/>
    

<!--    <xsl:template match="references">
        <map key="references">
            <array key="item">
                <xsl:for-each select="ref/citation">
                    <map>
                        <string key="text">
                            <xsl:value-of select="."/>
                        </string>
                        <xsl:for-each select="@href">
                            <string key="href">
                                <xsl:value-of select="."/>
                            </string>
                        </xsl:for-each>

                    </map>
                </xsl:for-each>
            </array>
        </map>
    </xsl:template>
-->    
    
<!-- More 'serialize' strips namespaces and drops comments and PIs   -->
    <xsl:template mode="serialize" match="*">
        <!-- Note how namespace has to be *unset* to avoid the XPath processor from providing its own (oof) -->
        <xsl:element name="{local-name()}" namespace="">
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates mode="#current"/>
        </xsl:element>
    </xsl:template>
    
    <!-- Since XProc doesn't support character maps we do this in XSLT -   -->
    <xsl:template mode="serialize" match="text()">
        <xsl:value-of select="replace(.,'&lt;','\\u003c') => replace('&gt;','\\u003e')"/>
    </xsl:template>
</xsl:stylesheet>