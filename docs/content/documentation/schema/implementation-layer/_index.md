---
title: Implementation Layer
heading: "OSCAL Implementation Layer"
description: Provides models that support the description of how controls are [implemented](/documentation/schema/implementation-layer/ssp/) in a given information system or a [distributed component](/documentation/schema/implementation-layer/component/) that can be incorporated into an information system.
weight: 50
sidenav:
    activerenderdepth: 2
    inactiverenderdepth: 2
---

The OSCAL implementation layer provides models for describing how controls are implemented in a specific system or in distributed component that can be incorporated into a system.

The OSCAL models comprising the implementation layer are:

1. A **[Component Definition model](component/)**, allows for the definition of a set of *components* that each provide a description of the controls supported by a specific implementation of a hardware, software, or service; or by a given policy, process, procedure, or compliance artifact (e.g., FIPS 140-2 validation).

1. A **[System Security Plan (SSP) model](ssp/)** that allows the security implementation of an information system to be defined based on an OSCAL profile (or baseline). OSCAL-based SSPs are expressed in a machine-readable formats that can be easily imported into a tool, allowing for increased automation of SSP validation and system assessment. An OSCAL SSP can also be transformed from the machine-readable form to a human-readable version.

1. Other models may be included in future releases of OSCAL based on community input and need.

The component and SSP models are designed to work together. As specific components are selected for use within a system, the content of the relevant component definition files can be used to populate the use of these components within the SSP model. The SSP model can also be used to represent systems that do not define information at the granularity of a specific component, where component definitions do not exist.
