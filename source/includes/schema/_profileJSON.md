## Profile JSON Schema

A profile designates a selection and configuration of controls and subcontrols from one or more catalogs, along with a series of operations over the controls and subcontrols. The topmost name in the OSCAL profile XML schema is [`"profile"`](#code-quot-profile-quot-code-name).

### `"profile"` name

Each OSCAL profile is defined by a `"profile"` name. A `"profile"` name may contain the following:

* `"id"`
* `"title"`
* [`"invoke"`](#code-quot-invoke-quot-code-name) (one or more instances within the `"invocations"` name)

### `"invoke"` name

An `"invoke"` name designates a catalog, profile, or other resource to be included (referenced and potentially modified) by this profile. An `"invoke"` name may contain the following:

* `"href"`
* [`"include"`](#code-quot-include-quot-code-name)
* [`"exclude"`](#code-quot-exclude-quot-code-name)
* [`"paramSettings"`](#code-quot-paramSettings-quot-code-name)
* [`"alterations"`](#code-quot-alterations-quot-code-name)

The contents of the `"invoke"` name indicate which controls and subcontrols from the source will be included. Controls and subcontrols may be either selected (using an [`"include"`](#code-quot-include-quot-code-name) name) or deselected (using an [`"exclude"`](#code-quot-exclude-quot-code-name) name) from the source catalog or profile.

### `"include"` name

An `"include"` name specifies which controls and subcontrols to include from the resource (source catalog) being imported. An `"include"` name may contain the following:

* [`"all"`](#code-quot-all-quot-code-name)
* [`"calls"`](#code-quot-calls-quot-code-name)

If the `"include"` name is not specified, it is assumed to be present with contents [`"all"`](#code-quot-all-quot-code-name); i.e., all controls are included by default, unless the `"include"` name calls controls specifically.

#### `"all"` name

An `"all"` name includes all controls from the imported resource. An `"all"` name may contain the following:

* `"withSubcontrols"`, which specifies whether subcontrols should also be included (`yes` or `no`)

This name provides an alternative to calling controls and subcontrols individually from a catalog. But this is also the default behavior when no [`"include"`](#code-quot-include-quot-code-name) name is given in an [`"invoke"`](#code-quot-invoke-quot-code-name) name, so ordinarily one might not see the `"all"` name unless it is for purposes of specifying `"withSubcontrols"` as 'yes'.

#### `"calls"` name

A `"calls"` name calls a control or subcontrol by its ID. A `"calls"` name may contain the following:

* `"withSubcontrols"` and `"controlId"`
* `"subcontrolId"`

If `"withSubcontrols"` is "yes" on the call to a control, no sibling `"calls"` names need to be used to call its subcontrols. Accordingly, it may be more common to call subcontrols (enhancements) by ID only to exclude them, not to include them.

### `"exclude"` name

An `"exclude"` name specifies which controls and subcontrols to exclude from the resource (source catalog) being imported. An `"exclude"` name may contain the following:

* `"controlId"`
* `"subcontrolId"`

### `"paramSettings"` name

A `"paramSettings"` name sets a parameter's value or rewrites its description. A `"paramSettings"` name may contain the following:

* `"paramId"`
* `"class"`
* `"desc"`
* `"value"`

`"paramId"` indicates the parameter (within the scope of the referenced catalog or resource). The `"value"` name is used to provide a value for insertion of a value for the parameter when the catalog is resolved and rendered. A `"desc"` name can be presented (made available) to a calling profile – that is, it is a parameter description helping to set the parameter in higher layers, not this one (when profiles are expected to provide baselines, for example).

### `"alterations"` name

An `"alterations"` name specifies changes to be made to an included control or subcontrol when a profile is resolved. An `"alterations"` name may contain the following:

* `"controlId"` or `"subcontrolId"`
* [`"remove"`](#code-quot-remove-quot-code-name)
* [`"augment"`](#code-quot-augment-quot-code-name)

Use `"controlId"` or `"subcontrolId"` to indicate the scope of alteration.

It is an error for two `"alterations"` names to apply to the same control or subcontrol. In practice, multiple alterations can be applied (together), but it creates confusion.

At present, no provision is made for altering many controls at once (for example, to systematically remove properties or add global properties); extending this name to match multiple control IDs could provide for this.

#### `"remove"` name

A `"remove"` name specifies items to be removed from a control or subcontrol in resolution. A `"remove"` name may contain the following:

* `"targets"` to specify which items within controls or subcontrols are to be removed or erased from a control or subcontrol when a catalog is resolved

To change an item, use `"remove"` to remove the item, then [`"augment"`](#code-quot-augment-quot-code-name) to add it back again with changes.

#### `"augment"` name

An `"augment"` name specifies contents to be added to a control or subcontrols in resolution. An `"augment"` name may contain the following:

* `"props"`
* `"parts"`
