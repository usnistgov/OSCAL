---
title: OSCAL Layers and Models Reference
description: OSCAL Schema Reference
weight: 50
sidenav:
  activerenderdepth: 2
  inactiverenderdepth: 2
aliases:
  - /docs/model/ssp/
---

The OSCAL project is developing each OSCAL [layer](/learnmore/architecture/) as one or more models, which are each defined in multiple formats. The following image dipicts each layer and the corresponding model(s) for each layer.

{{<imagemap src="oscal-layers.png" width="1864" height="1176" alt="oscal layers and models">}}
  {{<area href="catalog-layer/catalog/" alt="Catalog Model" title="Catalog Model" shape="rect" coords="399,1005,1789,1137">}}
  {{<area href="catalog-layer/" alt="Catalog Layer" title="Catalog Layer" shape="rect" coords="14,972,1858,1171">}}
  {{<area href="profile-layer/profile/" alt="Profile Model" title="Profile Model" shape="rect" coords="397,778,1787,916">}}
  {{<area href="profile-layer/" alt="Profile Layer" title="Profile Layer" shape="rect" coords="15,750,1858,949">}}
  {{<area href="implementation-layer/component/" alt="Component Model" title="Component Model" shape="rect" coords="397,630,1787,688">}}
  {{<area href="implementation-layer/ssp/" alt="System Security Plan Model" title="System Security Plan Model" shape="rect" coords="399,479,1787,610">}}
  {{<area href="implementation-layer/" alt="Implementation Layer" title="Implementation Layer" shape="rect" coords="14,449,1858,720">}}
  {{<area href="assessment-layer/assessment-plan/" alt="Assessment Plan Model" title="Assessment Plan Model" shape="rect" coords="399,245,1787,340">}}
  {{<area href="assessment-layer/" alt="Assessment Layer" title="Assessment Layer" shape="rect" coords="14,225,1858,426">}}
  {{<area href="assessment-results-layer/assessment-results/" alt="Assessment Results Model" title="Assessment Results Model" shape="rect" coords="400,12,1785,63">}}
  {{<area href="assessment-results-layer/poam/" alt="Plan of Actions and Milestones Model" title="Plan of Actions and Milestones Model" shape="rect" coords="399,77,1785,125">}}
  {{<area href="assessment-results-layer/" alt="Assessment Results Layer" title="Assessment Results Layer" shape="rect" coords="17,3,1858,201">}}
{{</imagemap>}}

For each model, the OSCAL project is producing the following types of schemas:

- XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1) that describes an XML tag set for an OSCAL model.
- JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification.html) that describes a JSON data object for an OSCAL model.

YAML is also supported as an OSCAL format. Since YAML is a superset of JSON and many tools support YAML validation using JSON Schema, no YAML-specific schemas are provided. Thus, the JSON documentation for each model also provides documentation around the structures used in the YAML formats. In the future, we plan to extend our models with mappings to other formats as well. Support for additional formats will be driven based on [community feedback](/contribute/contact/).

The OSCAL project is also producing content converters that can convert OSCAL formatted data from one format to other supported formats. Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa.

As a superset of JSON, YAML syntax is an attractive candidate. Once we have demonstrated that the models themselves are adequate to the data, many more things become possible.

## Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

- **Simplicity and ease of use.** Every attempt is being made to use consistent data patterns and structures, and to reuse constructs across all OSCAL models. By establishing a set of "OSCAL-isms", common OSCAL data patterns, the models become more consistent and easier to use. This also helps to reduce the variability in the OSCAL models, keeping them simple.
- **Relevance for typical producers.** The design of the OSCAL models incorporates the use of progressive features. A basic set of features can be used that mirror the degree of data currently provided in spreadsheets and documents pertaining to system implementations and assessment artifacts. This also supports simple, ease use of OSCAL. Additional optional features are provided that allow for more granular data. This approach allows the use of OSCAL based on data that is available today, while providing a path forward for a richer set of data in the future that enables the greater automation of processes.
- **Adaptability and extensibility.** The sample schemas are designed to allow users and designers of applications to introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.

## Modeling Approach

The OSCAL project is modeling each OSCAL [layer](/learnmore/architecture/) using a framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema). This framework allows the OSCAL project to define each OSCAL **model** in a given OSCAL **layer**. The information domain of each model is defined using Metaschema, creating an *information model* for each OSCAL model. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON, YAML, or XML. The OSCAL project uses the Metaschema framework to produce these schemas supporting the XML, JSON, and YAML formats.

This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce the documentation in this section of the website for each OSCAL model as it applies to each format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.
