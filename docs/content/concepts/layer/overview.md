---
title: Model Overview
heading: Introduction to the OSCAL Models
description: Reviews OSCAL modeling concepts, and discusses the supported OSCAL formats and related validation mechanisms.
weight: 10
toc:
  enabled: true
sidenav:
    title: OSCAL Model Overview
aliases:
  - /documentation/schema/model-concepts/
  - /documentation/schema/overview/
---

OSCAL is organized in a series of **layers** that each provide a set of **models**.

A model represents a information structure supporting a specific operational purpose or concept.

Each model is comprised of information structures that form an **information model** for each OSCAL model. This information model is then bound to multiple serialization formats (i.e., XML, JSON, YAML), which represent a concrete *data model*. Thus, a **data model** that defines how to represent an OSCAL *information model* in a serialized format. While the syntax of each format differs, all formats for a given model represent the same set of information, or *information model*. OSCAL content expressed in one of the supported formats can be translated into any one of the alternate formats without data loss.

## General Model Organization

All OSCAL models share:

- a common high-level structure; and
- many common constructs that are reused across the models.

Every OSCAL file must have a minimum set of required fields and assemblies, and must follow the [core OSCAL syntax](../).

### Common High-Level Structure

Every OSCAL model includes a required metadata section, optional back-matter section, and model-specific body.

{{% usa-grid-container class="padding-x-0" %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="grid-col-fill" %}}
An OSCAL file is organized as follows:
- **Root Element**: The root element of the document indicates the type of content within the body of the file. The name of this element is unique to the specific model.

