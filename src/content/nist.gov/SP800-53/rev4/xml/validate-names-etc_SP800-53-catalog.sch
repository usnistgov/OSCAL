<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:o="http://csrc.nist.gov/ns/oscal/1.0">
    
    <sch:ns prefix="o" uri="http://csrc.nist.gov/ns/oscal/1.0"/>
    
    <xsl:key name="by-id"        match="*[@id]" use="@id"/>
    <xsl:key name="link-targets" match="*[@id]" use="'#' || @id"/>
    
<!-- This Schematron checks several basic features of SP800-53, or a similarly encoded document,
     for conformance with expectations. Specifically, it tests:
     
     - @id values are unique in the document
     - Use of @name is consistent with OSCAL, avoiding clashes with named elements in OSCAL
     - Expected (named) parts and properties are given in controls and subcontrols
     - Parts and properties are not given redundantly; when expected, they are singletons
       (the only child of their parent node with the @name value)
     - Cross-references (internal links) resolve when given
     
     More complex checking of 
     
    
    -->
    
    <!-- Some tokens should be prohibited for use as @name flags. -->
    <sch:let name="interdicted" value="'control','group','part','prop','param','title'"/>
    
    <sch:let name="known-part-names" value="('statement', 'item', 'guidance', 'objective', 'assessment', 'objects')"/>
    
    <sch:let name="known-property-names" value="('keywords', 'label', 'sort-id', 'method', 'status')"/>
    
    <sch:pattern id="general">
        <sch:rule context="*[matches(@name,'\S')]">
            <sch:report test="@name = $interdicted">@name '<sch:value-of select="@name"/>' is not permitted</sch:report>
        </sch:rule>
    </sch:pattern>
    
    <sch:pattern id="uniqueness-constraints">
        <sch:rule context="*[exists(@id)]">
            <sch:assert test="empty(key('by-id',@id) except .)">ID on element is not unique.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
