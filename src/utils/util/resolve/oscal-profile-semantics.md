## Profile Semantics

Three stages

### 1 Import (and selection)

More than one import of the same resource is a warning condition but not an error.

Processors can define for themselves what constitutes resource identity for these purposes.

Imports can specify controls by inclusion and exclusion.

All or some controls from a catalog are included in selection. (include/all)

There are two kinds of selections, "calls" and "matches". (include/call | include/match)

A call is a selection of a control by its ID.

A match is a selection of a control by matching its ID to a given match criterion.

Exclusions work the same way, except with the opposite effect - the indicated control(s) are dropped from the resource.

If a set of exclusions, but no inclusions, are given, "include all" should be assumed.

Any control that is both included and excluded, is excluded. This holds irrespective of the specifity of the selection for inclusion or exclusion. For example, if AC-1 is included by id 'ac-1' and excluded by matching 'ac*', it is excluded. Selection for exclusion prevails.


### 2 Merge - defines rules on how to arrange / manage controls

#### 2a How to deal with clashing controls (multiple invocation of controls with the same ID)
  
#### 2b How to built a structure

##### 2b1 "as is"

reproduce structure of input catalog

(consider case of multiple imports of single resource)

##### 2b2 "custom"

a structure is provided, and controls are selected again into it

(nb this means that import/all with selection here also works)

### 3 Modify - controls are amended or modified


#### 3a Parameter settings

Implicit modification of parameter settings.

#### 3b Controls

(Aka "patching") Explicit modification of control content

There are two ways a control may need to be modified. Commonly, controls might be amended -- new material might be added. (For example, P1-P3 in the SP800-53 LOW MODERATE and HIGH baselines.) Less commonly, materials might be removed or edited.

OSCAL does not provide for "changing" a control, but editing can be achieved by removing contents and adding (edited) contents back. In other words, editing is considered to be the same kind of patching as removing combined with adding.

Additions *may* include new parameter references (example)

## Profile resolution - conversion into a catalog

### Form and organization of resolution out

The output of a profile resolution should take the form of a catalog.

(Validation against the catalog schema ... recommended but not required?)

### top-level @id

?

### Instance metadata

Catalog metadata is required in a catalog. A resolved profile's metadata should look like this --

```
id="...{}..."
<title>{ profile title} RESOLUTION</title>
<last-modified>{ resolution date stamp }</last-modified>
<prop name="catalog-title">{ imported catalog title }</prop>
<prop name="catalog-title">{ imported catalog title }</prop>
```

(and other info)

### Result structure

The rest of the catalog is structured as follows:

If no 'merge' was given, or if 'merge' is given without 'custom' or 'as-is', controls are flat.

If merge/custom is used, see above.

Special case rules for handling multiple imports - are controls grouped by their source catalogs (intermediate or ultimate) and should the import hierarchy be reflected?

(Examples)

### Merge clashes

... merge clash rules ...

... examples ...

## Profile resolution illustrated

Representational issue

A profile's results next to its original catalog(s)

Chains of modifications should be traceable

## Profile tools/utilities

- rendering
- editing / integrity checking
- rewriting/normalization
- diffing
- deriving a profile as the delta of two catalogs ('base' and 'profile')

