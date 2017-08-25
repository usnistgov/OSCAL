# OSCAL Schema resources

## Schema production

The publication version of the OSCAL schema is maintained here as [oscal-documented.xsd](oscal-documented.xsd).

The OSCAL schema is currently maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2): see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead. For use by applications without support for RelaxNG, we convert this schema into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html); its results appear here as [oscal-interim.xsd](oscal-interim.xsd).

Additionally, we process this file with an XProc pipeline [schema-production.xpl](schema-production.xpl) to merge it with documentation [maintained elsewhere](../../doc/schema) (in OSCAL format), producing artifacts including (a) an XSD with embedded documentation (the [publication version](oscal-documented.xsd) named above), and (b) external documentation in HTML and markdown formats. See the [doc/schema](../../doc/schema) subdirectory for these resources.

A RelaxNG version of the schema is not currently maintained but could be provided if needed. A compatible DTD is not planned (although it is not technically infeasible either).

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforces only some of the constraints that make an OSCAL document fit for use; other constraints may be described and enforced using ISO Schematron, or  at the application (implementation) level of the system. See the [lib/Schematron](../../lib/Schematron) subdirectory for more information.

