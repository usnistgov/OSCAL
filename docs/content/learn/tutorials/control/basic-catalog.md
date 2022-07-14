---
title: Creating a Control Catalog
description: A tutorial on creating an OSCAL control catalog.
weight: 20
suppresstopiclist: true
toc:
  enabled: true
aliases:
  - /tutorials/catalog/
  - /learn/tutorials/catalog/
---

This tutorial covers creating a basic OSCAL control catalog.

Before reading this tutorial you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Read the OSCAL control layer [overview](/concepts/layer/control/).
- Review the OSCAL [catalog model overview](/concepts/layer/control/catalog/).

## What is an OSCAL Catalog?

A [catalog][catalog-definition] is a collection of *security and privacy controls*, and related *control enhancements*.

An **OSCAL Control Catalog** is a machine-readable representation of a **catalog**, expressed using the OSCAL [Catalog model][catalog-docs], which includes contextualizing documentation and metadata.

The OSCAL Catalog model provides machine-readable formats in XML, JSON, and YAML, which support representing an equivalent set of catalog information. Examples in this tutorial are provided for XML, JSON, and YAML to show the equivalent representations.

This tutorial describes the formatting of such a catalog using the OSCAL Catalog model XML format.

For the purpose of this tutorial, an [example prose catalog][catalog-prose-sample] has been created based on a short excerpt from [ISO/IEC 27002:2013](https://www.iso.org/standard/54533.html), _Information technology — Security techniques — Code of practice for information security controls_. This work is provided here under copyright "fair use" for non-profit, educational purposes only. Copyrights for this work are held by the publisher, the International Organization for Standardization (ISO).

This tutorial illustrates how to create an OSCAL control catalog using the OSCAL XML, JSON, and YAML formats, which each implement the OSCAL [catalog model](/concepts/layer/control/catalog/). The OSCAL project provides an [XML Schema and documentation](/concepts/layer/control/catalog/), which is useful for validating an XML catalog, and a [JSON Schema and documentation](/concepts/layer/control/catalog/), which is useful for validating JSON and YAML catalogs. However, this tutorial is not focusing on the schemas themselves, but rather on the formatting the sample control catalog listed above in OSCAL.

## Creating an OSCAL Catalog

The examples below illustrate the top-level structure of the OSCAL control catalog model.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns="http://csrc.nist.gov/ns/oscal/1.0"
    uuid="edaf664a-e984-4dbf-85ec-1104186fc12f">
    <metadata/>
    <group/>
    <control/>
    <back-matter/>
</catalog>
{{< /highlight >}}

The root of the OSCAL control catalog model is [`<catalog>`](/reference/latest/catalog/xml-reference/#/catalog).

In the example above, the contents of the `<catalog>` element is provided as empty data items. These are included to illustrate the content model of an OSCAL catalog, and we will be covering each element's syntax later in this tutorial.

The `@id` attribute (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `<catalog>` contains:

- `<metadata>` (required) - Provides document metadata for the catalog. This is explored below in the [defining the catalog's metadata](#defining-the-catalogs-metadata) section of this tutorial.
- `<group>` (optional) - Allows for grouping of `<control>` and other `<group>` elements. Zero or more `<group>` elements may be used. This is explored below in the [representing groups in a catalog](#representing-groups-in-a-catalog) section of this tutorial.
- `<control>` (optional) - Defines a given control in the catalog. Zero or more `<control>` elements may be used, and a `<control>` can be nested within another `<control>` element to identify an optional portion of a control that can be managed as a discrete unit (e.g., a control enhancement). This is explored below in the [representing control information](#representing-control-information) section of this tutorial.
- `<back-matter>` (optional) – Contains references used within the catalog. Use of `<back-matter>` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog": {
    "uuid": "edaf664a-e984-4dbf-85ec-1104186fc12f",
    "metadata": {},
    "groups": {},
    "controls": {},
    "back-matter": {}
  }
}
{{< /highlight >}}

The root of the OSCAL control catalog model is the [`catalog`](/reference/latest/catalog/json-reference/#/catalog) property.

In the example above, the contents of the `catalog` property is provided as empty object properties. These are included to illustrate the content model of an OSCAL catalog, and we will be covering each child property's syntax later in this tutorial.

The `id` property (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `catalog` contains the following props:

- `metadata` (required) - Provides document metadata for the catalog. This is explored below in the [defining the catalog's metadata](#defining-the-catalogs-metadata) section of this tutorial.
- `groups` (optional) - Allows for grouping of `controls` and other `groups` properties. Contains one or more group objects. This is explored below in the [representing groups in a catalog](#representing-groups-in-a-catalog) section of this tutorial.
- `controls` (optional) - Contains one or more control objects, which can nest other control objects to identify an optional portion of a control that can be managed as a discrete unit (e.g., a control enhancement). This is explored below in the [representing control information](#representing-control-information) section of this tutorial.
- `back-matter` (optional) – Contains references used within the catalog. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog:
  uuid: edaf664a-e984-4dbf-85ec-1104186fc12f
  metadata:
  groups:
  controls:
  back-matter:
{{< /highlight >}}

The root of the OSCAL control catalog model is the [`catalog`](/reference/latest/catalog/json-reference/#/catalog) item.

In the example above, the contents of the `catalog` item is provided as keys with empty collections. These are included to illustrate the content model of an OSCAL catalog, and we will be covering their syntax later in this tutorial.

The `id` key (on line 3) is the document's *universally unique identifier* (UUID), a unique 128-bit number displayed as a string of hyphenated hexadecimal digits as defined by [RFC 4122](https://tools.ietf.org/html/rfc4122). OSCAL documents use a version 4 UUID (randomly generated) to uniquely identify the document.

A `catalog` contains:

- `metadata` (required) - Provides document metadata for the catalog. This is explored below in the [defining the catalog's metadata](#defining-the-catalogs-metadata) section of this tutorial.
- `groups` (optional) - Allows for grouping of `controls` and other `groups` keys. Contains one or more group items. This is explored below in the [representing groups in a catalog](#representing-groups-in-a-catalog) section of this tutorial.
- `controls` (optional) - Contains one or more control items, which can nest other control items to identify an optional portion of a control that can be managed as a discrete unit (e.g., a control enhancement). This is explored below in the [representing control information](#representing-control-information) section of this tutorial.
- `back-matter` (optional) – Contains references used within the catalog. Use of `back-matter` is not covered in this tutorial.
{{% /tab %}}
{{< /tabs >}}

We will now discuss each of these data structures in the following sections and identify how they each can be used to represent our catalog.

## Defining the Catalog's Metadata

The *metadata* section of the control catalog contains data about the catalog document. This section has an identical structure which is used consistently across all OSCAL models.

This tutorial focuses only on the mandatory data required in the metadata section. A separate tutorial will focus on the full syntax available in the metadata section.

The metadata section must include:

- the title of the catalog
- the time the catalog was last modified
- the version of OSCAL used

The following additional data items from the [sample security catalog][catalog-prose-sample] also need to be defined in the OSCAL catalog.

```text
Version: 1.0
Published: 02.02.2020
Last Modified: 02.10.2020
```

All of these data items can be represented as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<metadata>
  <title>Sample Security Catalog <em>for Demonstration</em> and Testing</title>
  <published>2020-02-02T11:01:04.736-04:00</published>
  <last-modified>2020-12-18T16:23:23.811-05:00</last-modified>
  <version>1.0</version>
  <oscal-version>1.0.0-rc1</oscal-version>
</metadata>
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1: The [`<metadata>`](/reference/latest/catalog/xml-reference/#/catalog/metadata) element, which contains the document's metadata.
- Line 2: The document's title (i.e., `Sample Security Catalog`) is provided using `<title>` element. The document's title is a mandatory field for an OSCAL Catalog.
- Line 3: The date when the document was published (i.e., `2020-02-02T11:01:04.736-04:00`) is provided using `<published>` element. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 4: The date when the document was last modified (i.e., `2020-12-18T16:23:23.811-05:00`) is provided using `<last-modified>` element. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 5: The version of the document (i.e., `1.0`) is provided using the `<version>` element. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 6: Finally, the OSCAL version is provided using the `<oscal-version>` element, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-rc1`.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "metadata": {
    "title": "Sample Security Catalog *for Demonstration* and Testing",
    "published": "2020-02-02T11:01:04.736-04:00",
    "last-modified": "2020-12-18T16:23:23.811-05:00",
    "version": "1.0",
    "oscal-version": "1.0.0-rc1"
  }
}
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 2: The [`metadata`](/reference/latest/catalog/json-reference/#/catalog/metadata) property, who's value is an object which contains properties representing the document's metadata.
- Line 3: The document's title (i.e., `Sample Security Catalog`) is provided using `title` property. The document's title is a mandatory field for an OSCAL catalog.
- Line 4: The date when the document was published (i.e., `2020-02-02T11:01:04.736-04:00`) is provided using the `published` property. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 5: The date when the document was last modified (i.e., `2020-12-18T16:23:23.811-05:00`) is provided using the `last-modified` property. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 6: The version of the document (i.e., `1.0`) is provided using the `version` property. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 7: Finally, the OSCAL version is provided using the `oscal-version` property, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-rc1`.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
metadata:
  title: Sample Security Catalog *for Demonstration* and Testing
  published: '2020-02-02T11:01:04.736-04:00'
  last-modified: '2020-12-18T16:23:23.811-05:00'
  version: '1.0'
  oscal-version: 1.0.0-rc1
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1: The [`metadata`](/reference/latest/catalog/json-reference/#/catalog/metadata) block, who's value is a mapping of keys representing the document's metadata.
- Line 2: The document's title (i.e., `Sample Security Catalog`) is provided using `title` key. The document's title is a mandatory field for an OSCAL Catalog.
- Line 3: The date when the document was published (i.e., `2020-02-02T11:01:04.736-04:00`) is provided using the `published` key. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The published date is not a mandatory field for an OSCAL Catalog.
- Line 4: The date when the document was last modified (i.e., `2020-12-18T16:23:23.811-05:00`) is provided using the `last-modified` key. This date is provided using the [RFC 3339](https://tools.ietf.org/html/rfc3339#section-5.6) format with a required timezone. The last modified date is a mandatory field for an OSCAL Catalog.
- Line 5: The version of the document (i.e., `1.0`) is provided using the `version` key. This can be a numeric version, commit hash, or any other suitable version identifier. The document version is a mandatory field for an OSCAL Catalog.
- Line 6: Finally, the OSCAL version is provided using the `oscal-version` key, which represents the revision of the OSCAL Catalog model for which the catalog was created under. The current OSCAL version is `1.0.0-rc1`.
{{% /tab %}}
{{< /tabs >}}

## Representing Groups in a Catalog

An OSCAL catalog allows for the organization of related controls using groups. A catalog group can represent families of controls or other organizational structures, such as sections in a control catalog.

Analyzing the body of the [Catalog Sample][catalog-prose-sample], we observe that the catalog has multiple sections and sub-sections as follows:

```text
1 Organization of Information Security
  1.1 Internal Organization
      Objective: [...]
      1.1.1 Information security roles and responsibilities
            [...]
      1.1.2 Segregation of duties
            [...]
2 Access Control
  2.1 Business Requirements of Access Control
      Objective: [...]
      2.1.1 Access control policy
            [...]
      2.1.2 Access to networks and network services
            [...]
```

In the above, controls are organized into two top-level groups: 1 *Organization of Information Security* and 2 *Access Control*. Each of these sections have sub-sections that define an *Objective*, and these sub-sections then define a series of controls.

The first section in the example catalog is represented in an OSCAL catalog as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<group class="section" id="s1">
  <title>Organization of Information Security</title>
  <prop name="label">1</prop>
  <group id="s1.1">
    <title>Internal Organization</title>
    <prop name="label">1.1</prop>
    <part id="s1.1_smt" name="objective">
      <p>To establish a management framework to initiate and control the implementation and
        operation of information security within the organization.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1 declares a new group using the `<group>` element. The `@id` attribute defines the group's required unique identifier `s1`. A group's unique identifier must be unique within the document. An identifier in OSCAL is a string that may not contain spaces or colons.
- Line 2 provides the group's title using the `<title>` element. A title can be simple text or can include [html markup](/reference/datatypes/#markup-line).
- Line 3 defines a property of the group using the `<prop>` element. This property element has a `@name="label`, which defines the name of the property (i.e. `label`), and textual content `1`, which defines the property's value. A property with the name `label` provides the text label that can be prepended to the title when formatting the content for human readability.

   In OSCAL, properties are commonly used constructs that allow for arbitrary name/value data to be defined. This name/value data helps to describe the containing element. Most major XML elements within OSCAL allow for properties to be defined. Names, like identifiers, are strings that may not contain spaces or colons.

- Lines 4 thru 6 declare a new child group of the group defined on line 1, and is nested/indented within the context of the parent group to indicate it is a child. This child group represents the sub-section `1.1 Internal Organization`, along with its title (line 5) and label (line 6). Notice that the title and label are declared in the same way as the parent section, using `<title>` and `<prop>` elements.
- Lines 7 thru 10 define the sub-section's objective using a `<part>` element and child content. A part requires:
  - a unique identifier specified by the `@id` attribute, which identifies the part.
  - a name specified by the `@name` attribute, which identifies the type of the part. The name `objective` is used to indicate that the part represents an objective.
  - A sequence of child HTML [prose block elements](/reference/datatypes/#markup-multiline). In this example, the `<p>` element is used to represent a paragraph of text. The prose model allows for other [structural markup](/reference/datatypes/#markup-line) to be included within each block, to indicate emphasis (italics), importance (bold), etc.

    While not illustrated here, a `<part>` element can also include child parts to denote a hierarchy of text. This will be covered in a future tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "groups": [ {
    "id" : "s1",
    "title" : "Organization of Information Security",
    "props" : [ {
      "name" : "label",
      "value" : "1"
    } ],
    "groups" : [ {
      "id" : "s1.1",
      "title" : "Internal Organization",
      "props" : [ {
        "name" : "label",
        "value" : "1.1"
      } ],
      "parts" : [ {
        "id" : "s1.1_smt",
        "name" : "objective",
        "prose" : "To establish a management framework to initiate and control the implementation and\noperation of information security within the organization."
      } ],
      "controls" : [ ]
    } ]
  } ]
}
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 2 declares a new group using a group object in the `groups` array.
- Line 3 where the `id` property defines the group's required unique identifier `s1`. A group's unique identifier must be unique within the document. An identifier in OSCAL is a string that may not contain spaces or colons.
- Line 4 provides the group's title using the `title` property. A title can be simple text or can include [Markdown](/reference/datatypes/#markup-line).
- Lines 5 thru 8 define an array of properties for the group using the `properties` property.
  - On line 6 the property's name `label` is provided using the `name` JSON property. A property with the name `label` provides the text label that can be prepended to the title when formatting the content for human readability.
  - On line 7 the property's value `1` is provided using the `value` JSON property.

    In OSCAL, properties are commonly used constructs that allow for arbitrary name/value data to be defined. This name/value data helps to describe the containing object. Most major JSON objects within OSCAL allow for properties to be defined. Names, like identifiers, are strings that may not contain spaces or colons.

- Lines 9 thru 22 declare a new child group of the group defined on line 1, and is nested/indented within the context of the parent group to indicate it is a child. This child group represents the sub-section `1.1 Internal Organization`, along with its title (line 11) and label (lines 12 thru 15). Notice that the title and label are declared in the same way as the parent section, using the `title` and `properties` JSON properties.
- Lines 16 thru 20 define the sub-section's objective using the `parts` property and associated array of objects. In this case we have a single part object. A part requires:
  - a unique identifier specified by the `id` property (line 17), which identifies the part.
  - a name specified by the `name` property (line 18), which identifies the type of the part. The name `objective` is used to indicate that the part represents an objective.
  - A string of Markdown [prose](/reference/datatypes/#markup-multiline) content (line 19) contained by the `prose` property. In Markdown double newlines are used to delineate different paragraphs of text. These newlines are escaped in JSON, since all string content needs to be on a single line.

    The OSCAL prose model allows for other [structural markup](/reference/datatypes/#markup-line) to be included within Markdown text, to indicate emphasis (italics), importance (bold), etc.

    While not illustrated here, a `part` can also include child parts to denote a hierarchy of text. This will be covered in a future tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
groups:
- id: s1
  title: Organization of Information Security
  props:
  - name: label
    value: 1
  groups:
  - id: s1.1
    title: Internal Organization
    props:
    - name: label
      value: 1.1
    parts:
    - id: s1.1_smt
      name: objective
      prose: |-
        To establish a management framework to initiate and control the implementation and
        operation of information security within the organization.
    controls:
{{< /highlight >}}

Breaking this down line-by-line you will notice the following:

- Line 1 declares a list of group items using the `groups` key.
- Line 2 starts a new group item and the `id` key defines the group's required unique identifier `s1`. A group's unique identifier must be unique within the document. An identifier in OSCAL is a string that may not contain spaces or colons.
- Line 3 provides the group's title using the `title` key. A title can be simple text or can include [Markdown](/reference/datatypes/#markup-line).
- Lines 4 thru 6 define a list of properties for the group using the `properties` key.
  - Line 5 starts a new property item and the `name` key provides the name `label` for the property. A property with the name `label` provides the text label that can be prepended to the title when formatting the content for human readability.
  - On line 6 the key `value` provides the property's value `1`.

    In OSCAL, properties are commonly used constructs that allow for arbitrary name/value data to be defined. This name/value data helps to describe the containing item. Most major YAML items within OSCAL allow for properties to be defined. Names, like identifiers, are strings that may not contain spaces or colons.

- Lines 7 thru 19 declare a new child group of the group defined on line 2, and is nested/indented within the context of the parent group to indicate it is a child. This child group represents the sub-section `1.1 Internal Organization`, along with its title (line 9) and label (lines 10 thru 12). Notice that the title and label are declared in the same way as the parent section, using the `title` and `properties` keys.
- Lines 13 thru 18 define the sub-section's objective using the `parts` property and associated array of objects. In this case we have a single part object. A part requires:
  - a unique identifier specified by the `id` property (line 17), which identifies the part.
  - a name specified by the `name` property (line 18), which identifies the type of the part. The name `objective` is used to indicate that the part represents an objective.
  - A string of Markdown [prose](/reference/datatypes/#markup-multiline) content (lines 17 and 18) contained by the `prose` key. In Markdown double newlines are used to delineate different paragraphs of text. Since multiline strings are supported in YAML, YAML markdown is more natural to write, as compared to JSON Markdown where character like `\n` need to be escaped.

    The OSCAL prose model allows for other [structural markup](/reference/datatypes/#markup-line) to be included within Markdown text, to indicate emphasis (italics), importance (bold), etc.

    While not illustrated here, a `part` can also include child parts to denote a hierarchy of text. This will be covered in a future tutorial.
{{% /tab %}}
{{< /tabs >}}

The sections of the original document have numbers, and therefore, we base the identifier values for each group on the heading numbers of the sections and the subsections, with a leading character such as *s* in front as a way to avoid any potential id conflicts.

Section 2 follows suit, resulting in the following representation of both sections:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<group class="section" id="s1">
  <title>Organization of Information Security</title>
  <prop name="label">1</prop>
  <group id="s1.1">
    <title>Internal Organization</title>
    <prop name="label">1.1</prop>
    <part id="s1.1_smt" name="objective">
      <p>To establish a management framework to initiate and control the implementation and
        operation of information security within the organization.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
<group id="s2">
  <title>Access control</title>
  <prop name="label">2</prop>
  <group id="s2.1">
    <title>Business requirements of access control</title>
    <prop name="label">2.1</prop>
    <part id="s2.1_smt" name="objective">
      <p>To limit access to information and information processing facilities.</p>
    </part>
    <!-- controls go here -->
  </group>
</group>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "groups" : [ {
    "id" : "s1",
    "class" : "section",
    "title" : "Organization of Information Security",
    "props" : {
      "label" : "1"
    },
    "groups" : {
      "id" : "s1.1",
      "title" : "Internal Organization",
      "props" : {
        "label" : "1.1"
      },
      "parts" : {
        "id" : "s1.1_smt",
        "name" : "objective",
        "prose" : "To establish a management framework to initiate and control the implementation and\noperation of information security within the organization."
      },
      "controls" : [
      ]
    }
  }, {
    "id" : "s2",
    "class" : "section",
    "title" : "Access control",
    "props" : {
      "label" : "2"
    },
    "groups" : {
      "id" : "s2.1",
      "title" : "Business requirements of access control",
      "props" : {
        "label" : "2.1"
      },
      "parts" : {
        "id" : "s2.1_smt",
        "name" : "objective",
        "prose" : "To limit access to information and information processing facilities."
      },
      "controls" : [
      ]
    }
  } ]
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
  groups:
    - id: s1
      class: section
      title: Organization of Information Security
      props:
        label: '1'
      groups:
        id: s1.1
        title: Internal Organization
        props:
          label: '1.1'
        parts:
          id: s1.1_smt
          name: objective
          prose: >-
            To establish a management framework to initiate and control the implementation and operation of information security within the organization.
        controls:
    - id: s2
      class: section
      title: Access control
      props:
        label: '2'
      groups:
        id: s2.1
        title: Business requirements of access control
        props:
          label: '2.1'
        parts:
          id: s2.1_smt
          name: objective
          prose: >-
            To limit access to information and information processing facilities.
        controls:
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

## Representing Control Information

In the [catalog sample][catalog-prose-sample], controls are defined following the **Objective** in each section. Each control in the sample provides a **control statement**, expressing the control's requirement; an **Implementation Guidance** section, providing guidelines to consider when implementing the control; and often some additional information titled **Other information**.

The structure of the first control, `1.1.1 Information security roles` is represented below:

>  **1.1.1 Information security roles and responsibilities**
>
>  **Control**
>
>  All information security responsibilities should be defined and allocated.
>
>  **Implementation Guidance**
>
>  Allocation of information security responsibilities should ...
>
>  **Other information**
>
>  Many organizations appoint an information security manager ...

Note: The text of the above example has been elided to condense the example.

OSCAL provides the syntax to represent a *control* and its content in a structured, machine-readable form. The first control from the Sample Security Catalog has three parts:

1. The control statement, labeled as `Control`.
1. A set of implementation guidance, labeled as `Implementation Guidance`.
1. A set of supplemental information, labeled as `Other Information`.

The following sub-sections will illustrate how to define these parts in OSCAL.

### Defining a Control and the Control Statement

IN OSCAL, the minimum data needed to define a control is as follows:


{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<control id="s1.1.1">
  <title>Information security roles and responsibilities</title>
  <prop name="label">1.1.1</prop>
  <part id="s1.1.1_stm" name="statement">
    <p>All information security responsibilities should be defined and allocated.</p>
  </part>
</control>
{{< /highlight >}}

A control is represented using the `<control>` element as shown on line 1. Like most major elements in OSCAL, a control is required to have an identifier provided using the `@id` attribute.

Another required piece of information for a control is the control's title provided by the `<title>` element (line 2).

While optional in the OSCAL model, the need often exists to provide a section or control label that is used to identify the control within its source document. Using the `<prop>` element, an OSCAL property with the name `label` is used to provide the section number label value. This is illustrated on line 3.

Finally, a control must have a set of control statements. Shown on lines 4 thru 6, a `<part>` element with the name `statement` provides the required statement text using [HTML markup](/reference/datatypes/#markup-multiline). This uses the same part structure we reviewed earlier in this tutorial for defining text within a group. This part is also assigning the identifier `s1.1.1_stm` using the `@id` attribute. This identifier can be used to reference the specific statement in the OSCAL catalog.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "controls" : [ {
    "id" : "s1.1.1",
    "title" : "Information security roles and responsibilities",
    "props" : [ {
      "name" : "label",
      "value" : "1.1.1"
    } ],
    "parts" : [ {
      "id" : "s1.1.1_stm",
      "name" : "statement",
      "prose" : "All information security responsibilities should be defined and allocated."
    } ]
  } ]
}
{{< /highlight >}}

A control is represented as a JSON object with the array value of the `controls` property as shown on line 2. Like most major JSON objects in OSCAL, a control is required to have an identifier provided using the `id` property (line 3).

Another required piece of information for a control is the control's title provided by the `title` property (line 4).

While optional in the OSCAL model, the need often exists to provide a section or control label that is used to identify the control within its source document. The `properties` JSON property provides an array of OSCAL property objects. An OSCAL property with the name `label` is used to provide the section number label value. This is illustrated on lines 5 thru 8.

Finally, a control must have a set of control statements. Shown on lines 9 thru 13, the `parts` property allows an array of part JSON objects to be provided. a part object with the name `statement` provides the required statement text using [Markdown text](/reference/datatypes/#markup-multiline). This uses the same part structure we reviewed earlier in this tutorial for defining text within a group. This part is also assigning the identifier `s1.1.1_stm` using the `id` property. This identifier can be used to reference the specific statement in the OSCAL catalog.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
controls:
- id: s1.1.1
  title: Information security roles and responsibilities
  props:
  - name: label
    value: 1.1.1
  parts:
  - id: s1.1.1_stm
    name: statement
    prose: All information security responsibilities should be defined and allocated.
{{< /highlight >}}


A control is represented as a YAML list item, with the list having the key `controls` as shown on line 1. Like most major YAML objects in OSCAL, a control is required to have an identifier provided using the `id` key (line 2).

Another required piece of information for a control is the control's title provided by the `title` key (line 4).

While optional in the OSCAL model, the need often exists to provide a section or control label that is used to identify the control within its source document. The `properties` key provides an array of OSCAL property items. An OSCAL property is defined on lines 5 thru 6, with a name `label` and the value `1.1.1` to provide the section number label value.

Finally, a control must have a set of control statements. Shown on lines 8 thru 10, a list of parts identified using the `parts` key allows a list of part YAML items to be provided. a part object with the name `statement` provides the required statement text using [Markdown text](/reference/datatypes/#markup-multiline). This uses the same part structure we reviewed earlier in this tutorial for defining text within a group. This part is also assigning the identifier `s1.1.1_stm` using the `id` property. This identifier can be used to reference the specific statement in the OSCAL catalog.
{{% /tab %}}
{{< /tabs >}}

This represents the minimum information for defining a control. The next section discusses how to provide additional control-related information.

### Including Implementation Guidance and Other Supplemental Information

The sample security catalog also has the `Implementation Guidance` and `Other Information` sections within the control. These sections can be expressed in an OSCAL control as additional markup content as follows:

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<control id="s1.1.1">
  <title>Information security roles and responsibilities</title>
  <prop name="label">1.1.1</prop>
  <part id="s1.1.1_stm" name="statement">
    <p>All information security responsibilities should be defined and allocated.</p>
  </part>
  <part id="s1.1.1_gdn" name="guidance">
    <part id="s1.1.1_gdn.1" name="item">
      <p>Allocation of information security responsibilities should be done in accordance with
        the information security policies. Responsibilities for the protection of individual
        assets and for carrying out specific information security processes should be
        identified. Responsibilities for information security risk management activities and
        in particular for acceptance of residual risks should be defined. These
        responsibilities should be supplemented, where necessary, with more detailed guidance
        for specific sites and information processing facilities. Local responsibilities for
        the protection of assets and for carrying out specific security processes should be
        defined.</p>
    </part>
    <part id="s1.1.1_gdn.2" name="item">
      <p>Individuals with allocated information security responsibilities may delegate
        security tasks to others. Nevertheless they remain accountable and should determine
        that any delegated tasks have been correctly performed.</p>
    </part>
    <part id="s1.1.1_gdn.3" name="item">
      <p>Areas for which individuals are responsible should be stated. In particular the
        following should take place:</p>
      <ol>
        <li>the assets and information security processes should be identified and
          defined;</li>
        <li>the entity responsible for each asset or information security process should be
          assigned and the details of this responsibility should be documented;</li>
        <li>authorization levels should be defined and documented;</li>
        <li>to be able to fulfil responsibilities in the information security area the
          appointed individuals should be competent in the area and be given opportunities to
          keep up to date with developments;</li>
        <li>coordination and oversight of information security aspects of supplier
          relationships should be identified and documented.</li>
      </ol>
    </part>
  </part>
  <part id="s1.1.1_inf" name="information">
    <p>Many organizations appoint an information security manager to take overall
      responsibility for the development and implementation of information security and to
      support the identification of controls.</p>
    <p>However, responsibility for resourcing and implementing the controls will often remain
      with individual managers. One common practice is to appoint an owner for each asset who
      then becomes responsible for its day-to-day protection.</p>
  </part>
</control>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
"controls" : [ {
  "id" : "s1.1.1",
  "title" : "Information security roles and responsibilities",
  "props" : [ {
    "name" : "label",
    "value" : "1.1.1"
  } ],
  "parts" : [ {
    "id" : "s1.1.1_stm",
    "name" : "statement",
    "prose" : "All information security responsibilities should be defined and allocated."
  }, {
    "id" : "s1.1.1_gdn",
    "name" : "guidance",
    "parts" : [ {
      "id" : "s1.1.1_gdn.1",
      "name" : "item",
      "prose" : "Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined."
    }, {
      "id" : "s1.1.1_gdn.2",
      "name" : "item",
      "prose" : "Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed."
    }, {
      "id" : "s1.1.1_gdn.3",
      "name" : "item",
      "prose" : "Areas for which individuals are responsible should be stated. In particular the following should take place:\n\n1. the assets and information security processes should be identified and defined;\n2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;\n3. authorization levels should be defined and documented;\n4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;\n5. coordination and oversight of information security aspects of supplier relationships should be identified and documented."
    } ]
  }, {
    "id" : "s1.1.1_inf",
    "name" : "information",
    "prose" : "Many organizations appoint an information security manager to take overall responsibility for the development and implementation of information security and to support the identification of controls.\n\nHowever, responsibility for resourcing and implementing the controls will often remain with individual managers. One common practice is to appoint an owner for each asset who then becomes responsible for its day-to-day protection."
  } ]
} ]
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
controls:
- id: s1.1.1
  title: Information security roles and responsibilities
  props:
  - name: label
    value: 1.1.1
  parts:
  - id: s1.1.1_stm
    name: statement
    prose: All information security responsibilities should be defined and allocated.
  - id: s1.1.1_gdn
    name: guidance
    parts:
    - id: s1.1.1_gdn.1
      name: item
      prose: |-
        Allocation of information security responsibilities should be done in accordance with
        the information security policies. Responsibilities for the protection of individual
        assets and for carrying out specific information security processes should be
        identified. Responsibilities for information security risk management activities and
        in particular for acceptance of residual risks should be defined. These
        responsibilities should be supplemented, where necessary, with more detailed guidance
        for specific sites and information processing facilities. Local responsibilities for
        the protection of assets and for carrying out specific security processes should be
        defined.
    - id: s1.1.1_gdn.2
      name: item
      prose: |-
        Individuals with allocated information security responsibilities may delegate
        security tasks to others. Nevertheless they remain accountable and should determine
        that any delegated tasks have been correctly performed.
    - id: s1.1.1_gdn.3
      name: item
      prose: |-
        Areas for which individuals are responsible should be stated. In particular the
        following should take place:

        1. the assets and information security processes should be identified and defined;
        2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;
        3. authorization levels should be defined and documented;
        4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;
        5. coordination and oversight of information security aspects of supplier relationships should be identified and documented.
  - id: s1.1.1_inf
    name: information
    prose: |-
      Many organizations appoint an information security manager to take overall
      responsibility for the development and implementation of information security and to
      support the identification of controls.

      However, responsibility for resourcing and implementing the controls will often remain
      with individual managers. One common practice is to appoint an owner for each asset who
      then becomes responsible for its day-to-day protection.
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

Using additional parts, all of the additional content is included. The `Implementation Guidance` section is contained within a part named `guidance` and the `Other Information` section is contained within a part named `information`. Notice in the above that each part has a unique identifier, and that the `guidance` part has child parts, which contain distinct areas of guidance.

## The Final Catalog

The same control approach can also be applied to the rest of the controls in the *Sample Security Catalog* (i.e., 1.1.2, 2.1.1 and 2.2.1).

Assembling all of the control content described in this tutorial, we obtain the final structure of the *Sample Security Catalog* ([XML]({{< param "contentRepoPath" >}}/examples/catalog/xml/basic-catalog.xml), [JSON]({{< param "contentRepoPath" >}}/examples/catalog/json/basic-catalog.json), [YAML]({{< param "contentRepoPath" >}}/examples/catalog/yaml/basic-catalog.yaml)):

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<catalog xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://csrc.nist.gov/ns/oscal/1.0 ../../../../xml/schema/oscal_catalog_schema.xsd"
  xmlns="http://csrc.nist.gov/ns/oscal/1.0" id="uuid-956c32af-8a15-4732-a4d9-f976a1149c4b">
  <metadata>
    <title>Sample Security Catalog</title>
    <published>2020-02-02T11:01:04.736-04:00</published>
    <last-modified>2020-02-10T11:01:04.736-04:00</last-modified>
    <version>1.0</version>
    <oscal-version>1.0.0</oscal-version>
  </metadata>
  <group id="s1">
    <title>Organization of Information Security</title>
    <prop name="label">1</prop>
    <group id="s1.1">
      <title>Internal Organization</title>
      <prop name="label">1.1</prop>
      <part id="s1.1_smt" name="objective">
        <p>To establish a management framework to initiate and control the implementation and
          operation of information security within the organization.</p>
      </part>
      <control id="s1.1.1">
        <title>Information security roles and responsibilities</title>
        <prop name="label">1.1.1</prop>
        <part id="s1.1.1_stm" name="statement">
          <p>All information security responsibilities should be defined and allocated.</p>
        </part>
        <part id="s1.1.1_gdn" name="guidance">
          <part id="s1.1.1_gdn.1" name="item">
            <p>Allocation of information security responsibilities should be done in accordance with
              the information security policies. Responsibilities for the protection of individual
              assets and for carrying out specific information security processes should be
              identified. Responsibilities for information security risk management activities and
              in particular for acceptance of residual risks should be defined. These
              responsibilities should be supplemented, where necessary, with more detailed guidance
              for specific sites and information processing facilities. Local responsibilities for
              the protection of assets and for carrying out specific security processes should be
              defined.</p>
          </part>
          <part id="s1.1.1_gdn.2" name="item">
            <p>Individuals with allocated information security responsibilities may delegate
              security tasks to others. Nevertheless they remain accountable and should determine
              that any delegated tasks have been correctly performed.</p>
          </part>
          <part id="s1.1.1_gdn.3" name="item">
            <p>Areas for which individuals are responsible should be stated. In particular the
              following should take place:</p>
            <ol>
              <li>the assets and information security processes should be identified and
                defined;</li>
              <li>the entity responsible for each asset or information security process should be
                assigned and the details of this responsibility should be documented;</li>
              <li>authorization levels should be defined and documented;</li>
              <li>to be able to fulfil responsibilities in the information security area the
                appointed individuals should be competent in the area and be given opportunities to
                keep up to date with developments;</li>
              <li>coordination and oversight of information security aspects of supplier
                relationships should be identified and documented.</li>
            </ol>
          </part>
        </part>
        <part id="s1.1.1_inf" name="information">
          <p>Many organizations appoint an information security manager to take overall
            responsibility for the development and implementation of information security and to
            support the identification of controls.</p>
          <p>However, responsibility for resourcing and implementing the controls will often remain
            with individual managers. One common practice is to appoint an owner for each asset who
            then becomes responsible for its day-to-day protection.</p>
        </part>
      </control>
      <control id="s1.1.2">
        <title>Segregation of duties</title>
        <prop name="label">1.1.2</prop>
        <part id="s1.1.2_stm" name="statement">
          <p>Conflicting duties and areas of responsibility should be segregated to reduce
            opportunities for unauthorized or unintentional modification or misuse of the
            organization’s assets.</p>
        </part>
        <part id="s1.1.2_gdn" name="guidance">
          <part id="s1.1.2_gdn.1" name="item">
            <p>Care should be taken that no single person can access, modify or use assets without
              authorization or detection. The initiation of an event should be separated from its
              authorization. The possibility of collusion should be considered in designing the
              controls.</p>
          </part>
          <part id="s1.1.2_gdn.2" name="item">
            <p>Small organizations may find segregation of duties difficult to achieve, but the
              principle should be applied as far as is possible and practicable. Whenever it is
              difficult to segregate, other controls such as monitoring of activities, audit trails
              and management supervision should be considered.</p>
          </part>
        </part>
        <part id="s1.1.2_inf" name="information">
          <p>Segregation of duties is a method for reducing the risk of accidental or deliberate
            misuse of an organization’s assets.</p>
        </part>
      </control>
    </group>
  </group>
  <group id="s2">
    <title>Access control</title>
    <prop name="label">2</prop>
    <group id="s2.1">
      <title>Business requirements of access control</title>
      <prop name="label">2.1</prop>
      <part id="s2.1_smt" name="objective">
        <p>To limit access to information and information processing facilities.</p>
      </part>
      <control id="s2.1.1">
        <title>Access control policy</title>
        <prop name="label">2.1.1</prop>
        <part id="s2.1.1_stm" name="statement">
          <p>An access control policy should be established, documented and reviewed based on
            business and information security requirements.</p>
        </part>
        <part id="s2.1.1_gdn" name="guidance">
          <part id="s2.1.1_gdn.1" name="item">
            <p>Asset owners should determine appropriate access control rules, access rights and
              restrictions for specific user roles towards their assets, with the amount of detail
              and the strictness of the controls reflecting the associated information security
              risks.</p>
          </part>
          <part id="s2.1.1_gdn.2" name="item">
            <p>Access controls are both logical and physical and these should be considered
              together.</p>
          </part>
          <part id="s2.1.1_gdn.3" name="item">
            <p>Users and service providers should be given a clear statement of the business
              requirements to be met by access controls.</p>
          </part>
          <part id="s2.1.1_gdn.4" name="item">
            <p>The policy should take account of the following:</p>
            <ol>
              <li>security requirements of business applications;</li>
              <li>policies for information dissemination and authorization, e.g. the need-to-know
                principle and information security levels and classification of information;</li>
              <li>consistency between the access rights and information classification policies of
                systems and networks;</li>
              <li>relevant legislation and any contractual obligations regarding limitation of
                access to data or services;</li>
              <li>management of access rights in a distributed and networked environment which
                recognizes all types of connections available;</li>
              <li>segregation of access control roles, e.g. access request, access authorization,
                access administration;</li>
              <li>requirements for formal authorization of access requests;</li>
              <li>requirements for periodic review of access rights;</li>
              <li>removal of access rights;</li>
              <li>archiving of records of all significant events concerning the use and management
                of user identities and secret authentication information;,</li>
              <li>roles with privileged access.</li>
            </ol>
          </part>
        </part>
        <part id="s2.1.1_stm" name="information">
          <part id="s2.1.1_stm.1" name="item">
            <p>Care should be taken when specifying access control rules to consider:</p>
            <ol>
              <li>establishing rules based on the premise “Everything is generally forbidden unless
                expressly permitted” rather than the weaker rule “Everything is generally permitted
                unless expressly forbidden”;</li>
              <li>changes in information labels that are initiated automatically by information
                processing facilities and those initiated at the discretion of a user;</li>
              <li>changes in user permissions that are initiated automatically by the information
                system and those initiated by an administrator;</li>
              <li>rules which require specific approval before enactment and those which do
                not.</li>
            </ol>
          </part>
          <part id="s2.1.1_stm.2" name="item">
            <p>Access control rules should be supported by formal procedures and defined
              responsibilities.</p>
          </part>
          <part id="s2.1.1_stm.3" name="item">
            <p>Role based access control is an approach used successfully by many organizations to
              link access rights with business roles.</p>
          </part>
          <part id="s2.1.1_stm.4" name="item">
            <p>Two of the frequent principles directing the access control policy are:</p>
            <ol>
              <li>Need-to-know: you are only granted access to the information you need to perform
                your tasks (different tasks/roles mean different need-to-know and hence different
                access profile);</li>
              <li>Need-to-use: you are only granted access to the information processing facilities
                (IT equipment, applications, procedures, rooms) you need to perform your
                task/job/role.</li>
            </ol>
          </part>
        </part>
      </control>
      <control id="s2.1.2">
        <title>Access to networks and network services</title>
        <prop name="label">2.1.2</prop>
        <part id="s2.1.2_stm" name="statement">
          <p>Users should only be provided with access to the network and network services that they
            have been specifically authorized to use.</p>
        </part>
        <part id="s2.1.2_gdn" name="guidance">
          <part id="s2.1.2_gdn.1" name="item">
            <p>A policy should be formulated concerning the use of networks and network services.
              This policy should cover:</p>
            <ol>
              <li>the networks and network services which are allowed to be accessed;</li>
              <li>authorization procedures for determining who is allowed to access which networks
                and networked services;</li>
              <li>management controls and procedures to protect access to network connections and
                network services;</li>
              <li>the means used to access networks and network services (e.g. use of VPN or
                wireless network);</li>
              <li>user authentication requirements for accessing various network services;</li>
              <li>monitoring of the use of network service</li>
            </ol>
          </part>
          <part id="s2.1.2_gdn.2" name="item">
            <p>The policy on the use of network services should be consistent with the
              organization’s access control policy</p>
          </part>
        </part>
      </control>
    </group>
  </group>
</catalog>
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "catalog" : {
    "id" : "uuid-956c32af-8a15-4732-a4d9-f976a1149c4b",
    "metadata" : {
      "title" : "Sample Security Catalog",
      "published" : "2020-02-02T11:01:04.736-04:00",
      "last-modified" : "2020-02-10T11:01:04.736-04:00",
      "version" : "1.0",
      "oscal-version" : "1.0.0"
    },
    "groups" : [ {
      "id" : "s1",
      "title" : "Organization of Information Security",
      "props" : [ {
        "name" : "label",
        "value" : "1"
      } ],
      "groups" : [ {
        "id" : "s1.1",
        "title" : "Internal Organization",
        "props" : [ {
          "name" : "label",
          "value" : "1.1"
        } ],
        "parts" : [ {
          "id" : "s1.1_smt",
          "name" : "objective",
          "prose" : "To establish a management framework to initiate and control the implementation and\noperation of information security within the organization."
        } ],
        "controls" : [ {
          "id" : "s1.1.1",
          "title" : "Information security roles and responsibilities",
          "props" : [ {
            "name" : "label",
            "value" : "1.1.1"
          } ],
          "parts" : [ {
            "id" : "s1.1.1_stm",
            "name" : "statement",
            "prose" : "All information security responsibilities should be defined and allocated."
          }, {
            "id" : "s1.1.1_gdn",
            "name" : "guidance",
            "parts" : [ {
              "id" : "s1.1.1_gdn.1",
              "name" : "item",
              "prose" : "Allocation of information security responsibilities should be done in accordance with the information security policies. Responsibilities for the protection of individual assets and for carrying out specific information security processes should be identified. Responsibilities for information security risk management activities and in particular for acceptance of residual risks should be defined. These responsibilities should be supplemented, where necessary, with more detailed guidance for specific sites and information processing facilities. Local responsibilities for the protection of assets and for carrying out specific security processes should be defined."
            }, {
              "id" : "s1.1.1_gdn.2",
              "name" : "item",
              "prose" : "Individuals with allocated information security responsibilities may delegate security tasks to others. Nevertheless they remain accountable and should determine that any delegated tasks have been correctly performed."
            }, {
              "id" : "s1.1.1_gdn.3",
              "name" : "item",
              "prose" : "Areas for which individuals are responsible should be stated. In particular the following should take place:\n\n1. the assets and information security processes should be identified and defined;\n2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;\n3. authorization levels should be defined and documented;\n4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;\n5. coordination and oversight of information security aspects of supplier relationships should be identified and documented."
            } ]
          }, {
            "id" : "s1.1.1_inf",
            "name" : "information",
            "props" : [ {
              "name" : "label",
              "value" : "Other information"
            } ],
            "prose" : "Many organizations appoint an information security manager to take overall responsibility for the development and implementation of information security and to support the identification of controls.\n\nHowever, responsibility for resourcing and implementing the controls will often remain with individual managers. One common practice is to appoint an owner for each asset who then becomes responsible for its day-to-day protection."
          } ]
        }, {
          "id" : "s1.1.2",
          "title" : "Segregation of duties",
          "props" : [ {
            "name" : "label",
            "value" : "1.1.2"
          } ],
          "parts" : [ {
            "id" : "s1.1.2_stm",
            "name" : "statement",
            "prose" : "Conflicting duties and areas of responsibility should be segregated to reduce opportunities for unauthorized or unintentional modification or misuse of the organization’s assets."
          }, {
            "id" : "s1.1.2_gdn",
            "name" : "guidance",
            "parts" : [ {
              "id" : "s1.1.2_gdn.1",
              "name" : "item",
              "prose" : "Care should be taken that no single person can access, modify or use assets without authorization or detection. The initiation of an event should be separated from its authorization. The possibility of collusion should be considered in designing the controls."
            }, {
              "id" : "s1.1.2_gdn.2",
              "name" : "item",
              "prose" : "Small organizations may find segregation of duties difficult to achieve, but the principle should be applied as far as is possible and practicable. Whenever it is difficult to segregate, other controls such as monitoring of activities, audit trails and management supervision should be considered."
            } ]
          }, {
            "id" : "s1.1.2_inf",
            "name" : "information",
            "prose" : "Segregation of duties is a method for reducing the risk of accidental or deliberate misuse of an organization’s assets."
          } ]
        } ]
      } ]
    }, {
      "id" : "s2",
      "title" : "Access control",
      "props" : [ {
        "name" : "label",
        "value" : "2"
      } ],
      "groups" : [ {
        "id" : "s2.1",
        "title" : "Business requirements of access control",
        "props" : [ {
          "name" : "label",
          "value" : "2.1"
        } ],
        "parts" : [ {
          "id" : "s2.1_smt",
          "name" : "objective",
          "prose" : "To limit access to information and information processing facilities."
        } ],
        "controls" : [ {
          "id" : "s2.1.1",
          "title" : "Access control policy",
          "props" : [ {
            "name" : "label",
            "value" : "2.1.1"
          } ],
          "parts" : [ {
            "id" : "s2.1.1_stm",
            "name" : "statement",
            "prose" : "An access control policy should be established, documented and reviewed based on business and information security requirements."
          }, {
            "id" : "s2.1.1_gdn",
            "name" : "guidance",
            "parts" : [ {
              "id" : "s2.1.1_gdn.1",
              "name" : "item",
              "prose" : "Asset owners should determine appropriate access control rules, access rights and restrictions for specific user roles towards their assets, with the amount of detail and the strictness of the controls reflecting the associated information security risks."
            }, {
              "id" : "s2.1.1_gdn.2",
              "name" : "item",
              "prose" : "Access controls are both logical and physical and these should be considered together."
            }, {
              "id" : "s2.1.1_gdn.3",
              "name" : "item",
              "prose" : "Users and service providers should be given a clear statement of the business requirements to be met by access controls."
            }, {
              "id" : "s2.1.1_gdn.4",
              "name" : "item",
              "prose" : "The policy should take account of the following:\n\n1. security requirements of business applications;\n2. policies for information dissemination and authorization, e.g. the need-to-know principle and information security levels and classification of information;\n3. consistency between the access rights and information classification policies of systems and networks;\n4. relevant legislation and any contractual obligations regarding limitation of access to data or services;\n5. management of access rights in a distributed and networked environment which recognizes all types of connections available;\n6. segregation of access control roles, e.g. access request, access authorization, access administration;\n7. requirements for formal authorization of access requests;\n8. requirements for periodic review of access rights;\n9. removal of access rights;\n10. archiving of records of all significant events concerning the use and management of user identities and secret authentication information;,\n11. roles with privileged access."
            } ]
          }, {
            "id" : "s2.1.1_stm",
            "name" : "information",
            "parts" : [ {
              "id" : "s2.1.1_stm.1",
              "name" : "item",
              "prose" : "Care should be taken when specifying access control rules to consider:\n\n1. establishing rules based on the premise “Everything is generally forbidden unless expressly permitted” rather than the weaker rule “Everything is generally permitted unless expressly forbidden”;\n2. changes in information labels that are initiated automatically by information processing facilities and those initiated at the discretion of a user;\n3. changes in user permissions that are initiated automatically by the information system and those initiated by an administrator;\n4. rules which require specific approval before enactment and those which do not."
            }, {
              "id" : "s2.1.1_stm.2",
              "name" : "item",
              "prose" : "Access control rules should be supported by formal procedures and defined responsibilities."
            }, {
              "id" : "s2.1.1_stm.3",
              "name" : "item",
              "prose" : "Role based access control is an approach used successfully by many organizations to link access rights with business roles."
            }, {
              "id" : "s2.1.1_stm.4",
              "name" : "item",
              "prose" : "Two of the frequent principles directing the access control policy are:\n\n1. Need-to-know: you are only granted access to the information you need to perform your tasks (different tasks/roles mean different need-to-know and hence different access profile);\n2. Need-to-use: you are only granted access to the information processing facilities (IT equipment, applications, procedures, rooms) you need to perform your task/job/role."
            } ]
          } ]
        }, {
          "id" : "s2.1.2",
          "title" : "Access to networks and network services",
          "props" : [ {
            "name" : "label",
            "value" : "2.1.2"
          } ],
          "parts" : [ {
            "id" : "s2.1.2_stm",
            "name" : "statement",
            "prose" : "Users should only be provided with access to the network and network services that they have been specifically authorized to use."
          }, {
            "id" : "s2.1.2_gdn",
            "name" : "guidance",
            "parts" : [ {
              "id" : "s2.1.2_gdn.1",
              "name" : "item",
              "prose" : "A policy should be formulated concerning the use of networks and network services.\nThis policy should cover:\n\n1. the networks and network services which are allowed to be accessed;\n2. authorization procedures for determining who is allowed to access which networks and networked services;\n3. management controls and procedures to protect access to network connections and network services;\n4. the means used to access networks and network services (e.g. use of VPN or wireless network);\n5. user authentication requirements for accessing various network services;\n6. monitoring of the use of network service"
            }, {
              "id" : "s2.1.2_gdn.2",
              "name" : "item",
              "prose" : "The policy on the use of network services should be consistent with the organization’s access control policy"
            } ]
          } ]
        } ]
      } ]
    } ]
  }
}
{{< /highlight >}}
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
---
catalog:
  id: uuid-956c32af-8a15-4732-a4d9-f976a1149c4b
  metadata:
    title: Sample Security Catalog
    published: 2020-02-02T11:01:04.736-04:00
    last-modified: 2020-02-10T11:01:04.736-04:00
    version: 1.0
    oscal-version: 1.0.0
  groups:
  - id: s1
    title: Organization of Information Security
    props:
    - name: label
      value: 1
    groups:
    - id: s1.1
      title: Internal Organization
      props:
      - name: label
        value: 1.1
      parts:
      - id: s1.1_smt
        name: objective
        prose: |-
          To establish a management framework to initiate and control the implementation and
          operation of information security within the organization.
      controls:
      - id: s1.1.1
        title: Information security roles and responsibilities
        props:
        - name: label
          value: 1.1.1
        parts:
        - id: s1.1.1_stm
          name: statement
          prose: All information security responsibilities should be defined and allocated.
        - id: s1.1.1_gdn
          name: guidance
          parts:
          - id: s1.1.1_gdn.1
            name: item
            prose: |-
              Allocation of information security responsibilities should be done in accordance with
              the information security policies. Responsibilities for the protection of individual
              assets and for carrying out specific information security processes should be
              identified. Responsibilities for information security risk management activities and
              in particular for acceptance of residual risks should be defined. These
              responsibilities should be supplemented, where necessary, with more detailed guidance
              for specific sites and information processing facilities. Local responsibilities for
              the protection of assets and for carrying out specific security processes should be
              defined.
          - id: s1.1.1_gdn.2
            name: item
            prose: |-
              Individuals with allocated information security responsibilities may delegate
              security tasks to others. Nevertheless they remain accountable and should determine
              that any delegated tasks have been correctly performed.
          - id: s1.1.1_gdn.3
            name: item
            prose: |-
              Areas for which individuals are responsible should be stated. In particular the
              following should take place:

              1. the assets and information security processes should be identified and defined;
              2. the entity responsible for each asset or information security process should be assigned and the details of this responsibility should be documented;
              3. authorization levels should be defined and documented;
              4. to be able to fulfil responsibilities in the information security area the appointed individuals should be competent in the area and be given opportunities to keep up to date with developments;
              5. coordination and oversight of information security aspects of supplier relationships should be identified and documented.
        - id: s1.1.1_inf
          name: information
          props:
          - name: label
            value: Other information
          prose: |-
            Many organizations appoint an information security manager to take overall
            responsibility for the development and implementation of information security and to
            support the identification of controls.

            However, responsibility for resourcing and implementing the controls will often remain
            with individual managers. One common practice is to appoint an owner for each asset who
            then becomes responsible for its day-to-day protection.
      - id: s1.1.2
        title: Segregation of duties
        props:
        - name: label
          value: 1.1.2
        parts:
        - id: s1.1.2_stm
          name: statement
          prose: |-
            Conflicting duties and areas of responsibility should be segregated to reduce
            opportunities for unauthorized or unintentional modification or misuse of the
            organization’s assets.
        - id: s1.1.2_gdn
          name: guidance
          parts:
          - id: s1.1.2_gdn.1
            name: item
            prose: |-
              Care should be taken that no single person can access, modify or use assets without
              authorization or detection. The initiation of an event should be separated from its
              authorization. The possibility of collusion should be considered in designing the
              controls.
          - id: s1.1.2_gdn.2
            name: item
            prose: |-
              Small organizations may find segregation of duties difficult to achieve, but the
              principle should be applied as far as is possible and practicable. Whenever it is
              difficult to segregate, other controls such as monitoring of activities, audit trails
              and management supervision should be considered.
        - id: s1.1.2_inf
          name: information
          prose: |-
            Segregation of duties is a method for reducing the risk of accidental or deliberate
            misuse of an organization’s assets.
  - id: s2
    title: Access control
    props:
    - name: label
      value: 2
    groups:
    - id: s2.1
      title: Business requirements of access control
      props:
      - name: label
        value: 2.1
      parts:
      - id: s2.1_smt
        name: objective
        prose: To limit access to information and information processing facilities.
      controls:
      - id: s2.1.1
        title: Access control policy
        props:
        - name: label
          value: 2.1.1
        parts:
        - id: s2.1.1_stm
          name: statement
          prose: |-
            An access control policy should be established, documented and reviewed based on
            business and information security requirements.
        - id: s2.1.1_gdn
          name: guidance
          parts:
          - id: s2.1.1_gdn.1
            name: item
            prose: |-
              Asset owners should determine appropriate access control rules, access rights and
              restrictions for specific user roles towards their assets, with the amount of detail
              and the strictness of the controls reflecting the associated information security
              risks.
          - id: s2.1.1_gdn.2
            name: item
            prose: |-
              Access controls are both logical and physical and these should be considered
              together.
          - id: s2.1.1_gdn.3
            name: item
            prose: |-
              Users and service providers should be given a clear statement of the business
              requirements to be met by access controls.
          - id: s2.1.1_gdn.4
            name: item
            prose: |-
              The policy should take account of the following:

              1. security requirements of business applications;
              2. policies for information dissemination and authorization, e.g. the need-to-know principle and information security levels and classification of information;
              3. consistency between the access rights and information classification policies of systems and networks;
              4. relevant legislation and any contractual obligations regarding limitation of access to data or services;
              5. management of access rights in a distributed and networked environment which recognizes all types of connections available;
              6. segregation of access control roles, e.g. access request, access authorization, access administration;
              7. requirements for formal authorization of access requests;
              8. requirements for periodic review of access rights;
              9. removal of access rights;
              10. archiving of records of all significant events concerning the use and management of user identities and secret authentication information;,
              11. roles with privileged access.
        - id: s2.1.1_stm
          name: information
          parts:
          - id: s2.1.1_stm.1
            name: item
            prose: |-
              Care should be taken when specifying access control rules to consider:

              1. establishing rules based on the premise “Everything is generally forbidden unless expressly permitted” rather than the weaker rule “Everything is generally permitted unless expressly forbidden”;
              2. changes in information labels that are initiated automatically by information processing facilities and those initiated at the discretion of a user;
              3. changes in user permissions that are initiated automatically by the information system and those initiated by an administrator;
              4. rules which require specific approval before enactment and those which do not.
          - id: s2.1.1_stm.2
            name: item
            prose: |-
              Access control rules should be supported by formal procedures and defined
              responsibilities.
          - id: s2.1.1_stm.3
            name: item
            prose: |-
              Role based access control is an approach used successfully by many organizations to
              link access rights with business roles.
          - id: s2.1.1_stm.4
            name: item
            prose: |-
              Two of the frequent principles directing the access control policy are:

              1. Need-to-know: you are only granted access to the information you need to perform your tasks (different tasks/roles mean different need-to-know and hence different access profile);
              2. Need-to-use: you are only granted access to the information processing facilities (IT equipment, applications, procedures, rooms) you need to perform your task/job/role.
      - id: s2.1.2
        title: Access to networks and network services
        props:
        - name: label
          value: 2.1.2
        parts:
        - id: s2.1.2_stm
          name: statement
          prose: |-
            Users should only be provided with access to the network and network services that they
            have been specifically authorized to use.
        - id: s2.1.2_gdn
          name: guidance
          parts:
          - id: s2.1.2_gdn.1
            name: item
            prose: |-
              A policy should be formulated concerning the use of networks and network services.
              This policy should cover:

              1. the networks and network services which are allowed to be accessed;
              2. authorization procedures for determining who is allowed to access which networks and networked services;
              3. management controls and procedures to protect access to network connections and network services;
              4. the means used to access networks and network services (e.g. use of VPN or wireless network);
              5. user authentication requirements for accessing various network services;
              6. monitoring of the use of network service
          - id: s2.1.2_gdn.2
            name: item
            prose: |-
              The policy on the use of network services should be consistent with the
              organization’s access control policy
{{< /highlight >}}
{{% /tab %}}
{{< /tabs >}}

## Summary

This concludes the tutorial. At this point you should be familiar with:

- The basic structure of a catalog of controls expressed in OSCAL.
- How to provide the basic metadata required to be included in an OSCAL control catalog.
- How to define a group and a collection of controls.
- How to use parts to provide additional control text.

For more information you can review the [OSCAL catalog model documentation][catalog-docs].

[catalog-docs]: /concepts/layer/control/
[catalog-definition]: /concepts/terminology/#catalog
[catalog-prose-sample]: {{< param "contentRepoPath" >}}/examples/catalog/basic-catalog.md
[oscal-markup-line]: /reference/datatypes/#markup-line
[oscal-markup-multiline]: /reference/datatypes/#markup-multiline
