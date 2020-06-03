---
title: Layers and Models Reference
description: Provides details on the layers, models, and formats that comprise OSCAL. Concepts for each layer and model are discussed, and the semantics of each model and associated formats are defined.
weight: 50
aliases:
  - /docs/model/ssp/
  - /learnmore/architecture/
sidenav:
  activerenderdepth: 1
  inactiverenderdepth: 1
---

The OSCAL architecture is organized in a stack of *layers*. Each lower layer in the stack provides information structures that are referenced and used by each higher layer. Each layer is composed of one or more *models*, which represent a information structure supporting a specific operational purpose. Each model in OSCAL is intended to build on the information provided by the model(s) in the lower layers.

The following image depicts each layer and the corresponding model(s) for each layer.

{{<imagemap src="oscal-layers.png" width="1864" height="1176" alt="OSCAL layers and models. The layers are listed (from top to bottom): Assessment Results, Assessment, Implementation, Profile, and Catalog. The Assessment Layer is comprised of the Assessment Results Model (Early Access Draft) and the Plan of Action and Milestones (POA&M) Model (Early Access Draft). The Assessment Layer is comprised of the Assessment Plan Model (Early Access Draft). The Implementation Layer is comprised of the System Security Plan model (Draft) and the Component Model  (Early Access Draft). The Profile Layer is comprised of the Profile Model (Draft). The Catalog Layer is comprised of the Catalog Model (Draft).">}}
  {{<area href="catalog-layer/catalog/" alt="Catalog Model" title="Catalog Model" shape="rect" coords="399,1005,1789,1137">}}
  {{<area href="catalog-layer/" alt="Catalog Layer" title="Catalog Layer" shape="rect" coords="14,972,1858,1171">}}
  {{<area href="profile-layer/profile/" alt="Profile Model" title="Profile Model" shape="rect" coords="397,778,1787,916">}}
  {{<area href="profile-layer/" alt="Profile Layer" title="Profile Layer" shape="rect" coords="15,750,1858,949">}}
  {{<area href="implementation-layer/ssp/" alt="System Security Plan Model" title="System Security Plan Model" shape="rect" coords="399,469,1787,556">}}
  {{<area href="implementation-layer/component/" alt="Component Model" title="Component Model" shape="rect" coords="400,576,1787,630">}}
  {{<area href="implementation-layer/" alt="Implementation Layer" title="Implementation Layer" shape="rect" coords="14,449,1858,720">}}
  {{<area href="assessment-layer/assessment-plan/" alt="Assessment Plan Model" title="Assessment Plan Model" shape="rect" coords="399,245,1787,340">}}
  {{<area href="assessment-layer/" alt="Assessment Layer" title="Assessment Layer" shape="rect" coords="14,225,1858,426">}}
  {{<area href="assessment-results-layer/assessment-results/" alt="Assessment Results Model" title="Assessment Results Model" shape="rect" coords="400,12,1785,63">}}
  {{<area href="assessment-results-layer/poam/" alt="Plan of Actions and Milestones Model" title="Plan of Actions and Milestones Model" shape="rect" coords="399,77,1785,125">}}
  {{<area href="assessment-results-layer/" alt="Assessment Results Layer" title="Assessment Results Layer" shape="rect" coords="17,3,1858,201">}}
{{</imagemap>}}

Each OSCAL model is represented in multiple, machine readable *formats* (e.g., XML, JSON, YAML), which provide a serialization and encoding mechanism for representing and exchanging OSCAL data, also referred to as *OSCAL content*.

## The OSCAL Layers

The following layers are defined in the OSCAL architecture, which are listed from the bottom up.

### Catalog Layer

Privacy and security documentation often discusses **controls** and **catalogs**. A *control* represents a requirement, guideline, procedure or activity, which when implemented will reduce an aspect of information system related risk. A control catalog is an organized collection of controls. These concepts are addressed by the [OSCAL catalog layer](catalog-layer/), which provides a [catalog model](catalog-layer/catalog/) who's information structures allow a control catalog and it's collection of controls to be represented in a structured, machine readable form.

### Profile Layer

The [OSCAL profile layer](profile-layer/) provides a [model](profile-layer/profile/) for selecting a specific set of security control requirements from one or more control catalogs. The term "profile" in OSCAL is also called a *baseline* or *overlay* in other terminology. The OSCAL Profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements).

