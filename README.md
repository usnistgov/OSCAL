[![Gitter](https://img.shields.io/gitter/room/usnistgov-OSCAL/Lobby)](https://gitter.im/usnistgov-OSCAL/Lobby) [![Build Artifacts and Documentation](https://github.com/usnistgov/OSCAL/actions/workflows/metaschema-artifacts.yml/badge.svg)](https://github.com/usnistgov/OSCAL/actions/workflows/metaschema-artifacts.yml) ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/usnistgov/OSCAL?color=brightgreen&include_prereleases)

# Open Security Controls Assessment Language (OSCAL)

NIST is developing the [Open Security Controls Assessment Language](https://csrc.nist.gov/Projects/Open-Security-Controls-Assessment-Language) (OSCAL), a set of hierarchical, XML-, JSON-, and YAML-based formats that provide a standardized representations of information pertaining to the publication, implementation, and assessment of security controls. OSCAL is being developed through a [collaborative approach](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) with the public. Public contributions to this project are welcome.

With this effort, we are stressing the agile development of a set of *minimal* formats that are both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

The [OSCAL website](https://www.nist.gov/oscal) provides an overview of the OSCAL project, including an XML and JSON [schema reference](https://pages.nist.gov/OSCAL/docs/schemas/), [examples](https://pages.nist.gov/OSCAL/resources/examples/), and other resources.

If you are interested in contributing to the development of OSCAL, refer to the [contributor guidance](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) for more information.

## Project Status

OSCAL 1.0.0 Release Candidate 2 was released on April 12, 2021. The full announcement can be found below:

<blockquote>
We are pleased to announce the publication of OSCAL 1.0.0 Release Candidate (RC) 2. This is the second full draft release of OSCAL 1.0.0 which is made available for public review and feedback before releasing the final OSCAL 1.0.0.

Please provide feedback by May 7, 2021 by emailing the NIST OSCAL team at [oscal@nist.gov](mailto:oscal@nist.gov) or by [creating an issue](https://github.com/usnistgov/OSCAL/issues) on our GitHub repository.

The [OSCAL 1.0.0 RC 2](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-rc2) includes:

- Updated stable versions of [catalog](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/) and [profile](https://pages.nist.gov/OSCAL/documentation/schema/profile-layer/profile/) models which provide a structured representation of control catalogs and baselines or overlays.
- Updated stable version of the [system security plan](https://pages.nist.gov/OSCAL/documentation/schema/implementation-layer/ssp/) model which provides a structured representations of a system's control-based implementation.
- Updated stable version of the [component definition](https://pages.nist.gov/OSCAL/documentation/schema/implementation-layer/component/) model which provides a stand-alone structured representation of the controls that are supported in a given implementation of a hardware, software, service, policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).
- Updated stable versions of the [assessment plan](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/assessment-plan/), [assessment results](https://pages.nist.gov/OSCAL/documentation/schema/assessment-results-layer/assessment-results/), [plan of action and milestones](https://pages.nist.gov/OSCAL/documentation/schema/assessment-results-layer/poam/) (POA&amp;M) models, which support the structured representation of information used for planning for and documenting the results of an information system assessment or continuous monitoring activity.
- Updated tools to convert between OSCAL [XML](https://github.com/usnistgov/OSCAL/tree/master/xml) and [JSON](https://github.com/usnistgov/OSCAL/tree/master/json) formats, and to [up convert](https://github.com/usnistgov/OSCAL/tree/master/src/release/content-upgrade) content from previous releases to RC2.

Changes in this release are focused on the following major areas:
- Simplification of key OSCAL features
  - Properties and annotations have been merged into a single `prop` that now allows an optional `remarks` and `uuid`.
  - In the  assessment plan and assessment results models, the concepts of a `task` and `action` have been combined.
  - Use of `local-definitions` in the assessment plan, assessment results, and POA&M models has been simplified and made more consistent.
- Model documentation improvements
  - Some usage descriptions were enhanced to provide more detail and to be more consistent overall.
  - Formal names were updated in some places where the names did not match the data element.
  - Many spelling errors were corrected.
- Removed the use of XML `<any>` and JSON `additonalProperties` for arbitrary extensions based on community discussion. Extended data can still be provided using `link` declarations to external content. This decision can be revisited in future revisions once there is more implementation experience with the OSCAL models.
- Added the following `link` relations: `latest-version`, `predecessor-version`, and `successor-version` to allow an OSCAL document to link to latest, previous, and next document revisions.
- Fixed a few bugs in the profile resolver code and updated the resolver to work with new profile import/insert structures.
- Provided support for data insertion points for data other than parameters in markup content.

There are also [release notes](https://github.com/usnistgov/OSCAL/blob/master/src/release/release-notes.txt) containing a summary of changes in this and previous releases.

These changes were made based on all the excellent feedback we received from the OSCAL community. The NIST OSCAL team is very thankful for all of the great feedback we have received.

The NIST team is also maintaining **OSCAL content** that is updated to the latest OSCAL 1.0.0 RC2. The [OSCAL content repository](https://github.com/usnistgov/oscal-content/) provides OSCAL examples, in addition to:

- The [NIST SP 800-53 revision 5 catalog](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev5) and the security and privacy [NIST SP 800-53B baselines](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev5).
- The [NIST SP 800-53 revision 4 catalog](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4) and the [three NIST SP 800-53 revision 4 baselines](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53/rev4).
- The [FedRAMP SP 800-53 revision 4 baselines](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov). Please note, these baselines are also available on [GSA/fedramp-automation](https://github.com/GSA/fedramp-automation/tree/master/baselines) repository.

All of this OSCAL content is provided in XML, JSON and YAML formats.

The OSCAL team is working diligently to release OSCAL 1.0.0 FINAL near June 1, 2021, with the caveat that the date might change depending on the feedback we receive. To this end, we appreciate any feedback you have on the OSCAL 1.0.0 RC2 models. We would like to kindly ask our community to focus on providing any other RC2-related comments in the next two weeks, so we can stay on schedule. Reviewing your comments is instrumental for our team to make the OSCAL 1.0.0 FINAL release as robust as is feasible, and to address any gaps that might cause backwards compatibilities between future OSCAL minor releases (e.g., 1.1.0, 1.2.0) and OSCAL 1.0.0.

We will continue the development of OSCAL focusing our full attention on providing a more complete set of documentation for all the OSCAL layers and models, creating more examples, and providing a diverse set of tutorials.

NIST is also seeking tool developers, vendors, and service providers that would like to implement the OSCAL 1.0.0 models in commercial and open-source offerings. To provide feedback, to ask questions, or to let us know about an OSCAL implementation you are working on, please email the NIST OSCAL team at [oscal@nist.gov](mailto:oscal@nist.gov). You can also post publicly to the OSCAL development list: [oscal-dev@list.nist.gov](mailto:oscal-dev@list.nist.gov) or [create an issue](https://github.com/usnistgov/OSCAL/issues) on our GitHub repository.

Please find instructions for joining the OSCAL development and update lists on our [contacts page](https://pages.nist.gov/OSCAL/contact/).
</blockquote>

NIST is seeking software and service providers that are willing to work with us to represent control implementation information about their products. Please email us at [oscal@nist.gov](mailto:oscal@nist.gov) if you are interested.

If you have any questions about OSCAL in general or if you would like to get involved in the OSCAL project, please contact us at: [oscal@nist.gov](mailto:oscal@nist.gov) or on [Gitter](https://gitter.im/usnistgov-OSCAL/Lobby).
