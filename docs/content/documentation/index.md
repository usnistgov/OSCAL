---
title: The OSCAL Architecture
description: The OSCAL Architecture
permalink: /docs/

layout: post
topnav: architecture
sidenav: architecture
subnav:
  - text: Control
    href: /docs/control/
  - text: Catalog
    href: /docs/catalog/
  - text: Profile
    href: /docs/profile/
sticky_sidenav: true
---

The OSCAL architecture is organized in a series of *layers* depicted below from left to right. Each layer consists of a human-oriented documentation artifact depicted on the top, a statement of what organizations might do with this information in the middle, and a machine-oriented OSCAL *model* depicted along the bottom of the image that is capable of representing the information from the human-oriented documentation artifact on the top. Each model in OSCAL is intended to build on the information provided by the model in the previous layer. Consequently, OSCAL is designed as a **documentary architecture** comprising several related document models, arranged in **layers**. OSCAL models are represented in machine readable formats (e.g., XML, JSON).

Together, these models (partially) address the functional requirements as depicted in the following diagram:

<img src="{{ site.baseurl }}/assets/img/oscal-components.png" alt="oscal components" width="800" />

Starting from the left, the OSCAL layers are currently defined as:

- **Catalog:** In OSCAL, or any security documentation using current best practices, is all about **controls** and **catalogs**. A [control](control) represents a security requirement, guideline, procedure or activity. A [catalog](catalog) is an organized collection of controls.

  Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to migrate across different types of documents for different purposes, while maintaining "identity" and referential integrity for traceability.

  Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.

- **Profile:** The profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.

  In particular, the design of the OSCAL Profile layer, in relation to the Catalog layer, reflects the use of control catalogs as outlined in NIST SP800-53 -- specifically the concept of *baselines* and *overlays* over a base catalog. And then, as we see in the real world, overlays on the overlays. In OSCAL, [profiles](profile) are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

- **Implementation:** Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.
- **Assessment:** Describes how the system assessment is to be performed.
- **Assessment Results:** Records the findings of the assessment.

As the project [progresses](/OSCAL/learnmore/roadmap/), these definitions are expected to evolve; they are included here to indicate the current status within OSCAL and may not the represent the final definitions for each model.  The above is a high-level explanation of the basic constructs supported by OSCAL. These constructs exist in all OSCAL bindings (e.g., XML, JSON). At this time, the material covers OSCAL controls, catalogs, and profiles. Additional OSCAL constructs will be added as they are developed and matured.

