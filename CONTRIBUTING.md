# Contributing to the OSCAL Project

This page is for potential contributors to the OSCAL project. It provides basic information on the OSCAL project, describes the main ways people can make contributions, explains how to report issues with OSCAL, and lists pointers to additional sources of information.

## Project approach

The approach we’re taking with OSCAL is agile. We’re adopting the philosophy of implementing the 20% of the functionality that solves 80% of the problem. We’re trying to focus on the core capabilities that are needed to provide the greatest amount of benefit. Because we’re working on a small set of capabilities, that allows us to make very fast progress. We’re building the features that we believe solve the biggest problems, so we’re providing the most value.

We track our current work items using GitHub [project cards](https://github.com/usnistgov/OSCAL/projects). Our active project is typically the lowest numbered open project within the previously referenced page.

## Contribution options

The OSCAL project is producing several types of deliverables, including the following:
- *Schemas* for the OSCAL component models
- *Schematron definitions*, which are basically an extension of the XML schemas that provide more validation capabilities
- *XSL templates* for production of human-readable versions of OSCAL XML content
- *CSS*, so people who are developing catalogs and profiles using XML tools can use CSS for data entry, which offers a much more usable interface
- *Documentation* to define the OSCAL component models, capture the operational model of how to use OSCAL, and explain how you can convert existing content (catalogs, profiles, etc.) into OSCAL formats

Contributions are welcome in any of these areas. For information on the project's current needs and priorities, see the project's GitHub issue tracker (discussed below). Please refer to the [guide on how to contribute to open source](https://opensource.guide/how-to-contribute/) for general information on contributing to an open source project.

## Issue reporting and handling

All requests for changes and enhancements to OSCAL are initiated through the project's [GitHub issue tracker](https://github.com/usnistgov/OSCAL/issues). To initiate a request, please [create a new issue](https://help.github.com/articles/creating-an-issue/). The following issue templates exist for creating a new issue:
* [User Story](https://github.com/usnistgov/OSCAL/issues/new?template=feature_request.md&labels=enhancement%2C+User+Story): Use to describe a new feature or capability to be added to OSCAL.
* [Defect Report](https://github.com/usnistgov/OSCAL/issues/new?template=bug_report.md&labels=bug): Use to report a problem with an existing OSCAL feature or capability.
* [Question](https://github.com/usnistgov/OSCAL/issues/new?labels=question&template=question.md): Use to ask a question about OSCAL.

The core OSCAL project team regularly reviews the open issues, prioritizes their handling, and updates the issue statuses and comments as needed.

## Communications mechanisms

There are two mailing lists for the project:

- *oscal-dev@nist.gov* for communication among parties interested in contributing to the development of OSCAL or exchanging ideas. Subscribe by sending an email to [oscal-dev+subscribe@list.nist.gov](mailto:oscal-dev+subscribe@list.nist.gov). To unsubscribe send an email to [oscal-dev+unsubscribe@list.nist.gov](mailto:oscal-dev+unsubscribe@list.nist.gov).
- *oscal-updates@list.nist.gov* for low-frequency updates on the status of the OSCAL project. Subscribe by sending an email to [oscal-updates+subscribe@list.nist.gov](mailto:oscal-updates+subscribe@list.nist.gov). To unsubscribe send an email to [oscal-updates+unsubscribe@list.nist.gov](mailto:oscal-updates+unsubscribe@list.nist.gov).

## Contributing to the OSCAL repository

The OSCAL project uses a typical GitHub fork and pull request [workflow](https://guides.github.com/introduction/flow/). To establish a development environment for contributing to the OSCAL project, you must do the following:

1. Fork the OSCAL repository to your personal workspace. Please refer to the Github [guide on forking a repository](https://help.github.com/articles/fork-a-repo/) for more details.
1. Create a feature branch from the master branch for making changes. You can [create a branch in your personal repository](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/) directly on GitHub or create the branch using a Git client. For example, the ```git branch working``` command can be used to create a branch named *working*.
1. You will need to make your modifications by adding, removing, and changing the content in the branch, then staging your changes using the ```git add``` and ```git rm``` commands.
1. Once you have staged your changes, you will need to commit them. When committing, you will need to include a commit message. The commit message should describe the nature of your changes (e.g., added new feature X which supports Y). You can also reference an issue from the OSCAL repository by using the hash symbol. For example, to reference issue #34, you would include the text "#34". The full command would be: ```git commit -m "added new feature X which supports Y addressing issue #34"```.
1. Next, you must push your changes to your personal repo. You can do this with the command: ```git push```.
1. Finally, you can [create a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).
    - Please allow the NIST OSCAL maintainers to make changes to your pull request, to efficiently merge it, by selecting on your fork the setting to [always allow edits from the maintainers](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/allowing-changes-to-a-pull-request-branch-created-from-a-fork).
    - Review [the OSCAL release and versioning strategy](./versioning-and-branching.md) and [choose the base branch](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/changing-the-base-branch-of-a-pull-request) accordingly. Normally, you should target the `develop` branch as the base branch unless otherwise asked. A maintainer from the NIST team may ask you to target the `main` branch, or a `release-x.y` branch when targeting an upcoming OSCAL release. Please select the appropriate branch before requesting a review from a maintainer so delays of your pull request are avoided.

### Repository structure

This repository consists of the following directories and files pertaining to the OSCAL project:

- [.github](.github): Contains GitHub issue and pull request templates for the OSCAL project.
- [json](json): Provides OSCAL JavaScript Object Notation (JSON) schemas and utilities that can be used to convert content in other OSCAL formats to OSCAL JSON-based formats.
- [xml](xml): Provides OSCAL Extensible Markup Language (XML) schemas and utilities that can be used to convert content in other OSCAL formats to OSCAL XML-based formats.
- [docs](docs): Stores sources for the [OSCAL website](https://pages.nist.gov/OSCAL).
- [content](content): This directory once stored XML, JSON, and YAML content examples. These examples have been moved to the OSCAL content GitHub [repository](https://github.com/usnistgov/oscal-content/tree/master).
- [build](build): Contains a collection of scripts, eXtensible Stylesheet Language Transformations (XSLTs), and other artifacts used to support this repository's continuous integration and continuous deployment (CI/CD) processes.
- [src](src): This includes the resources used by the NIST OSCAL Team to manage OSCAL development, including the metaschema files used to maintain the OSCAL models across all supported formats. This directory once stored source artifacts used to produce the XML, JSON, and YAML resources that were provided in this repository. These resources have been moved to the OSCAL content GitHub [repository](https://github.com/usnistgov/oscal-content/tree/master/src).
- [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md): This file contains a code of conduct for OSCAL project contributors.
- [CONTRIBUTING.md](CONTRIBUTING.md): This file is for potential contributors to the OSCAL project. It provides basic information on the OSCAL project, describes the main ways people can make contributions, explains how to report issues with OSCAL, and lists pointers to additional sources of information. It also has instructions on establishing a development environment for contributing to the OSCAL project and using GitHub project cards to track development sprints.
- [LICENSE.md](LICENSE.md): This file contains license and copyright information for the files in the OSCAL GitHub repository.
- [USERS.md](USERS.md): This file explains which types of users are most likely to benefit from consuming available OSCAL tools and content.


## Contributing to a Development Sprint

The NIST OSCAL team is using the GitHub [project cards](https://github.com/usnistgov/OSCAL/projects) feature to track development sprints as part of the core OSCAL work stream. A typical development sprint lasts roughly a month, with some sprints lasting slightly less or more to work around major holidays or events attended by the core project team. The active sprint is typically the lowest numbered open project within the previously referenced page.

### User Stories

Each development sprint consists of a set of [user stories](https://github.com/usnistgov/OSCAL/issues?q=is%3Aopen+is%3Aissue+label%3A%22User+Story%22), that represent features, actions, or enhancements that are intended to be developed during the sprint. Each user story is based on a [template](https://github.com/usnistgov/OSCAL/issues/new?template=feature_request.md&labels=enhancement%2C+User+Story) and describes the basic problem or need to be addressed, a set of detailed goals to accomplish, any dependencies that must be addressed to start or complete the user story, and the criteria for acceptance of the contribution.

The goals in a user story will be bulleted, indicating that each goal can be worked on in parallel, or numbered, indicating that each goal must be worked on sequentially. Each goal will be assigned to one or more individuals to accomplish.

Note: A user story that is not part of a specific development sprint can still be worked on at any time by any OSCAL contributor. When a user story is not assigned to sprint, its status will not be tracked as part of our sprint management efforts, but when completed will still be considered as a possible contribution to the OSCAL project.

### Reporting User Story Status

When working on a goal that is part of a user story you will want to provide a periodic report on any progress that has been made until that goal has been completed. This status must be reported as a comment to the associated user story issue. For a user story that is part of an OSCAL development sprint, status reports will typically be made by close of business the day before the weekly OSCAL status meeting (typically held on Thursdays). Each OSCAL contributor will enter their own status update weekly indicating an estimated completion percentage against each goal to which they are assigned. Progress on goals will be tracked by the NIST OSCAL team and will be used to update the project cards for the current sprint.

When reporting status, please use the following comment template:

```
MM/DD/YYY - Sprint XX Progress Report

Goal: <goal text>
Progress: <a short comment on progress made since the last report>
% Complete: <a rough estimated percentage of the work completed>
Open Issues: <a list of issues encountered while addressing the goal>
```

When describing any open issues encountered use an "\@mention" of the individual who needs to respond to the issue. This will ensure that the individual is updated with this status. Please also raise any active, unresolved issues on the weekly status calls.

### Project Status

The project cards for each sprint will be in one of the following states:

- "To do" - The user story has been assigned to the sprint, but work has not started.
- "In progress" - Work has started on the user story, but development of the issue has not completed.
- "Under review" - All goals for the user story have been completed and one or more pull requests have been submitted for all associated work. The NIST team will review the pull requests to ensure that all goals and acceptance criteria have been met.
- "Done" - Once the contributed work has been reviewed and the pull request has been merged, the user story will be marked as "Done".

Note: A pull request must be submitted for all goals before an issue will be moved to the "under review" status. If any goals or acceptance criteria have not been met, then the user story will be commented on to provide feedback, and the issue will be returned to the "In progress" state.

## Git Client Setup

### Initializing Git submodules

This GitHub repository makes use of Git submodules to mount other repositories as subdirectories.

When cloning this repo for the first time, you need to initialize the submodules that this repository depends on. To do this you must execute the following command:

```
git submodule update --init
```

You can perform the clone and submodule initialization in a single step by using the following command:

```
git clone --recurse-submodules https://github.com/usnistgov/OSCAL.git
```

### Configuring Submodules to Use SSH

Some clients will make use of Git over SSH with a private SSH key for GitHub projects. For convenience, the submodules are configured to use HTTP instead of SSH. To override this default behavior, you will need to configure your Git client to use SSH instead of HTTP using the following command:

```
git config --global url."git@github.com:".insteadOf https://github.com/
```

This instructs your Git client to dynamically replace the HTTP-based URLs with the proper SSH URL when using GitHub.

### Updating submodules

Submodule contents will be periodically updated. To ensure you have the latest commits for a configured submodule, you will need to run the following command:

```
git submodule update --init --recursive
```
