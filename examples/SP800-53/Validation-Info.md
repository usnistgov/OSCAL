# Validations performed

All files here are valid to the OSCAL **core schema** (for the catalog and declarations file) or **profile schema** (for the profiles). Schema bindings are not given in these files; feel free to configure your bindings in any way appropriate for the processing environment.

Files are also valid to Schematron constraint sets,  as noted:

* No files report errors from Schematron `oscal-strict.sch` (which checks some name usage constraints).
* File `SP800-53-rev4.xml` reports no errors from Schematron `oscal-as-declared.sch`, indicating no errors of validation of OSCAL contents against declarations in `SP800-53-declarations.xml`. This ensures consistency of controls in a catalog over and above what the schema enforces.
* The catalog (the same file) also reports no errors from `oscal-links.sch` -- and four warnings (correctly reported) for `link` elements with no targets.
* The three profile documents also report no errors from `oscal-profile.sch`. Among other things that Schematron verifies the structural integrity between profiles and the resources (profiles or catalogs) they cite.
