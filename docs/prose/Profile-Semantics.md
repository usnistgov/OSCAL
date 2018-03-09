# OSCAL PROFILING SEMANTICS SPECIFICATION

## REQUIREMENTS for profile resolution / rendering / merge

* Include controls from multiple sources
* Allow multiple imports from same source (directly or indirectly)
* Resulting (selected) control set has no duplicates or ambiguity ('duplicate' to be defined)
* The order and organization of controls in profile resolution must be deterministic, i.e always the same, although not always reversible. The hierarchies either of controls within their original catalogs, or import hierarchies (from profiles calling profiles), need not be represented directly, except as stipulated by requirements to "preserve" as part of "merge" semantics
* Errors are to be delivered as messages with no other outputs. Internally, an incorrect "provisionally resolved" profile may be produced, and may be made available to processors for diagnostics or other purposes, but a conforming implementation must (by default) deliver only an appropriate message.

In OSCAL, "profiling semantics" refers to the way OSCAL profile instances make reference to catalogs from which their controls are derived. It is an "as if" sketch that describes the *basics* of any OSCAL system that processes profiles especially if and as those profiles integrate with each other and with catalogs (by further reference).

## Implementation

This document describes OSCAL profile semantics as a set of relations and operations between catalogs, controls, and the import or utilization of those controls that constitute OSCAL profiles. These operations are sometimes described here in terms that may imply a particular implementation or implementation strategy; to the extent that occurs, such description is not normative: any implementation that *delivers the same results* as the process described here, is conformant. In particular, although the process here occurs in three stages, these are conceptual steps: an implementation may work otherwise (as long as the outputs are the same).

We have an implementation of these specifications in XSLT, which serves as a point of reference and testbed for viability. Similarly, validation of (XML OSCAL) against many of the constraints described here can be achieved with Schematron we make available in the public library. In all cases where those tools fail to deliver the results described here, they should be regarded as in error (i.e. this specification takes precedence).

## Terms of art

A **control** is a structured data object. Controls have arbitrary contents, which must be passed through unchanged except where these semantics depict modifications to them. A **subcontrol** is a special kind of control, in a fixed relation to another control (which it "extends"), but like controls in all other respects. While a control may have any number of subcontrols associated (or none), a subcontrol is associated directly (extends) only a single control. In these specifications, controls and subcontrols are together described as *components* (of a catalog or of a profile invoking a catalog). Generally speaking, controls and subcontrols are interchangeable in these specifications (and work the same way in implementation) with the proviso that a subcontrol will never appear in a catalog or profile without its control also appearing.

Controls and subcontrols are addressable within their catalogs by means of unique identifiers. Note in particular that often, catalogs will present controls with a range of controlled values, any number of which may be validated as unique to that control. Only one of these will be the ID in the model. (In XML, the `@id` is used. For interchange with XML systems it is recommended that these values conform to the 'name' production rules, i.e. alphanumerics, no spaces, not beginning with digits.)

