---
title: System Security Plan Model (SSP)
heading: "OSCAL Implementation Layer: System Security Plan (SSP) Model"
description: XML and JSON format documentation for the OSCAL System Security Plan (SSP) model, which is part of the OSCAL implementation layer in the OSCAL [architecture]](/learnmore/architecture/). These formats model the control implementation of an information system.
weight: 55
aliases:
  - /documentation/schema/ssp/
---

| SSP Schema | SSP Converters 
|:--- |:--- |
| [XML Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_ssp_schema.xsd) | [JSON to XML Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/convert/oscal_ssp_json-to-xml-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/master/xml#converting-oscal-json-content-to-xml)) |
| [JSON Schema](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_ssp_schema.json) | [XML to JSON Converter](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/convert/oscal_ssp_xml-to-json-converter.xsl)<br />([How do I use this?](https://github.com/usnistgov/OSCAL/tree/master/json#converting-oscal-xml-content-to-json)) |

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
- **Import Profile**: Identifies the applicable control baseline for the system. This baseline is represented as an OSCAL [profile](../../profile-layer/profile/).
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

{{<partial "note-to-developers-uuid.html" >}}

### Modeling Validation Information
OSCAL is designed to allow capture relevant details related to independent validation of components. See [Validation Modeling](../validation-modeling) for details.

## Content Examples

Multiple examples of SSP expressed using the OSCAL SSP model can be found in the OSCAL GitHub repository in [XML]({{< param "contentRepoPath" >}}/examples/ssp/xml), 
[JSON]({{< param "contentRepoPath" >}}/examples/ssp/json),
and [YAML]({{< param "contentRepoPath" >}}/examples/ssp/yaml/) formats.
