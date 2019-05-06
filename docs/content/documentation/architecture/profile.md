---
title: Profile
description: Profile
permalink: /docs/architecture/profile/
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
    current: true
sticky_sidenav: true
---

[See examples of OSCAL profiles](/resources/examples/profiles/)

An OSCAL profile is a set of security requirements, where meeting each requirement necessitates implementing one or more security controls. Commonly referred to as *baselines* or *overlays* (in order to indicate their relations to the catalogs from which their controls are drawn), examples of profiles include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements.

OSCAL profiles are representations of their catalogs configured for use by organizations or in specialized operational contexts. As such, they can be thought of as change lists or punch lists referencing one or more catalogs, defining any or all of the following:

* Which controls are *selected* from the catalog and thereby considered to be in scope for the application;
* How the control selection should be *organized* and represented, including whether and how competing control definitions are to be resolved and merged;
* Whether and where any controls are to be *configured* or modified; this includes setting parameter values for a catalog but also potentially amending the language given in controls and subcontrols, to describe their application in the system. 

These three functions are reflected in the organization of a profile document, which may contain (in addition to document metadata) any of three sections, `import`, `merge`, and `modify`:

* `import` (required) - indicates which controls to include or exclude from catalogs
* `merge` - what merge rules to follow and how to organize outputs
* `modify` - how to configure and/or modify parameters and control languages (statements, guidance etc.)

The figure below sketches how OSCAL relates profiles to catalogs. This example represents the NIST SP 800-53 low baseline. The profile indicates which controls from the NIST SP 800-53 catalog are required to for compliance with this baseline. Using OSCAL formats for these baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

<img src="/assets/img/profile-catalog-mapping-trivial-example.png" alt="profile-catalog-mapping" width="800" />
