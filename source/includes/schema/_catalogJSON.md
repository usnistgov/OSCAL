## Catalog JSON Schema

The topmost elements in the OSCAL catalog JSON schema are [`"catalog"`](#catalog-name), [`"framework"`](#framework-and-worksheet-names), and [`"worksheet"`](#framework-and-worksheet-names).

### `"catalog"` name

Each OSCAL catalog is defined by a `"catalog"` name. A `"catalog"` name may contain the following:

* `"title"`
* [`"declarations"`](#declarations-name)
* [`"sections"`](#sections-name)
* [`"groups"`](#groups-name)
* [`"controls"`](#controls-name)
* [`"references"`](#references-name)

### `"framework"` and `"worksheet"` names

The `"framework"` name is used to define a formal framework. OSCAL also offers the `"worksheet"` name, which is used to define an informal, ad hoc framework. The expectation is that the `"framework"` name will be used when a standards organization or other formal body wants to define a published framework, while the `"worksheet"` name will be used by organizations creating frameworks for their own use.

Both `"framework"` and `"worksheet"` names may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"declarations"`](#declarations-name)
* [`"sections"`](#sections-name)
* [`"categories"`](#categories-name)
* [`"items"`](#items-name)
* [`"references"`](#references-name)

### `"sections"` name

Catalogs, frameworks, and worksheets may use `"sections"` names for partitioning. A `"sections"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* `"prose"`
* `"sections"`
* [`"groups"`](#groups-name)
* [`"references"`](#references-name)

### `"groups"` name

Catalogs may use `"groups"` names to reference related controls or control groups. `"groups"` names may have their own properties, statements, parameters, references, etc., which are inherited by all members of the group. A `"groups"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"props"`](#props-name)
* [`"parts"`](#parts-name)
* [`"links"`](#links-name)
* [`"params"`](#params-name)
* [`"groups"`](#groups-name)
* [`"references"`](#references-name)

#### `"categories"` name

A `"categories"` name specifies a group of related controls or a group of groups of such controls for a framework or worksheet. A `"categories"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"props"`](#props-name)
* [`"links"`](#links-name)
* `"prose"`
* either `"categories"` or [`"items"`](#items-name) 

#### `"items"` name

An `"items"` name specifies TBD. An `"items"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"params"`](#params-name)
* [`"props"`](#props-name)
* [`"links"`](#links-name)
* `"prose"`
* [`"parts"`](#parts-name)
* `"items"`

##### `"links"` name

A `"links"` name is a line or paragraph with a hypertext link. A `"links"` name may contain the following:

* `"rel"`
* `"href"`
* `"value"`

##### `"params"` name

A `"params"` name is a parameter setting to be propagated to one or more points of insertion. A `"params"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"desc"`, which indicates and explains the purpose and use of the parameter
* `"value"`

##### `"parts"` name

A `"parts"` name is a partition, piece, or section of a control, subcontrol, or another part. A `"parts"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* `"prose"`
* [`"props"`](#props-name)
* `"parts"`
* [`"links"`](#links-name)
* [`"params"`](#params-name)

##### `"props"` name

A `"props"` name is a value with a name. It is attributed to the containing control, subcontrol, part, or group. A `"props"` name may contain the following:

* `"requiredClass"`
* `"value"`

### `"controls"` name

Each security or privacy control within the catalog is defined by a `"controls"` name. A `"controls"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"props"`](#props-name)
* [`"parts"`](#parts-name)
* [`"links"`](#links-name)
* [`"params"`](#params-name)
* [`"subcontrols"`](#subcontrols-name)
* [`"references"`](#references-name)

### `"subcontrols"` name

A `"subcontrols"` name is very similar to a `"controls"` name in its composition. A `"subcontrols"` name may contain the following:

* `"id"`
* `"optionalClass"`
* `"title"`
* [`"props"`](#props-name)
* [`"parts"`](#parts-name)
* [`"links"`](#links-name)
* [`"params"`](#params-name)
* [`"references"`](#references-name)

### `"references"` name

A `"references"` name contains one or more reference descriptions, each contained within a `"ref"` name. Each `"ref"` name may contain the following:

* `"id"`
* `"standards"` (citation of a formal published standard; comprised of `"href"` and `"value"`)
* `"citations"` (citation of a resource; comprised of `"href"` and `"value"`)
* `"prose"`

### `"declarations"` name

A `"declarations"` name is used for extra-schema validation of data given within controls or framework components. More information on this will be added to the documentation in the future.
