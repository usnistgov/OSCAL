---
title: "OSCAL Documentation"
aliases:
  - /docs/schemas/
menu:
  primary:
    name: Documentation
    weight: 40
suppresstopiclist: false
sidenav:
  inactiverenderdepth: 1
  activerenderdepth: 2
---

This section of the OSCAL website provides the specification for OSCAL.

The OSCAL specification is split into multiple sections:

1. [**Layers and Model Reference**](schema/)

    This section of the OSCAL specification will provide you with details on the layers, models, and formats that comprise OSCAL. Concepts for each layer and model are discussed, and the semantics of each model and associated formats are defined.

    OSCAL is organized into a a set of related layers. Each layer provides support for control, control implementation, or control assessment concepts. Layers are composed of models, with each model defining an information structure that supports a specific purpose. Each model is bound to a set of XML-, JSON-, and YAML-based formats that allows model-specific OSCAL content to be expressed in a machine-readable structure.

1. [**Processing Documentation**](processing/)

    OSCAL defines rules for processing OSCAL content expressed in a format associated with a specific OSCAL model. These rules define how an OSCAL implementation should process and derive information from specific types of OSCAL content.

Additionally, the following other OSCAL documentation is provided:

- Real-world and constructed [examples](examples/) of the OSCAL models in XML, JSON, and YAML formats.
- A discussion of how OSCAL relates to and draws inspiration from [other documentary formats](relations-to-other/).
