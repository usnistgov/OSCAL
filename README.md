# Open Security Controls Assessment Language (OSCAL)
[![CircleCI](https://circleci.com/gh/usnistgov/OSCAL/tree/master.svg?style=svg)](https://circleci.com/gh/usnistgov/OSCAL/tree/master) [![Gitter](https://img.shields.io/gitter/room/usnistgov-OSCAL/Lobby.svg?style=flat-square)](https://gitter.im/usnistgov-OSCAL/Lobby)

NIST is [developing](https://csrc.nist.gov/Projects/Open-Security-Controls-Assessment-Language) the Open Security Controls Assessment Language (OSCAL), a set of hierarchical, XML- and JSON-based formats that provide a standardized representation for different categories of information pertaining to the publication, implementation, and assessment of security controls. OSCAL is being developed through a [collaborative approach](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) with the public. Public contributions to this project are welcome.

With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

The [OSCAL website](https://www.nist.gov/oscal) provides an overview of the OSCAL project, including an XML and JSON [schema reference](https://pages.nist.gov/OSCAL/docs/schemas/), [examples](https://pages.nist.gov/OSCAL/resources/examples/), and other resources.

If you are interested in supporting the development of the standard, refer to the [contributor guidance](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) for more information.

## Project Status

OSCAL 1.0.0 Milestone 3 was released on June 3, 2020. The full announcement can be found below:

<blockquote>

We are pleased to announce the release of OSCAL 1.0.0 Milestone 3. This is the third official milestone pre-release of OSCAL, and marks the last pre-release milestone for OSCAL v1. At this point we have drafts of all the models we intended to produce for OSCAL v1 and will now start working towards producing a full initial release of OSCAL v1, which will be v1.0.0.

This release contains:

- A new [component definition model](https://pages.nist.gov/OSCAL/documentation/schema/implementation-layer/component/), which allows for the definition of a set of components that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).
- Creation of draft models for the [assessment](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/) and [assessment result](https://pages.nist.gov/OSCAL/documentation/schema/assessment-results-layer/) layers. Drafts of the [assessment plan](https://pages.nist.gov/OSCAL/documentation/schema/assessment-layer/assessment-plan/), [assessment results](https://pages.nist.gov/OSCAL/documentation/schema/assessment-results-layer/assessment-results/), and [plan of action and milestones](https://pages.nist.gov/OSCAL/documentation/schema/assessment-results-layer/poam/) (POA&M) models were created. These drafts were slated for the OSCAL v2 release cycle and are being released early as drafts ahead of schedule.
- Updated stable versions of the OSCAL [catalog](https://pages.nist.gov/OSCAL/documentation/schema/catalog-layer/catalog/), [profile](https://pages.nist.gov/OSCAL/documentation/schema/profile-layer/profile/), and [system security plan](https://pages.nist.gov/OSCAL/documentation/schema/implementation-layer/ssp/) (SSP) models, along with associated XML and JSON schemas. These changes were made based on all of the feedback we received from the OSCAL community. The NIST OSCAL team is very thankful for all of the great feedback we have received.
- New OSCAL content in XML, JSON, and YAML formats for the [draft NIST SP 800-53 revision 5 catalog](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53).
- Updated content in OSCAL XML, JSON, and YAML formats for the [NIST SP 800-53 revision 4 catalog](https://github.com/usnistgov/oscal-content/tree/master/nist.gov/SP800-53), and for the three NIST and four [FedRAMP baselines](https://github.com/usnistgov/oscal-content/tree/master/fedramp.gov).
- Provides tools to convert OSCAL catalog, profile, and SSP content between OSCAL XML and JSON formats, and to [up convert](https://github.com/usnistgov/OSCAL/tree/master/src/release/content-upgrade) content from milestone 2 to milestone 3.

To download this release, click on "Assets" below and download either the .zip or the .tar.bz2 bundle. These bundles contain the resources described above. There are also [release notes](https://github.com/usnistgov/OSCAL/blob/master/src/release/release-notes.txt) containing a summary of changes in this and previous releases.

The OSCAL team will continue the development of OSCAL focusing our full attention on providing a more complete set of documentation for all the OSCAL layers and models, creating more examples, and providing a diverse set of tutorials. We will continue to collect feedback from the community on the OSCAL models. We are also seeking tool developers, vendors, and service providers that would like to implement the OSCAL models in commercial and open source offerings. To provide feedback, to ask questions, or to let us know about an OSCAL implementation you are working on, please email the NIST OSCAL team at oscal@nist.gov. You can also post publicly to the OSCAL development list: oscal-dev@list.nist.gov.

There are instructions for joining the OSCAL development and update lists on our [contacts page](https://pages.nist.gov/OSCAL/contact/).
</blockquote>

NIST is seeking software and service providers that are willing to work with us to represent control implementation information about their products. Please email us at [oscal@nist.gov](mailto:oscal@nist.gov) if you are interested.

If you have any questions about OSCAL in general or the Milestone 3 release specifically, or if you would like to get involved in the OSCAL project, please contact us at: [oscal@nist.gov](mailto:oscal@nist.gov).
