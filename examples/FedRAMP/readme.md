# FedRAMP profile examples

The source data from which are derived these representations of the "High", "Moderate" and "Low" baselines (profiles) defined by FedRAMP can be found here:

https://www.fedramp.gov/resources/documents-2016/

(Under Key Cloud Service Provider (CSP) Documents)

The three spreadsheets we used for LOW, MODERATE and HIGH are archived in the `sources` directory.

Before hand-editing, the OSCAL profiles in this subdirectory were produced by extraction from (machine-readable) source data as described in directory `working/FedRAMP`. The files appearing here as "crude" are very close analogs to the "working" files in that subdirectory (confirm this with a diff or file comparison between any file in this folder, and its corresponding "working" file).

The files named here as "edited" have been worked by hand; again do a diff with the 'crude' version to see what the edits have been.

The `pub` directory contains (or will contain) HTML web pages showing the resolved-and-rendered OSCAL data. It is populated by applying XProc pipeline `working/lib/XProc/profile-resolve-and-display.xpl` to each of the OSCAL profiles. (At time of writing we haven't run it yet: just ask.)

Note the profiles make reference to profiles and catalogs stored in the neighbor SP800-53 directory, on which they are dependent.

Also note that (at least according to Schematron `oscal-profiles-sources.sch`, several of the OSCAL invocations here could be rewritten to exclude rather than include controls (thereby being much more concise). The Schematron is able to report which controls should be excluded from such an invocation to the same effect as the include/call element set given here (which was ultimately pulled from the Excel map of controls and subcontrols).
