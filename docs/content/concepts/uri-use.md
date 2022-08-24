---
title: URI Usage
description: Provides information on the use of URIs in OSCAL.
weight: 40
---

According to [RFC 3986](https://www.rfc-editor.org/rfc/rfc3986) a Uniform Resource Identifier (URI) "is a compact sequence of characters that identifies an abstract or physical resource." URIs are an important concept, which are used extensively in OSCAL.

## Uniform Resource Identifier Overview

According to RFC 3986, a URI has the following syntax, which is represented in [Augmented Backus-Naur Form (ABNF)](https://www.rfc-editor.org/rfc/rfc5234.html) below.

> ```
> URI         = scheme ":" hier-part [ "?" query ] [ "#" fragment ]
> hier-part   = "//" authority path-abempty
>             / path-absolute
>             / path-rootless
>             / path-empty
> ```
> 
>   The scheme and path components are required, though the path may be empty (no characters).  When authority is present, the path must either be empty or begin with a slash ("/") character.  When authority is not present, the path cannot begin with two slash characters ("//").  These restrictions result in five different ABNF rules for a path ([Section 3.3](https://www.rfc-editor.org/rfc/rfc3986#section-3.3)), only one of which will match any given URI reference.
>
> The following are two example URIs and their component parts:
>
> ```
>   foo://example.com:8042/over/there?name=ferret#nose
>   \_/   \______________/\_________/ \_________/ \__/
>    |           |            |            |        |
> scheme     authority       path        query   fragment
>    |   _____________________|__
>   / \ /                        \
>   urn:example:animal:ferret:nose
> ```

According to RFC 3986, a URI can be used in a few different ways. Recognizing these URI forms is important in understanding how URIs are used in OSCAL.

### URI with a Required Scheme

As indicated above with the required scheme and path components.

### Relative Reference

A URI that is a relative reference, references a resource relative to another *[base URI](https://www.rfc-editor.org/rfc/rfc3986#section-5.1)*. Such a URI is resolved using [reference resolution](https://www.rfc-editor.org/rfc/rfc3986#section-5).

The [syntax of a relative reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.2) is:

> ```
> relative-ref  = relative-part [ "?" query ] [ "#" fragment ]
>
> relative-part = "//" authority path-abempty
>               / path-absolute
>               / path-noscheme
>               / path-empty
> ```

### URI Reference

A typical use of a URI, allowing a [URI with a required scheme](#uri-with-a-required-scheme) or a [relative reference](#relative-reference) to be used.

The [syntax of a URI reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.1) is:

> URI-reference = URI / relative-ref

### Absolute URI

According to RFC 3986, the [syntax of an absolute URI](https://www.rfc-editor.org/rfc/rfc3986#section-4.3) is:

> ```
> absolute-URI  = scheme ":" hier-part [ "?" query ]
> ```

## URI vs URL vs URN

According to RFC 3986 section [1.1.3](https://www.rfc-editor.org/rfc/rfc3986#section-1.1.3), "a URI can be further classified as a *locator*, a *name*, or *both*." A given URI scheme is not limited to being only a name or a locator; both characteristics can be associated.

- To be a *locator*, the resource pointed to by a URI needs to have persistence.

- To be a *name*, the URI needs to be used consistantly to refer to the thing that is named. A URI used only as a name is not required to resolve to a location. URIs schemes requiring an [*authority*](https://www.rfc-editor.org/rfc/rfc3986#section-3.2) element provide a means to use a registered DNS name to assert organizational control over a naming value space or namespace.

A *Uniform Resource Locator (URL)* "refers to the subset of URIs that, in addition to identifying a resource, provide a means of locating the resource by describing its primary access mechanism (e.g., its network "location")."

A URL, when applied consistently, can be used as a *name*. Optionally in such cases, the resource it resolves to can provide information about how to use the URL as a name.

A *Uniform Resource Name (URN)* "has been used historically to refer to both URIs under the "urn" scheme [RFC2141](https://www.rfc-editor.org/rfc/rfc2141), which are required to remain globally unique and persistent even when the resource ceases to exist or becomes unavailable, and to any other URI with the properties of a name.

A URN is often not a good fit for use as a *locator*, since it requires a secondary resolution process that maps the URN's *name* to a specific *location*.

Due to the specific characteristics of a URL or URN, the term URI is often used to refer more broadly to all types of resource identifiers.

## URIs in OSCAL

The following sections discuss how URIs are used in OSCAL.

### OSCAL URI Data Types

OSCAL uses two data types for representing URIs.

1. [`uri`](/reference/datatypes/#uri) - A URI which must provide the required scheme and path components. This means the URI will point directly to a resolvable resource.

   The `uri` data type is used in cases where a [*URI with a required scheme*](#uri-with-a-required-scheme) or an *absolute URI* is required.  As a result, a [*relative reference*](#relative-reference) or a [*URI reference*](#uri-reference) is not allowed for use with this data type.

2. [`uri-reference`](/reference/datatypes/#uri-reference) - A [*URI reference*](#uri-reference), which may be a [*URI with a required scheme*](#uri-with-a-required-scheme) or a [*relative reference*](#relative-reference). This allows all forms of URIs.

### Common OSCAL URI Use Cases

URIs are used in OSCAL to provide pointers to resources in the following ways.

#### Linking to a network resolvable resource

URIs are used to point directly to a network resolvable resource.

In such cases, the URI may be:

- A [*URI with a required scheme*](#uri-with-a-required-scheme), where the scheme will likely be `https` indicating the resource can be accessed using the [Hypertext Transfer Protocol](https://www.rfc-editor.org/rfc/rfc2616.html) (HTTP) using [Transport Layer Security](https://www.rfc-editor.org/rfc/rfc8446) (TLS). Data fields supporting only this use case will have the `uri` data type.

   OSCAL examples include:

   - `threat-id` - ([JSON/YAML](/reference/latest/complete/json-index/#/threat-id)) ([XML](/reference/latest/complete/xml-index/#/@threat-id))
   - `url` - ([JSON/YAML](/reference/latest/complete/json-index/#/url)) ([XML](/reference/latest/complete/xml-index/#/urls))

- A [*relative reference*](#relative-reference), pointing to a resource that can resolved using the current document resource as the *base URI*. Data fields supporting this use case will have the `uri-reference` data type.

   OSCAL examples include:

   - `href` - ([JSON/YAML](/reference/latest/complete/json-index/#/href)) ([XML](/reference/latest/complete/xml-index/#/@href))
   - `source` - ([JSON/YAML](/reference/latest/complete/json-index/#/source)) ([XML](/reference/latest/complete/xml-index/#/@source))
   - `filename` - ([JSON/YAML](/reference/latest/complete/json-index/#/filename)) ([XML](/reference/latest/complete/xml-index/#/@filename))

URIs serving this purpose need to be used as a *locator*. URLs are typically used for this purpose since the URI must resolve to a specific location.

#### Linking to another OSCAL object

A pointer to an OSCAL object identified by the referenced identifier, may be a [human-oriented](/concepts/identifier-use/#human-oriented) [`token`]() or a [machine-oriented](/concepts/identifier-use/#machine-oriented) [`uuid`](https://pages.nist.gov/OSCAL/reference/datatypes/#uuid).

This approach uses a [*relative reference*](#relative-reference) consisting of only a URI *fragment* containing the identifier or UUID of the referenced object within the current documents effective data model. The effective data model of a document includes all objects identified with the document and any directly or transitively imported documents. Identifiers with a *cross-instance* [scope](/concepts/identifier-use/#scope) are available to importing documents.

URIs serving this purpose need to be used as a *locator*. 

Any data fields supporting this use case will have the `uri-reference` data type.

A typical use of OSCAL object identifier linking is referencing a `resource` in the document's `back-matter` or an imported document's `back-matter`.

For example, the resource identified by the UUID `f5a2bdb3-55ad-431e-a7ea-c0fd28fc08a0` can be referenced as follows.

```
<link rel="related" href="#f5a2bdb3-55ad-431e-a7ea-c0fd28fc08a0"/>
```

More information about the use of links to reference back-matter resources can be found in the [*Referencing Back-Matter Resources*](/learn/tutorials/general/extension/#referencing-back-matter-resources) section of the [*Extending OSCAL Models with Props and Links*](/learn/tutorials/general/extension/) tutorial.

#### Use as a naming system identifier

An absolute URI that identifies the naming system. Data fields supporting this use case will have the `uri` data type.

OSCAL supports a number of name/value and other controlled value collections. To allow independent organization to organize these value collections, namespaces are used to partition the value spaces on an organization-by-organization basis. An [*absolute URI*](#absolute-uri) is used as the namespace identifier for these situations.

URIs serving this purpose need to be used as a *name*.

OSCAL examples include:

- `ns` - ([JSON/YAML](/reference/latest/complete/json-index/#/ns)) ([XML](/reference/latest/complete/xml-index/#/@ns))
- `system` - ([JSON/YAML](/reference/latest/complete/json-index/#/system)) ([XML](/reference/latest/complete/xml-index/#/@system))
- `scheme` - ([JSON/YAML](/reference/latest/complete/json-index/#/scheme)) ([XML](/reference/latest/complete/xml-index/#/@scheme))

A key example of this approach is how property names are partitioned using a `ns` data element.

For example, the namespace `http://example.com/ns/oscal` is used in an OSCAL property as follows.

```
<prop ns="http://example.com/ns/oscal" name="example-name" value="example-value"/>
```
   
To learn more about the use of namespaces in properties, refer to the [*Extending Existing Prop Values*](/learn/tutorials/general/extension/#extending-existing-prop-values) section of the [*Extending OSCAL Models with Props and Links*](/learn/tutorials/general/extension/) tutorial.
