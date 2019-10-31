---
title: Profile Resolution
weight: 10
description: A profile implicitly defines a control set; profile resolution makes this control set explicit and available for further processing.
---

A profile in OSCAL represents a selection and configuration of a set of controls. Ordinarily the set of controls available to a profile is provided by a catalog. For example, the three NIST SP 800-53 profiles representing the impact baselines HIGH, MODERATE and LOW: each of these calls on the full SP 800-53/53A catalog, and depends on a file or resource representing that catalog for its underlying information set.

However, profiles may also select controls from profiles, implicitly selecting from underlying catalogs as modified. And they can select controls from more than one catalog or profile origin.

In order to support these semantics, the results of resolving a single profile must be in the form of a single ('virtual' or implicit) catalog, as described below. Two different OSCAL processors that promise profile resolution, must deliver the same catalog with regard to its controls and the structure in which they are embedded (groups). This specification is designed to make this possible, by defining "the same" in this context.

Areas not yet fully defined by this specification (top down):

* How to construct front matter / file metadata
* What to do with back matter
* What do to with dangling cross-references
* Options for tracing (groups?)

## Profile Semantics

Considered as a "document" or integrated data set (object), a profile has three sections, each of which corresponds to a conceptual step in resolution. To resolve a catalog fully is to perform all these steps.

While the steps are described in this specification as occurring in sequence, a profile processor is not obliged to perform them 
in the order described. Conformance to these specifications is determined by whether the results of processing (*resolution*) appear as described, not on whether the means to produce those results work in exactly the manner described here.

The three steps are *import* (control selection); *merge*; and *modify*. In brief:

- **import** identifies one or more control sources (catalogs or profiles) and the controls within them to be included in this profile
- **merge** produces the rules for how controls will be organized and merged (or not)
- **modify** indicates how parameters in the underlying catalog may be modified or set, and how control contents may be amended or modified.

The selection stage is mandatory inasmuch as a profile that imports no controls is inoperative. Such a profile is not in error and it can be resolved, but it will contain no controls.

The merge stage can be considered mandatory in that there are default rules for merging, to be followed when no merge behavior is given; thus "no merging" is permitted, and a profile with no merge semantics indicated is not in error.

The modify stage is optional in that controls do not have to be modified and parameters do not have to be set; a profile is always free to represent these components as they are given in their catalogs. Leaving a parameter unset, or qualifying its setting (with additional information or constraints) without actually setting it, is also possible; like a catalog, a profile can represent a set of controls that is not fully defined, for purposes of use at another layer (profile or implementation) where such definition can be provided.

When resolved, an OSCAL profile takes the form of an OSCAL catalog, whose organization and parts are described in the next section. The merge semantics described below will produce outputs conforming to this organization.

### Import 

An import must first indicate a resource from which a set of controls is to be imported. The resource can be either an OSCAL catalog or an OSCAL profile. A catalog provides controls in their native form. An imported profile is resolved on import, using the same rules for the resolution of the profile at the top level, so that it too appears as a catalog to the importing profile.

No profile may import itself either directly or indirectly. An import directive that indicates either the profile itself, or a profile into which it is being (currently) imported, must be ignored. Optionally, a processor may issue a warning.

In an import directive, the reference to the resource to be imported appears on an `href` flag. It takes either of two forms, external or internal:

#### External

An external reference appears as an absolute or relative URL

Indicating a file available via [prototol?]

```xml
<import href="../../nist.gov/SP800-53/rev4/xml/NIST_SP-800-53_rev4_catalog.xml">
  <include>
	<call control-id="ac-1"/>
...
```

#### Internal

A catalog or profile to be imported can also be indicated using an internal link via a URI fragment identifier (starting with `#`). If an import href resolves to a `resource` elsewhere in the profile (typically in back matter), that resource can be retrieved to provide the source catalog.