- **UUID**: A [RFC 4122](https://tools.ietf.org/html/rfc4122) Version 4 Universally Unique Identifier (UUID) that identifies a specific document instance. **This document-level UUID must be changed every time the content of the document is modified.**

- **Metadata**: Every OSCAL document must have a metadata section, which must include a title, last-modified timestamp, and OSCAL syntax version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.

- **Model-specific Body**: The body of an OSCAL file is different for each model.

- **Back Matter**: The back matter syntax is identical in all OSCAL models. It is used for linked and attached resources, which may contain citations. A back matter resource can be used to associate graphics, supporting documentation, etc. with the OSCAL document. Tool developers and content authors are encouraged to associate content here and reference it from within the body of an OSCAL document.

{{% /usa-grid-column %}}
{{% usa-grid-column class="grid-col-auto" %}}
{{<figure src="../OSCAL-file.svg" alt="A diagram representing the general layout of any OSCAL document, showing the following information. A root element, a metadata section, a model-specific section, and a back-matter section." class="maxw-full margin-top-0">}}
{{% /usa-grid-column %}}
{{% /usa-grid-row %}}
{{% /usa-grid-container %}}

<p />
{{<partialCached "note-to-developers-uuid.html" >}}

### Identifier Use

Subjects within OSCAL content are singled out using unique identifiers, which are critical to defining relationships between different pieces of OSCAL content.

The OSCAL models make use of three types of identifiers:

1. Human readable identifiers [`id`], typical a canonical identifier; and
2. An RFC-4122 Version 4 Universally Unique Identifiers (UUIDs) [`uuid`].

#### Use of Human-Readable Identifiers

Some of the OSCAL models (i.e., catalog, profile) make use of human-readable identifiers. This type of identifier is used in cases where humans need to select and publish data sets that make use of these identifiers. Examples of human-readable identifiers in OSCAL include control, control statement, parameter, and group identifiers used in OSCAL catalogs and profiles; and role identifiers used across all of the OSCAL models.

All human-readable identifiers must be a compliant non-colonized name as defined by [XML Schema Part 2: Datatypes Second Edition](https://www.w3.org/TR/xmlschema11-2/#NCName). This allows these identifiers to be used uniformly across XML, JSON, and YAML formats.

These identifiers are intended to be consistently used to represent the same concept over multiple major and minor revisions of the same document; thus, they should only be changed if the underlying identified subject has changed in a significant way that no longer represents the same identified subject.

Human-readable identifiers tend to be named `id` and appear where the identifier is declared on the identified subject. Fields that form an association between another subject and the identified subject by referencing a human-readable identifier will end with the suffix `-id` in OSCAL formats. These identifiers are scoped to their containing documents; therefore, the identifiers are guaranteed to be unique only in the context of the containing document. While these identifiers are document scoped, they can still be referenced by 3rd-parties in OSCAL and related content, by referencing the document source and then the identifier in that context.

#### Use of Version 4 UUIDs

UUIDs in OSCAL are intended to uniquely identify information and link information between various OSCAL documents that tend to be generated by tools. In such a case it is necessary to use an identification scheme that is:

1. Easily generated by a tool when the subject is created; and
1. Guarantees global uniqueness.

Version 4 Universally Unique Identifier (UUID) as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122) are a good fit for this use case and have been selected for use in OSCAL for this purpose.

Fields containing UUIDs tend to be named `uuid` or `xyz-uuid` (where `xyz` refers to the referenced subject with the assigned UUID) in OSCAL. When an associated subject is created that has a `uuid` field, then a tool should automatically generate a UUID for this field.

UUIDs are intended to be consistently used to represent the same concept over multiple major and minor revisions of the same document; thus, they should only be changed if the underlying identified subject has changed in a significant way that no longer represents the same identified subject.

_Example #1_: If a person's phone number changes, a tool should update the phone number, but leave the party UUID for that person unchanged. Changing the person's phone number does not change their identity, or relationships involving this party in OSCAL content. If the person was replaced by someone new, the original person's party UUID should be retired and a different one used for their replacement.

_Example #2_: If a component represents a database, and the software version is updated, the UUID for that component should remain the same. If the database is replaced by a competing product from a different vendor, the component UUID should be updated.


#### Referencing Identifiers

Identifiers may be referenced from other locations within OSCAL content using one of the following:
1. <code>[<em>name</em>]-id</code> or <code>[<em>name</em>]-uuid</code>, where _name_ is a prefix indicating the type of referenced element or object;
2. `id-ref` or `uuid-ref`, where the referenced element or object is not always the same type; or
3. Uniform Resource Identifier (URI) Fragment: A value in a flag or field with a [URI data type](/reference/datatypes/#uri). A [URI fragment](https://tools.ietf.org/html/rfc3986#section-3.5) starts with a hashtag (#) followed by a unique ID value. When used in an OSCAL file, this must be an ID or UUID.

## Metadata Overview

Every OSCAL document has a <code>metadata</code> section that shares the same structure. The required fields in <code>metadata</code> are as follows:

1. title: A human readable title for the document, represented in markdown.
2. last-modified: The date and time that the document was last modified.
3. version: A string that identifies the version of this document.
4. oscal-version: A string that identifies the version of OSCAL this document was created against.

Beyond these mandatory fields are a wealth of other elements and extension points to capture any metadata related to the document. See the format reference for more details.


### Document Identifiers

OSCAL strongly recommends the creation of a <code>document-id</code> when creating a new document. The use of version 4 UUIDs or another globally unique identifier system is recommended. If the document being created is a new version of a previous OSCAL document, the <code>document-id</code> of the second should be the same as the <code>document-id</code> of the first.

If <code>document-id</code> is ever omitted in a document, its value is assumed to be equal to the <code>uuid</code> of the root element.

When used this way, <code>document-id</code> allows for consumers of OSCAL documents to be aware of which documents are updates, and to be able to determine which document they are intended to be updating. For more advanced version control, see [Version Control with Links](#version-control-with-links).

### Version Control with Links

OSCAL recommends the use of <code>link</code> to establish resolvable version graphs of OSCAL documents. [RFC5829](https://tools.ietf.org/html/rfc5829) defines a set of values for the <code>rel</code> flag of <code>link</code> that allow for a document to provides resolvable links to the latest version, the next version, and the previous version. With this combination of links, a human or machine consumer of an OSCAL document can understand the version history of a document, and automatically update itself to the latest version.

Note that successful deployment of version control through <code>link</code> requires the document creator to maintain a well-structured static set of resolvable resources that are reachable from wherever the document is consumed (usually on the public web).

As an example of such a system, let us assume that "Author" has just released OSCAL document "Example 1.0". They can now setup a redirect system based on the document-id:

```<link rel="latest-version" href="www.author.com/example/latest">```

will always resolve to the latest version of "Example". Forward linking is done in the same manner: by including

```<link rel="successor-version" href="www.author.com/example/1.0/successor-version">```

in the original document, the author ensures a valid graph of versions even before a second version is released. Once that update is released, the given "href" will simply redirect to it.

## Accepted Values

To facilitate consistent processing, the value for some fields is limited to a list of _case-sensitive_ acceptable values. For some fields, OSCAL defines acceptable values, which are enforced by OSCAL-based syntax validation mechanisms.

Where OSCAL does not strictly limit the acceptable values, organizations are free to allow other values. The following is encouraged:
- If OSCAL offers recommended values, these should be given preference and used whenever applicable.
- If the organization defines other acceptable values:
  - these values should be lower case with no spaces and minimal special characters;
  - dashes are encouraged in place of spaces; and
  - the organization should publish a list of acceptable values for each field to ensure tool developers and the user community consistent use the same values.

## Model Formats and Schema

For each OSCAL model, the OSCAL project is supporting XML-, JSON-, and YAML-based formats. The following types of schemas are also provided, which support validation of content expressed in a specific model format:

- XML Schema based on the [XML Schema Definition Language (XSD) 1.1](https://www.w3.org/TR/xmlschema11-1) that describes an XML tag set for an OSCAL model.
- JSON Schema based on the [JSON Schema draft-07](https://json-schema.org/specification-links.html#draft-7) that describes a JSON data object for an OSCAL model.

YAML is also supported as an OSCAL format. Since YAML is a superset of JSON and many tools support YAML validation using JSON Schema, no YAML-specific schemas are provided. Thus, the JSON documentation for each model also provides documentation around the structures used in the YAML formats. In the future, we plan to extend our models with mappings to other formats as well. Support for additional formats will be driven based on [community feedback](/contact/).

The OSCAL project is also producing content converters that can convert OSCAL formatted data from one format to other supported formats. Using OSCAL converters, XML documents that are conforming (validate) to an OSCAL XSD can be converted without loss into the corresponding JSON, and vice versa. Many tools commodity tools exist to support converting between JSON and YAML. As a result, the OSCAL project does not provide any OSCAL-specific content converters for this purpose. Using a commodity JSON <-> YAML tool, you can convert XML content to JSON and then to YAML or YAML content to JSON and then to XML.

### Design principles for the schemas

The sample schemas have been created with the following design principles in mind:

- **Simplicity and ease of use.** Every attempt is being made to use consistent data patterns and structures, and to reuse constructs across all OSCAL models. By establishing a set of "OSCAL-isms", common OSCAL data patterns, the models become more consistent and easier to use. This also helps to reduce the variability in the OSCAL models, keeping them simple.
- **Relevance for typical producers.** The design of the OSCAL models incorporates the use of progressive features. A basic set of features can be used that mirror the degree of data currently provided in spreadsheets and documents pertaining to system implementations and assessment artifacts. This supports simple and easy use of OSCAL based on data that is available today. Additional optional features are provided that allow for more granular data, providing a path forward that enables the greater automation of processes.
- **Adaptability and extensibility.** The sample schemas are designed to allow users and designers of applications to introduce new constructs and usages to support local requirements. In special cases, new schemas may be constructed to work with schemas already in use.

### Modeling Approach

The OSCAL project is modeling each OSCAL layer using a modeling framework, called a [Metaschema](https://github.com/usnistgov/OSCAL/tree/main/src/metaschema). As described above, this framework allows the OSCAL project to define each OSCAL **model** in a given OSCAL **layer**. The information domain of each model is defined using Metaschema, creating an *information model* for each OSCAL model. An OSCAL **schema** represents a *data model* that defines how to represent an OSCAL *information model* in a serialized format, such as JSON, YAML, or XML. The OSCAL project uses the Metaschema framework to produce these schemas supporting the XML, JSON, and YAML formats.

This framework is also used to generate converters capable of converting OSCAL content for a given model to another supported format, and to produce the documentation in this section of the website for each OSCAL model as it applies to each format.

In addition to providing improved control over modeling and documentation, the framework also enables OSCAL to serve the needs of developers who use one or many of the OSCAL formats. We hope and expect that developers' experience with different approaches will inform further efforts to unify and consolidate a coherent information model for the OSCAL models.

### OSCAL Extensions

OSCAL models are designed to be broadly applicable to a variety of security compliance frameworks and organizational needs. Where an organization has unique modeling needs not supported by the core OSCAL syntax, it is possible to extend the syntax to address these requirements.

Models in OSCAL are organized hierarchically. At each level of this hierarchy, OSCAL syntax provides property (JSON: `property` / XML: `prop`) objects. While these properties are sometimes used for core OSCAL syntax, they can also be assigned an organizational namespace (`ns`) value, which uniquely identifies the organization creating the extension.

For any property identified with the organization's namespace, the organization may use any [token](/reference/datatypes/#token) value in the property's `name`. This allows the organization to define the containing content as required. Organizations are strongly encouraged to publish these extensions to their community of OSCAL tool developers.

{{% callout %}}
**IMPORTANT NOTE TO DEVELOPERS**

Tools should always check for the `ns` assignment within properties and annotations.
When no `ns` is provided, the default is `http://csrc.nist.gov/ns/oscal`, which means the property is assumed to be part of the core OSCAL syntax.

This is especially important as organizations extending OSCAL may use the same `name` value, but in a different namespace as compared to core OSCAL.

`property[@name='status'][@ns='https://fedramp.gov/ns/oscal']` and `property[@name='status']` are not the same; however, if a tool is only looking for `property[@name='status']`, it will inappropriately find the first property as well as the second.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml >}}
<prop
   name="status"
   ns="https://fedramp.gov/ns/oscal">fedramp-defined-status</prop>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json >}}
{
   "properties": [
     {
       "name": "status",
       "ns": "https://fedramp.gov/ns/oscal",
       "value": "fedramp-defined-status"
     }
   ]
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml>}}
properties:
- name: status
  ns: https://fedramp.gov/ns/oscal
  value: fedramp-defined-status
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

{{% /callout %}}

## OSCAL Converters

Each publication of the OSCAL models includes the ability to convert OSCAL file between supported formats without content loss.
This allows developers to use their preferred format. A tool designed for one format can accept other formats by simply converting to the supported format during import and/or converting to the alternative format during export.

Currently, converters are available to convert XML-based OSCAL files to JSON and JSON-based OSCAL files to XML.

- [XML to JSON converters](https://github.com/usnistgov/OSCAL/tree/main/json/convert) ([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/json#converting-oscal-xml-content-to-json))
- [JSON to XML converters](https://github.com/usnistgov/OSCAL/tree/main/xml/convert) ([How do I use this?](https://github.com/usnistgov/OSCAL/tree/main/xml#converting-oscal-json-content-to-xml))
