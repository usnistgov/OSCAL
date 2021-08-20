---
title: Implementation Layer
heading: "OSCAL Implementation Layer"
suppresstopiclist: true
weight: 50
sidenav:
    activerenderdepth: 2
    inactiverenderdepth: 2
toc:
  enabled: true
---

The OSCAL implementation layer provides models for describing how controls are implemented in a specific system or in distributed component that can be incorporated into a system.

The OSCAL control layer consists of the following models.

## Component Definition Model

The **[Component Definition model](component-definition/)** allows for the definition of a set of *components* that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation). These are intended to be produced by the maintainer of the hardware, software, or service; or by the author of a given policy, process, procedure, or compliance artifact. Consumers of these assets are then able to use this information to document the implementation of a given asset in the implementing information system's System Security Plan (SSP).

## System Security Plan Model

The **[System Security Plan model](ssp/)** allows the security implementation of an information system to be defined using an OSCAL profile (or baseline) as the basis for the system's control implementation. OSCAL-based SSPs are expressed in machine-readable formats that can be easily imported into a tool, allowing for increased automation of SSP validation and system assessment. An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

## Component Definitions and SSPs 

The component definition and SSP models are designed to work together. As specific components are selected for use within a system, the content of the relevant component definition files can be used to populate the use of these components within the SSP model. The SSP model can also be used to represent systems that do not define information at the granularity of a specific component, where component definitions do not exist.
