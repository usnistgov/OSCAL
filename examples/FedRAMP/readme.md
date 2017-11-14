# FedRAMP profile examples

The source data for "High", "Moderate" and "Low" baselines (profiles) defined by FedRAMP is found here:

https://www.fedramp.gov/resources/documents-2016/

(Under Key Cloud Service Provider (CSP) Documents)

The three spreadsheets we used for LOW, MODERATE and HIGH are archived in the `sources` directory.

Before hand-editing, the OSCAL profiles in this subdirectory were produced by extraction from (machine-readable) source data as described in directory `working/FedRAMP`. Perform a diff or file comparison between any file and the corresponding file in that directory, to see what the hand edits have been.

The `pub` directory contains HTML web pages showing the resolved-and-rendered OSCAL data. It is populated by applying XProc pipeline `working/lib/XProc/profile-resolve-and-display.xpl` to each of the OSCAL profiles.

Note the profiles reference profiles and catalogs stored in the neighbor SP800-53 directory.






