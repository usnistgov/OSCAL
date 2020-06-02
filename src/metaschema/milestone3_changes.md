# Changes from Milestone 2 to Milestone 3 OSCAL

## Reading the change log

The models are described using OSCAL Metaschema terminology. Depending on the OSCAL representation you prefer (for example, XML or JSON), the object in question may be represented as a labeled property or unlabeled array member (in JSON) or as an element or attribute (XML). Similarly, in either case it may be an object with or without a nominal data value associated (such as at leaf nodes of the nominal information network), or alternatively a composite of other objects.

Refer to docs on Metaschema language and mappings into data objects, especially  
[Terminology](https://pages.nist.gov/metaschema/specification/concepts/terminology/)
and 
[Mapping](https://pages.nist.gov/metaschema/specification/mapping/)

In the change log below there are several types of entries. One type describes structures or data objects (assemblies, fields and flags) defined for the Milestone 3 (latest) version of the schemas, which have changed definitions from the earlier (Milestone 2) version of the schema(s) in question. Note that many of these changes (especially to `metadata` and `back-matter`) occur in shared metaschema modules, so they take effect across schemas.

Another type of entry described a new structure (field, flag or assembly) added to the Milestone 3 schemas, that has no direct correlate in Milestone 2.

Several global changes have been described in another type of entry.

Users of object notations should take note that individual objects described in the metaschema model may, when serialized as JSON, take the form of array members without keys, the semantic key (a *grouping* key) being assigned to the group of like objects. So a `prop` object defined in the metaschema appears in the JSON as a member of an object `properties`.

### Notation

In the change log, `[M2]` refers to the Milestone 2 model. Flags, assemblies and fields that have been removed *appear in italics*.

`[M3]` refers to the Milestone 3 model. Flags, assemblies and fields that have been added (do not appear in M2) are in **bold**.


-----

## `metadata` changes (all models)

Milestone 3 has two assemblies in the metadata, **revision** for tracking a revision history, and **location**, an abstraction (and alternative) to the older address modeling.

\[M2] model: title (field), published? (field), last-modified (field), version (field), oscal-version (field), doc-id* (field), prop* (field), link* (field), role* (assembly), party* (assembly), responsible-party* (assembly), remarks? (field)

\[M3] model: title (field), published? (field), last-modified (field), version (field), oscal-version (field), **revision\* (assembly)**, doc-id* (field), prop* (field), link* (field), role* (assembly), **location\* (assembly)**, party* (assembly), responsible-party* (assembly), remarks? (field)

## `back-matter` changes (all models)

In the back matter, the old `citation` element has been refactored as a special case of `resource`.

\[M2] model: citation* (assembly), resource* (assembly)

\[M3] model: resource* (assembly)

## New `revision` assembly: Revision History Entry (all models)

Tracking revisions can now be done by capturing a snapshot of metadata at an earlier point, potentially with properties or remarks added to indicate revision status or purpose.

\[M3] model: title? (field), published? (field), last-modified? (field), version? (field), oscal-version? (field), prop* (field), link* (field), remarks? (field)

## New `location` assembly: Location (all models)

A new assembly permits factoring out geographic or contact information (an address or contact point) into a separate data structure, for reference using its `uuid` flag.

\[M3] model: title? (field), address (assembly), email* (field), phone* (field), url* (field), prop* (field), annotation* (assembly), link* (field), remarks? (field)

## New `location-uuid`: Location Reference

## `party` changes (all models)

`party` is for **Party (organization or person)**. It has been refactored to reflect the (somewhat arbitrary) 'organization' vs 'person' distinction into a `type` flag.

Where before, we had an `id` flag, now we have `uuid`. We also have `type`, a flag whose value can capture "person" or "organization".

We also have new fields for linking to other assemblies, including `member-of-organization`. Instead of `org-name` and `person-name` we simply have `party-name`.

\[M2] flags: id? (flag)

\[M3] flags: uuid? (flag), type? (flag)

\[M2] model: *person\* (assembly)*, *org? (assembly)*, prop* (field), annotation* (assembly), link* (field), remarks? (field)

\[M3] model: **party-name (field)**, short-name? (field), **external-id\* (field)**, prop* (field), annotation* (assembly), link* (field), **address\* (assembly), email\* (field), phone\* (field)**, **member-of-organization* (field), location-uuid* (field)**, remarks? (field)

## New field `party-uuid`: Party Reference

## New field `external-id`: Personal Identifier
 
## New field `member-of-organization`: Organizational Affiliation

## New field `party-name`: Party Name

Replaces `org-name` and `person-name` from the M2 model.

## Refactored `resource`: Resource

The old `citation` assembly is now a child, not a sibling of resource within `back-matter`. As such it has been remodeled to support as much specialized citation information as may be available for a resource.

\[M2] flag: id? (flag)

\[M3] flags: uuid? (flag)

\[M2] model: desc? (field), prop* (field), (A choice: rlink* (assembly), base64? (field) ) , remarks? (field)

\[M3] model: **title? (field)**, desc? (field), prop* (field), **doc-id\* (field)**, **citation? (assembly)**, rlink* (assembly), base64* (field), remarks? (field), **(any)**

New assemblies and fields to support the citation model.

## New field `text`: Biblographic Text

A plain-text capture of a bibliographic citation.

## New assembly `biblio`: Bibliographic Definition

A structured representation of a bibliographic resource (an extension point).

## `citation` changes

A `citation` now appears only as a child of a `resource`.

\[M2] flag: id? (flag)

\[M3] flag: \[none]

\[M2] model: *target\* (field), title? (field), desc? (field), doc-id\* (field)*, prop* (field), ? (any)

\[M3] model: **text (field)**, prop* (field), biblio? (assembly)

## `system-implementation` changes

An assembly for `leveraged-authorization` has been added. `leveraged-authorization` used to be in `system-characteristics`.

\[M2] model: prop\* (field), annotation\* (assembly), link\* (field), user* (assembly), component\* (assembly), *service*\* (assembly), *interconnection*\* (assembly), system-inventory? (assembly), remarks? (field)

\[M3] model: prop\* (field), annotation\* (assembly), link\* (field), **leveraged-authorization**\* (assembly), user* (assembly), component\* (assembly), system-inventory? (assembly), remarks? (field)


##  `component` changes

The component assembly has been remodeled to permit greater generality and expressiveness. New assemblies include `title`, `purpose`, and `protocol`.

\[M2] flags: : *id*? (flag), name? (flag), component-type? (flag)

\[M3] flags: **uuid**? (flag), component-type? (flag)

\[M2] model: description (field), prop\* (field), annotation\* (assembly), link\* (field), status (assembly), responsible-role\* (assembly), remarks? (field)

\[M3] model: **title** (field), description (field), **purpose**? (field), prop\* (field), annotation\* (assembly), link\* (field), status (assembly), responsible-role\* (assembly), **protocol**\* (assembly), remarks? (field)

## Rename `set-param` to `set-parameter`

In profile SSP models, the assembly used to set a parameter is consistently called `set-parameter`.

## Change to `add`: Addition (profile model)

A new `id-ref` flag permits targeting an addition to a particular object (branch) within the structure addressed for addition. Additionally, an `annotation` element may also be added.

\[M2] flag: position? (flag)

\[M3] flags: position? (flag), **id-ref**? (flag)

\[M2] model: title? (field), param\* (assembly), prop\* (field), link\* (field), part\* (assembly)

\[M3] model: title? (field), param\* (assembly), prop\* (field), **annotation**\* (assembly), link\* (field), part\* (assembly)

## Changing `name` flag to `title` field

On several assemblies, what had been represented with a `name` flag is now represented with a `title` field, which permits inline markup.

`title` now appears in these assemblies: `metadata`, `revision`, `location`, `resource`, `role`, `information-type`, `leveraged-authorization`, `user`, `authorized-privilege`, `component`, and `protocol`.

## Changes of ID to UUID

A number of assemblies that used to carry `id` flags now carry `uuid` flags instead. These include (in the SSP model) : `location`, `party`, `resource`, `diagram`, `user`, `component`, `protocol`, `inventory-item`, `implemented-requirement`, `statement`, and `by-component`. In all models, it includes `location`, `party`, and `resource`. Finally, the full assemblies `catalog`, `profile` and `system-security-plan` fall into this category.

Similarly, flags and fields that are named to indicate they provide a point of reference, are now renamed `-uuid` reflecting when their references is given specifically as a `uuid` (and validated as such) not as an `id`. These include `location-uuid` and `party-uuid`.
