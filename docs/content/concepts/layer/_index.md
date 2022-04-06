---
title: Layers and Models
description: Provides details on the layers, models, and formats that comprise OSCAL. Concepts for each layer and model are discussed, and the semantics of each model and associated formats are defined.
suppresstopiclist: true
weight: 50
toc:
  enabled: true
sidenav:
  focusrenderdepth: 2
  activerenderdepth: 2
  inactiverenderdepth: 2
aliases:
  - /docs/model/ssp/
  - /learnmore/architecture/
  - /documentation/schema/
---

The OSCAL architecture is organized in a stack of *layers*. Each lower layer in the stack provides information structures that are referenced and used by each higher layer. Each layer is composed of one or more *models*, which represent a information structure supporting a specific operational purpose. Each model in OSCAL is intended to build on the information provided by the model(s) in the lower layers.

The following image depicts each layer and the corresponding model(s) for each layer.

{{<imagemap src="oscal-layers.svg" width="896" height="400" alt="OSCAL layers and models. The layers are listed (from top to bottom): Assessment, Implementation, and Control. The Assessment Layer is comprised of the Assessment Plan Model, Assessment Results Model, and the Plan of Action and Milestones (POA&M) Model. The Implementation Layer is comprised of the System Security Plan Model and the Component Model. The Control Layer is comprised of the Catalog Model and the Profile Model.">}}
  <!-- Assessment Layer -->
  {{<area alt="Plan of Action and Milestones Model" title="Plan of Action and Milestones Model" href="assessment/poam/" coords="193,8,890,33" shape="rect">}}
  {{<area alt="Assessment Results Model" title="Assessment Results Model" href="assessment/assessment-results/" coords="193,41,890,67" shape="rect">}}
  {{<area alt="Assessment Plan Model" title="Assessment Plan Model" href="assessment/assessment-plan/" coords="193,74,890,109" shape="rect">}}
  {{<area alt="Assessment Layer" title="Assessment Layer" href="assessment/" coords="0,0,896,151" shape="rect">}}

  <!-- Implementation Layer -->
  {{<area alt="System Security Plan" title="System Security Plan" href="implementation/ssp/" coords="194,168,890,214" shape="rect">}}
  {{<area alt="Component Definition" title="Component Definition" href="implementation/component-definition/" coords="193,219,890,247" shape="rect">}}
  {{<area alt="Implementation Layer" title="Implementation Layer" href="implementation/" coords="0,162,896,289" shape="rect">}}

  <!-- Control Layer -->
  {{<area alt="Profile Model" title="Profile Model" href="control/profile/" coords="193,307,890,347" shape="rect">}}
  {{<area alt="Catalog Model" title="Catalog Model" href="control/catalog/" coords="193,356,890,391" shape="rect">}}
  {{<area alt="Control Layer" title="Control Layer" href="control/" coords="0,300,896,400" shape="rect">}}
{{</imagemap>}}

Each OSCAL model is represented in multiple, machine-readable *formats* (e.g., XML, JSON, YAML), which provide a serialization and encoding mechanism for representing and exchanging OSCAL data, also referred to as *OSCAL content*.

Individual layers are summarized below, with links to additional layer and model information. There is also an [introduction to the OSCAL models](overview/), as well as information related to the [terminology](../terminology/) used in describing each model.

## The OSCAL Layers

The diagram above identifies the OSCAL layers from the bottom up because each higher layer relies on the layer beneath it. The following OSCAL layer discussion begins with the bottom layer in the diagram, addressing each in order moving toward the top of the diagram.

The OSCAL layers are:

