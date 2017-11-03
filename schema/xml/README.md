# Open Security Controls Assessment Language (OSCAL) XML Schema

In its XML expression, OSCAL relies on a layered validation model.

Note that internally, applications may permit documents to be temporarily invalid in any of the following senses: our definition of "OSCAL" here pertains only to XML presented as such.

1. An OSCAL document* (when serialized) will be XML well-formed
1. An OSCAL document will be valid to declarations given in a relevant OSCAL schema
     * OSCAL elements will all be in the namespace `http://csrc.nist.gov/ns/oscal/1.0`
     
1. When provided with (OSCAL) declarations, an OSCAL document will report no errors or warnings from Schematron `oscal-as-declared.sch`
1. Additionally, an OSCAL document produces no errors from other Schematrons as provided for strict or application-specific compliance
1. Finally, local implementations or applications of OSCAL may follow local norms, rules or conventions that are not enforced or not formally or consistently enforced

\* May be a composite document or dynamically produced instance; this is not a 'file'

XML schemas:


`oscal-profile.xsd` | Reference copy of the entry schema for OSCAL **profile** documents.

`oscal-core.xsd` | Reference copy of the OSCAL schema. Any OSCAL document except profiles will be valid to this schema. This (machine-generated) copy of the maintenance schema has element descriptors (embedded documentation) injected into it for use by tools.

`xml.xsd` | component for XML namespace required by the foregoing.

Also in this subdirectory:

`RNC` - is the home of the **maintenance versions** of schema files, as well as convenient top-level (that is, entry point) schemas for the top-level elements `catalog`, `framework` and `worksheet`.

`XSD` is where temp file XSDs are kept and the home directory of schema maintenance-related tasking (XProc and XSLTs).

`Schematron` has lots of useful Schematron including testing of OSCAL against OSCAL declaration sets, and more. Validations, beyond the schema.
