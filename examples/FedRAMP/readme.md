# Federal Risk and Authorization Management Program (FedRAMP) Profile Examples

The source data from which are derived these representations of the "High", "Moderate" and "Low" baselines (profiles) defined by FedRAMP can be found [here](https://www.fedramp.gov/documents/):

* [FedRAMP High Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_High_Security_Controls.xlsx)
* [FedRAMP MODERATE Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Moderate_Security_Controls.xlsx)
* [FedRAMP LOW Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Low_Security_Controls.xlsx)

The three spreadsheets we used for LOW, MODERATE and HIGH are archived in the `sources` directory.

Machine made versions (hot out of the oven; see below for details)

* `FedRAMP_HIGH-baseline_profile.xml`
* `FedRAMP_MODERATE-baseline_profile.xml`
* `FedRAMP_LOW_profile.xml`

Each one of these captures the (indicated) spreadsheet data and represents it as an OSCAL profile, calling controls in from the appropriate SP800-53 baselines or when necessary in the SP800-53 catalog.

Specific FedRAMP guidance and parameter constrants are provided for each control.

### Extraction / conversion process

All control information from NIST SP 800-53, Revistion 4 and all FedRAMP control baseline details are corrilated in an MS Access database, which is part of the MS Office 2016 product suite.
The FedRAMP profiles are created with MS Access Visual Basic for Applications (VBA) code, which queries the information and creates OSCAL-compliant XML using MSXML Document Object Model (DOM) Version 6.
This tool represents a proof-of-concept. Open-source tools may be developed in the future.

### Special considerations

Note also the profiles here make reference to profiles and catalogs stored in the neighbor `SP800-53` directory, on which they are dependent.

Also note that (at least according to Schematron `oscal-profiles-sources.sch`), several of the OSCAL invocations in these profiles could be rewritten to exclude rather than include controls. In a number of cases, invoking controls by exclusion will be much more concise than the same control set (selection) expressed by inclusion; the Schematron detects and reports on this.
