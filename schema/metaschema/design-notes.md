# Metaschema Design Notes

## Goals

* Unify support for compatible data descriptions in multiple disparate formats, such as XML, JSON, YAML and potentially others
* Produce schema documentation from the same source as schema files and tools (literate programming)
* Enable distributed, semi-coordinated experimentation with OSCAL format(s) and their tools

A *primary* goal is supporting the maintenance of OSCAL format(s) and data description by the OSCAL team.

A *secondary* goal is to enable the wider community to build and extend by using the metaschema tech on their own (OSCAL or non-OSCAL) data description problems.


## Approach

A miniature schema language with certain especially-enforced constraints can be sketched such that schemas in otherwise incompatible formats, such as XML and JSON, can be produced from a metaschema instance (a document written in Metaschema) deterministically, and thus coordinated in parallel. We begin by producing functioning schemas in XML Schema Definition Language (XSD) 1.1 on the XML side and JSON Schema v7 on the JSON side. As we do this, the constraints imposed by using the metaschema modeling syntax enable us to do two things implicitly (that is, without any extra effort):

* Limit ourselves to schema constructs that map cleanly into features offered by both schemas, thus ensuring that all information can be preserved in (lossless bidirectional) conversion.
   
* Mediate between "structural imbalances" between the data formats by providing the extra information we need to introduce improvements to model and syntax on both sides.

In addition to running code (in the form of transformations to convert metaschema data into various outputs for further work), metaschema are documented here and tested by means of unit tests for the transformations concerned. Look for `xspec` directories in the (../../build/metaschema)[../../build/metaschema] and (../../lib/convert)[../../lib/convert] directories and their subdirectories.

Because the metaschema is designed to support only a "greatest common factor" of schema features -- a minimal but useful and adequate subset of the wide range of modeling capabilities in either of its target languages (and ideally, other future targets) -- its modeling capabilities are rudimentary. This may also make it easier to use.

## Metaschema organization

A metaschema has two parts: a header, and a set of definitions for the model components or parts.

Top level documentation for the metaschema and its schemas apperas in the header section, while documentation for all the constructs appears with the definitions for those constructs. There is no explicit separation between the header and the definitions: the header ends when the definitions start.

### `METASCHEMA` element


### Metaschema header

#### schema-title

#### short-name

#### remarks

### Metascheam definitions

Three kinds of definitions:

#### Fields

Fields can be thought of as simple text values, either scalars or sequences of scalars, or when appropriate, of "rich text", i.e. text permitting inline formatting. Depending on modeling requirements, fields may also be used for even simpler bits of data, such as objects that carry specialized flags but have no values or structures otherwise.

This means that fields can be more or less complex, depending on the need. This distinction is made by qualifying the `field` with an `@as` attribute, as follows:


| `@as` value |  |
|-------------|--|
|string  | Plain (unformatted) text |
|[not given]  | Plain (unformatted) text (same as `string`) |
|boolean | The field may be only 'true' or 'false'. In XML this will be signaled not by any string value but by the presence ("true") or absence ("false") of the element. In JSON an explicit Boolean value is assigned to a property. |
| mixed | Supports rich text: in XML, inline markup (same as in "prose"). In JSON, inline OSCAL markdown |
| empty | In XML, the element will be empty (though it can have attributes for any flags). In JSON, no property will be given for any text value. |

In addition to these settings, fields may be defined with flags. Do this by including `flag` elements directly in the definition.

#### Assemblies

An assembly is just like a field, except it contains structured content (objects or elements), not text or unstructured "rich text". The contents permitted in a particular (type of) assembly are indicated in its `model` element. An `@as` attribute is not necessary (or permitted) on an assembly definition.

#### Flags

### Metaschema modeling

In the case of field and flag objects, the modeling constraints to be imposed by the result schemas (either XSD or JSON Schema) over the data set, can be determined on the basis of how they are described. Assembly definitions, however, permit not only flags to be assigned to assemblies of the defined type; additionally, they contain a `model` element for a *mode declaration*. This declaration names the subcomponents to be permitted (in documents valid to the target schemas) within any assembly of the type being defined.

Five elements are used within `model` to define permissible contents of assemblies (elements or objects) being defined.

Among these elements, no single `@named` attribute value (which refers a model component to its definition) may be used more than once. Additionally, no `@group-as` (on a `fields` or `assemblies`) may be reused or be the same as any `@named`. Finally, the `prose` element may be used only once.

With these limitations, a model may be defined to contain any mix of fields and assemblies, as long as they are kept in sequence.

* `field` refers to a field definition and permits a single occurrence of the indicated field
* `field/@required='yes'` a field component is to be required in a model by any schema based on the metaschema
* `assembly` refers to an assembly definition and permits a single occurrence of the indicated assembly.
* `fields` - same as `field`, but permits the field to be repeated. In the JSON representation the multiple values are represented as any array unless `@address` is given
* `assemblies` - same as `fields`, but for assemblies.permits the field to be repeated. Also presented as an array unless there is an `@address`
* `@address` on `field` and `assemblies` indicates that their contents (components) may be addressed using the flag (attribute) of the given name. So if `address='id'`, for example, and an `id` flag is included on the field or assemply, such flag is assumed to be unique and validable as such (at least within the scope of its parent), thus making it a suitable label; consequently the field or assembly in question can be represented as a labelled property (of an object) rather than an unlabelled member of an array (of similar objects).
* `prose` refers to a "region of prose", that is, a section of prose text of unspecified length. In XML, prose is represented in conventional fashion as (a sequence of) `<p>` and list elements (`<ul>` or `<ol>`) perhaps with inline markup (indicating further formatting). For consistency across metaschema applications, the permitted tagging will always be conformant to the same model for prose, managed to reflect (echo) a clean HTML subset. This specification also permits the markup vocabulary to be mapped to a text-based markdown syntax, suitable for use within JSON expressions of the same or similar data.




