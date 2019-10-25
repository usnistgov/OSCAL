---
title: Profile Resolution
weight: 10
---


## Profile Semantics

Considered as a "document" or integrated data set (object), a profile has three sections, each of which corresponds to a step in resolution. To resolve a catalog fully is to perform all these steps.

While the steps are described as occurring in sequence, a profile processor is not obliged to perform them 
in the order described. Conformance to these specifications is determined by whether the results 
of processing (*resolution*) appear as described, not on whether the means to produce those results work in exactly the manner described here.

The three steps are *import* (control selection); *merge*; and *modify*. In brief:

- **import** identifies one or more control sources (catalogs or profiles) and the controls within them to be included in this profile
- **merge** produces the rules for how controls will be organized and merged (or not)
- **modify** indicates how parameters in the underlying catalog may be modified or set, and how control contents may be amended or modified.

The selection stage is mandatory inasmuch as a profile that imports no controls is not a profile.

The merge stage can be considered "optional" in that there are default rules for merging, to be followed when no merge behavior is given.

The modify stage is optional in that controls do not have to be modified and parameters do not have to be set; a profile is always free to represent these components as they are given in their catalogs.

When resolved, an OSCAL profile takes the form of an OSCAL catalog. Its organization and parts are described in the next section. The merge semantics described below will produce outputs conforming to this organization.

### Import 

An import must first indicate a resource from which a set of controls are to be imported. The resource can be either an OSCAL catalog or an OSCAL profile. A catalog provides controls in their native form. An imported profile is resolved on import, using the same rules for the resolution of the profile at the top level.

No profile may import itself either directly or indirectly. An import directive that indicates either the profile itself, or a profile into which it is being (currently) imported, should be ignored. Optionally, a processor may issue a warning.

The directive for an import takes either of two forms:

#### An absolute or relative URL

Indicating a file available via [prototol?]

```
<import href="../../nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml">
  <include>
	<call control-id="ac-1"/>
...
```

#### A URL fragment identifier

An import resource can be indicated using an internal link. If an import href resolves to a `resource` elsewhere in the profile (typically in back matter), that resource can be retrieved to provide the source catalog.

```
<import href="#nist-catalog">
  <include>
	<call control-id="ac-1"/>
  </include>
</import>

  ...
  
<back-matter>
  <resource id="catalog">
    <desc>SP 800-53 catalog (OSCAL format) on Github</desc>
    <rlink href="https://github.com/usnistgov/OSCAL/blob/master/content/nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml"/>
  </resource>
</back-matter>
```

#### Circular imports

When a profile imports a profile, the subordinate profile is resolved into a catalog using the same rules. This presents a possibility of circular imports, when a profile tries to import itself either directly or indirectly.

A "circular import" is defined as a directive to import a resource, which has already been called higher in the import hierarchy. For example, if Profile A imports Profile B, and Profile B imports Profile A, the second import is circular. (An import at the top can only be circular if a profile tries to import itself.)

Circular imports are inoperative, and may be reported as an error [or warning].


#### Multiple imports of the same resource

Apart from circular imports, more than one import of the same resource can be reported with a warning; but it is not an error. Processors can define for themselves what constitutes resource identity for these purposes.

#### Selecting controls

Imports can specify controls by inclusion and exclusion.

##### Inclusion

Using inclusion, all or some controls may be selected from a catalog.

Select all controls from a catalog by using an "include all" rule:

```
<include>
  <all/>
</include>
```

Alternatively, select individual controls or controls by groups using match patterns against their IDs.

```
<include>
  <call control-id="ac-1"/>
</include>
```


All or some controls from a catalog are included in selection. (include/all)

There are two kinds of selections, "calls" and "matches". (include/call | include/match)

Calls and matches cannot be combined in a single include. To use both, use more than one include statement.

A match is a selection of a control by matching its ID to the given match pattern.

The match pattern is evaluated as a regular expression using XPath regular expression syntax. [XXXX]

##### Exclusions

Exclusions work the same way as inclusions, except with the opposite effect - the indicated control(s) are dropped from the resource.

Additionally, there is no such thing as exclude/all, which is invalid and should be considered inoperable.

If a set of exclusions, but no inclusions, are given, "include all" should be assumed.

Example:

```
<import href="#nist-catalog">
  <import>
    <all/>
  </import>
  <exclude>
	<call control-id="ac-1"/>
  </include>
</import>
```

Result: all controls from the catalog are included *except* AC-1.

Any control that is both included and excluded, is excluded. This holds irrespective of the specifity of the selection for inclusion or exclusion. For example, if AC-1 is included by id 'ac-1' and excluded by matching 'ac\*', it is excluded. Selection for exclusion prevails.

### Merge - defines rules on how to arrange / manage controls

#### How to deal with clashing controls (multiple invocation of controls with the same ID)
  
#### How to build a structure

##### "as is"

reproduce structure of input catalog

(consider case of multiple imports of single resource)

##### "custom"

a structure is provided, and controls are selected into it

(nb this means that import/all with selection here also works)

### Modify - controls are amended or modified


#### Parameter settings

Implicit modification of parameter settings.

#### Controls

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

### Instance back matter

Back matter in OSCAL can contain either or both citations and resources.

A citation is a reference to an out of line document, included for reference purposes. Controls may contain cross-references to these citations.

A resource is like a citation, but is more tightly controlled with a more rigorous description. It is used to designate any materials that are either formally part of a document but not encoded with it (such as a file attachment in a foreign format), or materials with support for identification or authentication, such as by comparing cryptographic hashes.

When a profile is resolved, only citations and resources that are actually referenced from contents in the catalog *as resolved*, should be included.

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