```xml
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

An internal cross-reference from an import to a resource that does not reference a catalog or profile, or a cross-reference to something other than a resource, is inoperative. It may be signaled as an error [or warning] by a processor.

#### Circular imports

When a profile imports a profile, the subordinate profile is resolved into a catalog using the same rules. This presents a possibility of circular imports, when a profile is directed to import itself either directly or indirectly.

A "circular import" is defined as a directive to import a resource, which has already been called higher in the import hierarchy. For example, if Profile A imports Profile B, and Profile B imports Profile A, the second import is circular. (An import at the top can only be circular if a profile tries to import itself.) If A imports B, B imports C and C imports A, C's import is circular.

Note that an import can only be circular within the context of processing a particular profile. In the last example, C's import would not be circular if invoked in the context of resolving B by itself (without being imported by A), or of resolving some other profile that did not import A. (D importing B importing C importing A would not be a problem.)

Circular imports are inoperative, and may be reported as an error [or warning].

#### Multiple imports

Multiple imports of the same resource are not an error as long as no circular dependencies occur.

However, multiple imports may result in invalid outputs. Typically this will be because a control has been selected twice, and no merge behavior (see below) has been given.

Moreover, "sibling" imports 
While this condition must be reported, a processor is not obliged to stop, but may optionally resolve the resource in question by treating the two calls as a single call (unifying both `include` and `exclude` statements in this case). This permits a downstream application to do something with the information. Even in this case a warning message must be indicated unless the processor is specifically set to a 'silent' mode.

#### Stability of documents returned by given URIs

The rules of XSLT `document()` apply to the traversal of any URI: that is, it is assumed that all calls to a given (resolved) URI reference, will return the same result.

#### Selecting controls

Imports can specify controls by inclusion and exclusion, either or both in combination.

##### Inclusion

Using inclusion, all or some controls may be selected from a catalog.

Select all controls from a catalog by using an "include all" rule:

```xml
<include>
  <all/>
</include>
```

Alternatively, select individual controls or controls by groups using match patterns against their IDs.

```xml
<include>
  <call control-id="ac-1"/>
</include>
```


All or some controls from a catalog are included in selection. (include/all)

There are two kinds of selections, "calls" and "matches". (include/call | include/match)

Calls and matches cannot be combined in a single include. To use both, use more than one include statement.

A match is a selection of a control by matching its ID to the given match pattern.

The match pattern is evaluated as a regular expression using XPath regular expression syntax. [XXXX]

###### Including child controls

In OSCAL, controls may contain controls. For example, SP 800-53 offers control enhancements with its main set of controls; in OSCAL these are represented as child controls within parent controls. So parent AC-2 has children AC-2(1) through AC-2(), for example.

Child controls can be included by the same mechanism as controls, i.e. by means of an ID call. Alternatively a match can frequently be applied (at least given most ID assignment schemes) to match controls and child controls together.

Additionally, a `with-child-controls` directive on a `call` or `match` can indicate that child controls (that is, direct children not all descendants) should be included with the applicable call(s) or match(es).

XXX Furthermore, `all[@with-child-controls='no']` may select all controls *only at the top level* (i.e., directly inside `group`) from a catalog. XXXX



##### Exclusions

Exclusions work the same way as inclusions, except with the opposite effect - the indicated control(s) are dropped from the resource.

Additionally, there is no such thing as exclude/all, which is invalid and should be considered inoperable.

If a set of exclusions, but no inclusions, are given, "include all" should be assumed.

Example:

```xml
<import href="#nist-catalog">
  <include>
    <all/>
  </include>
  <exclude>
	<call control-id="ac-1"/>
  </exclude>
</import>
```

Result: all controls from the catalog are included *except* AC-1.

Any control that is both included and excluded, is excluded. This holds irrespective of the specifity of the selection for inclusion or exclusion. For example, if AC-1 is included by id 'ac-1' and excluded by matching 'ac\*', it is excluded. Selection for exclusion prevails.

### Merge - defines rules on how to arrange / manage controls

#### Colliding controls

"Colliding controls" (or "clashing") describes the condition that occurs when multiple invocations of controls with the same ID are given, and so a profile resolution will result in duplicative and/or contradictory information. Even given the rule against multiple imports of the same resource, it may frequently occur that in profiles under development, multiple copies -- and with variations -- of a given control may appear in a resolved profile. For example, if a profile tailors another profile which includes a control with amendments, and then (the top-level profile) includes the same control directly from its home catalog, a collision will occur between these two variants.

Generally such a collision is readily detectable as long as IDs have not been modified; in other words, constraints over uniqueness (within document scope) of IDs will be violated in resolved instances where two (perhaps different) representations of the same control appear.

##### merge combine[@method='keep']

This is also the default if not `merge/combine` directive is given. It indicates that colliding controls should simply be copied through, for handling downstream.

While colliding controls will result in invalid documents under this setting, since care should be taken that controls do not collide in any case, this setting is useful in ensuring integrity.

##### merge combine[@method='use-first']

The first reference to a given control prevails over later references. "First" is read in top-down, depth-first traversal of the tree. So if a profile is imported before a catalog, and the imported profile presents a representation of a control also given in the catalog import -- the profile's representation (perhaps modified) is taken.

The same logic applies to parameter settings.

##### merge combine[@method='merge']

The processor should merge all representations of a given control, into a single unified representation.

The single unified representation is assembled by aggregating all the contents of all the (clashing) control instances and discarding duplicate branches.

Example:

```xml
<control id="a1">
  <title>Control A1</title>
  <prop name="label">A-1</prop>
  <prop name="status">pending</prop>
