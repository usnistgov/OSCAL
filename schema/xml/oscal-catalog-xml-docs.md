

## OSCAL Control Catalog Format: XML Schema

The short name (file identifier) for this schema shall be oscal-catalog. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.

The OSCAL Control Catalog format can be used to describe a collection of security controls and related sub-controls, along with a variety of control metadata. The root of the Control Catalog format is [&lt;catalog>](#catalog-catalog-element).

An XML Schema is provided for the OSCAL Catalog XML model.

### Catalog: `<catalog>` element

A collection of controls

The `<catalog>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@model-version](#model-version-model-version-attribute) (required)
* A [&lt;title>](#title-title-element) element (one)
* A [&lt;declarations>](#declarations-declarations-element) element (zero or one)
* A [&lt;references>](#references-references-element) element (zero or one)
* [&lt;section>](#section-section-element) elements (zero or more)
* A choice between 
  * [&lt;group>](#control-group-group-element) elements (zero or more)
  * [&lt;control>](#control-control-element) elements (zero or more)

Catalogs may use [&lt;section>](#section-section-element) to subdivide the textual contents of a catalog.

> A small catalog with a single control

```xml
<catalog id="simple-example" model-version="0.99">
  <title>A Miniature Catalog</title>
  <control id="single">
    <title>A Single Control</title>
  </control>
</catalog>
```


### Declarations: `<declarations>` element

Either a reference to a declarations file, or a set of declarations

The `<declarations>` element supports:

* Attribute [@href](#hypertext-reference-href-attribute) (optional)

### Section: `<section>` element

Allows the inclusion of prose content within a Catalog.

The `<section>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* Attribute [@class](#class-class-attribute) (optional)
* A [&lt;title>](#title-title-element) element (one)
* Prose contents (paragraphs and lists)
* [&lt;section>](#section-section-element) elements (zero or more)
* A [&lt;references>](#references-references-element) element (zero or one)

### Control Group: `<group>` element

A group of controls, or of groups of controls.

The `<group>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* Attribute [@class](#class-class-attribute) (optional)
* A [&lt;title>](#title-title-element) element (one)
* [&lt;param>](#parameter-param-element) elements (zero or more)
* [&lt;prop>](#property-prop-element) elements (zero or more)
* [&lt;part>](#part-part-element) elements (zero or more)
* A choice between 
  * [&lt;group>](#control-group-group-element) elements (zero or more)
  * [&lt;control>](#control-control-element) elements (zero or more)
* A [&lt;references>](#references-references-element) element (zero or one)

Catalogs can use groups to provide collections of related controls or Control Groups. A [&lt;group>](#control-group-group-element) may have its own properties, statements, parameters, and references, which are inherited by all members of that group. Unlike a [&lt;section>](#section-section-element), a [&lt;group>](#control-group-group-element) may not contain arbitrary prose directly, only inside its [&lt;part>](#part-part-element) or [&lt;control>](#control-control-element) components.

```xml
<group id="xyz">
  <title>My Group</title>
  <prop class="required">some property</prop>
  <control id="xyz1">
    <title>Control</title>
  </control>
</group>
```


### Control: `<control>` element

A structured information object representing a security or privacy control. Each security or privacy control within the Catalog is defined by a distinct control instance.

The `<control>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@class](#class-class-attribute) (optional)
* A [&lt;title>](#title-title-element) element (one)
* [&lt;param>](#parameter-param-element) elements (zero or more)
* [&lt;prop>](#property-prop-element) elements (zero or more)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;part>](#part-part-element) elements (zero or more)
* [&lt;subcontrol>](#sub-control-subcontrol-element) elements (zero or more)
* A [&lt;references>](#references-references-element) element (zero or one)

Controls may be grouped using [&lt;group>](#control-group-group-element), and controls may be partitioned using [&lt;part>](#part-part-element) or enhanced using [&lt;subcontrol>](#sub-control-subcontrol-element).

```xml
<control id="x">
  <title>Control 1</title>
</control>
```


### Sub-Control: `<subcontrol>` element

A control extension or enhancement

The `<subcontrol>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@class](#class-class-attribute) (optional)
* A [&lt;title>](#title-title-element) element (one)
* [&lt;param>](#parameter-param-element) elements (zero or more)
* [&lt;prop>](#property-prop-element) elements (zero or more)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;part>](#part-part-element) elements (zero or more)
* A [&lt;references>](#references-references-element) element (zero or one)

### Title: `<title>` element

Supports inline encoding

A title for display and navigation, exclusive of more specific properties

### Property: `<prop>` element

A value with a name, attributed to the containing control, subcontrol, part, or group.

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

The `<param>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@class](#class-class-attribute) (optional)
* Attribute [@depends-on](#depends-on-depends-on-attribute) (optional)
* A [&lt;label>](#parameter-label-label-element) element (zero or one): A short name for the parameter.The label value should be suitable for inline display in a rendered catalog.
* [&lt;desc>](#parameter-description-desc-element) elements (zero or more): A short summary of the parameter's intended use. A label is optional, but should be provided unless a [&lt;select>](#selection-select-element) (selection) is provided.
* [&lt;constraint>](#constraint-constraint-element) elements (zero or more): A rule describing the permissible parameter values.Currently, OSCAL does not standardize any formal rules language for value constraints. A [&lt;test>](#constraint-test-test-attribute) option may be used to specify a formal rule that may be automatically used if recognized by an OSCAL tool. Further development is needed to support the declaration of a rule language and value.
* [&lt;guideline>](#guideline-guideline-element) elements (zero or more): Additional recommendations for the use of the parameter, or around what values should be provided.
* A choice between 
  * A [&lt;value>](#value-constraint-value-element) element (zero or one): A recommended parameter value or set of values.A value provided in a catalog can be redefined at any higher layer of OSCAL (e.g., Profile).
  * A [&lt;select>](#selection-select-element) element (zero or one): A set of parameter value choices, that may be picked from to set the parameter value..
* [&lt;link>](#link-link-element) elements (zero or more): 

In a catalog, a parameter is typically used as a placeholder for the future assignment of a parameter value, although the OSCAL model allows for the direct assignment of a value if desired by the control author. The [&lt;value>](#value-constraint-value-element) may be optionally used to specify one or more values. If no value is provided, then it is expected that the value will be provided at the Profile or Implementation layer.

A parameter can include a variety of metadata options that support the future solicitation of one or more values. A [&lt;label>](#parameter-label-label-element) provides a textual placeholder that can be used in a tool to solicit parameter value input, or to display in catalog documentation. The [&lt;desc>](#parameter-description-desc-element) provides a short description of what the parameter is used for, which can be used in tooling to help a user understand how to use the parameter. A [&lt;constraint>](#constraint-constraint-element) can be used to provide criteria for the allowed values. A [&lt;guideline>](#guideline-guideline-element) provides a recommendation for the use of a parameter.

### Parameter label: `<label>` element

Supports inline encoding

A placeholder for a missing value, in display.

### Parameter description: `<desc>` element

Supports inline encoding

Indicates and explains the purpose and use of a parameter

The `<desc>` element supports:

* Attribute [@id](#id--identifier-id-attribute) (optional)

### Constraint: `<constraint>` element

A formal or informal expression of a constraint or test

The `<constraint>` element supports:

* Attribute [@test](#constraint-test-test-attribute) (optional)

### Guideline: `<guideline>` element

A prose statement that provides a recommendation for the use of a parameter.

The `<guideline>` element has the following contents (in order):

* Prose contents (paragraphs and lists)

### Value constraint: `<value>` element

Supports inline encoding

Indicates a permissible value for a parameter or property

In a declaration, [&lt;value>](#value-constraint-value-element) will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values).

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".

### Selection: `<select>` element

Presenting a choice among alternatives

The `<select>` element has the following contents (in order):

* Attribute [@how-many](#cardinality-how-many-attribute) (optional)
* [&lt;choice>](#choice-choice-element) elements (zero or more)

### Choice: `<choice>` element

Supports inline encoding

A value selection among several such options

### Part: `<part>` element

A partition or component of a control, subcontrol or part

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

The `<link>` element supports:

* Attribute [@href](#hypertext-reference-href-attribute) (optional)
* Attribute [@rel](#relation-rel-attribute) (optional)

Works like an HTML anchor (`a`) except this is a line-oriented (block) element.

### References: `<references>` element

 A group of reference descriptions 

The `<references>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;ref>](#reference-ref-element) elements (zero or more)

### Reference: `<ref>` element

 A reference, with one or more citations to standards, related documents, or other resources 

The `<ref>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (optional)
* [&lt;citation>](#citation-citation-element) elements (zero or more)
* Prose contents (paragraphs and lists)

### Citation: `<citation>` element

Supports inline encoding

Citation of a resource

The `<citation>` element supports:

* Attribute [@id](#id--identifier-id-attribute) (optional)
* Attribute [@href](#hypertext-reference-href-attribute) (optional)

Echoes the NISO JATS (and NISO STS) `mixed-citation` element.

```xml
<o:citation>Some <o:strong>citation</o:strong> of some sort</o:citation>
```


### ID / identifier: `@id` attribute

Unique identifier

No mechanism is proposed to ensure that [&lt;id>](#id--identifier-id-attribute) values do not collide across different catalogs. Use profiling without "merge" to detect such clashes.

```xml
<o:citation id="xyz2">Some <o:strong>citation</o:strong> of some sort</o:citation>
```


### Class: `@class` attribute

Identifies the property or object within the control; a semantic hint

Overloading this attribute with more than one value is permitted, but not recommended.

### hypertext reference: `@href` attribute

A link to a document or document fragment (actual, nominal or projected)

Note in particular that [&lt;href>](#hypertext-reference-href-attribute) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.

### Constraint test: `@test` attribute

A formal (executable) expression of a constraint

### Relation: `@rel` attribute

Purpose of the link

### Cardinality: `@how-many` attribute

When selecting, a requirement such as one or more

### Depends on: `@depends-on` attribute

Another parameter invoking this one

### Model version: `@model-version` attribute

Declares a major/minor version for this metaschema