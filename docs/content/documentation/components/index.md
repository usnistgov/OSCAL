---
title: Components
description: Components
permalink: /docs/components/

layout: post
topnav: documentation
sidenav: documentation
subnav:
  - text: Catalog
    href: /docs/components/catalog/
  - text: Control
    href: /docs/components/control/
  - text: Profile
    href: /docs/components/profile/
sticky_sidenav: true
---

The plans for OSCAL involve all the components depicted in the following diagram:

<img src="/assets/img/oscal-components.png" alt="oscal components" width="800" />

Starting from the bottom on the left, the OSCAL components are currently defined as:

- **Catalog/Framework:** In addition to defining a set of security controls, it may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls has been done because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.
- **Profile:** The profile format will allow for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.
- **Implementation:** Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.
- **Assessment:** Describes how the system assessment is to be performed.
- **Assessment Results:** Records the findings of the assessment.

As the project progresses, these definitions are expected to evolve; they are included here to indicate the current status within OSCAL and may not the represent the final definitions for each component.  The above is a high-level explanation of the basic constructs supported by OSCAL. These constructs exist in all OSCAL bindings (e.g., XML, JSON). At this time, the material covers OSCAL controls, catalogs, and profiles. Additional OSCAL constructs will be added as they are developed and matured.

