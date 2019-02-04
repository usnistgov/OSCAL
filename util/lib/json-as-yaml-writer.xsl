<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="3.0"
                xpath-default-namespace="http://www.w3.org/2005/xpath-functions"
                exclude-result-prefixes="#all"
     expand-text="true">
   
<!--Reads JSON file in, writes YAML syntax out.
This stylesheet module can also be imported to provide YAML serialization
for any JSON produced by conversion.
(As a superset of JSON, YAML should support this.)

Effectively this is a hand-serialization of the XPath JSON format
into YAML
   
   Test against results from https://www.json2yaml.com/ (and any others?) --> 
   
   <xsl:output indent="no" method="text"/>
   
   <xsl:strip-space elements="*"/>
   <xsl:preserve-space elements="string"/>
   <!--<xsl:param name="json-file" as="xs:string"/>-->
   
   <!-- <xsl:variable name="json-xml" select="unparsed-text($json-file) ! json-to-xml(.)"/> -->
   <xsl:variable name="json-xml" select="json-to-xml($test-json)"/>
   
    <xsl:variable name="test-json" as="xs:string" expand-text="false">{
    "desc"    : "Distances between several cities, in kilometers. \n\n \"Yowza!\"",
    "updated" : "2014-02-04T18:50:45",
    "uptodate": true,
    "author"  : null,
    "strings" : [ "text\n","````","code", "```" ],
    "cities"  : {
        "Brussels": [
                      {"to": "London",    "distance": 322},
                      {"to": "Paris",     "distance": 265},
                      {"to": "Amsterdam", "distance": 173}
                    ],
        "London": [
                      {"to": "Brussels",  "distance": 322},
                      {"to": "Paris",     "distance": 344},
                      {"to": "Amsterdam", "distance": 358}
                  ],
        "Paris": [
                      {"to": "Brussels",  "distance": 265},
                      {"to": "London",    "distance": 344},
                      {"to": "Amsterdam", "distance": 431}
                 ],
        "Amsterdam": [
                      {"to": "Brussels",  "distance": 173},
                      {"to": "London",    "distance": 358},
                      {"to": "Paris",     "distance": 431}
                     ]
     }
}</xsl:variable>
   
   
    <xsl:template match="/">
        <yaml>
            <xsl:apply-templates select="$json-xml" mode="yaml-write"/>
        </yaml>
        <!--<markup>
            <xsl:copy-of select="$json-xml"/>
        </markup>
        <json>
            <xsl:copy-of select="$test-json"/>
        </json>-->
   </xsl:template>
   
   <xsl:variable name="lf" select="'&#xA;'"/>
    
   <xsl:template mode="yaml-write" match="/map">
       <xsl:text>---</xsl:text>
       <xsl:apply-templates mode="#current"/>
       <xsl:copy-of select="$lf"/>
   </xsl:template>

    <xsl:template mode="yaml-label" match="*[exists(@key)]">
        <xsl:copy-of select="$lf"/>
        <xsl:for-each select="../ancestor::*" xml:space="preserve">  </xsl:for-each>
        <xsl:text>{ @key }: </xsl:text>
    </xsl:template>
    
    <xsl:template mode="yaml-label" match="array/*" priority="3">
        <xsl:copy-of select="$lf"/>
        <xsl:for-each select="../../ancestor::*" xml:space="preserve">  </xsl:for-each>
        <xsl:text>- </xsl:text>
    </xsl:template>
    
    <xsl:template mode="yaml-label" match="array/*/*[exists(@key)]" priority="4">
        <xsl:if test="exists(preceding-sibling::*[1])">
            <xsl:copy-of select="$lf"/>
            <xsl:for-each select="../../ancestor::*" xml:space="preserve">  </xsl:for-each>
        </xsl:if>
        <xsl:text>{ @key }: </xsl:text>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="*">
        <xsl:apply-templates select="." mode="yaml-label"/>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="string">
        <xsl:apply-templates select="." mode="yaml-label"/>
        <xsl:text>'</xsl:text>
        <xsl:apply-templates mode="#current"/>
        <xsl:text>'</xsl:text>
    </xsl:template>
    
    <!-- strings that contain LF will produce a text block  -->
    <xsl:template mode="yaml-write" match="string[matches(.,'\n')]">
        <xsl:apply-templates select="." mode="yaml-label"/>
        <xsl:text>|</xsl:text>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="string[not(matches(.,'\n'))]/text()">
        <!-- demarcating strings with single quotes we need to escape the single quotes -->
        <xsl:value-of select="replace(.,'''','''''')"/>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="string[matches(.,'\n')]/text()">
        <!-- demarcating strings with single quotes we need to escape the single quotes -->
        <xsl:variable name="me" select="."/>
        <xsl:for-each select="tokenize(.,'\n')">
            <xsl:copy-of select="$lf"/>
            <xsl:for-each select="$me/../ancestor::*" xml:space="preserve">  </xsl:for-each>
            <xsl:value-of select="."/>
        </xsl:for-each>
    </xsl:template>
    
    
    <!--<xsl:template mode="yaml-write" match="map">
        <xsl:apply-templates select="." mode="label"/>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="array">
        <xsl:apply-templates select="." mode="label"/>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    
    
    <xsl:template mode="yaml-write" match="number">
        <xsl:apply-templates select="." mode="label"/>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>
    
    <xsl:template mode="yaml-write" match="boolean">
        <xsl:apply-templates select="." mode="label"/>
        <xsl:apply-templates mode="#current"/>
    </xsl:template>-->
    
    <xsl:template mode="yaml-write" match="null">
        <xsl:apply-templates select="." mode="label"/>
    </xsl:template>
    
    
    <!--<xsl:template mode="yaml-write" match="map/map"/>
    <xsl:template mode="yaml-write" match="map/array"/>
    <xsl:template mode="yaml-write" match="map/string"/>
    <xsl:template mode="yaml-write" match="map/number"/>
    <xsl:template mode="yaml-write" match="map/boolean"/>
    <xsl:template mode="yaml-write" match="map/null"/>
