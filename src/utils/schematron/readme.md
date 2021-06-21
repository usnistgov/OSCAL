# OSCAL Schema XML Schematron

This subdirectory contains various Schematron constraint sets for application to OSCAL.

These are still experimental, provisional and subject to change. For more information see the Schematrons themselves (including embedded comments - but don't trust them entirely either).

The files included:

* [oscal-functions.xsl](oscal-functions.xsl): TBD.
* [oscal-profile-sources.sch](oscal-profile.sch): Checking a profile against its authority or source, the profile, catalog or framework that it references. For example, an error is thrown for "dangling calls" to controls that are not found. Note, for performance this Schematron takes advantage of a feature in licensed copies of Saxon, which provides acceptable run times. Until code is refactored to work around this limitation, unlicensed Saxon or other XSLT processors may be slow (on the order of minutes for larger control sets).
* [oscal-profile.sch](oscal-profile.sch): Constraints applicable to OSCAL profiles - clashing calls, etc.

Additionally, for the SP800-53 catalog source XML, see the Schematron files included with the source data in its home directory.
