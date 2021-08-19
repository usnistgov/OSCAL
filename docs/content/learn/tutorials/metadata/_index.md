---
title: Creating and Using Metadata in OSCAL
description: A tutorial that covers the usage of the Metadata Section in OSCAL
weight: 5
suppresstopiclist: true
---

This tutorial covers the basics of the common Metadata Section, and provides a walk-through on creating one for a new document. Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Have a basic understanding of OSCAL Models and their overall structure. ([OSCAL High-Level Overview](/concepts/layer/overview/))

## What is the Metadata Section?

All OSCAL Models share some common structure and elements, as discussed in [Common High-Level Structure](/concepts/layer/overview/#common-high-level-structure). The foremost of these is the Metadata section, which includes important identifying and categorizing information. A number of mandatory fields inside of Metadata are vital to the processing of OSCAL documents, and have stricter requirements that help ensure interoperability. A second, larger set of fields are optional, and designed to allow OSCAL content creators great flexibility in expressing additional information. These optional fields may enable extra functionality, utilize proprietary data, contain contact info, and more.

The definition of the Metadata Section is the same regardless of where it appears, so this tutorial is not bound to a single OSCAL Model.

As with all parts of OSCAL, the Metadata Section provides machine-readable formats in XML, JSON, and YAML, which support representing an equivalent set of information. Examples in this tutorial are provided for XML, JSON, and YAML to show the equivalent representations.

## The Fields of Metadata

The widget below shows the high-level structure of the Metadata Section in XML, JSON, and YAML. Below, each field is defined and briefly explained.

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
    <prop name="ncname" uuid="uuid" ns="uri" value="string" class="ncname"> … </prop> [0 to ∞]
    <link href="uri-reference" rel="ncname" media-type="string"> … </link> [0 to ∞]
    <role id="ncname"> … </role> [0 to ∞]
    <location uuid="uuid"> … </location> [0 to ∞]
    <party uuid="uuid" type="string"> … </party> [0 to ∞]
    <responsible-party role-id="ncname"> … </responsible-party> [0 to ∞]
    <remarks>markup-multiline</remarks> [0 or 1]
</metadata>
{{< /highlight >}}

Element definitions:
- [`<title>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-title_def-h3) (Required) - A human-readable title for the document. Expressed as [Markdown content](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-line).
- [`<published>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-oscal-metadata-published_ref-h3) (Optional) - The date and time that this document was originally published. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`<last-modified>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-oscal-metadata-last-modified_ref-h3) (Required) - The date and time that this document instance was last modified. If any part of the document is changed, this should be updated to the current date and time. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`<version>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-oscal-metadata-version_ref-h3) (Required) - A string that provides a version for this document instance. If any part of the document is changed, this version should be incremented according to some standardized scheme. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`<oscal-version>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-oscal-metadata-oscal-version_ref-h3) (Required) - The version of OSCAL that this document instance was written against. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`<revision>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/#global_oscal-metadata-revision) (Optional) - A list of revisions to this document to enable advanced change tracking.
- [`<document-id>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-oscal-metadata-document-id_ref-h3) (Optionally Many) - A unique ID that identifies a document, and ties all separate instances of the document into one document series. The `scheme` attribute provides a URI to identify the scheme used to generate the ID. See  for more information and usage guidance.
- [`<prop>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-property_ref-h3) (Optionally Many) - Represents some arbitrary "property" of the document. This flexible element provides an extension point for adding additional metadata. See TODO for more information and usage guidance.
- [`<link>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-link_ref-h3) (Optionally Many) - Provides a resolvable URI (the `href` attribute) to some resource. The purpose of the link is given with the `rel` attribute, and it's media type through the `media-type` attribute. See [here](https://pages.nist.gov/OSCAL/tutorials/metadata/#understanding-and-using-document-id) for more information and usage guidance.
- [`<role>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-role_ref-h3) (Optionally Many) - Defines a function assumed or expected to be assumed by a party in a specific situation.
- [`<location>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-location_ref-h3) (Optionally Many) - A location, with associated metadata that can be referenced.
- [`<party>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-party_ref-h3) (Optionally Many) - A responsible entity which is either a person or an organization.
- [`<responsible-party>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-responsible-party_ref-h3) (Optionally Many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`<remarks>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/##local_metadata-remarks_ref-h3) (Optional) - Markup formatted plaintext with notes for human readers of the content.


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
    "revisions": "[ … ]",
    "document-ids": "[ … ]",
    "props": "[ … ]",
    "links": "[ … ]",
    "roles": "[ … ]",
    "locations": "[ … ]",
    "parties": "[ … ]",
    "responsible-parties": "[ … ]",
    "remarks": "markup-multiline"
    }
}
{{< /highlight >}}

