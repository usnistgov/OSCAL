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

An OSCAL SSP may contain references to information that is defined locally (e.g., in the SSP model) or externally (e.g., in a referenced profile, catalog, or component definition model).  The following lists the mechanisms through which objects in an OSCAL SSP may "link" to other OSCAL content:

- **Local**: Scenario where an identifier references information in the same OSCAL instance.  This scenario supports  “compile time” enforcement of constraints since the validity of the reference can be checked as soon as the SSP is authored.
- **Import-Profile**:  Scenario where an identifier references information in its imported profile.  This scenario can support “compile time” enforcement of constraints if there is access to the imported OSCAL profile.
- **Leveraged-Authorizations/Links**:  In this scenario where an OSCAL SSP has leveraged-authorization(s), some of the information in the leveraged SSP may be referenced (e.g., if the leveraged SSP is also in OSCAL format).  This scenario supports “runtime” validation of constraints since SSP author may or may not have access the leveraged system SSP to validate / enforce the referential integrity.  However, the authorizing official (AO) must ultimately validate any such links and references.
- **Component Definition (CDEF) Links**:  Scenario where an OSCAL SSP component has a reference to a component definition and/or references to a specific component within a component definition.  This scenario can support “compile time” enforcement of constraints if the component definition is available for validation.
- **Links**: Aside from OSCAL specific links such as Leveraged-Authorizations/link, general OSCAL links do not provide enough contextual information to know if the link target 1) is an OSCAL document and 2) what type of OSCAL model. Additionally, there is no assurance that SSP authors have access to linked OSCAL instances, so any references to content in external links cannot be validated.

### Reference Constraints

The following table summarizes constraints for identifier references in an OSCAL SSP:

| Reference | Target Scope | Target Element | Target ID Type | Referential Constraint Description |
| :-------- | :----------- | :------------: | :------------: | :--------------------------------- |
| [by-component/@component-uuid](/reference/latest/system-security-plan/xml-index/#/@control-id) | Local SSP, Leveraged-Authorization | Component | UUID | A single target component must be found in target SSP instance. Component must be defined in local SSP or leveraged SSP. |
| [implemented-component/@component-uuid](/reference/latest/system-security-plan/xml-index/#/@control-id) | Local SSP | Component | UUID | A single target component must be found in source. Implemented component references a single managed inventory item within a system.  This should exclude leveraged items since they are not managed by the leveraging system. |
| [implemented-requirement/@control-id](/reference/latest/system-security-plan/xml-index/#/@control-id) | Baseline (e.g., Import-Profile) | Control | Token | A single target control must be found in the baseline. |
| [inherited/@provided-uuid](/reference/latest/system-security-plan/xml-index/#/@provided-uuid) | Leveraged-Authorization | Export/<br/>Provided | UUID | A single target control must be found in the target. Pointer to control that is inherited from the leveraged system. |
| [leveraged-authorization/party-uuid](/reference/latest/system-security-plan/xml-index/#/party-uuid) | Leveraged-Authorization | Party | UUID | A single target party must be found in the target. Pointer to the party that manages the leveraged system. |
| [responsibility/@provided-uuid](/reference/latest/system-security-plan/xml-index/#/@provided-uuid) | Local SSP | Export/<br/>Responsibility | UUID | A single target control must be found in the source. Reference to a control, in the local SSP, that is exported as a customer responsibility for leveraging systems. |
| [responsible-party/@role-id](/reference/latest/system-security-plan/xml-index/#/@role-id) | Local SSP | Role | Token | A single target role must be found in the source. System-characteristics/responsible-party/@role-id and inventory-item\*/responsible-party/@role-id are points of reference, so it is appropriate to enforce a local constraint. |
| [responsible-party/party-uuid](/reference/latest/system-security-plan/xml-index/#/party-uuid) | Local SSP | Party | UUID | A single target party must be found in the source. System-characteristics/responsible-party/party-uuid and inventory-item\*/responsible-party/party-uid seem to be the points of reference, so seems appropriate to enforce a local constraint. |
| [responsible-role/@role-id](/reference/latest/system-security-plan/xml-index/#/@role-id) | Local SSP, Leveraged-Authorization | Role | Token | A single target role must be found the target. |
| [responsible-role/party-uuid](/reference/latest/system-security-plan/xml-index/#/party-uuid) | Local SSP, Leveraged-Authorization | Party | UUID         | A single target role must be found the target. |
| [set-parameter/@param-id](/reference/latest/system-security-plan/xml-index/#/@param-id) | Baseline (e.g., Import-Profile) | Param | Token | A single target param must be found in the baseline. |
| [statement/@statement-id](/reference/latest/system-security-plan/xml-index/#/@statement-id) | Baseline (e.g., Import-Profile) | Control/Part | Token | A single target part must be found in the baseline. |
| [user/role-id](/reference/latest/system-security-plan/xml-index/#/role-id) | Local SSP | Role | Token | A single target role must be found in the source. Role could be defined in local instance metadata. |

### Modeling Validation Information
OSCAL is designed to allow capture relevant details related to independent validation of components. See the [Validation Modeling](/learn/tutorials/validation-modeling/) tutorial for details.

## Content Examples

Multiple examples of SSP expressed using the OSCAL SSP model can be found in the OSCAL GitHub repository in [XML]({{< param "contentRepoPath" >}}/examples/ssp/xml),
[JSON]({{< param "contentRepoPath" >}}/examples/ssp/json),
and [YAML]({{< param "contentRepoPath" >}}/examples/ssp/yaml/) formats.

## Related Tutorials

The following tutorial is provided related to the catalog model.

- [Representing Test Validation Information](/learn/tutorials/validation-modeling/): Explains how to represent test validation information (e.g., FIPS-140-2) for a component in an OSCAL SSP.
