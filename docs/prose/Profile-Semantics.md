# OSCAL PROFILING SEMANTICS SPECIFICATION

## REQUIREMENTS for profile resolution / rendering / merge

* Include controls from multiple sources
* Allow multiple invocations from same source (directly or indirectly)
* Resulting (selected) control set has no duplicates or ambiguity ('duplicate' to be defined)
* All hierarchy must be represented / relevant info (derived from hierarchy) must be preserved
  * This applies both to "native hierarchy" of controls in their (home) catalogs, and to the "invocation hierarchy" of profile resolution

In OSCAL, "profiling semantics" refers to the way OSCAL profile instances make reference to catalogs from which their controls are derived. It is an "as if" sketch that describes the *basics* of any OSCAL system that processes profiles especially if and as those profiles integrate with each other and with catalogs (by further reference).

## Implementation

This document describes OSCAL profile semantics as a set of relations and operations between catalogs, controls, and the invocation or utilization of those controls that constitute OSCAL profiles. These operations are sometimes described here in terms that may imply a particular implementation or implementation strategy; to the extent that occurs, such description is not normative: any implementation that *delivers the same results* as the process described here, is conformant. In particular, although the process here occurs in three stages, these are conceptual steps: an implementation may work otherwise (as long as the outputs are the same).

We have an implementation of these specifications in XSLT, which serves as a point of reference and testbed for viability. Similarly, validation of (XML OSCAL) against many of the constraints described here can be achieved with Schematron we make availablein the public library. In all cases where these tools fail to deliver the results described here, they should be regarded as in error (i.e. this specification takes precedence).

## Terms

A **control** is a structured data object. Controls have arbitrary components, which must be passed through unchanged except where these semantics depict modifications. A **subcontrol** is a special kind of control, in a fixed relation to another control (which it "extends"), but like controls in all other respects. A subcontrol will always be dependent on a control, never on another subcontrol. While a control may have any number of subcontrols associated (or none), a subcontrol is associated directly (extends) only a single control. In these specifications, controls and subcontrols are together described as *components* (of a catalog or of a profile invoking a catalog). Generally speaking, controls and subcontrols are interchangeable in these specifications (work the same way in implementation) with the proviso that a subcontrol will never appear in a catalog or profile without its control also appearing.

Controls and subcontrols are addressable within their catalogs by means of unique identifiers.  Note in particular that often, catalogs will present controls with a range of controlled values, any number of which may be validated as unique to that control. Only one of these will be the ID in the model. (In XML, the `@id` is used. For interchange with XML systems it is recommended that these values conform to the 'name' production rules, i.e. alphanumerics, no spaces, not beginning with digits.)

A **catalog** is an authoritative, canonical organization of controls (and possibly subcontrols). Within a catalog, controls may be collected in **groups**, and groups may be collected into groups. Information described in the catalog as the group level (i.e., associated with the group) may be inherited (implicitly and sometimes explicitly) within controls in that group; to support this, profile resolution as described here sees to it that when controls are invoked (included), the information that comes with them by virtue of group membership, also comes with them. 

A **profile** is an OSCAL data object ("document") that cites (by reference) controls while also specifying (declaring) conditions and modifications for those controls. These modifications may take the form of either assignment of values to **parameters** (which can be done independently of the controls that may use the parameters) and/or of specific modifications ("patches") made to components (controls or subcontrols). Usually such modifications will be simply augmentation or supplementation but in general any modification may be possible.

As a document or data instance, a profile thus represents a "delta" between controls in a catalog, and the same controls in a putative or "virtual" **resolved profile**.

