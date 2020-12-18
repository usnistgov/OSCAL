<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    xmlns:uuid="java:java.util.UUID" 
    exclude-result-prefixes="#all"
    version="3.0">
    
<!-- This XSLT, applied to an XML document valid to the Milestone 3 OSCAL schema version for Catalog, Profile, SSP or Component,
     will produce a similar XML document, valid or closer to valid to the Release Candidate 1 OSCAL schema. -->
    
    <xsl:output indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:mode name="copy" on-no-match="shallow-copy"/>
    
    <xsl:variable select="uuid:randomUUID()" name="new-document-uuid"/>
    <xsl:variable select="uuid:randomUUID()" name="new-this-system-component-uuid"/>
    
    <!-- Grabbing the old UUID or the new UUID if there is no old one. -->
    <xsl:variable name="this-system-component-uuid" select="(/*/system-implementation/component[(@type|@component-type='this-system')]/@uuid,$new-this-system-component-uuid)[1]"/>
    
<!-- 
In {top-level-element}/metadata:
x renamed "revision-history" to "revisions"
x renamed "doc-id" to "document-id"

In {top-level-element}/metadata/document-id:
x renamed "type" to "scheme"
a doc-id/@type 'doi' to document-id/@scheme 'https://www.doi.org/'

    -->

    <xsl:template match="/*">
        <xsl:copy>
            <xsl:apply-templates select="@* except @id"/>
            <xsl:attribute name="uuid" select="$new-document-uuid"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="metadata">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="title, published"/>
            <!-- time stamp it at runtime -->
            <last-modified xsl:expand-text="true">{ current-dateTime() }</last-modified>
            <xsl:apply-templates select="* except (title | published)"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="last-modified" priority="6"/>
    
    <xsl:template match="oscal-version" priority="6">
        <oscal-version>1.0.0-rc1</oscal-version>
    </xsl:template>
    
    
    <xsl:template match="link">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:if test="matches(string(.),'\S')">
                <text>
                    <xsl:apply-templates/>
                </text>
            </xsl:if>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="revision-history">
        <revisions>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </revisions>
    </xsl:template>
    
    
    <xsl:template match="doc-id">
        <document-id>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </document-id>
    </xsl:template>
    
    <xsl:template match="doc-id/@type | external-id/@type">
        <xsl:attribute name="scheme" select="."/>
    </xsl:template>

    <xsl:template priority="10" match="doc-id/@type[.='doi']">
        <xsl:attribute name="scheme">https://www.doi.org/</xsl:attribute>
    </xsl:template>
    
<!-- 
In {top-level-element}/metadata/link:
n Defined allowed values for the "rel" property

In {top-level-element}/metadata/location:
x renamed "email" to "email-address"
x renamed "phone" to "telephone-number"
    -->

    <xsl:template match="email">
        <email-address>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </email-address>
    </xsl:template>
    
    <xsl:template match="phone">
        <telephone-number>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </telephone-number>
    </xsl:template>
    
<!--

In {top-level-element}/metadata/location/prop:
n Defined allowed values for the "name" attribute. Using the "type" as the name attribute value, you can now specify that a location is a "data-center" location and also use the "class" attribute to qualify the data center location as "primary" or "alternate".

In {top-level-element}/metadata/party:
a reordered contents of party
x renamed "party-name" to "name" 
x renamed "email" to "email-address"
x renamed "phone" to "telephone-number"
n made use of address and location-uuid mutually exclusive, since either a static address or a reference to location provides similar functionality. The "location-type" attribute has been removed. This should data should now be described on the referenced "location" element using a prop element with a name of "type".

In {top-level-element}/metadata/party/prop:
n Defined allowed values for the "name" attribute. This can be used to provide a "mail-stop", "office", or "job-title".

