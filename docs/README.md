# OSCAL Documentation Materials

This part of the repository contains OSCAL documentation and related supporting files.

The 'docs' subdirectory contains the following:

 * '[graphics](graphics)' - graphics files for reference by OSCAL documentation, and source files for generating particular graphics
 * '[presentations](presentations)' - Microsoft Powerpoint slides for OSCAL presentations, some with notes
 * '[prose](prose)' - Prose files (e.g., Markdown format) with narrative on OSCAL (OSCAL overview, how-to steps, etc.)
 * '[schema](schema)' - OSCAL schema documentation, as further detailed in [schema/readme.md](schema/readme.md)
  
# PROGRESS UPDATES (also sent via email)
NOTE SENT ON SEPTEMBER 26, 2017:
--------------------------------
We have been working on creating documentation for the OSCAL project. We have prepared drafts of an overview document that mirrors much of the same content from the PowerPoint slides we delivered at the last tiger team meeting. We have also developed documentation for all of the tags used in the current OSCAL model.
 
These documents can be found on GitHub using the following links:
 
- Overview: https://github.com/usnistgov/OSCAL/blob/master/docs/prose/OSCAL%20Overview.md
- Tag Library: https://github.com/usnistgov/OSCAL/blob/master/working/doc/schema/oscal-tag-library.md
 
You will need privileges to view the private OSCAL GitHub repository to access these documents. Please send an email to michaela.iorga@nist.gov or david.waltermire@nist.gov including your GitHub username to request access to the OSCAL repository.
 
We would appreciate your review and comments on these documents, with a specific focus on the organization and usability of this documentation. We have created a comment template for this purpose which can be found at: https://github.com/usnistgov/OSCAL/blob/master/docs/OSCAL-comment-template.xls?raw=true. Please email your comments using this template to oscal@nist.gov. To allow time for us to consider your comments in the next sprint work, please email your comments by Monday, October 9th, 2017.
 
We plan to use your feedback to continuously improve the documentation for the project. We plan to ask for periodic reviews of this and other documentation, examples, and schema in the future as our work progresses.

NOTE SENT ON OCTOBER 26, 2017:
-------------------------------
We accomplished the following in sprint 4:
- Issue #25: Updated and organized project documentation on Github. We have updated the top-level readme and readmes in the docs and working folders. I have also posted an updated presentation on OSCAL in the presentations folder.
https://github.com/usnistgov/OSCAL 
https://github.com/usnistgov/OSCAL/tree/master/docs/presentations 

- Issue #42: Working on closing out and cleaning up any outstanding issues on Github that have been addressed. We will continue to do this through sprint 5.
https://github.com/usnistgov/OSCAL/issues 

- Issue #28: Ongoing improvements based on community feedback. We are continuing to request feedback on the documentation within the Github project. Please send comments to oscal@nist.gov. We have created a comment template for this purpose which can be found at:
 https://github.com/usnistgov/OSCAL/blob/master/docs/OSCAL-comment-template.xls?raw=true 

- Issue #43: We have added support for advanced tailoring of catalog profile. We are working on completing support for extending profiles, filtering controls to include, adding and modifying statements within a control, and setting control parameters. We will be building examples in sprint 5 to illustrate this new functionality.

- Issue #5: Designing an approach for incorporating frameworks (e.g., NIST Cybersecurity Framework, PCI DSS, HIPPA, etc) into OSCAL. We have developed a set of user stories which we will be exploring in future sprints to add this functionality to OSCAL.

For sprint 5 will be working on the following:

- Continued enhancement of profile tailoring capabilities. We are going to develop OSCAL profiles for the FedRamp low, moderate, and high baselines. We hope that many of the new tailoring features will be used as part of these new profiles.
- Expansion of OSCAL examples. We will be organizing and adding a bunch of simple examples of using the OSCAL format.
- Integration of JSON schema and examples for OSCAL.

