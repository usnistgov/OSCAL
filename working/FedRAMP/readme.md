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

### Convert raw XML into an OSCAL "worksheet" format

Note this is called `framework` provisionally; the element might have a new name after models are tested and refined

**source**: file `excel-extract.xml`

**transformation**: file `fedramp-flat-to-framework.xsl`

**result**: file `fedramp-oscal-worksheet.xml`

The result is valid OSCAL (although without OSCAL declarations)

### Analyze the worksheet in relation to its (presumed) authority (catalog or baseline)

This analysis is performed by an XSLT, whose results take the form of a copy of the input, annotated with results of the analysis and with copies of the parameters declared in the authority and referenced in (included) controls.

The analysis may occur more than once if the worksheet must be considered next to more than one potential authority (for example, different baselines of SP800-53).

In principle, a profile can be produced for the authority if all components in the worksheet document correspond to controls or subcontrols in the referenced catalog or profile. This can be detected by an XSLT that annotates the worksheet in reference to the (potential) authority it is profiling. The same XSLT can also perform other analytic functions.

Note that *not all these* are implemented in this pilot; notes here capture possibilities.

However, the pilot implementation does do well enough to show that the FedRAMP spreadsheet used as input does not correspond one-to-one with the SP800-53 MODERATE baseline. So this analysis has been conducted twice, once on the MODERATE profile and once on the entirety of SP800-53.

#### Potential requirements for analysis:

* Dangling components - does the worksheet describe controls or subcontrols that do not appear in the authority? These can be flagged. Sometimes they will reflect transcription errors in the sources, which can be corrected in `excel-extract.xml` if not in the source spreadsheet.

* Missing controls - are there controls named in the base catalog or profile that are not designated in the worksheet? If the worksheet is intended to be comprehensive, this is a problem. The XSLT could produce stub components for missing controls (or subcontrols). Since this is not always a desired behavior, the XSLT could support a switch.

* Are titles the same? Do controls and subcontrols have the same titles in the catalog as their corresponding components in the worksheet? (Do failures here ever show anything but routine transcription errors?)

* Similarly, there are property values that may be assessed for correct correspondence between framework components, and the controls they are supposed to reference. (For example `prop[@class='baseline-impact']` in this data set.) Most lapses here will be incidental but some of them may sometimes be significant of other issues.

* Where are there parameters to be provided? The worksheet contains notes towards assignment of parameter values; these should be maintained in the (temporary) worksheet, while copies of the appropriate parameters are also produced.

#### Next step: editing in view of findings

Subsequent to this analysis, the worksheet can be edited. In particular, the worksheet may provide parameter values assignments.

**primary source**: `fedramp-oscal-worksheet.xml` - the worksheet document being assessed

**secondary source**: The OSCAL catalog or profile being referenced for (by) the assessment. Note that when this is a profile, it must be *resolved* (internally) into a (filtered) control catalog.

**result**: A copy of the worksheet is produced, with annotations and parameters included.

### Rewriting the worksheet as a profile

Finally we have an XSLT transformation, `fedramp-framework-to-profile.xsl`, which produces an OSCAL profile out of a worksheet.

The current version does this by referencing SP800-53 to match up components against controls. A new better version will be simpler, reflecting how in the prior "annotation" step we have effectively moved the intelligence required to do this. Given results such as the annotation process can produce, in other words, we should be able to rewrite the worksheet as a profile without reference to an authority (other than what the worksheet itself cites). 

This effectively deals also with the requirement to produce a profile for an arbitrary set of controls referencing either catalogs or profiles (since that resolution has already effectively been done).)

When resolved against its authority (for FedRAMP we are aiming for the MODERATE baseline of SP800-53), this profile document should be capable of rendetion and display, showing the invoked controls with parameterized values, like any other profile.  

**primary source**: `fedramp-oscal-worksheet.xml` - the worksheet document being assessed - but any OSCAL `framework` should do, as long as it has links in it.

**result**: An OSCAL profile document referencing the authority (catalog or profile) copy of the worksheet is produced, with annotations and parameters included.

This document should work as a profile: when resolved against its catalog (or appropriate baseline profile), it should give the results intended by the original spreadsheet.

#### Complications set aside for now

For now we are assuming that our profiles will invoke only single authorities (catalogs or profiles). If the worksheet may call more than one authority, the analysis will be more complex and require further specification (for example to deal with potential conflicts).