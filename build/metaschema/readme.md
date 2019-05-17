# OSCAL Metaschema

OSCAL supports XML and JSON-oriented schema validation technologies including XSD and JSON Schema (v7), for the various OSCAL formats now including catalog, profile and others to come (for other uses at higher layers). These and related artifacts are produced and coordinated using a Metaschema vocabulary (and processing) we are developing.

Current features of the metaschema:

* XSD and JSON Schema production, coordinated from a unified source
* Documentation (embedded and [web-based](https://pages.nist.gov/OSCAL/docs/schemas/))
* Automated conversion scripts (XSLT transformations) for converting between XML and JSON format(s) conformant to the given metaschema

To see an example of a metaschema, check out the [OSCAL Catalog Metaschema](../../src/metaschema/oscal-catalog-metaschema.xml) in its current form.

In [that directory](../../schema/metaschema) you will also find [design notes](../../src/metaschema/design-notes.md), an XSLT for displaying metaschemas in the browser, and shell scripts for running its transformations (invoking files stored here). Included among the transformations are several that create further tooling in the form of schema files (XSD, JSON Schema, Schematron) or XSLT results; when run, these transformations should typically produce those outputs in relevant (other directories), such as:

* [XML schema](../../xml/schema)
* [JSON schema](../../json/schema)
* Conversion scripts for translating OSCAL content to [XML](../../xml/convert) and [JSON](../../json/convert)
* JSON and XML model documentation provided on the [OSCAL website](https://pages.nist.gov/OSCAL/docs/schemas/)

The current directory contains the libraries and transformation specifications (stylesheets) providing for these data transformations.

For the most part these transformations require a conformant XSLT 3.0 processor such as SaxonHE, as the script shows. Occasionally an XSLT has been written in version 1.0 to provide for greater avilability: they should work in web browsers (with suitable configuratios) as well as in any conformant XSLT 1.0 processor.

## Operations

Listed here are operations currently supported with the top-level XSLTs for each operation, to be applied to a valid metaschema source document (such as the catalog metaschema):

### XML OSCAL

- XSD Production [xml/produce-xsd.xsl](xml/produce-xsd.xsl) - use XSD to provide structural validation to your OSCAL XML
- XML-to-JSON converter production: [xml/produce-xml-converter.xsl](xml/produce-xml-converter.xsl) - makes a utility for converting XML OSCAL into equivalent JSON OSCAL
- XML-oriented documentation:
  - HTML version [xml/metaschema-xml-html.xsl](xml/metaschema-xml-html.xsl)
  - Markdown version [xml/metaschema-xml-docs-md.xsl](xml/metaschema-xml-docs-md.xsl)

### JSON OSCAL

- JSON Schema Production: [json/produce-json-schema.xsl](json/produce-json-schema.xsl) structural validations again but this time over JSON using JSON Schema v7
- JSON-to-XML converter production: [json/produce-json-converter.xsl](xml/produce-json-converter.xsl) Note: run with parameter `$json-file` to name the JSON input file as noted in the shell script
- JSON-oriented documentation:
  - HTML version [json/metaschema-json-html.xsl](xml/metaschema-json-html.xsl)
  - Markdown version [xml/metaschema-json-docs-md.xsl](xml/metaschema-json-docs-md.xsl)
