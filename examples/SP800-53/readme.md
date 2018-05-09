# NIST SP 800-53 Examples

This subdirectory contains provisional "finished", "best stable" versions of OSCAL catalogs and profiles related to NIST SP800-53. While not authoritative, as examples these are useful as demonstrations here and elsewhere inside `/examples`. The files are produced by a combination of automated and semi-automated (editorial) processes. Source files and transformations related to this production are *not* in this subdirectory -- the sausage is made in directory `/working/SP800-53`.

Note that in many ordinary working scenarios, users of OSCAL will not be writing or creating catalogs or low-level baselines (profiles) such as these, but only referencing them.

NIST SP 800-53 Revision 5 files are not yet available; for draft versions of Revision 5 files, see `working/SP800-53/rev5`.

The structure and contents of this directory are as follows:

* [pub](pub): This directory is TBD.
* [roundtripped](roundtripped): This directory is TBD.
* [SP800-53-HIGH-baseline.json](SP800-53-HIGH-baseline.json): This file contains an OSCAL profile in JSON format representing the High impact baseline profile (selection) of controls from `SP800-53-rev4-catalog.xml`. (The OSCAL profile is derived from the catalog via transformation.)
* [SP800-53-HIGH-baseline.xml](SP800-53-HIGH-baseline.xml): This file has the same contents as [SP800-53-HIGH-baseline.json](SP800-53-HIGH-baseline.json) except in XML format.
* [SP800-53-LOW-baseline.json](SP800-53-LOW-baseline.json): This file contains an OSCAL profile in JSON format representing the Low impact baseline profile (selection) of controls from `SP800-53-rev4-catalog.xml`.
* [SP800-53-LOW-baseline.xml](SP800-53-LOW-baseline.xml): This file has the same contents as [SP800-53-LOW-baseline.json](SP800-53-LOW-baseline.json) except in XML format.
* [SP800-53-MODERATE-baseline.json](SP800-53-MODERATE-baseline.json): This file contains an OSCAL profile in JSON format representing the Moderate impact baseline profile (selection) of controls from `SP800-53-rev4-catalog.xml`.
* [SP800-53-MODERATE-baseline.xml](SP800-53-MODERATE-baseline.xml): This file has the same contents as [SP800-53-MODERATE-baseline.json](SP800-53-MODERATE-baseline.json) except in XML format.
* [SP800-53-oscal-declarations.json](SP800-53-oscal-declarations.json): This is an OSCAL declarations file in JSON format, called in by the catalog for validating the properties and composition of controls in the catalog.
* [SP800-53-oscal-declarations.xml](SP800-53-oscal-declarations.xml): This file has the same contents as [SP800-53-oscal-declarations.json](SP800-53-oscal-declarations.json) except in XML format.
* [SP800-53-rev4-catalog.json](SP800-53-rev4-catalog.json): This file contains the full text of SP 800-53 revision 4 in JSON format, *including* information integrated from appendixes describing objectives and assessments for controls (SP 800-53A). The OSCAL is produced via transformation pipeline from NIST NVD XML source data. It is *not* an official version of this publication and cannot be warranted in any way except for purposes of these demonstrations.
* [SP800-53-rev4-catalog.xml](SP800-53-rev4-catalog.xml): This file has the same contents as [SP800-53-rev4-catalog.json](SP800-53-rev4-catalog.json) except in XML format.
