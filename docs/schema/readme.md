# OSCAL Schema Documentation

This directory contains documentation, in OSCAL XML format, of the OSCAL schema and related resources such as Schematron constraint sets. The publication versions of the OSCAL schemas may be found in the [schema/XML](../../schema/XML) directory.

This directory's structure and contents are as follows:

* [lib](lib): This directory contains a variety of supporting files used by other files within this directory.
* [_catalogXML.md](_catalogXML.md): This file contains catalog schema documentation produced by the Oxygen IDE.
* [_declarationsXML.md](_declarationsXML.md): This file contains declarations schema documentation produced by the Oxygen IDE.
* [_profileXML.md](_profileXML.md): This file contains profile schema documentation produced by the Oxygen IDE.
* [oscal-docs-html.xsl](oscal-docs-html.xsl): This file contains code for a bare-bones OSCAL display suitable for browser rendering or conversion into Markdown. This file was written and optimized for [oscal-oscal.xml](oscal-oscal.xml).
* [oscal-docs.sch](oscal-docs.sch): This file contains Schematron for validating [oscal-oscal.xml](oscal-oscal.xml) against the schemas (XSD) it purportedly describes.
* [oscal-oscal-decls.xml](oscal-oscal-decls.xml): This is an OSCAL file relating to oscal-oscal.xml (tagging documentation) containing declarations of (some of) the constraints (over usage of properties and parts) followed in that document. As such, it is an example of the OSCAL declarations model in an application different from a control catalog.
* [oscal-oscal.xml](oscal-oscal.xml): This file contains the document model and tagging specification.
* [produce-xml-schema-docs.sh](produce-xml-schema-docs.sh): This file invokes [lib/produce-schema-docs-md.xpl](lib/produce-schema-docs-md.xpl) to produce Markdown-formatted documentation of schema modules.
