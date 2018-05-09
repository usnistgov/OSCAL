# OSCAL Schema Documentation

This directory contains documentation, in OSCAL XML format, of the OSCAL schema and related resources such as Schematron constraint sets. The publication versions of the OSCAL schemas may be found in the [schema/XML](../../schema/XML) directory.

This directory's structure and contents are as follows:

* [lib](lib): This directory contains a variety of supporting files used by other files within this directory.
* [oxygen-docs](oxygen-docs): This directory contains TBD.
* [_catalogXML.md](_catalogXML.md): This file contains TBD.
* [_declarationsXML.md](_declarationsXML.md): This file contains TBD.
* [_profileXML.md](_profileXML.md): This file contains TBD.
* [oscal-docs-html.xsl](oscal-docs-html.xsl): This file contains code for a bare-bones OSCAL display suitable for browser rendering or conversion into Markdown. This file was written and optimized for [oscal-oscal.xml](oscal-oscal.xml).
* [oscal-docs.sch](oscal-docs.sch): This file contains Schematron for validating [oscal-oscal.xml](oscal-oscal.xml) against the schemas (XSD) it purportedly describes.
* [oscal-oscal-decls.xml](oscal-oscal-decls.xml): This file contains TBD.
* [oscal-oscal.xml](oscal-oscal.xml): This file contains the document model and tagging specification.
* [oscal-tag-library.html](oscal-tag-library.html):
* [oscal-tag-library.md](oscal-tag-library.md): (element definitions) in this subdirectory, produced from that file. Currently, only elements are described; TBD are attribute definitions along with more background and perhaps examples.
* [produce-xml-schema-docs.sh](produce-xml-schema-docs.sh): This file invokes [lib/produce-schema-docs-md.xpl](lib/produce-schema-docs-md.xpl) to produce Markdown-formatted documentation of schema modules.
* [schema-doc.xsl](schema-doc.xsl): This file contains TBD.