Note that in JSON, any objects that may appear multiple times are contained in a JSON Array.
Field definitions:
- [`"title"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-title_def-h3) (Required) - A human-readable title for the document. Expressed as [Markdown content](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-line).
- [`"published"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-published_ref-h3) (Optional) - The date and time that this document was originally published. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`"last-modified"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-last-modified_ref-h3) (Required) - The date and time that this document instance was last modified. If any part of the document is changed, this should be updated to the current date and time. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`"version"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-version_ref-h3) (Required) - A string that provides a version for this document instance. If any part of the document is changed, this version should be incremented according to some standardized scheme. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`"oscal-version"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-oscal-version_ref-h3) (Required) - The version of OSCAL that this document instance was written against. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`"revisions"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_oscal-metadata-revision) (Optional) - A list of revisions to this document to enable advanced change tracking.
- [`"document-ids"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-document-id_ref-h3) (Optionally Many) - A unique ID that identifies a document, and ties all separate instances of the document into one document series. The `"scheme"` field provides a URI to identify the scheme used to generate the ID. See  for more information and usage guidance.
- [`"props"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-property_ref-h3) (Optionally Many) - Represents some arbitrary "property" of the document. This flexible element provides an extension point for adding additional metadata. See TODO for more information and usage guidance.
- [`"links"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-link_ref-h3) (Optionally Many) - Provides a resolvable URI (the `href` field) to some resource. The purpose of the link is given with the `"rel"` field, and it's media type through the `"media-type"` field. See [here](https://pages.nist.gov/OSCAL/tutorials/metadata/#understanding-and-using-document-id) for more information and usage guidance.
- [`"roles"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-role_ref-h3) (Optionally Many) - Defines a function assumed or expected to be assumed by a party in a specific situation.
- [`"locations"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-location_ref-h3) (Optionally Many) - A location, with associated metadata that can be referenced.
- [`"parties"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-party_ref-h3) (Optionally Many) - A responsible entity which is either a person or an organization.
- [`"responsible-parties"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-responsible-party_ref-h3) (Optionally Many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`"remarks"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-remarks_ref-h3) (Optional) - Markup formatted plaintext with notes for human readers of the content.


{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
metadata :
    title: markup-line,
    published: dateTime-with-timezone,
    last-modified: dateTime-with-timezone,
    version: string,
    oscal-version: string,
    revisions: … ,
    document-ids: … ,
    props: … ,
    links: … ,
    roles: … ,
    locations: … ,
    parties: … ,
    responsible-parties: … ,
    remarks: markup-multiline
{{< /highlight >}}

Note that in YAML, any objects that may appear multiple times are contained in a YAML Array.
Field definitions:
- [`title`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-title_def-h3) (Required) - A human-readable title for the document. Expressed as [Markdown content](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-line).
- [`published`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-published_ref-h3) (Optional) - The date and time that this document was originally published. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`last-modified`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-last-modified_ref-h3) (Required) - The date and time that this document instance was last modified. If any part of the document is changed, this should be updated to the current date and time. Expressed as a [DateTime](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#datetime-with-timezone).
- [`version`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-version_ref-h3) (Required) - A string that provides a version for this document instance. If any part of the document is changed, this version should be incremented according to some standardized scheme. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`oscal-version`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-oscal-version_ref-h3) (Required) - The version of OSCAL that this document instance was written against. A [simple String](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#string)
- [`revisions`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_oscal-metadata-revision) (Optional) - A list of revisions to this document to enable advanced change tracking.
- [`document-ids`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-oscal-metadata-document-id_ref-h3) (Optionally Many) - A unique ID that identifies a document, and ties all separate instances of the document into one document series. The `scheme` field provides a URI to identify the scheme used to generate the ID. See  for more information and usage guidance.
- [`props`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-property_ref-h3) (Optionally Many) - Represents some arbitrary property of the document. This flexible element provides an extension point for adding additional metadata. See TODO for more information and usage guidance.
- [`links`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-link_ref-h3) (Optionally Many) - Provides a resolvable URI (the `href` field) to some resource. The purpose of the link is given with the `rel` field, and it's media type through the `media-type` field. See [here](https://pages.nist.gov/OSCAL/tutorials/metadata/#understanding-and-using-document-id) for more information and usage guidance.
- [`roles`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-role_ref-h3) (Optionally Many) - Defines a function assumed or expected to be assumed by a party in a specific situation.
- [`locations`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-location_ref-h3) (Optionally Many) - A location, with associated metadata that can be referenced.
- [`parties`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-party_ref-h3) (Optionally Many) - A responsible entity which is either a person or an organization.
- [`responsible-parties`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-responsible-party_ref-h3) (Optionally Many) - A reference to a set of organizations or persons that have responsibility for performing a referenced role in the context of the containing object.
- [`remarks`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/##gen_metadata-remarks_ref-h3) (Optional) - Markup formatted plaintext with notes for human readers of the content.

{{% /tab %}}
{{% /tabs %}}
## Creating a Metadata Section

All OSCAL documents require a Metadata section with a number of basic elements. This tutorial will cover creating this section and populating the required elements. We will also cover several important optional elements, and how they can be used to achieve specialized use cases.

Lets start with a nominal example OSCAL document to explain how you would create Metadata. 

This OSCAL document is a Catalog, called "Example OSCAL Catalog". It was created today (1/1/2021) by me, Example Person, employee of Example Company.

## The `uuid` of the Document

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}

<catalog uuid=c3da6d1d-c20c-4c7c-ae73-4010167a186b>

{{< /highlight >}}

Although technically outside of the Metadata Section, the `uuid` of a document is always given as an attribute on the root element, and shares its structure across all OSCAL document types. This is provided using the [uuid](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uuid) datatype. UUIDs are a globally unique identifier randomly generated at the same time an OSCAL document is created. This provides a stable and unique way to refer to a given instance of an OSCAL document. Many tools provide easy ways to generate version 4 UUIDs. For our example we have generated one using a trivial UUIDv4 generator.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186"
  }
}
{{< /highlight >}}

