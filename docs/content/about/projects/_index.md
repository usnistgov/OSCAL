---
title: Project Structure
heading: OSCAL Project Structure
weight: 20
toc:
  enabled: true
---

The OSCAL project is made up of several components, each of which lives in its own repository on GitHub under the [`usnistgov`](https://github.com/usnistgov) organization.

These repositories form a complex patchwork of projects that depend on one-another:

{{<mermaid>}}
graph LR
    subgraph "NIST Dependencies"
        metaschema((Metaschema))
        metaschema-java
        hugo-uswds
        
        metaschema-java-->|submodules|metaschema
        metaschema-->|submodules|hugo-uswds
    end
    
    subgraph "Core Projects"
        oscal((OSCAL));
        liboscal-java
        oscal-cli(oscal-cli)
        oscal-content

        oscal-cli-.->|depends on|liboscal-java-->|submodules|oscal
        oscal-content-->|submodules|oscal
        
        click oscal #OSCAL
    end
    
    subgraph "NIST-Maintained Tools"
        oscal-xslt
        oscal-deep-diff(OSCAL-Deep-Diff)
    end
    
    oscal-->|submodules|metaschema
    oscal-->|submodules|hugo-uswds
    liboscal-java-.->|depends on|metaschema-java
{{</mermaid>}}

## Core Projects

The core projects provide the central functionality or documentation of the OSCAL project and are the primary focus of the NIST OSCAL team.

### OSCAL

The OSCAL repository is the largest and most complex repository in the OSCAL project. It contains:
- The [Metaschema](#Metaschema) model definitions that define OSCAL
- The OSCAL website along with all tutorials and model documentation
- Informal specifications for operations on OSCAL models (such as [profile resolution](https://pages.nist.gov/OSCAL/concepts/processing/profile-resolution/))
- XML and JSON schemas for all models
- XML transformation pipelines for xml/json conversion

Repository: https://github.com/usnistgov/OSCAL

### `liboscal-java`

`liboscal-java` is a suite of Java libraries based on [Metaschema-Java](#Metaschema-Java) that implement common OSCAL operations such as reading/writing artifacts, profile resolution, and validation.

Repository: https://github.com/usnistgov/liboscal-java

### OSCAL-CLI

OSCAL-CLI provides an easy-to-use CLI based on [`liboscal-java`](#liboscal-java). 

Repository: https://github.com/usnistgov/oscal-cli

### OSCAL-content

The OSCAL content repository provides a library of official NIST-maintained OSCAL examples in XML, JSON, and YAML.

Repository: https://github.com/usnistgov/oscal-content

## NIST Dependencies

These NIST projects underpin the OSCAL project, but are governed separately from the OSCAL umbrella.

### Metaschema

Metaschema is the modeling language that OSCAL uses to define all models. This repository documents Metaschema and provides XML pipelines used by OSCAL to perform various operations, like generation of model documentation, schemas, and content converters.

Repository: https://github.com/usnistgov/metaschema

### Metaschema-Java

Metaschema-Java is the Java implementation of Metaschema, providing the toolchain used by [`liboscal-java`](#liboscal-java) to parse and validate OSCAL artifacts.

Repository: https://github.com/usnistgov/metaschema-java

### Hugo-USWDS

Both the OSCAL Project and the [Metaschema](https://pages.nist.gov/metaschema/) share this repository as a common website template based on the [US Web Design System](https://designsystem.digital.gov/).

Repository: https://github.com/usnistgov/hugo-uswds

## NIST-Maintained Tools

These projects are run by the OSCAL team, but may not be the primary focus of the NIST OSCAL team.

### OSCAL-Deep-Diff

A schema-agnostic diffing tool and library built to compare OSCAL JSON documents.

Repository: https://github.com/usnistgov/oscal-deep-diff

### OSCAL-XSLT

This repository contains a collection of XSLT-based utilities for displaying and processing OSCAL documents.

Repository: https://github.com/usnistgov/oscal-xslt

## Other Projects

### What about projects not on this list?

NIST OSCAL Team staff, or NIST staff more generally, develop software for their own education or experimentation. If you see NIST staff, either on the [`usnistgov` GitHub organization](https://github.com/usnistgov/) or user accounts associated with official NIST work, these are not considered official NIST projects until they are included in the categories above. Individuals may pursue work on them, but they have no official maintenance or support guarantees from this team.
