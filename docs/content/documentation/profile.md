---
title: Profile
description: Profile
permalink: /docs/profile/
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
    current: true
sticky_sidenav: true
---

In OSCAL a profile is:

> A specific set of security [control]({{ site.baseurl }}/docs/control/) requirements; also called a *baseline* or *overlay*. A profile represents a selection of controls from one or more [catalogs]({{ site.baseurl }}/docs/catalog/), with configuration or qualification appropriate to the profile's use case. Profiles may be published with the catalogs from which they are derived, or they may be developed and maintained separately. Examples include the control baselines in NIST SP 800-53, the FedRAMP baselines, and NIST SP 800-171 (a controls baseline for CUI/NFO).  Profiles can be tailored based on the Confidentiality, Integrity, and Availability (CIA) requirements of the underlying system.

OSCAL profiles are representations of their catalogs configured for use by organizations or in specialized operational contexts. As such, they can be thought of as change lists or punch lists referencing one or more catalogs, defining any or all of the following:

* Which controls are *selected* from the catalog and thereby considered to be in scope for the application;
* How the control selection should be *organized* and represented, including whether and how competing control definitions are to be resolved and merged;
* Whether and where any controls are to be *configured* or modified; this includes setting parameter values for a catalog but also potentially amending the language given in controls to describe their application in the system. 

See [examples](/OSCAL/resources/examples/profiles/) of OSCAL profiles.

These three functions are reflected in the organization of a profile document, which may contain (in addition to document metadata) any of three sections, `import`, `merge`, and `modify`:

* `import` (required) - indicates which controls to include or exclude from catalogs
* `merge` - what merge rules to follow and how to organize outputs
* `modify` - how to configure and/or modify parameters and control languages (statements, guidance etc.)

The figure below sketches how OSCAL relates profiles to catalogs. This example represents the NIST SP 800-53 low baseline. The profile indicates which controls from the NIST SP 800-53 catalog are required to for compliance with this baseline. Using OSCAL formats for these baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

<img src="{{ site.baseurl }}/assets/img/profile-catalog-mapping-trivial-example.png" alt="profile-catalog-mapping" width="800" />
