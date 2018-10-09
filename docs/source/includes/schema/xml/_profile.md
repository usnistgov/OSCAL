

## OSCAL Profile Metaschema: XML Schema

The short name (file identifier) for this schema shall be oscal-profile. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.

A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost element in the OSCAL profile XML schema is [&lt;profile>](#profile-profile-element).

### Profile: `<profile>` element

Each OSCAL profile is defined by a Profile element

The `<profile>` element has the following contents (in order):

* [&lt;import>](#import-resource-import-element) elements (zero or more)
* A [&lt;merge>](#merge-controls-merge-element) element (zero or one)
* A [&lt;modify>](#modify-controls-modify-element) element (zero or one)

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([&lt;import>](#import-resource-import-element)), merged or (re)structured ([&lt;merge>](#merge-controls-merge-element)), and emended ([&lt;modify>](#modify-controls-modify-element)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.

### Import resource: `<import>` element

An Import element designates a catalog, profile, or other resource to be included (referenced and potentially modified) by this profile.

The `<import>` element has the following contents (in order):

* Attribute [@href](#hypertext-reference-href-attribute) (required)
* An [&lt;include>](#include-controls-include-element) element (zero or one)
* An [&lt;exclude>](#exclude-controls-exclude-element) element (zero or one)

An [&lt;import>](#import-resource-import-element) indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports (with possible settings.

The contents of the [&lt;import>](#import-resource-import-element) element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [&lt;include>](#include-controls-include-element) element) or de-selected (using an [&lt;exclude>](#exclude-controls-exclude-element) element) from the source catalog or profile.

When no [&lt;include>](#include-controls-include-element) is given (whether an [&lt;exclude>](#exclude-controls-exclude-element) is given or not), an [&lt;include>](#include-controls-include-element)/[&lt;all>](#include-all-all-element) is assumed (that is, all controls will be included by default).

```xml
<import href="catalog.xml">
  <include>
    <call control-id="ac-1">
    </call>
  </include>
</import>
```


### Merge controls: `<merge>` element

A Merge element merges controls in resolution.

The `<merge>` element has the following contents (in order):

* A [&lt;combine>](#combination-rule-combine-element) element (zero or one)
* A choice between 
  * An [&lt;as-is>](#as-is-as-is-element) element (zero or one)
  * A [&lt;custom>](#custom-grouping-custom-element) element (zero or one)

The contents of the [&lt;merge>](#merge-controls-merge-element) element may be used to "reorder" or "restructure" controls by indicating an order and/or structure in resolution.

Implicitly, a [&lt;merge>](#merge-controls-merge-element) element is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a [&lt;merge>](#merge-controls-merge-element) element, will not be merged into (will be dropped) in the resulting resolution.

### Combination rule: `<combine>` element

A Combine element defines whether and how to combine multiple (competing) versions of the same control

The `<combine>` element supports:

* Attribute [@method](#combination-method-method-attribute) (optional)

Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol). 

This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be useful for defining what to do when it occurs.

### As is: `<as-is>` element

True whenever given (presence signifies Boolean value)

An As-is element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

### Combination method: `@method` attribute

How clashing controls and subcontrols should be handled

### Custom grouping: `<custom>` element

A Custom element frames a structure for embedding represented controls in resolution.

The `<custom>` element has the following contents :

* A choice between 
  * [&lt;group>](#control-group-group-element) elements (zero or more)
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more)
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)

The [&lt;custom>](#custom-grouping-custom-element) element represents a custom arrangement or organization of controls in the resolution of a catalog. 

While the [&lt;as-is>](#as-is-as-is-element) element provides for a restitution of a control set's organization (in one or more source catalogs), this element permits the definition of an entirely different structure.

### Control group: `<group>` element

As in catalogs, a group of (selected) controls or of groups of controls

The `<group>` element has the following contents :

* A choice between 
  * [&lt;group>](#control-group-group-element) elements (zero or more)
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more)
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)

### Modify controls: `<modify>` element

Set parameters or amend controls in resolution

The `<modify>` element has the following contents (in order):

* [&lt;set-param>](#parameter-setting-set-param-element) elements (zero or more)
* [&lt;alter>](#alteration-alter-element) elements (zero or more)

### Include controls: `<include>` element

Specifies which controls and subcontrols to include from the resource (source catalog) being imported

The `<include>` element has the following contents :

* A choice between 
  * An [&lt;all>](#include-all-all-element) element (zero or one)
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more)
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)

To be schema-valid, this element must contain either (but not both) a single [&lt;all>](#include-all-all-element) element, or a sequence of [&lt;call>](#call-control-or-subcontrol-call-element) elements.

If this element is not given, it is assumed to be present with contents [&lt;all>](#include-all-all-element) (qv); i.e., all controls are included by default, unless the [&lt;include>](#include-controls-include-element) instruction calls controls specifically.

### Include all: `<all>` element

Include all controls from the imported resource (catalog)

The `<all>` element supports:

* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (optional)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [&lt;include>](#include-controls-include-element) element is given in an [&lt;import>](#import-resource-import-element); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'` 

### Call (control or subcontrol): `<call>` element

Call a control or subcontrol by its ID

The `<call>` element supports:

* Attribute [@control-id](#control-id-control-id-attribute) (optional)
* Attribute [@subcontrol-id](#control-id-subcontrol-id-attribute) (optional)
* Attribute [@with-control](#include-control-with-subcontrol-with-control-attribute) (optional)
* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (optional)

Inside [&lt;include>](#include-controls-include-element), If `@control-id` is used (to indicate the control being referenced), `@subcontrol-id` cannot be used, and vice versa. (A single [&lt;call>](#call-control-or-subcontrol-call-element) element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id` not with `@subcontrol-id`.

If `@with-subcontrols` is "yes" on the call to a control, no sibling [&lt;call>](#call-control-or-subcontrol-call-element)elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

### Match controls and subcontrols by identifier: `<match>` element

Select controls by (regular expression) match on ID

The `<match>` element supports:

* Attribute [@pattern](#pattern-pattern-attribute) (optional)
* Attribute [@order](#pattern-order-attribute) (optional)
* Attribute [@with-control](#include-control-with-subcontrol-with-control-attribute) (optional)
* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (optional)

### Exclude controls: `<exclude>` element

Which controls and subcontrols to exclude from the resource (source catalog) being imported

The `<exclude>` element has the following contents :

* A choice between 
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more)
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)

Within [&lt;exclude>](#exclude-controls-exclude-element), [&lt;all>](#include-all-all-element) is not an option since it makes no sense. However, it also makes no sense to use exclude/call except with include/all; you would not want to include and exclude something by ID simultaneously. If this happens, an error condition will be reported.

### Parameter Setting: `<set-param>` element

 A parameter setting, to be propagated to points of insertion 

The `<set-param>` element has the following contents (in order):

* Attribute [@id](#id--identifier-id-attribute) (required)
* Attribute [@class](#class-class-attribute) (optional)
* Attribute [@depends-on](#depends-on-depends-on-attribute) (optional)
* A [&lt;label>](#parameter-label-label-element) element (zero or one)
* [&lt;desc>](#parameter-description-desc-element) elements (zero or more)
* [&lt;constraint>](#constraint-constraint-element) elements (zero or more)
* A choice between 
  * A [&lt;value>](#value-constraint-value-element) element (zero or one)
  * A [&lt;select>](#selection-select-element) element (zero or one)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;part>](#part-part-element) elements (zero or more)

### Alteration: `<alter>` element

An Alter element specifies changes to be made to an included control or subcontrol when a profile is resolved.

The `<alter>` element has the following contents (in order):

* Attribute [@control-id](#control-id-control-id-attribute) (optional)
* Attribute [@subcontrol-id](#control-id-subcontrol-id-attribute) (optional)
* [&lt;remove>](#removal-remove-element) elements (zero or more)
* [&lt;add>](#addition-add-element) elements (zero or more)

Use `@control-id` or `@subcontrol-id` to indicate the scope of alteration.

It is an error for two [&lt;alter>](#alteration-alter-element) elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this element to match multiple control IDs could provide for this.

### Removal: `<remove>` element

Specifies elements to be removed from a control or subcontrol, in resolution

The `<remove>` element supports:

* Attribute [@class-ref](#references-by-class-class-ref-attribute) (optional)
* Attribute [@id-ref](#references-by-id-id-ref-attribute) (optional)
* Attribute [@item-name](#references-by-name-item-name-attribute) (optional)

Use `@class-ref`, `@id-ref` or `@item-name` to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [&lt;alter>](#alteration-alter-element) element.

To change an element, use [&lt;remove>](#removal-remove-element) to remove the element, then [&lt;add>](#addition-add-element) to add it back again with changes.

### Addition: `<add>` element

Specifies contents to be added into controls or subcontrols, in resolution

The `<add>` element has the following contents (in order):

* Attribute [@position](#position-position-attribute) (optional)
* A [&lt;title>](#title-title-element) element (one)
* [&lt;param>](#parameter-param-element) elements (zero or more)
* [&lt;prop>](#property-prop-element) elements (zero or more)
* [&lt;link>](#link-link-element) elements (zero or more)
* [&lt;part>](#part-part-element) elements (zero or more)
* A [&lt;references>](#references-references-element) element (zero or one)

### Control ID: `@control-id` attribute

Value of the 'id' flag on a target control

### Include control with subcontrol: `@with-control` attribute

Whether a control should be implicitly included, if not called.

### Include subcontrols with control: `@with-subcontrols` attribute

Whether subcontrols should be implicitly included, if not called.

### Control ID: `@subcontrol-id` attribute

Value of the 'id' flag on a target subcontrol

### Pattern: `@pattern` attribute

A regular expression matching the IDs of one or more controls or subcontrols to be selected

### Pattern: `@order` attribute

A regular expression matching the IDs of one or more controls or subcontrols to be selected

### Position: `@position` attribute

Where to add the new content with respect to the targeted element (beside it or inside it)

### References by class: `@class-ref` attribute

Items to remove, by class

### References by ID: `@id-ref` attribute

Items to remove, by ID

### References by name: `@item-name` attribute

Items to remove, by item type (name), e.g. title or prop

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

* Attribute [@href](#hypertext-reference-href-attribute) (optional)
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

### hypertext reference: `@href` attribute

Note: definition adopted from oscal-catalog-metaschema.xml

A link to a document or document fragment (actual, nominal or projected)

Note in particular that [&lt;href>](#hypertext-reference-href-attribute) targets include elements (locations) in representations of documents that exist only by virtue of dynamic application, such as (for example) the results of profile resolution.

### Depends on: `@depends-on` attribute

Note: definition adopted from oscal-catalog-metaschema.xml

Another parameter invoking this one