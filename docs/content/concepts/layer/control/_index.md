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

Controls, as the constituent parts of catalogs, must also be encoded in a standard machine-readable form. The OSCAL model gives the designers of catalogs great flexibility in the details of how controls are defined, with their consistuent parts. This is described further in a page providing a high-level introductory walkthrough of an [Annotated Example](catalog/sp800-53rev5-example) of a control, as defined by NIST SP 800-53 Rev 5.

## Profile Model

The **[Profile Model](profile/)** provides a structured, machine-readable representation of a **[baseline](../../terminology/#baseline)**. An OSCAL profile defines a specific set of selected security control requirements from one or more control catalogs, or by customizing other profiles.

The OSCAL profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). An OSCAL profile can select controls from more than one catalog, allowing an organization to have a single profile that references controls from several catalogs. OSCAL profiles can also be based on other OSCAL Profiles, allowing baselines to be established based on the customization of another baseline. This is something we see in the real world quite a bit.

In OSCAL, profiles are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.