Although technically outside of the Metadata Section, the `uuid` of a document is always given as a field of the root element, and shares its structure across all OSCAL document types. This is provided using the [uuid](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uuid) datatype. UUIDs are a globally unique identifier randomly generated at the same time an OSCAL document is created. This provides a stable and unique way to refer to a given instance of an OSCAL document. Many tools provide easy ways to generate version 4 UUIDs. For our example we have generated one using a trivial UUIDv4 generator.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---

catalog:
  uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186

{{< /highlight >}}

Although technically outside of the Metadata Section, the `uuid` of a document is always given as a field of the root element, and shares its structure across all OSCAL document types. This is provided using the [uuid](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uuid) datatype. UUIDs are a globally unique identifier randomly generated at the same time an OSCAL document is created. This provides a stable and unique way to refer to a given instance of an OSCAL document. Many tools provide easy ways to generate version 4 UUIDs. For our example we have generated one using a trivial UUIDv4 generator.

{{% /tab %}}
{{% /tabs %}}


## Starting Simple with Required Elements


{{< tabs XML JSON YAML >}}


{{% tab %}}

First, we start with the `<title>` element. This should be populated with a human-readable title that is exactly or closely matches the existing name of the document. 

For our example, this would look like:

{{< highlight xml "linenos=table" >}}

<title> Example OSCAL Catalog </title>

{{< /highlight >}}


