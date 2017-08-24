# OSCAL schema documentation

This subdirectory contains documentation, in OSCAL XML format, of the OSCAL schema and related resources such as Schematron constraint sets.

The publication version of the OSCAL schema is may be found in the [lib/XSD](../../lib/XSD) directory as file [oscal-documented.xsd](../../lib/XSD/oscal-documented.xsd). This file is produced via an automated process as described.

## Schema production

The OSCAL schema is currently maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2): see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead. For use by applications without support for RelaxNG, we convert this schema into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html), followed by an XProc pipeline to merge it with documentation in this subdirectory, producing artifacts including (a) an XSD with embedded documentation (the [publication version](../../lib/XSD/oscal-documented.xsd) named above), and (b) external documentation in HTML and markdown formats. See the [lib/XSD](../../lib/XSD) subdirectory for more information.

A RelaxNG version of the schema is not currently maintained but could be provided if needed. A compatible DTD is not planned (although it is not technically infeasible either).

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforces only some of the constraints that make an OSCAL document fit for use; other constraints may be described and enforced using ISO Schematron, or  at the application (implementation) level of the system. See the [lib/Schematron](../../lib/Schematron) subdirectory for more information.

These constraints should also be described and explained in documents found here, although at time of writing (2007-08-24) this documentation is TBD. Check file timestamps.

-----
