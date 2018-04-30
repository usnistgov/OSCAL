# Federal Risk and Authorization Management Program (FedRAMP) Profile Examples

The following representations of the "High", "Moderate" and "Low" baselines (profiles) are derived from [source data](https://www.fedramp.gov/documents/) defined by FedRAMP:

* [FedRAMP High Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_High_Security_Controls.xlsx)
* [FedRAMP MODERATE Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Moderate_Security_Controls.xlsx)
* [FedRAMP LOW Security Controls](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Low_Security_Controls.xlsx)

Machine made OSCAL Profile versions:

* [FedRAMP HIGH Baseline OSCAL Profile](FedRAMP_HIGH-baseline_profile.xml)
* [FedRAMP MODERATE Baseline OSCAL Profile](FedRAMP_MODERATE-baseline_profile.xml)
* [FedRAMP LOW Baseline OSCAL Profile](FedRAMP_LOW-baseline_profile.xml)

Each one of these captures the (indicated) spreadsheet data and represents it as an OSCAL profile, calling controls in from the appropriate SP 800-53 rev4 baselines or when necessary from the SP 800-53 rev4 catalog.

Specific FedRAMP guidance and parameter constraints are provided for each control.

### Extraction / conversion process

All control information from NIST SP 800-53 revision 4 and all FedRAMP control baseline details are correlated in an MS Access database, which is part of the MS Office 2016 product suite.
The FedRAMP profiles are created with MS Access Visual Basic for Applications (VBA) code, which queries the information and creates OSCAL-compliant XML using MSXML Document Object Model (DOM) Version 6.
This tool represents a proof-of-concept. Open-source tools may be developed in the future.

### Special considerations

Note also the profiles here make reference to profiles and catalogs stored in the neighbor '[SP 800-53](../SP800-53)' directory, on which they are dependent.

Also note that (at least according to Schematron `oscal-profiles-sources.sch`), several of the OSCAL invocations in these profiles could be rewritten to exclude rather than include controls. In a number of cases, invoking controls by exclusion will be much more concise than the same control set (selection) expressed by inclusion; the Schematron detects and reports on this.
