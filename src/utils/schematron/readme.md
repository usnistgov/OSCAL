# OSCAL Schema XML Schematron

This subdirectory contains various Schematron constraint sets for application to OSCAL.

These are still experimental, provisional and subject to change. For more information see the Schematrons themselves (including embedded comments - but don't trust them entirely either).

The files included:

* [oscal-as-declared.sch](oscal-as-declared.sch): Validation of an OSCAL document against its own declarations, i.e., this is an implementation of semantics related to OSCAL declarations. *This is deprecated* while we integrate the declarations work.
* [oscal-functions.xsl](oscal-functions.xsl): TBD.
* [oscal-links.sch](oscal-parameters.sch): Link checking including the detection of broken internal links (but not external links).
* [oscal-parameters.sch](oscal-parameters.sch): Special constraints (with Quickfix logic) applicable to parameters and their assignments (`insert` elements).
* [oscal-profile-sources.sch](oscal-profile.sch): Checking a profile against its authority or source, the profile, catalog or framework that it references. For example, an error is thrown for "dangling calls" to controls that are not found. Note, for performance this Schematron takes advantage of a feature in licensed copies of Saxon, which provides acceptable run times. Until code is refactored to work around this limitation, unlicensed Saxon or other XSLT processors may be slow (on the order of minutes for larger control sets).
* [oscal-profile.sch](oscal-profile.sch): Constraints applicable to OSCAL profiles - clashing calls, etc.

Additionally, for the SP800-53 catalog source XML, see the Schematron files included with the source data in its home directory.
