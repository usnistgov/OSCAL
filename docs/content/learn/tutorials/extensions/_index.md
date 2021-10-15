---
title: Extending OSCAL Models with Props and Links
description: A tutorial on extending OSCAL models by using props and links.
weight: 5
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

In creating OSCAL, NIST anticipated the importance of extensibility for unique requirements when organizations implement their security compliance programs. It was important to establish extension mechanisms from the onset, to allow organizations (and other stakeholders) to tailor OSCAL for their specific needs.

Thus, OSCAL is designed with extensibility as one of its key principles, allowing the OSCAL models to be extended wherever there are prop or link properties in the core models. This tutorial describes both extension mechanisms, explaining when to utilize them and illustrating their proper use.

## Props

The `prop` property in OSCAL is used to extend core models when 1) there is a need to capture information that is not in the core OSCAL model or 2) there is a need to accommodate for property values that are not in core OSCAL. Props are defined by their given `name`, namespace `ns`, `value`, and `class` attributes, although only `name` and `value` are always required.  Below is a description of each attribute:  

- `name` (Required) - The `name` attributed is required for every `prop` and should be a [token](/reference/datatypes/#token) data type.  Depending on the OSCAL model data item, a `prop` may have OSCAL pre-defined names.  For example, the OSCAL SSP model's system characteristics data item has a pre-defined `prop` named [`data-center`](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-characteristics/prop).  Other data items, such as the OSCAL SSP security sensitivity level data item has its own pre-defined `props` (e.g., [`privacy-designation`](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-characteristics/security-sensitivity-level)).  And in other cases, such as the SSP authorization boundary data item, `prop` does not have any pre-defined `name` values. OSCAL content authors need to determine whether to use the OSCAL prescribed prop names or to locally define their own. To view existing `prop` name values or determine if `name` can be defined locally, review the [model reference index](/reference/latest/complete/xml-index/#/prop).  Requests and recommendations to add pre-defined `names` should be sent to the OSCAL NIST team (see the [Contact Us Page](/contact)).
- `ns` (Optional) - The optional `ns` attribute is used to specify the namespace for a `prop` and should be a [universal resource identifier (URI)](/reference/datatypes/#uri) formatted according to RFC3986. The default namespace `ns` attribute for OSCAL `props` is `http://csrc.nist.gov/ns/oscal`, and can be omitted when using OSCAL define pre-defined properties (e.g., [`data-center`](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-characteristics/prop)). Namespaces qualify a property's name. This allows different organizations to associate distinct semantics with the same name.  Organizations and other stakeholders have the ability to extend OSCAL with their own properties, which could lead to naming conflicts, however, the namespace `ns` can be specified by OSCAL content authors to prevent name collisions.  
- `value` (Required) - The `value` attribute is required for every `prop` and should be a [string](/reference/datatypes/#string) data type. Generally, OSCAL content authors may specify any `value` for a `prop`.  However, when using props with pre-defined `name` values, there are usually some constraints on acceptable `value`.  For example, the OSCAL SSP [system characteristics](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/system-characteristics) data item pre-defined property named "identity-assurance-level" must have a value of 1, 2, or 3 as defined by NIST SP 800-63-3.  The ability to extend with additional values depends on the `prop` (see the [model reference index](/reference/latest/complete/xml-index/#/prop)). The constraints for these `prop` properties are defined within the [OSCAL Metaschemas](https://github.com/usnistgov/OSCAL/tree/main/src/metaschema).  Where applicable, Metaschema defines the `allowed-values` for the `prop` properties.  The `prop` properties that are extensible are defined with an `allow-other=yes` attribute in Metaschema.  
- `class` (Optional) - Finally, the optional `class` attribute should be used in cases where a property needs the same `name` and `ns` namespace.  It is a textual label that provides a sub-type or characterization of the property's name. This can be used to further distinguish or discriminate between the semantics of multiple properties of the same object with the same name and ns. The `class` attribute should be a [token](/reference/datatypes/#token) data type and can be used in those circumstances to enable the &quot;overloading&quot; of the `prop`.

### Using an Existing Prop

This sections covers the basic use of a `prop` leveraging all of its attributes.  The OSCAL SSP [metadata](/concepts/layer/overview/#metadata-overview) allows for zero or more `location` data items, each containing zero or more `props`.  

{{% callout note %}}
The [Metadata Tutorial](/learn/tutorials/metadata/) provides in-depth description and walk-through examples of creating OSCAL metadata.
{{% /callout %}}

In this example, an organization needs to document their primary and alternate data center locations.  This is achieved by specifying the `name`, `value`, and `class` of the properties for each location.

{{< tabs XML JSON YAML >}}

{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL Basic Prop Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210812</version>
    <oscal-version>1.0.0</oscal-version>
    <location uuid="location uuid">
      <title>....</title>
      <prop name="type" value="data-center" class="primary">...</prop>
    </location>
    <location uuid="location uuid">
      <title>....</title>
      <prop name="type" value="data-center" class="alternate">...</prop>
    </location>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}

The `@name` attribute is set to "type" which is an OSCAL pre-defined property. The `@value` attribute is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/location) value for location "type" properties. The `@class` attribute in this case is used to indicate a subclass of data-center, and is set the the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/xml-reference/#/system-security-plan/metadata/location)  values for data center location properties.  Note that in this example, the `@ns` attribute is omitted because we are using a standard OSCAL defined `<prop>` element.

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL Basic Prop Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210812,
      "oscal-version": "1.0.0",
      "locations": [
      {
        "title": "....",
        "props": [
          {
            "name":"type",
            "value":"data-center",
            "class":"primary"
          }
        ]
      },
      {
          "title": "....",
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

In the `props` object array, the prop object's `name` property is set to "type" which is an OSCAL pre-defined property. The `value` property is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) value for location "type" properties. The `class` property in this case is used to indicate a subclass of data-center, and is set the the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) values for data center location `prop`.  Note that in this example, the `ns` property is omitted because we are using a standard OSCAL defined `prop` object.

{{% /tab %}}

{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL Basic Prop Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210812
    oscal-version: 1.0.0
    locations:
      - title: ....
        props:
          - name: type
            value: data-center
            class: primary
      - title: ....
        props:
          - name: type
            value: data-center
            class: alternate
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...
{{< /highlight >}}

In the `props` object array, the prop object's `name` property is set to "type" which is an OSCAL pre-defined property. The `value` property is set to "data-center" which is an [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) value for location "type" properties. The `class` property in this case is used to indicate a subclass of data-center, and is set the the appropriate [OSCAL pre-defined](/reference/latest/system-security-plan/json-reference/#/system-security-plan/metadata/locations) values for data center location `prop`.  Note that in this example, the `ns` property is omitted because we are using a standard OSCAL defined `prop` object.

{{% /tab %}}

{{% /tabs %}}

### Extending Existing Prop Values

One of the most common scenarios for extending an OSCAL `prop` is when adding values to an existing OSCAL property. Again, if using an OSCAL defined `prop`, the `ns` namespace attribute does not need to be specified since the default OSCAL namespace applies.  

The following example demonstrates how to extend a SSP metadata location "type" `prop` with an additional value.

{{% callout note %}}
Again, for a detailed overview of how to implement metadata, please refer to the [Metadata Tutorial](/learn/tutorials/metadata/).
{{% /callout %}}

Currently, the only OSCAL defined value for the SSP metadata location `prop` is "data-center".  However, because this particular `prop` is defined with an `allow-other=yes` attribute (in Metaschema), additional "type" values can be specified as shown below on line #10.

{{< tabs XML JSON YAML >}}

{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL Basic Prop Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210812</version>
    <oscal-version>1.0.0</oscal-version>
    <location uuid="1f190601-2e87-4787-a50a-d08b78e4a980">
      <title>....</title>
      <prop name="type" value="security-operations-center">...</prop>
    </location>
  </metadata>
  <import-profile>...</import-profile>
  <system-characteristics>...</system-characteristics>
  <system-implementation>...</system-implementation>
</system-security-plan>
{{< /highlight >}}

The `@class` attribute was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL Basic Prop Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210812,
      "oscal-version": "1.0.0",
      "locations": [
      {
        "title": "....",
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

The `class` property was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).

{{% /tab %}}

{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL Basic Prop Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210812
    oscal-version: 1.0.0
    locations:
      - title: ....
        props:
          - name: type
            value: security-operations-center
  import-profile: ...
  system-characteristics: ...
  system-implementation: ...
{{< /highlight >}}

The `class` property was not specified but could be added if there was a need for semantic classification of "security operations center" (e.g., regional or global).

{{% /tab %}}

{{% /tabs %}}

### Creating a New Prop

The previous examples leveraged an existing OSCAL `prop` to document location details (e.g., location "type") within an SSP.  But what if there were other pertinent location details that needed to be captured as well? For example, some government organizations with distributed global physical locations may want to use [Geographic Locator Codes (GLC)](https://www.gsa.gov/reference/geographic-locator-codes-glcs-overview) to facilitate interchange of location data with other government agencies.  The example below demonstrates how this could be documented by specifying a new GLC `prop` property (see lines #15-33).

{{< tabs XML JSON YAML >}}

{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL New Prop Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210812</version>
    <oscal-version>1.0.0</oscal-version>
    <location uuid="1f190601-2e87-4787-a50a-d08b78e4a980">
      <title>....</title>
      <prop name="type"
            value="security-operations-center"
            class="regional">
        ...
      </prop>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="11"
            class="state-code">
        ...
      </prop>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="0010"
            class="city-code">
        ...
      </prop>
      <prop name="glc"
            ns="http://federal-agency.gov/ns/oscal"
            value="840"
            class="country-code">
        ...
      </prop>
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
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210812,
      "oscal-version": "1.0.0",
      "locations": [
      {
        "title": "....",
        "props": [
          {
            "name":"type",
            "value":"security-operations-center",
            "class":"regional"
          }
        ]
      },
      {
          "title": "....",
          "props": [
          {
            "name":"glc",
            "ns":"http://federal-agency.gov/ns/oscal",
            "value":"11",
            "class":"state-code"
          }
        ]
      },
      {
          "title": "....",
          "props": [
          {
            "name":"glc",
            "ns":"http://federal-agency.gov/ns/oscal",
            "value":"0010",
            "class":"city-code"
          }
        ]
      },
      {
          "title": "....",
          "props": [
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
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210812
    oscal-version: 1.0.0
    locations:
      - title: ....
        props:
          - name: type
            value: security-operations-center
            class: regional
      - title: ....
        props:
          - name: glc
            ns: http://federal-agency.gov/ns/oscal
            value: '11'
            class: state-code
      - title: ....
        props:
          - name: glc
            ns: http://federal-agency.gov/ns/oscal
            value: '0010'
            class: city-code
      - title: ....
        props:
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

The `link` property is made available in specific OSCAL models and supports either URL or back matter resources. The `link` property has the following attributes: `href`, `rel`, `media-type`, and `text`.

- `href` (Required) - The `href` attribute is a required, [resolvable URL reference](/reference/datatypes/#uri-reference) to a resource. This can either be an internet resource or a fragment that point to a back matter resource in the same document.
- `rel` (Optional) - The optional `rel` attribute is a [token](/reference/datatypes/#token) datatype that can be used to describe the link&#39;s purpose.  Some OSCAL link properties may have pre-defined `rel` values (e.g., reference), but generally, OSCAL content authors can specify any token value for a `rel` attribute.  Although any string can be used in the `rel` attribute, OSCAL identifies five common link relationships that are frequently useful:
  - canonical: The link identifies the authoritative location for this file.
  - alternate: The link identifies an alternative location or format for this file.
  - latest-version: This link identifies a resource containing the latest version in the version history. Defined by RFC 5829.
  - predecessor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.
  - successor-version: This link identifies a resource containing the predecessor version in the version history. RFC 5829.
- `media-type` (Optional) - The optional `media-type` attribute can be used to provide the consumer of the OSCAL content a hint about the type of data referenced in the link. Supported media types are as defined by the [Internet Assigned Numbers Authority (IANA)](https://www.iana.org/assignments/media-types/media-types.xhtml).  The `media-type` attribute accepts [string](/reference/datatypes/#string) values.
- `text` (Optional) - Finally, the optional `text` sub-element can be used for as a textual label for the `link` and accepts [markup-line](/reference/datatypes/#markup-line) datatype. The subsequent sections demonstrate the proper use of links.

### Link to internet URL

Organizations may need their documentation (e.g., SSP) to reference external items, such applicable laws and regulations (e.g., HSPD-12) and other organizational items (e.g., official agency logos).  This first example illustrates how an OSCAL SSP might make use of a link to an internet URL.

{{< tabs XML JSON YAML >}}

{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL SSP Component Link Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
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
      "last-modified": "2001-12-17T09:30:47Z",
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

In this case, the `links` object array on line #8 provides a reference to HSPD-12 by specifying the URL in the `href` property.  The OSCAL pre-defined "reference" value is used  for the `rel`, providing context for the purpose of this specific `link`. The `text` property provides an associated label for the `link` which may be useful when rendering the SSP in other formats (e.g., html or office document formats).

Lines #14-18 demonstrate the use of link to point to the organization's official logo.  An absolute URI was used to point to the location of the referenced content, however, it should be noted that the `href` property also permits the use of relative URI paths.  If the referenced resource is located is on the same machine or domain, then a relative URI path could be used.  The `rel` property was set to "logo" to indicate the type of relationship provided by the specified `link`.  The `media-type` property was included to let any rendering tools know that the logo content is a PNG image type.  The optional `text` property was excluded for brevity of this example.

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the `href` property indicates that the `link` is referencing a `back-matter` `resources` object array in the same OSCAL document.

{{% /tab %}}

{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL SSP Component Link Example
    last-modified: '2001-12-17T09:30:47Z'
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

In this case, the `links` object array on line #7 provides a reference to HSPD-12 by specifying the URL in the `href` property.  The OSCAL pre-defined "reference" value is used  for the `rel`, providing context for the purpose of this specific `link`. The `text` property provides an associated label for the `link` which may be useful when rendering the SSP in other formats (e.g., html or office document formats).

Lines #11-13 demonstrate the use of link to point to the organization's official logo.  An absolute URI was used to point to the location of the referenced content, however, it should be noted that the `href` property also permits the use of relative URI paths.  If the referenced resource is located is on the same machine or domain, then a relative URI path could be used.  The `rel` property was set to "logo" to indicate the type of relationship provided by the specified `link`.  The `media-type` property was included to let any rendering tools know that the logo content is a PNG image type.  The optional `text` property was excluded for brevity of this example.

The next section demonstrates how to reference back matter resources with links. Specifying a fragment in the `href` property indicates that the `link` is referencing a `back-matter` `resources` object array in the same OSCAL document.

{{% /tab %}}

{{% /tabs %}}

### Referencing Back-Matter

When using `link` to reference `back-matter` `resources`, the `link` must use the resource's `uuid` attribute as the pointer. The `resource` property must have an `rlink` property that points to the (external) content via the `href` attribute.  Optionally, the `rlink` property can also include a hash (e.g., to ensure the integrity of the referenced content), however, that is an advanced concept that is not covered in this tutorial.

In the previous section, multiple `links` would need to be created in the SSP metadata for each applicable laws and regulations. However, another approach would be to specify one `link` in the metadata for all applicable laws, regulations, standards, and guides.  Then a single `resource` (for the applicable laws, regulations, standards, and guides) with multiple `rlinks` could be set in the back-matter as illustrated below.

{{< tabs XML JSON YAML >}}

{{% tab %}}
{{< highlight xml "linenos=table" >}}
<?xml version="1.0" encoding="UTF-8"?>
<system-security-plan uuid="ce16b9af-6853-4abe-9e27-b79d034c0adc">
  <metadata>
    <title>OSCAL SSP Link to Back Matter Resource Example</title>
    <last-modified>2001-12-17T09:30:47Z</last-modified>
    <version>20210707</version>
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

Notice that in this example, the `<link>` element on line #8 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `@uuid` (see line #16).  Within this `<resource>` element, several items are referenced (via `<rlinks>`). The `<rlinks>` must have a URI reference (`@href`).  The third `<rlink>` in this example provides a relative path.  All of the other `<rlink>` attributes (e.g., `@media-type` and `@hash`) are optional.  Unlike `<links>`, `<rlinks>` do not have any `@rel` attributes to provide additional context, nor do they have `<text>` sub-elements.  OSCAL content authors should consider these subtle differences when deciding whether to use `<links>` or `<rlinks>`.

{{% /tab %}}

{{% tab %}}
{{< highlight json "linenos=table" >}}
{
  "system-security-plan": {
    "uuid": "ce16b9af-6853-4abe-9e27-b79d034c0adc",
    "metadata": {
      "title": "OSCAL SSP Link to Back Matter Resource Example",
      "last-modified": "2001-12-17T09:30:47Z",
      "version": 20210707,
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

Notice that in this example, the `links` object array on line #8 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `uuid` (see line #20).  Within `resources`, several items are referenced (via `rlinks`). Each `rlink` must have a URI reference (`href`).  The third `rlink` in this example provides a relative path.  All of the other `rlink` properties (e.g., `media-type` and `hash`) are optional.  Unlike `links`, `rlinks` do not have any `rel` properties to provide additional context, nor do they have `text` properties.  OSCAL content authors should consider these subtle differences when deciding whether to use `links` or `rlinks`.

{{% /tab %}}

{{% tab %}}
{{< highlight yaml "linenos=table" >}}
system-security-plan:
  uuid: ce16b9af-6853-4abe-9e27-b79d034c0adc
  metadata:
    title: OSCAL SSP Link to Back Matter Resource Example
    last-modified: '2001-12-17T09:30:47Z'
    version: 20210707
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
        - href: >-
            https://csrc.nist.gov/csrc/media/publications/fips/199/final/documents/fips-pub-199-final.pdf
          media-type: application/pdf
        - href: /security/standards/IT-Rules-of-Behavior.docx
          media-type: application/msword

{{< /highlight >}}

Notice that in this example, the `links` object array on line #7 only provides a fragment rather than a URL. OSCAL interprets this as a pointer to a back matter resource `uuid` (see line #16).  Within `resources`, several items are referenced (via `rlinks`). Each `rlink` must have a URI reference (`href`).  The third `rlink` in this example provides a relative path.  All of the other `rlink` properties (e.g., `media-type` and `hash`) are optional.  Unlike `links`, `rlinks` do not have any `rel` properties to provide additional context, nor do they have `text` properties.  OSCAL content authors should consider these subtle differences when deciding whether to use `links` or `rlinks`.

{{% /tab %}}

{{% /tabs %}}

## Summary

This concludes the tutorial. You should now be familiar with:

- The basic use of OSCAL props
- How to use props to extend OSCAL models
- The basic use of OSCAL links
- How to specify local and remote links for indirection