However, a profile may not only cite controls from catalogs; it may also do the same from other profiles. When it does so, its selection is limited to controls as invoked -- and modified -- by those upstream profiles. Thus a resolved profile will represent selections and settings (including changes and alterations) made by *all* the profiles that it cites, in a chain. (If profile B modifies controls from catalog A, profile C that modifies profile B, will include its controls *as modified*.

Moreover, a profile may combine controls from multiple catalog sources into a single "collective" control set. This enables profiles to refer to multiple authorities (other profiles, or catalogs) to achieve a synthesis-with-modification of their controls. For example, a common way of extending a community-standard profile is to include controls from that profile's own source catalog (going back to "the beginning") along with the (modified) controls in the "base" profile being extended..

## Exceptions in profiles (summary)

* broken references (to controls, subcontrols or parameters that do not exist)
* the same catalog or profile is called (directly) more than once
* the same parameter (in the same catalog) is assigned more than once
* a subcontrol is included, without its control also being included
* any control (after resolution) is called more than once
* any circular reference (a profile calling a profile that calls back again)

Expected/okay:

* Controls from the same groups (in the same catalogs) coming in via different invocation pathways

## Profile Resolution

Described here:

* Invocation (of authorities) and selection (of controls and subcontrols)
* Merging - how these control sets are organized in the resolved profile
* Modification - how parameters are set, their values inserted, and patches applied

### Invocation and selection

A profile may combine more than one invocation.

An invocation is bound to a single catalog or profile, its "resource". If bound to a profile, it is *implicitly* resolved according to these same rules. Because profiles must be bound to either catalogs, or profiles, this means that (ipso facto) all profiles capable of finite resolution, resolve eventually to catalogs.

If an OSCAL profile includes, directly or indirectly, any invocations of itself as a resource, such invocations are inoperable. Such circular reference is an error. *(Sch.? Fallback behavior: ignore circular calls.)*  Because circular references are defined as inoperable, in the real world all profiles will be finite.

An invocation can identify controls (as given in and by the resource) for inclusion in either of two ways. The first method is by an explicit "call" using the ID of the desired control or subcontrol. (See on IDs below.)

Alternatively, an invocation can stipulate that all controls from the catalog (or upstream profile) should be included, except as modified by exclusion.

An invocation can also designate controls or subcontrols to be excluded. Ordinarily this will only be done when all controls (or all subcontrols, as applicable) have been included.

An explicit selection or "call" (to be included or excluded) is made by ID value on a target control or subcontrol object (in XML, the element's @id).

It is not an error if the same resource (catalog or profile) is called by more than one invocation. *(This is Schematronable. Fallback: process anyway. Complementary call sets will resolve; duplicate calls or multiple settings will result in duplicative or contradictory outputs.)*

Invocations can select controls by inclusion or by exclusion. If an invocation does not indicate an inclusion, then all controls from the invoked resource are implicitly included. (In the XML, no `/invoke/include` is the same as having `/invoke/include/all`. Accordingly, solo `/invoke/exclude` with no "include" stated, is meaningful: include everything but what is excluded.)

Subcontrols are regarded as dependent on their controls. If a control is not selected, it is an error if any of its subcontrols are selected. *(Fallback: drop the subcontrol silently.)* When selecting a subcontrol, see to it that its control is also selected, or select the subcontrols implicitly with a setting ("with subcontrols") setting at a higher level.

It is an error if an invocation includes a control or subcontrol more than once. *(Sch. Fallback: include a single copy of the control.)*

Similarly, it is an error if an invocation declares more than one modification (patch) for a given control. *(Sch. Fallback: apply all patches in order defined by processor.)*

Likewise, it is an error if an invocation declares parameter settings for the same parameter, more than once. *(Sch. Fallback: use only one, tbd by processor.)*

It is not an error if the same control is both included explicitly, and then excluded (by definition, to no effective purpose), but an implementation may warn if this occurs. *(Sch.)* A working assumption is that only invocations with "all" controls included (implicitly or explicitly) will have use for exclusions.

It is also not an error if a resolved invocation selects the same control set as a much more parsimonious invocation would (for example, instead of including 249 of 250 controls in a catalog, simply include all and exclude one.) Again, an implementation may detect this situation and offer warnings. *(Sch.)*

#### IDs

IDs are expected to be unique within document scope, so no control or subcontrol will have the same ID as another in the same catalog. Control catalogs whose controls are not tagged with distinct IDs can be excluded from resolution as invalid, although conforming processors have the option of continuing to process while offering some means of addressing and resolving the ID clash. 

Moreover, for purposes of these specifications, ID values are expected to be unique *across* catalogs. If local (document-level) ID collision occurs between catalogs, a system is expected to resolve them such that all controls from all catalogs can be addressed distinctly, each call resolving relative to its invocation. Catalogs, however, must also be valid to relevant OSCAL schemas and Schematrons demonstrating their structural integrity. This specification does not define what happens with non-OSCAL inputs to profile resolution.

Note also that it is an expectation that every time a given profile or catalog is invoked, the *same resource* (catalog or resolved profile) is returned, enabling systems to cache. (Cf XPath doc() function.) Along with this is the assumption that resolution of a profile against its sources (profiles and catalogs) will be side-effect free; for example, it cannot have the effect of rewriting catalogs or upstream profiles (by calling some magical URI) or creating new resources to be exploited elsewhere.

We do not yet support selection of controls by other criteria such as context/organization ("all of AC") or controlled property values ("controls that have X=Y").


### Merge (Combination)

In profile resolution, a "view" is provided of *each* resource (profile or catalog) invoked by a profile, which preserves information regarding the invocation including the structural relations (groupings) among controls selected by it. Because multiple invocations may trace back through several invocation steps, to the same catalog (such as, for example, NIST SP800-53), this means that the resolved profile will contain more than one "copy" (partial or complete) of the organization (groups) within which controls are organized.

Note that since profiles can invoke profiles, the views of invocations may be nested, as many layers deep as it takes to get back to a catalog. Also, because profiles may invoke controls from more than a single upstream resource (catalog or profile), views will contain multiple views, in a branching structure. Occasionally, vies within views will point to the same source catalogs as one another; this will happen both in error, and as a feature. Accordingly, it will sometimes be valuable or useful information, not only that a control was included but *how* it was included -- its provenance of invocation.

Within each view, at the deepest layer, a profile will invoke not another profile (making for another view), but a catalog. At that point, the resolved profile will present a partial (filtered) "snapshot" of the catalog in question, showing the controls that are selected.

This snapshot will show a *copy* of the catalog with the following modifications:

* A group that does not contain any control, selected by the profile, is discarded.

* A group that contains a selected control (either directly or by virtue of subgroups) is copied, with its properties and contents (parts and paragraphs), as well as any selected controls or groups that contain (at any level) selected controls.

* Only controls that are selected by the profile, are kept.

* Within controls, only subcontrols that are selected by the profile, are kept. (Note that the means of selection of subcontrols is different from that of the controls on which they depend.)

* Parameter descriptions and values are *unchanged*. (They will be changed in the subsequent "Modify" step.)

More info here: [Profile Invocation Merge Diagrams](Merge-Diagrams.html)

(NB: Merge Diagrams might be expanded to show error conditions described above.)

#### notes on merge

Beyond this "set of branched views", an improved merger might well be specified, depending on the needs of users, for example to collapse a "multiply refracted" combination of views on a single catalog (made by assembling disparate profiles into a profile), into a single integrated view. Inasmuch as this is straightforwardly achievable (if nothing else) as a post-process, that operation is outside the scope of profile resolution as such.

This specification does not require that an implementation actually produce or generate the merged result described here in any form, and does not dictate a format for its maintenance or exchange of merged results. Simultaneously we recognize that a schema describing this format, could be fairly readily developed as an extension of OSCAL (catalog and profile) tagging. Such a schema is left (at least for now) for implementors and/or communities. (We are deliberately not "closing the loop" here.)

There are and will be many ways of representing the *results* of OSCAL-based processes, "synthetic", "synoptic", "merged", "resolved", "reduced" etc, and this specification should not be taken to constrain them. Accordingly, the merge semantics described here are intended to provide the *minimum* sufficient for achieving the goal of referential integrity (with regard to persistence, dependability and traceability) of references within OSCAL, across arbitrary catalogs, profiles, control sets and control types, according to the needs of and accommodating both stable and persistent artifacts (such as catalogs), and very temporary or ephemeral organizations of data (such as the results of profile processing may sometimes be) -- all potentially relating in complex ways to one another (at higher semantic layers). If a resolved profile is considered as having the organization, after selection and merger of its controls, described here, then further refinements and resolutions can be accomplished in subsequent processing (which is indeed, in the general case, also dependent on something like the first steps described here). But architects and developers should regard the merge behaviors described here as necessary, but not necessarily sufficient, for viable implementations.

### Customization (Patch/parameters)

The matching/selection logic of patches described in this spec is in DRAFT form, inasmuch as we expect (hope) to define more flexible and powerful mechanism in a future sprint.

invocation - selects controls to include in (resolved) profile
             (all hierarchy is preserved)
merging    - how to deal with conflicts and duplicates and their order/hierarchy
customization (patching/parameters)

rules for invocation how does it work?

schema for target format is NOT explicit

describe this abstracted away from the XML

