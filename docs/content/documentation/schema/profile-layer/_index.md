---
title: Profile Layer
heading: "OSCAL Profile Layer"
description: Provides the OSCAL [profile model](/documentation/schema/profile-layer/profile/), which represents a [profile](/learnmore/concepts/profile/), also known as a *baseline* or *overlay*.
weight: 60
sidenav:
    activerenderdepth: 2
    inactiverenderdepth: 2
---

A **profile** defines a specific set of selected security control requirements from one or more control catalogs. The term "[profile](#profile)" in OSCAL is also called a *baseline* or *overlay* in other terminology.

The OSCAL profile layer provides the [profile model](profile/), which defines structured, machine-readable XML, JSON, and YAML representations of the information contained within a [profile](#profile). The OSCAL profile model is the sole model in the OSCAL profile layer of the OSCAL architecture.

The OSCAL profile model allows for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). An OSCAL profile can select controls from more than one catalog, allowing an organization to have a single profile that references controls from several catalogs. OSCAL profiles can also be based on other OSCAL Profiles, allowing baselines to be established based on the customization of another baseline. This is something we see in the real world quite a bit.

In OSCAL, profiles are generalized to be applicable to any set of information presented in catalog form. Thus, the idea of tailoring in application can be applied not only to security guidelines in general, but also in mixed environments that have to address requirements in more than one catalog at a time.