-->    
    <!-- 
   From the XPath 3.1 Rec:
   
    

IS EQUIVALENT TO

<map xmlns="http://www.w3.org/2005/xpath-functions">
    <string key='desc'>Distances between several cities, in kilometers.</string>
    <string key='updated'>2014-02-04T18:50:45</string>
    <boolean key="uptodate">true</boolean>
    <null key="author"/>
    <map key='cities'>
      <array key="Brussels">
        <map>
            <string key="to">London</string>
            <number key="distance">322</number>
        </map> 
        <map>
            <string key="to">Paris</string>
            <number key="distance">265</number>
        </map> 
        <map>
            <string key="to">Amsterdam</string>
            <number key="distance">173</number>
        </map> 
      </array>
      <array key="London">
        <map>
            <string key="to">Brussels</string>
            <number key="distance">322</number>
        </map> 
        <map>
            <string key="to">Paris</string>
            <number key="distance">344</number>
        </map> 
        <map>
            <string key="to">Amsterdam</string>
            <number key="distance">358</number>
        </map> 
      </array>
      <array key="Paris">
        <map>
            <string key="to">Brussels</string>
            <number key="distance">265</number>
        </map> 
        <map>
            <string key="to">London</string>
            <number key="distance">344</number>
        </map> 
        <map>
            <string key="to">Amsterdam</string>
            <number key="distance">431</number>
        </map>  
      </array>
      <array key="Amsterdam">
        <map>
            <string key="to">Brussels</string>
            <number key="distance">173</number>
        </map> 
        <map>
            <string key="to">London</string>
            <number key="distance">358</number>
        </map> 
        <map>
            <string key="to">Paris</string>
            <number key="distance">431</number>
        </map>
      </array>
    </map>  
  </map>
   
   
   -->
</xsl:stylesheet>
