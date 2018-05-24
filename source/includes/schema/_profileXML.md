## Profile XML Schema

A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost element in the OSCAL profile XML schema is [`<profile>`](#code-lt-profile-gt-code-element).

### `<profile>` element

Each OSCAL profile is defined by a `<profile>` element. A `<profile>` element may contain the following:

* `@id` (required)
* `<title>` (mandatory)
* [`<import>`](#code-lt-import-gt-code-element) (one or more)
* [`<merge>`](#code-lt-merge-gt-code-element) (optional)
* [`<modify>`](#code-lt-modify-gt-code-element) (optional)

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([`<import>`](#code-lt-import-gt-code-element)), merged or (re)structured ([`<merge>`](#code-lt-merge-gt-code-element)), and emended ([`<modify>`](#code-lt-modify-gt-code-element)). OSCAL profiles may select subsets of control sets, set parameter values for them in an application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles that import them.

> TBD: explain example

```xml
<profile id="ultimate-profile-20180101" xmlns="http://csrc.nist.gov/ns/oscal/1.0">
	<title>Ultimate Baseline Profile</title>
	<publication_information>
     ...
 	</publication_information>
	<import href="../Ultimate/ultimate-baseline-profile.xml">
  </import>
  <merge/>
	<modify>
     ...
  </modify>
</profile>
```

### `<import>` element

An `<import>` element designates a catalog, profile, or other resource to be included (referenced and potentially modified) by this profile. An `<import>` element may contain the following:

* `@href` (optional)
* [`<include>`](#code-lt-include-gt-code-element) (optional)
* [`<exclude>`](#code-lt-exclude-gt-code-element) (optional)

The contents of the `<import>` element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [`<include>`](#code-lt-include-gt-code-element) element) or de-selected (using an [`<exclude>`](#code-lt-exclude-gt-code-element) element) from the source catalog or profile.

> TBD: explain example

```xml
<import href="../Ultimate/ultimate-baseline-profile.xml">
</import>
```

### `<include>` element

An `<include>` element specifies which controls and subcontrols to include from the resource (source catalog) being imported. An `<include>` element may contain the following:

* [`<all>`](#code-lt-all-gt-code-element) (optional)
* [`<call>`](#code-lt-call-gt-code-element) and/or [`<match>`](#code-lt-match-gt-code-element) (zero or more total)

To be schema-valid, this element must contain either (but not both) a single [`<all>`](#code-lt-all-gt-code-element) element, or a sequence of [`<call>`](#code-lt-call-gt-code-element) elements.

If the `<include>` element is not specified, it is assumed to be present with contents [`<all>`](#code-lt-all-gt-code-element); i.e., all controls are included by default, unless the `<include>` element calls controls specifically.

> TBD: explain example

```xml
<include>
  <call control-id="mp-1"/>
  <call control-id="mp-2"/>
  <call subcontrol-id="mp-2-a"/>
  <call subcontrol-id="mp-2-b"/>
  ...
</include>
```

#### `<all>` element

An `<all>` element includes all controls from the imported resource. An `<all>` element may contain the following:

* `@with-subcontrols` (optional), which specifies whether subcontrols should also be included (`yes` or `no`)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [`<include>`](#code-lt-include-gt-code-element) element is given in an [`<import>`](#code-lt-import-gt-code-element) element, so ordinarily one might not see the `<all>` element unless it is for purposes of specifying `@with-subcontrols='yes'`.

> The first example is importing a catalog with all controls included:

```xml
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```

> The second example shows this can also be done implicitly (with the same outcome):

```xml
<import href="canonical-catalog-oscal.xml"/>
```

> However, these two examples are not the same as the third example, since `with-subcontrols` is assumed to be "no" unless stated to be "yes".

```xml
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
* `@with-control` (optional)
* `@subcontrol-id` (optional)

Inside an [`<include>`](#code-lt-include-gt-code-element) element, if `@control-id` is used (to indicate the control being referenced), then `@subcontrol-id` cannot be used, and vice versa. (A single `<call>` element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id`, not with `@subcontrol-id`.

If `@with-subcontrols` is "yes" on the call to a control, no sibling `<call>` elements need to be used to call its subcontrols. Accordingly, it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

> TBD: explain example

```xml
<call control-id="mp-2"/>
<call subcontrol-id="mp-2-a"/>
```

#### `<match>` element

A `<match>` element selects controls by a regular expression match on ID. A `<match>` element may contain the following:

* `@with-subcontrols` (optional)
* `@with-control` (optional)
* `@pattern` (required), which is a regular expression to be matched against an ID value for purposes of control selection
* `@order` (optional), set to one of the following to specify the order when multiple controls match: `keep`, `ascending` (alphabetically by ID), or `descending` (alphabetically by ID)

> TBD: did not have XML examples available to base this on

### `<exclude>` element

An `<exclude>` element specifies which controls and subcontrols to exclude from the resource (source catalog) being imported. An `<excludes>` element may contain the following:

* [`<match>`](#code-lt-match-gt-code-element) (optional)
* [`<call>`](#code-lt-call-gt-code-element) (zero or more)
* For each instance of [`<call>`](#code-lt-call-gt-code-element), there may optionally also be a `@control-id` and a `@subcontrol-id`.

Within `<exclude>`, [`<all>`](#code-lt-all-gt-code-element) is not an option since it makes no sense. However, it also makes no sense to use `exclude/call` except with `include/all`; you would not want to include and exclude something by ID simultaneously. If this happens, an error condition will be reported.

> TBD: did not have XML examples available to base this on

### `<merge>` element

A `<merge>` element merges controls in resolution. The contents of the `<merge>` element may be used to "reorder" or "restructure" controls by indicating an order and/or structure in resolution. Implicitly, a `<merge>` element is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a `<merge>` element, will not be merged into (will be dropped) in the resulting resolution.

A `<merge>` element may contain the following:

* [`<combine>`](#code-lt-combine-gt-code-element) (optional)
* [`<as-is>`](#code-lt-as-is-gt-code-element) and/or [`<custom>`](#code-lt-custom-gt-code-element) (zero or more total)

> TBD: did not have XML examples available to base this on

#### `<combine>` element

A `<combine>` element defines whether and how to combine multiple (competing) versions of the same control. Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol). This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be useful for defining what to do when it occurs.

A `<combine>` element must contain the following:

* `@method`, set to one of the following: `use-first`, `merge`, or `keep`. The `merge` and `keep` values may produce invalid/broken results in some cases (where upstream profiles compete over control contents). In a profile with no collisions, the three values all have the same results.

> TBD: did not have XML examples available to base this on

#### `<as-is>` element

An `<as-is>` element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

> TBD: did not have XML examples available to base this on

#### `<custom>` element

A `<custom>` element frames a structure for embedding represented controls in resolution. The `<custom>` element represents a custom arrangement or organization of controls in the resolution of a catalog. While the [`<as-is>`](#code-lt-as-is-gt-code-element) element provides for a restitution of a control set's organization (in one or more source catalogs), this element permits the definition of an entirely different structure.

A `<custom>` element may contain the following:

* `@id` (optional)
* `@class` (optional)
* `<title>` (optional)
* `<group>`, [`<call>`](#code-lt-call-gt-code-element), and/or [`<match>`](#code-lt-match-gt-code-element) (zero or more of each)

Unlike groups within catalogs, `<group>` elements inside `<custom>` elements contain references to controls to be included in the group (in resolution)--or more such groups.

> TBD: did not have XML examples available to base this on

### `<modify>` element

A `<modify>` element sets parameters or amends controls in resolution. A `<modify>` element may contain the following:

* [`<set-param>`](#code-lt-set-param-gt-code-element) and/or [`<alter>`](#code-lt-alter-gt-code-element) (zero or more of each)

> TBD: explain example

```xml
<modify>
  <set-param param-id="mp-1_mode">
    <constraint>at least 3</constraint>
  </set-param>
  ...
</modify>
```

#### `<set-param>` element

A `<set-param>` element sets a parameter's value or rewrites its label or description. A `<set-param>` element may contain the following:

* `@param-id` (required)
* `@class` (optional)
* `<desc>` (optional)
* `<label>` (optional)
* `<value>` (optional)
* [`<link>`](#code-lt-link-gt-code-element) (zero or more)

`@param-id` indicates the parameter (within the scope of the referenced catalog or resource). The `<value>` element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A `<desc>` element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

> TBD: add examples

#### `<alter>` element

An `<alter>` element specifies changes to be made to an included control or subcontrol when a profile is resolved. An `<alter>` element may contain the following:

* `@control-id` (optional)
* `@subcontrol-id` (optional)
* [`<remove>`](#code-lt-remove-gt-code-element) (zero or more)
* [`<add>`](#code-lt-add-gt-code-element) (zero or more)

Use `@control-id` or `@subcontrol-id` to indicate the scope of alteration.

It is an error for two `<alter>` elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this element to match multiple control IDs could provide for this.

> TBD: explain example

```xml
<alter subcontrol-id="mp-1-A">
  <add>
    <part class="guidance">
      <p>MP-1 part A should be equal to or greater than MP-1 part B.</p>
    </part>
  </add>
</alter>
```

#### `<remove>` element

A `<remove>` element specifies items to be removed from a control or subcontrol in resolution. A `<remove>` element may contain the following:

* `@class-ref` (optional) to specify the classes of items within controls or subcontrols in scope for removal
* `@id-ref` (optional) to specify the ID values of items within controls or subcontrols in scope for removal
* `@item-name` (optional) to specify the names of items within controls or subcontrols in scope for removal

Use these attributes to specify which items are to be removed or erased from a control or subcontrol when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) an [`<alter>`](#code-lt-alter-gt-code-element) element.

To change an item, use `<remove>` to remove the item, then [`<add>`](#code-lt-add-gt-code-element) to add it back again with changes.

> TBD: add example

#### `<add>` element

An `<add>` element specifies contents to be added to a control or subcontrols in resolution. An `<add>` element may contain the following:

* `@position`, set to one of the following: `before`, `after`, `starting`, or `ending` (required)
* `<title>`, [`<param>`](#code-lt-param-gt-code-element), [`<prop>`](#code-lt-prop-gt-code-element), and/or [`<part>`](#code-lt-part-gt-code-element) (zero or more of each)

> TBD: explain example

```xml
<add>
  <part class="guidance">
    <p>MP-1 part A should be equal to or greater than MP-1 part B.</p>
  </part>
</add>
```
