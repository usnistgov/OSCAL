---
title: The OSCAL Architecture
description: The OSCAL Architecture
permalink: /docs/

layout: post
topnav: architecture
sidenav: architecture
subnav:
  - text: Control
    href: /docs/control/
  - text: Catalog
    href: /docs/catalog/
  - text: Profile
    href: /docs/profile/
sticky_sidenav: true
---

The OSCAL architecture is organized in a series of *layers* depicted below from left to right. Each layer consists of a human-oriented documentation artifact depicted on the top, a statement of what organizations might do with this information in the middle, and a machine-oriented OSCAL *model* depicted along the bottom of the image that is capable of representing the information from the human-oriented documentation artifact on the top. Each model in OSCAL is intended to build on the information provided by the model in the previous layer. Consequently, OSCAL is designed as a **documentary architecture** comprising several related document models, arranged in **layers**. OSCAL models are represented in machine readable formats (e.g., XML, JSON).

Together, these models (partially) address the functional requirements as depicted in the following diagram:

<img src="{{ site.baseurl }}/assets/img/oscal-components.png" alt="oscal components" width="800" />

Starting from the left, the OSCAL layers are currently defined as:

- **Catalog:** In OSCAL, or any security documentation using current best practices, is all about **controls** and **catalogs**. A [control](control) represents a security requirement, guideline, procedure or activity. A [catalog](catalog) is an organized collection of controls.

  Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to migrate across different types of documents for different purposes, while maintaining "identity" and referential integrity for traceability.

  Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.

- **Profile:** The profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.

  In particular, the design of the OSCAL Profile layer, in relation to the Catalog layer, reflects the use of control catalogs as outlined in NIST SP800-53 -- specifically the concept of *baselines* and *overlays* over a base catalog. And then, as we see in the real world, overlays on the overlays. In OSCAL, [profiles](profile) are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

- **Implementation:** Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.

- **Implementation:** The OSCAL implementation layer consists of two models: The component definition (planned) and the system security plan (SSP).

  The *component definition* model, which is currently under development, will allow for the definition of a set of *components* that each provide structured information about a distinct hardware, software or services offering; or specific policy, proceedure, or compliance artifact.

  Each defined component describes where appropriate:

  - Information about the organization that provides, developes, and manages the thing described by the component;
  - Characteristics of the component, such as its name, version, model, last-modified date, etc;
  - Details about the controls that could be satisfied by the component;
  - Configuration options for achieving specific security or privacy objectives; and
  - Assessment tests or scripts that may be used to validate the component's implementation.

  The component definition model will also allow grouping related components into capabilities, and documenting how the combination of components in a capability together could satisfy specific controls that are not fully satisfied by a single component on its own.

  A component can be used to document and share: 1) proof of compliance for a secuirty requirement for hardware or software, such as FIPS 140-2 validated cryptography, 2) to document information about how a hardware, software, or service offering supports specific security or privacy controls, or 3) demonstrate how a policy or proceedure implements a given set of security or privacy controls. These component definitions can be used by organizations implementing the things defined by the component to provide a significant amount of details needed when documenting a systems security and privacy control implemention in a system security plan.

  The SSP model, which has been released as a draft, enables full modeling of highly granular SSP content, including points of contact, system characteristics, and control satisfaction descriptions. At a more detailed level, this includes the system's authorization boundary, information types and categorization, inventory, and attachments. In terms of control satisfaction, it models control parameter values, responsible roles, implementation status, control origination, and a description of control satisfaction at a level of the granularity down to a specific control statement. Control satisfaction can be defined for the system as a whole or for individual implemented components.

  The component and SSP models are designed to work together. As specific components are selected for use within a system, the content of the relevant component definition files inform and populate the use of these components within the SSP model. The SSP model can also be used to represent systems that do not define information at the granularity of a specific compoent, where component definitions do not exist.

- **Assessment:** Is a planned model that will describe how a system assessment is to be performed.
- **Assessment Results:** Is a planned model that will record the findings of a specific assessment.

The OSCAL layers described above provide a high-level explanation of the OSCAL models. As the project [progresses]({{ site.baseurl }}/learnmore/roadmap/), the features of these models are expected to evolve; these layer descriptions are included here to indicate the current status of the related models within OSCAL and may not the represent the final features supported by each model. XML, JSON, and YAML formats for each model will be provided when the model is released.

The following is the release state of each model, along with download links for the latest versions of schema for each model in XML and JSON formats. YAML is also supported through conversion between JSON and YAML, but YAML schemas are not yet provided because a suffecient YAML schema language has not been identified.

| Layer | Model | State ([Milestone]({{ site.baseurl }}/learnmore/roadmap/)) | Formats |
|:--- |:--- |:--- |:--- |
| Catalog | Catalog | Draft Released (1.0.0 M1) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_catalog_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_catalog_schema.json), YAML |
| Profile | Profile | Draft Released (1.0.0 M1) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_profile_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_profile_schema.json), YAML |
| Implementation | Component Definition | Under Development (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_component_schema.json), YAML |
| Implementation | System Security Plan | Draft Released (1.0.0 M2) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_ssp_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_ssp_schema.json), YAML |
| Assessment | Assessment Plan | Planned (2.0.0) | XML, JSON, YAML |
| Assessment Results | Assessment Results | Planned (2.0.0) | XML, JSON, YAML |
