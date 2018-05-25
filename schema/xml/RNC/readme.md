# OSCAL schemas (maintenance RNC versions)

This directory contains maintenance RNC versions of schemas. These schemas are maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2); see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead; maintainers should also find RNC relatively legible next to XSD. The schema files are as follows:

* [oscal-catalog.rnc](oscal-catalog.rnc)
* [oscal-core.rnc](oscal-core.rnc)
* [oscal-declarations.rnc](oscal-declarations.rnc)
* [oscal-experimental.rnc](oscal-experimental.rnc)
* [oscal-framework.rnc](oscal-framework.rnc)
* [oscal-implementation.rnc](oscal-implementation.rnc)
* [oscal-profile.rnc](oscal-catalog.rnc)
* [oscal-worksheet.rnc](oscal-worksheet.rnc)

These schemas are especially convenient because they also validate the element at the top - something XSD doesn't actually support!

For use by applications without support for RelaxNG, we convert the schemas into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html). Trang's results are saved in the neighbor /XSD subdirectory as [../XSD/oscal-core-interim.xsd](../XSD/oscal-core-interim.xsd) and  [../XSD/oscal-profile-interim.xsd](../XSD/oscal-profile-interim.xsd), where they are made available for subsequent processing (documentation merge).

## Further development

Since we have chosen RNC/RNG for expedience not (yet) functionality, we don't yet distribute "clean" RNG with merged documentation (as we do for XSD).

Note that we exercise only features of RNG (RNC) that convert effectively into XSD. This still leaves plenty of room.
