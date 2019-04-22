---
title: Schema Reference
description: OSCAL Schema Reference
permalink: /docs/schemas/
layout: post
topnav: schemareference
sidenav: schemas
sticky_sidenav: true
---

## About the schemas

Each OSCAL **model** comes with an XSD (W3C XML Schema) and a corresponding JSON Schema.

### XML and/or JSON

The OSCAL project is producing schemas to describe and validate data in two formats, XML and JSON. These are produced within a framework that provides for semantic unification in the form of a metamodel, which is subsequently processed and written out into two different expressions:

* An XSD (W3C XML Schema) that describes an XML tag set
* A JSON Schema (v7) that describes a JSON data object

XML documents that are conformant (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, according to a mapping provided by the metamodel, and vice versa. Accordingly we can produce not only the models and their documentation, but also tools for converting data sets in the respective formats into their "opposites".

In addition to the improved control over modeling and documentation this architecture gives us, this enables OSCAL to serve the needs of developers who use either or both formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent data model.

In future, we plan to extend our models with mappings to other formats as well. As a superset of JSON, YAML syntax is an attractive candidate, as is a Markdown application. Once we have demonstrated that the models themselves are adequate to the data, many more things become possible.

### Design principles for the schemas
The sample schemas have been created with the following design principles in mind:

- Simplicity and ease of use.
- Relevance for typical producers.
- Extensibility. The sample schemas are designed for adaptability and extensibility. In ordinary cases, users and designers of application can introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.


### Schema documentation

Find documentation for each of the models linked on the left.

Additionally, a separate page describes the 
[OSCAL Prose Model](/docs/schemas/oscal-prose/), which is shared by each of the component models.
