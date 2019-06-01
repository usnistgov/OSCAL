# Table of Contents

- [Table of Contents](#table-of-contents)
- [OSCAL Metaschema](#oscal-metaschema)
  - [Metaschema Architecture](#metaschema-architecture)
  - [Metaschema Design Goals](#metaschema-design-goals)
  - [The Overall Approach](#the-overall-approach)
- [Metaschema Organization](#metaschema-organization)
    - [`METASCHEMA` element](#-metaschema--element)
    - [Metaschema header](#metaschema-header)
      - [schema-name](#schema-name)
      - [short-name](#short-name)
      - [remarks](#remarks)
    - [Metaschema definitions](#metaschema-definitions)
      - [Fields](#fields)
      - [Assemblies](#assemblies)
      - [Flags](#flags)
    - [Metaschema modeling](#metaschema-modeling)
    - [Use of @address](#use-of--address)

# OSCAL Metaschema

An OSCAL Metaschema defines the *information model* of a given OSCAL model. A Metaschema describes the information structures that define an OSCAL model in a format-neutral form. Documentation about the meaning (semantics) and use of a given structure (abstract syntax) is also provided in a Metaschema.

OSCAL Metaschemas are used to generate other OSCAL artifacts based on the metaschema description. These artifacts include:

- XML and JSON Schemas, or *data models*, are derived from the metaschema, expressed as XSD and JSON Schema;
- Conversion scripts that can convert OSCAL content between the XML and JSON OSCAL formats, ensuring the resulting content is schema valid; 
- XML and JSON [model documentation](https://pages.nist.gov/OSCAL/docs/schemas/) for use on the [OSCAL website](https://pages.nist.gov/OSCAL).

Use of Metaschemas in OSCAL allow us to maintain seamless and consistent support for multiple OSCAL model formats, including XML and JSON. Content can also be kept up-to-date in multiple formats using generated content converters, and can be validated using generated schema. Adding support for new formats (e.g., YAML) can accomplished by extending the Metaschema tooling to produce schema and converters for other formats.

## Metaschema Architecture

The following illustrates the Metaschema architecture:

![Metaschema Architecture](https://mermaidjs.github.io/mermaid-live-editor/#/view/eyJjb2RlIjoiZ3JhcGggVEJcbiAgbXMgLS0gZXh0cmFjdCBkb2N1bWVudGF0aW9uIC0tPiB4bWxkb2NzaFtYTUwgZG9jcyAvIEhUTUxdXG4gIHhtbGRvY3NoIC0tIGdlbmVyaWMgSFRNTCB0byBtZCAtLT4geG1sZG9jbWRbWE1MIGRvY3MgLyBtZF1cbiAgbXMoKE1ldGFzY2hlbWEpKSAtLSB0cmFuc2xhdGUgLS0-IHNjaChYTUwgU2NoZW1hKVxuICBtcyAtLSB4ZG06Om9iamVjdCBtYXAgLS0-IHhqe3htbCB0byBqc29uIFhTTFR9XG4gIG1zIC0tIG9iamVjdDo6eGRtIG1hcCAtLT4ganh7anNvbiB0byB4bWwgWFNMVH1cbiAgbXMgLS0gdHJhbnNsYXRlIC0tPiBqc2NoKEpTT04gU2NoZW1hKVxuICBtcyAtLSBleHRyYWN0IGRvY3VtZW50YXRpb24gLS0-IGpzb25kb2NzaFtKU09OIGRvY3MgLyBIVE1MXVxuICBqc29uZG9jc2ggLS0gZ2VuZXJpYyBIVE1MIHRvIG1kIC0tPiBqc29uZG9jbWRbSlNPTi1mbGF2b3JlZCBkb2NzIC8gbWRdXG5cbmNsYXNzRGVmIG1ldGFzY2ggZmlsbDpza3libHVlLHN0cm9rZTpibHVlLHN0cm9rZS13aWR0aDoxMnB4LHN0cm9rZS1vcGFjaXR5OjAuMlxuY2xhc3NEZWYgeG1sIGZpbGw6Z29sZCxzdHJva2U6IzMzMyxzdHJva2Utd2lkdGg6MnB4O1xuY2xhc3NEZWYganNvbiBmaWxsOnBpbmssc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweFxuY2xhc3NEZWYgaHRtbCBmaWxsOmxpZ2h0Z3JlZW4sc3Ryb2tlLXdpZHRoOjJweFxuY2xhc3NEZWYgbWQgZmlsbDpsaWdodGdyZWVuLHN0cm9rZS13aWR0aDo0cHgsc3Ryb2tlLWRhc2hhcnJheToyLDJcblxuY2xhc3MgbXMgbWV0YXNjaFxuY2xhc3Mgc2NoLHhqIHhtbFxuY2xhc3MganNjaCxqeCBqc29uXG5jbGFzcyB4bWxkb2NzaCxqc29uZG9jc2ggaHRtbFxuY2xhc3MgeG1sZG9jbWQsanNvbmRvY21kIG1kIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0)

Mermaid is a notation for producing graphics from abstract node/network descriptions - https://mermaidjs.github.io/


The following is the [Mermaid notation](IGpzb25kb2NzaFtKU09OIGRvY3MgLyBIVE1MXVxuICBqc29uZG9jc2ggLS0gZ2VuZXJpYyBIVE1MIHRvIG1kIC0tPiBqc29uZG9jbWRbSlNPTi1mbGF2b3JlZCBkb2NzIC8gbWRdXG5cbmNsYXNzRGVmIG1ldGFzY2ggZmlsbDpza3libHVlLHN0cm9rZTpibHVlLHN0cm9rZS13aWR0aDoxMnB4LHN0cm9rZS1vcGFjaXR5OjAuMlxuY2xhc3NEZWYgeG1sIGZpbGw6Z29sZCxzdHJva2U6IzMzMyxzdHJva2Utd2lkdGg6MnB4O1xuY2xhc3NEZWYganNvbiBmaWxsOnBpbmssc3Ryb2tlOiMzMzMsc3Ryb2tlLXdpZHRoOjJweFxuY2xhc3NEZWYgaHRtbCBmaWxsOmxpZ2h0Z3JlZW4sc3Ryb2tlLXdpZHRoOjJweFxuY2xhc3NEZWYgbWQgZmlsbDpsaWdodGdyZWVuLHN0cm9rZS13aWR0aDo0cHgsc3Ryb2tlLWRhc2hhcnJheToyLDJcblxuY2xhc3MgbXMgbWV0YXNjaFxuY2xhc3Mgc2NoLHhqIHhtbFxuY2xhc3MganNjaCxqeCBqc29uXG5jbGFzcyB4bWxkb2NzaCxqc29uZG9jc2ggaHRtbFxuY2xhc3MgeG1sZG9jbWQsanNvbmRvY21kIG1kIiwibWVybWFpZCI6eyJ0aGVtZSI6ImRlZmF1bHQifX0) for the chart above:

```
graph TB
  ms -- extract documentation --> xmldocsh[XML docs / HTML]
  xmldocsh -- generic HTML to md --> xmldocmd[XML docs / md]
  ms((Metaschema)) -- translate --> sch(XML Schema)
  ms -- xdm::object map --> xj{xml to json XSLT}
  ms -- object::xdm map --> jx{json to xml XSLT}
  ms -- translate --> jsch(JSON Schema)
  ms -- extract documentation --> jsondocsh[JSON docs / HTML]
  jsondocsh -- generic HTML to md --> jsondocmd[JSON-flavored docs / md]

classDef metasch fill:skyblue,stroke:blue,stroke-width:12px,stroke-opacity:0.2
classDef xml fill:gold,stroke:#333,stroke-width:2px;
classDef json fill:pink,stroke:#333,stroke-width:2px
classDef html fill:lightgreen,stroke-width:2px
classDef md fill:lightgreen,stroke-width:4px,stroke-dasharray:2,2

class ms metasch
class sch,xj xml
class jsch,jx json
class xmldocsh,jsondocsh html
class xmldocmd,jsondocmd md
```

## Metaschema Design Goals

The OSCAL Metaschema addresses the following needs:
1. Unify support for compatible data descriptions in multiple disparate formats, such as XML, JSON, YAML and potentially others
2. Produce schema documentation from the same source as schema files and tools
3. Enable distributed, semi-coordinated experimentation with OSCAL format(s) and their tools as supported by Metaschema

The *primary* goal is supporting the maintenance of OSCAL format(s) and data description by the OSCAL team.

A *secondary* and more distant goal is to enable the wider community to build and extend by using the Metaschema tech on their own data description problems.

If you are not focused on the OSCAL models, your needs likely align with our secondary goal. Unfortunately, we are currently focused on our primary goal, and will visit generalizing the Metaschema and supporting toolchain at a later date. As a result, using the Metaschema and related toolchain for a purpose other than working directly with OSCAL models in this repository is *not* recommended at this time.

Nonetheless and with this in mind, understanding the mechanism by which the Metaschema productions are created -- schemas, transformations and documentation -- will greatly aid understanding how the Metaschema is used in this project. Essentially, the Metaschema is the foundation for explaining how the various schemas and tools relate to each other, how they reflect the same logic and relative internal organization, and how they can be used to support operational requirements such as data conversion and validation.

Terminology note: "metaschema" is a common noun and there are many metaschema technologies (indeed almost any mature XML tag set has one), with different purposes, feature sets and capabilities. "Metaschema" (capitalized) is our peculiar homegrown metaschema technology and application.

## The Overall Approach

A reduced, lightweight modeling language with certain specially-enforced constraints can be sketched such that multiple schemas constraining disparate formats, such as XML and JSON, can be produced from a single metaschema instance (a document written in Metaschema) deterministically, and thus designed and coordinated in parallel.

We begin by producing functioning schemas to describe OSCAL data in XML Schema Definition Language (XSD) 1.1 on the XML side and JSON Schema draft7 on the JSON side. As we do this, the constraints imposed by using the Metaschema modeling syntax enable us to do two things implicitly (that is, without any further effort or additional cost or planning):

- Limit ourselves to schema constructs that map cleanly into features offered by both (target) schema technoologies, thus ensuring that all information can be preserved in (lossless bidirectional) conversion.

- Mediate between the "structural imbalances" in the data formats by providing the extra information we need to introduce improvements to model and syntax on both sides. By "model and syntax" we mean everything bearing on both the information sets to be represented, and their (canonical or recognized) representations, including object structures, notations and data type bindings. Beyond the applicable metaschema, no further inputs and no reliance on arbitrary conventions or runtime settings should be necessary to produce, reliably, correspondent JSON from any (metaschema-described, schema-valid) XML, and vice-versa.

- Additionally, (and this is crucial) produce specifications and running code supporting automated production of schemas and model-related artifacts, consistent with the circumscribed model defined (and documented) in the Metaschema. 

In addition to the demonstrations offered by schema artifacts, the semantics of metaschema elements and constructs are documented here and tested by means of unit tests for the transformations concerned.

The Metaschema syntax (an XML application) is also described and constrained with its [own schema](../../build/metaschema/lib), and with a [Schematron constraints set](../../build/metaschema/lib/metaschema-check.sch). The latter is able to enforce some of the rules described below.

Because the Metaschema is designed to support only a "greatest common factor" of schema features. These features are a minimal, but adequate and useful, subset of the wide range of modeling capabilities in either of its target schema languages (and ideally, other future targets). Thus, the Metaschema's modeling capabilities are fairly rudimentary. This may also make it easier to use.

Basically, a Metaschema metaschema describes a documentary structure comprising **assemblies**, each of which is composed of (more) assemblies and **fields**. Fields present data content while assemblies organize things. Both fields and assemblies can have **flags**, which are name-value pairs further qualifying their fields or assemblies with application-oriented and -specific annotations.

Comprehensive mappings from assembly, field and flag definitions, into analogous (representative) XSD and/or JSON Schema structures, enables modeling data in either/both XML or/and JSON, impartially and "ecumenically", as long as rules on both sides are followed. And because these mappings are fully defined, the mappings between corresponding XML and JSON expressions come for free.

# Metaschema Organization

A Metaschema instance has two parts: a header, and a set of definitions for the model components or parts.

Top level documentation for the Metaschema instance appears in the header section, while documentation for all the constructs appears with the definitions for those constructs. There is no explicit separation between the header and the definitions: the header ends when the definitions start.

## `METASCHEMA` element

The root element is `METASCHEMA` using all capitals. To name the root element in all capitals (unlike the general rule) and to give it a name somewhat peculiar to its application, retains and expresses the information that it is intended to be the document root. This is the only element named in all caps.

`METASCHEMA` may take two attributes, `@use` and `@top`. `@use` must be equal to the `@name` assigned to an assembly definition in the schema. `@top` must be equal to the `@group-as` on the same definition. (This is the first instance of the Metaschema tactic of "strategic redundancy" in naming and managing its various components. While in principle, we would be able to infer each of these values from the other, we require both to be expressed in order to confirm the integrity of the binding.)

Note the assembly definition indicated by @use will be expected to apply to the root or virtual root for the conformant XML or JSON data set.

## Metaschema header

In addition to the top-level attributes `@use` and `@top`, the top of the metaschema may include these elements, in order:


### schema-name

Describing the scope of application of the data format, for example "OSCAL Catalog".

### short-name

A coded version of the schema name, for use when a string-safe identifier is needed, for example on artifact file names. Expect this short name to be propagated anytime such a "handle" is needed. A short name for the OSCAL Catalog metaschema (and schemas) might be `oscal-catalog`.

### remarks

Paragraphs describing the metaschema.

Note that the `remarks` element is also permitted to appear elsewhere; this is a general-purpose element for including explanatory commentary of any kind; its scope of application is generally shown by its location in the document - the top-level remarks should describe the entire metaschema.

## Metaschema definitions

Following the `METASCHEMA/remarks`, any number of schema component definitions may follow. These describe each component, provide information determining details of its representation and handling (in XML and JSON), and include documentation.

Whatever is an element, an attribute or a value in XML, in JSON must be a string or an object, a property of an object or a member of an array, an explicitly or an implicitly typed value. What sorts of things are expressed as what, and how a reasonable economy of expression can be achieved despite the natural type mismatches between these formats *when describing the same data*, are determined by these definitions in the metaschema.

There are three kinds of definitions:

### Fields

Fields can be thought of as simple text values, either scalars or sequences of scalars, or when appropriate, of "rich text", i.e. text permitting inline formatting. Depending on modeling requirements, fields may also be used for even simpler bits of data, such as objects that carry specialized flags but have no values or structures otherwise.

This means that fields can be more or less complex, depending on the need. This distinction is made by qualifying the `field` with an `@as` attribute, as follows:


| `@as` value | Constraints on data |
|-------------|---------------------|
|string  | Plain (unformatted) text |
|[not given]  | Plain (unformatted) text (same as `string`) |
|boolean | The field may be only 'true' or 'false'. In XML this will be signaled not by any string value but by the presence ("true") or absence ("false") of the element. In JSON an explicit Boolean value is assigned to a property on the field (object). |
| mixed | Supports rich text: in XML, inline markup (same as in "prose"). In JSON, inline OSCAL markdown (also as in prose). |
| empty | In XML, the element will be empty (though it can have attributes for any flags). In JSON, no property will be required or offered for a text value. |

In addition to these settings, fields may be defined with flags. Do this by including `flag` elements directly in the definition.

By "plain text" we mean the subset of Unicode permitted in XML contents, encoded as UTF-8 or deterministically convertible thereto.

### Assemblies

An assembly is just like a field, except it contains structured content (objects or elements), not text or unstructured "rich text". The contents permitted in a particular (type of) assembly are indicated in its `model` element. An `@as` attribute is not necessary (or permitted) on an assembly definition.

### Flags

While data of arbitrary complexity is represented by assemblies (which may contain assemblies), at the other extreme, flags are available for the most granular bits of qualifying information. Since data already appears as text values of fields, flags might not be necessary. But they are extremely useful both for enabling more economical expression of data and especially process-oriented or "semantic" metadata such as controlled values, formal or informal taxonomic classifications etc. etc.

In order to facilitate this, flags also support a feature not supported on fields, namely rudimentary data typing (via XSD datatypes). Use `define-flag/@datatype` and `flag/@datatype` (again, with tactical redundancy, the same value at both ends) to assign its datatype.

## Metaschema modeling

In the case of field and flag objects, the modeling constraints to be imposed by the result schemas (either XSD or JSON Schema) over the data set, can be determined on the basis of how they are described. Assembly definitions, however, permit not only flags to be assigned to assemblies of the defined type; additionally, they contain a `model` element for a *mode declaration*. This declaration names the subcomponents to be permitted (in documents valid to the target schemas) within any assembly of the type being defined.

Five elements are used within `model` to define permissible contents of assemblies (elements or objects) being defined. Each of these represents a different object type. Flags are not assigned via `model` but directly in the definition; for the model, we can choose either singles or plurals of named fields or assemblies (i.e., a binary choice between cardinality constraints to be applied). This gives us four choices; additionally, we have the opportunity to use an element `prose`, once inside any assembly's model.

Among these elements, no single `@named` attribute value (which refers a model component to its definition) may be used more than once. Additionally, no `@group-as` (on a `fields` or `assemblies`) may be reused or be the same as any `@named`. The `prose` element may be used only once. Finally, no value of `@named` or `@group-as` must be the same as a recognized name of an element directly within prose, namely (at present) `p`, `ul`, `ol`, and `pre`.

With these limitations, a model may be defined to contain any mix of fields and assemblies.

* `field` refers to a field definition and permits a single occurrence of the indicated field
* `field/@required='yes'` a field component is to be required in a model by any schema based on the metaschema
* `assembly` refers to an assembly definition and permits a single occurrence of the indicated assembly.
* `fields` - same as `field`, but permits the field to be repeated. In the JSON representation the multiple values are represented as any array unless `@address` is given
* `assemblies` - same as `fields`, but for assemblies. In JSON, this construct is also presented as an array unless there is an `@address`
* `prose` refers to a "region of prose", that is, a section of prose text of unspecified length. In XML, prose is represented in conventional fashion as (a sequence of) `<p>` and list elements (`<ul>` or `<ol>`) perhaps with inline markup (indicating further formatting). For consistency across metaschema applications, the permitted tagging will always be conformant to the same model for prose, managed to reflect (echo) a clean HTML subset. This specification also permits the markup vocabulary to be mapped to a text-based markdown syntax, suitable for use within JSON expressions of the same or similar data. 

## Use of @address

One problem with zero-or-more cardinality as supported by `fields` and `assemblies` is that in JSON, no suitable structure is available for the inclusion of truly arbitrary but repeatable properties or 'contents' (as to its structural type) on an object. The closest thing is an array, which can be pulled into use for this -- at the cost of not permitting a JSON property label on items in the array. In order to capture the same information as is transparently available on the XML, it is therefore necessary to 'finesse' the JSON object type: Metaschema does this by mapping each field or assembly in a zero-or-many set, to an array with the corresponding number of items. The name of the objects can thus be captured implicitly, by naming (labeling) their containing array.

This works, but there are also occasions when a much more concise mapping may also be supported -- if the data can be ensured to follow another rule, namely that data elements (string data) can be known to be uniquely-valued. In these cases there is a different option, namely to promote a flag of a particular known (and controlled) type, to a role as "address" -- which can (incidentally) serve as a label on a JSON property, thus improving both presentation, and addressability.

Accordingly, `@address` on `field` or `assemblies` indicates that their contents (components, that is each field or assembly in the series) may be addressed using the flag (attribute) of the given name. So if `address='id'`, for example, and an `id` flag is included on the field or assemply, such flag is assumed to be unique and validable as such (at least within the scope of its parent or containing structure), thus making it suitable for use as a label; consequently, in JSON, the field or assembly can be represented as a labeled property (of an object) rather than an unlabeled member of an array (of similar objects). This both reduces the data footprint and renders the data more addressable via key constructs such as identifiers.

To support this, flags used as addresses should be declared as type `ID`, providing "an extra layer of protection". On the JSON side, validating the uniqueness of these values (on same-named properties across document scope) remains TBD.



```
<define-field name="title" as="mixed"/>
```

```
<title>Water (H<sub>2</sub>0</title>
```
 
```
"title" : "Water (H~~2~~0)"
```

