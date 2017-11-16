# OSCAL Schema Resources

This subdirectory relates to XSD versions of the OSCAL schemas.

Neighboring subdirectories contain resources relating to RNC versions as well as to complementary (extra-schema) validations supported by Schematron.

## Schema production

The two top-level OSCAL schemas ('core' and 'profile') stored in the subdirectory above are produced by processing files in this directory. These in turn are not maintained by hand, but are produced by tooling from the actual maintenance versions in RNC. This subdirectory contains only processing logic for schema production along with temporary intermediate files.

These are, however, also fully functional:

'core' [../oscal-core-interim.xsd](../oscal-core-interim.xsd) validates anything but profile documents, which are not full catalogs or catalog-like compilations, but only references into catalogs and frameworks. If the root (document) element of your XML is `<catalog>`, `<profile>`, `<declarations>` or `<framework>`, your document may be valid to this schema.

'profile' [../oscal-profile-interim.xsd](../oscal-profile-interim.xsd) offers the simplest interface to OSCAL: it is for referencing catalogs not writing them; the root element will be `<profile>`.

The distribution copies of [oscal-core.xsd](oscal-core.xsd) and [oscal-profile.xsd](oscal-profile.xsd) are subsequently produced by a call to an XProc pipeline [schema-production.xpl](schema-production.xpl). This process produces several outputs, including a cleaned-up version of the XSD, into which structured documentation has been integrated for use by tools, along with updated schema documentation. See the [doc/schema](../../docs/schema) subdirectory for the documentation resources.

Note that this process now has to be run separately for the two schema modules, although documentation it produces for both is the same (and integrated).

RelaxNG versions of the schema (XML syntax) are not currently maintained but could be provided if needed (or produced from the working RNC version using Trang). A compatible DTD is not planned and some aspects of content modeling (such as `group` being different inside catalogs and frameworks) would hinder a straight-up mapping into DTD content models.

## Validation of OSCAL goes beyond the schema

The XSD schema (and its RNC source) enforce only some of the constraints that make an OSCAL document fit for use. Other constraints may be described and enforced using ISO Schematron, or at the application (implementation) level of the system. See the [../Schematron](../Schematron) subdirectory for more.
