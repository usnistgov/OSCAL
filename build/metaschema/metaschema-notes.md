# Metaschema Design and Terminology

OSCAL Metaschema is a descriptive format for the specification and support of OSCAL tagging. A metaschema is used as the basis for producing schema files, conversion files, documentation and utilities in support of that format. For any given OSCAL format defined by a metaschema (such as **catalog** or **profile**), the XML Schema (XSD) and JSON Schema will be consistent because they are produced from the same source.

However, the terminology used to describe data in either format will be different depending on whether XML or JSON is used. (As a notation for an object-oriented model, YAML will be similar to JSON.) While both data formats describe tree structures (directed graphs), each format (with its implicit data model) has its peculiar design, which requires specification in detail. A data point represented as an attribute on an element in XML, for example, might be a string property on a data object in JSON. The metaschema moderates this distinction by providing rules regarding its own semantic constructs and how they are to be represented in the target notation. Accordingly, a mapping between JSON and XML conceptual descriptions for any OSCAL format is possible, given the metaschema.

## Terminological mapping

Within OSCAL models, all constructs are optional unless marked otherwise.

| OSCAL Metaschema | XML | JSON \| YAML |
|------------------|-----|------|
| Assembly | An element with element content |  An object, either a property or a member of an array property |
| Field (with no flags) | A single element with text content | String property |
| Field with one or more flags | An element with text content, flags as attributes |   An object property with a designated property for its nominal string value as well as properties for its flags |
| Flag | Attribute | String property |
| Flag with designated data type | Attribute with lexical constraints per type | String property with lexical constraints per type, or typed property such as `number` or URI (per type) | 
| Field `as-type='simple-markup'`, no flags permitted | An element permitting mixed content inline | String property or map with string property, parseable as markdown (line only) |
| Field `as='complex-markup'`, flag(s) permitted | idem | Object property with `RICHTEXT` String property or object with string property, parseable as markdown (full blocks) |


## Constraints imposed on the Metaschema

A metaschema file must be valid to its own schema and to the Metaschema Schematron (qv).
