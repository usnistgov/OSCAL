 

## OSCAL Profile Metaschema: JSON Schema 

The short name (file identifier) for this schema shall be oscal-profile. It is used internally when an identifier is called for, and may appear in file names of schema artifacts.  

A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost element in the OSCAL profile XML schema is [profile](#profile-profile-object).  

### Profile: `profile` object

Each OSCAL profile is defined by a Profile element

A [profile](#profile-profile-object) will appear as an object, a property of the root object.

A [profile](#profile-profile-object) object has the following properties:
 
* An array `imports` containing [import](#import-resource-import-object) data items  
* A [merge](#merge-controls-merge-object) object  
* A [modify](#modify-controls-modify-object) object   

An OSCAL document that describes a selection with possible modification of multiple controls from multiple catalogs. It provides mechanisms by which controls may be selected ([import](#import-resource-import-object)), merged or (re)structured ([merge](#merge-controls-merge-object)), and emended ([modify](#modify-controls-modify-object)). OSCAL profiles may select subsets of control sets, set parameter values for them in application, and even qualify the representation of controls and subcontrols as given in and by a catalog. They may also serve as sources for further modification in and by other profiles, that import them.  

### Import resource: `import` object

An Import element designates a catalog, profile, or other resource to be included (referenced and potentially modified) by this profile.

An [import](#import-resource-import-object) will appear as a data value in an array property.

An [import](#import-resource-import-object) object has the following properties:

* String [href](#) 
* An [include](#include-controls-include-object) object  
* An [exclude](#exclude-controls-exclude-object) object   

An `import` indicates a source whose controls are to be included (referenced and modified) in a profile. This source will either be a catalog whose controls are given ("by value"), or a profile with its own control imports (with possible settings. 

The contents of the `import` element indicate which controls and subcontrols from the source, will be included. Controls and subcontrols may be either selected (using an [include](#include-controls-include-object) element) or de-selected (using an [exclude](#exclude-controls-exclude-object) element) from the source catalog or profile. 

When no [include](#include-controls-include-object) is given (whether an [exclude](#exclude-controls-exclude-object) is given or not), an [include](#include-controls-include-object)/[all](#include-all-all-object) is assumed (that is, all controls will be included by default). 

```json
  { "href" : "catalog.xml",
    "include" : 
    { "id-selectors" : 
      [ 
        { "control-id" : "ac-1" } ] } }
```
 

### Merge controls: `merge` object

A Merge element merges controls in resolution.

A [merge](#merge-controls-merge-object) will appear as a property on an object.

As an explicit property, `merge` appears on [profile](#profile-profile-object).

A [merge](#merge-controls-merge-object) object has the following properties:
 
* A [combine](#combination-rule-combine-object) object  
* A choice between  
  * An [as-is](#as-is-as-is-object) object  
  * A [custom](#custom-grouping-custom-object) object    

The contents of the `merge` element may be used to "reorder" or "restructure" controls by indicating an order and/or structure in resolution. 

Implicitly, a `merge` element is also a filter: controls that are included in a profile, but not included (implicitly or explicitly) in the scope of a `merge` element, will not be merged into (will be dropped) in the resulting resolution.  

### Combination rule: `combine` object

A Combine element defines whether and how to combine multiple (competing) versions of the same control

A [combine](#combination-rule-combine-object) will appear as a property on an object.

As an explicit property, `combine` appears on [merge](#merge-controls-merge-object).

The `combine` object has a property:

* String [method](#combination-method-method-object) 

Whenever combining controls from multiple (import) pathways, an issue arises of what to do with clashing invocations (multiple competing versions of a control or a subcontrol).  

This setting permits a profile designer to apply a rule for the resolution of such cases. In a well-designed profile, such collisions would ordinarily be avoided, but this setting can be useful for defining what to do when it occurs.  

### As is: `as-is` object

An As-is element indicates that the controls should be structured in resolution as they are structured in their source catalogs. It does not contain any elements or attributes.

`as-is` will appear as a string property.

As an explicit property, `as-is` appears on [merge](#merge-controls-merge-object).

`as-is` takes a Boolean value. 

### Combination method: `method` object 

How clashing controls and subcontrols should be handled 

`method` will appear as a string property except as noted.

As an explicit property, `method` appears on [combine](#combination-rule-combine-object). 

### Custom grouping: `custom` object

A Custom element frames a structure for embedding represented controls in resolution.

A [custom](#custom-grouping-custom-object) will appear as a property on an object.

As an explicit property, `custom` appears on [merge](#merge-controls-merge-object).

A [custom](#custom-grouping-custom-object) object has the property
 
* A choice between  
  * An array `groups` containing [group](#control-group-group-object) data items  
  * An array `id-selectors` containing [call](#call-control-or-subcontrol-call-object) data items  
  * An array `pattern-selectors` containing [match](#match-controls-and-subcontrols-by-identifier-match-object) data items    

The `custom` element represents a custom arrangement or organization of controls in the resolution of a catalog.  

While the [as-is](#as-is-as-is-object) element provides for a restitution of a control set's organization (in one or more source catalogs), this element permits the definition of an entirely different structure.  

### Control group: `group` object

As in catalogs, a group of (selected) controls or of groups of controls

A [group](#control-group-group-object) will appear as a data value in an array property.

A [group](#control-group-group-object) object has the property
 
* A choice between  
  * An array `groups` containing [group](#control-group-group-object) data items  
  * An array `id-selectors` containing [call](#call-control-or-subcontrol-call-object) data items  
  * An array `pattern-selectors` containing [match](#match-controls-and-subcontrols-by-identifier-match-object) data items    

### Modify controls: `modify` object

Set parameters or amend controls in resolution

A [modify](#modify-controls-modify-object) will appear as a property on an object.

As an explicit property, `modify` appears on [profile](#profile-profile-object).

A [modify](#modify-controls-modify-object) object has the following properties:
 
* An array `param-settings` containing [set-param](#parameter-setting-set-param-object) data items  
* An array `alterations` containing [alter](#alteration-alter-object) data items   

### Include controls: `include` object

Specifies which controls and subcontrols to include from the resource (source catalog) being imported

An [include](#include-controls-include-object) will appear as a property on an object.

As an explicit property, `include` appears on [import](#import-resource-import-object).

An [include](#include-controls-include-object) object has the property
 
* A choice between  
  * An [all](#include-all-all-object) object  
  * An array `id-selectors` containing [call](#call-control-or-subcontrol-call-object) data items  
  * An array `pattern-selectors` containing [match](#match-controls-and-subcontrols-by-identifier-match-object) data items    

To be schema-valid, this element must contain either (but not both) a single [all](#include-all-all-object) element, or a sequence of [call](#call-control-or-subcontrol-call-object) elements. 

If this element is not given, it is assumed to be present with contents [all](#include-all-all-object) (qv); i.e., all controls are included by default, unless the `include` instruction calls controls specifically.  

### Include all: `all` object

Include all controls from the imported resource (catalog)

An [all](#include-all-all-object) will appear as a property on an object.

As an explicit property, `all` appears on [include](#include-controls-include-object).

The `all` object has a property:

* String [with-subcontrols](#include-subcontrols-with-control-with-subcontrols-object) 

This element provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [include](#include-controls-include-object) element is given in an [import](#import-resource-import-object); so ordinarily one might not see this element unless it is for purposes of including its `@with-subcontrols='yes'`   

### Call (control or subcontrol): `call` object

Call a control or subcontrol by its ID

A [call](#call-control-or-subcontrol-call-object) will appear as a data value in an array property.

The `call` object has properties:

* String [control-id](#control-id-control-id-object)
* String [subcontrol-id](#control-id-subcontrol-id-object)
* String [with-control](#include-control-with-subcontrol-with-control-object)
* String [with-subcontrols](#include-subcontrols-with-control-with-subcontrols-object) 

Inside [include](#include-controls-include-object), If `@control-id` is used (to indicate the control being referenced), `@subcontrol-id` cannot be used, and vice versa. (A single `call` element is used for each control.) This constraint is enforced by the schema. Likewise, `@with-subcontrols` can be used only along with `@control-id` not with `@subcontrol-id`. 

If `@with-subcontrols` is "yes" on the call to a control, no sibling `call`elements need to be used to call its subcontrols. Accordingly it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.  

### Match controls and subcontrols by identifier: `match` object

Select controls by (regular expression) match on ID

A [match](#match-controls-and-subcontrols-by-identifier-match-object) will appear as a data value in an array property.

The `match` object has properties:

* String [pattern](#pattern-pattern-object)
* String [order](#pattern-order-object)
* String [with-control](#include-control-with-subcontrol-with-control-object)
* String [with-subcontrols](#include-subcontrols-with-control-with-subcontrols-object) 

### Exclude controls: `exclude` object

Which controls and subcontrols to exclude from the resource (source catalog) being imported

An [exclude](#exclude-controls-exclude-object) will appear as a property on an object.

As an explicit property, `exclude` appears on [import](#import-resource-import-object).

An [exclude](#exclude-controls-exclude-object) object has the property
 
* A choice between  
  * An array `id-selectors` containing [call](#call-control-or-subcontrol-call-object) data items  
  * An array `pattern-selectors` containing [match](#match-controls-and-subcontrols-by-identifier-match-object) data items    

Within `exclude`, [all](#include-all-all-object) is not an option since it makes no sense. However, it also makes no sense to use exclude/call except with include/all; you would not want to include and exclude something by ID simultaneously. If this happens, an error condition will be reported.  

### Parameter Setting: `set-param` object

 A parameter setting, to be propagated to points of insertion 

A [set-param](#parameter-setting-set-param-object) will appear as a data value in an array property.

A [set-param](#parameter-setting-set-param-object) object has the following properties:

* String [class](#)
* String [depends-on](#) 
* A [label](#) object  
* An array `descriptions` containing [desc](#) data items  
* An array `constraints` containing [constraint](#) data items  
* A choice between  
  * A [value](#) object  
  * A [select](#) object   
* An array `links` containing [link](#) data items  
* An array `parts` containing [part](#) data items   

### Alteration: `alter` object

An Alter element specifies changes to be made to an included control or subcontrol when a profile is resolved.

An [alter](#alteration-alter-object) will appear as a data value in an array property.

An [alter](#alteration-alter-object) object has the following properties:

* String [control-id](#control-id-control-id-object)
* String [subcontrol-id](#control-id-subcontrol-id-object) 
* An array `removals` containing [remove](#removal-remove-object) data items  
* An array `additions` containing [add](#addition-add-object) data items   

Use `@control-id` or `@subcontrol-id` to indicate the scope of alteration. 

It is an error for two `alter` elements to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion. 

At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this element to match multiple control IDs could provide for this.  

### Removal: `remove` object

Specifies elements to be removed from a control or subcontrol, in resolution

A [remove](#removal-remove-object) will appear as a data value in an array property.

The `remove` object has properties:

* String [class-ref](#references-by-class-class-ref-object)
* String [id-ref](#references-by-id-id-ref-object)
* String [item-name](#references-by-name-item-name-object) 

Use `@class-ref`, `@id-ref` or `@item-name` to indicate class tokens or ID reference, or the formal name, of the component to be removed or erased from a control or subcontrol, when a catalog is resolved. The control or subcontrol affected is indicated by the pointer on the removal's parent (containing) [alter](#alteration-alter-object) element. 

To change an element, use `remove` to remove the element, then [add](#addition-add-object) to add it back again with changes.  

### Addition: `add` object

Specifies contents to be added into controls or subcontrols, in resolution

An [add](#addition-add-object) will appear as a data value in an array property.

An [add](#addition-add-object) object has the following properties:

* String [position](#position-position-object) 
* A [title](#) object  (required)  
* An array `params` containing [param](#) data items  
* An array `props` containing [prop](#) data items  
* An array `links` containing [link](#) data items  
* An array `parts` containing [part](#) data items  
* A [references](#) object   

### Control ID: `control-id` object 

Value of the 'id' flag on a target control 

`control-id` will appear as a string property except as noted.

As an explicit property, `control-id` appears on [call](#call-control-or-subcontrol-call-object) and [alter](#alteration-alter-object). 

### Include control with subcontrol: `with-control` object 

Whether a control should be implicitly included, if not called. 

`with-control` will appear as a string property except as noted.

As an explicit property, `with-control` appears on [call](#call-control-or-subcontrol-call-object) and [match](#match-controls-and-subcontrols-by-identifier-match-object). 

### Include subcontrols with control: `with-subcontrols` object 

Whether subcontrols should be implicitly included, if not called. 

`with-subcontrols` will appear as a string property except as noted.

As an explicit property, `with-subcontrols` appears on [all](#include-all-all-object), [call](#call-control-or-subcontrol-call-object) and [match](#match-controls-and-subcontrols-by-identifier-match-object). 

### Control ID: `subcontrol-id` object 

Value of the 'id' flag on a target subcontrol 

`subcontrol-id` will appear as a string property except as noted.

As an explicit property, `subcontrol-id` appears on [call](#call-control-or-subcontrol-call-object) and [alter](#alteration-alter-object). 

### Pattern: `pattern` object 

A regular expression matching the IDs of one or more controls or subcontrols to be selected 

`pattern` will appear as a string property except as noted.

As an explicit property, `pattern` appears on [match](#match-controls-and-subcontrols-by-identifier-match-object). 

### Pattern: `order` object 

A regular expression matching the IDs of one or more controls or subcontrols to be selected 

`order` will appear as a string property except as noted.

As an explicit property, `order` appears on [match](#match-controls-and-subcontrols-by-identifier-match-object). 

### Position: `position` object 

Where to add the new content with respect to the targeted element (beside it or inside it) 

`position` will appear as a string property except as noted.

As an explicit property, `position` appears on [add](#addition-add-object). 

### References by class: `class-ref` object 

Items to remove, by class 

`class-ref` will appear as a string property except as noted.

As an explicit property, `class-ref` appears on [remove](#removal-remove-object). 

### References by ID: `id-ref` object 

Items to remove, by ID 

`id-ref` will appear as a string property except as noted.

As an explicit property, `id-ref` appears on [remove](#removal-remove-object). 

### References by name: `item-name` object 

Items to remove, by item type (name), e.g. title or prop 

`item-name` will appear as a string property except as noted.

As an explicit property, `item-name` appears on [remove](#removal-remove-object). 