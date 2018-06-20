# OSCAL Metaschema

Check out the [OSCAL Catalog Metaschema](../../schema/metaschema/oscal-catalog-metaschema.xml) in its current form. This directory contains the libraries and transformation specifications (stylesheets) providing for data transformations in support of a metaschema infrastructure for OSCAL data.

Current features of the metaschema:

* XSD and JSON Schema production, coordinated from a unified source
* Documentation (embedded and external)
* Automated conversion scripts (XSLT transformations) for converting between XML and JSON format(s) conformant to the given metaschema

To see how to invoke metaschema components, see the shell script in the [schema/metaschema](../../schema/metaschema) directory. For the most part these transformations require a conformant XSLT 3.0 processor such as SaxonHE, as the script shows.

*Except*: some of the transformations here are XSLT 1.0 and will *function in any modern web browser* to transform XML for page display (subject to configuration challenges). Copy them next to a metaschema, link to them using a PI, and open in a browser and see. (Firefox will do this if the XSLT sits next to the invoking XML.)

For example:

```
<?xml-stylesheet type="text/xsl" href="metaschema-json-html.xsl"?>

```

at the top of an XML file, will instruct a friendly browser to apply the named stylesheet.

These components include:

* [metaschema-json-html.xsl](metaschema-json-html.xsl) for producing JSON-oriented documentation
* [metaschema-xml-html.xsl](metaschema-xml-html.xsl) for producing XML-oriented documentation
* [metaschema-common-html.xsl](metaschema-common-html.xsl) a module of code shared by the others

Copies of these files (and of the ) may be propagated, while the versions here should be considered most current.
