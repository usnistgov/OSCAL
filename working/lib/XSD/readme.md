# OSCAL Schema Resources

## Schema production

There are currently two top-level OSCAL schemas, the 'core' and the (experimental) 'profile' schema.

'core' [oscal-core.xsd](oscal-core.xsd) validates anything but profile documents, which are not full catalogs or catalog-like compilations, but only references into catalogs and frameworks.

'profile' [oscal-profile.xsd](oscal-profile.xsd) offers the simplest interface to OSCAL: it is for referencing catalogs not writing them

For convenience, there are also two runtime aliases to core, namely [oscal-catalog.xsd](oscal-catalog.xsd) (nominally, for tagging control catalogs) and [oscal-framework.xsd](oscal-framework.xsd) which is **EXPERIMENTAL** currently used internally in pipelines or as a "worksheet" format. 

All of these call on the core module for declarations; indeed currently `catalog` and `framework` are maintained only as entry points (with all their respective declarations in core, not yet split out). Accordingly, any OSCAL catalog or framework document (but not profile) can also validate against the core schema standalone -- and, because of a weakness in XSD import as compared to RNG, they will persist in validating one another as well. (When validating against the RNC, only nominal catalogs will validate against the catalog schema, etc.)

Of the three nominal document formats, only `catalog` is nearing stability (end of Sprint 4). However, all the schemas are functional and maintained fairly closely in sync with demonstration code and examples.

Each of these schemas is maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2); see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead; maintainers should also find RNC relatively legible next to XSD. For use by applications without support for RelaxNG, we convert the schemas into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html). The XSD it produces from `oscal-core.rnc` appears here as [oscal-interim-core.xsd](oscal-interim-code.xsd).

The distribution copy of [oscal-core.xsd](oscal-code.xsd) is subsequently produced by a call to an XProc pipeline [schema-production.xpl](schema-production.xpl). While simultaneously performing other chores in schema maintenance (namely, production of external documentation), this pipeline (consisting of an orchestrated set of XSLT transformations) also produces a version of the XSD, into which structured documentation has been injected. See the [doc/schema](../../docs/schema) subdirectory for these resources.

(Currently, the elements in the largely untested 'profile' format are not documented; this remains tbd.)

RelaxNG versions of the schema (XML syntax) are not currently maintained but could be provided if needed (or produced from the working RNC version using Trang). A compatible DTD is not planned and some aspects of content modeling (such as `group` being different inside catalogs and frameworks) would hinder a straight-up mapping into DTD content models.

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforce only some of the constraints that make an OSCAL document fit for use. Other constraints may be described and enforced using ISO Schematron, or at the application (implementation) level of the system. See the [lib/Schematron](../../lib/Schematron) subdirectory for more information.
