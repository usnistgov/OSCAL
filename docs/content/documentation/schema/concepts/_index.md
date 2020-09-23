---
title: OSCAL Model Concepts
heading: Concepts Within and Among OSCAL Models
description: Reviews concepts within OSCAL models, as well as concepts across models.
weight: 20
sidenav:
    title: OSCAL Model Concepts
---

Information is organized logically within each OSCAL model. OSCAL models are also deisnged to interact, which provides traceability and minimizes duplication.

## General OSCAL Model Organization

Every OSCAL model includes a required metadata section, optional back-matter section, and mode-specific body.

## OSCAL File Organization

Every OSCAL file must have a minimum set of required fields and assemblies, and must follow the [core OSCAL syntax](../).


{{% usa-grid-container %}}
{{% usa-grid-row %}}
{{% usa-grid-column class="col-4" %}}
&nbsp;

![A diagram representing the general layout of any OSCAL file, showing the following information. A root element, a metadata section, a model-specific section, and a back-matter section.](OSCAL-file.svg)
{{% /usa-grid-column %}}
{{% usa-grid-column class="col-8, padding-left-2" %}}
An OSCAL file is organized as follows:
- **Root Element**: The root element of the file indicates the type of content within the body of the file. 

- **UUID**: The Universally Unique ID (UUID) at the root must be changed every time the content of the file is modified.

- **Metadata**: Every OSCAL file must have a metadata section and include a title, last-modified timestamp, and OSCAL syntax version. Metadata is also used to define roles, parties (people, teams and organizations), and locations.

- **Model-specific Body**: The body of an OSCAL file is different for each model.

- **Back Matter**: Back matter syntax is identical in all OSCAL models. It is used for attachments, citations, and embedded content such as graphics. Tool developers and content authors are encouraged to attach content here and reference it from within the body of an OSCAL file.



{{% /usa-grid-column %}}
{{% /usa-grid-row %}}

{{% /usa-grid-container %}}

## Catalog Model Concepts

Many privacy and security compliance frameworks are based on **controls**. 
Framework authors provide control requirements, system owners impliment the controls, and assessors validate the implemented control against the requirement. 

Framework providers organize control requirements into a **catalog**.
The OSCAL catalog model is designed to represent control requirement information and its catalog organization in a machine-readable format with a high degree of fidelity and granularity.

An OSCAL catalog allows control requirements to be grouped, and allows individual control requirements to contain subordinate control requirements (enhancements), control objectives, assessment methods, references, and other content as may be necessary in some frameworks. 

The control model is the foundation for all other OSCAL models. 

### Control

In OSCAL, a control is *a requirement or guideline, which when implemented will reduce an aspect of risk related to an information system and its information.*


{{% callout %}}
A **security control** is defined in NIST Special Publication (SP) [SP 800-53 revision 5 (draft)](https://doi.org/10.6028/NIST.SP.800-53r5-draft) and the Office of Management and Budget Memorandum Circular [A-130](https://www.whitehouse.gov/sites/whitehouse.gov/files/omb/circulars/A130/a130revised.pdf), *Managing Information as a Strategic Resource*, as:

> The safeguards or countermeasures prescribed for an information system or an organization to protect the confidentiality, integrity, and availability of the system and its information.

These documents also define a **privacy control** as:

> The administrative, technical, and physical safeguards employed within an agency to ensure compliance with applicable privacy requirements and manage privacy risks.

These definitions align well to the control concept in OSCAL.
{{% /callout %}}

OSCAL has been built for applications of controls that relate to privacy or security safeguards or countermeasures, such as in the two following examples. However, it may be possible to apply OSCAL beyond security or privacy controls for applications related to safety, health, or other purposes. These other applications have not been explored so far.

## Profile Model Concepts

OSCAL profiles define a set of operations that are to be performed on one or more control catalogs to suffeciently reduce and tailor the catalog for use as a system implementation baseline. As such, an OSCAL profile can be thought of as change lists or punch lists referencing one or more catalogs, defining any or all of the following:

* Which controls are *selected* from the catalog and thereby considered to be in scope for the application;
* How the control selection should be *organized* and represented, including whether and how competing control definitions are to be resolved and merged;
* Whether and where any controls are to be *configured* or modified; this includes setting parameter values for a catalog but also potentially amending the language given in controls to describe their application in the system.

See [examples](#content-examples) of OSCAL profiles.

These three functions are reflected in the organization of a profile document, which may contain (in addition to document metadata) any of three sections, `import`, `merge`, and `modify`:

* `import` (required) - indicates which controls to include or exclude from catalogs
* `merge` - what merge rules to follow and how to organize outputs
* `modify` - how to configure and/or modify parameters and control languages (statements, guidance etc.)

The figure below sketches how OSCAL relates profiles to catalogs. This example represents the NIST SP 800-53 low baseline. The profile indicates which controls from the NIST SP 800-53 catalog are required to for compliance with this baseline. Using OSCAL formats for these baselines makes the mappings between the control catalog and the profile explicit and machine readable. A single profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

![profile-catalog-mapping](profile-catalog-mapping-trivial-example.png)

## Component Model Concepts

_coming soon_

## System Security Plan (SSP) Model Concepts

_coming soon_

## Assessment Plan (AP) Model Concepts

_coming soon_

## Assessment Results (AR) Model Concepts

_coming soon_

## Plan of Action and Milestones (POA&M) Model Concepts

_coming soon_



