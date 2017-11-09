# Mini Testing sample files

Unit testing in support of regressions in OSCAL

In scope:

* To test profiling semantics: What happens when profiles are resolved against their source catalogs (or profiles or frameworks); how controls are designated for "surfacing" in profiles that call them; how they are modified by parameter setting or alteration.
* To show examples of valid and near-valid ('specifically broken') OSCAL examples including example catalog(s) and profiles (and thereby test these validations)
* To provide a showcase not only for schema validations but also Schematrons, referential integrity, etc.

Processes we can expect to run on these samples (and therefore validate/confirm):

* Run the production pipeline to resolve any profiles against their authorities (i.e. source catalogs or profiles) and render the results in HTML (for browser) - presently `/working/lib/XProc/profile-resolve-and-display.xpl` supports this (though its components can also be run independently)
* We can validate any profile or OSCAL catalog against OSCAL core or profile schemas (XSD) as appropriate
* We can use the OSCAL profile Schematron (oscal-profile.sch) to detect when profiles elicit ambiguous sourcing (clashing IDs on controls or subcontrols) - a problem for downstream processing
* We can check the design of our catalog using "OSCAL declarations" for the properties and parts of its controls and subcontrols
* We can test run tools such as the oXygen Author with its display CSS
* We can port to JSON or other alternative notations, and back, as a test of capabilities

See the samples for internal documentation regarding how they should work.

Ordinarily, assume a sample is both valid and functional, except where/as noted in comments.

Samples `41-exceptions-profile.xml` `42-more-exceptions-profile.xml` (and so forth) illustrate *error conditions*. These "errors" are not by definition non-functional. They may arise whenever controls are invoked multiple times by different pathways -- which raises the question of how to detect differences or disparities (presumably intentional / due to patching), what to do about them, etc. etc. Rather than force users to sort this out by learning a new notation or convention (rule) set, we simply accept the fact in principle that a unifying transformation cannot guarantee against @id clashes (and that indeed it might be the purpose of a certain kind of consumer to help resolve). Accordingly, we declare such resolution out of scope by simply detecting the problem instead of resolving it. (Meanwhile we can always accomplish a merge by patching a patch.)

These files are valid wrt the (XSD) schema; the warning respects only how they resolve against control catalogs or their profiles, and where they do so in ways capable of causing (at worst) ambiguity or (at best) replication.


