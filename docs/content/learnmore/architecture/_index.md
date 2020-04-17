---
title: The OSCAL Architecture
description: The OSCAL architecture is organized into a series of related layers.
weight: 60
aliases:
  - /docs/
---

The OSCAL architecture is organized in a series of *layers* depicted below from left to right. Each layer consists of a human-oriented documentation artifact depicted on the top, a statement of what organizations might do with this information in the middle, and a machine-oriented OSCAL *model* depicted along the bottom of the image that is capable of representing the information from the human-oriented documentation artifact on the top. Each model in OSCAL is intended to build on the information provided by the model in the previous layer to the left. Consequently, OSCAL is designed as a **documentary architecture** comprising several related document models, arranged in **layers**. OSCAL models are represented in machine readable formats (e.g., XML, JSON, YAML).

Together, these layers address the functional requirements as depicted in the following diagram:

{{<imagemap src="oscal-components.png" width="4350" height="1594" alt="oscal components">}}
  {{<area href="#catalog-layer" alt="Catalog Layer" title="Catalog Layer" shape="rect" coords="247,1221,1026,1548">}}
  {{<area href="#profile-layer" alt="Profile Layer" title="Profile Layer" shape="rect" coords="1034,1221,2151,1548" >}}
  {{<area href="#implementation-layer" alt="Implementation Layer" title="Implementation Layer" shape="rect" coords="2159,1221,2862,1548" >}}
  {{<area href="#assessment-layer" alt="Assessment Layer" title="Assessment Layer" shape="rect" coords="2873,1221,3614,1548" >}}
  {{<area href="#assessment-results-layer" alt="Assessment Results Layer" title="Assessment Results Layer" shape="rect" coords="3626,1221,4347,1548" >}}
{{</imagemap>}}

Starting from the left, the OSCAL layers are defined below.

## Catalog Layer

Privacy and security documentation today often discusses **controls** and **catalogs**. A [control](../concepts/control/) represents a security requirement, guideline, procedure or activity. A [control catalog](../concepts/catalog/) is an organized collection of controls. The [OSCAL catalog layer](/documentation/schema/catalog-layer/) provides a [model](/documentation/schema/catalog-layer/catalog/) to represent a control catalog.

Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to migrate across different types of documents for different purposes, while maintaining "identity" and referential integrity for traceability.

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.

## Profile Layer

The [OSCAL profile layer](/documentation/schema/profile-layer/) provides a [model](/documentation/schema/profile-layer/profile/) for selecting a specific set of security control requirements from one or more control catalogs. The term "[profile](../concepts/profile/)" in OSCAL is also called a *baseline* or *overlay* in other terminology. The OSCAL Profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements).

A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs. OSCAL Profiles can also be based on other OSCAL Profiles, allowing baselines to be established based on the customization of another baseline. This is something we see in the real world quite a bit.

In OSCAL, profiles are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

## Implementation Layer

The [OSCAL implementation layer](/documentation/schema/implementation-layer/) provides models for describing how controls are implemented in a specific system or in distributed component that can be incorporated into a system.

The OSCAL implementation layer defines two models:

1. The **[component definition model](/documentation/schema/implementation-layer/component/)**, which is currently under development, will allow for the definition of a set of *components* that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).

1. The **[system security plan (SSP) model](/documentation/schema/implementation-layer/ssp/)** that allows the security implementation of an information system to be defined based on an OSCAL profile (or baseline). SSPs expressed in a machine-readable format that can be easily imported into a tool, allowing for increased automation of SSP validation and system assessment. An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

## Assessment Layer

The [OSCAL assessment layer](/documentation/schema/assessment-layer/) supports structured, machine-readable assessment planning information. The **[assessment plan model](/documentation/schema/assessment-layer/assessment-plan/)** allows assessment plan information to be described, including how and when a system assessment is intended to be performed, the scope of the assessment, and what assessment activities should be conducted.

## Assessment Results Layer

The [OSCAL assessment results layer](/documentation/schema/assessment-results-layer/) provides models for representing specific artifacts related to conducting an assessment and capturing the assessment results and findings.

The OSCAL assessment layer defines two models:

1.  The **[assessment results model](/documentation/schema/assessment-results-layer/assessment-results/)**, which represents information produced from a set of assessment activities, to include when the assessment was performed, the assessment scope, evidence collected during an assessment, and any assessment findings. The assessment model supports information from periodic and continuous assessments.

1. The **[plan of action and milestones (POA&M) model](/documentation/schema/assessment-results-layer/poam/), which represents a set of findings for a periodic or continuous assessment that need to be addressed by the system owner/maintainers.

## Status of the OSCAL Layers

The OSCAL layers described above provide a high-level explanation of the OSCAL models. As the OSCAL project [progresses](/contribute/roadmap/), the features of these models are expected to evolve and expand; the layer descriptions above are included here to indicate the current status of the related models within OSCAL and may not represent the final features supported by each model. XML, JSON, and YAML formats for each model will be provided when the model is released.

The following is the release state of each model, along with download links for the latest versions of XML and JSON schema for each model. YAML is also supported through conversion between JSON and YAML. Since YAML is a superset of JSON, some YAML tooling allows JSON schema to be used for YAML validation. In this way, the provided JSON schema supports both JSON and YAML.

| Layer | Model | Current State ([Milestone](/contribute/roadmap/)) | Formats |
|:--- |:--- |:--- |:--- |
| Catalog | Catalog | Draft Released (1.0.0 M1); updated (1.0.0 M2) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_catalog_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_catalog_schema.json), YAML |
| Profile | Profile | Draft Released (1.0.0 M1); updated (1.0.0 M2) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_profile_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_profile_schema.json), YAML |
| Implementation | Component Definition | Under Development (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_component_schema.json), YAML |
| Implementation | System Security Plan | Draft Released (1.0.0 M2) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_ssp_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_ssp_schema.json), YAML |
| Assessment | Assessment Plan | Early Access Draft | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-plan_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-plan_schema.json), YAML |
| Assessment Results | Assessment Results | Early Access Draft | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-results_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-results_schema.json), YAML |
| Assessment Results | Plan of Action and Milestones | Early Access Draft | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_poam_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_poam_schema.json), YAML |
