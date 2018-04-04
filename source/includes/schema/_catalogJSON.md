## Catalog JSON Schema

The topmost name in the OSCAL catalog JSON schema is [`"catalog"`](#code-quot-catalog-quot-code-name).

### `"catalog"` name

Each OSCAL catalog is defined by a `"catalog"` name. A `"catalog"` name may contain the following:

* `"title"`
* [`"declarations"`](#code-quot-declarations-quot-code-name)
* [`"sections"`](#code-quot-sections-quot-code-name)
* [`"groups"`](#code-quot-groups-quot-code-name)
* [`"controls"`](#code-quot-controls-quot-code-name)
* [`"references"`](#code-quot-references-quot-code-name)

### `"sections"` name

Catalogs may use `"sections"` names for partitioning. A `"sections"` name may contain the following:

* `"id"`
* `"class"`
* `"title"`
* `"prose"`
* `"sections"`
* [`"groups"`](#code-quot-groups-quot-code-name)
* [`"references"`](#code-quot-references-quot-code-name)

### `"groups"` name

Catalogs may use `"groups"` names to reference related controls or control groups. `"groups"` names may have their own properties, statements, parameters, and references, which are inherited by all members of the group. Unlike `"sections"` names, `"groups"` names may not contain arbitrary prose. A `"groups"` name may contain the following:

* `"id"`
* `"class"`
* `"title"`
* [`"props"`](#code-quot-props-quot-code-name)
* [`"parts"`](#code-quot-parts-quot-code-name)
* [`"links"`](#code-quot-links-quot-code-name)
* [`"params"`](#code-quot-params-quot-code-name)
* [`"groups"`](#code-quot-groups-quot-code-name) or [`"controls"`](#code-quot-controls-quot-code-name)
* [`"references"`](#code-quot-references-quot-code-name)

### `"controls"` name

Each security or privacy control within the catalog is defined by a `"controls"` name. A `"controls"` name may contain the following:

* `"id"`
* `"class"`
* `"title"`
* [`"props"`](#code-quot-props-quot-code-name)
* [`"parts"`](#code-quot-parts-quot-code-name)
* [`"links"`](#code-quot-links-quot-code-name)
* [`"params"`](#code-quot-params-quot-code-name)
* [`"subcontrols"`](#code-quot-subcontrols-quot-code-name)
* [`"references"`](#code-quot-references-quot-code-name)

### `"subcontrols"` name

A `"subcontrols"` name is very similar to a `"controls"` name in its composition. A `"subcontrols"` name may contain the following:

* `"id"`
* `"class"`
* `"title"`
* [`"props"`](#code-quot-props-quot-code-name)
* [`"parts"`](#code-quot-parts-quot-code-name)
* [`"links"`](#code-quot-links-quot-code-name)
* [`"params"`](#code-quot-params-quot-code-name)
* [`"references"`](#code-quot-references-quot-code-name)

#### `"props"` name

A `"props"` name is a value with a name. It is attributed to the containing control, subcontrol, part, or group. Properties permit the deployment and management of arbitrary controlled values, with and among control objects (controls and parts and extensions), for any purpose useful to an application or implementation of those controls. Typically and routinely, properties will be used to sort, select, order, and arrange controls or relate them to one another or to class hierarchies, taxonomies, or external authorities.

A `"props"` name may contain the following:

* `"class"`
* `"value"`

#### `"parts"` name

A `"parts"` name is a partition, piece, or section of a control, subcontrol, or another part. Generally speaking, `"parts"` names will be of two kinds. Many parts are logical partitions or sections for prose; these may be called "statements" and may be expected to have simple prose contents, even just one paragraph. Other parts may be more formally constructed out of properties (`"props"` names) and/or their own parts. Such structured objects (sometimes called "features") may, at the extreme, function virtually as control extensions or subcontrol-like objects ("enhancements"). Since the composition of parts can be constrained using OSCAL declarations (of the items or components to be given in a part or in this type of part), their use for encoding "objects" of arbitrary complexity within controls is effectively open-ended.

A `"parts"` name may contain the following:

* `"id"`
* `"class"`
* `"title"`
* `"prose"`
* [`"props"`](#code-quot-props-quot-code-name)
* `"parts"`
* [`"links"`](#code-quot-links-quot-code-name)
* [`"params"`](#code-quot-params-quot-code-name)

#### `"links"` name

A `"links"` name is a line or paragraph with a hypertext link. A `"links"` name may contain the following:

* `"rel"`
* `"href"`
* `"value"`

#### `"params"` name

A `"params"` name is a parameter setting to be propagated to one or more points of insertion. A `"params"` name may contain the following:

* `"id"`
* `"class"`
* `"desc"`, which indicates and explains the purpose and use of the parameter
* `"value"`

### `"references"` name

A `"references"` name contains one or more reference descriptions, each contained within a `"ref"` name. Each `"ref"` name may contain the following:

* `"id"`
* `"standards"` (citation of a formal published standard; comprised of `"href"` and `"value"`)
* `"citations"` (citation of a resource; comprised of `"href"` and `"value"`)
* `"prose"`

### `"declarations"` name

A `"declarations"` name is used for extra-schema validation of data given within controls. More information on this will be added to the documentation in the future.
