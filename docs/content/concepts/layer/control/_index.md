---
title: Control Layer
heading: "OSCAL Control Layer"
weight: 70
suppresstopiclist: true
sidenav:
    activerenderdepth: 3
    inactiverenderdepth: 3
toc:
  enabled: true
aliases:
  - /documentation/schema/catalog-layer/
  - /documentation/schema/profile-layer/
---

The OSCAL control layer consists of the following models.

## Catalog Model

The **[Catalog Model](catalog/)** provides a structured, machine-readable representation of a **[catalog](../../terminology/#catalog)** of **[controls](../../terminology/#control)**. The OSCAL catalog model can be represented in XML, JSON, and YAML formats.
  
It is important to note that the OSCAL catalog model is not a catalog document format, since the introductory prose included in many control catalogs is not present (or supported) in the OSCAL catalog model. Instead, the OSCAL catalog formats provide a robust syntax for representing collections of controls, including control statements, assessment objectives, and other control details. This structured form of a control catalog allows control information to be easily imported, exported, indexed, and searched by applications.

Controls must also be encoded in a standard machine-readable form. The OSCAL model gives the designers of catalogs great flexibility in the details of how controls are defined, with their consistuent parts. This is described further in a page providing a high-level introductory walkthrough of an [Annotated Example](catalog/sp800-53rev5-example) of a control, as defined by NIST SP 800-53 Rev 5.

## Profile Model

The **[Profile Model](profile/)** provides a structured, machine-readable representation of a **[baseline](../../terminology/#baseline)**. As the starting point for defining an organization's security mission and security posture, a baseline must be defined by any organization undertaking an RMF-based security program or security assessment (Risk Management Framework), typically by selecting and adapting controls from an authoritative catalog of controls, or from another baseline that has already been defined and described.

The OSCAL profile model allows for selecting security controls from catalogs using a number of different mechanisms, as well as for tailoring those controls (e.g., assigning parameter values, modifying requirements). An OSCAL profile can select controls from more than one catalog, allowing an organization to have a single profile that references controls from several catalogs. OSCAL profiles can also be based on other OSCAL profiles, allowing baselines to be established as customizations of other baselines. This technical capability reflects the real-world use case for organizations and programs who need to do this.

In OSCAL, profiles are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.
