# OSCAL schemas (maintenance RNC versions)

The maintenance versions of the top-level schemas ("core" and "profile") appear in this subdirectory as 
[oscal-core.rnc](../RNC/oscal-core.rnc) and 
[oscal-profile.rnc](../RNC/oscal-profile.rnc).

These schemas are maintained in RNC format (RelaxNG compact syntax ISO/IEC 19757-2); see information on RelaxNG at http://relaxng.org. This approach to maintenance permits rapid development with low process overhead; maintainers should also find RNC relatively legible next to XSD.

For use by applications without support for RelaxNG, we convert the schemas into W3C XSD using an open source tool, [Trang](http://www.thaiopensource.com/relaxng/trang.html).

Trang's results are saved in the neighbor /XSD subdirectory as [../XSD/oscal-interim-core.xsd](../XSD/oscal-interim-core.xsd) and  [../XSD/oscal-interim-profile.xsd](../XSD/oscal-interim-profile.xsd), where they are made available for subsequent processing (documentation merge).

### RNC goodies

In addition, there are top-level (entry point) schemas for each of the elements `catalog`, `profile`, `framework` and (provisionally atm) `worksheet`. (Standalone `declarations` must still validate to "core" although please ask.) These are especially convenient because they also validate the element at the top - something XSD doesn't actually support!

### Further development

Since we have chosen RNC/RNG for expedience not (yet) functionality, we don't yet distribute "clean" RNG with merged documentation (as we do for XSD).

Note that we exercise only features of RNG (RNC) that convert effectively into XSD. This still leaves plenty of room.
