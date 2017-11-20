# FedRAMP profile examples

The source data from which are derived these representations of the "High", "Moderate" and "Low" baselines (profiles) defined by FedRAMP can be found here:

https://www.fedramp.gov/resources/documents-2016/

(Under Key Cloud Service Provider (CSP) Documents)

The three spreadsheets we used for LOW, MODERATE and HIGH are archived in the `sources` directory.

Machine made "crude" versions (hot out of the oven; see below for details)

* `FedRAMP-HIGH-crude.xml`
* `FedRAMP-MODERATE-crude.xml`
* `FedRAMP-LOW-crude.xml`

Each one of these captures the (indicated) spreadsheet data and represents it as an OSCAL profile, calling controls in appropriate SP800-53 baselines or when necessary in the SP800-53 catalog. However, this data capture is not yet sufficiently granular in every detail. Specific parameter value assignments are not being parsed out and projected, but require hand intervention..

(Scale of effort for such hand intervention: hours per profile. Not weeks or months. However, this gets us a profile only as exact and complete as the actual source data warrants.)

In order to assess the feasibility of this, we have also made a hand-edited version of 'HIGH' (so far) as a demonstration

* `FedRAMP-HIGH-edited.xml`

A diff between this file and `FedRAMP` shows exactly where changes have been made. Editing 81/434 parameters took a couple of hours to do. Note however that a significant number of parameters are not assigned values even in the source data.

### HTML rendition

* `pub/FedRAMP-HIGH-edited-rendered.html`

### Extraction / conversion process

Before hand editing, the OSCAL profiles in this subdirectory were produced by extraction from (machine-readable) source data using logic maintained in directory `working/FedRAMP`. The files appearing here as "crude" are very close analogs to the "working" files in that subdirectory (confirm this with a diff or file comparison between any file in this folder, and its corresponding "working" file). See `working/FedRAMP` for more info.

The extraction and conversion process is tuned specifically for these spreadsheets and pulls their data at the maximum possible level of "semantic resolution", at the (spreadsheet) cell level. Note that this is *not* a sufficiently high-quality extraction to use "lights out".

### Special considerations

Note also the profiles here make reference to profiles and catalogs stored in the neighbor `SP800-53` directory, on which they are dependent.

Also note that (at least according to Schematron `oscal-profiles-sources.sch`), several of the OSCAL invocations in these profiles could be rewritten to exclude rather than include controls. In a number of cases, invoking controls by exclusion will be much more concise than the same control set (selection) expressed by inclusion; the Schematron detects and reports on this.