- [Control Layer](#control-layer-overview)
- [Implementation Layer](#implementation-layer-overview)
- [Assessment Layer](#assessment-layer-overview)

### Control Layer Overview

Cybersecurity frameworks often define a set of **controls** intended to reduce the risk to a system. Framework authors typically organize these controls into a **catalog**.

Organizations and system owners identify which controls are applicable to a system, which may include controls from more than one catalog. These are often referred to as a **baseline** or *overlay*.

The OSCAL [Control Layer](control/) provides:

- The **[Catalog model](control/catalog/)** for expressing and organizing these controls in a standard, machine-readable format. Controls from any control-based framework can be expressed in an OSCAL catalog.

  The catalog model is the basis for all other OSCAL models. Controls used in any other OSCAL model must first be _defined_ in this model.

  Controls may include statements (requirement definitions), parameters, references, objectives, and assessment methods. The model also enables the controls to be organized.

- The **[Profile model](control/profile/)** for selecting, organizing, and tailoring a specific set of controls.

  A profile enables controls to be selected and tailored to express a baseline of controls. A control used in the implementation, assessment, and assessment results layers must first be imported by a profile.

  After importing a control, a profile may be used to tailor the control. This includes additions, changes, and removal of statements, parameters, control objective, and assessment actions.

  OSCAL profiles can import controls from catalogs or other OSCAL profiles, enabling the creation of a new baseline by customizing an existing baseline. This approach provides full transparency and traceability of control tailoring from a baseline back to the original catalog's control definition. Every control imported by a profile must originate within a catalog.

  Organizations already perform such selections manually. OSCAL profiles enable automation of control selection and tailoring while providing traceability.

### Implementation Layer Overview

The OSCAL [Implementation Layer](implementation/) focuses on the implementation of a system under a specific baseline as well as the individual components that may be incorporated into a system. A component is anything that can satisfy a control, such as a policy, process, compliance artifact (such as FIPS 140-2 validation), as well as hardware, software, and services.

The OSCAL [Implementation Layer](implementation/) provides:

- The **[System Security Plan (SSP) model](implementation/ssp/)** enables a system owner to express the security implementation of an information system within the context of a specific baseline (OSCAL profile).

  SSPs expressed in a machine-readable format can be easily imported into a tool, allowing for increased automation of SSP validation and authorization.

  An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

- The **[Component Definition model](implementation/component-definition/)** is intended to define information about an individual *component*, such that its contents can be imported into an OSCAL SSP.

  The model enables an organization or component creator to provide a description of the component and applicable security configuration information. It can also describe how a specific configuration satisfies the controls of an identified baseline. SSP authoring tools will be able to pre-populate significant portions of an SSP by importing this content and allowing it to be tailored to reflect the actual implementation within the system.

### Assessment Layer Overview

The OSCAL [Assessment Layer](assessment/) focuses on assessment activities, on communicating all assessment findings including supporting evidence, and identifying and managing the remediation of identified risks to a system identified as a result of assessment activities. This includes the ability to report all findings.

The assessment layer will be expanded in OSCAL 2.0 to support the automation of assessment activities.

Under OSCAL, assessments are always expressed in the context of a specific system implementation relative to a defined set of controls.
OSCAL supports both continuous assessment as well as traditional "snapshot in time" assessments.

The OSCAL [Assessment Layer](assessment/) provides:

- The **[Assessment Plan model](assessment/assessment-plan/)** allows assessment plan information to be described, including how and when a system assessment is intended to be performed, the scope of the assessment, and what assessment activities should be conducted.

- The **[Assessment Results model](assessment/assessment-results/)**, which represents information produced from a set of assessment activities, to include when the assessment was performed, the assessment scope, evidence collected during an assessment, and any assessment findings. The assessment model supports information from periodic and continuous assessments.

- The **[Plan of Action and Milestones (POA&M) model](assessment/poam/)**, which represents a set of findings for a periodic or continuous assessment that need to be addressed by the system owner/maintainers.

## Status of the OSCAL Layers

The OSCAL layers described above provide a framework for organizing the OSCAL models. As the OSCAL project [progresses](/contribute/roadmap/), the features of these models are expected to evolve and expand; the layer descriptions above are included here to indicate the current status of the related models within OSCAL and may not represent the final features supported by each layer and their corresponding model(s). XML, JSON, and YAML formats for each model will be provided when the model is released.

The OSCAL models above are in various states of readiness for release:

- **Future**: Additional models will be published as drafts in the future.
- **Early Access Draft**: Indicates that the model has been newly developed and released for review and comment, but has received little to no review. Multiple revisions will likely be needed to mature the model for release.
- **Draft**: Identifies that the model has received some review, but not enough review to be released as a final version. A revision or two might be needed to prepare the model for release.
- **Pre-Final**: The model is fairly stable and has been extensively reviewed. Some small changes might occur before final release, but the impact of these changes will be small to users or tool implementers.
- **Released**: The model has been released. Only non-backwards compatibility breaking changes will be made in maintenance releases.

The following is the release state of each model, along with download links for the latest versions of XML and JSON schema for each model. YAML is also supported through conversion between JSON and YAML. Since YAML is a superset of JSON, some YAML tooling allows JSON schema to be used for YAML validation. In this way, the provided JSON schema supports both JSON and YAML.

| Layer | Model | Current State | Reference | Schemas |
|:--- |:--- |:--- |:--- |:--- |
| [Control](control/) | [Catalog](control/catalog/) | Released | [XML, JSON, YAML](/reference/latest/catalog/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_catalog_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_catalog_schema.json) |
| [Control](control/) | [Profile](control/profile/) | Released | [XML, JSON, YAML](/reference/latest/profile/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_profile_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_profile_schema.json) |
| [Implementation](implementation/) | [Component Definition](implementation/component-definition/) | Released | [XML, JSON, YAML](/reference/latest/component-definition/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_component_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_component_schema.json) |
| [Implementation](implementation/) | [System Security Plan](implementation/ssp/) | Released | [XML, JSON, YAML](/reference/latest/system-security-plan/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_ssp_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_ssp_schema.json) |
| [Assessment](assessment/) | [Assessment Plan](assessment/assessment-plan/) | Released | [XML, JSON, YAML](/reference/latest/assessment-plan/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_assessment-plan_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_assessment-plan_schema.json) |
| [Assessment](assessment/) | [Assessment Results](assessment/assessment-results/) | Released | [XML, JSON, YAML](/reference/latest/assessment-results/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_assessment-results_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_assessment-results_schema.json) |
| [Assessment](assessment/) | [Plan of Action and Milestones](assessment/poam/) | Released | [XML, JSON, YAML](/reference/latest/plan-of-action-and-milestones/) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/xml/schema/oscal_poam_schema.xsd), [JSON/YAML](https://raw.githubusercontent.com/usnistgov/OSCAL/main/json/schema/oscal_poam_schema.json) |

## Well-formed Data and Valid OSCAL

[Per our guidance](validation/), OSCAL-enabled tools must check OSCAL document instances to ensure they are well-formed and valid based upon the models in these layers. 
