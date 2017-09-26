# FedRAMP in OSCAL: a demonstration

We aim here to represent a FedRAMP specification spreadsheet, produced as a customization (informal profile) of an SP800-53 baseline, formally in OSCAL.

Note that the referenced document will not be the SP800-53 catalog, but a profile document - whichever of the 'LOW' or 'MODERATE' baselines proves to be the correct one. (Someone who knows the data can determine this just by looking at it, but we want the machine to be able to determine this fitness.) Accordingly, FedRAMP stands two steps away: it is a profile of a profile of the catalog.

This will take the form of an OSCAL profile referencing an OSCAL profile (whichever of document that relates 

## Method

We use a sequence of tasks and tools, several of which we should be able to reuse for similar tasks.

#### Map Excel spreadsheet into XML

We have to do this once. oXgen XML Editor has a tool for this import, which we use to produce a relatively flat XML file representing rows and cells of the spreadsheet as XML element.

**input**: `Fedramp/FedRAMP-Rev-4-Baseline-Workbook-FINAL062014.xlsx` in the `Sources` subdirectory of this repository

**output**: file `excel-extract.xml`

### Convert raw XML into an OSCAL "bridge framework" format

**source**: file `excel-extract.xml`

**transformation**: file `fedramp-flat-to-framework.xsl`

**result**: file `fedramp-oscal-bridge.xml`

The result is valid OSCAL (although without OSCAL declarations)

### Analyze the bridge framework in relation to its (presumed) authority (catalog or baseline)

This analysis is performed by an XSLT, whose results take the form of a copy of the input, annotated with results of the analysis and with copies of the parameters declared in the authority and referenced in (included) controls.

The analysis may occur more than once if the bridge framework must be considered next to more than one potential authority (for example, different baselines of SP800-53).

In principle, a profile can be produced for the authority if all components in the bridge framework document correspond to controls or subcontrols in the referenced catalog or profile. This can be detected by an XSLT that annotates the bridge framework in reference to the (potential) authority it is profiling. The same XSLT can also perform other analytic functions.

* Dangling components - does the bridge framework describe controls or subcontrols that do not appear in the authority? These can be flagged. Sometimes they will reflect transcription errors in the sources, which can be corrected in `excel-extract.xml` if not in the source spreadsheet.

* Missing controls - are there controls named in the base catalog or profile that are not designated in the bridge? If the bridge is intended to be comprehensive, this is a problem. The XSLT could produce stub components for missing controls (or subcontrols). Since this is not always a desired behavior, the XSLT could support a switch.

* Are titles the same? Do controls and subcontrols have the same titles in the catalog as their corresponding components in the bridge framework? (Do failures here ever show anything but routine transcription errors?)

* Similarly, there are property values that may be assessed for correct correspondence between framework components, and the controls they are supposed to reference. (For example `prop[@class='baseline-impact']` in this data set.) Most lapses here will be incidental but some of them may sometimes be significant of other issues.

* Where are there parameters to be provided? The bridge framework contains notes towards assignment of parameter values; these should be maintained in the (temporary) bridge framework, while copies of the appropriate parameters are also produced.

Parameter assignment can subsequently be made in the the bridge framework document, which may be easier than assigning them in the final profile.

**primary source**: `fedramp-oscal-bridge.xml` - the bridge framework document being assessed

**secondary source**: The OSCAL catalog or profile being referenced for (by) the assessment. Note that when this is a profile, it must be *resolved* (internally) into a (filtered) control catalog.

**result**: A copy of the bridge framework is produced, with annotations and parameters included.

### Rewriting the bridge framework as a profile

(In place we have an XSLT, `fedramp-framework-to-profile.xsl`, which produces a profile for our test document, in reference to SP800-53 (the entirety). However, we need it to work not only against the full catalog but also against its profiles. Also we need more robust error handling. So what follows here are generalized requirements.)

Given the edited bridge document, checked and tested against an authority (and with no remaining dangling components), another XSLT can produce a profile document recapitulating the operations of the framewok in control selection and parameter assignment.

(Note that it does need fallback behavior defined for cases where the bridge framework does not line up against the intended catalog. But a profile is expected: should this be runtime failure? or should dangling components or parameters be dropped?)

**primary source**: `fedramp-oscal-bridge.xml` - the bridge framework document being assessed

**secondary source**: The OSCAL catalog or profile being referenced for (by) the assessment.

**result**: An OSCAL profile document referencing the authority (catalog or profile) copy of the bridge framework is produced, with annotations and parameters included.

This document should work as a profile: when resolved against its catalog (or appropriate baseline profile), it should give the results intended by the original spreadsheet.

#### Notes towards implementation

A 'naive' profile simply lists all controls and subcontrols to be called.

A more sophisticated profile may rewrite the naive profile (with reference to its authority catalog or profile) using constructs including `invoke/include/all`, `invoke/exclude/call` (if more controls are included than excluded) and `call/@with-subcontrols`.

There will be some art to this (producing the most efficient, legible and useful profile). Possibly the bridge rewrite will occur in two phases: first, writing the 'naive' profile, the second, rewriting it.

#### Complications set aside

For now we are assuming that our profiles will invoke only single authorities (catalogs or profiles). If the bridge framework may call more than one authority, the analysis will be more complex and require further specification (for example to deal with potential conflicts).