We welcome your feedback on this work. We hope to use your comments on OSCAL documentation, examples, and schema in our ongoing work to make improvements to the project. Please either post to this list or send feedback to oscal@nist.gov.

NOTE SENT ON DECEMBER 6, 2017:
------------------------------
The team worked diligently to make more progress and advance OSCAL development.
We wrapped up 2 more sprints: 4 (October) & 5 (November). A summary of Sprints 4 and 5 is below.

By the end of Sprint 3, we had a prototype catalog format and examples of several different kinds of catalogs (NIST SP800-53/A; ISO/IEC 27001/2; COBIT 5) encoded in this format and valid to its schemas and defined constraints. We had also begun to extend our prototype design to encode not only catalogs, but profiles, as a formal XML document type. The "profile" data representation ("tagging") aims to be comprehensive, legible and succinct in describing (a) the selection (via inclusion/exclusion) of controls and ‘subcontrols’ from catalogs (one or many) into a profile, and (b) modifications or conditions to be applied to those controls, especially but not limited to the setting of parameter values for inclusion (substitution/insertion) into controls in application. Describing this "delta" (between a control catalog, and its application or invocation) in an external form (namely, as an OSCAL profile) externalizes the relationship between a profile and its source(s), rendering it traceable and reversible.

Sprints 4 and 5 were devoted to building out support for this model in the form of transformation logic to "resolve" a profile against its catalog (demonstrating the viability of our model by testing in an implementation), along with a range of subordinate transformations and validations related both to catalogs and profiles. These continue to be developed "under load" while we build out example data sets, both real-world and lab ("pathological") cases for testing. Simultaneously, the engagement of a new team member has enabled us to start exploring ways of exposing OSCAL data in JSON, for consuming applications.

In more detail, our efforts included:
Continuing to refine OSCAL data models, esp relating to profiles
Refinement and testing a profile resolution prototype (profiling semantics in operation). A demo embeds this logic (XSLT) in a rendition pipeline whose final outputs are a readable HTML 'paste-up' of the catalog with the profile's emendations.
Continual regression testing (coevolution) of validations (schema and Schematron) against stable samples
Continuing refinement of Schematron validations of extra-schema constraints over OSCAL (both general- and special-purpose)
Refinement and testing of SP800-53 baselines HIGH, MODERATE and LOW, expressed as OSCAL profiles (of rev4 catalog in OSCAL)
Early/experimental casting FedRAMP and CSF data sets into OSCAL (referencing SP800-53 rev4 and its baselines)
Refining FedRAMP "shells" (partial/demo versions, but with live data) expressing three example FedRAMP specifications as OSCAL profiles of SP800-53 baselines (which are profiles of a catalog) - so, two layers of profile resolution not just one
Building out and commenting unit testing (miniature specimen) OSCAL data set - 'mini-testing' catalog and profiles
Testing SP800-53 NVD XML -> OSCAL conversion on SP800-53 rev 5 (draft)
Developing, testing and running prototype JSON conversion scripts capable of representing core OSCAL artifacts (including catalogs and profiles) in JSON syntax (by supporting bidirectional conversion)
Renaming and reorganizing for accessibility
 
Results include (see the Github repository https://github.com/usnistgov/OSCAL (still private but to get access please send me an email with your GitHub ID):
 
Updated schemas, Schematrons and related artifacts in a /schema subdirectory, including /schema/xml and /schema/json branches
High-level documentation including tag library remains in /docs
A new /examples directory, with examples
Examples include SP800-53 rev4 with its baselines; FedRAMP "rough cast" examples (extraction/mapping of FedRAMP specifications as OSCAL profiles); 'mini-testing' (OSCAL unit tests)
JSON versions of all these (still in a pull request at time of writing), with 'round-trip' demo XML coming back
These supplement, but do not replace, examples kept in /working
HTML 'published' (resolved-and-rendered versions) of catalogs and profiles are now always in a 'pub' directory
 
Everything can be found in the Sprint 5 branch (committed).
