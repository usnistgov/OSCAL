# OSCAL XML Schema Files and Directories

In its XML expression, OSCAL relies on a layered validation model.

Note that internally, applications may permit documents to be temporarily invalid in any of the following senses: our definition of "OSCAL" here pertains only to XML presented as such.

1. An OSCAL document* (when serialized) will be XML well-formed
1. An OSCAL document will be valid to declarations given in a relevant OSCAL schema
     * OSCAL elements will all be in the namespace `http://csrc.nist.gov/ns/oscal/1.0`

1. When provided with (OSCAL) declarations, an OSCAL document will report no errors or warnings from Schematron `oscal-as-declared.sch`
1. Additionally, an OSCAL document produces no errors from other Schematrons as provided for strict or application-specific compliance
1. Finally, local implementations or applications of OSCAL may follow local norms, rules or conventions that are not enforced or not formally or consistently enforced

\* May be a composite document or dynamically produced instance; this is not a 'file'

The structure and content of the directory are as follows:

* [RNC](RNC): This directory contains the **maintenance versions** of schema files, as well as convenient top-level (that is, entry point) schemas for the top-level elements `catalog`, `framework` and `worksheet`.
* [Schematron](Schematron): This directory has lots of useful Schematron files, including for testing of OSCAL against OSCAL declaration sets.
* [XSD](XSD): This directory is where temp file XSDs are kept. It is also the home directory of schema maintenance-related tasking (XProc and XSLTs).
* [oscal-catalog.xsd](oscal-catalog.xsd): This file is a reference copy of the OSCAL schema. Any OSCAL document except profiles will be valid to this schema. This (machine-generated) copy of the maintenance schema has element descriptors (embedded documentation) injected into it for use by tools.
* [oscal-declarations.xsd](oscal-declarations.xsd): This file permits having a standalone (independent) XML document artifact for OSCAL declarations, which other documents (especially catalogs) can make reference to instead of including inline. OSCAL declarations permit the specification of constraints to be enforced over control contents as represented in OSCAL.
* [oscal-profile.xsd](oscal-profile.xsd): This file is a reference copy of the entry schema for OSCAL **profile** documents.
* [xml.xsd](xml.xsd): This file is a component for the XML namespace required by the foregoing (due to permission of top-level attributes for XSD support).
