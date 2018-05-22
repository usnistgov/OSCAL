# OSCAL Schema Resources

This subdirectory relates to XSD versions of the OSCAL schemas.

Neighboring subdirectories contain resources relating to RNC versions as well as to complementary (extra-schema) validations supported by Schematron.

## Schema production

New design!

For flexibility in development, we continue to maintain in RNC and produce occasional "release" versions in XSD. The XSDs are fully documented internally, as well as provided with out of line (corresponding) documentation.

Now there are three entry point schemas: `catalog`, `declarations`, and `profile`. Experimental features may now be found in RNC sources, but not in the XSDs. Note that while XSD itself does not constrain that the given (stipulated) element entry point actually be used (i.e. that your XML root or document element be one of these three elements), the given models accommodate that usage.

The source code for the published versions is maintained deeper within the subdirectory. They are produced in a build process from sources that integrate them with documentation, from "masters" maintained (for the present) using RNC notation.

The same pipeline aligns with our expected JSON schema artifacts. Eventually we may switch out RNG for a different meta-notation able to drive the production of XSD the way we presently do. (We would prefer not to author XSD by hand.)

'catalog' [oscal-catalog.xsd](oscal-catalog.xsd)

'profile' [oscal-profile.xsd](oscal-profile.xsd) offers the simplest interface to OSCAL: it is for referencing catalogs not writing them; the root element will be `<profile>`.

'declarations' [oscal-declarations.xsd](oscal-declarations.xsd) OSCAL offers, in addition to constraints enforced by language definition files, additional constraints to be declared and applied dynamically to its (document) contents. This is done by using the set of elements described in this schema (module).

for each module:
1. Produce pre-injection XSD from RNC using Trang (in IDE)
1. Inject schema docs

Then for all/any modules together:
1. Produce HTML/MD docs for schemas from oscal-oscal.xml


RelaxNG versions of the schema (XML syntax) are not currently maintained but could be provided if needed (or produced from the working RNC version using Trang). A compatible DTD is not planned and some aspects of content modeling (such as `group` being different inside catalogs and frameworks) would hinder a straight-up mapping into DTD content models.

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforce only some of the constraints that make an OSCAL document fit for use. Other constraints may be described and enforced using ISO Schematron, or at the application (implementation) level of the system. See the [../Schematron](../Schematron) subdirectory for more.
