## Profile XML Schema

A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost element in the OSCAL profile XML schema is [`<profile>`](#profile-element).

### `<profile>` element

Each OSCAL profile is defined by a `<profile>` element. A `<profile>` element may contain the following:

* `@id` (required)
* `<title>` (mandatory)
* [`<import>`](#import-element) (one or more)
* [`<merge>`](#merge-element) (optional)
* [`<modify>`](#modify-element) (optional)

### `<import>` element

An `<import>` element designates a catalog, profile, or other resource to be referenced by this profile. An `<import>` element may contain the following:

* `@href` (optional)
* [`<include>`](#include-element) (optional)
* [`<exclude>`](#exclude-element) (optional)

### `<merge>` element

A `<merge>` element merges controls in resolution. The contents of the `<merge>` element may be used to "reorder" or "restructure" controls by indicating an order and/or structure in resolution. Implicitly, a `<merge>` element is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a `<merge>` element, will not be merged into (will be dropped) in the resulting resolution.

A `<merge>` element may contain the following:

* [`<combine>`](#combine-element) (optional)
* [`<as-is>`](#as-is-element) and/or [`<custom>`](#custom-element) (one or more total)

#### `<combine>` element

A `<combine>` element defines whether and how to combine multiple (competing) versions of the same control. Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol). This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be useful for defining what to do when it occurs.

A `<combine>` element must contain the following:

* `@method`, set to one of the following: `use-first`, `merge`, or `keep`. The `merge` and `keep` values may produce invalid/broken results in some cases (where upstream profiles compete over control contents). In a profile with no collisions, the three values all have the same results.

#### `<as-is>` element

An `<as-is>` element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

#### `<custom>` element

A `<custom>` element frames a structure for embedding represented controls in resolution. A `<custom>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* [`<group>`](#group-element), [`<call>`](#call-element), and/or [`<match>`](#match-element) (zero or more of each)

### `<modify>` element

A `<modify>` element sets parameters or amends controls in resolution. A `<modify>` element may contain the following:

* [`<set-param>`](#set-param-element) and/or [`<alter>`](#alter-element) (zero or more of each)

#### `<include>` element

An `<include>` element specifies which controls and subcontrols to include from the resource (source catalog) being imported. An `<include>` element may contain the following:

* [`<all>`](#all-element) (zero or more)
* [`<call>`](#call-element) and/or [`<match>`](#match-element) (zero or more total)

To be schema-valid, this element must contain either (but not both) a single [`<all>`](#all-element) element, or a sequence of [`<call>`](#call-element) elements.

If the `<include>` element is not specified, it is assumed to be present with contents [`<all>`](#all-element); i.e., all controls are included by default, unless the `<include>` element calls controls specifically.

#### `<all>` element

An `<all>` element includes all controls from the imported resource.

TBD: add the @with-subcontrols attribute? Doc shows this element as being empty.

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [`<include>`](#include-element) element is given in an [`<import>`](#import-element) element, so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`.

Here is an example of importing a catalog with all controls included:

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```

This can also be done implicitly (with the same outcome) like this:

```
<import href="canonical-catalog-oscal.xml"/>
```

However, these two examples are not the same as the following, since `with-subcontrols` is assumed to be "no" unless stated to be "yes".

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all with-subcontrols="yes"/>
  </include>
</import>
```

#### `<call>` element

A `<call>` element calls a control or subcontrol by its ID. A `<call>` element may contain the following:

* `@with-subcontrols` (optional)
* `@control-id` (optional)
* `@subcontrol-id` (optional)

Inside an [`<include>`](#include-element) element, if `@control-id` is used (to indicate the control being referenced), then `@subcontrol-id` cannot be used, and vice versa. (A single `<call>` element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id`, not with `@subcontrol-id`.

If `@with-subcontrols` is "yes" on the call to a control, no sibling `<call>` elements need to be used to call its subcontrols. Accordingly, it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

### `<match>` element

A `<match>` element selects controls by a regular expression match on ID. A `<match>` element may contain the following:

* `@with-subcontrols` (optional)
* `@with-control` (optional)
* `@pattern` (required), which is a regular expression to be matched against an ID value for purposes of control selection
* `@order` (optional), set to one of the following to specify the order when multiple controls match: `keep`, `ascending` (alphabetically by ID), or `descending` (alphabetically by ID)

#### `<exclude>` element

An `<exclude>` element specifies which controls and subcontrols to exclude from the resource (source catalog) being imported. An `<excludes>` element may contain the following:

Within `<exclude>`, [`<all>`](#all-element) is not an option since it makes no sense. However, it also makes no sense to use `exclude/call` except with `include/all`; you would not want to include and exclude something by ID simultaneously. If this happens, an error condition will be reported.

* [`<match>`](#match-element) (zero or more)
* [`<call>`](#call-element) (zero or more)
* For each instance of [`<call>`](#call-element), there may optionally also be a `@control-id` and a `@subcontrol-id`.

#### `<set-param>` element

A `<set-param>` element sets a parameter's value or rewrites its label or description. A `<set-param>` element may contain the following:

* `@param-id` (required)
* `@class` (optional)
* `<desc>` (optional)
* `<label>` (optional)
* `<value>` (optional)
* [`<link>`](#link-element) (zero or more)

`@param-id` indicates the parameter (within the scope of the referenced catalog or resource). The `<value>` element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A `<desc>` element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

#### `<alter>` element

An `<alter>` element specifies changes to be made to an included control or subcontrol when a profile is resolved. An `<alter>` element may contain the following:

TBD: what is `@targets`?

* `@control-id` (optional)
* `@subcontrol-id` (optional)
* [`<remove>`](#remove-element) (zero or more)
* [`<add>`](#add-element) (zero or more)

Use `@targets` to indicate the classes of elements (typically `<part>` or `<prop>` elements) to erase or remove from a control when a catalog is resolved.

It is an error for two `<alter>` elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

#### `<remove>` element

A `<remove>` element specifies items to be removed from a control or subcontrol in resolution. A `<remove>` element may contain the following:

* `@class-ref` (optional) to specify the classes of items within controls or subcontrols in scope for removal
* `@id-ref` (optional) to specify the ID values of items within controls or subcontrols in scope for removal
* `@item-name` (optional) to specify the names of items within controls or subcontrols in scope for removal

Use these attributes to specify which items are to be removed or erased from a control or subcontrol when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) an [`<alter>`](#alter-element) element.

To change an item, use `<remove>` to remove the item, then [`<add>`](#add-element) to add it back again with changes.

#### `<add>` element

An `<add>` element specifies contents to be added to a control or subcontrols in resolution. An `<add>` element may contain the following:

* `@position`, set to one of the following: `before`, `after`, `starting`, or `ending` (required)
* `<title>`, [`<param>`](#param-element), [`<prop>`](#prop-element), and/or [`<part>`](#part-element) (zero or more of each)
