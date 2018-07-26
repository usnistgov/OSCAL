# NIST Open Security Controls Assessment Language (OSCAL) Roadmap

## The problem solved by OSCAL
With the advent of cloud and the Internet of Things (IoT), Information Technology complexity is increasing proportionally with its' associated security vulnerabilities. IT security professionals must ensure their systems comply with regulatory control catalogs and frameworks such as NIST Special Publication (SP) 800-53, NIST Cybersecurity Framework, ISO/IEC 27001 and 27002, COBIT, PCI DSS, HIPAA, etc., which provide catalogs of security controls and policies and/or security frameworks that, in some cases, can be mutually exclusive. Furthermore, security experts often have to address security controls from multiple control catalogs or comply to multiple security frameworks. A large percentage of system security planning, auditing and assessing is done using spreadsheets and documents, driving paper-based compliance. Such approach is not even labor intensive, but also generates information that is out-of-date shortly after it is documented, often leaving critical risks undiscovered or unaddressed.

### Why is OSCAL needed?
OSCAL serves to address these issues:
- Traceability from selection of security controls to implementation of these controls and to their assessment is largely manual and proprietary producing widely varying unstructured artifacts
- Multi-tenant and mixed ownership of system components complicates assessment
- Security control and system information is represented in proprietary ways
- Profile mappings to catalogs are often imprecise, not machine-readable
- A single system may be subject to several regulatory frameworks
- Systems with many components may require different profiles per component
- Lack of a common language for software and service providers to express implementation guidance against security controls resulting in an unnecessary duplication of effort to implement and verify the same
- System owners and authorizing officials manually adjudicate implementation and assessment results resulting in highly skilled professionals devoting a large percentage of human labor to solve this problem
- Information Systems can't easily share how security controls have been implemented
- Assessments and Assessment Results are produced and evaluated using inconsistent, incomplete, and unstructured means resulting in largely manual, non-repeatable methods

## What is OSCAL?

NIST's Open Security Controls Assessment Language (OSCAL) serves as a "Standard of Standards" normalizing how system security controls and corresponding assessment information are represented:

- *Standardized*: Provide security control, control implementation, and assessment information in an open, standardized way that can be used by both humans and machines

- *Interoperable*: Ensure OSCAL is well-defined so tools using OSCAL information are interoperable and use information consistently

- *Easy to Use*: Promote developer adoption of OSCAL so tools are available for organizations to build, customize, and use OSCAL information

## What are the goals addressed by OSCAL?

- Improve the efficiency, accuracy, and consistency of system security assessments
- Drive a large decrease in assessment-related labor
- Share system information across communities decreasing assessment and authorization time
- Normalize the representation of security control catalogs, regulatory frameworks and system information using a machine-readable language
- Ensure lossless transformation between machine- and human-readable content 
- Assess a system's security state much more often, ideally continuously, driving continuous assurance (CA)
- Assess a system's compliance state against several sets of requirements simultaneously and ensure traceability to the same
- Consistent performance of assessments, regardless of system type

## The OSCAL approach
OSCAL is being developed leveraging an incremental, agile approach. Through a series of development sprints, increased value is provided with a focus on 80% of the solution that can be implemented in 20% of the time. OSCAL is a community-driven, NIST-led project, with an opened invition to the community to participate in the framing and development of this new standard of standards. User stories can be created and submitted directly into GitHub per the requirements defined in the OSCAL CONTRIBUTING.MD.  

### OSCAL Guiding Principles

1. Produce a set of extensible formats through a community-focused effort that supports a broad range of control-based risk management processes.
1. Support control-based risk assessment based on data collected using a continuous monitoring capability.
1. Ensure security controls, implementation and verification process have full traceability and inherit at the baseline-, software and service provider-, and system interconnection levels
1. Standardize the expression of artifacts driving crowd sourced development and improvement across profile and implementation layers
1. Support multiple, interoperable, and lossless machine-readable formats including XML and JSON 
1. Provide a common means to identify and version shared resources
1. Align OSCAL models with current, practical information used, and support advanced structures that provide for greater automation and verification. This princile provides a path for early adoption and ongoing evolution around how OSCAL is used.

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
2 | M1 / M2 | Near Done (2018 Q3) | Stabilize profile format; Prototype implementation
3 | M2 / M3 | Planned (2018 Q4) | Stabilize implementation; Start design of framework, assessment, and assessment results
4 | M3 | Planned (2019 Q1) | Prototype and stabilize framework, assessment, and assessment results
5 | M4 | Planned (2019 Q2) | Complete OSCAL 1.0
