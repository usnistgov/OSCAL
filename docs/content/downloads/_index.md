---
title: "Downloads"
menu:
  primary:
    name: Downloads
    weight: 50
---

Official releases of the OSCAL Project are available on the project's [GitHub repository](https://github.com/usnistgov/OSCAL/releases). These releases align with the project's [roadmap](/contribute/roadmap/).

- [OSCAL 1.0.0 Milestone 1](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone1): Stable releases of the OSCAL Catalog and Profile layers, including XML and JSON schema, content examples, and content converters.
- [OSCAL 1.0.0 Milestone 2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone2): Stable releases of the OSCAL Catalog, Profile, and System Security Plan models, including XML and JSON schema, content examples, and content converters.
- [OSCAL 1.0.0 Milestone 3](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone3): Stable releases of the OSCAL Catalog, Profile, System Security Plan, assessment plan, assessment results, and POA&M models, including XML and JSON schema, content examples, and content converters.

OSCAL uses version strings for releases based on the [semantic versioning v2.0.0](https://semver.org/spec/v2.0.0.html) specification.

# Future OSCAL Compatibility Commitment

The OSCAL Project team recognizes the impact of syntax changes on content and tool developers following an evolving language. As we develop OSCAL, the team will take care to minimize the impact of any necessary changes. Syntax changes to the OSCAL XML and JSON models will only occur where there is a compelling need to do so. To the greatest extend practical, OSCAL-based content produced today will be future compatible.

The OSCAL team can not anticipate all issues raised or feedback received. In some cases, changes to the OSCAL models will need to be made to address a compelling issue. In these instances, the OSCAL team will do everything practical to minimize the impact to early adopters, and document any changes where impacts are unavoidable in the [release notes](https://github.com/usnistgov/OSCAL/tree/master/src/release/release-notes.txt).

NIST encourages early adoption of released OSCAL content, tools, and schema. In general early adopters can count on the following, from the first milestone release to the first official 1.0.0 release of OSCAL:

- Any data element modeled in the milestone release will be modeled in the 1.0.0 release. Typically with the same syntax.
- All features available in a milestone release will be available in the 1.0.0 release.
- Deferred features, such as cryptographic validation, will be implemented while minimizing the impact to existing content. Most new features will be implemented as optional extensions with no impact to existing content.
