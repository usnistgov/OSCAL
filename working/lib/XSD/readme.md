# OSCAL Schema Resources

## Schema production


The publication version of the OSCAL schema is maintained here as [oscal-core.xsd](oscal-core.xsd) but in use you may wish to refer instead to any of:

* [oscal-catalog.xsd](oscal-catalog.xsd) - for describing control catalogs
* [oscal-profile.xsd](oscal-profile.xsd) - the simplest interface to OSCAL (for referencing catalogs but not writing them)
* [oscal-framework.xsd](oscal-framework.xsd) - EXPERIMENTAL - used internally in pipelines or as a "worksheet" format

All of these call on the core module for declarations; in the case of `catalog` and `framework` they are only entry points. Accordingly, any OSCAL catalog or framework document (but not profile) can also validate against the core schema standalone.

Of the three nominal document formats, only `catalog` is nearing stability. However, all the schemas are functional and maintained fairly closely in sync with demonstration code and examples.

Each of these schemas is maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2); see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead. For use by applications without support for RelaxNG, we convert the schemas into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html). The direct results of `oscal-core.rnc` appear here as [oscal-interim-core.xsd](oscal-interim-code.xsd).

Additionally, we process this file with an XProc pipeline [schema-production.xpl](schema-production.xpl) to merge it with documentation [maintained elsewhere](../../doc/schema) (in OSCAL format), producing artifacts including (a) an XSD with embedded documentation (the [publication version](oscal-core.xsd) named above), and (b) external documentation in HTML and Markdown formats. See the [doc/schema](../../doc/schema) subdirectory for these resources.

(Currently, the elements in the largely untested 'profile' format are not documented; this remains tbd.)

RelaxNG versions of the schema (XML syntax) are not currently maintained but could be provided if needed (or produced from the working RNC version using Trang). A compatible DTD is not planned and some aspects of content modeling (such as `group` being different inside catalogs and frameworks) would hinder a straight-up mapping into DTD content models.

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforce only some of the constraints that make an OSCAL document fit for use. Other constraints may be described and enforced using ISO Schematron, or at the application (implementation) level of the system. See the [lib/Schematron](../../lib/Schematron) subdirectory for more information.
