# Mini Testing sample files

### Unit testing in support of regressions in OSCAL

In scope:

* To test profiling semantics: What happens when profiles are resolved against their source catalogs (or profiles or frameworks); how controls are designated for "surfacing" in profiles that call them; how they are modified by parameter setting or alteration.
* To show examples of valid and near-valid ('specifically broken') OSCAL examples including example catalog(s) and profiles (and thereby test these validations)
* To provide a showcase not only for schema validations but also Schematrons, referential integrity, etc.

### Processes we can expect to run on these samples (and therefore validate/confirm):

* Run the production pipeline to resolve any profiles against their authorities (i.e. source catalogs or profiles) and render the results in HTML (for browser) - presently `/lib/XProc/profile-resolve-and-display.xpl` supports this (though its components can also be run independently)
* We can validate any profile or OSCAL catalog against OSCAL core or profile schemas (XSD) as appropriate
* We can use the OSCAL profile Schematron (oscal-profile.sch) to detect when profiles elicit ambiguous sourcing (clashing IDs on controls or subcontrols) - a problem for downstream processing
* We can check the design of our catalog using "OSCAL declarations" for the properties and parts of its controls and subcontrols
* We can test run tools such as the oXygen Author with its display CSS
* We can port to JSON or other alternative notations, and back, as a test of capabilities

### Validation map

Find details on the application of schemas and Schematon validations in the /schema subdirectory.

| Process or schema | Constraint set |
|:-----|:-----|
| XSD schema (core) | XML element naming and containment constraints and content models in catalogs (also nominal `framework` and `worksheet` documents). |
XSD schema (profile) | The same, for OSCAL profiles. |
| Schematron schemas for catalogs | Various extra-schema constraints as documented in the Schematron/readme.md. These include constraints declared per OSCAL catalog or catalog "flavor" (OSCAL declarations). |
| Schematron schemas for profiles | Two Schematrons are specialized for OSCAL profiles (not catalogs), validating their referential integrity vis-a-vis their source catalogs (or profiles). |
| Profile resolution XSLT | OSCAL profiling semantics (control selection and configuration) are implemented by an XSLT that expands a profile into the control sets (catalog selections) it references. For these documents, profile resolution *only* happens when they are converted into HTML for display (results in the `pub` directory). |
| RNC schemas (various) | The same constraints as the XSD. |

#### Why two schema languages?

(Or three, if we include Schematron)

As described in the schema documentation, RNC (RelaxNG Compact ISO/IEC 19757) is the maintenance syntax for the OSCAL schemas (core and profile), from which the XSD is produced. With respect to a document set, validating with both RNC and XSD is redundant, as they express the same constraints over the XML (and hence should report the same problems with analogous messages). However, note that validating the document set against a schema (either RNC or XSD) is possible only when the schema itself is known to be correct; when testing the schemas themselves, each must be tested separately (because then we are testing both the RNC and the means of producing the XSD).

Why two formats? RNC is easier for developers to use and work with, while tooling for XSD is more ubiquitous. Given our needs for coordinating documentation along with the schemas, it is easier for us to produce both versions from RNC (and XML) sources, than it is to work the XSD by hand. Having two versions (which are required to be aligned) also helps with validation of the schema design.

In use, validation of an OSCAL document against the appropriate XSD should serve as warrant for validity against the RNC, and vice versa. End users or developers who do not need to alter schemas are advised to use the XSD (and consider the RNC part of "the sausage").

### Sample docs

See the samples for internal documentation regarding how they should work.

Ordinarily, assume a sample is both valid and functional, except where/as noted in comments.

Samples `41-exceptions-profile.xml` `42-more-exceptions-profile.xml` (and so forth) illustrate a special set of *error conditions*. These "errors" are not by definition non-functional. They may arise whenever controls are invoked multiple times by different pathways -- which raises the question of how to detect differences or disparities (presumably intentional / due to patching), what to do about them, etc. etc. Rather than force users to sort this out by learning a new notation or convention (rule) set, we simply accept the fact in principle that a unifying transformation cannot guarantee against @id clashes (and that indeed it might be the purpose of a certain kind of consumer to help resolve). Accordingly, we declare such resolution out of scope by simply detecting the problem instead of resolving it. (Meanwhile we can always accomplish a merge by patching a patch.)

These files are valid wrt the (XSD) schema; the warning respects only how they resolve against control catalogs or their profiles, and where they do so in ways capable of causing (at worst) ambiguity or (at best) replication.


