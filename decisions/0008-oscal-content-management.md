# OSCAL Content Data Governance and Release Management

Date: 11/09/2023

## Status

Approved

## Context

Since 2016, the OSCAL project has iterated on methods and locations for managing example content and published catalogs. It is time that we decide whether to continue as-is or make a meaningful change to how project's OSCAL content is developed, published, and maintained.

### Key Takeaways

1. Almost all changes to OSCAL representations of the published SP 800-53A and 800-53B catalogs do not diverge from the official publication. Clear data management and governance guidelines are needed to identify which changes are acceptable OSCAL Team leadership to approve for release, and which specific changes need review and approval by the Security Engineering and Risk Management maintainers of the official SP 800-53 content.
1. By the nature of OSCAL models and relationships of document instances, the team must continue to manage published catalogs and examples that cite them together.
1. It is important that final integration testing of all OSCAL content occur with the latest pending release of OSCAL as a final integration test, even if the content is backwards compatible with an older minor or patch release for the same version.

### Background

[In September 2020](https://github.com/usnistgov/OSCAL/commit/01c0aa9b45667b25e8105160119da011471c77cb), the NIST OSCAL Team migrated SP 800-53 Revision 4, SP 800-53 Revision 5, and example content from [the core OSCAL repository](https://github.com/usnistgov/OSCAL) to the [new oscal-content repository](https://github.com/usnistgov/oscal-content). Presumably, this migration allowed the development team to manage published catalog content, and to a lesser extent examples, in a more flexible way, independent from the established release process and practices for the core OSCAL models, schemas, and supporting tooling. (However, even by that time examples reflected the real-world cross-document relationships OSCAL models support. Examples inherently reference adjacent published catalogs of the NIST SP 800-53B controls.) The NIST OSCAL Team coordinated with the [Security Engineering and Risk Management Team](https://csrc.nist.gov/Groups/Computer-Security-Division/Security-Engineering-and-Risk-Management), maintainers of NIST SP 800-53A and SP 800-53B, to publish representations of the assessment methods and respective controls in conjunction with their official publication (in PDF and alternate formats). Team members employed semi-automatic techniques for content-generation and data quality checks to coordinate finalized release of the 5.0 and 5.1 versions of the official documents with the OSCAL representation (e.g. releasing to the `main` branch in the GitHub repository). Their publication schedule is more infrequent than the OSCAL development cycle. This is an important takeaway that lead to data governance, testing, and release challenges.

### Data Management and Governance Challenges

As enhancements and bug fixes for OSCAL increased, separate of the content, in between official upstream releases of SP 800-53A and SP 800-53B, staff and community members [identified bugs and enhancements to the OSCAL representations](https://github.com/usnistgov/oscal-content/issues). In most cases, these work items would not or did not diverge from the content in the official publication version. These data quality and OSCAL-specific enhancements would or did improve the ability of technical staff using the OSCAL representation to create or improve catalog and profile automation. There has been no clear guidance on how to accept these changes, publish them, and how to identify their versions upon release. These governance questions led to an accumulation of work items that delayed publication (at this time, read: merged into the `main` branch).

### OSCAL Dependency Upgrades, Integration, and Regression Test Challenges

Due to infrequent publications of the catalogs, managed together with examples, the OSCAL submodule to provide models, generated schema, and tooling support. At the time of writing this ADR draft, [the oscal-content main branch at `a53f261`](https://github.com/usnistgov/oscal-content/tree/a53f261a946c52811c507deb4d8385d9e4794a6f) uses a version of the OSCAL models and tooling that is ostensibly from December 2022, [`51d5de2`](https://github.com/usnistgov/OSCAL/commit/51d5de22c181477e3f9cf08789c4399fff013f14), a stable commit between v1.0.4 and v1.0.5. Several attempts to smoothly upgrade this with subsequent releases of OSCAL models and supporting tooling were rolled back or never completed. Automated content conversion and schema validation failed. The team confirmed bugs in dependencies to OSCAL. Fixing these issues required months of development work. Below is a non-exhaustive list with two examples.

- [usnistgov/metaschema#235](https://github.com/usnistgov/metaschema/issues/235)
- [usnistgov/metaschema#240](https://github.com/usnistgov/metaschema/issues/240)

These bugs, and those like them, impacted conversion and validation of the examples, the published catalogs, or in some cases both. So in all cases, they stopped final publication into the oscal-content `main` branch, even as new OSCAL models were released. Specifically, fixing issues in an implementation of the Metaschema Information Modeling Framework used by OSCAL for schema generation, validation, and conversion need to not only be tested in their upstream projects, but then frequently regression tested across models with complex content present in the oscal-content repo. This manual follow-on work was a necessity to test all edge cases. It was exacerbated by the lack of frequent releases, or such problems would be caught sooner and fixed more frequently. This is a key takeaway that Metaschema and OSCAL Team's developers acknowledge, but not yet put into practice. This last line of defense is important to minimizing toil for the team.

## Decision

Moving forward, the team must commit to the following.

1. A data management and governance procedure will be added [to the OSCAL Team Wiki](https://github.com/usnistgov/OSCAL/wiki/NIST-SP-800%E2%80%9053-OSCAL-Content-Data-Governance).
1. The oscal-content repository will move to a `Makefile`-based approach for [usnistgov/oscal-content#116](https://github.com/usnistgov/oscal-content/issues/116) when [usnistgov/oscal-content#204](https://github.com/usnistgov/oscal-content/pull/204) is merged to match the same approach for the core repository enacted in [ADR 5](./0005-repository-reorganization.md). For consistency and simplicity of this new workflow, all examples, profiles, and catalogs will be developed in the [src directory](https://github.com/usnistgov/oscal-content/tree/7a079afed39b1a36a091c8d4ac939d096d42c76b/src) in OSCAL XML format only and converted later. This approach will simplify the architecture and improve efficiency of development cycles.
1. Every OSCAL model release must coincide with an oscal-content release. At a minimum, even if examples or catalogs to be published do not change any content, the team must do the following.
    - Update the OSCAL submodule to the latest tagged release.
    - All source catalogs and profiles must have their `oscal-version` and `version` incremented. Their `last-modified` and `published` timestamps must be updated, even if the updated content in that release is backwards compatible with previous major, minor, and/or patch versions.
    - All `xml-model` instructions at the top of every example, profile, and catalog instance must be updated to the complete OSCAL XML schema artifact for the release that matches the `oscal-version`.
1. The team will tag the commit with generated artifacts and mimic [the core repository's versioning, branching, and release guidelines](https://github.com/usnistgov/OSCAL/blob/f159b28948cb0034370fb819a45bfdaeaef5192a/versioning-and-branching.md), following [SemVer requirements](https://semver.org/).
1. Releases of content will be created alongside the core OSCAL repository.
1. In ADR 5, the team cited risk with the ongoing use of auto-commit automation with GitHub Actions for core OSCAL models and generated artifacts. To evaluate the best option and allow time for coordination with the community, the team will continue with auto-committing content to `main` as a publication mechanism only for the near-term future. The team will revisit this decision and potentially propose an alternative method that is more suitable in a subsequent spike and approved ADR.
1. OSCAL Team leadership will review resources and the feasibility of ongoing maintenance of the catalogs and alternative courses of action for long-term publication of NIST SP 800-53 Revision 5 catalogs.

## Consequences

Below are the consequences of the different approaches.

### Do Nothing

In the short-term, doing nothing would mean to stop publication of the content immediately. This solution would be detrimental to the community without effective analysis for alternative courses of action and approaches for usage of existing content.

### Change Nothing

If the team continues as-is by publishing content to `main` after bugs and build tooling improvements are complete, the challenges above will still sustain unnecessary risk without changes to process and tooling to support the team and its goals. Development of example content, not just publication of catalogs, will stall due to edge cases and accumulated changes in tooling that lead to many minor changes in content that must be reviewed and analyzed.

### Clarify Governance and Require Upgrades for Testing

Clear governance and frequent updates will require more periodic work for the NIST OSCAL Team, but ensure the challenges above will be less frequent and less significant.
