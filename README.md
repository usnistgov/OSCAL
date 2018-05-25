# Open Security Controls Assessment Language (OSCAL)

> Current work is happening in the [master](https://github.com/usnistgov/OSCAL/) branch.
> NOTE: Some JSON examples might be missing across the repo. We are working to regenerate these.

NIST is developing the Open Security Controls Assessment Language (OSCAL), a set of hierarchical, formatted, XML- and JSON-based formats that provide a standardized representation for different categories of information pertaining to the publication, implementation, and assessment of security controls. OSCAL is being developed through a [collaborative approach](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) with the public. Public contributions to this project are welcome.

With this effort, we are stressing the agile development of a *minimal* format that is both generic enough to capture the breadth of data in scope (controls specifications), while also capable of ad-hoc tuning and extension to support peculiarities of both (industry or sector) standard and new control types.

The [OSCAL website](https://pages.nist.gov/OSCAL/) provides an overview of the OSCAL project, including an XML and JSON [schema reference](https://pages.nist.gov/OSCAL/schema/), [examples](https://pages.nist.gov/OSCAL/examples/), and other resources.

This repository consists of the following directories and files pertaining to the OSCAL project:

* [.github](.github): This directory holds GitHub issue and pull request templates for the OSCAL project.
* [docs](docs): This directory contains a variety of documentation files and artifacts. They include copies of graphics, old drafts of documentation pending conversion to the new documentation format, and detailed documentation for the OSCAL schema, including a tag library.
* [examples](examples): This directory contains numerous OSCAL examples in both XML and JSON formats. Some examples are considered provisional "finished" versions of OSCAL catalogs and profiles; they are not authoritative but are intended as demonstrations of OSCAL. Other examples are works in progress. Each subdirectory within the examples directory clearly indicates the current status of its example files.
* [lib](lib): This directory contains a variety of supporting files. For example, it holds core XSLT stylesheets for processing OSCAL. It also contains scripts and utilities used internally by the OSCAL developers.
* [schema](schema): This directory contains the OSCAL schemas and related validation tools. The directory contains both XML and JSON representations for OSCAL.
* [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md): This file contains a code of conduct for OSCAL project contributors.
* [CONTRIBUTING.md](CONTRIBUTING.md): This file is for potential contributors to the OSCAL project. It provides basic information on the OSCAL project, describes the main ways people can make contributions, explains how to report issues with OSCAL, and lists pointers to additional sources of information. It also has instructions on establishing a development environment for contributing to the OSCAL project and using GitHub project cards to track development sprints.
* [LICENSE.md](LICENSE.md): This file contains license and copyright information for the files in the OSCAL GitHub repository.
* [USERS.md](USERS.md): This file explains which types of users are most likely to benefit from consuming OSCAL tools and content when they are available.
