---
title: Extending OSCAL Models with Props and Links
description: A tutorial on extending OSCAL models by using props and links.
weight: 10
suppresstopiclist: true
toc:
  enabled: true
---

This tutorial describes the mechanisms for extending basic OSCAL models. Before reading this tutorial, you should:

- Have some familiarity with the [XML](https://www.w3.org/standards/xml/core), [JSON](https://www.json.org/), or [YAML](https://yaml.org/spec/) formats.
- Review the [OSCAL Layers and Models](/concepts/layer/) documentation.
- Review the latest [OSCAL Reference](/reference/latest/complete/).

## What are the OSCAL Extension Mechanisms?

OSCAL is designed with the goal of simultaneously supporting multiple cybersecurity frameworks. The core OSCAL syntax achieves this goal by focusing on properties that are universal or have applicability across various frameworks.

In creating OSCAL, NIST anticipated the importance of extensibility for unique requirements when organizations implement their security and privacy risk management programs. It was important to establish extension mechanisms from the onset, to allow OSCAL content creators to tailor OSCAL for their specific (organizational) needs.

Thus, OSCAL is designed with extensibility as one of its key principles, allowing the OSCAL models to be extended wherever there are prop or link properties in the core OSCAL models. This tutorial describes both extension mechanisms, explaining when to utilize them and illustrating their proper use.

{{% callout note %}}
Ellipsis (...) is used throughout this tutorial's examples where sample code is omitted for sake of simplicity.
{{% /callout %}}

## Props

The OSCAL property is a primary method for providing extended data in OSCAL. A property is a namespaced name and value pair, which appears on many of the key fields within an OSCAL model. The following section provides details around the use of OSCAL properties.

### Syntax

The following examples illustrate the syntax of an OSCAL property in XML, JSON, and YAML.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<prop name="..." ns="..." value="..." class="...">...</prop>
{{< /highlight >}} 

A property in OSCAL XML is represented using the `<prop>` element, which can be repeated in a sequence multiple times to define multiple OSCAL properties.

Below is a description of each attribute of the `<prop>` element.

- `@name` (Required) - The required *name* of the OSCAL property that must be a [token](/reference/datatypes/#token) data type.
- `@ns` (Optional) - The optional *namespace* of the OSCAL property that must be a [universal resource identifier (URI)](/reference/datatypes/#uri) formatted according to [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986).
- `@value` (Required) - The required *value* of the OSCAL property that must be a [string](/reference/datatypes/#string) value.
- `@class` (Optional) - The optional *class* of the OSCAL property that must be a [string](/reference/datatypes/#string) value, which can be used to further qualify the property's value.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "props": [
          {
            "name":"...",
            "ns":"...",
            "value":"...",
            "class":"..."
          }
        ]
}
{{< /highlight >}} 

A listing of properties in OSCAL JSON are represented using the `props` object array, with each property defined as an individual JSON object array member.

Each *property* object can have the following JSON property names.

- `name` (Required) - The required *name* of the OSCAL property that must be a [token](/reference/datatypes/#token) data type.
- `ns` (Optional) - The optional *namespace* of the OSCAL property that must be a [universal resource identifier (URI)](/reference/datatypes/#uri) formatted according to [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986).
- `value` (Required) - The required *value* of the OSCAL property that must be a [string](/reference/datatypes/#string) value.
- `class` (Optional) - The optional *class* of the OSCAL property  that must be a [string](/reference/datatypes/#string) value, which can be used to further qualify the value that must be a [string](/reference/datatypes/#string) value, which can be used to further qualify the property's value.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
  props:
    - name: ...
      ns: ...
      value: ...
      class: ...
{{< /highlight >}} 

A `props` list in YAML contains individual OSCAL property items.

Each property item can have the following keys:

- `name` (Required) - The required *name* of the OSCAL property that must be a [token](/reference/datatypes/#token) data type.
- `ns` (Optional) - The optional *namespace* of the OSCAL property that must be a [universal resource identifier (URI)](/reference/datatypes/#uri) formatted according to [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986).
- `value` (Required) - The required *value* of the OSCAL property that must be a [string](/reference/datatypes/#string) value.
- `class` (Optional) - The optional *class* of the OSCAL property  that must be a [string](/reference/datatypes/#string) value, which can be used to further qualify the value that must be a [string](/reference/datatypes/#string) value, which can be used to further qualify the property's value.
{{% /tab %}}
{{% /tabs %}}

### Concepts

Now that the syntax of a property is more clear, let's discuss how the property's *namespace*, *name*, *value*, and *class* are used to extend OSCAL.

As we mentioned earlier, a property is a *namespaced name* and *value* pair, which appears on many of the key fields within an OSCAL model. The OSCAL field on which the property is declared is considered the property's *context*. A property's context establishes the subject of the property; the thing the property is about.

A property's *namespace* defines the value space of possible names for a property. Each namespace is represented by a Uniform Resource Identifier (URI), which is defined by [RFC 3986](https://datatracker.ietf.org/doc/html/rfc3986). Namespaces allow the same property name to be used for different purposes or to have different meanings for each namespace it is defined in.

The default namespace for an OSCAL property is `http://csrc.nist.gov/ns/oscal`, which is used as the namespace when no namespace is provided.

A namespace is managed by a given organization or individual. Using a namespace, different organizations can assign a unique semantic meaning to the use of a property name within their namespace; thus, the different meaning of two properties with the same name can be easily determined by identifying the associated namespaces. This allows different organizations to assign names within their own namespace, without coordinating with other organizations, avoiding naming conflicts. This provides a low effort means to ensure that naming clashes are avoided.

The *name* of a property defines the semantic meaning or topical nature of the value. The topic a name relates to is often associated with the property's *context*.

For example, the property name "marking" might identify some information sensitivity classification scheme for the context data field, while the property name "label" might refer to a textual label for the context data field.

In OSCAL, many data fields have pre-defined names defined in the OSCAL namespace `http://csrc.nist.gov/ns/oscal`, which is the default value for the namespace when no namespace is provided. These pre-defined property names provided for standardized naming of properties, which can be recognized by multiple consumers to have a consistent meaning. The namespace can be omitted when using an OSCAL define pre-defined property name.

For example, the OSCAL SSP model's system characteristics data field has a pre-defined property name `data-center` \[[XML](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-characteristics/prop)\] \[[JSON/YAML](/reference/latest/system-security-plan/json-reference/#/system-security-plan/system-characteristics/props)\].

OSCAL content authors need to determine whether to use a pre-defined property name in a given situation or to define their own name in their own namespace. To view existing property names, review the model index \[[XML](/reference/latest/complete/xml-index/#/prop)\] \[[JSON/YAML](/reference/latest/complete/json-index/#/props)\].
  
New pre-defined names will be added to OSCAL over time on an as-needed basis. To suggest or request the addition of a new pre-defined name in the OSCAL namespace, please [open an issue](https://github.com/usnistgov/OSCAL/issues/new?assignees=&labels=User+Story%2Cenhancement&template=feature_request.yaml) in the OSCAL GitHub repository.

A property's *name* defines a data set, while the property's *value* provides the specific member of that set. A data sets for a given name may contain a set of identifier reference values, an enumerated set of values, or allow for open ended values. Part of defining a new namespaced property name is defining the value space of the allowed values.

Many of the OSCAL pre-defined property names have a constrained set of values. The allowed values may be further constrained by the context data field. Which values are allowed depends on the context of use, name and namespace of the property. The constraints for these properties are defined within the [OSCAL Metaschemas](https://github.com/usnistgov/OSCAL/tree/main/src/metaschema). Where applicable, a given Metaschema defines the `allowed-values` that can be used for a property name in a given context of use. The properties that are extensible are defined with an `@allow-other=yes` attribute in Metaschema.  

The *class* of a property is a textual label that provides a sub-type or characterization of the property's name and/or value. This can be used to further distinguish or discriminate between the semantics of multiple properties in a given context with the same name and namespace.

### Using an Existing Prop

This sections covers the basic use of a property leveraging all of its attributes.

The OSCAL SSP [metadata](/concepts/layer/overview/#metadata-overview) allows for zero or more location data items, each allowing for properties to be defined. In this example, an organization needs to document their primary and alternate data center locations. This is achieved by specifying properties for each location.

{{% callout note %}}
The [Metadata Tutorial](/learn/tutorials/metadata/) provides in-depth description and walk-through examples of creating OSCAL metadata.
{{% /callout %}}

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL Basic Prop Example</title>
    <last-modified>2022-01-01T09:30:00-005</last-modified>
    <version>20220531</version>
    <oscal-version>1.0.4</oscal-version>
    <location uuid="location uuid">
      <title>...</title>
      <prop name="type" value="data-center" class="primary"/>
    </location>
    <location uuid="location uuid">
      <title>...</title>
      <prop name="type" value="data-center" class="alternate"/>
    </location>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}  

The `@name` attribute is set to "type" which is an OSCAL pre-defined property for locations. The `@value` attribute is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/location) value for location "type" properties. The `@class` attribute in this case is used to indicate a subclass of data-center, and is set to one of the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/location) values for data center location class.

Note that in this example, the `@ns` attribute is omitted because we are using a pre-defined property name in the OSCAL namespace.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL Basic Prop Example",
      "last-modified": "2022-01-01T09:30:00-005",
      "version": 20220531,
      "oscal-version": "1.0.4",
      "locations": [
      {
        "title": "...",
        "props": [
          {
            "name":"type",
            "value":"data-center",
            "class":"primary"
          }
        ]
      },
      {
          "title": "...",
          "props": [
          {
            "name":"type",
            "value":"data-center",
            "class":"alternate"
          }
        ]
      }]
    },
    "import-profile": "...",
    "system-characteristics": "...",
    "system-implementation": "..."
  }
}
{{< /highlight >}}

In the `props` object array, the prop object's `name` property is set to "type" which is an OSCAL pre-defined property for locations. The `value` property is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) value for location "type" properties. The `class` JSON property in this case is used to indicate a subclass of data-center, and is set to one of the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) values for data center location class.

Note that in this example, the `ns` JSON property is omitted because we are using a pre-defined property name in the OSCAL namespace.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL Basic Prop Example
    last-modified: '2022-01-01T09:30:00-005'
    version: 20220531
    oscal-version: 1.0.04
    locations:
    - title: ...
      props:
      - name: type
        value: data-center
        class: primary
    - title: ...
      props:
        - name: type
          value: data-center
          class: alternate
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...
{{< /highlight >}}

In the `props` list, the item's `name` key is set to "type" which is an OSCAL pre-defined property for locations. The `value` key is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) value for location "type" properties. The `class` key in this case is used to indicate a subclass of data-center, and is set to one of the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) values for data center location class.

Note that in this example, the `ns` key is omitted because we are using a standard OSCAL defined `prop` object.
{{% /tab %}}
{{% /tabs %}}

### Extending Existing Prop Values

One of the most common scenarios for extending an OSCAL property is using a new value for an existing OSCAL property. Again, if using an OSCAL defined `<prop>`, the `@ns` namespace attribute does not need to be specified since the default OSCAL namespace applies.  

The following example demonstrates how to extend a SSP metadata location "type" `<prop>` with an additional value.

Currently, the only OSCAL pre-defined value for the SSP metadata location property is "data-center".  However, because this particular property allows other values to be defined (with an `@allow-other=yes` attribute in Metaschema), additional "type" values can be specified as shown below.

{{% callout note %}}
Again, for a detailed overview of how to implement metadata, please refer to the [Metadata Tutorial](/learn/tutorials/metadata/).
{{% /callout %}}

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL Basic Prop Example</title>
    <last-modified>2022-01-01T09:30:00-005</last-modified>
    <version>20220531</version>
    <oscal-version>1.0.0</oscal-version>
    <location uuid="1f190601-2e87-4787-a50a-d08b78e4a980">
      <title>...</title>
      <prop name="type" value="security-operations-center"/>
    </location>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}

The example above defines a new "type" property `@value` "security-operations-center" on line 10.

The `@class` attribute was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL Basic Prop Example",
      "last-modified": "2022-01-01T09:30:00-005",
      "version": 20220531,
      "oscal-version": "1.0.0",
      "locations": [
      {
        "title": "...",
        "props": [
          {
            "name":"type",
            "value":"security-operations-center"
          }
        ]
      }]
    },
    "import-profile": "...",
    "system-characteristics": "...",
    "system-implementation": "..."
  }
}
{{< /highlight >}}

The example above defines a new "type" property `value` "security-operations-center" on line 15.

The `class` property was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL Basic Prop Example
    last-modified: '2022-01-01T09:30:00-005'
    version: 20220531
    oscal-version: 1.0.0
    locations:
      - title: ...
        props:
          - name: type
            value: security-operations-center
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...
{{< /highlight >}}

The example above defines a new "type" property `value` "security-operations-center" on line 12.

The `class` property was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).
{{% /tab %}}
{{% /tabs %}}

### Creating a New Prop

The previous examples leveraged an existing OSCAL property to document location details (e.g., location "type") within an SSP. But what if there were other pertinent location details that needed to be captured as well?

For example, some government organizations with distributed global physical locations may want to use [Geographic Locator Codes (GLC)](https://www.gsa.gov/reference/geographic-locator-codes-glcs-overview) to facilitate interchange of location data with other government agencies.  The example below demonstrates how this could be documented by specifying a new GLC property.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL New Prop Example</title>
    <last-modified>2022-01-01T09:30:00-005</last-modified>
    <version>20220531</version>
    <oscal-version>1.0.0</oscal-version>
    <location uuid="1f190601-2e87-4787-a50a-d08b78e4a980">
      <title>...</title>
      <prop name="type"
            value="security-operations-center"
            class="regional"/>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="11"
            class="state-code"/>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="0010"
            class="city-code"/>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="840"
            class="country-code"/>
    </location>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}

A new GLC property was created by setting the `<prop>` element's `@name` attribute to "glc".  The acronym "glc" could be used by other organizations (and have a completely different meaning) so a namespace `@ns` was set.  Lastly, GLCs have many data attributes including territory, country codes, state codes, county codes, city codes, and duty station codes, so this example defined a single "glc" `<prop>` but used `@class` to provide context for the property's set `@value`.

Props are prevalent throughout OSCAL models appearing not only in `<metadata>` and `<back-matter>`, but in the majority of OSCAL data items.  Regardless of which OSCAL element is being extended, the approach is consistent, as described in this section of the tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL Basic Prop Example",
      "last-modified": "2022-01-01T09:30:00-005",
      "version": 20220531,
      "oscal-version": "1.0.0",
      "locations": [
      {
        "title": "...",
        "props": [
          {
            "name":"type",
            "value":"security-operations-center",
            "class":"regional"
          },
          {
            "name":"glc",
            "ns":"http://federal-agency.gov/ns/oscal",
            "value":"11",
            "class":"state-code"
          },
          {
            "name":"glc",
            "ns":"http://federal-agency.gov/ns/oscal",
            "value":"0010",
            "class":"city-code"
          },
          {
            "name":"glc",
            "ns":"http://federal-agency.gov/ns/oscal",
            "value":"840",
            "class":"country-code"
          }
        ]
      }]
    },
    "import-profile": "...",
    "system-characteristics": "...",
    "system-implementation": "..."
  }
}
{{< /highlight >}}

A new GLC property was created by setting the `prop` object's `name` property to "glc".  The acronym "glc" could be used by other organizations (and have a completely different meaning) so a namespace `ns` was set.  Lastly, GLCs have many data attributes including territory, country codes, state codes, county codes, city codes, and duty station codes, so this example defined a single "glc" `prop` but used `class` to provide context for the property's set `value`.

Props are prevalent throughout OSCAL models appearing not only in `metadata` and `back-matter` objects, but in the majority of OSCAL data items.  Regardless of which OSCAL property is being extended, the approach is consistent, as described in this section of the tutorial.
{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL Basic Prop Example
    last-modified: '2022-01-01T09:30:00-005'
    version: 20220531
    oscal-version: 1.0.0
    locations:
      - title: ...
        props:
          - name: type
            value: security-operations-center
            class: regional
          - name: glc
            ns: http://federal-agency.gov/ns/oscal
            value: '11'
            class: state-code
          - name: glc
            ns: http://federal-agency.gov/ns/oscal
            value: '0010'
            class: city-code
          - name: glc
            ns: http://federal-agency.gov/ns/oscal
            value: '840'
            class: country-code
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...
{{< /highlight >}}

A new GLC property was created by setting the `prop` object's `name` property to "glc".  The acronym "glc" could be used by other organizations (and have a completely different meaning) so a namespace `ns` was set.  Lastly, GLCs have many data attributes including territory, country codes, state codes, county codes, city codes, and duty station codes, so this example defined a single "glc" `prop` but used `class` to provide context for the property's set `value`.

Props are prevalent throughout OSCAL models appearing not only in `metadata` and `back-matter` objects, but in the majority of OSCAL data items.  Regardless of which OSCAL property is being extended, the approach is consistent, as described in this section of the tutorial.
{{% /tab %}}
{{% /tabs %}}

## Links

Links in OSCAL provide a form of indirection, allowing the referencing of local or remote content. Link can be particularly useful in referencing (external) information that is not represented in OSCAL format.  This could include references to (cybersecurity) laws and regulations; references to organizational standards and guides; references to system bill of materials (SBOM) and more.  Organizations can limit duplication of content, reduce the size of their OSCAL files, and maintain important content relationships by using links.

{{< tabs XML JSON YAML >}}
{{% tab %}}
The `<link>` element is made available in specific OSCAL models and supports either URL or back matter resources. The `<link>` element has a `<text>` sub-element, and the following attributes: `@href`, `@rel`, and `@media-type`.  Here is a nominal example of a `<link>` element.

{{< highlight xml "linenos=table" >}}
<link href="..."
      rel="..."
      media-type="...">
  <text>...</text>
</link>
{{< /highlight >}} 

Below is description of `<link>` attributes and sub-element:
- `@href` (Required) - The `@href` attribute is a required, [resolvable URL reference](/reference/datatypes/#uri-reference) to a resource. This can either be an internet resource or a fragment that point to a back matter resource in the same document.
- `@rel` (Optional) - The optional `@rel` attribute is a [token](/reference/datatypes/#token) datatype that can be used to describe the link&#39;s purpose.  Some OSCAL link properties may have pre-defined `@rel` values (e.g., reference), but generally, OSCAL content authors can specify any token value for a `@rel` attribute.  Although any string can be used in the `@rel` attribute, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
  - successor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
- `@media-type` (Optional) - The optional `@media-type` attribute can be used to provide the consumer of the OSCAL content a hint about the type of data referenced in the link. Supported media types are as defined by the [Internet Assigned Numbers Authority (IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml).  The `@media-type` attribute accepts [string](/reference/datatypes/#string) values.
- `<text>` (Optional) - Finally, the optional `<text>` sub-element can be used for as a textual label for the `<link>` and accepts [markup-line](/reference/datatypes/#markup-line) datatype. The subsequent sections demonstrate the proper use of links.
{{% /tab %}}
{{% tab %}}
The `links` object array is made available in specific OSCAL models and supports either URL or back matter resources. The `link` object has the following properties: `href`, `rel`, `media-type`, and `text`. Here is a nominal example of a `links` object array.

{{< highlight json "linenos=table" >}}
{
  "links": [
        {
          "href": "...",
          "rel": "...",
          "media-type": "...",
          "text": "..."
        }
      ]
}
{{< /highlight >}} 

Below is description of `links` properties:
- `href` (Required) - The `href` property is a required, [resolvable URL reference](/reference/datatypes/#uri-reference) to a resource. This can either be an internet resource or a fragment that point to a back matter resource in the same document.
- `rel` (Optional) - The optional `rel` property is a [token](/reference/datatypes/#token) datatype that can be used to describe the link&#39;s purpose.  Some OSCAL link properties may have pre-defined `rel` values (e.g., reference), but generally, OSCAL content authors can specify any token value for a `rel` property.  Although any string can be used in the `rel` attribute, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829)9.
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
  - successor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
- `media-type` (Optional) - The optional `media-type` property can be used to provide the consumer of the OSCAL content a hint about the type of data referenced in the link. Supported media types are as defined by the [Internet Assigned Numbers Authority (IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml).  The `media-type` property accepts [string](/reference/datatypes/#string) values.
- `text` (Optional) - Finally, the optional `text` property can be used for as a textual label for the `link` and accepts [markup-line](/reference/datatypes/#markup-line) datatype. The subsequent sections demonstrate the proper use of links.
{{% /tab %}}
{{% tab %}}
The `links` key-value pair array is made available in specific OSCAL models and supports either URL or back matter resources. The `link` object has the following properties: `href`, `rel`, `media-type`, and `text`. Here is a nominal example of a `links` key-value pair array.

{{< highlight yaml "linenos=table" >}}
  links:
      - href: ...
        rel: ...
        media-type: ...
        text: ...        
{{< /highlight >}}

Below is description of `links` key-values:
- `href` (Required) - The `href` key is a required, [resolvable URL reference](/reference/datatypes/#uri-reference) to a resource. This can either be an internet resource or a fragment that point to a back matter resource in the same document.
- `rel` (Optional) - The optional `rel` key is a [token](/reference/datatypes/#token) datatype that can be used to describe the link&#39;s purpose.  Some OSCAL link properties may have pre-defined `rel` values (e.g., reference), but generally, OSCAL content authors can specify any token value for a `rel` key.  Although any string can be used in the `rel` attribute, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
  - successor-version: This link identifies a resource containing the predecessor version in the version history. Defined by [RFC 5829](https://datatracker.ietf.org/doc/html/rfc5829).
- `media-type` (Optional) - The optional `media-type` key can be used to provide the consumer of the OSCAL content a hint about the type of data referenced in the link. Supported media types are as defined by the [Internet Assigned Numbers Authority (IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml).  The `media-type` key accepts [string](/reference/datatypes/#string) values.
- `text` (Optional) - Finally, the optional `text` key can be used for as a textual label for the `link` and accepts [markup-line](/reference/datatypes/#markup-line) datatype. The subsequent sections demonstrate the proper use of links.
{{% /tab %}}
{{% /tabs %}}

### Link to internet URL

Organizations may need their documentation (e.g., SSP) to reference external items, such applicable laws and regulations (e.g., HSPD-12) and other organizational items (e.g., official agency logos).  This first example illustrates how an OSCAL SSP might make use of a link to an internet URL.

{{< tabs XML JSON YAML >}}
{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL SSP Component Link Example</title>
    <last-modified>2022-01-01T09:30:00-005</last-modified>
    <version>20220531</version>
    <oscal-version>1.0.0</oscal-version>
    <link href="https://www.dhs.gov/homeland-security-presidential-directive-12"
          rel="reference">
      <text>HSPD-12</text>
    </link>
    <link href="http://federal-agency.gov/img/official-agency-logo.png"
          rel="logo"
          media-type="image/png" />
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}

In this case, the `<link>` element on line #8 provides a reference to HSPD-12 by specifying the URL in the `@href` attribute.  The OSCAL pre-defined "reference" value is used  for the `@rel` attribute, providing some context for the purpose of this specific `<link>`. The `<text>` sub-element provides an associated label for the `<link>` which may be useful when rendering the SSP in other formats (e.g., html or office document formats).

Line #11 demonstrates the use of `<link>` to point to the organization's official logo.  An absolute URI was used to point to the location of the referenced content, however, it should be noted that the `@href` attribute also permits the use of relative URI paths.  If the referenced resource is located is on the same machine or domain, then a relative URI path could be used.  The `@rel` attribute was set to "logo" to indicate the type of relationship provided by the specified `<link>`.  The `@media-type` attribute was included to let any rendering tools know that the logo content is a PNG image type.  The optional `<text>` sub-element was excluded for brevity of this example.

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the `@href` attribute indicates that the `<link>` is referencing a `<back-matter>` `<resource>` in the same OSCAL document.

{{% /tab %}}
{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL SSP Component Link Example",
      "last-modified": "2022-01-01T09:30:00-005",
      "version": 20210707,
      "oscal-version": "1.0.0",
      "links": [
        {
          "href": "https://www.dhs.gov/homeland-security-presidential-directive-12",
          "rel": "reference",
          "text": "HSPD-12"
        },
        {
          "href": "http://federal-agency.gov/img/official-agency-logo.png",
          "rel": "logo",
          "media-type": "image/png"
        }
      ]
    },
    "import-profile": "...",
    "system-characteristics": "...",
    "system-implementation": "..."
  }
}
{{< /highlight >}}

In this case, the `links` object array on line #9 provides a reference to HSPD-12 by specifying the URL in the `href` property.  The OSCAL pre-defined "reference" value is used  for the `rel`, providing context for the purpose of this specific `link`. The `text` property provides an associated label for the `link` which may be useful when rendering the SSP in other formats (e.g., html or office document formats).

Lines #16-18 demonstrate the use of link to point to the organization's official logo.  An absolute URI was used to point to the location of the referenced content, however, it should be noted that the `href` property also permits the use of relative URI paths.  If the referenced resource is located is on the same machine or domain, then a relative URI path could be used.  The `rel` property was set to "logo" to indicate the type of relationship provided by the specified `link`.  The `media-type` property was included to let any rendering tools know that the logo content is a PNG image type.  The optional `text` property was excluded for brevity of this example.

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the `href` property indicates that the `link` is referencing a `back-matter` `resources` object array in the same OSCAL document.

{{% /tab %}}
{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL SSP Component Link Example
    last-modified: '2022-01-01T09:30:00-005'
    version: 20210707
    oscal-version: 1.0.0
    links:
      - href: https://www.dhs.gov/homeland-security-presidential-directive-12
        rel: reference
        text: HSPD-12
      - href: http://federal-agency.gov/img/official-agency-logo.png
        rel: logo
        media-type: image/png
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...

{{< /highlight >}}

In this case, the `links` object array on line #9 provides a reference to HSPD-12 by specifying the URL in the `href` property.  The OSCAL pre-defined "reference" value is used  for the `rel`, providing context for the purpose of this specific `link`. The `text` property provides an associated label for the `link` which may be useful when rendering the SSP in other formats (e.g., html or office document formats).

Lines #11-13 demonstrate the use of link to point to the organization's official logo.  An absolute URI was used to point to the location of the referenced content, however, it should be noted that the `href` property also permits the use of relative URI paths.  If the referenced resource is located is on the same machine or domain, then a relative URI path could be used.  The `rel` property was set to "logo" to indicate the type of relationship provided by the specified `link`.  The `media-type` property was included to let any rendering tools know that the logo content is a PNG image type.  The optional `text` property was excluded for brevity of this example.

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the `href` property indicates that the `link` is referencing a `back-matter` `resources` object array in the same OSCAL document.
{{% /tab %}}
{{% /tabs %}}

### Referencing Back-Matter

{{< tabs XML JSON YAML >}}
{{% tab %}}
When using `<link>` to reference a back-matter `<resources>`, the `<link>` must use the resource's `@uuid` attribute as the pointer. The `<resource>` property must have an `<rlink>` sub-element that points to the (external) content via the `@href` attribute.  Optionally, the `<rlink>` property can also include a hash (e.g., to ensure the integrity of the referenced content), however, that is an advanced concept that is not covered in this tutorial.

In the previous section, multiple `<link>` elements would need to be created in the SSP metadata for each applicable laws and regulations. However, another approach would be to specify one `<link>` in the metadata for all applicable laws, regulations, standards, and guides.  Then a single `<resource>` (for the applicable laws, regulations, standards, and guides) with multiple `<rlinks>` could be set in the back-matter as illustrated below.

{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL SSP Link to Back Matter Resource Example</title>
    <last-modified>2022-01-01T09:30:00-005</last-modified>
    <version>20220531</version>
    <oscal-version>1.0.0</oscal-version>
    <link href="#a7584118-3d2d-46c8-b388-df747309c0fa"
          rel="reference">
      <text>Applicable Laws and Regulations, Standards, and Guides</text>
    </link>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <control-implementation>...</control-implementation>
  <back-matter>
    <resource uuid="a7584118-3d2d-46c8-b388-df747309c0fa">
      <rlink
          href="https://www.dhs.gov/homeland-security-presidential-directive-12" />
      <rlink
          href="https://csrc.nist.gov/csrc/media/publications/fips/199/final/documents/fips-pub-199-final.pdf"
          media-type="application/pdf" />
      <rlink
          href="/security/standards/IT-Rules-of-Behavior.docx"
          media-type="application/msword" />
    </resource>
  </back-matter>
</system-security-plan>
{{< /highlight >}}

Notice that in this example, the `<link>` element on line #8 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `@uuid` (see line #17).  Within this `<resource>` element, several items are referenced (via `<rlinks>`). The `<rlinks>` must have a URI reference (`@href`).  The third `<rlink>` in this example provides a relative path.  All of the other `<rlink>` attributes (e.g., `@media-type` and `@hash`) are optional.  Unlike `<links>`, `<rlinks>` do not have any `@rel` attributes to provide additional context, nor do they have `<text>` sub-elements.  OSCAL content authors should consider these subtle differences when deciding whether to use `<links>` or `<rlinks>`.

{{% /tab %}}
{{% tab %}}
When using `links` to reference back-matter `resources`, the `link` must use the resource's `uuid` property as the pointer. The `resource` property must have an `rlinks` object array that points to the (external) content via the `href` property.  Optionally, the `rlinks` can also include a hash (e.g., to ensure the integrity of the referenced content), however, that is an advanced concept that is not covered in this tutorial.

In the previous section, multiple `link` objects would need to be created in the SSP metadata for each applicable laws and regulations. However, another approach would be to specify one `link` in the metadata for all applicable laws, regulations, standards, and guides.  Then a single `resource` (for the applicable laws, regulations, standards, and guides) with multiple `rlink` objects could be set in the back-matter as illustrated below.

{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL SSP Link to Back Matter Resource Example",
      "last-modified": "2022-01-01T09:30:00-005",
      "version": 20220531,
      "oscal-version": "1.0.0",
      "links": {
        "href": "#a7584118-3d2d-46c8-b388-df747309c0fa",
        "rel": "reference",
        "text": "Applicable Laws and Regulations, Standards, and Guides"
      }
    },
    "import-profile": "...",
    "system-characteristics": "...",
    "control-implementation": "...",
    "back-matter": {
      "resources":
      {
        "uuid": "a7584118-3d2d-46c8-b388-df747309c0fa",
        "rlinks": [
        {
          "href": "https://www.dhs.gov/homeland-security-presidential-directive-12"
        },
        {
          "href": "https://csrc.nist.gov/csrc/media/publications/fips/199/final/documents/fips-pub-199-final.pdf",
          "media-type": "application/pdf"
        },
        {
          "href": "/security/standards/IT-Rules-of-Behavior.docx",
          "media-type": "application/msword"
        }]
      }
    }
  }
}
{{< /highlight >}}

Notice that in this example, the `links` object array on line 9 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `uuid` (see line #21).  Within `resources`, several items are referenced (via `rlinks`). Each `rlink` must have a URI reference (`href`).  The third `rlink` in this example provides a relative path.  All of the other `rlink` properties (e.g., `media-type` and `hash`) are optional.  Unlike `links`, `rlinks` do not have any `rel` properties to provide additional context, nor do they have `text` properties.  OSCAL content authors should consider these subtle differences when deciding whether to use `links` or `rlinks`.

{{% /tab %}}
{{% tab %}}
When using `links` to reference back-matter `resources`, the `link` must use the resource's `uuid` key-value as the pointer. The `resource` key-value must have an `rlinks` array that points to the (external) content via the `href` key-value.  Optionally, the `rlinks` can also include a hash (e.g., to ensure the integrity of the referenced content), however, that is an advanced concept that is not covered in this tutorial.

In the previous section, multiple `link` key-value pairs would need to be created in the SSP metadata for each applicable laws and regulations. However, another approach would be to specify one `link` in the metadata for all applicable laws, regulations, standards, and guides.  Then a single `resource` (for the applicable laws, regulations, standards, and guides) with multiple `rlink` key-value pairs could be set in the back-matter as illustrated below.

{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL SSP Link to Back Matter Resource Example
    last-modified: '2022-01-01T09:30:00-005'
    version: 20220531
    oscal-version: 1.0.0
    links:
      - href: '#a7584118-3d2d-46c8-b388-df747309c0fa'
        rel: reference
        text: Applicable Laws and Regulations, Standards, and Guides
  import-profile: ...
  system-characteristics: ...
  control-implementation: ...
  back-matter:
    resources:
      uuid: a7584118-3d2d-46c8-b388-df747309c0fa
      rlinks:
        - href: https://www.dhs.gov/homeland-security-presidential-directive-12
        - href: https://csrc.nist.gov/csrc/media/publications/fips/199/final/documents/fips-pub-199-final.pdf
          media-type: application/pdf
        - href: /security/standards/IT-Rules-of-Behavior.docx
          media-type: application/msword
{{< /highlight >}}

Notice that in this example, the `links` object array on line #8 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `uuid` (see line #17).  Within `resources`, several items are referenced (via `rlinks`). Each `rlink` must have a URI reference (`href`).  The third `rlink` in this example provides a relative path.  All of the other `rlink` properties (e.g., `media-type` and `hash`) are optional.  Unlike `links`, `rlinks` do not have any `rel` properties to provide additional context, nor do they have `text` properties.  OSCAL content authors should consider these subtle differences when deciding whether to use `links` or `rlinks`.
{{% /tab %}}
{{% /tabs %}}

## Summary

This concludes the tutorial. You should now be familiar with:

- The basic use of OSCAL props
- How to use props to extend OSCAL models
- The basic use of OSCAL links
- How to specify local and remote links for indirection
