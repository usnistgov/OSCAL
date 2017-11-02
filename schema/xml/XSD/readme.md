# OSCAL Schema Resources

## Schema production

In XSD, there are currently two top-level OSCAL schemas, the 'core' and the (experimental) 'profile' schema.

'core' [oscal-core.xsd](oscal-core.xsd) validates anything but profile documents, which are not full catalogs or catalog-like compilations, but only references into catalogs and frameworks. If the root (document) element of your XML is `<catalog>`, `<profile>`, `<declarations>` or `<framework>`, your document may be valid to this schema.

'profile' [oscal-profile.xsd](oscal-profile.xsd) offers the simplest interface to OSCAL: it is for referencing catalogs not writing them; the root element will be `<profile>`.

As alternatives to the XSD, developers may wish to consult the maintenance versions of both schemas are kept in the higher subdirectory as 
[oscal-core.rnc](../oscal-core.rnc) and 
[oscal-profile.rnc](../oscal-profile.rnc), where they may be referenced directly. For users of RNC, two additional entry points for validation are also offered (in that subdirectory) as conveniences:  [../oscal-catalog.rnc](../oscal-catalog.rnc) (nominally, for tagging control catalogs only) and [oscal-framework.rnc](oscal-framework.rnc) which is **EXPERIMENTAL** currently used internally in pipelines or as a "worksheet" format. Documents valid to these more restrictive variants will also however also be valid using the core module alone.

Of the three nominal document formats, only `catalog` is nearing stability (end of Sprint 4). However, all the schemas are functional and maintained fairly closely in sync with demonstration code and examples.

Each of these schemas is maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2); see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead; maintainers should also find RNC relatively legible next to XSD. For use by applications without support for RelaxNG, we convert the schemas into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html). The XSD it produces from `oscal-core.rnc` appears here as [oscal-interim-core.xsd](oscal-interim-code.xsd).

The distribution copy of [oscal-core.xsd](oscal-code.xsd) is subsequently produced by a call to an XProc pipeline [schema-production.xpl](schema-production.xpl). While simultaneously performing other chores in schema maintenance (namely, production of external documentation), this pipeline (consisting of an orchestrated set of XSLT transformations) also produces a version of the XSD, into which structured documentation has been integrated for use by tools. See the [doc/schema](../../docs/schema) subdirectory for the documentation resources.

(Currently, the elements in the largely untested 'profile' format are not documented; this remains tbd.)

RelaxNG versions of the schema (XML syntax) are not currently maintained but could be provided if needed (or produced from the working RNC version using Trang). A compatible DTD is not planned and some aspects of content modeling (such as `group` being different inside catalogs and frameworks) would hinder a straight-up mapping into DTD content models.

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforce only some of the constraints that make an OSCAL document fit for use. Other constraints may be described and enforced using ISO Schematron, or at the application (implementation) level of the system. See the [lib/Schematron](../../lib/Schematron) subdirectory for more information.
