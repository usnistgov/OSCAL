# NIST SP 800-53 Examples

This subdirectory contains provisional "finished", "best stable" versions of OSCAL catalogs and profiles related to NIST SP800-53. While not authoritative, as examples these are useful as demonstrations. The files have been produced by a combination of automated and semi-automated (editorial) processes.

Note that in many ordinary working scenarios, users of OSCAL will not be writing or creating catalogs or low-level baselines (profiles) such as these, but only referencing them.

NIST SP 800-53 Revision 5 files are not yet available. We hope to post these in the near future.

This directory contains OSCAL catalog and profile content for SP 800-53 revision 4.

## OSCAL SP 800-53 Revision 4 Catalog Content

* [NIST_SP-800-53_rev4_catalog.json](NIST_SP-800-53_rev4_catalog.json): This file contains the full text of SP 800-53 revision 4 in OSCAL JSON format, *including* information integrated from appendixes describing objectives and assessments for controls (SP 800-53A). This OSCAL catalog is produced via transformation pipeline from NIST NVD XML source data. It is *not* an official version of this publication and cannot be warranted in any way except for purposes of these demonstrations.
* [NIST_SP-800-53_rev4_catalog.xml](NIST_SP-800-53_rev4_catalog.xml): This file has the same contents as [NIST_SP-800-53_rev4_catalog.json](SP800-53-rev4-catalog.json) except in XML format.
* [NIST_SP-800-53_rev4_declarations.json](NIST_SP-800-53_rev4_declarations.json): This is an OSCAL declarations file in JSON format, called in by the catalog for validating the properties and composition of controls in the catalog.
* [NIST_SP-800-53_rev4_declarations.xml](NIST_SP-800-53_rev4_declarations.xml): This file has the same contents as [NIST_SP-800-53_rev4_declarations.json](NIST_SP-800-53_rev4_declarations.json) except in XML format.

## OSCAL SP 800-53 Revision 4 Baseline Profile Content

* [NIST_SP-800-53_rev4_LOW-baseline_profile.json](NIST_SP-800-53_rev4_LOW-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the Low impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
* [NIST_SP-800-53_rev4_LOW-baseline_profile.xml](NIST_SP-800-53_rev4_LOW-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_LOW-baseline_profile.json](NIST_SP-800-53_rev4_LOW-baseline_profile.json) except in XML format.
* [NIST_SP-800-53_rev4_MODERATE-baseline_profile.json](NIST_SP-800-53_rev4_MODERATE-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the Moderate impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
* [NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml](NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_MODERATE-baseline_profile.json](NIST_SP-800-53_rev4_MODERATE-baseline_profile.json) except in XML format.
* [NIST_SP-800-53_rev4_HIGH-baseline_profile.json](NIST_SP-800-53_rev4_HIGH-baseline_profile.json): This file contains an OSCAL profile in JSON format representing the High impact baseline profile (selection) of controls based on `NIST SP 800-53 rev4 Appendix D`.
* [NIST_SP-800-53_rev4_HIGH-baseline_profile.xml](NIST_SP-800-53_rev4_HIGH-baseline_profile.xml): This file has the same contents as [NIST_SP-800-53_rev4_HIGH-baseline_profile.json](NIST_SP-800-53_rev4_HIGH-baseline_profile.json) except in XML format.
