# OSCAL Metaschema

An OSCAL Metaschema defines the the information structures that define an OSCAL model in a format-neutral form. Documentation about the meaning (semantics) and use of a given metaschema structure is provided on the Metaschema [website].

OSCAL Metaschemas are used to generate other OSCAL artifacts based on the metaschema description. These artifacts include:

- XML and JSON schemas, or *data models*, which are derived from the metaschema and expressed as XSD and JSON Schema;
- Conversion scripts that can convert OSCAL content between the XML and JSON OSCAL formats, ensuring the resulting content is schema valid;
- XML and JSON [model documentation](https://pages.nist.gov/OSCAL/docs/schemas/) for use on the [OSCAL website](https://pages.nist.gov/OSCAL).

Use of Metaschemas in OSCAL allows us to maintain seamless and consistent support for multiple OSCAL model formats, including XML and JSON. Content can also be kept up-to-date in multiple formats using generated content converters, and can be validated using generated schemas. Adding support for new formats (e.g., YAML) can accomplished by extending the Metaschema tooling to produce schemas and converters for other formats.

The Metaschema syntax (an XML application) is also described and constrained with its [own schema](https://github.com/usnistgov/metaschema/blob/main/toolchains/xslt-M4/validate/metaschema.xsd), and with a [Schematron constraints set](https://github.com/usnistgov/metaschema/blob/main/toolchains/xslt-M4/validate/metaschema-composition-check.sch). The latter is able to enforce some of the rules described below.

## Enumerated values

Additionally, flags may be constrained to a set of known values listed in advance.

This restriction can be either strict (values must be in the list for document validity) or loose (i.e., for documentation only, with no effect in schemas).

Use the `valid-values` element to restrict the permissible values for a flag. Set its attribute `allow-other='yes'` if the list is not exclusive.

Within `valid-values`, a `value` element's `@name` attribute assigns the permissible value, while its data content provides documentation. For example:

```xml
<define-flag name="algorithm" datatype="string">
    <formal-name>Hash algorithm</formal-name>
    <description>Method by which a hash is derived</description>
    <valid-values allow-other="yes">
      <value name="SHA-224"/>
      <value name="SHA-256"/>
      <value name="SHA-384"/>
      <value name="SHA-512"/>
      <value name="RIPEMD-160"/>
    </valid-values> ...
```

## Metaschema modeling

In the case of field and flag objects, the modeling constraints to be imposed by the result schemas (either XSD or JSON Schema) over the data set can be determined on the basis of how they are described. Assembly definitions, however, permit not only flags to be assigned to assemblies of the defined type; additionally, they contain a `model` element for a *model declaration*. This declaration names the subcomponents to be permitted (in documents valid to the target schemas) within any assembly of the type being defined.

Five elements are used within `model` to define permissible contents of assemblies (elements or objects) being defined. Each of these represents a different object type. Flags are not assigned via `model` but directly in the definition; for the model, we can choose either singles or plurals of named fields or assemblies (i.e., a binary choice between cardinality constraints to be applied). This gives us four choices; additionally, we have the opportunity to use an element `prose`, at most once inside any assembly's model.

Among these elements, no single `@named` attribute value (which refers a model component to its definition) may be used more than once. Additionally, no `@group-as` (on a `fields` or `assemblies`) may be reused or be the same as any `@named`. The `prose` element may be used at most once. Finally, no value of `@named` or `@group-as` must be the same as a recognized name of an element directly within prose, namely (at present) `p`, `ul`, `ol`, and `pre`.

With these limitations, a model may be defined to contain any mix of fields and assemblies.

- `field` refers to a field definition and permits a single occurrence of the indicated field
- `field/@required='yes'` a field component is to be required in a model by any schema based on the metaschema
- `assembly` refers to an assembly definition and permits a single occurrence of the indicated assembly.
- `fields` - same as `field`, but permits the field to be repeated. In the JSON representation, the multiple values are represented as any array unless `@address` is given
- `assemblies` - same as `fields`, but for assemblies. In JSON, this construct is also presented as an array unless there is an `@address`
- `prose` refers to a "region of prose", that is, a section of prose text of unspecified length. In XML, prose is represented in conventional fashion as (a sequence of) `<p>` and list elements (`<ul>` or `<ol>`) perhaps with inline markup (indicating further formatting). For consistency across metaschema applications, the permitted tagging will always be conformant to the same model for prose, managed to reflect (echo) a clean HTML subset. This specification also permits the markup vocabulary to be mapped to a text-based markdown syntax, suitable for use within JSON expressions of the same or similar data.

## JSON Enhancement features

### Use of `key`

One problem with zero-or-more cardinality as supported by `fields` and `assemblies` is that in JSON, no suitable structure is available for the inclusion of truly arbitrary but repeatable properties or 'contents' (as to its structural type) on an object. The closest thing is an array, which can be pulled into use for this -- at the cost of not permitting a JSON property label on items in the array. In order to capture the same information as is transparently available on the XML, it is therefore necessary to 'finesse' the JSON object type: Metaschema does this by mapping each field or assembly in a zero-or-many set, to an array with the corresponding number of items. The name of the objects can thus be captured implicitly, by naming (labeling) their containing array.

This works, but there are also occasions when a much more concise mapping may also be supported -- if the data can be ensured to follow another rule, namely that data elements (string data) can be known to be uniquely-valued. In these cases there is a different option, namely to promote a flag of a particular known (and controlled) type, to a role as "address" -- which can (incidentally) serve as a label on a JSON property, thus improving both presentation, and addressability.

Accordingly, `@address` on `field` or `assemblies` indicates that their contents (components, that is each field or assembly in the series) may be addressed using the flag (attribute) of the given name. So if `address='id'`, for example, and an `id` flag is included on the field or assembly, such flag is assumed to be unique and valid as such (at least within the scope of its parent or containing structure), thus making it suitable for use as a label; consequently, in JSON, the field or assembly can be represented as a labeled property (of an object) rather than an unlabeled member of an array (of similar objects). This both reduces the data footprint and renders the data more addressable via key constructs such as identifiers.

To support this, flags used as addresses should be declared as type `ID`, providing "an extra layer of protection". On the JSON side, validating the uniqueness of these values (on same-named properties across document scope) remains TBD.

```xml
<define-field name="title" as="mixed"/>
```

```xml
<title>Water (H<sub>2</sub>0)</title>
```

```xml
"title" : "Water (H~~2~~0)"
```
