## Catalog XML Schema

The topmost elements in the OSCAL catalog XML schema are [`<catalog>`](#catalog-element), [`<framework>`](#framework-and-worksheet-elements), and [`<worksheet>`](#framework-and-worksheet-elements).

### `<catalog>` element

Each OSCAL catalog is defined by a `<catalog>` element. A `<catalog>` element may contain the following:

* `<title>` for the catalog (mandatory)
* [`<declarations>`](#declarations-element) (zero or more)
* [`<section>`](#section-element), [`<group>`](#group-element), and/or [`<control>`](#control-element) (zero or more of each)
* [`<references>`](#references-element) (zero or more)

### `<framework>` and `<worksheet>` elements

The `<framework>` element is used to define a formal framework. OSCAL also offers the `<worksheet>` element, which is used to define an informal, ad hoc framework. The expectation is that the `<framework>` element will be used when a standards organization or other formal body wants to define a published framework, while the `<worksheet>` element will be used by organizations creating frameworks for their own use.

Both `<framework>` and `<worksheet>` elements may contain the following:

* `<title>` (mandatory)
* [`<declarations>`](#declarations-element) (zero or more)
* [`<section>`](#section-element), [`<category>`](#category-element), and/or [`<component>`](#component-element) (zero or more of each)
* [`<references>`](#references-element) (zero or more)
* `@id` (optional)
* `@optionalClass` (optional)

### `<section>` element

Catalogs, frameworks, and worksheets may use `<section>` elements for partitioning. A `<section>` element may contain the following:

* `<title>` (mandatory)
* `<prose>` (mandatory)
* `<section>` or [`<group>`](#group-element) (zero or more of each)
* [`<references>`](#references-element) (zero or more)
* `@id` (optional)
* `@optionalClass` (optional)

### `<group>` element

Catalogs may use `<group>` elements to reference related controls or control groups. `<group>` elements may have their own properties, statements, parameters, references, etc., which are inherited by all members of the group. A `<group>` element may contain the following:

* `<title>` (optional)
* [`<control-components>`](#control-components-element) (mandatory)
* [`<group>`](#group-element) or [`<control>`](#control-element) (one or more total)
* [`<references>`](#references-element) (zero or more)
* `@id` (optional)
* `@optionalClass` (optional)

### `<control-components>` element

TBD explain what this is for. A `<control-components>` element contains zero or more of each of the following:

* [`<prop>`](#prop-element)
* [`<anyKindofPart>`](#part-element)
* [`<link>`](#link-element)
* [`<param>`](#param-element)

#### `<category>` element

A `<category>` element specifies a group of related controls or a group of groups of such controls for a framework or worksheet. A `<category>` element may contain the following:

* `<title>` (optional)
* [`<prop>`](#prop-element), [`<link>`](#link-element), and/or `<prose>` (zero or more of each)
* [`<category>`](#category-element) or [`<component>`](#component-element) (one or more total) 
* `@id` (optional)
* `@optionalClass` (optional)

#### `<component>` element

A [`<framework>` or `<worksheet>`](#framework-and-worksheet-elements) element may contain `<component>` elements. A component references one or more controls. This provides a way to organize the contents of a framework. A `<component>` element may contain the following:

* `<title>` (optional)
* [`<param>`](#param-element), [`<prop>`](#prop-element), [`<link>`](#link-element), `<prose>`, and/or [`<anyKindofPart>`](#part-element) (zero or more of each)
* `<component>` (zero or more) 
* `@id` (optional)
* `@optionalClass` (optional)

##### `<link>` element

A `<link>` element is a line or paragraph with a hypertext link. A `<link>` element may contain the following:

* `<mix>` (mandatory)
* `@relAttr` (mandatory)
* `@hrefAttr` (mandatory)

##### `<param>` element

A `<param>` element is a parameter setting to be propagated to one or more points of insertion. A `<param>` element may contain the following:

* `<desc>` (mandatory)
* `<value>` (mandatory)
* `@id` (optional)
* `@optionalClass` (optional)

##### `<part>` element

The `<anyKindofPart>` element simply contains zero or more instances of the `<part>` element. A `<part>` element is a partition, piece, or section of a control, subcontrol, component, or part. A `<part>` element may contain the following:

* `<title>` (optional)
* `<prose>` and/or [`<control-components>`](#control-components-element) (zero or more of each)
* `@id` (optional)
* `@optionalClass` (optional)

##### `<prop>` element

A `<prop>` element is a value with a name. It is attributed to the containing control, subcontrol, component, part, or group. A `<prop>` element may contain the following:

* `@requiredClass` (mandatory)

### `<control>` element

Each security or privacy control within the catalog is defined by a `<control>` element. A `<control>` element may contain the following:

* `<title>` (optional)
* [`<control-components>`](#control-components-element) and/or [`<subcontrol>`](#subcontrol-element) elements (zero or more of each)
* [`<references>`](#references-element) (zero or more)
* `@id` (optional)
* `@optionalClass` (optional)

### `<subcontrol>` element

An OSCAL `<subcontrol>` element is very similar to an OSCAL `<control>` element in its composition. A `<subcontrol>` element may contain the following:

* `<title>` (optional)
* [`<control-components>`](#control-components-element) element (mandatory)
* [`<references>`](#references-element) (zero or more)
* `@id` (optional)
* `@optionalClass>` (optional)

### `<references>` element

A `<references>` element contains one or more reference descriptions, each contained within a `<ref>` element. Each `<ref>` element may contain the following:

* `<std>` (citation of a formal published standard), `<citation>` (citation of a resource), and/or `<prose>` elements (zero or more of each)
* `@id` (optional)

### `<declarations>` element

A `<declarations>` element is used for extra-schema validation of data given within controls or framework components. More information on this will be added to the documentation in the future.
