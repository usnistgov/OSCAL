---
title: Key Concepts and Terms Used in OSCAL
heading: Key Concepts and Terms Used in OSCAL
weight: 10
sidenav:
    title: Key Concepts and Terms
toc:
    enabled: true
    headingselectors: h2,h3,h4,h5
    collapsedepth: 4
aliases:
 - /learnmore/concepts/
 - /learnmore/concepts/control/
 - /learnmore/concepts/catalog/
 - /learnmore/concepts/profile/
 - /documentation/concepts/
---

This page reviews the many concepts and terms used in OSCAL, and is organized by the corresponding OSCAL layer where a given concept is first introduced.

The concepts used in OSCAL are organized below into the following groups:

- **Control Definition:** Provides for the shared definition of control information that can be used by multiple organizations when documenting control implementations and performing assessments.
- **Implementation:** Used to express the security and privacy implementation of system or a software, hardware, or service offering.
- **Assessment:** Supports the assessment of controls by humans and through automated mechanisms.

## Control Definition

A variety of organizations define a set of security and privacy requirements, which are represented as [controls](#control), which are grouped together as a control [catalog](#catalog). These catalogs are then used by other organizations to establish security and privacy control [baselines](#baseline) through a process that may aggregate and tailor controls from multiple source catalogs.

### Control

Many privacy and security compliance programs are based on or make use of **controls**. Framework authors provide control requirements, system owners implement the controls, and assessors validate the implemented control against the requirement.

In OSCAL, a control is *a requirement or guideline, which when implemented will reduce an aspect of risk related to an information system and its information.*

{{% callout %}}
A **security control** is defined in NIST Special Publication (SP) [SP 800-53 revision 5)](https://doi.org/10.6028/NIST.SP.800-53r5) and the Office of Management and Budget Memorandum Circular [A-130](https://obamawhitehouse.archives.gov/sites/default/files/omb/assets/OMB/circulars/a130/a130revised.pdf), *Managing Information as a Strategic Resource*, as:

> The safeguards or countermeasures prescribed for an information system or an organization to protect the confidentiality, integrity, and availability of the system and its information.

These documents also define a **privacy control** as:

> The administrative, technical, and physical safeguards employed within an agency to ensure compliance with applicable privacy requirements and manage privacy risks.

These definitions align well to the control concept in OSCAL.
{{% /callout %}}

Controls are represented in OSCAL as part of the [catalog model](../layer/control/catalog/).

{{<todo>}}

#### Control Objective

TODO

#### Parameter

TODO

#### Guidance

TODO

#### Assessment Method

TODO

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others, like 800-53A, have it separately.

#### References

TODO

{{</todo>}}

#### Examples of Controls and Catalogs

Each control has an associated definition, which defines what aspect of the information system and its information the control addresses. Definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as:

> The organization has an access control policy and procedures.

However, most controls are considerably more involved.

OSCAL has been built for applications of controls that relate to privacy or security safeguards or countermeasures, such as in the two following examples.

The OSCAL catalog model documentation provides an [example](/concepts/layer/control/catalog/#content-examples) of how a control is expressed in OSCAL.

### Catalog

Framework providers organize control requirements into a **catalog**.
The OSCAL [catalog model](/concepts/layer/control/catalog/) is designed to represent control requirement information and its catalog organization in a machine-readable format with a high degree of fidelity and granularity.

An OSCAL catalog allows control requirements to be grouped, and allows individual control requirements to contain subordinate control requirements (enhancements), control objectives, assessment methods, references, and other content as may be necessary in some frameworks.

In OSCAL a control catalog is *an organized collection of controls*.

Typically, catalogs are represented in human readable documentary form, in which controls are represented as parts of a catalog document. Controls, as defined and described in catalogs, may also be referenced and configured in other documents; thus control information must be composed in a way to make it possible to use control information across different types of documents for different purposes, while maintaining a consistent control "identity" and referential integrity for traceability.

Additionally, catalogs may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls is supported in OSCAL because some control catalog formats, such as COBIT 5, address assessment information directly. Others, like 800-53A, have it separately.

### Baseline

A baseline, or overlay in other terminology, defines a specific set of selected security control requirements from one or more control catalogs for use in managing risks in an information system. The OSCAL [profile model](/concepts/layer/control/profile/) provides a structured, machine-readable representation of a baseline.

{{<callout>}}NIST Special Publication (SP) [800-37 Revision 2](https://csrc.nist.gov/publications/detail/sp/800-37/rev-2/final) defines a baseline as "the set of controls that are applicable to information or an information system to meet legal, regulatory, or policy requirements, as well as address protection needs for the purpose of managing risk."{{</callout>}}

Using the OSCAL profile model to express a baseline makes the mappings between the control catalog and the profile explicit and machine-readable. A single OSCAL profile can reference controls in multiple catalogs. OSCAL permits profiles to use the same interoperable format irrespective of which catalogs are being used.

The figure below uses the NIST SP 800-53 low baseline as an example to sketch how a baseline relates to a catalog. The low baseline indicates which controls from the NIST SP 800-53 catalog are required for compliance with this baseline.

![As described in the text, the diagram depicts how a profile maps back to a catalog.](profile-catalog-mapping-trivial-example.png)

{{<todo>}}

## Implementation

TODO

## Assessment

TODO

{{</todo>}}
