# OSCAL Metaschema

Check out the [OSCAL Catalog Metaschema](../../schema/metaschema/oscal-catalog-metaschema.xml) in its current form. This directory contains the libraries and transformation specifications (stylesheets) providing for data transformations in support of a metaschema infrastructure for OSCAL data.

Current features of the metaschema:

* XSD and JSON Schema production, coordinated from a unified source
* Documentation (embedded and external)
* Automated conversion scripts (XSLT transformations) for converting between XML and JSON format(s) conformant to the given metaschema

To see how to invoke metaschema components, see the shell script in the [schema/metaschema](../../schema/metaschema) directory.

Where XSLT are version 1.0, they should work in a browser as well as a conformant XSLT 1.0 processor. For the most part these transformations require a conformant XSLT 3.0 processor such as SaxonHE, as the script shows.

Included among the transformations here are several that create dynamic outputs (further tooling) in the form of schema files (XSD, JSON Schema, Schematron) or XSLT results.
