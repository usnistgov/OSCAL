---
title: Layers and Models Reference
description: Provides details on the layers, models, and formats that comprise OSCAL. Concepts for each layer and model are discussed, and the semantics of each model and associated formats are defined.
weight: 50
sidenav:
  activerenderdepth: 1
aliases:
  - /docs/model/ssp/
sidenav:
  inactiverenderdepth: 1
---

OSCAL is comprised of a stack of layers, where each lower layer in the stack provides information structures that are referenced and used by each higher layer. Each layer is composed of one or more models, which represent a information structure supporting a specific operational purpose. Each model is defined in multiple formats.

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

The OSCAL models above are in various states of readiness for release:

- **Future**: Additional models will be published as drafts in the future.
- **Early Access Draft**: Indicates that the model has been newly developed and released for review and comment, but has received little to no review. Multiple revisions will likely be needed to mature the model for release.
- **Draft**: Identifies that the model has received some review, but not enough review to be released as a final version. A revision or two might be needed to prepare the model for release.
- **Pre-Final**: The model is fairly stable and has been extensively reviewed. Some small changes might occur before final release, but the impact of these changes will be small to users or tool implementers.
- **Released**: The model has been released. Only non-backwards compatibility breaking changes will be made in maintenance releases.

## Modeling Approach

The OSCAL project is modeling each OSCAL layer using a modeling framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema). This framework allows the OSCAL project to define each OSCAL **model** in a given OSCAL **layer**. The information domain of each model is defined using Metaschema, creating an *information model* for each OSCAL model. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON, YAML, or XML. The OSCAL project uses the Metaschema framework to produce these schemas supporting the XML, JSON, and YAML formats.

This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce the documentation in this section of the website for each OSCAL model as it applies to each format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.

## Model Formats and Schema

For each OSCAL model, the OSCAL project is supporting XML-, JSON-, and YAML-based formats. The following types of schemas are also provided, which support validation of content expressed in a specific model format:

- XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1) that describes an XML tag set for an OSCAL model.
- JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification.html) that describes a JSON data object for an OSCAL model.

YAML is also supported as an OSCAL format. Since YAML is a superset of JSON and many tools support YAML validation using JSON Schema, no YAML-specific schemas are provided. Thus, the JSON documentation for each model also provides documentation around the structures used in the YAML formats. In the future, we plan to extend our models with mappings to other formats as well. Support for additional formats will be driven based on [community feedback](/contribute/contact/).

The OSCAL project is also producing content converters that can convert OSCAL formatted data from one format to other supported formats. Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa. Many tools commodity tools exist to support converting between JSON and YAML. As a result, the OSCAL project does not provide any OSCAL-specific content converters for this purpose. Using a commodity JSON <-> YAML tool, you can convert XML content to JSON and then to YAML or YAML content to JSON and then to XML.

### Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

- **Simplicity and ease of use.** Every attempt is being made to use consistent data patterns and structures, and to reuse constructs across all OSCAL models. By establishing a set of "OSCAL-isms", common OSCAL data patterns, the models become more consistent and easier to use. This also helps to reduce the variability in the OSCAL models, keeping them simple.
- **Relevance for typical producers.** The design of the OSCAL models incorporates the use of progressive features. A basic set of features can be used that mirror the degree of data currently provided in spreadsheets and documents pertaining to system implementations and assessment artifacts. This also supports simple, ease use of OSCAL. Additional optional features are provided that allow for more granular data. This approach allows the use of OSCAL based on data that is available today, while providing a path forward for a richer set of data in the future that enables the greater automation of processes.
- **Adaptability and extensibility.** The sample schemas are designed to allow users and designers of applications to introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.
