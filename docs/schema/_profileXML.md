

## Profiling

By means of its profiling functionality, OSCAL provides ways of specifying and documenting configurations or "overlays" of catalog, as profile documents. Although they may contain fragments of OSCAL catalogs, for the most part, profiles are an entirely distinct means or mechanism for working with OSCAL.

Roughly speaking, a profile document is a specification of a *selection* of controls and subcontrols from a catalog, along with a series of *operations* over those controls and their use.

The profiling model is also documented with examples in profile semantics documentation.

### `<profile>` element | Profile 

In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([&lt;import>](#import-element--import-resource)), merged or (re)structured ([&lt;merge>](#merge-element--merge-controls)), and emended ([&lt;modify>](#modify-element--modify-controls)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.

* element `title` (mandatory)
* element [&lt;import>](#import-element--import-resource) (at least one)
* element [&lt;merge>](#merge-element--merge-controls) (optional)
* element [&lt;modify>](#modify-element--modify-controls) (optional)
* attribute `@id` (required) valid to constraints for type 'ID'

### `<import>` element | Import resource 

Designating a catalog, profile or other resource for controls

An `<import>` indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively.

The contents of the `<import>` element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [&lt;include>](#include-element--include-controls) element) or de-selected (using an [&lt;exclude>](#exclude-element--exclude-controls) element) from the source catalog or profile.

* element [&lt;include>](#include-element--include-controls) (optional)
* element [&lt;exclude>](#exclude-element--exclude-controls) (optional)
* attribute `@href` (optional)

### `<merge>` element | Merge controls 

Merge controls in resolution

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the `<merge>` can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution).

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.

* element [&lt;combine>](#combine-element--combination-rule) (optional)
* as needed (at least one):
  * element [&lt;as-is>](#as-is-element--structure-as-is-retain-source-structure)
  * element [&lt;custom>](#custom-element--customized-structure-for-controls)

### `<modify>` element | Modify controls 

Set parameters or emend controls in resolution

* as needed:
  * element [&lt;set-param>](#set-param-element--parameter-setting)
  * element [&lt;alter>](#alter-element--alteration)

### `<include>` element | Include controls 

Which controls and subcontrols to include from the resource (source catalog) being imported

To be schema-valid, this element must contain either (but not both) a single [&lt;all>](#all-element--include-all) element, or a sequence of [&lt;call>](#call-element--call-control-or-subcontrol) elements.

If this element is not given, it is assumed to be present with contents [&lt;all>](#all-element--include-all) (qv); i.e., all controls are included by default, unless the `<include>` instruction calls controls specifically.

* as needed (at least one):
  * element [&lt;all>](#all-element--include-all)
  * as needed (at least one):
    * element [&lt;call>](#call-element--call-control-or-subcontrol)
    * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `<exclude>` element | Exclude controls 

Which controls and subcontrols to exclude from the resource (source catalog) being imported

Within `<exclude>`, [&lt;all>](#all-element--include-all) is not an option since it makes no sense. However, it also makes no sense (think about it) to use `exclude/call` except with `include/all` (it makes no sense to call in by ID only to exclude by ID). The only error condition reported, however, is when the same control is both included (explicitly, by ID) and excluded.

* as needed (at least one):
  * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
  * element *call*, containing: 
    * attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
    * attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `<all>` element | Include all 

Include all controls from the imported resource (catalog)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [&lt;include>](#include-element--include-controls) element is given in an [&lt;import>](#import-element--import-resource); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`

Importing a catalog with all controls included:

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```



can also be done implicitly (with the same outcome):

```
<import href="canonical-catalog-oscal.xml"/>
```



However these are not the same as

```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all with-subcontrols="yes"/>
  </include>
</import>
```



(Since `with-subcontrols` is assumed to be "no" unless stated to be "yes".)

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)

### `<call>` element | Call (control or subcontrol) 

Call a control or subcontrol by its ID

Inside [&lt;include>](#include-element--include-controls), If [@control-id](#control-id-attribute--control-identifier) is used (to indicate the control being referenced), [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) cannot be used, and vice versa. (A single `<call>` element is used for each control.) This constraint is enforced by the schema. Likewise, [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) can be used only along with [@control-id](#control-id-attribute--control-identifier) not with [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier).

If [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) is "yes" on the call to a control, no sibling `<call>`elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)
* attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
* attribute [@with-control](#with-control-attribute--include-controls-with-subcontrols) (optional)
* attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `@control-id` attribute | Control Identifier 

control-id
* Allowed on [&lt;call>](#call-element--call-control-or-subcontrol), [&lt;alter>](#alter-element--alteration)

### `@subcontrol-id` attribute | Subcontrol Identifier 

subcontrol-id
* Allowed on [&lt;call>](#call-element--call-control-or-subcontrol), [&lt;alter>](#alter-element--alteration)

### `<match>` element | Match controls and subcontrols by identifier 

Select controls by (regular expression) match on ID

* attribute [@with-subcontrols](#with-subcontrols-attribute--include-subcontrols-with-controls) (optional)
* attribute [@with-control](#with-control-attribute--include-controls-with-subcontrols) (optional)
* attribute [@pattern](#pattern-attribute--match-id-with-pattern-regular-expression) (required)
* attribute [@order](#order-attribute--control-reorder) (optional)

### `@pattern` attribute | Match ID with pattern (regular expression) 

A regular expression to be matched against an ID value for purposes of control selection
* Required on [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `@order` attribute | Control (re)order 

When matching multiple controls, what order to use in emitting them: `keep`, `ascending`(alphabetically by ID) or `descending` (alphabetically by ID)
* Allowed on [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)

### `@with-subcontrols` attribute | Include subcontrols with controls 

Say "yes" to include subcontrols with their controls
* Allowed on 

### `@with-control` attribute | Include controls with subcontrols 

with-control
* Allowed on 

### `<set-param>` element | Parameter setting 

Set a parameter's value or rewrite its label or description

`@param-id` indicates the parameter (within the scope of the referenced catalog or resource). The `value` element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A `desc` element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

* element `desc` (optional)
* element `label` (optional)
* element `value` (optional)
* element `link` (zero or more)
* attribute `@param-id` (required) valid to constraints for type 'NMTOKEN'
* attribute `@class` (optional)

### `<alter>` element | Alteration 

Specifies changes to be made to an included control or subcontrol when a profile is resolved

Use [@control-id](#control-id-attribute--control-identifier) or [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) to indicate the scope of alteration.

It is an error for two `<alter>` elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this element to match multiple targets could provide for this.

* element [&lt;remove>](#remove-element--removal) (zero or more)
* element [&lt;add>](#add-element--addition) (zero or more)
* attribute [@control-id](#control-id-attribute--control-identifier) (optional) valid to constraints for type 'NCName'
* attribute [@subcontrol-id](#subcontrol-id-attribute--subcontrol-identifier) (optional) valid to constraints for type 'NCName'

### `<remove>` element | Removal 

Elements to be removed from a control or subcontrol, in resolution

Use [@class-ref](#class-ref-attribute--select-by-class), [@id-ref](#id-ref-attribute--reference-by-id) or [@item-name](#item-name-attribute--item-name) to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [&lt;alter>](#alter-element--alteration) element.

To change an element, use `<remove>` to remove the element, then [&lt;add>](#add-element--addition) to add it back again with changes.

* attribute [@class-ref](#class-ref-attribute--select-by-class) (optional) valid to constraints for type 'NMTOKENS'
* attribute [@id-ref](#id-ref-attribute--reference-by-id) (optional) valid to constraints for type 'NCName'
* attribute [@item-name](#item-name-attribute--item-name) (optional) valid to constraints for type 'NCName'

### `@class-ref` attribute | Select by class 

Classes of items within controls or subcontrols in scope for removal
* Allowed on [&lt;remove>](#remove-element--removal)

### `@id-ref` attribute | Reference by ID 

ID values on items within controls or subcontrols in scope for removal
* Allowed on [&lt;remove>](#remove-element--removal)

### `@item-name` attribute | Item name 

The (element) name of an item within controls or subcontrols in scope for removal

To select the `title` element use the value "title" etc.
* Allowed on [&lt;remove>](#remove-element--removal)

### `<add>` element | Addition 

Element contents to be added to a control or subcontrols, in resolution

* as needed:
  * element `title`
  * element `param`
  * element `prop`
  * element `part`
* attribute `@position` (required)

### `<combine>` element | Combination rule 

Whether and how to combine multiple (competing) versions of the same control

* attribute [@method](#method-attribute--control-combination-method) (required)

### `@method` attribute | Control combination method 

The method to be used when combining controls or subcontrols in resolving a profile

Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol). This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided; but this setting can be useful for defining what to do when it occurs.

Three values are recognized: "use-first", "merge" or "keep". The latter two may produce invalid/broken results in some cases (where upstream profiles compete over control contents). In a profile with no collisions, the three values all have the same results.
* Required on [&lt;combine>](#combine-element--combination-rule)

### `<as-is>` element | Structure as-is; retain source structure 

Structure the controls in resolution as they are structured in their source catalogs

This element is empty

### `<custom>` element | Customized structure for controls 

Frame a structure wherein represented controls will be embedded in resolution

This element represents a custom arrangement or organization of controls in the resolution of a catalog. While [&lt;as-is>](#as-is-element--structure-as-is-retain-source-structure) provides for a restitution of a control set's organization (in one or more source catalogs), this element permits the definition of an entirely different structure.

Unlike groups within catalogs, `group` elements inside `<custom>` contain references to controls to be included in the group (in resolution) - or more such groups.

* element `title` (optional)
* as needed:
  * element *group*, containing: 
    * element `title` (optional)
    * as needed:
      * element `group`
      * element [&lt;call>](#call-element--call-control-or-subcontrol)
      * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
  * element [&lt;call>](#call-element--call-control-or-subcontrol)
  * element [&lt;match>](#match-element--match-controls-and-subcontrols-by-identifier)
* attribute `@id` (optional) valid to constraints for type 'ID'
* attribute `@class` (optional)