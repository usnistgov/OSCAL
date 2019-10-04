---
title: Schema Reference
description: OSCAL Schema Reference
weight: 50
---

The OSCAL project is modeling each OSCAL [layer](https://pages.nist.gov/OSCAL/docs/) using a framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema). This framework allows the OSCAL project to model each OSCAL **layer** based on the information needs of the OSCAL **model**, creating an *information model* for each OSCAL layer. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON or XML. The OSCAL project uses the Metaschema framework to produce these schemas. This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce documentation for each OSCAL model as it applies to each format.

The OSCAL project is producing the following types of schemas:

* XML Schema based on the <a href="https://www.w3.org/TR/xmlschema11-1" data-proofer-ignore="yes">XML Schema Definition Language (XSD) 1.1</a> that describes an XML tag set for an OSCAL model
* JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification.html) that describes a JSON data object for an OSCAL model

Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa. Accordingly we can produce not only the models and their documentation, but also tools for converting data sets in the respective formats into equivalents in the other format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.

In the future, we plan to extend our models with mappings to other formats as well. As a superset of JSON, YAML syntax is an attractive candidate. Once we have demonstrated that the models themselves are adequate to the data, many more things become possible.

### Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

* Simplicity and ease of use.
* Relevance for typical producers.
* Extensibility. The sample schemas are designed for adaptability and extensibility. In ordinary cases, users and designers of applications can introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.
