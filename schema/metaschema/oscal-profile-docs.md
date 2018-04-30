 

# OSCAL Profile Metaschema 

## Define assembly `profile` (group as `profiles`)

Supports (optionally) an id flag 

#### [Formal name] Profile 

In reference to a catalog (or other resource such as profile or framework), a selection and configuration of controls, maintained separately 

#### Remarks 

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([import](#define-assembly-import-group-as-imports)), merged or (re)structured ([merge](#define-assembly-merge)), and emended ([modify](#define-assembly-modify-group-as-modifys)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.  

#### Contents (in order):
 
* Any number of `imports`, named [import](#define-assembly-import-group-as-imports) 
* A [merge](#define-assembly-merge) 
* A [modify](#define-assembly-modify-group-as-modifys)   

## Define assembly `import` (group as `imports`)

Supports (optionally) an id flag 

#### [Formal name] Import resource 

Designating a catalog, profile or other resource for controls 

#### Remarks 

An [import](#define-assembly-import-group-as-imports) indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports. In the latter case, profiles are expected to be resolved recursively. 

The contents of the [import](#define-assembly-import-group-as-imports) element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [include](#define-assembly-include-group-as-includes) element) or de-selected (using an [exclude](#define-assembly-exclude-group-as-excludes) element) from the source catalog or profile. 

When no [include](#define-assembly-include-group-as-includes) is given (whether an [exclude](#define-assembly-exclude-group-as-excludes) is given or not), an [include](#define-assembly-include-group-as-includes)/[all](#define-field-all) is assumed (that is, all controls will be included by default). So an empty [import](#define-assembly-import-group-as-imports) implies [include](#define-assembly-include-group-as-includes)/[all](#define-field-all) indicating all controls are to be included.  

#### Contents (in order):
 
* An [include](#define-assembly-include-group-as-includes) 
* An [exclude](#define-assembly-exclude-group-as-excludes)   

## Define assembly `merge`

Supports (optionally) an id flag 

#### [Formal name] Merge controls 

Merge controls in resolution 

#### Remarks 

Indicates (by its presence) that controls included in a profile via different and multiple import pathways, are to be merged in resolution. Element contents of the [merge](#define-assembly-merge) can be used to "reorder" or "restructure" controls (that is, indicate their order and/or structure in resolution). 

Implicitly, a merge statement is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a merge statement, will not be merged into (will be dropped) in the resulting resolution.  

#### Contents (in order):
 
* A [combine](#define-field-combine) 
* A choice between  
  * An [as-is](#define-field-as-is) 
  * A [custom](#define-assembly-custom-group-as-customs)    

## Define field `combine`

Supports (optionally) an id flag 

Supports flag [method](#define-flag-method-nominal-data-type-string) 

#### [Formal name] Combination rule 

Whether and how to combine multiple (competing) versions of the same control  

## Define field `as-is`

True whenever given (presence signifies Boolean value)

Supports (optionally) an id flag 

#### [Formal name] As is 

Merge controls into groups reflecting their catalog(s) of origin  

## Define flag `method` (nominal data type `string`) 

#### [Formal name] Combination method 

How clashing controls and subcontrols should be handled  

## Define assembly `custom` (group as `customs`)

Supports (optionally) an id flag 

#### [Formal name] Custom grouping 

A defined (re)organization for controls; nb serves as another selector as well as sorter 

#### Contents :
 
* A choice between  
  * Any number of `groups`, named [group](#define-assembly-group-group-as-groups) 
  * Any number of `id-selectors`, named [call](#define-field-call-group-as-id-selectors) 
  * Any number of `pattern-selectors`, named [match](#define-field-match-group-as-pattern-selectors)    

## Define assembly `group` (group as `groups`)

Supports (optionally) an id flag 

#### [Formal name] Control group 

As in catalogs, a group of (selected) controls or of groups of controls 

#### Contents :
 
* A choice between  
  * Any number of `groups`, named [group](#define-assembly-group-group-as-groups) 
  * Any number of `id-selectors`, named [call](#define-field-call-group-as-id-selectors) 
  * Any number of `pattern-selectors`, named [match](#define-field-match-group-as-pattern-selectors)    

## Define assembly `modify` (group as `modifys`)

Supports (optionally) an id flag 

#### [Formal name] Modify controls 

Set parameters or emend controls in resolution 

#### Contents (in order):
 
* Any number of `param-settings`, named [set-param](#define-assembly-set-param-group-as-param-settings) 
* Any number of `alterations`, named [alter](#define-assembly-alter-group-as-alterations)   

## Define assembly `include` (group as `includes`)

Supports (optionally) an id flag 

#### [Formal name] Include controls 

Which controls and subcontrols to include from the resource (source catalog) being imported 

#### Remarks 

To be schema-valid, this element must contain either (but not both) a single [all](#define-field-all) element, or a sequence of [call](#define-field-call-group-as-id-selectors) elements. 

If this element is not given, it is assumed to be present with contents [all](#define-field-all) (qv); i.e., all controls are included by default, unless the [include](#define-assembly-include-group-as-includes) instruction calls controls specifically.  

#### Contents :
 
* A choice between  
  * An [all](#define-field-all) 
  * Any number of `id-selectors`, named [call](#define-field-call-group-as-id-selectors) 
  * Any number of `pattern-selectors`, named [match](#define-field-match-group-as-pattern-selectors)    

## Define field `all`

Supports (optionally) an id flag 

Supports flag [with-subcontrols](#define-flag-with-subcontrols-nominal-data-type-ncname) 

#### [Formal name] Include all 

Include all controls from the imported resource (catalog) 

#### Remarks 

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [include](#define-assembly-include-group-as-includes) element is given in an [import](#define-assembly-import-group-as-imports); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`    

## Define field `call` (group as `id-selectors`)

Supports (optionally) an id flag 

Supports flag [control-id](#define-flag-control-id-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [subcontrol-id](#define-flag-subcontrol-id-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [with-control](#define-flag-with-control-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [with-subcontrols](#define-flag-with-subcontrols-nominal-data-type-ncname) (nominal data type `NCName`) 

#### [Formal name] Call (control or subcontrol) 

Call a control or subcontrol by its ID 

#### Remarks 

Inside [include](#define-assembly-include-group-as-includes), If `@control-id` is used (to indicate the control being referenced), `@subcontrol-id` cannot be used, and vice versa. (A single [call](#define-field-call-group-as-id-selectors) element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id` not with `@subcontrol-id`. 

If `@with-subcontrols` is "yes" on the call to a control, no sibling [call](#define-field-call-group-as-id-selectors)elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.   

## Define field `match` (group as `pattern-selectors`)

Supports (optionally) an id flag 

Supports flag [pattern](#define-flag-pattern-nominal-data-type-string) 

Supports flag [order](#define-flag-order-nominal-data-type-ncname) 

Supports flag [with-control](#define-flag-with-control-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [with-subcontrols](#define-flag-with-subcontrols-nominal-data-type-ncname) (nominal data type `NCName`)

#### [Formal name] Match controls and subcontrols by identifier 

Select controls by (regular expression) match on ID  

## Define assembly `exclude` (group as `excludes`)

Supports (optionally) an id flag 

#### [Formal name] Exclude controls 

Which controls and subcontrols to exclude from the resource (source catalog) being imported 

#### Remarks 

Use this as an alternative to [include](#define-assembly-include-group-as-includes) when all controls are to be included by default, and the profile wishes only to filter (remove) controls.  

#### Contents :
 
* A choice between  
  * Any number of `id-selectors`, named [call](#define-field-call-group-as-id-selectors) 
  * Any number of `pattern-selectors`, named [match](#define-field-match-group-as-pattern-selectors)    

## Define assembly `set-param` (group as `param-settings`)

Flag [id](#) is required 

Supports flag [class](#) 

Supports flag [depends-on](#) (nominal data type `IDREF`) 

#### [Formal name] Parameter Setting 

 A parameter setting, to be propagated to points of insertion  

#### Contents (in order):
 
* A [label](#) 
* Any number of `descriptions`, named [desc](#) 
* Any number of `constraints`, named [constraint](#) 
* A choice between  
  * A [value](#) 
  * A [select](#)  
* Any number of `links`, named [link](#) 
* Any number of `parts`, named [part](#)   

## Define assembly `alter` (group as `alterations`)

Supports (optionally) an id flag 

Supports flag [control-id](#define-flag-control-id-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [subcontrol-id](#define-flag-subcontrol-id-nominal-data-type-ncname) (nominal data type `NCName`) 

#### [Formal name] Alteration 

Generalized modifications to controls or subcontrols as expressed in a profile 

#### Remarks 

For modifying parameters, use [set-param](#define-assembly-set-param-group-as-param-settings), which will provides traceability.  

#### Contents (in order):
 
* Any number of `removals`, named [remove](#define-field-remove-group-as-removals) 
* Any number of `additions`, named [add](#define-assembly-add-group-as-additions)   

## Define field `remove` (group as `removals`)

Supports (optionally) an id flag 

Supports flag [class-ref](#define-flag-class-ref-nominal-data-type-nmtokens) (nominal data type `NMTOKENS`) 

Supports flag [id-ref](#define-flag-id-ref-nominal-data-type-ncname) (nominal data type `NCName`) 

Supports flag [item-name](#define-flag-item-name-nominal-data-type-nmtokens) (nominal data type `NMTOKENS`) 

#### [Formal name] Removal 

Elements to be removed from a control or subcontrol, in resolution 

#### Remarks 

Use `@class-ref`, `@id-ref` or `@item-name` to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [alter](#define-assembly-alter-group-as-alterations) element. 

To change an element, use [remove](#define-field-remove-group-as-removals) to remove the element, then [add](#define-assembly-add-group-as-additions) to add it back again with changes.   

## Define assembly `add` (group as `additions`)

Supports (optionally) an id flag 

Supports flag [position](#define-flag-position-nominal-data-type-ncname) 

#### [Formal name] Addition 

New contents to be spliced into controls or subcontrols, in resolution 

#### Contents (in order):
 
* A [title](#) (required) 
* Any number of `params`, named [param](#) 
* Any number of `props`, named [prop](#) 
* Any number of `links`, named [link](#) 
* Any number of `parts`, named [part](#) 
* A [references](#)   

## Define flag `control-id` (nominal data type `NCName`) 

#### [Formal name] Control ID 

Value of the 'id' flag on a target control  

## Define flag `with-control` (nominal data type `NCName`) 

#### [Formal name] Include control with subcontrol 

Whether a control should be implicitly included, if not called.  

## Define flag `with-subcontrols` (nominal data type `NCName`) 

#### [Formal name] Include subcontrols with control 

Whether subcontrols should be implicitly included, if not called.  

## Define flag `subcontrol-id` (nominal data type `NCName`) 

#### [Formal name] Control ID 

Value of the 'id' flag on a target subcontrol  

## Define flag `pattern` (nominal data type `string`) 

#### [Formal name] Pattern 

A regular expression matching the IDs of one or more controls or subcontrols to be selected  

## Define flag `order` (nominal data type `NCName`) 

#### [Formal name] Pattern 

A regular expression matching the IDs of one or more controls or subcontrols to be selected  

## Define flag `position` (nominal data type `NCName`) 

#### [Formal name] Position 

Where to add the new content with respect to the targeted element (beside it or inside it)  

## Define flag `class-ref` (nominal data type `NMTOKENS`) 

#### [Formal name] References by class 

Items to remove, by class  

## Define flag `id-ref` (nominal data type `NCName`) 

#### [Formal name] References by ID 

Items to remove, by ID  

## Define flag `item-name` (nominal data type `NMTOKENS`) 

#### [Formal name] References by name 

Items to remove, by item type (name), e.g. title or prop  