Next we have two date-based elements. This uses the OSCAL DataTime data type as defined here: [date-with-timezone](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#date-with-timezone). `<published>` gives the DateTime of when the document was published for the first time. Since we are publishing this document for the first time today (1/1/2021), the published date will be today, and the time is the moment (or near to it) that this document was published. `<last-modified>` provides the DateTime of the most recent change to this document. As we have never published this particular document before, the DateTime should be identical to the one given by `<published>`. In our example, this will look like:


{{< highlight xml "linenos=table" >}}
<published> 2021-01-01T00:00:00-5:00 </published>
<last-modified> 2021-01-01T00:00:00-5:00 </last-modified>
{{< /highlight >}}

Note that `<published>` is not required, but is strongly recommended.

Thirdly we must provide a `<version>` element. This refers to the version of the OSCAL document itself, not the version of any other content. OSCAL does not place requirements on the version string itself, as versioning is a complicated process that differs from content creator to content creator. Since this is the first time we've created this document, some variation on a "1.0" would be appropriate.

{{< highlight xml "linenos=table" >}}
<version> 1.0.0 <version>
{{< /highlight >}}

Where possible, use well formatted versions with clear and defined rules. This version will be incremented whenever the OSCAL document is updated.

The final required element is `<oscal-version>`, which provides consumers of the document that the version of OSCAL that was used to create this document.

{{< highlight xml "linenos=table" >}}
<oscal-version>1.0.0-rc2</oscal-version>
{{< /highlight >}}

We have now covered all required fields of the Metadata Section, and could now publish our document as a valid OSCAL document. Lets take a look at what it would look like all together:

{{< highlight xml "linenos=table" >}}
<catalog uuid=c3da6d1d-c20c-4c7c-ae73-4010167a186b>
  <metadata>
      <title> Example OSCAL Document </title>
      <published> 2021-01-01T00:00:00-5:00 </published>
      <last-modified> 2021-01-01T00:00:00-5:00 </last-modified>
      <version> 1.0.0 <version>
      <oscal-version>1.0.0-rc2</oscal-version>
  </metadata>
  ...
</catalog>
{{< /highlight >}}

However, the Metadata Section has several other optional fields of importance, which we will cover in the following sections.

{{% /tab %}}


{{% tab %}}

First, we start with the `"title"` field. This should be populated with a human-readable title that exactly or closely matches an existing name of the document. 

For our example, this would look like:

{{< highlight json "linenos=table" >}}
{
"title":"Example OSCAL Catalog"
}
{{< /highlight >}}

Next we have two date based fields. This uses the OSCAL DataTime data type as defined here: [date-with-timezone](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#date-with-timezone). `"published"` gives the DateTime of when the document was published for the first time. Since we are publishing this document for the first time today (1/1/2021), the published date will be today, and the time is the moment (or near to it) that this document was published. `"last-modified"` provides the DateTime of the most recent change to this document. As we have never published this particular document before, the DateTime should be identical to the one given by `"published"`. In our example, this will look like:


{{< highlight json "linenos=table" >}}
{
"published": "2021-01-01T00:00:00-5:00",
"last-modified": "2021-01-01T00:00:00-5:00"
}
{{< /highlight >}}

Note that `"published"` is not required, but is strongly recommended.

Thirdly we must provide a `"version"` field. This refers to the version of the OSCAL document itself, not the version of any other content. OSCAL does not place requirements on the version string itself, as versioning is a complicated process that differs from content creator to content creator. Since this is the first time we've created this document, some variation on a "1.0" would be appropriate.

{{< highlight json "linenos=table" >}}
{
"version":"1.0.0"
}
{{< /highlight >}}

Where possible, use well formatted versions with clear and defined rules. This version will be incremented whenever the OSCAL document is updated.

The final required field is `"oscal-version"`, which provides consumers of the document that the version of OSCAL that was used to create this document.

{{< highlight json "linenos=table" >}}
{
"oscal-version":"1.0.0"
}
{{< /highlight >}}

We have now covered all required fields of the Metadata Section, and could now publish our document as a valid OSCAL document. Lets take a look at what it would look like all together:

{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186"
    "metadata": {
      "title":"Example OSCAL Catalog",
      "published":"2021-01-01T00:00:00-5:00",
      "last-modified":"2021-01-01T00:00:00-5:00",
      "version":"1.0.0",
      "oscal-version":"1.0.0"
    }
  }
}
{{< /highlight >}}

However, the Metadata Section has several other optional fields of importance, which we will cover in the following sections.
{{% /tab %}}


{{% tab %}}

First, we start with the `title` field. This should be populated with a human-readable title that is exactly or closely matches the existing name of the document. 

For our example, this would look like:

{{< highlight yaml "linenos=table" >}}
---

title:Example OSCAL Catalog

{{< /highlight >}}

Next we have two date based fields. This uses the OSCAL DataTime data type as defined here: [date-with-timezone](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#date-with-timezone). `published` gives the DateTime of when the document was published for the first time. Since we are publishing this document for the first time today (1/1/2021), the published date will be today, and the time is the moment (or near to it) that this document was published. `last-modified` provides the DateTime of the most recent change to this document. As we have never published this particular document before, the DateTime should be identical to the one given by `published`. In our example, this will look like:


{{< highlight yaml "linenos=table" >}}
---
  published: 2021-01-01T00:00:00-5:00,
  last-modified: 2021-01-01T00:00:00-5:00
{{< /highlight >}}

Note that `published` is not required, but is strongly recommended.

Thirdly we must provide a `version` field. This refers to the version of the OSCAL document itself, not the version of any other content. OSCAL does not place requirements on the version string itself, as versioning is a complicated process that differs from content creator to content creator. Since this is the first time we've created this document, some variation on a "1.0" would be appropriate.

{{< highlight yaml "linenos=table" >}}
---
  version: 1.0.0
{{< /highlight >}}

Where possible, use well formatted versions with clear and defined rules. This version will be incremented whenever the OSCAL document is updated.

The final required field is `oscal-version`, which provides consumers of the document that the version of OSCAL that was used to create this document.

{{< highlight yaml "linenos=table" >}}
---
{
oscal-version: 1.0.0
}
{{< /highlight >}}

We have now covered all required fields of the Metadata Section, and could now publish our document as a valid OSCAL document. Lets take a look at what it would look like all together:

{{< highlight yaml "linenos=table" >}}
---
  catalog:
    uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186,
    metadata:
      title: Example OSCAL Catalog,
      published: 2021-01-01T00:00:00-5:00,
      last-modified: 2021-01-01T00:00:00-5:00,
      version: 1.0.0,
      oscal-version: 1.0.0
{{< /highlight >}}

However, the Metadata Section has several other optional fields of importance, which we will cover in the following sections.
{{% /tab %}}
{{% /tabs %}}

## Understanding and Using `document-id`

{{< tabs XML JSON YAML >}}
{{% tab %}}
OSCAL documents, by their nature, will often receive updates of varying impact. It is important to track these updates in a way that can be automated and managed by a wide array of systems and users. To that end, we must cover the concepts of "Document Series" and "Document Instances".

A "Document Series" is defined as a document and all of its updates and versions. In more human terms if I have written "Document 1 version 1", "Document 1 version 2", and "Document 1 version 3.4", we could say that the "Document Series" is simply "Document 1".
A "Document Instance" is defined as a single document that is part of a "Document Series". Using the above example, "Document 1 version 2" is a "Document Instance"

In OSCAL we use `<document-id>` to track "Document Series", and `uuid` to track "Document Instance".

Back to our OSCAL Catalog example, we have already generated a uuid to identify the particular instance that we are publishing. Since we are publishing the first document in a series, we should also define a `<document-id>`. The `scheme` attribute is a (URI)[https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uri] that identifies the naming scheme we are using for the ID. While there are no strict requirements around the scheme and the ID, it is recommended that an existing identification scheme is used. For our example we will use [DOI](https://www.doi.org/).

{{< highlight xml "linenos=table" >}}
<document-id scheme=https://www.doi.org/>10.1000/182<document-id>
{{< /highlight >}}

In the future, any updated versions of this document we publish will have the same `<document-id>` value, but a different `uuid`.

In the case that a document does not explicitly provide a `<document-id>` value, it is given one implicitly that is equal to it's `uuid`. This means that if we publish a new document without a `<document-id>`, then later need to publish an update to it, we can tie it back to the original document.

Multiple `<document-id>` elements denote that a document is a part of multiple Document Series. This is a rare but valid use case.
{{% /tab %}}


{{% tab %}}
OSCAL documents, by their nature, will often receive updates of varying impact. It is important to track these updates in a way that can be automated and managed by a wide array of systems and users. To that end, we must cover the concepts of "Document Series" and "Document Instances".

A "Document Series" is defined as a document and all of its updates and versions. In more human terms if I have written "Document 1 version 1", "Document 1 version 2", and "Document 1 version 3.4", we could say that the "Document Series" is simply "Document 1".
A "Document Instance" is defined as a single document that is part of a "Document Series". Using the above example, "Document 1 version 2" is a "Document Instance"

In OSCAL we use `"document-ids"` to track "Document Series", and `"uuid"` to track "Document Instance".

Back to our OSCAL Catalog example, we have already generated a uuid to identify the particular instance that we are publishing. Since we are publishing the first document in a series, we should also define a `"document-ids"`. The `"scheme"` field is a (URI)[https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uri] that identifies the naming scheme we are using for the ID. While there are no strict requirements around the scheme and the ID, it is recommended that an existing identification scheme is used. For our example we will use [DOI](https://www.doi.org/).

{{< highlight json "linenos=table" >}}
{
"document-ids": [
    {
    "scheme":"https://www.doi.org/",
    "value":"10.1000/182"
    }
  ]
}
{{< /highlight >}}

In the future, any updated versions of this document we publish will have the same `"document-ids"` values, but a different `"uuid"`.

In the case that a document does not explicitly provide at least one object inside `"document-ids"`, it is given a value implicitly that is equal to it's `"uuid"`. This means that if we publish a new document without a `"document-ids"`, then later need to publish an update to it, we can tie it back to the original document.
{{% /tab %}}


{{% tab %}}
OSCAL documents, by their nature, will often receive updates of varying impact. It is important to track these updates in a way that can be automated and managed by a wide array of systems and users. To that end, we must cover the concepts of "Document Series" and "Document Instances".

A "Document Series" is defined as a document and all of its updates and versions. In more human terms if I have written "Document 1 version 1", "Document 1 version 2", and "Document 1 version 3.4", we could say that the "Document Series" is simply "Document 1".
A "Document Instance" is defined as a single document that is part of a "Document Series". Using the above example, "Document 1 version 2" is a "Document Instance"

In OSCAL we use `document-id` to track "Document Series", and `uuid` to track "Document Instance".

Back to our OSCAL Catalog example, we have already generated a uuid to identify the particular instance that we are publishing. Since we are publishing the first document in a series, we should also define a `document-id`. The `scheme` field is a (URI)[https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#uri] that identifies the naming scheme we are using for the ID. While there are no strict requirements around the scheme and the ID, it is recommended that an existing identification scheme is used. For our example we will use [DOI](https://www.doi.org/).

{{< highlight yaml "linenos=table" >}}
---
document-ids:
  - scheme: https://www.doi.org/
    value: 10.1000/182
{{< /highlight >}}

In the future, any updated versions of this document we publish will have the same `document-id` value, but a different `uuid`.

In the case that a document does not explicitly provide a `document-id` value, it is given one implicitly that is equal to it's `uuid`. This means that if we publish a new document without a `document-id`, then later need to publish an update to it, we can tie it back to the original document.
{{% /tab %}}
{{% /tabs %}}



## Using Props
{{< tabs XML JSON YAML >}}
{{% tab %}}
The `<prop>` element provides a key-value pairing to provide additional information alongside the well-defined elements of the Metadata Section. Some common use cases include labels, sorting tags, and classification. There are no restrictions on using custom `name` and `value` pairs making `<prop>` an excellent place to do extension of the OSCAL model to meet proprietary use cases. The Metadata Section may include any number of `<prop>` elements.

For our example, we will create a `<prop>` to mark an OSCAL document with a [Traffic Light Protocol (TLP)](https://en.wikipedia.org/wiki/Traffic_Light_Protocol) classification. 

{{< highlight xml "linenos=table" >}}
<prop name="marking" value="red" class="TLP"/>
{{< /highlight >}}

The `name` attribute is the key, and the `value` attribute is the value. Together they form a key-value pair to facilitate automated data lookup. Here we use an optional `class` attribute to provide an additional layer of information, noting that the marking we are using is the TLP protocol.

The optional attributes of `<prop>` are as follows:

- class: A textual label that provides a sub-type or characterization of the property's name. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same name and ns.
- uuid: A unique identifier that can be used to reference this property elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.
- ns: A namespace qualifying the property's name. This allows different organizations to associate distinct semantics with the same name.

Additionally, the content of the `<prop>` element is optionally Markup content that represents [Remarks](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/assessment-plan/xml-schema/#global_remarks_h2).
{{% /tab %}}
{{% tab %}}
The `"props"` array provides any number of key-value pairing to provide additional information alongside the well-defined fields of the Metadata Section. Some common use cases include labels, sorting tags, and classification. There are no restrictions on using custom `"name"` and `"value"` pairs making `"props"` an excellent place to do extension of the OSCAL model to meet proprietary use cases.

For our example, we will create a `"props"` array to mark an OSCAL document with a [Traffic Light Protocol (TLP)](https://en.wikipedia.org/wiki/Traffic_Light_Protocol) classification. 

{{< highlight json "linenos=table" >}}
{
  "props": [
    {
    "name":"marking",
    "value":"red",
    "class":"TLP"
    }
  ]
}
{{< /highlight >}}

The `"name"` field is the key, and the `"value"` field is the value. Together they form a key-value pair to facilitate automated data lookup. Here we use an optional `"class"` field to provide an additional layer of information, noting that the marking we are using is the TLP protocol.

The optional fields of objects inside `"props"` are as follows:

- `"class"`: A textual label that provides a sub-type or characterization of the property's name. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same name and ns.
- `"uuid"`: A unique identifier that can be used to reference this property elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.
- `"ns"`: A namespace qualifying the property's name. This allows different organizations to associate distinct semantics with the same name.
- `"remarks"`: Additional commentary on the containing object. See [Remarks](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/assessment-plan/xml-schema/#global_remarks_h2).

{{% /tab %}}
{{% tab %}}
The `props` array provides any number of key-value pairings to provide additional information alongside the well-defined fields of the Metadata Section. Some common use cases include labels, sorting tags, and classification. There are no restrictions on using custom `name` and `value` pairs making `prop` an excellent place to do extension of the OSCAL model to meet proprietary use cases. 

For our example, we will create a `props` to mark an OSCAL document with a [Traffic Light Protocol (TLP)](https://en.wikipedia.org/wiki/Traffic_Light_Protocol) classification. 

{{< highlight yaml "linenos=table" >}}
---
  props:
  -  name: marking
     value: red
     class: TLP
{{< /highlight >}}

The `name` field is the key, and the `value` field is the value. Together they form a key-value pair to facilitate automated data lookup. Here we use an optional `class` field to provide an additional layer of information, noting that the marking we are using is the TLP protocol.

The optional fields of the objects inside `props` are as follows:

- `class`: A textual label that provides a sub-type or characterization of the property's name. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same name and ns.
- `uuid`: A unique identifier that can be used to reference this property elsewhere in an OSCAL document. A UUID should be consistently used for a given location across revisions of the document.
- `ns`: A namespace qualifying the property's name. This allows different organizations to associate distinct semantics with the same name.
- `remarks`: Additional commentary on the containing object. See [Remarks](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/assessment-plan/xml-schema/#global_remarks_h2).

{{% /tab %}}
{{% /tabs %}}

## Using Link

{{< tabs XML JSON YAML >}}
{{% tab %}}
Alongside the `<prop>` element, `<link>` is way of providing additional information in the Metadata section that is not covered by the other elements. Each `<link>` must contain a single `href` attribute, which contains a resolvable URI. Each `<link>` should also include a `rel` attribute, which describes the type of relationship provided by the `href`. Although any string can be used in the `rel` attribute, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by RFC 5829.
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.
  - successor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.

For this example, we will create a "latest-version" link, which provides a static link to the latest version of this Document Series. By pointing to a static URL, but updating the contents of that URL as the document is updated, any user that has an old version of the document can quickly and easily update.

{{< highlight xml "linenos=table" >}}
<link rel="latest-version" href="https://www.examplecompany.com/catalog/exampleoscalcatalog/latest"/>
{{< /highlight >}}

The "predecessor-version" and "successor-version" links could be used in tandem with the above to create a navigable web of document versions.

By using other custom `rel` values, any relevant or related resource can be described and linked to in the OSCAL Document's Metadata Section.

Use of the optional `media-type` attribute can provide consumers with processing instructions based on the media type of the resource found at the `href`. See [IANA Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml).
{{% /tab %}}


{{% tab %}}
Alongside the `"props"` array, the `"links"` array is a way of providing additional information in the Metadata section that is not covered by the other fields. Each object inside the `"links"` array must contain a single `"href"` field, which contains a resolvable URI. Each object should also include a `"rel"` field, which describes the type of relationship provided by the `"href"`. Although any string can be used in the `"rel"` field, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by RFC 5829.
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.
  - successor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.

For this example, we will create a "latest-version" link, which provides a static link to the latest version of this Document Series. By pointing to a static URL, but updating the contents of that URL as the document is updated, any user that has an old version of the document can quickly and easily update.

{{< highlight json "linenos=table" >}}
{  
  "links": [
    {
    "rel":"latest-version",
    "href":"https://www.examplecompany.com/catalog/exampleoscalcatalog/latest"
    }
  ]
}
{{< /highlight >}}

The "predecessor-version" and "successor-version" links could be used in tandem with the above to create a navigable web of document versions.

By using other custom `"rel"` values, any relevant or related resource can be described and linked to in the OSCAL Document's Metadata Section.

Use of the optional `"media-type"` field can provide consumers with processing instructions based on the media type of the resource found at the `"href"`. See [IANA Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml).
{{% /tab %}}



{{% tab %}}
Alongside the `props` array, the `links` array is way of providing additional information in the Metadata section that is not covered by the other fields. Each object inside the `links` array must contain a single `href` field, which contains a resolvable URI. Each object should also include a `rel` field, which describes the type of relationship provided by the `href`. Although any string can be used in the `rel` field, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by RFC 5829.
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.
  - successor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.

For this example, we will create a "latest-version" link, which provides a static link to the latest version of this Document Series. By pointing to a static URL, but updating the contents of that URL as the document is updated, any user that has an old version of the document can quickly and easily update.

{{< highlight yaml "linenos=table" >}}
---
  links:
  - rel: latest-version,
    href: https://www.examplecompany.com/catalog/exampleoscalcatalog/latest
{{< /highlight >}}

The "predecessor-version" and "successor-version" links could be used in tandem with the above to create a navigable web of document versions.

By using other custom `rel` values, any relevant or related resource can be described and linked to in the OSCAL Document's Metadata Section.

Use of the optional `media-type` field can provide consumers with processing instructions based on the media type of the resource found at the `href`. See [IANA Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml).
{{% /tab %}}
{{% /tabs %}}
## The Other Optional Elements
{{< tabs XML JSON YAML >}}
{{% tab %}}

The remainder of this tutorial will briefly cover the other optional elements inside the Metadata Section. While not required by the specification, these elements provide invaluable information, particularly for providence and authorship data. This information is declared in the Metadata Section, and is often passed by-reference to other parts of the OSCAL Document. Each element can be clicked to get additional information.

[`<role>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/#global_role) - Roles define some function or purpose that is to be assigned to some entity later in the document. Role elements have a `id` attribute with a [NCName](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context. In the Metadata Section they are as follows:
  - prepared-by: Indicates the organization that created this content.
  - prepared-for: Indicates the organization for which this content was created.
  - content-approver: Indicates the organization responsible for all content represented in the "document".
Other roles can be locally defined by the content creator.

[`<location>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/#global_location) - Geographic data defined by a street address. Locations have a `uuid` attribute that allow them to be referenced elsewhere in the OSCAL Document. Includes elements to describe a variety of data describing the location in question.

[`<party>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/#global_party) - Defines some entity, either a person or an organization. Has a `uuid` attribute that allows for references this party elsewhere in the OSCAL Document. Includes elements to describe a variety of data describing the party in question, including a location uuid.

[`<responsible-party>`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/xml-schema/#global_party) - Explicitly declares a party that is responsible for this OSCAL document. The `role-id` attribute references the role that the party is fulfilling, and is either a custom role locally defined or one of the pore-defined roles; see the `<role>` section above for details. Uses a Party's uuid to link the given role to the given party.

`<remarks>` - [Markup](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-multiline) formatted plaintext with notes and remarks regarding the Metadata Section of this document.
{{% /tab %}}


{{% tab %}}

The remainder of this tutorial will briefly cover the other optional objects inside the Metadata Section. While not required by the specification, these objects provide invaluable information, particularly for providence and authorship data. This information is declared in the Metadata Section, and is often passed by-reference to other parts of the OSCAL Document. Each object can be clicked to get additional information.

[`"roles"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_role) - An array of Role objects. Roles define some function or purpose that is to be assigned to some entity later in the document. Role objects have a `"id"` field with a [NCName](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context. In the Metadata Section they are as follows:
  - prepared-by: Indicates the organization that created this content.
  - prepared-for: Indicates the organization for which this content was created.
  - content-approver: Indicates the organization responsible for all content represented in the "document".
Other roles can be locally defined by the content creator.

[`"locations"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_location) - An array of Location objects. Geographic data defined by a street address. Locations have a `"uuid"` field that allow them to be referenced elsewhere in the OSCAL Document. Includes fields to describe a variety of data describing the location in question.

[`"parties"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_party) - An array of Party objects. Defines some entity, either a person or an organization. Has a `"uuid"` field that allows for references this party elsewhere in the OSCAL Document. Includes fields to describe a variety of data describing the party in question, including a location uuid.

[`"responsible-parties"`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_party) - An array of Responsible-Party objects. Explicitly declares a party that is responsible for this OSCAL document. The `"role-id"` field references the role that the party is fulfilling, and is either a custom role locally defined or one of the pore-defined roles; see the `"roles"` section above for details. Uses a Party's uuid to link the given role to the given party.

`"remarks"` - [Markup](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-multiline) formatted plaintext with notes and remarks regarding the Metadata Section of this document.
{{% /tab %}}


{{% tab %}}

The remainder of this tutorial will briefly cover the other optional objects inside the Metadata Section. While not required by the specification, these objects provide invaluable information, particularly for providence and authorship data. This information is declared in the Metadata Section, and is often passed by-reference to other parts of the OSCAL Document. Each object can be clicked to get additional information.

[`role`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_role) - Roles define some function or purpose that is to be assigned to some entity later in the document. Role objects have a `id` field with a [NCName](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#ncname) that is used to reference the role elsewhere in the OSCAL document. A number of pre-defined roles exist in OSCAL, but differ depending on context. In the Metadata Section they are as follows:
  - prepared-by: Indicates the organization that created this content.
  - prepared-for: Indicates the organization for which this content was created.
  - content-approver: Indicates the organization responsible for all content represented in the "document".
Other roles can be locally defined by the content creator.

[`location`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_location) - Geographic data defined by a street address. Locations have a `uuid` field that allow them to be referenced elsewhere in the OSCAL Document. Includes fields to describe a variety of data describing the location in question.

[`party`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_party) - Defines some entity, either a person or an organization. Has a `uuid` field that allows for references this party elsewhere in the OSCAL Document. Includes fields to describe a variety of data describing the party in question, including a location uuid.

[`responsible-party`](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/json-schema/#global_party) - Explicitly declares a party that is responsible for this OSCAL document. The `role-id` field references the role that the party is fulfilling, and is either a custom role locally defined or one of the pore-defined roles; see the `role` section above for details. Uses a Party's uuid to link the given role to the given party.

`remarks` - [Markup](https://pages.nist.gov/OSCAL/documentation/schema/datatypes/#markup-multiline) formatted plaintext with notes and remarks regarding the Metadata Section of this document.
{{% /tab %}}



{{% /tabs %}}
## Putting it all together 
{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<catalog uuid=c3da6d1d-c20c-4c7c-ae73-4010167a186b>
  <metadata>
      <title>Example OSCAL Document</title>
      <published>2021-01-01T00:00:00-5:00</published>
      <last-modified>2021-01-01T00:00:00-5:00</last-modified>
      <version>1.0.0<version>
      <oscal-version>1.0.0</oscal-version>
      <document-id scheme="https://www.doi.org/">10.1000/182</document-id>
      <prop name="marking" class="TrafficLightProtocol" value="red"/>
      <link rel="latest-version" href="https://www.examplecompany.com/catalog/exampleoscalcatalog/latest"/>
      <party uuid="15d2e37c-0452-4695-9c6a-ddc1ff15397b" type="organization">
        <name>Example Company</name>
      </party>
      <responsible-party role-id="prepared-by">
        <party-uuid>15d2e37c-0452-4695-9c6a-ddc1ff15397b</party-uuid>
      </responsible-party>
  </metadata>
  ...
</catalog>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "c3da6d1d-c20c-4c7c-ae73-4010167a186",
    "metadata": {
      "title":"Example OSCAL Catalog",
      "published":"2021-01-01T00:00:00-5:00",
      "last-modified":"2021-01-01T00:00:00-5:00",
      "version":"1.0.0",
      "oscal-version":"1.0.0",
      "document-ids": [
        {
        "scheme":"https://www.doi.org/",
        "value":"10.1000/182"
        }
      ],
      "props": [
        {
        "name":"marking",
        "value":"red",
        "class":"TLP"
        }
      ],
      "links": [
        {
        "rel":"latest-version",
        "href":"https://www.examplecompany.com/catalog/exampleoscalcatalog/latest"
        }
      ],
      "parties": [
        {
          "uuid":"15d2e37c-0452-4695-9c6a-ddc1ff15397b",
          "type":"organization",
          "name":"Example Company"
        }
      ],
      "responsible-parties":[
        {
          "role-id":"prepared-by",
          "party-uuid":"15d2e37c-0452-4695-9c6a-ddc1ff15397b"
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
    uuid: c3da6d1d-c20c-4c7c-ae73-4010167a186,
    metadata:
      title: Example OSCAL Catalog,
      published: 2021-01-01T00:00:00-5:00,
      last-modified: 2021-01-01T00:00:00-5:00,
      version: 1.0.0,
      oscal-version: 1.0.0,
      document-ids: 
      - scheme: https://www.doi.org/,
        value: 10.1000/182
      props: 
      - name: marking,
        value: red,
        class: TLP
      links: 
      - rel: latest-version,
        href: https://www.examplecompany.com/catalog/exampleoscalcatalog/latest
      parties: 
      - uuid: 15d2e37c-0452-4695-9c6a-ddc1ff15397b,
        type: organization,
        name: Example Company
      responsible-parties:
      - role-id: prepared-by,
        party-uuid: 15d2e37c-0452-4695-9c6a-ddc1ff15397b
{{< /highlight >}}
{{% /tab %}}
{{% /tabs %}}

## Summary

This concludes the tutorial. At this point you should be familiar with:

- The basic structure of the Metadata Section.
- How to provide the basic metadata required to be included in an OSCAL document.
- How to use and understand UUIDs and document-ids to track document instances
- How to use optional fields to express additional metadata and extend the Metadata Section