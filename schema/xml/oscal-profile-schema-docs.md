 

# OSCAL Profile Metaschema: XML Schema 

The short name (file identifier) for this schema shall be oscal-profile 

## Profile: `<profile>` element

In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately

The `<profile>` element has the following contents (in order):
 
* [&lt;import>](#import-resource-import-element) elements (zero or more) 
* A [&lt;merge>](#merge-controls-merge-element) element (zero or one) 
* A [&lt;modify>](#modify-controls-modify-element) element (zero or one)  

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([&lt;import>](#import-resource-import-element)), merged or (re)structured ([&lt;merge>](#merge-controls-merge-element)), and emended ([&lt;modify>](#modify-controls-modify-element)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.  

## Import resource: `<import>` element

Designating a catalog, profile or other resource for controls

The `<import>` element has the following contents (in order):
 
* An [&lt;include>](#include-controls-include-element) element (zero or one) 
* An [&lt;exclude>](#exclude-controls-exclude-element) element (zero or one)  

An [&lt;import>](#import-resource-import-element) indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively. 

The contents of the [&lt;import>](#import-resource-import-element) element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [&lt;include>](#include-controls-include-element) element) or de-selected (using an [&lt;exclude>](#exclude-controls-exclude-element) element) from the source catalog or profile. 

When no [&lt;include>](#include-controls-include-element) is given (whether an [&lt;exclude>](#exclude-controls-exclude-element) is given or not), an [&lt;include>](#include-controls-include-element)/[&lt;all>](#include-all-all-element) is assumed (that is, all controls will be included by default). So an empty [&lt;import>](#import-resource-import-element) implies [&lt;include>](#include-controls-include-element)/[&lt;all>](#include-all-all-element) indicating all controls are to be included.  

## Merge controls: `<merge>` element

Merge controls in resolution

The `<merge>` element has the following contents (in order):
 
* A [&lt;combine>](#combination-rule-combine-element) element (zero or one) 
* A choice between  
  * An [&lt;as-is>](#as-is-as-is-element) element (zero or one) 
  * A [&lt;custom>](#custom-grouping-custom-element) element (zero or one)   

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the [&lt;merge>](#merge-controls-merge-element) can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution). 

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.  

## Combination rule: `<combine>` element

Whether and how to combine multiple (competing) versions of the same control

The `<combine>` element supports:

* Attribute [@method](#combination-method-method-attribute) (optional) 

## As is: `<as-is>` element

True whenever given (presence signifies Boolean value)

Merge controls into groups reflecting their catalog(s) of origin 

## Combination method: `@method` attribute 

How clashing controls and subcontrols should be handled  

## Custom grouping: `<custom>` element

A defined (re)organization for controls; nb serves as another selector as well as sorter

The `<custom>` element has the following contents :
 
* A choice between  
  * [&lt;group>](#control-group-group-element) elements (zero or more) 
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more) 
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)   

## Control group: `<group>` element

As in catalogs, a group of (selected) controls or of groups of controls

The `<group>` element has the following contents :
 
* A choice between  
  * [&lt;group>](#control-group-group-element) elements (zero or more) 
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more) 
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)   

## Modify controls: `<modify>` element

Set parameters or emend controls in resolution

The `<modify>` element has the following contents (in order):
 
* [&lt;set-param>](#parameter-setting-set-param-element) elements (zero or more) 
* [&lt;alter>](#alteration-alter-element) elements (zero or more)  

## Include controls: `<include>` element

Which controls and subcontrols to include from the resource (source catalog) being imported

The `<include>` element has the following contents :
 
* A choice between  
  * An [&lt;all>](#include-all-all-element) element (zero or one) 
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more) 
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)   

To be schema-valid, this element must contain either (but not both) a single [&lt;all>](#include-all-all-element) element, or a sequence of [&lt;call>](#call-control-or-subcontrol-call-element) elements. 

If this element is not given, it is assumed to be present with contents [&lt;all>](#include-all-all-element) (qv); i.e., all controls are included by default, unless the [&lt;include>](#include-controls-include-element) instruction calls controls specifically.  

## Include all: `<all>` element

Include all controls from the imported resource (catalog)

The `<all>` element supports:

* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (optional) 

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [&lt;include>](#include-controls-include-element) element is given in an [&lt;import>](#import-resource-import-element); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`   

## Call (control or subcontrol): `<call>` element

Call a control or subcontrol by its ID

The `<call>` element supports:

* Attribute [@control-id](#control-id-control-id-attribute) (nominal data type `NCName`) (optional)
* Attribute [@subcontrol-id](#control-id-subcontrol-id-attribute) (nominal data type `NCName`) (optional)
* Attribute [@with-control](#include-control-with-subcontrol-with-control-attribute) (nominal data type `NCName`) (optional)
* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (nominal data type `NCName`) (optional) 

Inside [&lt;include>](#include-controls-include-element), If `@control-id` is used (to indicate the control being referenced), `@subcontrol-id` cannot be used, and vice versa. (A single [&lt;call>](#call-control-or-subcontrol-call-element) element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id` not with `@subcontrol-id`. 

If `@with-subcontrols` is "yes" on the call to a control, no sibling [&lt;call>](#call-control-or-subcontrol-call-element)elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.  

## Match controls and subcontrols by identifier: `<match>` element

Select controls by (regular expression) match on ID

The `<match>` element supports:

* Attribute [@pattern](#pattern-pattern-attribute) (optional)
* Attribute [@order](#pattern-order-attribute) (optional)
* Attribute [@with-control](#include-control-with-subcontrol-with-control-attribute) (nominal data type `NCName`) (optional)
* Attribute [@with-subcontrols](#include-subcontrols-with-control-with-subcontrols-attribute) (nominal data type `NCName`) (optional) 

## Exclude controls: `<exclude>` element

Which controls and subcontrols to exclude from the resource (source catalog) being imported

The `<exclude>` element has the following contents :
 
* A choice between  
  * [&lt;call>](#call-control-or-subcontrol-call-element) elements (zero or more) 
  * [&lt;match>](#match-controls-and-subcontrols-by-identifier-match-element) elements (zero or more)   

Use this as an alternative to [&lt;include>](#include-controls-include-element) when all controls are to be included by default, and the profile wishes only to filter (remove) controls.  

## Parameter Setting: `<set-param>` element

 A parameter setting, to be propagated to points of insertion 

The `<set-param>` element has the following contents (in order):

* Attribute [@id](#) (nominal data type `ID`) (required)
* Attribute [@class](#) (optional)
* Attribute [@depends-on](#) (nominal data type `IDREF`) (optional) 
* A [&lt;label>](#) element (zero or one) 
* [&lt;desc>](#) elements (zero or more) 
* [&lt;constraint>](#) elements (zero or more) 
* A choice between  
  * A [&lt;value>](#) element (zero or one) 
  * A [&lt;select>](#) element (zero or one)  
* [&lt;link>](#) elements (zero or more) 
* [&lt;part>](#) elements (zero or more)  

## Alteration: `<alter>` element

Generalized modifications to controls or subcontrols as expressed in a profile

The `<alter>` element has the following contents (in order):

* Attribute [@control-id](#control-id-control-id-attribute) (nominal data type `NCName`) (optional)
* Attribute [@subcontrol-id](#control-id-subcontrol-id-attribute) (nominal data type `NCName`) (optional) 
* [&lt;remove>](#removal-remove-element) elements (zero or more) 
* [&lt;add>](#addition-add-element) elements (zero or more)  

For modifying parameters, use [&lt;set-param>](#parameter-setting-set-param-element), which will provides traceability.  

## Removal: `<remove>` element

Elements to be removed from a control or subcontrol, in resolution

The `<remove>` element supports:

* Attribute [@class-ref](#references-by-class-class-ref-attribute) (nominal data type `NMTOKENS`) (optional)
* Attribute [@id-ref](#references-by-id-id-ref-attribute) (nominal data type `NCName`) (optional)
* Attribute [@item-name](#references-by-name-item-name-attribute) (nominal data type `NMTOKENS`) (optional) 

Use `@class-ref`, `@id-ref` or `@item-name` to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [&lt;alter>](#alteration-alter-element) element. 

To change an element, use [&lt;remove>](#removal-remove-element) to remove the element, then [&lt;add>](#addition-add-element) to add it back again with changes.  

## Addition: `<add>` element

New contents to be spliced into controls or subcontrols, in resolution

The `<add>` element has the following contents (in order):

* Attribute [@position](#position-position-attribute) (optional) 
* A [&lt;title>](#) element (one) 
* [&lt;param>](#) elements (zero or more) 
* [&lt;prop>](#) elements (zero or more) 
* [&lt;link>](#) elements (zero or more) 
* [&lt;part>](#) elements (zero or more) 
* A [&lt;references>](#) element (zero or one)  

## Control ID: `@control-id` attribute 

Value of the 'id' flag on a target control  

## Include control with subcontrol: `@with-control` attribute 

Whether a control should be implicitly included, if not called.  

## Include subcontrols with control: `@with-subcontrols` attribute 

Whether subcontrols should be implicitly included, if not called.  

## Control ID: `@subcontrol-id` attribute 

Value of the 'id' flag on a target subcontrol  

## Pattern: `@pattern` attribute 

A regular expression matching the IDs of one or more controls or subcontrols to be selected  

## Pattern: `@order` attribute 

A regular expression matching the IDs of one or more controls or subcontrols to be selected  

## Position: `@position` attribute 

Where to add the new content with respect to the targeted element (beside it or inside it)  

## References by class: `@class-ref` attribute 

Items to remove, by class  

## References by ID: `@id-ref` attribute 

Items to remove, by ID  

## References by name: `@item-name` attribute 

Items to remove, by item type (name), e.g. title or prop  