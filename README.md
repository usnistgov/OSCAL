# Open Security Controls Assessment Language (OSCAL)
[![CircleCI](https://circleci.com/gh/usnistgov/OSCAL/tree/master.svg?style=svg)](https://circleci.com/gh/usnistgov/OSCAL/tree/master) [![Gitter](https://img.shields.io/gitter/room/usnistgov-OSCAL/Lobby.svg?style=flat-square)](https://gitter.im/usnistgov-OSCAL/Lobby)

NIST is [developing](https://csrc.nist.gov/Projects/Open-Security-Controls-Assessment-Language) the Open Security Controls Assessment Language (OSCAL), a set of hierarchical, XML- and JSON-based formats that provide a standardized representation for different categories of information pertaining to the publication, implementation, and assessment of security controls. OSCAL is being developed through a [collaborative approach](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) with the public. Public contributions to this project are welcome.

With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

The [OSCAL website](https://www.nist.gov/oscal) provides an overview of the OSCAL project, including an XML and JSON [schema reference](https://pages.nist.gov/OSCAL/docs/schemas/), [examples](https://pages.nist.gov/OSCAL/resources/examples/), and other resources.

If you are interested in supporting the development of the standard, refer to the [contributor guidance](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) for more information.

## Architecture

![OSCAL diagram](https://github.com/usnistgov/OSCAL/raw/master/docs/content/learnmore/architecture/oscal-components.png)

OSCAL is comprised of multiple components which have been highlighted in the architecture diagram above. For more information about each of these components, refer to the [website](https://www.nist.gov/oscal).

## Project Status

OSCAL 1.0.0 Milestone 1 was released on June 15, 2019. The full announcement can be found below:

<blockquote>
We are pleased to announce the release of OSCAL 1.0.0 Milestone 1. This release marks an important milestone for the OSCAL project, as this represents the first official release of OSCAL.

The release contains:

- Stable versions of the OSCAL catalog and profile models in XML and JSON formats, along with associated XML and JSON schemas.
- Includes draft versions of the NIST SP 800-53 revision 4 OSCAL content and FedRAMP baselines in OSCAL XML, JSON, and YAML formats.
- Provides content converters that are capable of accurately converting between OSCAL catalog and profile content in OSCAL XML to OSCAL JSON format and vice versa.

You can find this and future releases here: https://github.com/usnistgov/OSCAL/releases.
More information on the OSCAL project can be found on the OSCAL website: https://www.nist.gov/oscal.

The OSCAL team will continue the development of OSCAL focusing our full attention on finalizing the OSCAL implementation layer. The current vision for the OSCAL implementation layer is to support expressing system security plans (SSPs) in machine-readable OSCAL formats, and to allow software and service vendors to document the controls implemented in their software and service offerings. Stable versions of this work will be featured in our next release, OSCAL 1.0.0 Milestone 2.

Our current experimental OSCAL implementation layer is being validated as part of a pilot with GSA/FedRAMP, to ensure the necessary functionality and enough flexibility is provided to support a wide variety of SSPs provided by different organizations. To further validate the implementation layer's functionality and flexibility, NIST is seeking software and service providers that are willing to work with us to represent control implementation information about their products. Please email us at oscal@nist.gov if you are interested.

If you have any questions about OSCAL in general or the Milestone 1 release specifically, or if you would like to get involved in the OSCAL project, please contact us at: oscal@nist.gov.
</blockquote>
