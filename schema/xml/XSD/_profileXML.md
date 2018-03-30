
> * [XML Schema _profile.xsd](#)
>   * [Profiling](#profiling)
>     * [&lt;profile> Profile](#profile-profile)
>     * [&lt;import> Import resource](#import-import-resource)
>     * [&lt;merge> merge](#merge-merge)
>     * [&lt;modify> modify](#modify-modify)
>     * [&lt;include> Include controls](#include-include-controls)
>     * [&lt;exclude> Exclude controls](#exclude-exclude-controls)
>     * [&lt;all> Include all](#all-include-all)
>     * [&lt;call> Call (control or subcontrol)](#call-call-(control-or-subcontrol))
>     * [@control-id control-id](#control-id-control-id)
>     * [@subcontrol-id subcontrol-id](#subcontrol-id-subcontrol-id)
>     * [&lt;match> match](#match-match)
>     * [@pattern pattern](#pattern-pattern)
>     * [@order order](#order-order)
>     * [@with-subcontrols with-subcontrols](#with-subcontrols-with-subcontrols)
>     * [@with-control with-control](#with-control-with-control)
>     * [&lt;set-param> Parameter setting](#set-param-parameter-setting)
>     * [&lt;alter> Alteration](#alter-alteration)
>     * [&lt;remove> Removal](#remove-removal)
>     * [@class-ref class-ref](#class-ref-class-ref)
>     * [@id-ref id-ref](#id-ref-id-ref)
>     * [@item-name item-name](#item-name-item-name)
>     * [&lt;add> Addition](#add-addition)
>     * [&lt;combine> combine](#combine-combine)
>     * [@method method](#method-method)
>     * [&lt;as-is> as-is](#as-is-as-is)
>     * [&lt;custom> custom](#custom-custom)

# XML Schema _profile.xsd

### Profiling

xsd: ../../schema/xml/XSD/_profile.xsd

By means of its profiling functionality, OSCAL provides ways of specifying and documenting configurations or "overlays" of catalog, as profile documents. Although they may contain fragments of OSCAL catalogs, for the most part, profiles are an entirely distinct means or mechanism for working with OSCAL.

Roughly speaking, a profile document is a specification of a *selection* of controls and subcontrols from a catalog, along with a series of *operations* over those controls and their use.

#### profile Profile 
> In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([import](#import-import-resource)), merged or (re)structured ([merge](#merge-merge)), and emended ([modify](#modify-modify)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.

##### Content declaration (reduced)

* attribute `@id` (required) valid to constraints for type 'ID'
* element `title` (mandatory)
* element [import](#import-import-resource) (at least one)
* element [merge](#merge-merge) (optional)
* element [modify](#modify-modify) (optional)

#### import Import resource 
> Designating a catalog, profile or other resource for controls

An [import](#import-import-resource) indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively.

The contents of the [import](#import-import-resource) element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [include](#include-include-controls) element) or de-selected (using an [exclude](#exclude-exclude-controls) element) from the source catalog or profile.

##### Content declaration (reduced)

* attribute `@href` (optional)
* element [include](#include-include-controls) (optional)
* element [exclude](#exclude-exclude-controls) (optional)

#### merge merge 
> Merge controls in resolution

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the [merge](#merge-merge) can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution).

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.

##### Content declaration (reduced)

* element [combine](#combine-combine) (optional)
* as needed (at least one):
  * element [as-is](#as-is-as-is)
  * element [custom](#custom-custom)

#### modify modify 
> Set parameters or emend controls in resolution

##### Content declaration (reduced)

* as needed:
  * element [set-param](#set-param-parameter-setting)
  * element [alter](#alter-alteration)

#### include Include controls 
> Which controls and subcontrols to include from the resource (source catalog) being imported

To be schema-valid, this element must contain either (but not both) a single [all](#all-include-all) element, or a sequence of [call](#call-call-(control-or-subcontrol)) elements.

If this element is not given, it is assumed to be present with contents [all](#all-include-all) (qv); i.e., all controls are included by default, unless the [include](#include-include-controls) instruction calls controls specifically.

##### Content declaration (reduced)

* as needed (at least one):
  * element [all](#all-include-all)
  * as needed (at least one):
    * element [call](#call-call-(control-or-subcontrol))
    * element [match](#match-match)

#### exclude Exclude controls 
> Which controls and subcontrols to exclude from the resource (source catalog) being imported

Within [exclude](#exclude-exclude-controls), [all](#all-include-all) is not an option since it makes no sense. However, it also makes no sense (think about it) to use `exclude/call` except with `include/all` (it makes no sense to call in by ID only to exclude by ID). The only error condition reported, however, is when the same control is both included (explicitly, by ID) and excluded.

##### Content declaration (reduced)

* as needed (at least one):
  * element [match](#match-match)
  * element *call*, containing: 
    * attribute [@control-id](#control-id-control-id) (optional) valid to constraints for type 'NCName'
    * attribute [@subcontrol-id](#subcontrol-id-subcontrol-id) (optional) valid to constraints for type 'NCName'

#### all Include all 
> Include all controls from the imported resource (catalog)

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [include](#include-include-controls) element is given in an [import](#import-import-resource); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`

Importing a catalog with all controls included:```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all/>
  </include>
</import>
```


can also be done implicitly (with the same outcome):```
<import href="canonical-catalog-oscal.xml"/>
```


However these are not the same as```
<import href="canonical-catalog-oscal.xml">
  <include>
    <all with-subcontrols="yes"/>
  </include>
</import>
```


(Since `with-subcontrols` is assumed to be "no" unless stated to be "yes".)

This element is empty

#### call Call (control or subcontrol) 
> Call a control or subcontrol by its ID

Inside [include](#include-include-controls), If [@control-id](#control-id-control-id) is used (to indicate the control being referenced), [@subcontrol-id](#subcontrol-id-subcontrol-id) cannot be used, and vice versa. (A single [call](#call-call-(control-or-subcontrol)) element is used for each control.) This constraint is enforced by the schema. Likewise, [@with-subcontrols](#with-subcontrols-with-subcontrols) can be used only along with [@control-id](#control-id-control-id) not with [@subcontrol-id](#subcontrol-id-subcontrol-id).

If [@with-subcontrols](#with-subcontrols-with-subcontrols) is "yes" on the call to a control, no sibling [call](#call-call-(control-or-subcontrol))elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

This element is empty

#### control-id control-id 
> control-id
* Allowed on [call](#call-call-(control-or-subcontrol)), [alter](#alter-alteration)

#### subcontrol-id subcontrol-id 
> subcontrol-id
* Allowed on [call](#call-call-(control-or-subcontrol)), [alter](#alter-alteration)

#### match match 
> Select controls by (regular expression) match on ID

This element is empty

#### pattern pattern 
> A regular expression to be matched against an ID value for purposes of control selection
* Required on [match](#match-match)

#### order order 
> When matching multiple controls, what order to use in emitting them: `source`, `ascending`(alphabetically by ID) or `descending` (alphabetically by ID)
* Allowed on [match](#match-match)

#### with-subcontrols with-subcontrols 
> Say "yes" to include subcontrols with their controls
* Allowed on [all](#all-include-all), [call](#call-call-(control-or-subcontrol)), [match](#match-match)

#### with-control with-control 
> with-control
* Allowed on [call](#call-call-(control-or-subcontrol)), [match](#match-match)

#### set-param Parameter setting 
> Set a parameter's value or rewrite its label or description

`@param-id` indicates the parameter (within the scope of the referenced catalog or resource). The `value` element is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A `desc` element can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

##### Content declaration (reduced)

* attribute `@param-id` (required) valid to constraints for type 'NMTOKEN'
* attribute `@class` (optional)
* element `desc` (optional)
* element `label` (optional)
* element `value` (optional)
* element `link` (zero or more)

#### alter Alteration 
> Specifies changes to be made to an included control or subcontrol when a profile is resolved

Use `@targets` to indicate the classes of elements (typically `part` or `prop` elements) to erase or remove from a control, when a catalog is resolved.

It is an error for two [alter](#alter-alteration) elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

##### Content declaration (reduced)

* attribute [@control-id](#control-id-control-id) (optional) valid to constraints for type 'NCName'
* attribute [@subcontrol-id](#subcontrol-id-subcontrol-id) (optional) valid to constraints for type 'NCName'
* element [remove](#remove-removal) (zero or more)
* element [add](#add-addition) (zero or more)

#### remove Removal 
> Elements to be removed from a control or subcontrol, in resolution

Use [@class-ref](#class-ref-class-ref), [@id-ref](#id-ref-id-ref) or [@item-name](#item-name-item-name) to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [alter](#alter-alteration) element.

To change an element, use [remove](#remove-removal) to remove the element, then [add](#add-addition) to add it back again with changes.

This element is empty

#### class-ref class-ref 
> Classes of controls or subcontrols in scope for alteration
* Allowed on [remove](#remove-removal)

#### id-ref id-ref 
> ID values on controls or subcontrols in scope for alteration
* Allowed on [remove](#remove-removal)

#### item-name item-name 
> An element name of control contents in scope for alteration

To select the `title` element use the value "title" etc.
* Allowed on [remove](#remove-removal)

#### add Addition 
> Element contents to be added to a control or subcontrols, in resolution

##### Content declaration (reduced)

* attribute `@position` (required)
* as needed:
  * element `title`
  * element `param`
  * element `prop`
  * element `part`

#### combine combine 
> Whether and how to combine multiple (competing) versions of the same control

This element is empty

#### method method 
> The method to be used when combining controls or subcontrols in resolution. A value of 
* Required on [combine](#combine-combine)

#### as-is as-is 
> Structure the controls in resolution as they are structured in their source catalogs

This element is empty

#### custom custom 
> Frame a structure wherein represented controls will be embedded in resolution

##### Content declaration (reduced)

* attribute `@id` (optional) valid to constraints for type 'ID'
* attribute `@class` (optional)
* element `title` (optional)
* as needed:
  * element *group*, containing: 
    * element `title` (optional)
    * as needed:
      * element `group`
      * element [call](#call-call-(control-or-subcontrol))
      * element [match](#match-match)
  * element [call](#call-call-(control-or-subcontrol))
  * element [match](#match-match)