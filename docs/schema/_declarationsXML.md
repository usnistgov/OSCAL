

## Declarations elements

By declaring constraints on information associated with controls such as their properties (`prop`), parts (`part`) and links (`link`), applications and operators can validate the composition and consistency of available controls. Over and above the "core validation" of OSCAL element naming (which is enforced by direct application of an XML schema), such validation can help to guarantee processability and interchange of OSCAL data by verifying that not only tags, but also values given in the data, conform to expressed constraints, which can be made specific to a catalog or catalog type.

In this way, the OSCAL declarations mechanism provides for a kind of "on the fly supertyping" of control objects, by restriction (constraint) of the core OSCAL language. The extent and degree to which declarations are used to impose order on controls is up to the application and its methods. By no means are declarations necessary; but they serve as an aid in modeling and in communicating expectations.

OSCAL declarations are enforced by a Schematron; the core schema stipulates this model (and tagging used to control it, i.e. a tag interface) but does not enforce any of the constraints so declared. Developers should take note that these constraints are all readily testable in XPath.

### `<declarations>` element | Declarations 

For extra-schema validation of data given within controls or framework components

The OSCAL validation model supports not only validation against a formal schema (describing elements, attributes, and their permitted contents, described generally and generically), but also against a set of declarations provided specifically for the catalog or catalog type within which controls appear. Constraints described in these declarations, and bound via assignments of `@class` (for information within controls or components) and [@context](#context-attribute--declaration-context) (indicating control, subcontrol, component or part wherein the given object may appear), enable automated checking for consistency of controls, subcontrols, components and their parts, specific to the types or kinds of control items that appear within a particular catalog or framework.

* complexContent
* extension base:oscal:decls
* attribute `@href` (optional)

### `<declare-prop>` element | Property declaration 

Constraints applicable to a class or classes of `prop` elements (properties) in context

The class of properties, in context, to which the constraints apply, is indicated on the `@class` of the declaration (`<declare-prop>`). Only elements named `prop` with matching `@class` are subject to the declared constraints. The context is defined by the class of the element parent of the candidate property, whether it is a `control`, `subcontrol`, `part` or `group`. So a `declare-prop context="myControl" class="myProp"` will apply to any property (`prop` element) with class "myProp", appearing in a control, subcontrol, part or group with class "myControl".

The constraints that will apply to these properties are indicated by the elements contained in the declaration. For example, a property declared as a "required singleton" is required to appear in its context (the validator will produce an error when it is missing), while it may not appear more than once (the validator will produce an error if more than one appear together).

Because the `@class` attribute is the basis of the OSCAL declarations model, it is recommended that applications restrict the usage of this attribute to single name values, when used on controls or their compo. Although overloading `@class`, as it is frequently overloaded in HTML, is not forbidden in OSCAL and may even work in an OSCAL application, restricting elements to have *at most*, a single class assignment, will help keep things clean and intelligible.

On declarations including `<declare-prop>` and its siblings, however, both `@class` and [@context](#context-attribute--declaration-context) may be overloaded (multiple values). A helpful application will detect where there are conflicting declarations, meaning the same class designator is claimed by different elements in a given context.

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* element [&lt;identifier>](#identifier-element--identifier-constraint) (optional)
* as needed (at least one):
  * element [&lt;regex>](#regex-element--regular-expression-constraint)
  * element [&lt;calc>](#calc-element--calculated-value-constraint)
  * element [&lt;value>](#value-element--value-constraint)
* attribute `@class` (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-p>` element | Paragraph declaration 

Indicates constraints to be enforced on paragraphs in context

Elements contained in the declaration, as with all declarations, indicate constraints. The `p` may be required for the control to be complete, and/or the only one with its `@class` (a singleton). The value(s) may be restricted, etc.

Effectively, the difference between a "property"`prop` and "classified p"`p[@class]` is that properties may have only simple scalar values, not subject to dynamic processing or injection. So `p` elements directly inside a `control`, `subcontrol` or `part` may contain `insert` elements, for example (just as can `p` elements in running prose), whereas parameters cannot be injected into properties by definition (since they are required to be stable per control object).

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute `@class` (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-part>` element | Part declaration 

Indicates constraints to be imposed on parts in context

Parts are subject to singleton and requirement constraints, but not to constraints on values. However, note that parts may also serve as contexts for other control objects, including properties and parts.

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute `@class` (required)
* attribute [@context](#context-attribute--declaration-context) (required)

### `<declare-link>` element | Link declaration 

Indicates constraints to be imposed on links in context

* element [&lt;singleton>](#singleton-element--singleton-constraint) (optional)
* element [&lt;required>](#required-element--requirement-constraint) (optional)
* attribute `@rel` (optional)
* attribute [@context](#context-attribute--declaration-context) (required)

### `@context` attribute | Declaration context 

Identifies the type (marked class) of `control`, `subcontrol`, `group` or `part` which a declared control item (such as a `part`, `prop` or `link`) is expected to appear.
* Required on 

### `<singleton>` element | Singleton constraint 

The declared component may occur only once in its context

When this element is present in the declaration of a data object in OSCAL (such as a `prop`, `link`, or `part`) must be the only object of that class given in its (`group`, `control`, `subcontrol`, `component` or `part`) context. In other words, no other element child of the same parent may have the same `@class` value.

Note that the singleton constraint does not apply to the value of the property, but only to the fact that it is an "only child", unique among its siblings for having its class assignment.

This element is empty

### `<required>` element | Requirement constraint 

The declared component is required in its context

When this element is present in the declaration of an OSCAL object, the object (`prop`, `link`, or `part` element, of the given class) is required to appear, at least once, in its context.

A property or part that is a required singleton, is expected to appear exactly once and once only in every applicable control, subcontrol or part.

Whenever a control or control object is required to have any parts (or properties etc.), and any of the required parts are missing, errors may be reported against the declarations model.

This element is empty

### `<identifier>` element | Identifier constraint 

The declared component has a value unique within the document, among properties (`prop`) with the same class

This constraint is generally only used for properties to be used as identifiers for their control object (control, subcontrol, or part). Guaranteeing their uniqueness means that these values can be used to effect one-to-one retrieval or reference to the objects to which they are assigned (even when IDs are unknown or undefined).

Note that a property marked as an identifier, may or may not be (also declared as) a singleton. In any case the value of *each* property of the given class must be unique. So if a control has several "name" properties, "name" being declared as an identifier, then each of the name properties in that control must be unique: "George""John" and "Ringo" not "George", "George" and "George".

This element is empty

### `<regex>` element | Regular expression constraint 

Indicates that the value of a property (`prop`) or parameter (`param`) must match the given regular expression

Matching against a regular expression is conducted on the normalized lexical value of the given parameter or property: that is, with leading and trailing whitespace stripped, interim whitespace (spaces, tabs, and line feeds) normalized to single spaces, and inline markup stripped.

When more than one `<regex>` is given in a declaration, a match on any of them is taken to satisfy the requirement.

Contains text

### `<value>` element | Value constraint 

Indicates a permissible value for a parameter or property

In a declaration, `<value>` will commonly be given in groups, indicating a set of enumerated permissible values (i.e., for an element to be valid to a value constraint, it must equal one of the given values).

In a parameter, a value represents a value assignment to the parameter, overriding any value given at the point of insertion. When parameters are provided in OSCAL profiles, their values will override any values assigned "lower down the stack".

Contains text

### `<calc>` element | Calculated value constraint 

Indicates a permissible value for a parameter or property, calculated dynamically

Similar to [&lt;value>](#value-element--value-constraint) except that its contents are expanded to produce the permitted value, instead of being given as a literal.

* text content, possibly mixed with 
  * element [&lt;inherit>](#inherit-element--inherited-value)
  * element [&lt;autonum>](#autonum-element--autonumbered-generated-value)
  * attribute `@` (optional)

### `<autonum>` element | Autonumbered (generated) value 

Generates a formatted numeric value based on the position of a control object among its siblings, the text contents providing a template for the numbering format (arabic, alphabetic, roman, etc.)

The text contents of `<autonum>` (not the value of any attribute) will be taken by the processor to be a formatting code. The format should follow the spec for XSLT `xsl:number/@format`. For example, if the value is "A.", then numbering will appear in the sequence A., B., C., etc (as punctuated). Recognized formats include upper- and lower-case alphabetic numbering, arabic numbering, and upper- and lower-case roman numbering as described for XSLT.

Contains text

### `<inherit>` element | Inherited value 

Indicates that a value or text within a value should be inherited from a property on a containing control object

`<inherit>` is typically used to enforce hierarchical numbering within control objects. When given in a [&lt;value>](#value-element--value-constraint) in a declaration, `<inherit>` indicates that the value of a property, or a segment of its value, must be the same as a property (`prop`) higher in the containment hierarchy of a control object. That is, if a property with `@class='number'` is constrained with `value/inherit`, it must be the same as is assigned on the closest ancestor (`part`, `subcontrol`, `control`, or `group`) with the given property.

Usually, `<inherit>` is used in conjunction with [&lt;autonum>](#autonum-element--autonumbered-generated-value). Using the two elements in combination, for example, the number (property) assigned to a subcontrol appearing inside a control numbered "A1" may be constrained to be "A1-a", "A1-b", etc., depending on the position of the subcontrol within the control.

If a value must inherit from a property of a different class from the containing control object, `inherit/@from` can be used to indicate the applicable property (by its class). By default, `<inherit>` indicates a property value should match an ancestor's property with the same `@class` (the most usual case).

* attribute [@from](#from-attribute--alternative-property-class-from-which-to-inherit) (optional)

### `@from` attribute | Alternative property (class) from which to inherit 

When used, this element indicates a class for a property value to be considered for inheritance.

If this attribute is ommitted, the target class is considered the same as the calling (inheriting) property. Sometimes, however, a property may wish to inherit a value from a property with a different class assignment (i.e. a differently-named property). In these cases, use this attribute.

An example of this attribute in use appears in the declarations model for a COBIT5 mockup.
* Allowed on [&lt;inherit>](#inherit-element--inherited-value)