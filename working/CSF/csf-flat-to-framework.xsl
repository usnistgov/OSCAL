<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    version="3.0">

<xsl:output indent="yes"/>
    
<xsl:strip-space _elements="*"/>
 
    <xsl:key name="category-by-function" match="record[exists(Category)][empty(Subcategory)]"  use="substring-before(Category,'.')"/>
    <xsl:key name="item-by-category"     match="record[exists(Category)][exists(Subcategory)]" use="string(Category)"/>
    
    
    <xsl:template match="/*">
        <framework>
            <xsl:apply-templates select="record[exists(Function)]"/>
        </framework>
    </xsl:template>
    
    <xsl:template match="record[exists(Function)]">
        <group class="function">
            <xsl:apply-templates/>
            <xsl:apply-templates select="key('category-by-function',Function)"/>
        </group>
    </xsl:template>
    
    <xsl:template match="Title">
        <title>
            <xsl:apply-templates/>
        </title>
    </xsl:template>
    
    <xsl:template match="Description">
        <p class="description">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="Function | Category[empty(../Subcategory)]">
        <prop class="{ name(.) ! lower-case(.) }-id">
            <xsl:apply-templates/>
        </prop>
    </xsl:template>
    
    <xsl:template match="Subcategory">
        <prop class="number">
            <xsl:apply-templates/>
        </prop>
    </xsl:template>
    
    <xsl:template match="Category"/>
    
    <xsl:template match="Control">
        <link rel="control">
            <xsl:apply-templates/>
        </link>
    </xsl:template>
    
    <xsl:template priority="2" match="record[exists(Category)]">
        <group class="category">
            <xsl:apply-templates/>
            <xsl:apply-templates select="key('item-by-category',Category)"/>
        </group>
    </xsl:template>

    <xsl:template priority="3" match="record[exists(Category)][exists(Subcategory)]">
        <component>
            <xsl:apply-templates/>
            <xsl:apply-templates select="key('category-by-function',Function)"/>
        </component>
    </xsl:template>
    
    
</xsl:stylesheet>