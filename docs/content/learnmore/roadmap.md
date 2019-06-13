---
title: Roadmap
description: OSCAL Roadmap
permalink: /learnmore/roadmap/
topnav: learnmore
sidenav: learnmore
sticky_sidenav: true
layout: post
---

OSCAL is a community-driven, NIST-led project, with an [open invitation](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md) to the community to participate in the framing and development of OSCAL. Feature requests can be [created and submitted](https://github.com/usnistgov/OSCAL/issues/new?assignees=&labels=User+Story%2C+enhancement&template=feature_request.md) directly into the project's GitHub repository. Feedback in the form of [bug reports](https://github.com/usnistgov/OSCAL/issues/new?assignees=&labels=bug&template=bug_report.md) are also encouraged and appreciated. If appropriate, we ask you add a comment to an [existing relevant issue](https://github.com/usnistgov/OSCAL/issues), and only create a new issue when no relevant issue exists. Before opening an issue, we ask that you review our [contributing guidelines](https://github.com/usnistgov/OSCAL/blob/master/CONTRIBUTING.md).

### Development Epics

OSCAL is being designed and created over a series of development epics leveraging an incremental and agile approach. Each epic consists of a series of sprints focused on reaching a defined milestone. This approach allows the project team to provide increased value over time at an accelerated pace, by focusing on an 80% solution (Minimally Viable Product (MVP)) that can be implemented in 20% of the time.

Each [milestone](https://github.com/usnistgov/OSCAL/milestones) will result in an incremental release of OSCAL resources.

- OSCAL 1.0 [Milestone 1](https://github.com/usnistgov/OSCAL/milestone/1): Develop the OSCAL Catalog and Profile models

  The initial OSCAL work encompasses the [catalog]({{ site.baseurl }}/docs/catalog/) and [profile]({{ site.baseurl }}/docs/profile/) concepts of the OSCAL [architecture]({{ site.baseurl }}/docs/). There are several types of users who will benefit from OSCAL catalogs and profiles. They include the following producers of OSCAL catalogs, profiles, and/or tools:

  - **Catalog maintainers:** publishing catalogs into OSCAL format (e.g., NIST, ISO, ISACA)
  - **Standard profile maintainers:** profiles in OSCAL format used by many organizations consuming OSCAL catalogs (e.g., NIST, FedRAMP)
  - **Custom profile maintainers:** developing new profiles or customizing existing profiles for organization-specific use (e.g., cloud service providers, integrators)
  - **Tool vendors:** creating tools that use OSCAL to support risk assessment, continuous monitoring, compliance reporting, and other purposes

  There are also several types of expected consumers of OSCAL catalogs, profiles, and/or tools, including the following:

  - **Operations personnel:** rapidly verifying that systems comply with organizational security requirements
  - **Security and privacy personnel:** automatically identifying problems and addressing them quickly before loss or damage occur
  - **Auditors/assessors:** performing audits/assessments on demand with minimal effort
  - **Policy personnel:** identifying systemic problems that necessitate changes to organizational security policies

- OSCAL 1.0 [Milestone 2](https://github.com/usnistgov/OSCAL/milestone/2): Develop the OSCAL Implementation models
- OSCAL 1.0 [Milestone 3](https://github.com/usnistgov/OSCAL/milestone/3): Develop the OSCAL Assessment and Assessment Results models
- OSCAL 1.0 [Final Release](https://github.com/usnistgov/OSCAL/milestone/4): Publish an OSCAL 1.0 Specification

To accelerate development, we are not focused on developing a formal specification for OSCAL until the final milestone. Until then, the OSCAL models will be [documented]({{ site.baseurl }}/docs/schemas/) on this site. This will allow us to work on a formal specification once most of the major development of OSCAL is completed. Until that point, adopters of OSCAL will find all of the resources they need to develop content and tools on this site.
