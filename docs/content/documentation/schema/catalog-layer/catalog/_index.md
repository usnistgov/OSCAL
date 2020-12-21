---
title: Catalog Model
heading: "OSCAL Catalog Layer: Catalog Model"
description: XML and JSON format documentation for the OSCAL Catalog model, which models a [control catalog](/documentation/schema/catalog-layer/#catalog).
weight: 30
aliases:
  - /docs/model/catalog/
  - /documentation/schema/catalog/
  - /documentation/schema/catalog-layer/catalog/examples/
---

| Catalog Schema | Catalog Converters 
|:--- |:--- |
| [XML Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_catalog_schema.xsd) | [JSON to XML Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/convert/oscal_catalog_json-to-xml-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/master/xml#converting-oscal-json-content-to-xml)) |
| [JSON Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_catalog_schema.json) | [XML to JSON Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/convert/oscal_catalog_xml-to-json-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/master/json#converting-oscal-xml-content-to-json)) |

## Purpose

The OSCAL catalog model represents a collection of [controls](../../../concepts/#control), represented as a control [catalog](../../../concepts/#catalog).

The OSCAL catalog model was designed to represent security and privacy controls in standardized, machine readable formats. The OSCAL catalog model standardizes the representation of control definitions from different sources (e.g., SP 800-53, ISO/IEC 27002, COBIT 5) allowing control information to be easily searched, imported, and exported by applications using a common format.

The OSCAL catalog model was designed to represent security and privacy controls; however, it may be possible to apply OSCAL to other applications related to safety, health, or other purposes. These other applications have not been explored so far.

## Authors and Consumers

### Catalog Authors

{{<callout>}}Compliance Framework Authors and Requirements Authors{{</callout>}}

Catalogs are authored by an organization that defines or governs controls, such as NIST's Special Publication (SP) 800-53 controls.

Organizations may also author a catalog when they need to define a control not found in an applicable framework. 

### Catalog Consumers

{{<callout>}}Baseline Authors and Consumers, Component Definition Authors and Consumers, System Security Plan Authors and Consumers, Auditors, Authorizing Officials{{</callout>}}

As the catalog forms the foundation for OSCAL, the authors and consumers of all other OSCAL artifacts are catalog consumers. 

## Catalog Organization

{{% usa-grid-container class="padding-x-0" %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="grid-col-fill" %}}
An OSCAL catalog is organized as follows, which is based on the standard OSCAL [document structure](../../#oscal-file-organization):
- **Metadata**: Metadata syntax is identical and required in all OSCAL models. It includes information such as the file's title, publication version, publication date, and OSCAL version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.
- **Parameter**: Any parameter applicable to more than one control requirement statement in the catalog may be defined here.
- **Control**: Each control may contain control-specific parameters, control requirement statements, control objectives, assessment methods, references, and subordinate controls.
- **Group**: Related controls may be grouped. Parameters related to this group may be defined here. 
- **Back Matter**: Back matter syntax is identical in all OSCAL models. It is used for attachments, citations, and embedded content such as graphics. 
{{% /usa-grid-column %}}
{{% usa-grid-column class="grid-col-auto" %}}
{{<figure src="catalog-model.svg" alt="A diagram depicting the catalog model. As described in the text, within the larger catalog model box, it shows a metadata at the top, followed by a parameter box, control box, group box, and finally a back matter box." class="maxw-full margin-top-0">}}
{{% /usa-grid-column %}}
{{% /usa-grid-row %}}
{{% /usa-grid-container %}}

## Key Concepts

OSCAL catalogs define a complete set of controls. The primary use of the model is representing an entire collection of controls from an organization from which control baselines are created. 
The catalog model is also used to represent the tailored baseline resulting from a processed (resolved) profile. 

In both uses, a catalog defines:

* An ability to group related controls at the discretion of the catalog author; and
* An ability to define individual controls, including:
  * control parameters: a mechanism for the dynamic assignment of values in a control.
  * control definition: a statement of the functionality or capability required to implement the control.
  * control guidance: additional control implementation guidance, intended to supplement the control definition.
  * control objectives: clearly stated objectives that should be achieved by a proper implementation of the control definition.
  * assessment methods: prescribed actions for ensuring the control has been implemented consistent with its definition and achieving its objectives.
  * related controls: identification of other controls in the catalog related to the control.
  * references: supporting references related to the control.

See [examples](#content-examples) of OSCAL catalogs.

{{<partial "note-to-developers-uuid.html" >}}

## Content Examples

The NIST SP 800-53 revision 4 and 5 control catalogs are provided as catalog model [examples]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/) in the OSCAL content GitHub repository. These examples are provided in OSCAL XML, JSON, and YAML formats.

### NIST SP 800-53 Revision 4 Annotated Example

{{<callout>}}**Note:** Full versions of the NIST SP 800-53 revision 4 catalog are available in OSCAL [XML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml), [JSON]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/json/NIST_SP-800-53_rev4_catalog.json), and [YAML]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/rev4/yaml/NIST_SP-800-53_rev4_catalog.yaml) formats in the OSCAL content GitHub repository. These examples also include assessment and objective content from NIST SP 800-53A revision 4.{{</callout>}}

Here is a non-normative, partial illustration showing how control **AC-1** from NIST SP 800-53 rev 4 can be rendered in OSCAL Catalog XML format with a `<control>` element. A short walk-through follows.

The following is a non-normative, partial illustration showing how control **AC-1** from NIST [SP 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4) can be rendered in OSCAL Catalog XML format with a `<control>` element.

First we start with the following control text from SP 800-53.

> **AC-1  ACCESS CONTROL POLICY AND PROCEDURES**
>
> __Control:__ The organization:
> 
> a. Develops, documents, and disseminates to [Assignment: organization-defined personnel or roles]:
>   1. An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and
>   2. Procedures to facilitate the implementation of the access control policy and associated access controls; and
>
> b. Reviews and updates the current:
>   1. Access control policy [Assignment: organization-defined frequency]; and
>   2. Access control procedures [Assignment: organization-defined frequency].
>
> __Supplemental Guidance:__  This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.
> 
> __Related control:__ PM-9.
> 
> __Control Enhancements:__  None.
> 
> __References:__  NIST Special Publications 800-12, 800-100.

This control has a number of high-level data elements, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, and references. In contrast, the next control is from ISO 27002 on access control policy. It is also detailed in a different way, with an identifier ("9.1.1"), a title ("Access control policy"), control text, lengthy implementation guidance, and other information (additional advice on access control policy).

This control text is expressed in OSCAL as follows:

{{<highlight xml "linenos=table,nowrap=false" >}}
<control class="SP800-53" id="ac-1">
  <title>Access Control Policy and Procedures</title>
  <param id="ac-1_prm_1">
    <label>organization-defined personnel or roles</label>
  </param>
  <param id="ac-1_prm_2">
    <label>organization-defined frequency</label>
  </param>
  <param id="ac-1_prm_3">
    <label>organization-defined frequency</label>
  </param>
  <prop class="label">AC-1</prop>
  <part class="statement" id="ac-1_smt">
    <p>The organization:</p>
    <part class="item" id="ac-1_smt.a">
      <prop class="label">a.</prop>
      <p>Develops, documents, and disseminates to <insert param-id="ac-1_prm_1"/>:</p>
      <part class="item" id="ac-1_smt.a.1">
        <prop class="label">1.</prop>
        <p>An access control policy that addresses purpose, scope, roles,
           responsibilities, management commitment, coordination among
           organizational entities, and compliance; and</p>
      </part>
      <part class="item" id="ac-1_smt.a.2">
        <prop class="label">2.</prop>
        <p>Procedures to facilitate the implementation of the access control
           policy and associated access controls; and</p>
      </part>
    </part>
    <part class="item" id="ac-1_smt.b">
      <prop class="label">b.</prop>
      <p>Reviews and updates the current:</p>
      <part class="item" id="ac-1_smt.b.1">
        <prop class="label">1.</prop>
        <p>Access control policy <insert param-id="ac-1_prm_2"/>; and</p>
      </part>
      <part class="item" id="ac-1_smt.b.2">
        <prop class="label">2.</prop>
        <p>Access control procedures <insert param-id="ac-1_prm_3"/>.</p>
      </part>
    </part>
  </part>
  <part class="guidance" id="ac-1_gdn">
    <p>This control addresses the establishment of policy and procedures for the
       effective implementation of selected security controls and control
       enhancements in the AC family. Policy and procedures reflect applicable
       federal laws, Executive Orders, directives, regulations, policies,
       standards, and guidance. Security program policies and procedures at the
       organization level may make the need for system-specific policies and
       procedures unnecessary. The policy can be included as part of the general
       information security policy for organizations or conversely, can be
       represented by multiple policies reflecting the complex nature of certain
       organizations. The procedures can be established for the security program
       in general and for particular information systems, if needed. The
       organizational risk management strategy is a key factor in establishing
       policy and procedures.</p>
    <link rel="related" href="#pm-9">PM-9</link>
  </part>
  <references>
    <link href="#ref050" rel="reference">NIST Special Publication 800-12</link>
    <link href="#ref044" rel="reference">NIST Special Publication 800-100</link>
  </references>
</control>
{{< / highlight >}}

#### Walkthrough

- The control class is "SP800-53". This serves as an indicator to a downstream processor of how it can expect this control to be
structured.
- The control ID is "ac.1". All `id` values are unique within the document and serve for addressing and linking. In the case of controls and subcontrols, the lexical form of the `id` is designed to be consistent with its formal name or label, which is **also** encoded within the control (in this case, "AC-1"). A discrepancy between these values indicates degradation in the data.
- `<param>` elements define parameter values for the control that permit (and may require) setting in context. Typically, a catalog will expose parameters where profiling applications are expected either to provide values themselves (appropriate to each profile) or to permit setting at higher levels of implementation. These values are available for assignment wherever indicated in the language of the control, using corresponding `<insert/>` elements.
- `<prop>` elements specify properties appropriate to this control. Here only a `label` property is given, for the control's canonical label. For other catalogs, other properties may assign values to controls according to any system of labels or associations.
- `<part>` elements indicate larger articulated structures. Here the part provides the *statement* for the control (as shown by its class). In SP 800-53, control statements give the text (formal prose definition and description) of the control. As the example shows, statements can also be articulated into subparts, with each discrete piece of the statement handled separately and assigned its own identifier.
- `<insert>` elements reference parameters (`param-id` referencing parameter IDs) to bring in user-defined values.

The following snippet from the example above contains supplemental guidance given with the control (line breaks added for readability).

{{< highlight xml "linenos=table,linenostart=43" >}}
<part class="guidance" id="ac-1_gdn">
  <p>This control addresses the establishment of policy and procedures for the
     effective implementation of selected security controls and control
     enhancements in the AC family. Policy and procedures reflect applicable
     federal laws, Executive Orders, directives, regulations, policies,
     standards, and guidance. Security program policies and procedures at the
     organization level may make the need for system-specific policies and
     procedures unnecessary. The policy can be included as part of the general
     information security policy for organizations or conversely, can be
     represented by multiple policies reflecting the complex nature of certain
     organizations. The procedures can be established for the security program
     in general and for particular information systems, if needed. The
     organizational risk management strategy is a key factor in establishing
     policy and procedures.</p>
  <link rel="related" href="#pm-9">PM-9</link>
</part>
{{< / highlight >}}

Note that unlike the control statement, which has a structure whose parts are labeled and addressable, the supplemental guidance is a simple paragraph. Where catalogs do not provide structure, OSCAL does not impose any.

Finally, the control description gives references for the control:

{{< highlight xml "linenos=table,linenostart=59" >}}
<references>
  <link href="#ref050" rel="reference">NIST Special Publication 800-12</link>
  <link href="#ref044" rel="reference">NIST Special Publication 800-100</link>
</references>
{{< / highlight >}}

These can be resolved to elements elsewhere in the catalog, as for example here (a citation from this catalog to another NIST publication):

{{< highlight xml >}}
<ref id="ref050">
  <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-12">NIST Special
  Publication 800-12</citation>
</ref>
{{< / highlight >}}     


{{<todo>}}
### ISO/IEC 27002:2013

The following example is from [ISO/IEC 27002:2013](https://www.iso.org/standard/54533.html):

<blockquote>
    <p><strong>9.1.1 Access control policy</strong></p>
    <p><strong>Control</strong></p>
    <p>An access control policy should be established, documented and reviewed based on business and information security requirements.</p>
    <p><strong>Implementation guidance</strong></p>
    <p>Asset owners should determine appropriate access control rules, access rights and restrictions for specific user roles towards their assets, with the amount of detail and the strictness of the controls reflecting the associated information security risks.</p>
    <p>Access controls are both logical and physical and these should be considered together.</p>
    <p>Users and service providers should be given a clear statement of the business requirements to be met by access controls.
    <p>The policy should take account of the following:
        <ol type="a">
            <li>security requirements of business applications;</li>
            <li>policies for information dissemination and authorization, e.g. the need-to-know principle and information security levels and classification of information;</li>
            <li>consistency between the access rights and information classification policies of systems and networks;</li>
            <li>relevant legislation and any contractual obligations regarding limitation of access to data or services;</li>
            <li>management of access rights in a distributed and networked environment which recognizes all types of connections available;</li>
            <li>segregation of access control roles, e.g. access request, access authorization, access administration;</li>
            <li>requirements for formal authorization of access requests;</li>
            <li>requirements for periodic review of access rights;</li>
            <li>removal of access rights;</li>
            <li>archiving of records of all significant events concerning the use and management of user identities and secret authentication information;</li>
            <li>roles with privileged access.</li>
        </ol>
    </p>
    <p><strong>Other information</strong></p>
    <p>Care should be taken when specifying access control rules to consider:
        <ol type="a">
            <li>establishing rules based on the premise "Everything is generally forbidden unless expressly permitted" rather than the weaker rule "Everything is generally permitted unless expressly forbidden";</li>
            <li>changes in information labels that are initiated automatically by information processing facilities and those initiated at the discretion of a user;</li>
            <li>changes in user permissions that are initiated automatically by the information system and those initiated by an administrator;</li>
            <li>rules which require specific approval before enactment and those which do not.</li>
        </ol>
    </p>
    <p>Access control rules should be supported by formal procedures and defined responsibilities.</p>
    <p>Role based access control is an approach used successfully by many organizations to link access rights with business roles.</p>
    <p>Two of the frequent principles directing the access control policy are:
        <ol type="a">
            <li>Need-to-know: you are only granted access to the information you need to perform your tasks (different tasks/roles mean different need-to-know and hence different access profile);</li>
            <li>Need-to-use: you are only granted access to the information processing facilities (IT equipment, applications, procedures, rooms) you need to perform your task/job/role.</li>
        </ol>
    </p>
</blockquote>

**NOTE:** Some of the reference links have been removed in the above examples as compared to the original source. This was done to simplify the text for illustration.

### Comparing the ISO 27002 and NIST SP 800-53 Examples

Comparing the ISO 27002 and NIST SP 800-53 examples illustrates obvious differences. NIST SP 800-53 includes several components, such as references and control enhancements that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002 because it provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

To address these differences, OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using the [catalog model](../schema/catalog-layer/catalog/). The OSCAL catalog model defines structured, machine-readable XML, JSON, and YAML representations of the information contained within a control. A control defined using the OSCAL catalog model supports including control statements, guidance, assessment objectives, and many other features. By combining all of this information in a single model, the OSCAL catalog model simplifies the entire control-based operational model.

{{</todo>}}
