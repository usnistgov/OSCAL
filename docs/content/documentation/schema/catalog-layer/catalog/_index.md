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

## Purpose

The OSCAL catalog model represents the information contained within a control catalog. 

OSCAL is designed to support the standardized representation of control definitions from different sources. The OSCAL catalog model can be used to express different control catalogs in a standardized way, allowing control information to be easily searched, imported, and exported by applications.

A *control* is a requirement or guideline intended to reduce  if implemented. An OSCAL catalog also allows parameters, control objectives, and assessment methods to be expressed.

## Concepts

Many privacy and security compliance frameworks are based on **controls**. 
Framework authors provide control requirements, system owners impliment the controls, and assessors validate the implemented control against the requirement. 

Framework providers organize control requirements into a **catalog**.
The OSCAL catalog model is designed to represent control requirement information and its catalog organization in a machine-readable format with a high degree of fidelity and granularity.

An OSCAL catalog allows control requirements to be grouped, and allows individual control requirements to contain subordinate control requirements (enhancements), control objectives, assessment methods, references, and other content as may be necessary in some frameworks. 

The control model is the foundation for all other OSCAL models. 

### Control

In OSCAL, a control is *a requirement or guideline, which when implemented will reduce an aspect of risk related to an information system and its information.*


{{% callout %}}
A **security control** is defined in NIST Special Publication (SP) [SP 800-53 revision 5 (draft)](https://doi.org/10.6028/NIST.SP.800-53r5-draft) and the Office of Management and Budget Memorandum Circular [A-130](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/circulars/A130/a130revised.pdf), *Managing Information as a Strategic Resource*, as:

> The safeguards or countermeasures prescribed for an information system or an organization to protect the confidentiality, integrity, and availability of the system and its information.

These documents also define a **privacy control** as:

> The administrative, technical, and physical safeguards employed within an agency to ensure compliance with applicable privacy requirements and manage privacy risks.

These definitions align well to the control concept in OSCAL.
{{% /callout %}}

OSCAL has been built for applications of controls that relate to privacy or security safeguards or countermeasures, such as in the two following examples. However, it may be possible to apply OSCAL beyond security or privacy controls for applications related to safety, health, or other purposes. These other applications have not been explored so far.

## Authors and Consumers

### Catalog Authors

<table><tr><td style="background-color:#cccccc; border:none">
Compliance Framework Authors and Requirements Authors 
</td></tr></table>
Catalogs are authored by an organization that defines or governs controls, such as NIST's Special Publication (SP) 800-53 controls.
Organizations may also author a catalog when they need to define a control not found in an applicable framework. 

### Catalog Consumers

<table><tr><td style="background-color:#cccccc; border:none">
Baseline Authors and Consumers, Component Definition Authors and Consumers, System Security Plan Authors and Consumers, Auditors, Authorizing Officials
</td></tr></table>
As the catalog forms the foundation for OSCAL, the authors and consumers of all other OSCAL artifacts are catalog consumers. 


## Catalog Organization

{{% usa-grid-container %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="col-4" %}}
&nbsp;

![This is the alt text.](catalog-model.svg)
{{% /usa-grid-column %}}
{{% usa-grid-column class="col-8, padding-left-2" %}}
An OSCAL catalog is organized as follows:
- **Metadata**: Metadata syntax is identical and required in all OSCAL models. It includes information such as the file's title, publication version, publicaiton date, and OSCAL version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.
- **Parameter**: Any parameter applicable to more than one control requirement statement in the catalog may be defined here.
- **Control**: Each control may contain control-specific parameters, control requirement statements, control objectives, assessment methods, references, and subordinate controls.
- **Group**: Related controls may be grouped. Parameters related to this group may be defined here. 
- **Back Matter**: Back matter syntax is identical in all OSCAL models. It is used for attachments, citations, and embeded content such as graphics. 
{{% /usa-grid-column %}}
{{% /usa-grid-row %}}

{{% /usa-grid-container %}}


## Content Examples

The NIST SP 800-53 revision 4 and 5 control catalogs are provided as catalog model [examples](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/) in the OSCAL content GitHub repository. These examples are provided in OSCAL XML, JSON, and YAML formats.

### NIST SP 800-53 Annotated Example

{{<callout>}}**Note:** Full versions of the NIST SP 800-53 revision 4 catalog are available in OSCAL [XML](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml), [JSON](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/json/NIST_SP-800-53_rev4_catalog.json), and [YAML](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4/yaml/NIST_SP-800-53_rev4_catalog.yaml) formats in the OSCAL content GitHub repository. These examples also include assessment and objective content from NIST SP 800-53A revision 4.{{</callout>}}

Here is a non-normative, partial illustration showing how control **AC1** from NIST SP 800-53 rev 4 can be rendered in OSCAL Catalog XML format with a `<control>` element. A short walkthrough follows.

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
