# Roadmap

## The problem solved by OSCAL

### Why is OSCAL needed?

- Traceability from selection of security controls to implementation to assessment is largely manual and proprietary producing widely varying unstructured artifacts
- Multi-tenant and mixed ownership of system components complicates assessment
- Security control and system information is represented in proprietary ways
- Profile mappings to catalogs are often imprecise, not machine-readable
- A single system may be subject to several regulatory frameworks
- Lack of a common language for software and service providers to express implementation guidance against security controls resulting in an unnecessary duplication of effort to implement and verify the same
- System owners and authorizing officials manually adjudicate implementation and assessment results resulting in highly skilled professionals devoting a large percentage of human labor to solve this problem
- Information Systems can't easily share how the controls have been implemented
- Assessments and Assessment Results are produced and evaluated using inconsistent, incomplete, and unstructured means resulting in largely manual, non-repeatable methods


## What is OSCAL?

NIST's Open Security Controls Assessment Language (OSCAL) serves as a new "Standard of Standards" normalizing how system security controls and corresponding assessment information are represented:

- *Standardized*: Provide security control, control implementaiton, and assessment information in an open, standardized way that can be used by both humans and machines

- *Interoperable*: Ensure OSCAL is well-defined so tools using OSCAL information are interoperable and use information consistently

- *Easy to Use*: Promote developer adoption of OSCAL so tools are available for organizations to build, customize, and use OSCAL information

## What are the goals addressed by OSCAL?


{derive goals from problem statements above}
- Improve the efficiency, accuracy, and consistency of system security assessments
- System information can be shared across communities decreasing assessment and authorization time

## The OSCAL approach

- Systems with many components require different profiles per component

### Guiding Principles

1. Produce a set of extensible formats through a community-focused effort that supports a broad range of control-based risk management processes.
1. Support control-based risk assessment based on data collected using a continuous monitoring capability.
1. Ensure security controls, implementation and verification process have full traceability and inherit at the baseline-, software and service provider-, and system interconnection levels
1. Standardize the expression of artifacts driving crowd sourced development and improvement across profile and implementation layers
1. Support multiple, interoperable, and lossless machine-readable formats including XML and JSON 
1. Provide a common means to identify and version shared resources
1. OSCAL models will align with current, practical information use, while supporting advanced structures that provide for greater automation and verification. This will provide a path for early adoption and ongoing evolution around how OSCAL is used.

## Development timeline

### Development Epochs

- Milestone 1: Catalog and Profile (2018 Q2)
- Milestone 2: Implementation (2018 Q3)
- Milestone 3: Assessment and Assessment Results (2018 Q4)
- Milestone 4: Publish an OSCAL 1.0 Specification (2019 Q1)

## Phases

| Phase | Milestone | Status | Description |
|:---|:---|:---|
| 0 | M1 | Done | Prototype catalog |
| 1 | M1 | Done | Stabilize catalog; Prototype Profile |
| 2 | M1 / M2 | Near Done | Stabilize Profile format; Prototype implementation |
| 3 | M2 / M3 | Planned 2018 | Stabilize Implementation; Prototype famework, assessment, and assessment results |
| 4 | M3 | Planed Early 2019 | Complete OSCAL 1.0 |
