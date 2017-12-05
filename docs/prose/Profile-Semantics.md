# OSCAL PROFILING SEMANTICS SPECIFICATION

## REQUIREMENTS for profile resolution / rendering / merge

* Include controls from multiple sources
* Allow multiple invocations from same source (directly or indirectly)
* Resulting (selected) control set has no duplicates or ambiguity ('duplicate' to be defined)
* All hierarchy must be represented / relevant info (derived from hierarchy) must be preserved
  * This applies both to "native hierarchy" of controls in their (home) catalogs, and to the "invocation hierarchy" of profile resolution

## Operations

In OSCAL, "profiling semantics" refers to the way OSCAL profile instances make reference to catalogs from which their controls are derived.

## Implementation

This document describes OSCAL profile semantics as a set of relations and operations between catalogs, controls, and the invocation or utilization of those controls that constitute OSCAL profiles. These operations are sometimes described here in terms that may imply a particular implementation or implementation strategy; to the extent that occurs, such description is not normative: any implementation that *delivers the same results* as the process described here, is conformant. In particular, although the process here occurs in three stages, these are conceptual steps: an implementation may work otherwise (as long as the outputs are the same).

We have an implementation of these specifications in XSLT, which serves as a point of reference and testbed for viability. Similarly, validation of (XML OSCAL) against many of the constraints described here can be achieved with Schematron we make availablein the public library. In all cases where these tools fail to deliver the results described here, they should be regarded as in error (i.e. this specification takes precedence).

## Terms

A **control** is a structured data object. Controls have arbitrary components, which must be passed through unchanged except where these semantics depict modifications. A **subcontrol** is a special kind of control, "extending" a control, but like a control in other respects except for having this relation to another control in the set (which typically reflects a dependency at a higher semantic level). In these specifications, controls and subcontrols are together described as *components* (of a catalog or of a profile invoking a catalog).

A **catalog** is an authoritative, canonical organization of controls. Within a catalog, controls may be collected in **groups**, and groups may be collected in groups. Information described in the catalog as the group level (i.e., associated with the group) may be inherited (implicitly and sometimes explicitly) within controls in that group; to support this, profile resolution as described here, will preserve not only controls but the organizations (grouping hierarchies) within which they are found; 

A **profile** is an OSCAL data object ("document) that cites (by reference) controls while also specifying (declaring) conditions and modifications for those controls. These modifications may take the form of either assignment of values to **parameters** (which can be done independently of the controls that may use the parameters) and/or of specific modifications ("patches") made to components (controls or subcontrols). Usually such modifications will be simply augmentation or supplementation but in general any modification may be possible.

As a document or data instance, a profile thus represents a "delta" between controls in a catalog, and the same controls in a putative or "virtual" **resolved profile**.

However, a profile may not only cite controls from catalogs; it may also do the same from other profiles. When it does so, its selection is limited to controls as invoked -- and modified -- by those upstream profiles.

Moreover, it may combine controls from multiple catalog sources into a single "collective". For example, a common way of extending a community-standard profile is to include controls from that profile's own source catalog (going back to "the beginning") along with the (modified) controls in the "base" profile being extended..

## Exceptions in profiles (summary)

* broken references (to controls, subcontrols or parameters that do not exist)
* the same catalog or profile is called more than once
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

Selection is done by controlled ID value on a target control or subcontrol object (in XML, the element's @id). We do not yet support selection by other criteria such as context/organization ("all of AC") or controlled property values ("controls that have X=Y").

It is an error if the same authority (catalog or profile) is called by more than one invocation. *(This is Schematronable. Fallback: process anyway. Complementary call sets will resolve; duplicate calls will result in schema-invalid output.)*

Invocations can select controls by inclusion or by exclusion. If an invocation does not indicate an inclusion, then all controls from the invoked authority are implicitly included. (In the XML, no `/invoke/include` is the same as having `/invoke/include/all`. Accordingly, solo `/invoke/exclude` with no "include" stated, is meaningful: include everything but what is excluded.)

Subcontrols are regarded as dependent on their controls. If a control is not selected, it is an error if any of its subcontrols are selected. *(Fallback: drop the subcontrol silently.)* When selecting a subcontrol, see to it that its control is also selected 00 or select the subcontrols implicitly with a "with subcontrols" setting at a higher level.

It is an error if an invocation includes a control or subcontrol more than once. *(Sch. Fallback: include a single copy of the control.)*

Similarly, it is an error if an invocation declares more than one modification (patch) for a given control. *(Sch. Fallback: apply all patches in order defined by processor.)*

Likewise, it is an error if an invocation declares parameter settings for the same parameter, more than once. *(Sch. Fallback: use only one, tbd by processor.)*

It is not an error if the same control is both included explicitly, and then excluded (by definition, to no effective purpose), but an implementation may warn if this occurs. *(Sch.)* A working assumption is that only invocations with "all" controls included (implicitly or explicitly) will have use for exclusions.

It is also not an error if a resolved invocation selects the same control set as a much more parsimonious invocation would (for example, instead of including 249 / 250 controls, simply exclude one.) Again, an implementation may detect this and offer warnings. *(Sch.)*


  
### Merge (Combination)

In profile resolution, a "view" is provided of *each* authority (profile or catalog) invoked by a profile, which preserves information regarding the invocation including the structural relations (groupings) among controls selected by it. Because multiple invocations may trace back through several invocation steps, to the same catalog (such as, for example, NIST SP800-53), this means that the resolved profile will contain more than one "copy" (partial or complete) of the organization (groups) within which controls are organized.

An improved merger might well be specified for such a document, depending on the needs of its users, for example to collapse a "multiply refracted" combination of views on a single catalog, into a single integrated view. Inasmuch as it is straightforwardly achievable (if nothing else) as a post-process, that operation is outside the scope of profile resolution as such.

More info here: 
[Profile Invocation Merge Diagrams](Merge-Diagrams.html)

### Customization (Patch/parameters)



The matching/selection logic of patches described in this spec is in DRAFT form, inasmuch as we expect (hope) to define more flexible and powerful mechanism in a future sprint.


invocation - selects controls to include in (resolved) profile
             (all hierarchy is preserved)
merging    - how to deal with conflicts and duplicates and their order/hierarchy
customization (patching/parameters)

rules for invocation how does it work?

schema for target format is NOT explicit

describe this abstracted away from the XML

