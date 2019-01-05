---
title: Profile
description: Profile
permalink: /docs/components/profile/

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
    current: true
sticky_sidenav: true
---

An OSCAL profile is a set of security requirements, where meeting each requirement necessitates implementing one or more security controls. Commonly referred to as a baseline or overlay, examples of profiles include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements.

The figure below is an example of what OSCAL is doing with catalogs and profiles. This example represents the NIST SP 800-53 low baseline, which is a profile in OSCAL nomenclature. The profile is effectively indicating which controls from the NIST SP 800-53 catalog are required to be compliant with the profile (NIST SP 800-53 low baseline). Using OSCAL formats for these baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single profile can reference controls in multiple catalogs. OSCAL will allow profiles to be generated using the same interoperable format regardless of which catalogs are being used.

<img src="/assets/img/profile-catalog-mapping-trivial-example.png" alt="profile-catalog-mapping" width="800" />
