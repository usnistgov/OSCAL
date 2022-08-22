---
title: URI Usage
description: Provides information on the use of URIs in OSCAL.
weight: 40
---

According to [RFC 3986](https://www.rfc-editor.org/rfc/rfc3986) a Uniform Resource Identifier (URI) "is a compact sequence of characters that identifies an abstract or physical resource." URIs are an important concept, which is used extensively in OSCAL.

## Uniform Resource Identifier Overview

According to RFC 3986, a URI has the following syntax as represented in [Augmented Backus-Naur Form (ABNF)](https://www.rfc-editor.org/rfc/rfc5234.html).

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
>   The following are two example URIs and their component parts:
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

According to RFC 3986, a URI can be used as:

- **A URI with a scheme:** As indicated above with the required scheme and path components.
- **A relative reference:** Which references a resource relative to another *[base URI](https://www.rfc-editor.org/rfc/rfc3986#section-5.1)*. Such a URI is resolved using [reference resolution](https://www.rfc-editor.org/rfc/rfc3986#section-5).

  According to RFC 3986, the [syntax of a relative reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.2) is:

  > ```
  > relative-ref  = relative-part [ "?" query ] [ "#" fragment ]
  >
  > relative-part = "//" authority path-abempty
  >               / path-absolute
  >               / path-noscheme
  >               / path-empty
  > ```

- **A URI reference:** Which is a typical use of a URI, allowing a URI with a scheme or a relative reference to be used.

  According to RFC 3986, the [syntax of a relative reference](https://www.rfc-editor.org/rfc/rfc3986#section-4.1) is:

  > URI-reference = URI / relative-ref

- **An absolute URI:**

  According to RFC 3986, the [syntax of an absolute URI](https://www.rfc-editor.org/rfc/rfc3986#section-4.3) is:

  > ```
  > absolute-URI  = scheme ":" hier-part [ "?" query ]
  > ```

Recognizing these URI forms is important in understanding how URIs are used in OSCAL.

## URIs in OSCAL

The following sections discuss how URIs are used in OSCAL.

### OSCAL URI Data Types

OSCAL uses two data types for representing URIs.

1. [`uri`](/reference/datatypes/#uri) - A URI which must provided the required scheme and path components. A *relative-ref* is not allowed for this data type.
1. [`uri-reference`](/reference/datatypes/#uri-reference) - A URI reference, which may be a URI or a *relative-ref*. This allows all forms of URIs.

Data elements within OSCAL expecting a URI will use one of these two data types.

Examples of `uri` use include:

- `ns` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/ns)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@ns))
- `system` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/system)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@system))
- `scheme` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/scheme)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@scheme))
- `threat-id` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/threat-id)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@threat-id))
- `url` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/url)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/urls))

Examples of `uri-reference` use include:

- `href` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/href)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@href))
- `source` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/source)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@source))
- `filename` - ([JSON/YAML](https://pages.nist.gov/OSCAL/reference/latest/complete/json-index/#/filename)) ([XML](https://pages.nist.gov/OSCAL/reference/latest/complete/xml-index/#/@filename))

### Common OSCAL URI Use Cases

URIs are used in OSCAL to provide pointers to resources in the following ways.

1. Link to a network resolvable resource.
   
   URIs are used to point directly to a network resolvable resource. In such cases, the URI may be:

   - A URI with a scheme, where the scheme will likely be `https` indicating the resource can be accessed using the [Hypertext Transfer Protocol](https://www.rfc-editor.org/rfc/rfc2616.html) (HTTP) using [Transport Layer Security](https://www.rfc-editor.org/rfc/rfc8446) (TLS).
   - A relative reference, pointing to a resource that can resolved using the current document resource as the *base URI*.

1. Link to an OSCAL back-matter resource.

   A pointer to an OSCAL resource defined in the either the document's `back-matter` or an imported document's `back-matter`.

   This approach uses a relative URI consisting of only a URI fragment containing the UUID of the referenced resource.

   For example, the resource identified by the UUID `f5a2bdb3-55ad-431e-a7ea-c0fd28fc08a0` can be referenced as follows.

   ```
   <link rel="related" href="#f5a2bdb3-55ad-431e-a7ea-c0fd28fc08a0"/>
   ```

   More information about the use of links to reference back-matter resources can be found in the [*Referencing Back-Matter Resources*](https://pages.nist.gov/OSCAL/learn/tutorials/general/extension/#referencing-back-matter-resources) section of the [*Extending OSCAL Models with Props and Links*](/learn/tutorials/general/extension/) tutorial.

1. As a naming system identifier

   An absolute URI that identifies the naming system.

   OSCAL supports a number of name/value and other controlled value collections. To allow independent organization to organize these value collections, namespaces are used to partition the value spaces on an organization-by-organization basis. An absolute URI is used as the namespace identifier for these situations.

   A key example of this approach is how property names are managed.

   For example, the namespace `http://example.com/ns/oscal` is used in an OSCAL property as follows.

   ```
   <prop ns="http://example.com/ns/oscal" name="example-name" value="example-value"/>
   ```
   
   To learn more about the namespacing of properties, refer to the [*Extending Existing Prop Values*](/learn/tutorials/general/extension/#extending-existing-prop-values) section of the [*Extending OSCAL Models with Props and Links*](/learn/tutorials/general/extension/) tutorial.

