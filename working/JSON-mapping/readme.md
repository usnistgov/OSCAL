# Mapping an "Implementation Layer" from JSON into OSCAL

For this experiment, the source files are the JSON files given in this subdirectory.

These are each processed through a pipeline of XSLT transformations: this is `acquire-JSON.xpl`. It should be consulted for details. As writing its several transformations include (in order):

`json-reader.xsl` - simple wrapper for calling the standard XPath 3.0 function `json-to-xml()`.

`json-abstract-map.xsl` - 'invert' the XML, promoting labels to element names

`map-refine.xsl`, `enhance.xsl` - as they suggest. From this point forward (more or less) outputs conform to the `oscal-implementation.rnc` schema.

`index-to-catalog.xsl` - enhances components of an OSCAL 'implementation' document with links to a catalog or profile resource (designated at runtime)

`param-insert.xsl` - inserts parameter settings from a catalog or profile resource (designated at runtime) - whose results are instructive

`analysis.xsl` - tells us things about anything resulting from earlier processes (whatever they may be)

## Lessons Learned

IDs are everything. Because the FedRAMP examples are not properly tagged wrt IDs for parameters, they (the parameters) are inaccessible / unavailable at higher levels such as an implementation layer. We end up having to go all the way back to SP800-53. Then too, it appears that the coverage of references (to controls/subcontrols in these samples) goes beyond FedRAMP Moderate. It seems certain forensics such as tools showing which components can be sourced where, would be useful.

However a key point is that if when set-parameter settings resolve correctly to the (ultimate) source catalog, they cannot resolve correctly against a profile that is (itself) in error (which is the case with our "crude" not-yet-complete FedRAMP models).

The silver lining here is in the lesson that broken parameter links (and control links?) may be something we need to be able to deal with routinely, to detect and correct. Having these settings correct and complete at lower levels (and known to be so) is a sine qua non for any dependent level. Making it easy to correct or work around these needs to be a priority.

In an editing workflow, this probably means a UI that permits parameter setting (and even control patching) over a mockup of the (expanded and resolved) catalog, followed by a process that reduces this mock-catalog back into a profile (set of selections and settings). Binding the mock-catalog to the catalog it purportedly references, we can validate it as we go.

A transformation that produces, from a profile, a patchable, editable mock-catalog or worksheet (which could be rendered back down to a profile) might be a goal for a future sprint.

Another issue exposed by this (very useful!) exercise is how to validate that parameters set in a profile actually apply at a lower level. Setting a parameter whose value is never injected into (included) control/subcontrol content, is a no-op by definition, n'est pas?






