# OSCAL Metaschema

OSCAL supports XML and JSON-oriented schema validation technologies including XSD and JSON Schema (v7), for the various OSCAL formats now including catalog, profile and others to come (for other uses at higher layers). These and related artifacts are produced and coordinated from a metaschema using a Metaschema vocabulary (and processing) we are developing.

Current features of the metaschema:

* XSD and JSON Schema production, coordinated from a unified source
* Documentation (embedded and external)
* Automated conversion scripts (XSLT transformations) for converting between XML and JSON format(s) conformant to the given metaschema

Check out the [OSCAL Catalog Metaschema](../../schema/metaschema/oscal-catalog-metaschema.xml) in its current form.

In [that directory](../../schema/metaschema) you will also find [design notes](../../schema/metaschema/design-notes.md), an XSLT for displaying metaschemas in the browser, and shell scripts for running its transformations (invoking files stored here). Included among the transformations are several that create dynamic outputs (further tooling) in the form of schema files (XSD, JSON Schema, Schematron) or XSLT results; when run, these transformations should typically produce those outputs in relevant (other directories), such as:

* [XML directory for XSD (XML Schema Definition) results](../../schema/xml)
* [JSON directory for JSON Schema results](../../schema/json)
* [Conversion scripts between XML and JSON](../../util/convert)
* Documentation - is now being produced next to schemas, but should be redirected to /docs ... 

The current directory contains the libraries and transformation specifications (stylesheets) providing for these data transformations.

For the most part these transformations require a conformant XSLT 3.0 processor such as SaxonHE, as the script shows. Occasionally an XSLT has been written in version 1.0 to provide for greater ease of use (since many more processors than Saxon are available): they should work in a browser as well as in any conformant XSLT 1.0 processor.

## Operations

Listed here are operations currently supported with the top-level XSLTs for each operation, to be applied to a valid metaschema source document (such as the catalog metaschema):

- XSD Production [xml/produce-xsd.xsl](xml/produce-xsd.xsl)
- XML-to-JSON converter production: [xml/produce-xml-converter.xsl](xml/produce-xml-converter.xsl)
- XML-oriented documentation:
  - HTML version [xml/metaschema-xml-html.xsl](xml/metaschema-xml-html.xsl)
  - Markdown version [xml/metaschema-xml-docs-md.xsl](xml/metaschema-xml-docs-md.xsl)

- JSON Schema Production: [json/produce-json-schema.xsl](json/produce-json-schema.xsl)
- JSON-to-XML converter production: [json/produce-json-converter.xsl](xml/produce-json-converter.xsl) Note: run with parameter `$json-file` to name the JSON input file as noted in the shell script
- JSON-oriented documentation:
  - HTML version [json/metaschema-json-html.xsl](xml/metaschema-json-html.xsl)
  - Markdown version [xml/metaschema-json-docs-md.xsl](xml/metaschema-json-docs-md.xsl)

**But note** - for best results, producing JSON-oriented documentation requires an additional process to convert XML examples to JSON syntax examples. For this, different metaschema instances will require different transformation logic - provided by their respective conversion utilities. Sorting out and implementing logic to hide manage this dependency, is underway. For now, note that specialized Markdown-documentation XSLTs are also available for OSCAL formats for which we have metaschemas.
