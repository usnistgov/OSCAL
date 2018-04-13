<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    xmlns="http://www.w3.org/2005/xpath-functions"
    
    xmlns:oscal="http://csrc.nist.gov/ns/oscal/1.0"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    exclude-result-prefixes="#all">
    
    <xsl:output indent="yes"/>
    
    
<!-- Produces JSON from OSCAL. Tested on SP-800-53 OSCAL
     but it should work on any. -->
     
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
            <xsl:call-template name="controls-then-groups"/>
        </map>
    </xsl:template>
    
    <xsl:template match="group">
        <map>
            <xsl:apply-templates select="title"/>
            <xsl:call-template name="controls-then-groups"/>
        </map>
    </xsl:template>
    
    <xsl:template name="controls-then-groups">
        <xsl:call-template name="elems-arrayed">
            <xsl:with-param name="elems" select="control"/>
        </xsl:call-template>
        <xsl:call-template name="elems-arrayed">
            <xsl:with-param name="elems" select="group"/>
        </xsl:call-template>
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
    
    <xsl:template mode="as-escaped" match="@* | *">
        <string>
            <xsl:value-of select="oscal:serialize(.)"/>
        </string>
    </xsl:template>
    
    <xsl:template mode="prose" match="*">
        <xsl:if test="exists(p | ul | ol | pre)">
        <array key="prose">
            <xsl:apply-templates mode="as-escaped" select="p | ul | ol | pre"/>
        </array>
        </xsl:if>
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
        <xsl:param name="elems" as="node()*" select="*"/>
            <xsl:for-each-group select="$elems" group-by="local-name()">
                <xsl:variable name="new-key">
                    <xsl:apply-templates mode="cast-key" select="current-grouping-key()"/>
                </xsl:variable>
                <array key="{$new-key}">
                    <xsl:apply-templates select="current-group()"/>
                </array>
            </xsl:for-each-group>
    </xsl:template>
    
    
    <xsl:template mode="cast-key" match="." expand-text="true">{.}s</xsl:template>
        
    <xsl:template mode="cast-key" match=".[.='match']"        >matches</xsl:template>
    
    <xsl:template mode="cast-key" match=".[.='set-param']"    >param-settings</xsl:template>
    
    <xsl:template mode="cast-key" match=".[.='alter']"        >alterations</xsl:template>
    
    <xsl:template mode="cast-key" match=".[.='remove']"       >removals</xsl:template>
    
    <xsl:template mode="cast-key" match=".[.='add']"          >additions</xsl:template>
    
    
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
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="param | prop"/>
            </xsl:call-template>
            <xsl:apply-templates mode="prose" select="."/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="part | link"/>
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

<!-- Now templates for profile -->
    
    <xsl:template match="profile">
        <map key="profile">
            <string key="document-type">profile</string>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="import"/>
            </xsl:call-template>
            <!-- Extra step to silence oxygen warning msg -->
            <xsl:apply-templates select="./merge, ./modify"/>
        </map>
    </xsl:template>
    
    <xsl:template match="import">
        <map>
            <xsl:apply-templates select="@*" mode="as-string"/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="include | exclude"/>
            </xsl:call-template>
            
        </map>
    </xsl:template>
    
    <xsl:template match="include | exclude">
        <map>
            <xsl:apply-templates select="@*" mode="as-string"/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="call | match"/>
            </xsl:call-template>
            
        </map>
    </xsl:template>
    
    <xsl:template match="call | match">
        <map>
            <xsl:apply-templates select="@*" mode="as-string"/>
        </map>
    </xsl:template>
    
    <xsl:template match="set-param">
        <map>
            <xsl:apply-templates select="@*" mode="as-string"/>
            <xsl:apply-templates select="*"  mode="as-string"/>
        </map>
    </xsl:template>
    
    <xsl:template match="modify">
        <xsl:call-template name="elems-arrayed">
            <xsl:with-param name="elems" select="set-param | alter"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="alter">
        <map>
            <xsl:apply-templates select="@*" mode="as-string"/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="remove"/>
            </xsl:call-template>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="add"/>
            </xsl:call-template>
            <!-- Extra step to silence oxygen warning msg -->
            <xsl:apply-templates select="./merge, ./modify"/>
        </map>
    </xsl:template>
    
    <xsl:template match="remove">
        <map>
            <xsl:call-template name="elems-arrayed">
            <xsl:with-param name="elems" select="@class-ref | @id-ref | @item-name"/>
        </xsl:call-template>
        </map>
        
    </xsl:template>

    <xsl:template match="remove/@*" expand-text="true">
        <xsl:for-each select="tokenize(.,'\s+')">
            <string>{.}</string>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="add">
        <map>
            <xsl:apply-templates mode="as-string" select="@*"/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="param | prop"/>
            </xsl:call-template>
            <xsl:apply-templates mode="prose" select="."/>
            <xsl:call-template name="elems-arrayed">
                <xsl:with-param name="elems" select="part | link"/>
            </xsl:call-template>
        </map>
    </xsl:template>
    
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