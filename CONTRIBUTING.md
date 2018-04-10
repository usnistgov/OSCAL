# Contributing to the OSCAL Project

This page is for potential contributors to the OSCAL project. It provides basic information on the OSCAL project, describes the main ways people can make contributions, explains how to report issues with OSCAL, and lists pointers to additional sources of information.

## Project approach

The approach we’re taking with OSCAL is agile. We’re adopting the philosophy of implementing the 20% of the functionality that solves 80% of the problem. We’re trying to focus on the core capabilities that are needed to provide the greatest amount of benefit. Because we’re working on a small set of capabilities, that allows us to make very fast progress. We’re building the features that we believe solve the biggest problems, so we’re providing the most value.

## Contribution options

The OSCAL project is producing several types of deliverables, including the following:
* *XML schemas* for the OSCAL component models  
* *Schematron definitions*, which are basically an extension of the XML schemas that provide more validation capabilities
* *XSL templates* for production of human-readable versions of OSCAL XML content 
* *CSS*, so people who are developing catalogs and profiles using XML tools can use CSS for data entry, which offers a much more usable interface 
* *Documentation* to define the OSCAL component models, capture the operational model of how to use OSCAL, and explain how you can convert existing content (catalogs, profiles, etc.) into OSCAL formats

Contributions are welcome in any of these areas. For information on the project's current needs and priorities, see the project's GitHub issue tracker (discussed below). Please refer to the [guide on how to contribute to open source](https://opensource.guide/how-to-contribute/) for general information on contributing to an open source project.

## Issue reporting and handling

All requests for changes and enhancements to OSCAL are initiated through the project's GitHub issue tracker (https://github.com/usnistgov/OSCAL/issues). To initiate a request, please [create a new issue](https://help.github.com/articles/creating-an-issue/). The following issue templates exist for creating a new issue:
* [User Story](https://github.com/usnistgov/OSCAL/issues/new?template=user-story_template.md&labels=User+Story): Used to describe a new feature or capability to be added to OSCAL.
* [Defect Report](https://github.com/usnistgov/OSCAL/issues/new?template=defect-template.md&labels=bug): Used to report a problem with an existing OSCAL feature or capability.
* [Question](https://github.com/usnistgov/OSCAL/issues/new?template=question_template.md&labels=question): Use to ask a question about OSCAL.

The core OSCAL project team regularly reviews the open issues, prioritizes their handling, and updates the issue statuses and comments as needed.

## Communications mechanisms

There are two mailing lists for the project:
* *oscal-dev@nist.gov* for communication among parties interested in contributing to the development of OSCAL or exchanging ideas. Subscribe by visiting https://email.nist.gov/mailman/listinfo/oscal-dev.
* *oscal-updates@nist.gov* for low-frequency updates on the status of the OSCAL project. To subscribe, visit https://email.nist.gov/mailman/listinfo/oscal-updates.

## Contributing to the OSCAL Repository

The OSCAL project uses a typical Github fork and pull request [workflow](https://guides.github.com/introduction/flow/). To establish a development environment for contributing to the OSCAL project, you must do the following:

1. Fork the OSCAL repository to your personal workspace. Please refer to the Github [guide on forking a repository](https://help.github.com/articles/fork-a-repo/) for more details.
1. Create a feature branch from the master branch for making changes. You can [create a branch in your personal repository](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/) directly on Github or create the branch using a Git client. The ```git branch working``` command can be used to create a branch named *working*:
1. You will need to then make modifications by adding, removing, and changing the content in the branch and then stage your changes using the ```git add``` and ```git rm``` commands.
1. Once you have staged your changes you will need to commit them. When commiting you will need to include a commit message. The commit message should describe the nature of your changes (e.g., added new feature X which supports Y). You can also reference an issue from the OSCAL repository by using the hash symbol. For example, to reference issue #34, you would include the text "#34". The full command would be: ```git commit -m "added new feature X which supports Y addressing issue #34"```.
1. Finally you must push your changes to your personal repo. You can do this with the command: ```git push```.
1. Now you can [create a pull request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/).
