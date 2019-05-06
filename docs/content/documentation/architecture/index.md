---
title: Architecture
description: OSCAL Architecture
permalink: /docs/architecture/

layout: post
topnav: concepts
sidenav: concepts
subnav:
  - text: Control
    href: /docs/architecture/control/
  - text: Catalog
    href: /docs/architecture/catalog/
  - text: Profile
    href: /docs/architecture/profile/
sticky_sidenav: true
---

OSCAL, or any security documentation using current best practices, is all about **controls** and **catalogs**. A control represents a security requirement, guideline, procedure or activity. A catalog is an organized collection of controls.

Typically, catalogs are represented in documentary form, in which controls (or representations of controls as configured and qualified in a system) are represented as parts of documents. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to migrate across different types of documents for different purposes, while maintaining "identity" and referential integrity for traceability. Consequently, OSCAL is designed as a **documentary architecture** comprising several related document models, arranged in **layers**.

In particular, the design of the OSCAL Profile layer, in relation to the Catalog layer, reflects the use of control catalogs as outlined in NIST SP800-53 -- specifically the concept of *baselines* and *overlays* over a base catalog. (And then, as we see in the real world, overlays on the overlays.) In OSCAL, this idea is generalized to be applicable to any set of information presented in catalog form. Thus the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

Together, these models address functional requirements as depicted in the following diagram:

<img src="/assets/img/oscal-components.png" alt="oscal components" width="800" />

Starting from the left, the OSCAL layers are currently defined as:

- **Catalog/Framework:** In addition to defining a set of security controls, it may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls has been done because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.
- **Profile:** The profile format will allow for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.
- **Implementation:** Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.
- **Assessment:** Describes how the system assessment is to be performed.
- **Assessment Results:** Records the findings of the assessment.

As the project progresses, these definitions are expected to evolve; they are included here to indicate the current status within OSCAL and may not the represent the final definitions for each model.  The above is a high-level explanation of the basic constructs supported by OSCAL. These constructs exist in all OSCAL bindings (e.g., XML, JSON). At this time, the material covers OSCAL controls, catalogs, and profiles. Additional OSCAL constructs will be added as they are developed and matured.

