---
title: Schema Reference
description: OSCAL Schema Reference
weight: 50
sidenav:
  activerenderdepth: 2
  inactiverenderdepth: 2
---

The OSCAL project is developing each OSCAL [layer](/learnmore/architecture/) as one or more models, which are each defined in multiple formats. The following image dipicts each layer and the corresponding model(s) for each layer.

{{<imagemap src="oscal-layers.png" width="932" height="589" alt="oscal layers and models">}}
  {{<area href="catalog/" alt="Catalog Model" title="Catalog Model" shape="rect" coords="195,500,896,571">}}
  {{<area href="/learnmore/architecture/#catalog-layer" alt="Catalog Layer" title="Catalog Layer" shape="rect" coords="3,484,932,588">}}
  {{<area href="profile/" alt="Profile Model" title="Profile Model" shape="rect" coords="196,388,895,462">}}
  {{<area href="/learnmore/architecture/#profile-layer" alt="Profile Layer" title="Profile Layer" shape="rect" coords="4,370,932,477">}}
  {{<area href="component/" alt="Component Model" title="Component Model" shape="rect" coords="197,316,894,349">}}
  {{<area href="ssp/" alt="System Security Plan Model" title="System Security Plan Model" shape="rect" coords="198,239,894,309">}}
  {{<area href="/learnmore/architecture/#implementation-layer" alt="Implementation Layer" title="Implementation Layer" shape="rect" coords="3,222,932,366">}}
  {{<area href="/learnmore/architecture/#assessment-layer" alt="Assessment Layer" title="Assessment Layer" shape="rect" coords="4,111,932,217">}}
  {{<area href="/learnmore/architecture/#assessment-results-layer" alt="Assessment Results Layer" title="Assessment Results Layer" shape="rect" coords="3,0,932,105">}}
{{</imagemap>}}

For each model, the OSCAL project is producing the following types of schemas:

* XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1) that describes an XML tag set for an OSCAL model.
* JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification.html) that describes a JSON data object for an OSCAL model.

The OSCAL project is also producing converters that can convert OSCAL formatted data in one format to other supported formats. Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa.

In the future, we plan to extend our models with mappings to other formats as well. As a superset of JSON, YAML syntax is an attractive candidate. Once we have demonstrated that the models themselves are adequate to the data, many more things become possible.

## Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

* Simplicity and ease of use.
* Relevance for typical producers.
* Extensibility. The sample schemas are designed for adaptability and extensibility. In ordinary cases, users and designers of applications can introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.

## Modeling Approach

The OSCAL project is modeling each OSCAL [layer](/learnmore/architecture/) using a framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/master/src/metaschema). This framework allows the OSCAL project to model each OSCAL **layer** based on the information needs of the OSCAL **model**, creating an *information model* for each OSCAL layer. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON or XML. The OSCAL project uses the Metaschema framework to produce these schemas.

This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce the documentation in this section of the website for each OSCAL model as it applies to each format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.
