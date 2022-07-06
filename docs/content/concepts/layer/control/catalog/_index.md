---
title: OSCAL Catalog Model
heading: "OSCAL Control Layer: Catalog Model"
weight: 30
sidenav:
  title: Catalog Model
toc:
  enabled: true
aliases:
  - /docs/model/catalog/
  - /documentation/schema/catalog/
  - /documentation/schema/catalog-layer/catalog/
  - /documentation/schema/catalog-layer/catalog/examples/
suppresstopiclist: true
---

| Catalog Schema | Catalog Converters | Reference
|:--- |:--- |:--- |
| [JSON Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_catalog_schema.json) | [XML to JSON Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/convert/oscal_catalog_xml-to-json-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/json#converting-oscal-xml-content-to-json)) | [Outline](/reference/latest/catalog/json-outline/)<br />[Reference](/reference/latest/catalog/json-reference/)<br />[Index](/reference/latest/catalog/json-index/) |
| [XML Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_catalog_schema.xsd) | [JSON to XML Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/convert/oscal_catalog_json-to-xml-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/xml#converting-oscal-json-content-to-xml)) | [Outline](/reference/latest/catalog/xml-outline/)<br />[Reference](/reference/latest/catalog/xml-reference/)<br />[Index](/reference/latest/catalog/xml-index/) |

## Purpose

The OSCAL catalog model represents a collection of [controls](/concepts/terminology/#control), represented as a control [catalog](/concepts/terminology/#catalog).

The OSCAL catalog model was designed to represent security and privacy controls in standardized, machine-readable formats. The OSCAL catalog model standardizes the representation of control definitions from different sources (e.g., SP 800-53, ISO/IEC 27002, COBIT 5) allowing control information to be easily searched, imported, and exported by applications using a common format.

The OSCAL catalog model was designed to represent security and privacy controls; however, it may be possible to apply OSCAL to other applications related to safety, health, or other purposes. These other applications have not been explored so far.

## Authors and Consumers

### Catalog Authors

{{<callout>}}Compliance Framework Authors and Requirements Authors{{</callout>}}

Catalogs are authored by an organization that defines or governs a set of controls, such as NIST with Special Publication (SP) 800-53.

Organizations may also author a catalog when they need to define a control not found in an existing control catalog.

### Catalog Consumers

{{<callout>}}Baseline Authors and Consumers, Component Definition Authors and Consumers, System Security Plan Authors and Consumers, Auditors, Authorizing Officials{{</callout>}}

As the catalog forms the foundation of OSCAL, the authors and consumers of all other OSCAL artifacts are catalog consumers.

## Catalog Organization

{{% usa-grid-container class="padding-x-0" %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="grid-col-fill" %}}
An OSCAL catalog is organized as follows, which is based on the standard OSCAL [document structure](/concepts/layer/overview/#general-model-organization):
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

OSCAL catalogs define organized sets of controls. The primary use of the catalog model is to represent, in machine-readable form, a comprehensive collection of controls from which an organization can create a *baseline*, by means of control selection and tailoring. A public catalog such as SP 800-53 (rev 4 and rev5), available in such a format, is a significant (and arguably indispensable) asset for any organization tasked with understanding and implementing and assessing its controls. The OSCAL catalog model supports this by providing a common set of rules for encoding this catalog (control set), like others, thereby promoting interoperability of tools, portability of data, and the development of commodity software applications.

Because the OSCAL catalog model is suited to represent any set of controls, it has a second important application: to represent the *output* of a process applied to [OSCAL **profile**](../profile/) documents, called *resolution*. (See the [Profile Resolution Specification](../../../processing/profile-resolution/) for details.) This application of the catalog model is important to consumers of baselines, giving them the ability to import, view and further process the controls represented in a baseline in one place, with their tailoring, and treat catalogs and baselines together within a single unified set of operations.

In both of these applications (and in others to be developed), the OSCAL catalog model provides:

* An ability to group related controls; and
* An ability to define individual controls, including:
  * control definition: a statement of the functionality or capability required to implement the control;
  * control parameters: a mechanism for the dynamic assignment of values in a control;
  * control guidance: additional control implementation guidance, intended to supplement the control definition;
  * control objectives: clearly stated objectives that should be achieved by a proper implementation of the control definition;
  * assessment methods: prescribed actions for ensuring the control has been implemented consistent with its definition and achieving its objectives;
  * related controls: identification of other controls in the catalog related to the control;
  * references: supporting references related to the control.

{{<partialCached "note-to-developers-uuid.html" >}}

## Content Examples

The NIST SP 800-53 revision 4 and 5 control catalogs are provided as [OSCAL examples]({{< param "contentRepoPath" >}}/nist.gov/SP800-53/) in the OSCAL content GitHub repository. These examples are maintained by NIST in OSCAL XML, JSON, and YAML formats. OSCAL catalogs and baselines are being produced by other stakeholders to represent different control regimens as well.

Read an [Annotated Example](sp800-53rev5-example/) of the contents and organization of an OSCAL control from NIST SP800-53 rev 5.
