## Profile XML Schema

A profile designates a selection and configuration of controls from one or more catalogs. The topmost element in the OSCAL profile XML schema is [`<profile>`](#profile-element).

### `<profile>` element

Each OSCAL profile is defined by a `<profile>` element. A `<profile>` element may contain the following:

* `<title>` for the profile (mandatory)
* [`<import>`](#import-element) (one or more)
* [`<merge>`](#merge-element)` (optional)
* [`<modify>`](#modify-element)` (optional)
* `@idAttr` (optional)

### `<import>` element

An `<import>` element designates a catalog, profile, or other resource to be referenced by this profile. An `<import>` element may contain the following:

* [`<include>`](#include-element) (optional)
* [`<exclude>`](#exclude-element) (optional)
* `@hrefAttr` (optional)

### `<merge>` element

A `<merge>` element merges controls. A `<merge>` element may contain the following:

* [`<combine>`](#combine-element) (optional)
* [`<as-is>`](#as-is-element) and/or [`<custom>`](#custom-element) (optional)

### `<combine>` element

A `<combine>` element defines whether and how to combine multiple (competing) versions of the same control. A `<combine>` element may contain the following:

* [`<method>`](#method-element) (mandatory)
* A restriction, set to one of the following: `use-first`, `merge`, or `keep`

### `<as-is>` element

An `<as-is>` element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

### `<custom>` element

A `<custom>` element frames a structure for embedding represented controls in resolution. A `<custom>` element may contain the following:

* `<title>` (optional)
* [`<profileGroup>`](#profileGroup-element), [`<call>`](#call-element), and/or [`<match>`](#match-element) (zero or more of each)
* `@ID` (optional)
* `@optionalClass` (optional)