<!-- Ensure all the values of @name given are known.  -->
    <sch:pattern id="occurrences">
        <sch:rule context="o:part[exists(@name)]">
            <sch:assert test="@name=$known-part-names">@name on part is not recognized: we expect <sch:value-of select="o:or-sequence($known-part-names)"/></sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[exists(@name)]">
            <sch:assert test="@name=$known-property-names">@name on property is not recognized: we expect <sch:value-of select="o:or-sequence($known-property-names)"/></sch:assert>
        </sch:rule>
        
    </sch:pattern>
    
    <!-- Controls and their parts may require properties or subparts designated for particular contents. -->
    <sch:pattern id="required-items">
        <sch:rule context="o:control">
            <sch:let name="withdrawn" value="o:prop[@name='status'] = 'Withdrawn'"/>
            <sch:assert test="o:prop/@name='label'">control must have a child 'prop' with @name='label'</sch:assert>
            <sch:assert test="o:prop/@name='sort-id'">control must have a child 'prop' with @name='sort-id'</sch:assert>
            <sch:assert test="o:part/@name='statement' or $withdrawn">control with name='SP800-53' must have a child 'part' with @name='statement'</sch:assert>
            <sch:assert test="o:part/@name='objective' or $withdrawn">control with name='SP800-53' must have a child 'part' with @name='objective'</sch:assert>
        </sch:rule>
        <sch:rule context="o:part[@name='item']">
            <sch:assert test="o:prop/@name='label'">part with name='item' must have a child prop with @name='label'</sch:assert>
        </sch:rule>
        <sch:rule context="o:part[@name='assessment']">
            <sch:assert test="o:prop/@name='method'">part with name='assessment' must have a child prop with @name='method'</sch:assert>
            <sch:assert test="o:part/@name='objects'">part with name='assessment' must have a child part with @name='objects'</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <!-- Many properties exhibit regularities; we need to detect if they are violated. -->
    <!-- Note that these validations will not work on catalogs that do not have, for example, consistent
         continuous numbering of controls and their constituent parts (control, prop, part elements).
         So for example, a catalog produced by resolving a profile, which contains gaps, will show
         those gaps in validation against this Schematron. -->
    <sch:pattern id="appearances">
        <!-- o:control/o:control is a control enhancement -->
        <sch:rule context="o:control/o:control/o:prop[@name = 'label']">
            <sch:assert test="o:singleton(.)">prop with name='label'
                must be a singleton: no other properties named 'label' may appear in the same
                context</sch:assert>
            <sch:assert
                test="matches(., '^(AC|AT|AU|CA|CM|CP|IA|IR|MA|MP|PE|PL|PM|PS|RA|SA|SC|SI)\-\d\d?\(\d\d?\)')"
                >prop with name='label' must match regular expression
                '^(AC|AT|AU|CA|CM|CP|IA|IR|MA|MP|PE|PL|PM|PS|RA|SA|SC|SI)\-\d\d?\(\d\d?\)$'</sch:assert>
            <sch:let name="parent-label" value="../../o:prop[@name = 'label']"/>
            <xsl:variable name="formatted-no">
                <xsl:number count="o:control" format="(1)"/>
            </xsl:variable>
            <sch:assert test=". = ($parent-label || $formatted-no)">Control enhancement
                label is inconsistent: we expect <sch:value-of select="$parent-label || $formatted-no"/> here</sch:assert>
        </sch:rule>

        <sch:rule context="o:control/o:prop[@name = 'label']">
            <sch:assert test="o:singleton(.)">prop with name='label'
                must be a singleton: no other properties named 'label' may appear in the same
                context</sch:assert>
            <sch:assert
                test="matches(., '^(AC|AT|AU|CA|CM|CP|IA|IR|MA|MP|PE|PL|PM|PS|RA|SA|SC|SI)[\d\.\-]*$')"
                >prop with name='label' must match regular expression
                '^(AC|AT|AU|CA|CM|CP|IA|IR|MA|MP|PE|PL|PM|PS|RA|SA|SC|SI)\-\d\d?$'</sch:assert>
            <sch:assert test="substring(.,1,2) = upper-case(../../@id)">Control label does not match its family, '<sch:value-of select="upper-case(../../@id)"/></sch:assert>
            <xsl:variable name="formatted-no">
                <xsl:number count="o:control"/>
            </xsl:variable>
            <sch:assert test="replace(.,'\D','') = $formatted-no">Control label appears to be out of sequence</sch:assert>
        </sch:rule>
        <sch:rule context="o:part[@name = 'statement']">
            <sch:assert test="o:singleton(.)">part with name='statement'
                must be a singleton: no other parts named 'statement' may appear in the same
                context</sch:assert>
        </sch:rule>
        <sch:rule context="o:part[@name = 'item']/o:prop[@name = 'label']">
            <sch:assert test="o:singleton(.)">prop with name='label'
                must be a singleton: no other properties named 'label' may appear in the same
                context</sch:assert>
            <sch:assert test="ends-with(../@id, replace(., '[\.\(\)\[\]]', ''))">Label
                    '<sch:value-of select="."/>' does not match with parent id '<sch:value-of
                    select="../@id"/>'</sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[@name = 'label']">
            <sch:assert test="o:singleton(.)">prop with name='label'
                must be a singleton: no other properties named 'label' may appear in the same
                context</sch:assert>
            <sch:let name="parent-label"
                value="../ancestor::*[o:prop/@name = 'label'][1]/o:prop[@name = 'label']"/>
            <sch:assert test="not(count($parent-label) = 1) or starts-with(., $parent-label)">Label is expected to start with
                inherited label '<sch:value-of select="$parent-label"/>'</sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[@name = 'sort-id']">
            <sch:assert test="o:singleton(.)">prop with name='sort-id'
                must be a singleton: no other properties named 'sort-id' may appear in the same
                context</sch:assert>
        </sch:rule>
        <sch:rule context="o:part[@name = 'assessment']/o:prop[@name = 'method']">
            <sch:assert test="o:singleton(.)">prop with name='method'
                must be a singleton: no other properties named 'method' may appear in the same
                context</sch:assert>
            <sch:assert test=". = ('EXAMINE', 'INTERVIEW', 'TEST')">prop name='method' here must
                have a value 'EXAMINE', 'INTERVIEW', or 'TEST'</sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[@name = 'status']">
            <sch:assert test="o:singleton(.)">prop with name='status'
                must be a singleton: no other properties named 'status' may appear in the same
                context</sch:assert>
            <sch:assert test=". = ('Withdrawn')">prop name='status' here must have a value
                'Withdrawn'</sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[@name = 'method']">
            <sch:assert test="o:singleton(.)">prop with name='method' must be a singleton: no other
                properties named 'method' may appear in the same context</sch:assert>
        </sch:rule>
        <sch:rule context="o:prop[@name = 'keywords']">
            <sch:assert test="exists(parent::o:metadata)">prop with name='keywords' is not expected outside metadata</sch:assert>
        </sch:rule>
    </sch:pattern>

    <!-- Checking presence and form of link hrefs -->
    <sch:pattern id="links">
        <sch:rule context="o:link | o:a">
            <sch:let name="href" value="@href[matches(.,'\S')]"/>
            <sch:let name="is-anchor" value="exists(self::o:a)"/>
            <sch:assert role="warning" test="exists($href)"><sch:value-of select="local-name() || 'nchor'[$is-anchor]"/> missing @href</sch:assert>
            <sch:assert test="empty($href) or ($href castable as xs:anyURI)">An @href must be a URI</sch:assert>
            <sch:assert test="empty($href[starts-with(.,'#')]) or exists(key('link-targets',$href))">Internal link is broken.</sch:assert>
        </sch:rule>
    </sch:pattern>
    
    <!-- Returns 'true' for elements without siblings with the same @name value -->
    <xsl:function name="o:singleton" as="xs:boolean">
        <xsl:param name="who" as="element()"/>
        <xsl:variable name="competitors" select="$who/parent::*/(* except $who)[@name = $who/@name]"/>
        <xsl:sequence select="empty($competitors)"/>
    </xsl:function>
    
    <xsl:function name="o:or-sequence" as="xs:string?">
        <xsl:param name="seq" as="item()*"/>
        <xsl:value-of>
            <xsl:for-each select="$seq ! ('''' || . || '''')">
                <xsl:if test="position() ne 1">
                    <xsl:choose>
                        <xsl:when test="(position() eq 2 and last() eq 2)"> or </xsl:when>
                        <xsl:when test="position() = last()">, or </xsl:when>
                        <xsl:otherwise>, </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:value-of select="."/>
            </xsl:for-each>
        </xsl:value-of>
    </xsl:function>
    

</sch:schema>