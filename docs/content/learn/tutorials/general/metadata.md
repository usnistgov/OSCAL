---
title: Creating and Using Metadata
heading: Creating and Using Metadata in OSCAL
description: A tutorial that covers the usage of the metadata section in OSCAL
weight: 5
suppresstopiclist: true
toc:
  enabled: true
alias:
- /learn/tutorials/metadata/
---

This tutorial provides a walk-through for creating the `metadata` section of an OSCAL document, which appears in all OSCAL documents.

Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Have a basic understanding of the OSCAL models and their [overall structure](/concepts/layer/overview/).


Document metadata in OSCAL appears in two locations:

1. The document's [universally unique identifier](#document-uuid) (UUID).
2. The document's [metadata section](#what-is-the-metadata-section).

This tutorial explores both of these topics.

## Document UUID

All OSCAL documents use a UUID [RFC4122](https://www.rfc-editor.org/rfc/rfc4122.html) to provide a stable and unique way to refer to a given instance of an OSCAL document. UUIDs are generated when the OSCAL document is created or revised.

While not strictly part of the `metadata` section of an OSCAL document, this document identifier is part of the OSCAL document's core metadata.

OSCAL supports two types of UUIDs:

- [Version 4](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.4): A randomly or pseudo-randomly generated UUID.
- [Version 5](https://www.rfc-editor.org/rfc/rfc4122.html#section-4.3): A name-based UUID based on SHA-1 hashing.

The OSCAL program recommends using a version 4 (random) UUID as the document identifier, which is highly resistant to [collisions](https://en.wikipedia.org/wiki/Universally_unique_identifier#Collisions).

Many tools and programming APIs provide easy ways to generate version 4 and 5 UUIDs.

For our example we have generated the UUID `c3da6d1d-c20c-4c7c-ae73-4010167a186b` using a trivial UUIDv4 generator.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=false" >}}
<catalog uuid="c3da6d1d-c20c-4c7c-ae73-4010167a186b">
{{< /highlight >}}

An OSCAL document's UUID is provided by the `@uuid` attribute, based on the [uuid](/reference/datatypes/#uuid) datatype, on the document's root element. In this example, the root element is `catalog`.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186b"
  }
}
{{< /highlight >}}

An OSCAL document's UUID is provided by the `uuid` property, based on the [uuid](/reference/datatypes/#uuid) datatype, on the document's top-level object. In this example, the top-level object is identified by the property `catalog`.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog:
  uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186b

{{< /highlight >}}

An OSCAL document's UUID is provided by the `uuid` key, based on the [uuid](/reference/datatypes/#uuid) datatype, at the document's top-level. In this example, the top-level key is named `catalog`.
{{% /tab %}}
{{% /tabs %}}

## What is the Metadata Section?

All OSCAL models share some common structure and elements, as discussed in *[Common High-Level Structure](/concepts/layer/overview/#common-high-level-structure)*. The foremost of these is the metadata section, which includes important identifying and categorizing information for an OSCAL document. The metadata section contains several mandatory fields that are vital to the processing of OSCAL documents and help ensure interoperability, as well as optional fields that are designed to provide OSCAL content creators great flexibility in expressing additional information. 

As with all parts of OSCAL, the metadata section can be represented in XML, JSON, and YAML, which each support representing an equivalent set of information. Examples in this tutorial are provided for XML, JSON, and YAML to show the equivalent representations.

## Metadata Fields

The OSCAL metaschema reference ([XML](/reference/latest/complete/xml-definitions/#/assembly/oscal-metadata/metadata) | [JSON/YAML](/reference/latest/complete/json-definitions/#/assembly/oscal-metadata/metadata)) provides a comprehensive listing of the metadata section's data fields.  Below is the high-level structure of the metadata section in XML, JSON, and YAML followed by a listing of each fields' purpose.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<metadata xmlns="http://csrc.nist.gov/ns/oscal/1.0">
    <title>markup-line</title> [1]
    <published>datetime-with-timezone</published> [0 or 1]
    <last-modified>datetime-with-timezone</last-modified> [1]
    <version>string</version> [1]
    <oscal-version>string</oscal-version> [1]
    <revisions> … </revisions> [0 or 1]
    <document-id scheme="uri">string</document-id> [0 to ∞]
    <prop uuid="uuid" ns="uri" name="ncname"
          value="string" class="ncname"> … </prop> [0 to ∞]
    <link rel="ncname" href="uri-reference"
          media-type="string"> markup-line </link> [0 to ∞]
    <role id="ncname"> … </role> [0 to ∞]
    <location uuid="uuid"> … </location> [0 to ∞]
    <party uuid="uuid" type="string"> … </party> [0 to ∞]
    <responsible-party role-id="ncname"> … </responsible-party> [0 to ∞]
    <remarks>markup-multiline</remarks> [0 or 1]
</metadata>
{{< /highlight >}}

Element definitions:

- [`<title>`](/reference/latest/complete/xml-reference/#/catalog/metadata/title) (required) - A human-readable title for the document instance, expressed as [Markdown content](/reference/datatypes/#markup-line).
- [`<published>`](/reference/latest/complete/xml-reference/#/catalog/metadata/published) (optional) - The date and time that this document instance was originally published, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone).
- [`<last-modified>`](/reference/latest/complete/xml-reference/#/catalog/metadata/last-modified) (required) - The date and time that this document instance was last modified, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone). If any part of the document is changed, this value should be updated to the current date and time.
- [`<version>`](/reference/latest/complete/xml-reference/#/catalog/metadata/version) (required) - A [simple String](/reference/datatypes/#string) that provides the version of the document instance. If any part of the document is changed, this version value should be incremented according to the versioning scheme used.
- [`<oscal-version>`](/reference/latest/complete/xml-reference/#/catalog/metadata/oscal-version) (required) - The version of OSCAL that this document instance was written against, expressed as a [simple String](/reference/datatypes/#string).
- [`<revisions>`](/reference/latest/complete/xml-reference/#/catalog/metadata/revisions/revision) (optional) - A list of revisions providing a history of changes to the document.
- [`<document-id>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/document-id) (zero to many) - A unique ID that identifies a document, and ties all separate instances of the document into a single document series. The `@scheme` attribute provides a URI to identify the scheme used to generate the ID. See the later [section](#using-the-document-id) for more information and usage guidance.
- [`<prop>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/prop) (zero to many) - Represents some arbitrary "property" of the document. This flexible element provides an extension point for adding additional metadata. See the later [section](#props) for more information and usage guidance.
- [`<link>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/link) (zero to many) - Provides a resolvable URI (the `@href` attribute) for some resource. The purpose of the link is given with the `@rel` attribute, and it's media type through the `@media-type` attribute. See the later [section](#links) for more information and usage guidance.
- [`<role>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/role) (zero to many) - Defines a function or duty assumed or expected to be assumed by a party (i.e., person or organization) in a specific situation.
- [`<location>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/location) (zero to many) - A location, with associated metadata that can be referenced.
- [`<party>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/party) (zero to many) - A responsible entity which is either a person or an organization that can be referenced.
- [`<responsible-party>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/responsible-party) (zero to many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`<remarks>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/remarks) (optional) - Markup formatted text consisting of notes for human readers of the content.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
"metadata" : {
    "title": "markup-line",
    "published": "dateTime-with-timezone",
    "last-modified": "dateTime-with-timezone",
    "version": "string",
    "oscal-version": "string",
    "revisions": [ … ] [0 or 1],
    "document-ids": [ {
      "scheme": "uri" [0 or 1],
      "identifier": "string" [1]
    }, … ] [0 or 1],
    "props": [ {
      "uuid": "uuid" [0 or 1],
      "ns": "uri" [0 or 1],
      "name": "token" [1],
      "value": "string" [1],
      "class": "token" [0 or 1],
      …
    }, … ] [0 or 1],
    "links": [ {
      "rel": "token" [0 or 1],
      "href": "uri-reference" [0 or 1],
      "media-type": "string" [0 or 1],
      "text": "markup-line" [0 or 1]
    }, … ] [0 or 1],
    "roles": [ {
      "id": "token" [1],
      …
    }, … ] [0 or 1],
    "locations": [ {
      "uuid": "uuid" [1],
      …
    }, … ] [0 or 1],
    "parties": [ {
      "uuid": "uuid" [1],
      "type": "string" [1],
      …
    }, … ] [0 or 1],
    "responsible-parties": [ {
      "role-id": "token" [1],
      …
    }, … ] [0 or 1],
    "remarks": "markup-multiline"
    }
}
{{< /highlight >}}

Note that in JSON, any objects that may appear multiple times are contained in a JSON Array.

Field definitions:

- [`title`](/reference/latest/complete/json-reference/#/catalog/metadata/title) (required) - A human-readable title for the document, expressed as [Markdown content](/reference/datatypes/#markup-line).
- [`published`](/reference/latest/complete/json-reference/#/catalog/metadata/published) (optional) - The date and time that this document was originally published, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone).
- [`last-modified`](/reference/latest/complete/json-reference/#/catalog/metadata/last-modified) (required) - The date and time that this document instance was last modified, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone). If any part of the document is changed, this value should be updated to the current date and time.
- [`version`](/reference/latest/complete/json-reference/#/catalog/metadata/version) (required) - A [simple String](/reference/datatypes/#string) that provides the version of the document instance. If any part of the document is changed, this version value should be incremented according to the versioning scheme used.
- [`oscal-version`](/reference/latest/complete/json-reference/#/catalog/metadata/oscal-version) (required) - The version of OSCAL that this document instance was written against, expressed as a [simple String](/reference/datatypes/#string).
- [`revisions`](/reference/latest/complete/json-reference/#/catalog/metadata/revisions) (optional) - A list of revisions providing a history of changes to the document.
- [`document-ids`](/reference/latest/catalog/json-reference/#/catalog/metadata/document-id) (optional, zero to many) - A set of unique IDs that identifies a document, tying all separate instances of the document into a single document series. The `identifier` property 
-  The `scheme` property defines the identification scheme used based on a URI associated with the scheme used to generate the ID. See the later [section](#using-the-document-id) for more information and usage guidance.
- [`props`](/reference/latest/catalog/json-reference/#/catalog/metadata/props) (optional, zero to many) - Represents some arbitrary "property" of the document. This flexible element provides an extension point for adding additional metadata. See the later [section](#props) for more information and usage guidance.
- [`links`](/reference/latest/catalog/json-reference/#/catalog/metadata/links) (optional, zero to many) - Provides a resolvable URI (the `href` property) to some resource. The purpose of the link is given with the `rel` attribute, and it's media type through the `media-type` property.  See the later [section](#links) for more information and usage guidance.
- [`roles`](/reference/latest/catalog/json-reference/#/catalog/metadata/roles) (optional, zero to many) - Defines a function or duty assumed or expected to be assumed by a party (i.e., person or organization) in a specific situation.
- [`locations`](/reference/latest/catalog/json-reference/#/catalog/metadata/locations) (optional, zero to many) - A location, with associated metadata that can be referenced.
- [`parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/parties) (optional, zero to many) - A responsible entity which is either a person or an organization that can be referenced.
- [`responsible-parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/responsible-parties) (optional, zero to many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`remarks`](/reference/latest/catalog/json-reference/#/catalog/metadata/remarks) (optional) - Markup formatted text consisting of notes for human readers of the content.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
metadata :
  title: markup-line [1]
  published: dateTime-with-timezone [0 or 1]
  last-modified: dateTime-with-timezone [1]
  version: string [1]
  oscal-version: string [1]
  revisions: … [0 to ∞]
  document-ids: [0 to ∞]
  - scheme: uri [0 or 1]
    identifier: string [1]
  props: … [0 to ∞]
  - uuid: uuid [0 or 1]
    ns: uri [0 or 1]
    name: token [1]
    value: string [1]
    class: token [0 or 1]
    …
  links: … [0 to ∞]
  - rel: token [0 or 1]
    href: uri-reference [0 or 1]
    media-type: string [0 or 1]
    text: markup-line [0 or 1]
  roles: … [0 to ∞]
  - id: token [1]
    …
  locations: … [0 to ∞]
    uuid: uuid [1]
    …
  parties: … [0 to ∞]
  - uuid: uuid [1]
    type: string [1]
    …
  responsible-parties: … [0 to ∞]
  - role-id: token [1]
    …
  remarks: markup-multiline
{{< /highlight >}}

Note that in YAML, any objects that may appear multiple times are contained in a YAML Array.

Field definitions:

- [`title`](/reference/latest/complete/json-reference/#/catalog/metadata/title) (required) - A human-readable title for the document, expressed as [Markdown content](/reference/datatypes/#markup-line).
- [`published`](/reference/latest/complete/json-reference/#/catalog/metadata/published) (optional) - The date and time that this document was originally published, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone).
- [`last-modified`](/reference/latest/complete/json-reference/#/catalog/metadata/last-modified) (required) - The date and time that this document instance was last modified, expressed as a [DateTime](/reference/datatypes/#datetime-with-timezone). If any part of the document is changed, this value should be updated to the current date and time.
- [`version`](/reference/latest/complete/json-reference/#/catalog/metadata/version) (required) - A [simple String](/reference/datatypes/#string) that provides the version of the document instance. If any part of the document is changed, this version value should be incremented according to the versioning scheme used.
- [`oscal-version`](/reference/latest/complete/json-reference/#/catalog/metadata/oscal-version) (required) - The version of OSCAL that this document instance was written against, expressed as a [simple String](/reference/datatypes/#string).
- [`revisions`](/reference/latest/complete/json-reference/#/catalog/metadata/revisions) (optional) - A list of revisions providing a history of changes to the document.
- [`document-ids`](/reference/latest/catalog/json-reference/#/catalog/metadata/document-id) (optional, zero to many) - A unique ID that identifies a document, and ties all separate instances of the document into one document series. The `@scheme` attribute provides a URI to identify the scheme used to generate the ID. See the later [section](#using-the-document-id) for more information and usage guidance.
- [`props`](/reference/latest/catalog/json-reference/#/catalog/metadata/props) (optional, zero to many) - Represents some arbitrary "property" of the document. This flexible element provides an extension point for adding additional metadata. See the later [section](#props) for more information and usage guidance.
- [`links`](/reference/latest/catalog/json-reference/#/catalog/metadata/links) (optional, zero to many) - Provides a resolvable URI (the `href` property) to some resource. The purpose of the link is given with the `rel` attribute, and it's media type through the `media-type` property.  See the later [section](#links) for more information and usage guidance.
- [`roles`](/reference/latest/catalog/json-reference/#/catalog/metadata/roles) (optional, zero to many) - Defines a function or duty assumed or expected to be assumed by a party (i.e., person or organization) in a specific situation.
- [`locations`](/reference/latest/catalog/json-reference/#/catalog/metadata/locations) (optional, zero to many) - A location, with associated metadata that can be referenced.
- [`parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/parties) (optional, zero to many) - A responsible entity which is either a person or an organization that can be referenced.
- [`responsible-parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/responsible-parties) (optional, zero to many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`remarks`](/reference/latest/catalog/json-reference/#/catalog/metadata/remarks) (optional) - Markup formatted text consisting of notes for human readers of the content.

{{% /tab %}}
{{% /tabs %}}

## Creating a Metadata Section

Lets start with a nominal example of an OSCAL catalog document to demonstrate how to create the metadata section.

{{% callout note %}}
The data structure of the metadata section is identical in all OSCAL models, so the demonstrated constructs in this tutorial apply to all OSCAL models.
{{% /callout %}}

The metadata section contains fields which may be categorized as:
- required
- recommended
- extensions
- and other optional fields

The following sections demonstrate how the aforementioned field categories can be used to support specific use cases.

### Using Required and Recommended Fields

First, we start with the document's title, which is intended to be brief, human-readable text that will help a reader understand the context of the document.

The following is an example of what a title might look like expressed in OSCAL:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<title>Example OSCAL Catalog</title>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "title": "Example OSCAL Catalog"
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
title: Example OSCAL Catalog
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

As you can see, the title is expressed in a very similar way across the different formats.

Next, we have the published and last modified date/time fields that represent when the document was published for the first time and most recently changed respectively. These field values are expressed using the OSCAL [dataTime-with-timezone](/reference/datatypes/#datetime-with-timezone) data type, which requires that the time zone offset is included to provide a localized time. By providing a localized timezone, the local time in any timezone can be calculated when using this information.

Lets look at a scenario where an OSCAL document was:
- published on January 1st, 2021 at "midnight" or 12:00AM with a time offset of 5 hours from Coordinated Universal Time (UTC)
- updated on January 5th, 2021 at "midnight" or 12:00AM with a time offset of 5 hours from UTC

This information would be expressed in OSCAL as follows in the metadata section:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<published>2021-01-01T00:00:00-5:00</published>
<last-modified>2021-01-05T00:00:00-5:00</last-modified>
{{< /highlight >}}

The `<published>` element gives the date and time of when the document was published for the first time. This element is <em>not</em> required, but including it is strongly recommended to help the OSCAL document consumer understand when the document was originally published.

The `<last-modified>` element provides the the date and time of the most recent change to this document. If a document was published and then never updated, the `<last-modified>` value should be identical to the one given by `<published>`.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "published": "2021-01-01T00:00:00-05:00",
  "last-modified": "2021-01-05T00:00:00-05:00"
}
{{< /highlight >}}

The `published` property gives the date and time of when the document was published for the first time. This field is <em>not</em> required, but including it is strongly recommended to help the OSCAL document consumer understand when the document was originally published.


The `last-modified` property provides the the date and time of the most recent change to this document. If a document was published and then never updated, the `last-modified` value should be identical to the one given by `published`.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
  published: 2021-01-01T00:00:00-05:00
  last-modified: 2021-01-05T00:00:00-05:00
{{< /highlight >}}

The `published` key gives the date and time of when the document was published for the first time. This key is <em>not</em> required, but including it is strongly recommended to help the OSCAL document consumer understand when the document was originally published.

The `last-modified` key provides the the date and time of the most recent change to this document. If a document was published and then never updated, the `last-modified` value should be identical to the one given by `published`.
{{% /tab %}}
{{% /tabs %}}

Next, we must provide the version of the content. This refers to the version of the OSCAL document instance itself, not the version of any other content.

OSCAL does not place requirements on the version string itself, as versioning is a complicated process that differs from content creator to content creator. Where possible, it is recommended to use well formatted versions with a clear and well defined syntax. The NIST OSCAL team uses [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) as the versioning scheme for all schema, metaschema, and OSCAL documents we maintain, which is a generally accepted best practice for versioning.

Since this is the first time we've created this document, we will use the semantic version "1.0.0".

This information would be expressed in OSCAL as follows in the metadata section:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=false" >}}
<version>1.0.0</version>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "version":"1.0.0"
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
version: 1.0.0
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

This version will be incremented whenever the OSCAL document is updated.

Finally, it is required to specify the version of OSCAL that was used when creating the document. This value provides an indicator to tools processing the data, which version of OSCAL to consider the data [valid](/concepts/validation/) with.

The OSCAL version is expressed in OSCAL as follows in the metadata section:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<oscal-version>1.0.4</oscal-version>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "oscal-version":"1.0.4"
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
oscal-version: 1.0.4
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

We have now covered all required and recommended fields of the metadata section, and could publish our document as a valid OSCAL document. Here is what it would look like all together:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<catalog uuid="c3da6d1d-c20c-4c7c-ae73-4010167a186b">
  <metadata>
    <title>Example OSCAL Document</title>
    <published>2021-01-01T00:00:00-5:00</published>
    <last-modified>2021-01-05T00:00:00-5:00</last-modified>
    <version>1.0.0<version>
    <oscal-version>1.0.4</oscal-version>
  </metadata>
  …
</catalog>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186b"
    "metadata": {
      "title": "Example OSCAL Catalog",
      "published": "2021-01-01T00:00:00-5:00",
      "last-modified": "2021-01-05T00:00:00-5:00",
      "version": "1.0.0",
      "oscal-version": "1.0.4"
    }
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog: 
  uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186b
  metadata: 
    title: Example OSCAL Catalog
    published: 2021-01-01T00:00:00-5:00
    last-modified: 2021-01-05T00:00:00-5:00
    version: 1.0.0
    oscal-version: 1.0.4
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

However, the metadata section has several other optional but important fields which we will cover in the following sections.

### Providing additional document identifiers

OSCAL documents, by their nature, may often require updates of varying impact. It is important to track these updates in a way that can be automated and managed by a wide array of systems and users. To that end, we must cover the concepts of "Document Series" and "Document Series Instances".

A "Document Series" consists of all formats, updates and versions of a given document. In more human terms, if a content author writes "Document 1 version 1", "Document 1 version 2", and "Document 1 version 3.4", we could say that the "Document Series" is simply "Document 1". Furthermore, if a document author produces PDF, OSCAL JSON, and other formats of the same information, it may be useful to identify the entire collection of formats and versions in a single "Document Series".

A "Document Series Instance" is a discrete document instance that is part of a "Document Series". Using the above example, "Document 1 version 2 represented in OSCAL JSON" is a "Document Series Instance".

In OSCAL we use a document identifier to identify that a document is a member of a "Document Series" and a document UUID to identify a "Document Series Instance".

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<catalog uuid="c3da6d1d-c20c-4c7c-ae73-4010167a186b">
  <metadata>
    <title>Example OSCAL Document</title>
    <published>2021-01-01T00:00:00-5:00</published>
    <last-modified>2021-01-05T00:00:00-5:00</last-modified>
    <version>1.0.0<version>
    <oscal-version>1.0.4</oscal-version>
    <document-id scheme="http://www.doi.org/">10.1000/182</document-id>
  </metadata>
  …
</catalog>
{{< /highlight >}}

In the above example, OSCAL we add a `<document-id>` to track the "Document Series" identified by the [Digital Object Identifier](https://www.doi.org/driven_by_DOI.html) (DOI) System using the identifier `10.1000/182`.

The DOI System is indicated using the `@scheme` attribute value `http://www.doi.org/`, which is standardized in OSCAL ([XML](/reference/latest/complete/xml-definitions/#/field/oscal-metadata/document-id/scheme), [JSON/YAML](/reference/latest/complete/json-definitions/#/field/oscal-metadata/document-id/scheme)). A schema is required to be a [URI](/reference/datatypes/#uri).
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186b"
    "metadata": {
      "title": "Example OSCAL Catalog",
      "published": "2021-01-01T00:00:00-5:00",
      "last-modified": "2021-01-05T00:00:00-5:00",
      "version": "1.0.0",
      "oscal-version": "1.0.4",
      "document-ids": [
        {
          "scheme": "http://www.doi.org/",
          "value": "10.1000/182"
        }
      ]
    }
  }
}
{{< /highlight >}}

In the above example, OSCAL we add an object to the `document-ids` array to track the "Document Series" identified by the [Digital Object Identifier](https://www.doi.org/driven_by_DOI.html) (DOI) System using the identifier `10.1000/182`.

The DOI System is indicated using the `scheme` property value `http://www.doi.org/`, which is standardized in OSCAL ([XML](/reference/latest/complete/xml-definitions/#/field/oscal-metadata/document-id/scheme), [JSON/YAML](/reference/latest/complete/json-definitions/#/field/oscal-metadata/document-id/scheme)). A schema is required to be a [URI](/reference/datatypes/#uri).
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog: 
  uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186b
  metadata: 
    title: Example OSCAL Catalog
    published: 2021-01-01T00:00:00-5:00
    last-modified: 2021-01-05T00:00:00-5:00
    version: 1.0.0
    oscal-version: 1.0.4
    document-ids:
    - scheme: http://www.doi.org/
      value: 10.1000/182
{{< /highlight >}}

In the above example, OSCAL we add an object to the `document-ids` list to track the "Document Series" identified by the [Digital Object Identifier](https://www.doi.org/driven_by_DOI.html) (DOI) System using the identifier `10.1000/182`.

The DOI System is indicated using the `scheme` property value `http://www.doi.org/`, which is standardized in OSCAL ([XML](/reference/latest/complete/xml-definitions/#/field/oscal-metadata/document-id/scheme), [JSON/YAML](/reference/latest/complete/json-definitions/#/field/oscal-metadata/document-id/scheme)). A schema is required to be a [URI](/reference/datatypes/#uri).
{{% /tab %}}
{{% /tabs %}}

In the future, any updated versions of this document that are produced will have the same "Document Series" identifier, but a different document identifier.

In the case that a document does not explicitly provide a "Document Series" identifier as above, it is given one implicitly that is equal to it's document identifier. This means that if we publish a new document without a `<document-id>`, then later need to publish an update to it, we can tie it back to the original document.

Multiple "Document Series" identifiers can be provided for a document instance to denote that a document is a part of multiple Document Series.

### Using Optional Extensions

Like most OSCAL objects, the metadata section provides for the ability to define [properties](#properties) and link relationships.

#### Properties

In OSCAL properties are namespaced, key/value pairs that allow additional information to provided that annotate the containing object. In the metadata section, properties are used to provide document-level annotations. Common use cases for properties includes providing keywords, tags, and classifications.

{{% callout note %}}
More information on the use of properties is provided in the [Props and Links tutorial](/learn/tutorials/extensions/#props).
{{% /callout %}}

For this example, we will create a property named `marking` in the default OSCAL namespace `http://csrc.nist.gov/ns/oscal` to mark an OSCAL document with a [Traffic Light Protocol (TLP)](https://www.first.org/tlp/) classification of `red`. 

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<prop name="marking" value="red" class="http://www.first.org/tlp"/>
{{< /highlight >}}

The `<prop>` element above declares the desired property. The `@name` attribute is the property's key, which is in the default OSCAL namespace `http://csrc.nist.gov/ns/oscal`, since no `@ns` is provided. The `@value` attribute is the property's value.

Together they form a key-value pair to facilitate automated data lookup. Here we use the optional `@class` attribute to provide an additional layer of information, noting that the marking we are using is the TLP protocol, as indicated using the `http://www.first.org/tlp` scheme. 
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "props": [
    {
      "name": "marking",
      "value": "red",
      "class": "http://www.first.org/tlp"
    }
  ]
}
{{< /highlight >}}

We add an object to the `props` array to declare the desired property. The `name` field is the property's key, which is in the default OSCAL namespace `http://csrc.nist.gov/ns/oscal`, since no `ns` field is provided. The `value` field is the property's value.

Together they form a key-value pair to facilitate automated data lookup. Here we use the optional `class` field to provide an additional layer of information, noting that the marking we are using is the TLP protocol, as indicated using the `http://www.first.org/tlp` scheme.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
props:
- name: marking
  value: red
  class: http://www.first.org/tlp
{{< /highlight >}}

We add an item to the `props` list to declare the desired property. The `name` field is the property's key, which is in the default OSCAL namespace `http://csrc.nist.gov/ns/oscal`, since no `ns` field is provided. The `value` field is the property's value.

Together they form a key-value pair to facilitate automated data lookup. Here we use the optional `class` field to provide an additional layer of information, noting that the marking we are using is the TLP protocol, as indicated using the `http://www.first.org/tlp` scheme.
{{% /tab %}}
{{% /tabs %}}

This completes defining the marking property.

#### Links

Alongside properties, links are another way of providing additional information in the metadata section that is not covered by the other fields. Links are a means to establish a relationship between an OSCAL object and another OSCAL objects or web resource.

{{% callout note %}}
The [Props and Links tutorial](/learn/tutorials/extensions/#links) provides comprehensive examples of how to implement a `<link>`.
{{% /callout %}}

The following example illustrates how to establish a `latest-version` link to the latest version of the OSCAL document. This link will reference a static URL whose contents can be updated to reflect the latest revision of the document, which makes it easy for consumers to quickly and easily update their content.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<link rel="latest-version"
      href="https://www.example.com/catalog/exampleoscalcatalog/latest"/>
{{< /highlight >}}

The `@rel` attribute establishes `latest-version` as the type of relationship. The  `@href` attribute provides a URI that can be used to access, also called "resolve", the associated resource.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{  
  "links": [
    {
      "rel": "latest-version",
      "href": "https://www.example.com/catalog/example-oscal-catalog/latest"
    }
  ]
}
{{< /highlight >}}

By adding a new object to the `links` array property, the `rel` field establishes `latest-version` as the type of relationship. The  `href` field provides a URI that can be used to access, also called "resolve", the associated resource.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
links:
- rel: latest-version
  href: https://www.example.com/catalog/example-oscal-catalog/latest
{{< /highlight >}}

By adding a new item to the `links` list, `rel` field establishes `latest-version` as the type of relationship. The  `href` field provides a URI that can be used to access, also called "resolve", the associated resource.
{{% /tab %}}
{{% /tabs %}}

The `predecessor-version` and `successor-version` link relationships can be used in tandem with the above to create a navigable web of document versions. By using these and other custom relationship values, any relevant or related resource can be described and linked to in the OSCAL document's metadata section.

### Using Other Optional Fields

The remainder of this tutorial will briefly cover the other optional fields inside the metadata section. While not required by the specification, these fields provide invaluable information, particularly around the provenance and authorship of the data contained in an OSCAL document, or to define referencable roles, locations, or parties. This information is declared in the metadata section, and is often passed by-reference to other parts of the OSCAL document or other OSCAL documents importing that document. Each field can be clicked to get additional information.

{{< tabs XML JSON YAML >}}
{{% tab %}}
- [`<role>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/role) - Roles define some function or purpose that is to be assigned to some entity later in the document. Role elements have an `id` attribute with a [NCName](/reference/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context.

  In the metadata section they are as follows:

  - **creator:** Indicates the organization or person that created this content.
  - **prepared-by:** Indicates the organization or person that created this content.
  - **prepared-for:** Indicates the organization or person for which this content was created.
  - **content-approver:** Indicates the organization or person responsible for all content represented in the "document".
  - **contact:** Indicates the organization or person to contact for questions or support related to this content.

  Other roles can be locally defined by the content creator.

- [`<location>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/location) - Geographic data associated with a street, mailing, or email address, or phone number. Locations have a `@uuid` attribute that allow them to be referenced elsewhere in the OSCAL document. Includes elements to describe a variety of data describing the location in question.

- [`<party>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/party) - Defines some entity, either a person or an organization. Has a `@uuid` attribute that allows for references to this party elsewhere in the OSCAL document. Includes elements to describe a variety of data describing the party in question, including a location uuid.

- [`<responsible-party>`](/reference/latest/catalog/xml-reference/#/catalog/metadata/responsible-party) - Explicitly declares a party that is responsible for a given role relative to the document. The `@role-id` attribute references the role that the party is fulfilling, and is either a custom role locally defined or one of the core-defined roles; see the `<role>` section above for details. Uses a party's uuid to link the given role to the given party.

- [`<remarks>`]((/reference/latest/catalog/xml-reference/#/catalog/metadata/remarks)) - [markup-multiline](/reference/datatypes/#markup-data-types) formatted text providing notes and comments regarding the document.
{{% /tab %}}
{{% tab %}}

- [`roles`](/reference/latest/catalog/json-reference/#/catalog/metadata/roles) - An array of Role objects. Roles define some function or purpose that is to be assigned to some entity later in the document. Role objects have an `id` field with a [NCName](/reference/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context.

  In the metadata section they are as follows:

  - **creator:** Indicates the organization or person that created this content.
  - **prepared-by:** Indicates the organization or person that created this content.
  - **prepared-for:** Indicates the organization or person for which this content was created.
  - **content-approver:** Indicates the organization or person responsible for all content represented in the "document".
  - **contact:** Indicates the organization or person to contact for questions or support related to this content.

  Other roles can be locally defined by the content creator.

- [`locations`](/reference/latest/catalog/json-reference/#/catalog/metadata/locations) - An array of location objects. Geographic data associated with a street, mailing, or email address, or phone number.  Locations have a `uuid` field that allow them to be referenced elsewhere in the OSCAL document. Includes fields to describe a variety of data describing the location in question.

- [`parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/parties) - An array of party objects. Defines some entity, either a person or an organization. Has a `uuid` field that allows for references to this party elsewhere in the OSCAL document. Includes fields to describe a variety of data describing the party in question, including a location uuid.

- [`responsible-parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/responsible-parties) - An array of responsible-party objects. Explicitly declares a party that is responsible for this a given role. The `role-id` field references the role that the party is fulfilling, and is either a custom role locally defined or one of the core-defined roles; see the `roles` section above for details. Uses a party's uuid to link the given role to the given party.

- [`remarks`](/reference/latest/catalog/json-reference/#/catalog/metadata/remarks) - [markup-multiline](/reference/datatypes/#markup-data-types) formatted text providing notes and comments regarding the document.
{{% /tab %}}

{{% tab %}}
- [`roles`](/reference/latest/catalog/json-reference/#/catalog/metadata/roles) - Roles define some function or purpose that is to be assigned to some entity later in the document. Role objects have an `id` field with a [NCName](/reference/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context.

  In the metadata section they are as follows:

  - **creator:** Indicates the organization or person that created this content.
  - **prepared-by:** Indicates the organization or person that created this content.
  - **prepared-for:** Indicates the organization or person for which this content was created.
  - **content-approver:** Indicates the organization or person responsible for all content represented in the "document".
  - **contact:** Indicates the organization or person to contact for questions or support related to this content.

  Other roles can be locally defined by the content creator.

- [`locations`](/reference/latest/catalog/json-reference/#/catalog/metadata/locations) - Geographic data associated with a street, mailing, or email address, or phone number.  Locations have a `uuid` field that allow them to be referenced elsewhere in the OSCAL document. Includes fields to describe a variety of data describing the location in question.

- [`parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/parties) - Defines some entity, either a person or an organization. Has a `uuid` field that allows for references to this party elsewhere in the OSCAL document. Includes fields to describe a variety of data describing the party in question, including a location uuid.

- [`responsible-parties`](/reference/latest/catalog/json-reference/#/catalog/metadata/responsible-parties) - Explicitly declares a party that is responsible for a given role. The `role-id` field references the role that the party is fulfilling, and is either a custom role locally defined or one of the core-defined roles; see the `role` section above for details. Uses a party's uuid to link the given role to the given party.

- [`remarks`](/reference/latest/catalog/json-reference/#/catalog/metadata/remarks) - [markup-multiline](/reference/datatypes/#markup-data-types) formatted text providing notes and comments regarding the document.
{{% /tab %}}
{{% /tabs %}}

## Putting It All Together

Finally, we have a basic example of an OSCAL metadata section below:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<catalog uuid="c3da6d1d-c20c-4c7c-ae73-4010167a186b">
  <metadata>
    <title>Example OSCAL Document</title>
    <published>2021-01-01T00:00:00-5:00</published>
    <last-modified>2021-01-05T00:00:00-5:00</last-modified>
    <version>1.0.0</version>
    <oscal-version>1.0.4</oscal-version>
    <document-id scheme="http://www.doi.org/">10.1000/182</document-id>
    <prop name="marking" class="http://www.first.org/tlp" value="red"/>
    <link rel="latest-version"
      href="https://www.example.com/catalog/example-oscal-catalog/latest"/>
    <party uuid="15d2e37c-0452-4695-9c6a-ddc1ff15397b" type="organization">
      <name>Example Company</name>
    </party>
    <responsible-party role-id="prepared-by">
      <party-uuid>15d2e37c-0452-4695-9c6a-ddc1ff15397b</party-uuid>
    </responsible-party>
  </metadata>
</catalog>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186b",
    "metadata": {
      "title": "Example OSCAL Catalog",
      "published": "2021-01-01T00:00:00-5:00",
      "last-modified": "2021-01-05T00:00:00-5:00",
      "version": "1.0.0",
      "oscal-version":"1.0.4",
      "document-ids": [
        {
          "scheme": "http://www.doi.org/",
          "value": "10.1000/182"
        }
      ],
      "props": [
        {
          "name": "marking",
          "value": "red",
          "class": "http://www.first.org/tlp"
        }
      ],
      "links": [
        {
          "rel": "latest-version",
          "href": "https://www.example.com/catalog/example-oscal-catalog/latest"
        }
      ],
      "parties": [
        {
          "uuid": "15d2e37c-0452-4695-9c6a-ddc1ff15397b",
          "type": "organization",
          "name": "Example Company"
        }
      ],
      "responsible-parties":[
        {
          "role-id": "prepared-by",
          "party-uuid": "15d2e37c-0452-4695-9c6a-ddc1ff15397b"
        }
      ]
    }
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog:
  uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186b
  metadata:
    title: Example OSCAL Catalog
    published: 2021-01-01T00:00:00-5:00
    last-modified: 2021-01-05T00:00:00-5:00
    version: 1.0.0
    oscal-version: 1.0.4
    document-ids:
    - scheme: http://www.doi.org/
      value: 10.1000/182
    props:
    - name: marking
      value: red
      class: http://www.first.org/tlp
    links:
    - rel: latest-version
      href: https://www.example.com/catalog/example-oscal-catalog/latest
    parties:
    - uuid: 15d2e37c-0452-4695-9c6a-ddc1ff15397b
      type: organization
      name: Example Company
    responsible-parties:
    - role-id: prepared-by
      party-uuid: 15d2e37c-0452-4695-9c6a-ddc1ff15397b
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

## Summary

This concludes the tutorial. At this point you should be familiar with:

- The basic structure of the metadata section.
- How to provide the basic metadata required to be included in an OSCAL document.
- How to use and understand UUIDs and document-ids to track document instances
- How to use optional fields to express additional metadata and extend the metadata section
