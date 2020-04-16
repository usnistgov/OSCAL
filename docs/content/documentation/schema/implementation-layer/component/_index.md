---
title: Component Definition Model
heading: "OSCAL Implementation Layer: Component Definition Model"
description: XML and JSON format documentation for the OSCAL Component Definition model, which is part of the OSCAL implementation layer in the OSCAL [architecture]](/learnmore/architecture/). These formats model a description of the controls that are supported in a given implementation of a hardware, software, service, policy, process, or procedure.
weight: 50
aliases:
  - /docs/model/component/
  - /documentation/schema/component/
---

The OSCAL component definition model represents a description of the controls that are supported in a given implementation of a hardware, software, service, policy, process, or procedure. The component definition model is part of the OSCAL [implementation](../) layer.

Each defined component describes where appropriate:

- Information about the organization that provides, develops, and manages the thing described by the component;
- Characteristics of the component, such as its name, version, model, last-modified date, etc;
- Details about the controls that could be satisfied by the component;
- Configuration options for achieving specific security or privacy objectives; and
- Assessment tests or scripts that may be used to validate the component's implementation.

The component definition model allows grouping related components into capabilities, and documenting how the combination of components in a capability together can satisfy specific controls that are not fully satisfied by a single component on its own.

A component within a component definition can be used to document and share:

1. proof of compliance for a security requirement for hardware or software, such as FIPS 140-2 validated cryptography,
1. to document information about how a hardware, software, or service offering supports specific security or privacy controls, or
1. demonstrate how a policy or procedure implements a given set of security or privacy controls.

These component definitions can be used by organizations implementing the thing defined by a given component to provide a significant amount of implementation details needed when documenting a system's control implementation in a system security plan.