In {top-level-element}/metadata/party/external-id:
x renamed "type" to "scheme" 

    -->
    
    <xsl:template match="party">
        <!-- order of contents of `party`:
    M3: party-name, short-name, external-id, prop, annotation, link, address, email, phone, member-of-organization, location-uuid, remarks
    RC1: name, short-name, external-id, prop, annotation, link, email-address, telephone-number, (address|location-uuid), member-of-organization, remarks
          -->
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="party-name, short-name, external-id, prop, annotation, link, email, phone, address, location-uuid, member-of-organization, remarks"/>
        </xsl:copy>
    </xsl:template>  
    
    <xsl:template match="party-name">
        <name>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </name>
    </xsl:template>

<!--
    In {top-level-element}/metadata/role:
x renamed "desc" to "description"

In {top-level-element}/back-matter/resource:
x renamed "desc" to "description"
x renamed "doc-id" to "document-id"
    -->
    <xsl:template match="desc">
        <description>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates/>
        </description>
    </xsl:template>
    
<!-- 
In {top-level-element}/back-matter/resource/prop:
n defined allowed values "type", "version", and "published" for the "name" property.

In {top-level-element}/metadata/resource/document-id:
x renamed "type" to "scheme"

In {top-level-element}/back-matter/resource/rlink:
n changed type from "uri" to "uri-reference"

Changes to all "prop" elements:
n changed the data type of "ns" to "uri"
x renamed "id" to "uuid" and changed type to "uuid" (prop has @uuid under M3+)
a - note, results will not have valid uuids until the UUID refresher is run
    
Changes to all "annotation" elements:
n changed the data type of "ns" to "uri"
x renamed "id" to "uuid" and changed type to "uuid"
a - again note that uuid values are unlikely to be valid until reassignment

    -->

    <xsl:template match="prop/@id | annotation/@id">
        <xsl:attribute name="uuid" select="."/>
    </xsl:template>
 
<!--
### Changes affecting the catalog and profile XML formats

Changes to all "part" elements:
n changed the data type of "ns" to "uri"

Changes to all "param" elements:
n added the "prop" and "link" elements.
x changed the sequencing of "link" to be consistent with other elements that include "link".
x changed the data type of "usage" from "markup-line" to "markup-multiline"
x changed "constraint" from an element with a text value, to an element with child elements. The text value is now contained in the "description" element. Also changed the "test" attribute to be a sequence of child "test" elements, with the text value now contained in the "expression" element.
x changed the cardinality of "value" to allow for multiple values". The data type of a value has changed from markup-line to string.

-->
 
<!-- Handles either catalog//param or profile//set-parameter -->
    <xsl:template match="param | set-parameter">
        <!-- old: (label{0-1}, usage{0-UNBOUNDED}, constraint{0-UNBOUNDED}, guideline{0-UNBOUNDED}, (value{0-1} | select{0-1}), link{0-UNBOUNDED})-->
        <!--new: (prop{0-UNBOUNDED}, annotation{0-UNBOUNDED}, link{0-UNBOUNDED}, label{0-1}, usage{0-1}, constraint{0-UNBOUNDED}, guideline{0-UNBOUNDED}, (value{0-UNBOUNDED} | select{0-1}))-->
        <xsl:copy>
            <xsl:apply-templates select="@* except @test"/>
            <xsl:apply-templates select="link, label, usage, constraint, guideline, value, select"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="usage[matches(.,'\S')]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <p>
                <xsl:apply-templates/>
            </p>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="constraint">
        <xsl:copy>
            <xsl:apply-templates select="@* except @test"/>
            <xsl:if test="matches(.,'\S')">
            <description>
                    <p>
                        <xsl:apply-templates/>
                    </p>
            </description>
            </xsl:if>
            <xsl:apply-templates select="@test"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="constraint/@test">
        <test>
            <expression>
                <xsl:value-of select="."/>
            </expression>
        </test>
    </xsl:template>
    
    <xsl:template match="param/value">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <!-- markup not permitted -->
            <xsl:value-of select="."/>
        </xsl:copy>
    </xsl:template>
    
<!--
For /catalog//group and /catalog//control:
n defined allowed values for prop/@name

    -->

