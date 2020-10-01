---
title: OSCAL Model Overview
heading: Introduction to the OSCAL Models
description: Reviews OSCAL modeling concepts, and discusses the supported OSCAL formats and related validation mechanisms.
weight: 10
sidenav:
    title: OSCAL Model Overview
---

OSCAL is organized in a series of **layers** that each provide a set of **models**.

A model represents a information structure supporting a specific operational purpose or concept.

Each model is comprised of information structures that form an **information model** for each OSCAL model. This information model is then bound to multiple serialization formats (i.e., XML, JSON, YAML), which represent a concrete *data model*. Thus, a **data model** that defines how to represent an OSCAL *information model* in a serialized format. While the syntax of each format differs, all formats for a given model represent the same set of information, or *information model*. OSCAL content expressed in one of the supported formats can be translated into any one of the alternate formats without data loss.

## Model Formats and Schema

For each OSCAL model, the OSCAL project is supporting XML-, JSON-, and YAML-based formats. The following types of schemas are also provided, which support validation of content expressed in a specific model format:

- XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1) that describes an XML tag set for an OSCAL model.
- JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification-links.html#draft-7) that describes a JSON data object for an OSCAL model.

YAML is also supported as an OSCAL format. Since YAML is a superset of JSON and many tools support YAML validation using JSON Schema, no YAML-specific schemas are provided. Thus, the JSON documentation for each model also provides documentation around the structures used in the YAML formats. In the future, we plan to extend our models with mappings to other formats as well. Support for additional formats will be driven based on [community feedback](/contribute/contact/).

The OSCAL project is also producing content converters that can convert OSCAL formatted data from one format to other supported formats. Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa. Many tools commodity tools exist to support converting between JSON and YAML. As a result, the OSCAL project does not provide any OSCAL-specific content converters for this purpose. Using a commodity JSON <-> YAML tool, you can convert XML content to JSON and then to YAML or YAML content to JSON and then to XML.

### Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

- **Simplicity and ease of use.** Every attempt is being made to use consistent data patterns and structures, and to reuse constructs across all OSCAL models. By establishing a set of "OSCAL-isms", common OSCAL data patterns, the models become more consistent and easier to use. This also helps to reduce the variability in the OSCAL models, keeping them simple.
- **Relevance for typical producers.** The design of the OSCAL models incorporates the use of progressive features. A basic set of features can be used that mirror the degree of data currently provided in spreadsheets and documents pertaining to system implementations and assessment artifacts. This supports simple and easy use of OSCAL based on data that is available today. Additional optional features are provided that allow for more granular data, providing a path forward that enables the greater automation of processes.
- **Adaptability and extensibility.** The sample schemas are designed to allow users and designers of applications to introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.

### Modeling Approach

The OSCAL project is modeling each OSCAL layer using a modeling framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema). As described above, this framework allows the OSCAL project to define each OSCAL **model** in a given OSCAL **layer**. The information domain of each model is defined using Metaschema, creating an *information model* for each OSCAL model. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON, YAML, or XML. The OSCAL project uses the Metaschema framework to produce these schemas supporting the XML, JSON, and YAML formats.

This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce the documentation in this section of the website for each OSCAL model as it applies to each format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.