---
title: Roadmap
description: OSCAL Roadmap
permalink: /learnmore/roadmap/
topnav: learnmore
sidenav: learnmore
sticky_sidenav: true
layout: post
---

## The problem solved by OSCAL

IT security professionals must ensure their systems comply with multiple regulatory control catalogs and frameworks such as NIST Special Publication (SP) 800-53, NIST Cybersecurity Framework, ISO/IEC 27001 and 27002, COBIT, PCI DSS, HIPAA, etc., which provide catalogs of security controls and policies. With the advent of cloud and the Internet of Things (IoT), Information Technology complexity is increasing to include a broadening of the attack surface and a proliferation of potential security vulnerabilities, making system security planning more complicated. A large percentage of system security planning, auditing, and assessing is done using spreadsheets and documents which drives manual and paper-based compliance processes. This approach is not only labor intensive, it also generates information that is out-of-date shortly after it is documented, often leaving critical risks undiscovered or unaddressed (a phenomenon sometimes referred to as security drift).

<img src="/assets/img/oscal-components.png" alt="oscal components" width="800"/>

### Why is OSCAL needed?

OSCAL is designed to tackle these complicated challenges, to include the following issues:

- Traceability from selection of security controls, to implementation of these controls, to their assessment is largely manual and proprietary producing widely varying unstructured artifacts
- Multi-tenant architectures and mixed ownership of system components complicates assessment processes
- Security control and system information is represented in different and proprietary ways
- Profile mappings to catalogs are often imprecise, not machine-readable
- A single system may be subject to multiple regulatory frameworks resulting in re-work and inconsistency across agencies and organizations to perform manual cross-walks
- Systems with many components may require different profiles per component
- Lack of a common language for software and service providers to express implementation guidance against security controls results in an unnecessary duplication of effort to Certify and Accredit (C&A) systems
- System owners and Authorizing Officials (AOs) must review non-standard and inconsistent implementation and assessment results resulting in the need for large numbers of highly skilled professionals to manually review and certify documentation
- Information Systems cannot easily or consistently attest to how security controls have been implemented
- Assessments and their results are produced and evaluated using inconsistent, incomplete, and unstructured means resulting in largely manual, non-repeatable processes

## What is OSCAL?

NIST's Open Security Controls Assessment Language (OSCAL) serves as a "Standard of Standards" normalizing how system security controls and corresponding assessment information is represented:

- *Standardized*: Provides security control, control implementation, and assessment information in an open, standardized way that can be used by both humans and machines

- *Interoperable*: Ensures OSCAL is well-defined so tools using OSCAL information are interoperable and use information consistently

- *Easy to Use*: Promotes developer adoption of OSCAL so tools are available for organizations to build, customize, and use OSCAL information

## What are the goals addressed by OSCAL?

- Improve the efficiency, accuracy, and consistency of system security assessments
- Drive a large decrease in assessment-related labor
- Share system information across communities decreasing assessment and authorization time
- Normalize the representation of security control catalogs, regulatory frameworks, and system information using a machine-readable language
- Ensure lossless transformation between machine- and human-readable content 
- Assess a system's security state more often, ideally continuously, driving continuous assurance
- Assess a system's compliance state against several sets of requirements simultaneously and ensure traceability between the requirements
- Consistent performance of assessments, regardless of system type
- Drive a large decrease in the paperwork burden for both information security professionals and vendors

## The OSCAL approach

OSCAL is being developed leveraging an incremental and agile approach. Through a series of development sprints, increased value is provided with a focus on an 80% solution (Minimally Viable Product (MVP)) that can be implemented in 20% of the time. OSCAL is a community-driven, NIST-led project, with an open invition to the community to participate in the framing and development of OSCAL. User stories can be created and submitted directly into GitHub per the requirements defined in the OSCAL CONTRIBUTING.MD. To learn more, [contact us](contact).
<!-- Include link to CONTRIBUTING.MD -->

### OSCAL Guiding Principles

1. Produce a set of extensible formats through a community-focused effort that supports a broad range of control-based risk management processes.
1. Support control-based risk assessment based on data collected using a continuous monitoring capability.
1. Ensure security controls, implementation, and verification processes have full traceability and inherit at the baseline (software and service provider) and system interconnection levels
1. Standardize the expression of artifacts driving crowd-sourced development and improvement across profile and implementation layers
1. Support multiple, interoperable, and lossless machine-readable formats including XML and JSON; improve the Machine Experience (MX)
1. Provide a common means to identify and version shared resources
1. Align OSCAL models with current, practical information, and support advanced structures that provide for greater automation and verification. This principle provides a path for early adoption and ongoing evolution around how OSCAL will be used.

## Development Timeline

### Development Epics

- Milestone 1: Catalog and Profile
- Milestone 2: Implementation
- Milestone 3: Assessment and Assessment Results
- Milestone 4: Publish an OSCAL 1.0 Specification

## Phases

Phase | Milestone | Status | Description
:---|:---|:--- |:---
0 | M1 | Done | Prototype catalog
1 | M1 | Done | Stabilize catalog; Prototype profile
2 | M1 / M2 | Done | Stabilize profile format; Prototype implementation
3 | M2 / M3 | In progress | Stabilize implementation; Start design of framework, assessment, and assessment results
4 | M3 | Planned | Prototype and stabilize framework, assessment, and assessment results
5 | M4 | Planned | Complete OSCAL 1.0
