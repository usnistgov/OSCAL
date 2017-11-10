# NIST SP800-53 Examples

This subdirectory contains provisional "finished" versions of OSCAL catalogs and profiles related to NIST SP800-53. While not authoritative, as examples these are close enough for demonstration.

The files are produced by a combination of automated and semi-automated (editorial) processes. Source files and transformations related to this production are *not* in this subdirectory -- learn how to make the sausage over in directory `/working/SP800-53`. This directory contains OSCAL versions useful as demonstrations. Some of these files (especially the baseline profiles of SP800-53 included here) may also be used in demonstrations elsewhere inside `/examples`.

Revision 5 files are not yet available; for draft versions of rev 5 files, see `working/SP800-53/rev5`.

------------ | -------------
`SP800-53-rev4-catalog.xml` | Full text of SP800-53, revision 4, *including* information integrated from appendixes describing objectives and assessments for controls (SP800-53A). The OSCAL is produced via transformation pipeline from NIST NVD XML source data. It is *not* an official version of this publication and cannot be warranted in any way except for purposes of these demonstrations.
`SP800-53-rev4-catalog.xml` | OSCAL declarations file, called in by the catalog for validating the properties and composition of controls in the catalog. 
`SP800-53-rev4-HIGH-baseline.xml` | An OSCAL profile representing the High Impact Baseline profile (selection) of controls from `SP800-53-rev4-catalog.xml`. (The OSCAL profile is derived from the catalog via transformation.)
`SP800-53-rev4-MODERATE-baseline.xml` | An OSCAL profile representing the Moderate Impact Baseline profile of rev 4 of the catalog. (Produced using the same transformation with different selection criteria.)
`SP800-53-rev4-LOW-baseline.xml` | The same for the Low Impact Baseline.

## Validations performed

All files here are valid to the OSCAL **core schema** (for the catalog and declarations file) or **profile schema** (for the profiles). Schema bindings are not given in these files; feel free to configure your bindings in any way appropriate for the processing environment.

Files are also valid to Schematron constraint sets,  as noted:

* No files report errors from Schematron `oscal-strict.sch` (which checks some name usage constraints).
* File `SP800-53-rev4.xml` reports no errors from Schematron `oscal-as-declared.sch`, indicating no errors of validation of OSCAL contents against declarations in `SP800-53-declarations.xml`. This ensures consistency of controls in a catalog over and above what the schema enforces.
* The catalog (the same file) also reports no errors from `oscal-links.sch` -- and four warnings (correctly reported) for `link` elements with no targets.
* The three profile documents also report no errors from `oscal-profile.sch`. Among other things that Schematron verifies the structural integrity between profiles and the resources (profiles or catalogs) they cite.