A **catalog** is an authoritative, canonical organization of controls and possibly subcontrols. Within a catalog, controls may be collected in **groups**, and groups may be collected into groups. Information described in the catalog as the group level (i.e., associated with the group) may be inherited (implicitly and sometimes explicitly) within controls in that group. By default, since controls are selected "from outside", information belonging to groups (as opposed to information associated with their respective controls; it can be restored or replaced using "merge" operations in profiling. 

A **profile** is an OSCAL data object ("document") that cites (by reference) controls while also specifying (declaring) conditions and modifications for those controls. These modifications may take the form of either assignment of values to **parameters** (which can be done independently of the controls that may use the parameters) and/or of specific modifications ("patches") made to components (controls or subcontrols). Usually such modifications will be simply augmentation or supplementation but in general any modification may be possible.

As a document or data instance, a profile thus represents a "delta" between controls in a catalog, and the same controls in a putative or "virtual" **resolved profile**.

However, a profile may not only cite controls from catalogs; it may also do the same from other profiles. When it does so, its selection is limited to controls as invoked -- and modified -- by those upstream profiles. Thus a resolved profile will represent selections and settings (including changes and alterations) made by *all* the profiles that it cites, in a chain. If profile B modifies controls from catalog A, profile C that modifies profile B, will include its controls *as modified*.

Moreover, a profile may combine controls from multiple catalog sources into a single "collective" control set. This enables profiles to refer to multiple authorities (other profiles, or catalogs) to achieve a synthesis-with-modification of their controls. For example, a common way of extending a community-standard profile is to include controls from that profile's own source catalog (going back to "the beginning") along with the (modified) controls in the "base" profile being extended..

## Exceptions in profiles (summary)

* broken references (to controls, subcontrols or parameters that do not exist)
* the same catalog or profile is called (directly) more than once
* the same parameter (in the same catalog) is assigned more than once
* a subcontrol is included, without its control also being included
* any control (after resolution) is called more than once
* any circular reference (a profile calling a profile that calls back again)

Expected/okay:

* Controls from the same groups (in the same catalogs) coming in via different import pathways

## Profile Resolution

Described here:

* Import (of sources or resources) and selection (of controls and subcontrols)
* Merging - how these control sets are organized in the resolved profile
* Modification - how parameters are set, their values inserted, and patches applied

### Invocation and selection

A profile may combine more than one import.

An import is bound to a single catalog or profile, its "resource". If bound to a profile, it is *implicitly* resolved according to these same rules. Because profiles must be bound to either catalogs, or profiles, this means that (ipso facto) all profiles capable of finite resolution, resolve eventually to catalogs.

If an OSCAL profile includes, directly or indirectly, any imports of itself as a resource, such imports are inoperable. Such circular reference is an error. *(Sch.? Fallback behavior: ignore circular calls.)*  Because circular references are defined as inoperable, in the real world all profiles will be finite.

An import can identify controls (as given in and by the resource) for inclusion in either of two ways. The first method is by an explicit "call" using the ID of the desired control or subcontrol. (See on IDs below.)

Alternatively, an import can stipulate that all controls from the catalog (or upstream profile) should be included, except as modified by exclusion.

An import can also designate controls or subcontrols to be excluded. Ordinarily this will only be done when all controls (or all subcontrols, as applicable) have been included.

An explicit selection or "call" (to be included or excluded) is made by ID value on a target control or subcontrol object (in XML, the element's @id).

It is not an error if the same resource (catalog or profile) is called by more than one import. *(This is Schematronable. Fallback: process anyway. Complementary call sets will resolve; duplicate calls or multiple settings will result in duplicative or contradictory outputs.)*

Invocations can select controls by inclusion or by exclusion. If an import does not indicate an inclusion, then all controls from the invoked resource are implicitly included. (In the XML, no `/invoke/include` is the same as having `/invoke/include/all`. Accordingly, solo `/invoke/exclude` with no "include" stated, is meaningful: include everything but what is excluded.)

Subcontrols are regarded as dependent on their controls. If a control is not selected, it is an error if any of its subcontrols are selected. *(Fallback: drop the subcontrol silently.)* When selecting a subcontrol, see to it that its control is also selected, or select the subcontrols implicitly with a setting ("with subcontrols") setting at a higher level.

It is an error if an import includes a control or subcontrol more than once. *(Sch. Fallback: include a single copy of the control.)*

Similarly, it is an error if an import declares more than one modification (patch) for a given control. *(Sch. Fallback: apply all patches in order defined by processor.)*

Likewise, it is an error if an import declares parameter settings for the same parameter, more than once. *(Sch. Fallback: use only one, tbd by processor.)*

It is not an error if the same control is both included explicitly, and then excluded (by definition, to no effective purpose), but an implementation may warn if this occurs. *(Sch.)* A working assumption is that only imports with "all" controls included (implicitly or explicitly) will have use for exclusions.

It is also not an error if a resolved import selects the same control set as a much more parsimonious import would (for example, instead of including 249 of 250 controls in a catalog, simply include all and exclude one.) Again, an implementation may detect this situation and offer warnings. *(Sch.)*

#### IDs and source catalogs

Note that a feature (and limitation) of OSCAL profile resolution, is that IDs on controls (in XML, `@id` values) are propagated through resolution. A control with ID 'a.1' remains 'a.1' in the (resolved) profile, even if its contents (title and/or properties) have been altered by the profile. Essentially, ID values are proxies for node identity.

Accordingly IDs are expected to be unique within document scope, so no control or subcontrol will have the same ID as another in the same catalog. Control catalogs (resources or source documents) whose controls are not tagged with distinct IDs can be excluded from resolution as invalid, although conforming processors have the option of continuing to process while offering some means of addressing and resolving the ID clash. 

Moreover, for purposes of these specifications, ID values are expected to be unique *across* catalogs. That is, two distinct catalogs must also present distinct (non-overlapping) IDs for their controls and subcontrols. Eventually, this restriction may be relaxed; for now, it encourages careful and deliberate use of catalog sources by forcing any necessary reconciliation between catalogs to come to the front of the process.

In general, catalogs, however, must also be valid to relevant OSCAL schemas and Schematrons demonstrating their structural integrity. This specification does not define what happens with non-OSCAL inputs to profile resolution.

Note also that it is an expectation that every time a given profile or catalog is invoked, the *same resource* (catalog or resolved profile) is returned, enabling systems to cache. (Cf XPath `doc()` function.) Along with this is the assumption that resolution of a profile against its sources (profiles and catalogs) will be side-effect free; for example, it cannot have the effect of rewriting catalogs or upstream profiles (for example, by calling some magical URI) or creating new resources to be exploited elsewhere.

#### Importing catalogs and including controls

Two mechanisms are available for selecting controls from imported catalogs. The first is by pointing to their IDs directly (using `call`); the second matches their IDs using a regular expression (`match`). The second mechanism provides for including more than one control at a time.

##### Calling controls (or subcontrols) by ID

The ID of a control is the `@id` in the XML of that control.

```
<include>
   <call control-id="pm3"/>
</include>
      
```

`call` with `control-id` works to select the control with with given ID (identifier) in its catalog.

Same for `call` with `subcontrol-id`, except subcontrols are included.

Note that subcontrols may be included without their controls. Depending on other considerations (see below) this may not be an error.

It is also possible to use a `with-subcontrols` flag when calling controls by ID, to include all subcontrols along with it.


```
<include>
   <call control-id="pm3" with-subcontrols="yes"/>
</include>
      
```

##### Matching (sets of) controls with a pattern (regex)


```
<include>
   <match pattern="^pm"/>
</include>
      
```

The value of `@pattern` is an (XSD) regular expression. It is matched against the ID. Both/any controls and subcontrols whose IDs match the patterns, are selected - so in this case, any whose ID starts with "pm".

#### Other selection criteria

In future we may wish to match any associated string e.g. a control's title or a property value, not only its ID.

Similarly we do not yet support selection of controls by other criteria such as context/organization ("all of AC") or controlled property values ("controls whose X satisfies Y(X)"). Certainly these can be specified and effected by a custom transformation.

##### Orphan or "loose" subcontrols

It is a requirement that a subcontrol may be included in one import clause, with its control included (only) in another one. (Perhaps the first clause adds a subcontrol to a profile included in the second.) This must be supported as long as the control is indeed included in another import branch (with which it can eventually be merged subject to its logic). "The same control" for these purposes means the control with the same @id from the same catalog - so, to be more precise, a subcontrol can be reunited to any control with the same ID as its parent in (its own) home catalog. (Note the imposition of the requirement that all IDs be distinct or distinguishable across source catalogs.) An orphan subcontrol included without its control included anywhere (in the same profile albeit not the same import), will be an error.

One of the functions of the merge process (described below) is to "reunite" subcontrols with their controls. For these purposes, a subcontrol is considered to "belong to" a control with the same ID as the ID of its home control in its home catalog.

### Merge (Combination)

A profile that selects controls without merging them has a hierarchy that represents the order (hierarchy) of selection. Since controls may be selected from more than one resource, and resources may include profiles (which may select from more than one resource), what results naturally is a "tree" structure. However, the terminals (final branches) of this tree "overlap" in the sense that they may severally or all call the same (source) catalog. Indeed, profiles that include multiple controls from a single source via multiple invocation pathways (multiple profiles) may be quite usual. (An example might be a customization citing FedRAMP customizations of NIST baseline profiles of SP800-53.)

This hierarchy may be represented internally in resolution (e.g. to help error reporting) but exposing it is *not* a requirement of profile resolution. Without merging, a profile when resolved should result in a simple "pile" of controls.

The way to specify resolution with no merge is to simple omit the merge element:

```
<profile>
  <import href="catalog.xml">
    <include>
      <match pattern="control"/>
    </include>
  </import>
</profile>
```  


For the most part, however, a profile will always designate some sort of merge Merging can either be a simple merge, or it can provide for (re) organizing controls.


```
<profile>
  <import href="catalog.xml">...</import>
  <merge/>  
</profile>
```  

For purposes of the latter, two features are provided. A merge "as is" will present the controls selected for the profile, regrouped and reorganized into the structure of their original ("home") catalogs. Note that this structure need not be known in advance.

```
<profile>
  <import href="catalog.xml">...</import>
  <merge>
    <as-is/>
  </merge>    
</profile>
```  

Alternatively, a profile may offer a `custom` instruction that provides an entire structure, within which controls are called (again), from among the set of controls returned by the selection operation.

\[ More examples ] ]

### ID clashes and control combination

Any kind of merge raises the question of what to do when controls are called multiple times. A `combine` operation, specified along with the merge, provides for different approaches to profile resolution.

`combine` can have a `method` of "keep", "use-first", or "merge".

\[ etc with examples ]

#### Merge proposal (summary)

\[ tbd xml examples ]

`merge` - simply merges import branches together on their source catalogs (reuniting controls and subcontrols)

However this is considered normal indeed to skip it would only be done ordinarily for diagnostic purposes.

`merge/as-is` - rebuilds into hierarchy of home catalog (we have this working)

`merge/custom` - instead, provides a way to "stack" the controls into a new organization (optionally reporting errors for dropped controls):


```
<group>
  <title>
  <match pattern="cm"/>
</group>
```

When invoked using `match`, matched controls and subcontrols come out in their original (source) order. Alternatively, an `order-by` attribute may be used to re-sort the controls, in `ascending` or `descending` (alphabetical) order. Currently, only sorting by the ID value on the control or subcontrol, is supported.


```
<group>
  <title>Ad Hoc Controls</title>
  <match pattern="cm" order="descending"/>
</group>
```

By combining multiple match patterns

for purposes of error handling, remember that designers should be using exclusions, not letting profiles conflict even apparently. So `merge` might complain *any* time controls appear duplicative (there is always a remedy).

Should running a resolution w/o merge, also make it impossible to patch? (B/c we don't know what we're patching?)

## Modify logic ("patching")

As implemented, modifications permit both removals and additions.

### Removals


```
<remove id-ref="e95b8652"/>
<remove class-ref="baseline"/>
<remove item-name="title"/>
```

 * Remove the element with `@id` (id attribute) `e95b8652`
 * Remove any element with `@class` token `baseline`
 * Remove any `title` element

These can be combined. When combined, all the conditions (ID, class token and/or element name) must be satisfied for the removal to occur.

### Additions

Two attributes on `<add>` elements indicate the position of the addition. `@target` (optional) indicates an element where the patch will be made. `@position` indicates where (in relation to the target) the patch will be placed. Four values are recognized for `@position`: `before`, `after`, `starting` and `ending`.

In its full form, `target` identifies an element descendant of the control or subcontrol:


```
<add position="after" target="advice">
  <part class="more_advice">
     <title>More advice</title>
     <p>More advice ...</p>
</add>
```

The target works to identify an element by its `@id` or by a class token.

When elements are matched using class tokens, there is the possibility that multiple elements of the given class are present in the control. The element where the insertion is to be made is then determined by the given `@position`:  `position='before'` and `position='starting'` work to select the *first* of the candidates in the control as given, while  `position='after'` and `position='ending'` work to select only the *last* element of the given class, within the control or subcontrol.

The difference between `position='before'` and `position='starting'` is that "before" places the inserted content *before* the targeted element, while "starting" places it *inside* it, at the front. "ending" will place the inserted content at the end, inside the identified element.

When the targeted element is a control or subcontrol (no target is given), `before` is a synonym for `starting`. 

If no position is given, or for any value not one of these four (case sensitive, whitespace trimmed), `position='ending'` is inferred: the insertion happens inside the targeted element (or the matched control or subcontrol), at the end.

Note that this default works along with the rule that if no target (class or ID) is indicated, the control or subcontrol itself is the point of insertion. So:

```
<modify control-id="ac.1">
  <add position="starting">
    <link href="guidelines/">Local guidelines</link>
  </add>
  <add>
    <part class="supplemental">
       <title>Supplementary Guidance</title>
       <p>More advice ...</p>
    </part>       
  </add>
</modify>
```

This adds the new `part` at the end of the `ac.1` control.

Note also that position "before" and "after" work only when @target is also used (to identify some contents inside a control); they are inoperable when the target is a control or subcontrol. They result in no addition being made. (A Schematron check could be made for this.)

