---
title: System Security Plan Model (SSP)
heading: "OSCAL Implementation Layer: System Security Plan (SSP) Model"
weight: 50
toc:
  enabled: true
aliases:
  - /documentation/schema/ssp/
  - /documentation/schema/implementation-layer/ssp/
---

| SSP Schema | SSP Converters | Reference |
|:--- |:--- |:--- |
| [JSON Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_ssp_schema.json) | [XML to JSON Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/convert/oscal_ssp_xml-to-json-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/json#converting-oscal-xml-content-to-json)) | [Outline](/reference/latest/system-security-plan/json-outline/)<br />[Reference](/reference/latest/system-security-plan/json-reference/)<br />[Index](/reference/latest/system-security-plan/json-index/) |
| [XML Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_ssp_schema.xsd) | [JSON to XML Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/convert/oscal_ssp_json-to-xml-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/xml#converting-oscal-json-content-to-xml)) | [Outline](/reference/latest/system-security-plan/xml-outline/)<br />[Reference](/reference/latest/system-security-plan/xml-reference/)<br />[Index](/reference/latest/system-security-plan/xml-index/) |

## Purpose

The OSCAL system security plan (SSP) model represents a description of the control implementation of an information system. The SSP model is part of the OSCAL [implementation](../) layer.

The OSCAL SSP model enables full modeling of highly granular SSP content, including points of contact, system characteristics, and control satisfaction descriptions. At a more detailed level, this includes the system's authorization boundary, information types and categorization, inventory, and attachments. In terms of control satisfaction, it models control parameter values, responsible roles, implementation status, control origination, and a description of control satisfaction at a level of granularity down to a specific control statement. Control satisfaction can be defined for the system as a whole or for individual implemented components.

## Authors and Consumers

### SSP Authors

{{<callout>}}System Owners and System Security Plan Authors{{</callout>}}

Through delegation, system owners create and maintain SSP content to document the implementation of controls within their system.

### SSP Consumers

{{<callout>}}Assessors, Customers, Authorizing Officials, Leveraging System Owners{{</callout>}}

Assessors consume SSPs in the planning and execution of a system assessment relative to an established control baseline and compliance framework.
Authorizing Officials consume SSPs in the adjudication of a system as part of approving an authorization to operate.


## Model Overview

{{% usa-grid-container class="padding-x-0" %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="grid-col-fill" %}}
An OSCAL profile is organized as follows:
- **Metadata**: Metadata syntax is identical and required in all OSCAL models. It includes information such as the document's title, publication version, publication date, and OSCAL version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.
- **Import Profile**: Identifies the applicable control baseline for the system. This baseline is represented as an OSCAL [profile](../../control/profile/).
- **System Characteristics**: Represents attributes of the system, such as its name, description, models, and information processed.
- **System Implementation**: Represents relevant information about the system's deployment, including user roles, interconnections, services, and system inventory.
- **Control Implementation**: Describes how each control in the baseline is implemented within the system.
- **Back Matter**: Back matter syntax is identical in all OSCAL models. It is used for attachments, citations, and embedded content such as graphics.
{{% /usa-grid-column %}}
{{% usa-grid-column class="grid-col-auto" %}}
{{<figure src="SSP-model.svg" alt="A diagram depicting the system security plan model. As described in the text, within the larger system security plan model box, it shows a metadata at the top, followed by an import profile box, system characteristics box, system implementation box, control implementation box, and finally a back matter box." class="maxw-full  margin-top-0">}}
{{% /usa-grid-column %}}
{{% /usa-grid-row %}}
{{% /usa-grid-container %}}

## Key Concepts

The OSCAL system security plan (SSP) model represents a description of the control implementation of an information system. The SSP model is part of the OSCAL [implementation](../) layer.

The OSCAL SSP model enables full modeling of highly granular SSP content, including points of contact, system characteristics, and control satisfaction descriptions. At a more detailed level, this includes the system's authorization boundary, information types and categorization, inventory, and attachments. In terms of control satisfaction, it models control parameter values, responsible roles, implementation status, control origination, and a description of control satisfaction at a level of granularity down to a specific control statement. Control satisfaction can be defined for the system as a whole or for individual implemented components.

The figure below expresses represents the portion of the OSCAL stack as it relates to an OSCAL SSP.
![A diagram representing the OSCAL stack from a system security plan's perspective.](OSCAL-stack-SSP.svg)

{{<partialCached "note-to-developers-uuid.html" >}}

### Identifier References

An OSCAL SSP may contain references to information that is [instance scoped](/concepts/identifier-use/#scope) (e.g., in the SSP model), [cross-instance scoped](/concepts/identifier-use/#cross-instance) (e.g., in a referenced profile, catalog, or component definition model), or external (e.g., references to non-OSCAL resources).  The following summarizes the scenarios where an OSCAL SSP may have references to other content.

#### Instance

<a name="instance-scoped"></a>An [instance scoped](/concepts/identifier-use/#scope) identifier reference is used to reference information in the same OSCAL SSP instance.  This scenario supports enforcement of constraints since all of the information required to check the validity of the reference is readily available in the SSP.

#### Cross Instance

<a name="cross-instance-scoped"></a>A [cross-instance scoped](/concepts/identifier-use/#cross-instance) identifier reference is used to reference information imported from another OSCAL instance. The following are examples of cross-instance references in an OSCAL SSP.

- <a name="import-profile"></a>OSCAL uses the `import-profile` field to reference an OSCAL profile or catalog representing the system's control baseline. This scenario supports validation and enforcement of constraints, provided the imported OSCAL profile or [resolved profile](/concepts/processing/profile-resolution/#d2e15-head) is accessible. In this case, the controls and parameters referenced from the SSP can be verified to exist in the resolved profile.
- <a name="leveraged-authorization"></a>Use of links to SSP leveraged authorizations, established through the use of the `leveraged-authorization` field, present another cross-instance scoped identifier scenario.  In this scenario an OSCAL SSP has leveraged authorization(s), which reference a leveraged SSP. Some of the information in the leveraged SSP may be referenced if the leveraged SSP is also in OSCAL format. If the leveraging SSP author has access to the leveraged system SSP, this scenario supports validation of constraints on the leveraging SSP to enforce the referential integrity of cross-references to leveraged system SSP details.
- <a name="cdef"></a>Links to [component definitions](/concepts/layer/implementation/component-definition/)  (CDEFs) provide lineage from an SSP's implemented system component back to a relevant source of transferred content.  This could include cases where an OSCAL SSP component has a reference to a component in a component definition. If the component definition is resolvable, this scenario supports enforcement of referential integrity between the SSP and components in the component definition.

#### External

<a name="external"></a>Finally, OSCAL supports references to (non-OSCAL) external resources through use of the ```link``` field.  These external references do not provide enough contextual information to know the format and/or structure of data in the referenced resource. Additionally, there is no assurance that SSP authors have access to linked external data, so these references cannot be validated.

### Reference Constraints

The following table summarizes constraints for identifier references in an OSCAL SSP:

{{% todo %}}
| `@component-uuid` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-implementation/component/@uuid) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/system-implementation/components/uuid)) | [instance scoped](#instance-scoped), [leveraged authorization](#leveraged-authorization) | `component` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-implementation/component) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/component-uuid)) | [UUID](/reference/datatypes/#uuid) | Inventory item reference to a single target component must be found in target SSP instance. Component must be defined in local SSP or leveraged SSP. |
{{% /todo %}}


| Reference | Target Scope | Target Element | Target ID Type | Referential Constraint Description |
| :-------- | :----------- | :------------: | :------------- | :--------------------------------- |
| `@component-uuid` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/by-component/@component-uuid) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/component-uuid)) | [instance scoped](#instance-scoped), [leveraged authorization](#leveraged-authorization) | `component` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-implementation/component) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/by-components/component-uuid)) | [UUID](/reference/datatypes/#uuid) | Reference to a component that is implementing a control.  A single target component must be found in target SSP instance. Component must be defined in local SSP or leveraged SSP. |
| `@control-id` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/@control-id) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/control-id)) | [import-profile](#import-profile) | `control` <br />([XML](/reference/latest/catalog/xml-reference/#/catalog/control/@id) \| [JSON](/reference/latest/catalog/json-reference/#/catalog/controls/id)) | [Token](/reference/datatypes/#token) | A single target control with the matching id must be found in the baseline, which may be nested within groups and/or controls within the baseline. |
| `@provided-uuid` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/statement/by-component/export/responsibility/@provided-uuid) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/by-components/export/responsibilities/provided-uuid)) | [leveraged authorization](#leveraged-authorization) | `provided/@uuid` <br />([XML](/reference/latest/system-security-plan/xml-index/#/provided) \| [JSON](/reference/latest/system-security-plan/json-index/#/provided)) | [UUID](/reference/datatypes/#uuid) | Reference to a provided control implementation which is inherited by a leveraging system.  A single matching target provided control implementation statement must be found in the leveraged SSP. |
| `party-uuid`\* <br /> ([XML](/reference/latest/system-security-plan/xml-index/#/party-uuid) \| [JSON](/reference/latest/system-security-plan/json-index/#/party-uuids)) | [instance scoped](#instance-scoped), [import-profile](#import-profile), [leveraged authorization](#leveraged-authorization) | `party` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/party/@uuid) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/parties/uuid)) <br /> `party` <br />([XML](/reference/latest/catalog/xml-reference/#/catalog/metadata/party/@uuid) \| [JSON](/reference/latest/catalog/json-reference/#/catalog/metadata/parties/uuid)) | [UUID](/reference/datatypes/#uuid) | This is a reference to a party (person or organization).  A single target party with a matching UUID must be found in the SSP, imported baseline, or leveraged SSP. |
| `@role-id`\* <br /> ([XML](/reference/latest/system-security-plan/xml-index/#/@role-id) \| [JSON](/reference/latest/system-security-plan/json-index/#/role-id)) <br /> `role-id`\* <br /> ([XML](/reference/latest/system-security-plan/xml-index/#/role-id) \| [JSON](/reference/latest/system-security-plan/json-index/#/role-id)) <br /> `role-ids`\* <br /> ([JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/system-implementation/users/role-ids)) | [instance scoped](#instance-scoped), [import-profile](#import-profile), [leveraged authorization](#leveraged-authorization) | `role` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/role) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/roles)) <br /> `role` <br />([XML](/reference/latest/catalog/xml-reference/#/catalog/metadata/role) \| [JSON](/reference/latest/catalog/json-reference/#/catalog/metadata/roles)) | [Token](/reference/datatypes/#token) | This is a reference to a role.  A single target role with a matching id must be found in the SSP, imported baseline, or leveraged SSP. |
| `@param-id`\* <br /> ([XML](/reference/latest/system-security-plan/xml-index/#/@param-id) \| [JSON](/reference/latest/system-security-plan/json-index/#/param-id)) | [import-profile](#import-profile) | `param` <br />([XML](/reference/latest/catalog/xml-index/#/param) \| [JSON](/reference/latest/catalog/json-index/#/params)) | [Token](/reference/datatypes/#token) | This is a reference to a parameter defined in (resolved) baseline.  A single target parameter with the matching id must be found in the baseline, which may be nested within groups and/or controls within the baseline. |
| `@statement-id` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/statement/@statement-id) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements/statement-id)) | [import-profile](#import-profile) | `statement` <br />([XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/control-implementation/implemented-requirement/statement) \| [JSON](/reference/latest/system-security-plan/json-reference/#/system-security-plan/control-implementation/implemented-requirements/statements)) | [Token](/reference/datatypes/#token) | This is a reference to a statement defined in (resolved) baseline.  A single target statement with the matching id must be found in a control in the baseline. |

\* Note: Some elements have multiple references.
### Modeling Validation Information
OSCAL is designed to allow the capture of relevant details related to independent validation of components. See the [Validation Modeling](/learn/tutorials/validation-modeling/) tutorial for details.

## Content Examples

Multiple examples of SSP expressed using the OSCAL SSP model can be found in the OSCAL GitHub repository in [XML]({{< param "contentRepoPath" >}}/examples/ssp/xml),
[JSON]({{< param "contentRepoPath" >}}/examples/ssp/json),
and [YAML]({{< param "contentRepoPath" >}}/examples/ssp/yaml/) formats.

## Related Tutorials

The following tutorial is provided related to the catalog model.

- [Representing Test Validation Information](/learn/tutorials/validation-modeling/): Explains how to represent test validation information (e.g., FIPS-140-2) for a component in an OSCAL SSP.
