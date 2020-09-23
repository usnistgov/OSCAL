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

The diagram above identifies the OSCAL layers from the bottom up because each higher layer relies on the layer beneath it. The following OSCAL layer discussion begins with the bottom layer in the diagram and address each in order moving toward the top of the diagram: 
- Catalog layer
- Profile layer
- Implementation Layer
- Assessment Layer
- Assessment Results Layer

### Catalog Layer

Cybersecurity frameworks often define a set of **controls** intended to reduce the risk to a system. Framework authors typically organize these controls into a **catalog**. 

The [OSCAL catalog layer](catalog-layer/) provides a [model](catalog-layer/catalog/) for expressing and organizing these controls in a standard, machine-readable format. 
Controls from any control-based framework can be expressed in an OSCAL catalog.

#### The OSCAL catalog layer contains one model.

The **[catalog model](catalog-layer/catalog/)**. The catalog model is the basis for all other OSCAL models. Controls used in any other OSCAL model must first be _defined_ in this model.
Controls may include statements (requirement definitions), parameters, references, objectives, and assessment methods. The model also enables the controls to be organized.

### Profile Layer

Organizations and system owners identify which controls are applicable to a system, which may include controls from more than one framework. These are often referred to as a *baseline* or *overlay*.

The [OSCAL profile layer](profile-layer/) provides a [model](profile-layer/profile/) for selecting, organizing, and tailoring a specific set of controls.

#### The OSCAL profile layer contains one model.

The **[profile model](profile-layer/profile/)**. A profile enables controls to be selected and tailored to express a baseline of controls. A control used in the implementation, assessment, and assessment results layers must first be imported by a profile. 
After importing a control, a profile may be used to tailor the control. This includes additions, changes, and removal of statements, parameters, control objective, and assessment actions.

OSCAL profiles can import controls from catalogs or other OSCAL profiles, enabling the creation of a new baseline by customizing an existing baseline. This approach provides full transparency and traceability of control tailoring from a baseline back to the original catalog's control definition. Every control imported by a profile must originate within a catalog.

Organizations already perform such selections manually. OSCAL profiles enable automation of control selection and tailoring while providing tracablity.

### Implementation Layer

The [OSCAL implementation layer](implementation-layer/) focuses on the implementation of a system under a specific baseline as well as the individual components that may be incorporated into a system. A component is anything that can satisfy a control, such as a policy, process, compliance artifact (such as FIPS 140-2 validation), as well as hardware, software, and services.

#### The OSCAL implementation layer contains two models.

The **[system security plan (SSP) model](implementation-layer/ssp/)** enables a system owner to express the security implementation of an information system within the context of a specific baseline (OSCAL profile). 
SSPs expressed in a machine-readable format can be easily imported into a tool, allowing for increased automation of SSP validation and authorization. 
An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

The **[component definition model](implementation-layer/component/)** is intended to define information about an individual *component*, such that its contents can be imported into an OSCAL SSP.
The model enables an organization or component creator to provide a description of the component and applicable security configuration information. It can also describe how a specific configuration satisfies the controls of an identified baseline. SSP authoring tools will be able to pre-populate significant portions of an SSP by importing this content and allowing it to be tailored to reflect the actual implementation within the system.

### Assessment Layer

The [OSCAL assessment layer](assessment-layer/) focuses on assessment activities. Currently, only assessment planning is supported. 
The assessment layer will be expanded in OSCAL 2.0 to support the automation of assessment activities.

Under OSCAL, assessments are always expressed in the context of a specific system implementation relative to a defined set of controls.
OSCAL supports both continuous assessment as well as traditional "snapshot in time" assessments.

#### The OSCAL assessment layer contains one model.

The **[assessment plan model](assessment-layer/assessment-plan/)** allows assessment plan information to be described, including how and when a system assessment is intended to be performed, the scope of the assessment, and what assessment activities should be conducted.

### Assessment Results Layer

The [OSCAL assessment results layer](assessment-results-layer/) focuses on communicating all assessment findings including supporting evidence, as well identifying and managing the remediaiton of identified risks
 to a system identified as a result of activities in the assessment layer. 
This includes the ability to report all findings 

#### The OSCAL assessment results layer contains two models.

The **[assessment results model](assessment-results-layer/assessment-results/)**, which represents information produced from a set of assessment activities, to include when the assessment was performed, the assessment scope, evidence collected during an assessment, and any assessment findings. The assessment model supports information from periodic and continuous assessments.

The **[plan of action and milestones (POA&M) model](assessment-results-layer/poam/)**, which represents a set of findings for a periodic or continuous assessment that need to be addressed by the system owner/maintainers.

## Status of the OSCAL Layers

The OSCAL layers described above provide a framework for organizing the OSCAL models. As the OSCAL project [progresses](/contribute/roadmap/), the features of these models are expected to evolve and expand; the layer descriptions above are included here to indicate the current status of the related models within OSCAL and may not represent the final features supported by each layer and their corrisponding model(s). XML, JSON, and YAML formats for each model will be provided when the model is released.

The OSCAL models above are in various states of readiness for release:

- **Future**: Additional models will be published as drafts in the future.
- **Early Access Draft**: Indicates that the model has been newly developed and released for review and comment, but has received little to no review. Multiple revisions will likely be needed to mature the model for release.
- **Draft**: Identifies that the model has received some review, but not enough review to be released as a final version. A revision or two might be needed to prepare the model for release.
- **Pre-Final**: The model is fairly stable and has been extensively reviewed. Some small changes might occur before final release, but the impact of these changes will be small to users or tool implementers.
- **Released**: The model has been released. Only non-backwards compatibility breaking changes will be made in maintenance releases.

The following is the release state of each model, along with download links for the latest versions of XML and JSON schema for each model. YAML is also supported through conversion between JSON and YAML. Since YAML is a superset of JSON, some YAML tooling allows JSON schema to be used for YAML validation. In this way, the provided JSON schema supports both JSON and YAML.

| Layer | Model | Current State | Next [Milestone](/contribute/roadmap/) | Formats |
|:--- |:--- |:--- |:--- |:--- |
| Catalog | Catalog | Pre-Final | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_catalog_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_catalog_schema.json), YAML |
| Profile | Profile | Pre-Final | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_profile_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_profile_schema.json), YAML |
| Implementation | Component Definition | Draft | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_component_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_component_schema.json), YAML |
| Implementation | System Security Plan | Pre-Final | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_ssp_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_ssp_schema.json), YAML |
| Assessment | Assessment Plan | Draft | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-plan_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-plan_schema.json), YAML |
| Assessment Results | Assessment Results | Draft | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_assessment-results_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_assessment-results_schema.json), YAML |
| Assessment Results | Plan of Action and Milestones | Draft | Released (1.0.0 Final) | [XML](https://raw.githubusercontent.com/usnistgov/OSCAL/master/xml/schema/oscal_poam_schema.xsd), [JSON](https://raw.githubusercontent.com/usnistgov/OSCAL/master/json/schema/oscal_poam_schema.json), YAML |