</control>
```

merging with

```xml
<control id="a1">
  <title>Control A1</title>
  <prop name="label">A-1</prop>
  <prop name="status">ready</prop>
</control>
```

results in

```xml
<control id="a1">
  <title>Control A1</title>
  <prop name="label">A-1</prop>
  <prop name="status">pending</prop>
  <prop name="status">ready</prop>
</control>
```

[tbd]

#### How to build a structure

##### Unstructured catalog output

Two `merge` directives are used to introduce structure into a profile result catalog, `as-is` and `custom`.

Profiles that have neither of these directives are resolved as unstructured catalogs, with no groups of controls. Where controls are given as



##### "as is"

reproduce structure of input catalog

(consider case of multiple imports of single resource)

###### Implicit inclusions under "as is"

Under "as is", a resolved profile's structure is expected to replicate the structure of source catalogs.

This is achieved by propagating, with all controls that are included, all groups that they appear within, along with the groups' IDs, titles and other contents.

Groups that do not include controls that have been included (either directly or as descendants of contained groups, are not propagated to the result.

In addition to groups, under 'as is' mergine, certain controls will be included implicitly. This happens when they have not been called, but they contain controls that have been called. Such controls are treated like groups included 'as is' -- they must be propagated to retain the structure for  descendant controls.

Unlike groups, however, the title of such a control is given with the resolution, but no other contents are presented apart from (a) controls included explicitly or (b) child controls that must be included for the sake of their own (included) child (or descendant) controls.

Example:

```xml
<import href="#XYZ-catalog">
  <include>
    <call control-id='xyz-1.1'/><!-- bedtime routine control -->
    <call control-id='xyz-1.2.1'/><!-- kitchen trashcan -->
  </include>
</import>
```

the result might be

```xml
<control id="xyz-1">
  <title>Basic Hygiene</title>
  <control id="xyz-1.1"><!-- bedtime routine -->...</control>
  <control id="xyz-1.2">
    <title>Kitchen cleanup</title>
	<control id="xyz-1.2.1"><!-- kitchen trashcan -->...</control>
  </control>
</control>

```

##### "custom"

a structure is provided, and controls are selected into it

(nb this means that import/all with selection here also works)

@with-child-controls works, but all other organization is explicit (unlike 'as is' merging).

### Modify - controls are amended or modified

(Aka "patching") Explicit modification of control content

There are two ways a control may need to be modified. Commonly, controls might be amended -- new material might be added. (For example, P1-P3 in the SP800-53 LOW MODERATE and HIGH baselines.) Less commonly, materials might be removed or edited.

OSCAL does not provide for "changing" a control, but editing can be achieved by removing contents and adding (edited) contents back. In other words, editing is considered to be the same kind of patching as removing combined with adding.

#### Parameter settings

Modification of parameter settings is indicated using 'set'.

Parameters are not always given within controls. A profile resolution result must include copies (with or without modifications or settings) of all parameters defined within the source catalog, which are referenced from 'insert' instructions anywhere inside included controls.

A profile should not reproduce parameters from source catalogs, which are not referenced from 'insert' instructions.

Setting of parameters occurs as follows:

* A `set/title` replaces the `param/title` on the affected parameter
* A `set/label` replaces the `param/label` on the affected parameter
* A `set/value` *or* a `set/select` replaces *any* `param/value` or `param/select` on the affected parameter
* Other elements given in a parameter `set` are added to the affected parameter, after elements of the same name
* The prescribed order of all elements in the affected parameter is retained: `label`; `usage`; `constraint`; `guideline`; `value` or `select`; and `link`.

[example]

```xml
<param id="p1">
  <title>Password length</title>
  <value>10</value>
</param>

...

<set param-id="p1">
  <select>
    <choice>10</choice>
    <choice>11</choice>
  </select>
```


## Profile resolution - conversion into a catalog

### Form and organization of resolution out

The output of a profile resolution should take the form of a catalog.

(Validation against the catalog schema ... recommended but not required?)

### top-level @id

Because document IDs are sometimes used to distinguish data points in processing context, a resolved profile may not present the same ID as any of the catalogs it is importing, or the same ID as its source profile.

It is permitted to produce the profile's ID in resolution via a static mapping from the ID of the source. For example, the resolution of profile with ID 'profile-X' might have ID 'profile-X-RESOLUTION'.


### Instance metadata

Catalog metadata is required in a catalog. A resolved profile's metadata could look like this --

```xml
id="...{}..."
<title>{ profile title} RESOLUTION</title>
<last-modified>{ resolution date stamp }</last-modified>
<prop name="catalog-title">{ imported catalog title }</prop>
<prop name="catalog-title">{ imported catalog title }</prop>
```

(and other info)

??? Fully or partially define metadata?

### Profile back matter

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

