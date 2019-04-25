---
title: Components
description: Components
permalink: /docs/components/

layout: post
topnav: documentation
sidenav: documentation
subnav:
  - text: Control
    href: /docs/components/control/
  - text: Catalog
    href: /docs/components/catalog/
  - text: Profile
    href: /docs/components/profile/
sticky_sidenav: true
---

OSCAL, or any security documentation using current best practices, is all about **controls** and **catalogs**. A control represents a security requirement, guideline, procedure or activity. A catalog is an organized collection of controls.

However, both controls and catalogs represent abstractions. In order to apply these ideas to real systems, we need documents that talk about the real world. The other layers of OSCAL's model together make up a component architecture that enables such application, through the Risk Management Framework up from policy definition (layers 1 and 2), planning and authorization (on OSCAL layer 3, the Implementation layer), and through to assessment and assessment results (on layers to come).

Specifically, the design of the Profile layer, in relation to the Catalog layer, reflects the use of control catalogs as outlined in NIST SP800-53 -- specifically the design of "baselines" and "overlays" over a base catalog. (And then, as we see in the real world, overlays on the overlays.) In OSCAL, this idea is generalized to be applicable to any set of information presented in catalog form. Thus the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.

All these components except controls (which are present in all layers) are depicted in the following diagram:

<img src="/assets/img/oscal-components.png" alt="oscal components" width="800" />

Starting from the bottom on the left, the OSCAL components are currently defined as:

- **Catalog/Framework:** In addition to defining a set of security controls, it may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls has been done because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.
- **Profile:** The profile format will allow for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.
- **Implementation:** Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.
- **Assessment:** Describes how the system assessment is to be performed.
- **Assessment Results:** Records the findings of the assessment.

As the project progresses, these definitions are expected to evolve; they are included here to indicate the current status within OSCAL and may not the represent the final definitions for each component.  The above is a high-level explanation of the basic constructs supported by OSCAL. These constructs exist in all OSCAL bindings (e.g., XML, JSON). At this time, the material covers OSCAL controls, catalogs, and profiles. Additional OSCAL constructs will be added as they are developed and matured.

