## Profile XML Schema

A profile designates a selection and configuration of controls from one or more catalogs. The topmost element in the OSCAL profile XML schema is [`<profile>`](#profile-element).

### `<profile>` element

Each OSCAL profile is defined by a `<profile>` element. A `<profile>` element may contain the following:

* `@id` (optional)
* `<title>` for the profile (mandatory)
* [`<import>`](#import-element) (one or more)
* [`<merge>`](#merge-element) (optional)
* [`<modify>`](#modify-element) (optional)

### `<import>` element

An `<import>` element designates a catalog, profile, or other resource to be referenced by this profile. An `<import>` element may contain the following:

* `@href` (optional)
* [`<include>`](#include-element) (optional)
* [`<exclude>`](#exclude-element) (optional)

### `<merge>` element

A `<merge>` element merges controls in resolution. The contents of the `<merge>` element may be used to "reorder" or "restructure" controls by indicating an order and/or structure in resolution. 

A `<merge>` element may contain the following:

* [`<combine>`](#combine-element) (optional)
* [`<as-is>`](#as-is-element) and/or [`<custom>`](#custom-element) (optional)

#### `<combine>` element

A `<combine>` element defines whether and how to combine multiple (competing) versions of the same control. A `<combine>` element may contain the following:

* `@method`, set to one of the following: `use-first`, `merge`, or `keep` (mandatory)

#### `<as-is>` element

An `<as-is>` element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

#### `<custom>` element

A `<custom>` element frames a structure for embedding represented controls in resolution. A `<custom>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<profileGroup>`](#profileGroup-element), [`<call>`](#call-element), and/or [`<match>`](#match-element) (zero or more of each)

#### `<profileGroup>` element

TBD: has this been deleted?

A `<profileGroup>` element designates related controls or groups (of controls or groups). A `<profileGroup>` element may contain the following:

* `<title>` (optional)
* [`<profileGroup>`](#profileGroup-element), [`<call>`](#call-element), and/or [`<match>`](#match-element) (zero or more of each)

### `<modify>` element

A `<modify>` element sets parameters or amends controls in resolution. A `<modify>` element may contain the following:

* [`<set-param>`](#set-param-element) and/or [`<alter>`](#alter-element) (zero or more of each)

#### `<include>` element

An `<include>` element specifies which controls and subcontrols to include from the resource (source catalog) being imported. An `<include>` element may contain the following:

TBD: is this at least one of all, call, and/or match?

* [`<all>`](#all-element) (one or more)
* [`<call>`](#call-element) and/or [`<match>`](#match-element) (one or more total)

#### `<all>` element

An `<all>` element includes all controls from the imported resource.

#### `<call>` element

A `<call>` element calls a control or subcontrol by its ID. A `<call>` element may contain the following:

* `@withSubContrlsAttr` (optional)
* `@control-id` (optional)
* `@subcontrol-id` (optional)

### `<match>` element

A `<match>` element selects controls by a regular expression match on ID. A `<match>` element may contain the following:

* `@withSubContrlsAttr` (optional)
* `@withContrlsAttr` (optional)
* `@pattern` (required)
* `@order`, set to one of the following: `keep`, `ascending`, or `descending` (optional)

#### `<exclude>` element

An `<exclude>` element specifies which controls and subcontrols to exclude from the resource (source catalog) being imported. An `<excludes>` element may contain the following:

TBD: is this one or more of match and call?

* [`<match>`](#match-element) (one or more)
* [`<call>`](#call-element) (one or more)
* For each instance of [`<call>`](#call-element), there may optionally also be a `@control-id` and a `@subcontrol-id`.

#### `<set-param>` element

A `<set-param>` element sets a parameter's value or rewrites its label or description. A `<set-param>` element may contain the following:

* [`<desc>`](#desc-element), [`<label>`](#label-element), and/or [`<value>`](#value-element) (zero or more of each)
* `@param-id` (required)
* `@optionalClass` (optional)

#### `<alter>` element

An `<alter>` element specifies changes to be made to an included control or subcontrol when a profile is resolved. An `<alter>` element may contain the following:

* [`<remove>`](#remove-element) (zero or more)
* [`<add>`](#add-element) (zero or more)
* `@control-id` (optional)
* `@subcontrol-id` (optional)

#### `<remove>` element

A `<remove>` element specifies elements to be removed from a control or subcontrol in resolution. A `<remove>` element may contain the following:

* `@class-ref` (optional)
* `@id-ref` (optional)
* `@item-name` (optional)

#### `<add>` element

An `<add>` element specifies contents to be added to a control or subcontrols in resolution. An `<add>` element may contain the following:

* [`<title>`](#title-element), [`<param>`](#param-element), [`<prop>`](#prop-element), and/or [`<part>`](#part-element) (zero or more of each)
* `@position`, set to one of the following: `before`, `after`, `starting`, or `ending`