A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs. OSCAL Profiles can also be based on other OSCAL Profiles, allowing baselines to be established based on the customization of another baseline. This is something we see in the real world quite a bit.

In OSCAL, profiles are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

### Implementation Layer

The [OSCAL implementation layer](implementation-layer/) provides models for describing how controls are implemented in a specific system or in distributed component that can be incorporated into a system.

The OSCAL implementation layer defines two models:

1. The **[component definition model](implementation-layer/component/)**, which is currently under development, will allow for the definition of a set of *components* that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).

1. The **[system security plan (SSP) model](implementation-layer/ssp/)** that allows the security implementation of an information system to be defined based on an OSCAL profile (or baseline). SSPs expressed in a machine-readable format that can be easily imported into a tool, allowing for increased automation of SSP validation and system assessment. An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

### Assessment Layer

The [OSCAL assessment layer](assessment-layer/) supports structured, machine-readable assessment planning information. The **[assessment plan model](assessment-layer/assessment-plan/)** allows assessment plan information to be described, including how and when a system assessment is intended to be performed, the scope of the assessment, and what assessment activities should be conducted.

### Assessment Results Layer

The [OSCAL assessment results layer](assessment-results-layer/) provides models for representing specific artifacts related to conducting an assessment and capturing the assessment results and findings.

The OSCAL assessment layer defines two models:

1.  The **[assessment results model](assessment-results-layer/assessment-results/)**, which represents information produced from a set of assessment activities, to include when the assessment was performed, the assessment scope, evidence collected during an assessment, and any assessment findings. The assessment model supports information from periodic and continuous assessments.

1. The **[plan of action and milestones (POA&M) model](assessment-results-layer/poam/)**, which represents a set of findings for a periodic or continuous assessment that need to be addressed by the system owner/maintainers.

## Status of the OSCAL Layers

The OSCAL layers described above provide a high-level explanation of the OSCAL models. As the OSCAL project [progresses](/contribute/roadmap/), the features of these models are expected to evolve and expand; the layer descriptions above are included here to indicate the current status of the related models within OSCAL and may not represent the final features supported by each model. XML, JSON, and YAML formats for each model will be provided when the model is released.

The OSCAL models above are in various states of readiness for release:

- **Future**: Additional models will be published as drafts in the future.
- **Early Access Draft**: Indicates that the model has been newly developed and released for review and comment, but has received little to no review. Multiple revisions will likely be needed to mature the model for release.
- **Draft**: Identifies that the model has received some review, but not enough review to be released as a final version. A revision or two might be needed to prepare the model for release.
- **Pre-Final**: The model is fairly stable and has been extensively reviewed. Some small changes might occur before final release, but the impact of these changes will be small to users or tool implementers.
- **Released**: The model has been released. Only non-backwards compatibility breaking changes will be made in maintenance releases.

The following is the release state of each model, along with download links for the latest versions of XML and JSON schema for each model. YAML is also supported through conversion between JSON and YAML. Since YAML is a superset of JSON, some YAML tooling allows JSON schema to be used for YAML validation. In this way, the provided JSON schema supports both JSON and YAML.

| Layer | Model | Current State | Next [Milestone](/contribute/roadmap/) | Formats |
|:--- |:--- |:--- |:--- |:--- |
| Catalog | Catalog | Draft | Pre-Final (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_catalog_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_catalog_schema.json), YAML |
| Profile | Profile | Draft | Pre-Final (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_profile_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_profile_schema.json), YAML |
| Implementation | Component Definition | Early Access Draft | Draft (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_component_schema.json), YAML |
| Implementation | System Security Plan | Draft | Pre-Final (1.0.0 M3) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_ssp_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_ssp_schema.json), YAML |
| Assessment | Assessment Plan | Early Access Draft | Draft (1.0.0 FINAL) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-plan_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-plan_schema.json), YAML |
| Assessment Results | Assessment Results | Early Access Draft | Draft (1.0.0 FINAL) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-results_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-results_schema.json), YAML |
| Assessment Results | Plan of Action and Milestones | Early Access Draft | Draft (1.0.0 FINAL) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_poam_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_poam_schema.json), YAML |
