

### Title: `<title>` element

Supports inline encoding

A title for display and navigation, exclusive of more specific properties

Note: definition adopted from oscal-catalog-metaschema.xml

### Property: `<prop>` element

A value with a name, attributed to the containing control, subcontrol, part, or group.

Note: definition adopted from oscal-catalog-metaschema.xml

The `<prop>` element supports:

* Attribute [@id](#id--identifier-id-attribute) (optional)
* Attribute [@class](#class-class-attribute) (required)

Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls, parts, and extensions), for any purpose useful to an application or implementation of those controls. Typically, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

The value of a property is a simple scalar value or list of values.

The lexical composition of properties may be constrained by declarations including matching to regular expressions or by declaring a known datatype.

Because properties are often used as selectors or identifiers for OSCAL operations, their values can be expected frequently to be normalized (e.g., with respect to whitespace) in use; however, this is application defined.

For singletons (that is, the only element among siblings with its [&lt;class>](#class-class-attribute)), properties are especially useful as proxies (unique identifiers) for their controls, such that controls may be returned one for one on queries for properties (name and value). The robustness of such queries can be ensured by appropriate property declarations (as singletons and as identifiers); cf `declare-prop` in the declarations model (which also supports other constraints over property values).

```xml
<o:prop class="name">A1</o:prop>
```


### Parameter: `<param>` element

Parameters provide a mechanism for the dynamic assignment of value(s) in a control.

Note: definition adopted from oscal-catalog-metaschema.xml

The `<param>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@class](#class-class-attribute) (optional)
* Attribute [@depends-on](#depends-on-depends-on-attribute) (optional)
* A [&lt;label>](#parameter-label-label-element) element (zero or one): A short name for the parameter.The label value should be suitable for inline display in a rendered catalog.
* [&lt;desc>](#parameter-description-desc-element) elements (zero or more): A short summary of the parameter's intended use. A label is optional, but should be provided unless a [&lt;select>](#selection-select-element) (selection) is provided.
* [&lt;constraint>](#constraint-constraint-element) elements (zero or more): A rule describing the permissible parameter values.Currently, OSCAL does not standardize any formal rules language for value constraints. A [&lt;test>](#) option may be used to specify a formal rule that may be automatically used if recognized by an OSCAL tool. Further development is needed to support the declaration of a rule language and value.
* [&lt;guideline>](#) elements (zero or more): Additional recommendations for the use of the parameter, or around what values should be provided.
* A choice between 
  * A [&lt;value>](#value-constraint-value-element) element (zero or one): A recommended parameter value or set of values.A value provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).
  * A [&lt;select>](#selection-select-element) element (zero or one): A set of parameter value choices, that may be picked from to set the parameter value..
* [&lt;link>](#link-link-element) elements (zero or more): 

In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The [&lt;value>](#value-constraint-value-element) may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer.

A parameter can include a variety of metadata options that support the future solicitation of one or more values. A [&lt;label>](#parameter-label-label-element) provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The [&lt;desc>](#parameter-description-desc-element) provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A [&lt;constraint>](#constraint-constraint-element) can be used to provide criteria for the allowed values. A [&lt;guideline>](#) provides a recommendation for the use of a parameter.

### Parameter label: `<label>` element

Supports inline encoding

A placeholder for a missing value, in display.

Note: definition adopted from oscal-catalog-metaschema.xml

### Parameter description: `<desc>` element

Supports inline encoding

Indicates and explains the purpose and use of a parameter

Note: definition adopted from oscal-catalog-metaschema.xml

The `<desc>` element supports:

* Attribute [@id](#id--identifier-id-attribute) (optional)

### Constraint: `<constraint>` element

A formal or informal expression of a constraint or test

Note: definition adopted from oscal-catalog-metaschema.xml

The `<constraint>` element supports:

* Attribute [@test](#) (optional)

### Value constraint: `<value>` element

Supports inline encoding

Indicates a permissible value for a parameter or property

Note: definition adopted from oscal-catalog-metaschema.xml

In a declaration, [&lt;value>](#value-constraint-value-element) will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values).

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".

### Selection: `<select>` element

Presenting a choice among alternatives

Note: definition adopted from oscal-catalog-metaschema.xml

The `<select>` element has the following contents (in order):

* Attribute [@how-many](#) (optional)
* [&lt;choice>](#) elements (zero or more)

### Part: `<part>` element

A partition or component of a control, subcontrol or part

Note: definition adopted from oscal-catalog-metaschema.xml

The `<part>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* Attribute [@class](#class-class-attribute) (optional)
* A [&lt;title>](#title-title-element) element (zero or one)
* [&lt;prop>](#property-prop-element) elements (zero or more)
* Prose contents (paragraphs and lists)
* [&lt;part>](#part-part-element) elements (zero or more)
* [&lt;link>](#link-link-element) elements (zero or more)

Like properties ([&lt;prop>](#property-prop-element)) and parameters ([&lt;param>](#parameter-param-element)), parts can be distinguished from other elements within their controls by their assigned [&lt;class>](#class-class-attribute), such that they may be subjected to "declarations logic" using these values as bindings (and thereby getting open-ended extensibility).

An assigned class may frequently provide for a header in display, such that [&lt;part>](#part-part-element)`[@class='objectives']` is displayed under a header *Objectives*, etc. Parts may also however have their own titles ([&lt;title>](#title-title-element) elements).

Many parts are logical partitions or sections for prose. Other parts may be more formally constructed out of properties ([&lt;prop>](#property-prop-element) elements) and/or their own parts. Such structured objects may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements").

### Link: `<link>` element

Supports inline encoding

 A line or paragraph with a hypertext link 

Note: definition adopted from oscal-catalog-metaschema.xml

The `<link>` element supports:

* Attribute [@href](#) (optional)
* Attribute [@rel](#) (optional)

Works like an HTML anchor (`a`) except this is a line-oriented (block) element.

### References: `<references>` element

 A group of reference descriptions 

Note: definition adopted from oscal-catalog-metaschema.xml

The `<references>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;ref>](#) elements (zero or more)

### ID / identifier: `@id` attribute

Note: definition adopted from oscal-catalog-metaschema.xml

Unique identifier

No mechanism is proposed to ensure that [&lt;id>](#id--identifier-id-attribute) values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.

```xml
<o:citation id="xyz2">Some <o:strong>citation</o:strong> of some sort</o:citation>
```


### Class: `@class` attribute

Note: definition adopted from oscal-catalog-metaschema.xml

Identifies the property or object within the control; a semantic hint

Overloading this attribute with more than one value is permitted, but not recommended.

### Depends on: `@depends-on` attribute

Note: definition adopted from oscal-catalog-metaschema.xml

Another parameter invoking this one