---
title: OSCAL Development Roadmap
description: Information on the OSCAL development roadmap, which is taking place over a series of milestones.
weight: 5
aliases:
  - /learnmore/roadmap/
---

OSCAL is a community-driven, NIST-led project, with an [open invitation](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) to the community to participate in the framing and development of OSCAL. Feature requests can be [created and submitted](https://github.com/usnistgov/OSCAL/issues/new?assignees=&labels=User+Story%2C+enhancement&template=feature_request.md) directly into the project's GitHub repository. Feedback in the form of [bug reports](https://github.com/usnistgov/OSCAL/issues/new?assignees=&labels=bug&template=bug_report.md) are also encouraged and appreciated. If appropriate, we ask you add a comment to an [existing relevant issue](https://github.com/usnistgov/OSCAL/issues), and only create a new issue when no relevant issue exists. Before opening an issue, we ask that you review our [contributing guidelines](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md).

# Development Epics

OSCAL is being designed and created over a series of development epics leveraging an incremental and agile approach. Each epic consists of a series of sprints focused on reaching a defined milestone. This approach allows the project team to provide increased value over time at an accelerated pace, by focusing on an 80% solution (Minimally Viable Product (MVP)) that can be implemented in 20% of the time.

Each [milestone](https://github.com/usnistgov/OSCAL/milestones) will result in an incremental release of OSCAL resources.

## OSCAL v1

The first major version of OSCAL, OSCAL v1, will be developed over a series of milestone releases, culminating in a a [full release](#oscal-1-0-0-full-release) of OSCAL v1.

### OSCAL 1.0.0 Milestone 1

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 1.0.0 [Milestone 1](https://github.com/usnistgov/OSCAL/milestone/1)

{{<usa-tag>}}Status{{</usa-tag>}} [Released](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone1) (June 15, 2019)

{{<usa-tag>}}Focus{{</usa-tag>}} Development of the OSCAL Catalog and Profile Models.

This initial OSCAL work encompasses the [catalog](/documentation/schema/profile-layer/#catalog) and [profile](/documentation/schema/profile-layer/#profile) concepts of the OSCAL architecture.

The following stakeholders can benefit from control catalogs and control baselines defined using the OSCAL catalog and profile models respectively.

- **Catalog maintainers:** Publishing control catalogs in OSCAL using OSCAL catalog XML, JSON, or YAML formats (e.g., NIST, ISO, ISACA)
- **Standard baseline maintainers:** Publishing control baselines using OSCAL profile XML, JSON, or YAML formats (e.g., NIST, FedRAMP), which can be used by many organizations consuming OSCAL formatted catalogs and baselines
- **Custom profile maintainers:** Developing new control baselines or customizing existing control baselines for organization-specific use (e.g., cloud service providers, integrators, agencies, businesses) using OSCAL profile XML, JSON, or YAML formats
- **Security and privacy personnel:** That need to select controls and implement security and privacy baselines to address security and privacy risks.
- **Tool vendors:** Creating tools that import and produce information in OSCAL formats to support risk assessment, continuous monitoring, compliance reporting, and other purposes

### OSCAL 1.0.0 Milestone 2

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 1.0.0 [Milestone 1](https://github.com/usnistgov/OSCAL/milestone/2)

{{<usa-tag>}}Status{{</usa-tag>}} [Released](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone2) (October 1, 2019)

{{<usa-tag>}}Focus{{</usa-tag>}} Development of the OSCAL System Security Plan (SSP) Model.

In this development phase the system security plan (SSP) model was developed as part of the [implementation layer](/documentation/schema/implementation-layer/) of the OSCAL architecture. Updates to the [catalog](/documentation/schema/catalog-layer/catalog/) and [profile](/documentation/schema/profile-layer/profile/) models are also provided with this release.

The following additional stakeholders can benefit from SSPs formatted based on the OSCAL SSP model.

- **Security and privacy personnel:** Documenting system implementations, and automatically identifying and addressing security and privacy implementation gaps before loss or damage occur
- **Operations personnel:** Rapidly verifying that systems comply with organizational security requirements
- **Auditors/assessors:** Performing audits/assessments on demand with minimal effort based on rich OSCAL formatted system implementation information.
- **Policy personnel:** Identifying systemic problems that necessitate changes to organizational security policies
- **Tool vendors:** Creating tools that help organizations document and assess security and privacy control implementations using OSCAL formatted system implementation information to support risk assessment, continuous monitoring, compliance reporting, and other purposes

### OSCAL 1.0.0 Milestone 3

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 1.0.0 [Milestone 3](https://github.com/usnistgov/OSCAL/milestone/3)

{{<usa-tag>}}Status{{</usa-tag>}} [Released](https://github.com/usnistgov/OSCAL/releases/tag/v1.0.0-milestone3)

{{<usa-tag>}}Focus{{</usa-tag>}} Development of the OSCAL Component Definition model and drafts of the assessment and assessment result layer models.

This development phase focused on three major areas:

1. The OSCAL [component definition model](/documentation/schema/implementation-layer/component/), which is part of the [implementation layer](/documentation/schema/implementation-layer/) of the OSCAL architecture.
1. Creation of draft models for the [assessment](/documentation/schema/assessment-layer/) and [assessment result](/documentation/schema/assessment-results-layer/) layers. Drafts of the [assessment plan](/documentation/schema/assessment-layer/assessment-plan/), [assessment results](/documentation/schema/assessment-results-layer/assessment-results/), and [plan of action and milestones](/documentation/schema/assessment-results-layer/poam/) (POA&M) models were created.
1. Updates to the [catalog](/documentation/schema/catalog-layer/catalog/), [profile](/documentation/schema/profile-layer/profile/), and [SSP](/documentation/schema/implementation-layer/ssp/) models are also provided with this release.

The following additional stakeholders can benefit from component definitions formatted based on the OSCAL component definitions model. They include the following producers of OSCAL catalogs, profiles, and/or tools:

- **Security and privacy personnel:** Documenting system implementations can import component information related to hardware, software, services, policies, and procedures used to implement their systems saving time and effort
- **Policy personnel:** Can publish information about their policies as a component formatted using the OSCAL component definition model.
- **Tool vendors:** Creating tools that help organizations document and assess security and privacy control implementations using OSCAL formatted component and system implementation information to support risk assessment, continuous monitoring, compliance reporting, and other purposes


### OSCAL 1.0.0 Release Candidate 1 (RC1)

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 1.0.0 [Release Candidate 1](https://github.com/usnistgov/OSCAL/milestone/8)

{{<usa-tag>}}Status{{</usa-tag>}} [Released](https://github.com/usnistgov/OSCAL/releases/)

{{<usa-tag>}}Focus{{</usa-tag>}} Review of draft OSCAL 1.0.0 documentation and formats


### OSCAL 1.0.0 Full Release

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 1.0.0 [Full Release](https://github.com/usnistgov/OSCAL/milestone/4)

{{<usa-tag>}}Status{{</usa-tag>}} Planned

{{<usa-tag>}}Focus{{</usa-tag>}} Publish an OSCAL 1.0.0 Specification

To accelerate the development of OSCAL, we are not focused on developing a formal specification for OSCAL until the final OSCAL 1.0.0 milestone. Until then, the OSCAL models are [documented](/documentation/schema/) on this site. This will allow us to work on a formal specification once most of the major development of OSCAL is completed. For now, adopters of OSCAL will find all of the resources they need to develop content and tools on this site.

### Beyond the OSCAL 1.0.0 Full Release

We will continue to address any defects, improve documentation, and add features where possible over a series of minor and defect fix releases. Minor releases will be be indicated as `1.x.0`, where `x` will be incremented for each minor release. This may include backporting features being worked on in the OSCAL 2.0.0 release epics. Defect fix releases will be indicated as `1.x.y`, where `x` will be the current minor release and `y` will be incremented for each defect fix release. This will allow adopters to benefit from releases against a stable and supported OSCAL v1, while we work on significant new features in OSCAL v2.

## OSCAL v2

Similar to OSCAL v1, the second major version of OSCAL, OSCAL v2, will be developed over a series of milestone releases. We have not yet planned a specific number of milestones in the OSCAL v2 epic. We will start planning OSCAL v2 as are near wrapping up the [final development milestone](#oscal-1-0-0-full-release) of OSCAL v1.

### OSCAL 2.0.0 Milestone 1

{{<usa-tag>}}Development Milestone{{</usa-tag>}} OSCAL 2.0.0 [Milestone 1](https://github.com/usnistgov/OSCAL/milestone/5)

{{<usa-tag>}}Status{{</usa-tag>}} Planned

{{<usa-tag>}}Focus{{</usa-tag>}} Further development of the OSCAL Assessment and Assessment Results models.

The OSCAL Assessment and Assessment Results layers of the OSCAL architecture will continue to be developed as part of the OSCAL 2.0.0 release. This phase of development will focus on integrating automated means of collecting assessment data using existing assessment technologies.

This assessment development work has been split from the earlier OSCAL v1 epic to allow a stable version of OSCAL formats to be released and maintained that provide a solid foundation for publishing control catalog and baseline information, and to allow organizations to automate the documentation, maintenance, and human-focused assessment of system implementations. This will allow tool vendors to develop against stable OSCAL v1 releases, while ongoing development of OSCAL v2 continues.
