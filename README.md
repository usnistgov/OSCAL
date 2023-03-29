[![Gitter](https://img.shields.io/gitter/room/usnistgov-OSCAL/Lobby)](https://gitter.im/usnistgov-OSCAL/Lobby) [![CI/CD](https://github.com/usnistgov/OSCAL/actions/workflows/status-ci-cd.yml/badge.svg)](https://github.com/usnistgov/OSCAL/actions/workflows/status-ci-cd.yml) [![GitHub release (latest by date)](https://img.shields.io/github/v/release/usnistgov/OSCAL?color=green)](https://github.com/usnistgov/OSCAL/releases)

# Open Security Controls Assessment Language (OSCAL)

NIST is developing the [Open Security Controls Assessment Language](https://csrc.nist.gov/Projects/Open-Security-Controls-Assessment-Language) (OSCAL), a set of hierarchical, XML-, JSON-, and YAML-based formats that provide a standardized representations of information pertaining to the publication, implementation, and assessment of security controls. OSCAL is being developed through a [collaborative approach](https://github.com/usnistgov/OSCAL/blob/main/CONTRIBUTING.md) with the public. Public contributions to this project are welcome.

With this effort, we are stressing the agile development of a set of *minimal* formats that are both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

The [OSCAL website](https://www.nist.gov/oscal) provides an overview of the OSCAL project, including an XML and JSON [schema reference](https://pages.nist.gov/OSCAL/reference/), [examples](https://pages.nist.gov/OSCAL/concepts/examples/), and other resources.

If you are interested in contributing to the development of OSCAL, refer to the [contributor guidance](https://github.com/usnistgov/OSCAL/blob/main/CONTRIBUTING.md) for more information.

## Project Status

To view the latest release of OSCAL check out [GitHub releases](../../releases). Each release on that page provides a complete summary of the changes made in each release.

The changes made in each release are based on the excellent feedback and contributions that are received from the OSCAL community. The NIST OSCAL team is very thankful for all of it.

Any feedback may be emailed to the NIST OSCAL team at [oscal@nist.gov](mailto:oscal@nist.gov) or by [creating an issue](https://github.com/usnistgov/OSCAL/issues) on the GitHub repository.

Looking forward, the NIST OSCAL team is excited to continue working with the [OSCAL community](https://pages.nist.gov/OSCAL/contribute/) to continue enhancing OSCAL through additional minor releases. Future efforts will include providing a more complete set of documentation for all the OSCAL layers and models, creating more examples, and providing a diverse set of tutorials.

For additional information on the OSCAL project, please see the NIST’s Cybersecurity Insights blog: [*“The Foundation for Interoperable and Portable Security Automation is Revealed in NIST’s OSCAL Project”*](https://www.nist.gov/blogs/cybersecurity-insights/foundation-interoperable-and-portable-security-automation-revealed) and the [OSCAL website](https://pages.nist.gov/OSCAL/).

The NIST team is also maintaining **OSCAL content** that is updated to the latest OSCAL revision. The [OSCAL content repository](https://github.com/usnistgov/oscal-content/) provides OSCAL examples, in addition to:

- The [NIST SP 800-53 revision 5 catalog](https://github.com/usnistgov/oscal-content/tree/main/nist.gov/SP800-53/rev5) and the security and privacy [NIST SP 800-53B baselines](https://github.com/usnistgov/oscal-content/tree/main/nist.gov/SP800-53/rev5).
- The [NIST SP 800-53 revision 4 catalog](https://github.com/usnistgov/oscal-content/tree/main/nist.gov/SP800-53/rev4) and the [three NIST SP 800-53 revision 4 baselines](https://github.com/usnistgov/oscal-content/tree/main/nist.gov/SP800-53/rev4).
- The [FedRAMP SP 800-53 revision 4 baselines](https://github.com/GSA/fedramp-automation/tree/master/dist/content/rev4/baselines).

All of this OSCAL content is provided in XML, JSON and YAML formats.

NIST is also seeking tool developers, vendors, and service providers that would like to implement the OSCAL models in commercial and open-source offerings. NIST is also seeking software and service providers that are willing to work with us to represent control implementation information about their products.

To provide feedback, to ask questions, or to let us know about an OSCAL implementation you are working on, please email the NIST OSCAL team at [oscal@nist.gov](mailto:oscal@nist.gov). You can also post publicly to the OSCAL development list: [oscal-dev@list.nist.gov](mailto:oscal-dev@list.nist.gov) or [create an issue](https://github.com/usnistgov/OSCAL/issues) on our GitHub repository.

Please find instructions for joining the OSCAL development and update lists on our [contacts page](https://pages.nist.gov/OSCAL/contact/).
If you have any questions about OSCAL in general or if you would like to get involved in the OSCAL project, please contact us at: [oscal@nist.gov](mailto:oscal@nist.gov) or on [Gitter](https://gitter.im/usnistgov-OSCAL/Lobby).

# Cloning this repository

Run the following Git command to clone the OSCAL repository.

```
git clone --recurse-submodules https://github.com/usnistgov/OSCAL.git
```