<!--
### Changes to profile XML format

For /profile/merge/custom//groups:
n added "annotation" and "link"

For /profile/modify/set-parameter:
n added "prop" and "annotation"
x change sequencing of "link"

For /profile/modify/alter/add:
n defined allowed values for prop/@name
    
    -->

<!--
### Changes to the SSP XML format

For /system-security-plan/system-characteristics:
n added allowed values for prop/@name, annotation/@name, link/@rel, and responsible-roles/role-id

For /system-security-plan/system-characteristics/*/diagram:
n added "annotation"
n changed the data type of "caption" from "string" to "markup-line"
n added allowed values for link/@rel="diagram", which allows for the linking of an image to use for the diagram.

For /system-security-plan/system-characteristics/system-information/information-type:
x renamed "id" to "uuid"
x changed structure of "information-type-id" to be wrapped by an outer characterization, which now defines the "system" for all referenced information type identifiers.
a actually this is 'categorization'
n added "annotation"
    -->
    
    <xsl:template match="system-security-plan//information-type/information-type-id">
        <categorization>
            <xsl:copy-of select="@system"/>
            <xsl:next-match/>
        </categorization>
    </xsl:template>
    
    <xsl:template match="information-type-id/@id">
        <!-- not lexically valid in result until uuid fixup -->
        <xsl:attribute name="uuid" select="."/>
    </xsl:template>
    
    <xsl:template match="system-security-plan//information-type/information-type-id/@system"/>
    
    
<!--

a /system-security-plan/system-implementation/system-inventory element removed from SSP
  with its inventory-item contents kept
 
 
 
    -->

    <!-- A new requirement in RC1 is the presence of a 'this-system' component (i.e. component[@type='this-system']
         If one is not given, we provide boilerplate for it. -->
    <xsl:template match="system-implementation">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="* except (component | system-inventory | remarks)"/>
            <xsl:if test="not(component/@component-type='this-system')">
                <xsl:call-template name="this-system-boilerplate"/>
            </xsl:if>
            <xsl:apply-templates select="component | system-inventory | remarks"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template name="this-system-boilerplate" xmlns:uuid="java:java.util.UUID">
        <component type="this-system" uuid="{$new-this-system-component-uuid}">
            <title>This System</title>
            <description>
                <p>The system described by this SSP.</p>
                <p>This text was auto-generated by the OSCAL M3-RC1 data upgrade converter.</p>
            </description>
            <status state="{/system-security-plan/system-characteristics/status/@state}">
                <xsl:if test="/system-security-plan/system-characteristics/status/@state='major-modification'">
                    <xsl:attribute name="state">other</xsl:attribute>
                </xsl:if>
            </status>
        </component>
    </xsl:template>
    
 
    <xsl:template match="system-implementation/system-inventory">
        <xsl:apply-templates/>
    </xsl:template>
      
<!--

For /system-security-plan/system-characteristics/system-information/information-type/*-impact:
n added "annotation" and "link"

For /system-security-plan/system-implementation/leveraged-authorization:
n defined additional allowed values "implementation-point", "leveraged-authorization-uuid", "inherited-uuid" for prop/@name, which provides traceability to a leveraged SSP
n defined allowed values for link/@rel

For /system-security-plan/system-implementation/user:
n defined allowed values for annotation/@name and role-id

For /system-security-plan/system-implementation/component:
x renamed "component-type" to "type", and updated allowed values (RC1 shows @component-type)
n defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id
    
    
    -->

    <xsl:template match="@component-type">
        <xsl:attribute name="type" select="."/>    
    </xsl:template>
    
<!--

For /system-security-plan/system-implementation/inventory-item:
x moved "@asset-id" to a required prop/@name
n defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id

    
    -->
    
    <xsl:template match="inventory-item">
        <xsl:copy>
            <xsl:apply-templates select="@* except @asset-id"/>
            <xsl:apply-templates select="description"/>
            <xsl:apply-templates select="@asset-id"/>
            <xsl:apply-templates select="* except description"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="inventory-item/@asset-id" expand-text="true">
        <prop name="asset-id">{ . }</prop>
    </xsl:template>
    
<!--    
 
For /system-security-plan/system-implementation/inventory-item/implemented-component:
x renamed "component-id" to "component-uuid"
n defined allowed values for prop/@name, annotation/@name, and responsible-party/@role-id
x removed "use", since this is capturing similar information to the component's type
    -->
    
    <xsl:template match="implemented-component/@component-id | by-component/@component-id">
        <xsl:attribute name="component-uuid" select="."/>
    </xsl:template>
    
    <xsl:template match="implemented-component/@use"/>
    
        
<!--
        


## Changes to the SSP model




For /system-security-plan/control-implementation/implemented-requirement:
x removed "description"
n added allowed values for annotation/@name including "implementation-status", "control-origination"
n added allowed values for prop/@name including "leveraged-authorization" to indicate if a control implementation is inherited from an underlying authorized system
n added allowed values for responsible-role/$role-id

-->

    <xsl:template match="implemented-requirement/description"/>
    
    <xsl:template match="implemented-requirement/statement/description"/>

    <!-- Adding a 'this-system' by-component if we don't already have one...-->
    <xsl:template match="implemented-requirement | implemented-requirement//statement">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="prop, annotation, link, set-parameter, responsible-role"/>
            <xsl:if test="exists(description) and empty(by-component[@component-uuid=$this-system-component-uuid]) ">
                <by-component component-uuid="{$this-system-component-uuid}" uuid="{uuid:randomUUID()}">
                    <xsl:sequence select="description"/>
                </by-component>
            </xsl:if>
            <xsl:apply-templates select="by-component, statement, remarks"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="implemented-requirement//by-component[@component-uuid=$this-system-component-uuid]">
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:for-each select="description">
                <xsl:copy>
                    <xsl:apply-templates select="@*"/>
                    <xsl:copy-of select="../description/*"/>
                    <xsl:apply-templates/>
                </xsl:copy>
            </xsl:for-each>
            <xsl:if test="empty(description)">
                <xsl:copy-of select="../description"/>
            </xsl:if>
            <xsl:apply-templates select="* except description"/>
        </xsl:copy>
    </xsl:template>

<!--
For /system-security-plan/control-implementation/implemented-requirement/by-component:
x renamed "component-id" to "component-uuid"
n added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
n added "remarks" to allow for adding general commentary

For /system-security-plan/control-implementation/implemented-requirement/statement:
- removed "description"

For /system-security-plan/control-implementation/implemented-requirement/statement/by-component:
x renamed "component-id" to "component-uuid"
n added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
n added "remarks" to allow for adding general commentary

## Changes to the component definition model

### Changes to the component definition XML format

For /XXX/system-implementation/component:
- renamed "component-type" to "type", and updated allowed values
n defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id

For /XXX/system-implementation/user:
n defined allowed values for annotation/@name and role-id

For /XXX/system-implementation/inventory-item:
- moved "@asset-id" to a required prop/@name
n defined allowed values for prop/@name, annotation/@name, link/@rel, and responsible-role/@role-id

For /XXX/system-implementation/inventory-item/implemented-component:
- renamed "component-id" to "component-uuid"
n defined allowed values for prop/@name, annotation/@name, and responsible-party/@role-id

For /system-security-plan/control-implementation/implemented-requirements:
- removed "description"

For /system-security-plan/control-implementation/implemented-requirements/by-component:
- renamed "component-id" to "component-uuid"
n added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
n added "remarks" to allow for adding general commentary

For /system-security-plan/control-implementation/implemented-requirements/statements:
- removed "description"

For /system-security-plan/control-implementation/implemented-requirements/statements/by-component:
- renamed "component-id" to "component-uuid"
n added "export", "inherited", and "satisfied" to support documenting leveraged authorizations
n added "remarks" to allow for adding general commentary

    -->
   
</xsl:stylesheet>