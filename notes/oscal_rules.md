# Rules

This document represents early thoughts on how to support automated testing in OSCAL. This is a discussion draft to drive community conversation and consensus towards an overall design.

## References

[GitHub issue](https://github.com/usnistgov/OSCAL/issues/1058)

## Terminology / Definitions

**NOTE**: In the sections below, when a term is used in unqualified form (e.g. "audit", "evaluation"), we intend the dictionary meaning of that word in a paricular context. When using a qualified term (e.g. "3rd party audit", "system evaluation"), we are referring in that context to the definition below.

- **3rd-Party Audit**: independent review and examination of records and activities to assess the adequacy of system controls, to ensure compliance with established policies and operational procedures. In the context of this document, audit is not equivalent to assessment. [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/audit).

- **System Assessment**: The testing and/or evaluation of the management, operational, and technical security controls in an information system to determine the extent to which the controls are implemented correctly, operating as intended, and producing the desired outcome with respect to meeting the security requirements for the system. [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/assessment).

    From an OSCAL perspective, testing and evaluation can happen at multiple stages of the DevSecOps workflow.
    
    1. During developent as part of a continuous integration (CI) process.
    2. As part of a pre-production/release worflow which may be supported by a continuous deployment (CD) process.
    3. As part of an internal or 3rd-party system assessment supporting initial system authorization. This is what is referred to as "Assessment" from the federal risk management perspective, such as what is defined in [SP 800-37 revision 2](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-37r2.pdf) [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/assessment)
    4. As part of a continuous monitoring program supporting continuous assessment.
    
    OSCAL assessment plans and assessment results are intended to support all testing and evaluation use cases that involve an information system that is planned, under development, or in an operational state. The information about such a system is documented in an OSCAL system security plan.
    
    There is some interest by the OSCAL community to also support testing and evaluation of assets defined by a component in an OSCAL component definition. This might be part of the development of such an asset or as part of acquiring such an asset. OSCAL assessment plans and assessment results do not currently support such a notion.
    
    To avoid confusion around the use of the term "assessment", OSCAL uses the term "System Evaluation" and "System Testing" for activities that typically comprise assessment, but can be used in other non-assessment contexts.
    
- **System Evaluation**: the act of measuring technical and operational effectiveness or suitability characteristics to inform an assessment. Evaluation criteria are a benchmark, standard, or factor against which conformance, performance, and suitability of a technical capability, activity, product, or plan is measured. Security practicioners will colloquially refer to "validating results from security tests." In OSCAL documentation and practice, this is evaluation, not validation.
    
- **System Testing**: a type of method of collecting and analyzing data related to one or more assessment objects (e.g. executing a SCAP-validated tool with a operating system baseline to verify hardened configuration, this is a security test).


- **Independent Validation**: confirmation (through the provision of strong, sound, objective evidence) that requirements for a specific intended use or application have been fulfilled by an independent laboratory through rigorous, systematic analysis, such as the NIST Cryptographic Module Validation Program (CMVP) and Security Content Automation Protocol (SCAP) Validation Program. Independent Validation is not equivalent to System Evaluation. 

- **OSCAL Rule**: A concrete implementation goal or objective, which typically relates to privacy or security. [\[NISTIR 7275 Rev. 4\]](https://csrc.nist.gov/glossary/term/rule)
- **OSCAL Test**: A method to analyze the state of the system to determine that all or some part of an OSCAL Rule has been met. An OSCAL Test can be automated, partially automated, or manual. [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/test)
- **System Asset:** A uniquely identifiable building block of an information system. [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/asset_identification)

OSCAL represents System Assets in the following ways:

1. **OSCAL Component:** A software, hardware, service, process, procedure that is the target of a component in an OSCAL component definition or an SSP. An OSCAL Component can be supplied by a 3rd-party or the organization hosting an information system. OSCAL components are assets but not all assets are OSCAL components.
2. **OSCAL Party:** A person or organization identified within the metadata of an OSCAL document.
3. **OSCAL Location:** A physical place identified within the metadata of an OSCAL document.

*We may want to add these to the OSCAL [key concepts and terms](https://pages.nist.gov/OSCAL/concepts/terminology/).*

## DevOps Workflow

The following is from the GSA Tech Guide: [*Understanding the Differences Between Agile & DevSecOps - from a Business Perspective*](https://tech.gsa.gov/guides/understanding_differences_agile_devsecops/).

![DevSecOps Workflow](https://tech.gsa.gov/assets/img/guides/DevSecOps.png)

![DevSecops Lifecycle](https://dl.dod.cyber.mil/wp-content/uploads/devsecops/img/DevSecOps-Software-Lifecycle.png)


Cycle for updated diagram:
- Dev
    - Adapt (Categorize)
    - Plan (Select)
    - Develop
    - Build
    - Test - cycles with develop
    - Release
- Ops
    - Release
    - Authorize
    - Deploy
    - Operate
    - Monitor - cycles with deploy
    - Adapt
- Security is the outer perimeter
    - RMF
        - Prepare (overlap with adapt and plan)
        - Categorize (overlap with plan)
        - Select (overlap with plan)
        - Implement (overlap with develop, build, test, and release)
        - Assess (overlap with Authorize)
        - Authorize (overlap with Authorize and deploy)
        - Monitor (overlap with operate, monitor, adapt)

Development:
- Adapt (Categorize)
- Plan (Select)
- Create (Implement)
- Test/Verify (Assess)
- Pre-production (Authorize)
- Release (Authorize)
- Analyze and Monitor (Monitor)

Operations:
- Release (Post-Authorzation)
- Configure (Implement and Authorize)
- Detect (Monitor)
- Respond (Monitor)
- Predict (Implement and Monitor)
- Adapt (Implement)
- Analyze and Monitor (Monitor)

### Ideal Diagram 

We need a figure 8 diagram similar to the above with the following steps. "Development" will be on the left. "Operations" will be on the right. "Security" surrounds the figure 8.

- The "release" step is the transition from "development" to "operations".
- The "adapt" step is the transition from "operations" to "development".
- "development" is provider-focused relative to a system asset, meaning it can be done by both 1) external providers delivering a product to be consumed, or 2) internal teams delivering an aspect of the system.
- "operations" is consumer-focused relative to a system asset, meaning it is consuming from "development".
- There is an artificial seperation between "development" and "operations" in this workflow. These aspects can be performed by the same person or by multiple people depending on the organization applying this workflow.

Development: (provider-focused)
- Adapt (Categorize System)
- Plan (Select Controls)
- Develop (Implement Controls)
- Test/Verify (Assess Controls) -> loop back to plan
- Release (Authorize by provider)

Operations: (consumer-focused)
- Release
- Deliver (Implement Controls and Assess Controls)
- Deploy (Authorize System)
- Operate (Monitor Controls)
- Adapt

## Actors

The following actors, with their wants and needs, are identified in the context of [the notional DevSecOps workflow](#devops-workflow). This approach was chosen to ensure that OSCAL support for rule-based evaluation supports a DevSecOps workflow.

### Component Supplier

**Who:** vendor, open-source project, cloud service provider, policy maintainer
**Role:** Provides an OSCAL component for an asset (i.e. hardware, software, service, policy, proceedure) which may be instantiated within an information system to provide functions needed by the system.

- *Release:* wants to suggest a set of rules and/or tests which can be used by consumers to evaluate the asset target of the component (i.e., software, hardware, service, process, procedure, independent validation record). May want to associate rules with security or privacy controls.

**OSCAL Interactions:**

- Component Definition:
    - Define components for the asset(s) *they* supply.
    - Define rules for the asset(s) *they* supply.
    - Define tests that *can* be used for evaluating the asset(s) *they* supply.
    - Associate a component *they* supply with one or more rules or tests *they* supply.
    - Associate a control implementation for a component *they* supply with one or more rules or tests *they* supply.

### Evaluation Solution Supplier

**Who:** security evaluation tool supplier (e.g., vulnerability scanner, configuration management tool), evaluation content suppliers (e.g., ComplianceAsCode, Chef InSpec), checklist/benchmark authors (e.g., CIS guides, STIGs)
**Role:** Provides an OSCAL component that identifies methods for evaluating the implementation of an OSCAL component that they do not maintain.

- *Release*: wants to suggest a set of rules and/or tests which can be used by consumers to evaluate the target of the component (i.e., software, hardware, service, process, procedure). May want to associate rules with security or privacy controls.

**OSCAL Interactions:**

- Component Definition:
    - Define rules for asset(s) *others* supply.
    - Define tests that *can* be used for evaluating the asset(s) *others* supply.
    - Associate a *3rd-party* component with one or more rules or tests *they* supply.
    - Associate a control implementation for a *3rd-party* component with one or more rules or tests *they* supply.

### System Engineer (dev)

**Who:** cloud service provider staff, organization staff, and/or organization's contractors that design, implement and deploy information systems for the organization
**Role:** Writes aspects of an OSCAL system security plan to document their work through implementation and maintenance phases. May use components to describe granular aspects of the system implementation. May consume components from OSCAL component definitions to use as building blocks for their information system.

- *Plan:* wants to document how they validate their work as they implement a system, show proof of their approach
- *Create/Release/Configure:* they want to do this as they draft a system security plan, choosing whether or not to use components from a component provider
- *Verify:* they want to leverage the structured data directly or indirectly through custom software to run rules (and their steps) that are largely or fully automatable
- *Monitor and Analyze (pre-assessment):* they want to understand the rules and technical checks (what they focus on) can be mapped and communicated for risk oversight which are focused on higher-level controls not linked to their day-to-day work
- *Monitor and Analyze (assessment):* respond to data calls from assessor or ISSO for more detail or updated information
- *Monitor and Analyze (post-assessment):* wants to know how to show updates fix the POA&Ms and communicate info to system owner, keep them happy

**OSCAL Interactions:**

- Component Definition:
    - Import a component from a component definition to instatiate in the SSP.
    - Select rules and tests associated with a component from a component definition to use for evaluating the instatiated component in the SSP.

- System security plan:
    - Define rules and tests for which may be used in evaluating components in the SSP. This allows different/additional rules and tests to be defined in the SSP as compared to what might have been imported from a component definition.

- Assessment plan:

    The following activity can be used in a DevOps approach or can be part of a traditional workflow where the developer is establishing rules and tests to use for continuous monitoring.

    - Select rules and tests from the SSP which will be used in evaluating components of the information system.

    The following activities assume that a DevOps approach is applied to integrating evaluation into the continuous integration (CI) and/or continuous deployment (CD) processes.

    - Define additional rules and tests which may be used in evaluating components of the information system.
    - Identify which rules and tests will be evaluated against each component of the information system under specified conditions.
    - Conduct OSCAL assessment plan-based evaluations in continuous integration (CI) and/or continuous deployment (CD).

- Assessment results:

    - Receive feedback from the results of evaluating rules and tests. The engineer may confirm findings or help to identify false positives. This can happen in a CI/CD scenario or be based on the result of a system evaluation that is part of an assessment or continous monitoring.

- Plan of actions & milestones:

    - Interpret confirmed findings from AR and act upon them. The engineer may design and implement a fix and document the remediation, or the developer will work the risk owner for project to accept, mitigate, or transfer the risk for the POA&M finding. 

### System Operator (ops)

**Who:** organization staff and/or contractors that operate and maintain information systems for the organization
**Role:** Maintaining the system to conform with capabilities and requirements in the OSCAL SSP and other artifacts in the authorization package, manage monitoring program and resulting data in OSCAL SAR findings and OSCAL POA&Ms

- *Detect:* they want to leverage the structured data directly or indirectly through custom software to run rules (and their steps) that are largely or fully automatable
- *Monitor and Analyze (continous monitoring):* during continous monitoring, show ongoing compliance with security capabilities documented in SSP components, after the assessment, with periodic or realtime automation
- *Monitor and Analyze (pre-assessment):* they want to understand which rules and technical checks (what they focus on) can be mapped and communicated for risk oversight which are focused on higher-level controls not linked to their day-to-day work
- *Monitor and Analyze (assessment):* respond to data calls from assessor or ISSO for more detail or updated information based on findings in the OSCAL assessment results
- *Monitor and Analyze (post-assessment):* wants to know how to show updates fix the OSCAL POA&Ms and communicate info to system owner, keep them happy

**OSCAL Interactions:**

- Component Definition:
- System security plan:
- Assessment plan:
    - Identify which rules and tests will be evaluated against each component of the information system under specified conditions.
- Assessment results:
- Plan of actions & milestones:

### System Owner

**Who:** CIO (or designate)
**Role:** The organization staff who has final responsibility and authority over the information system, its business function, and supporting staff. [\[CSRC Glossary\]](https://csrc.nist.gov/glossary/term/system_owner)

- *Analyze and Monitor (pre-assessment):* sponsor a system for authorization, endorsing when a system is fit for purpose and ready to be assessed and authorized for production operations.
- *Analyze and Monitor (pre-assessment/continuous monitoring):* needs a way to detail the scope and allowances of an assessment.
- *Analyze and Monitor (post-assessment):* needs a way to confirm the findings of an assessor.
- *Analyze and Monitor (post-assessment):* needs a way to confirm that a POA&M has been addressed and can be closed.

**OSCAL Interactions:**

- Component Definition:
- System security plan:
- Assessment plan:
    - Identify which rules and tests will be evaluated against each component of the information system under specified conditions.
- Assessment results:
- Plan of actions & milestones:

### Assessor

**Who:** organization internal auditor, 3rd party auditor contracted by organization
**Role:**

- *Analyze and Monitor (pre-assessment):* wants to define the set of methods for evaluating the state of a component of an information system they plan to assess.
- *Analyze and Monitor (pre-assessment):* wants to provide results of evaluating a set of methods related to a component of an information system they are assessing.
    - Need to include raw data as evidence.
    - Need to include details about how the evaluation was analyzied to identify a finding.

**OSCAL Interactions:**

- Component Definition:
- System security plan:
- Assessment plan:
    - Select rules and tests from the SSP which will be used in evaluating components of the information system.
    - Define additional rules and tests which may be used in evaluating components of the information system.
    - Identify which rules and tests will be evaluated against each component of the information system under specified conditions.
- Assessment results:
- Plan of actions & milestones:

### System-related architects

There a wide variety of individual roles focused on architecture from an enterprise and/or system-level, who focus in a variety of topical areas, including: security, privacy, cloud, etc. This role is grouping all of these architect roles together to focus on the common aspects of how these roles interact with an information system and the automation around evaluation and testing.

**Who:** organization security architects, enterprise IT architects, engineering leadership, security engineering leads, security champions
**Role:** Maintaining structured architectural guidance and implementation standards across all information systems in their organizational unit or a larger segment of the organization. Creating, documenting, and reviewing designs for aspects of the system security plan. Vetting 3rd party component definitions, refining their own guidance and implementation standards.

- *pre-assessment:* wants to review and validate design requirements for the design of information systems
- *pre-assessment:* wants to know the administrative and technical controls of their information system(s), and how they meet their agency's overall information security program

- *Plan:* wants to document how they validate their work as they implement a system, show proof of their approach
- *Create/Release/Configure:* they want to do this as they draft a system security plan, choosing whether or not to use components from a component provider
- *Verify:* they want to leverage the structured data directly or indirectly through custom software to run rules (and their steps) that are largely or fully automatable
- *Monitor and Analyze (pre-assessment):* they want to understand the rules and technical checks (what they focus on) can be mapped and communicated for risk oversight which are focused on higher-level controls not linked to their day-to-day work
- *Monitor and Analyze (assessment):* respond to data calls from assessor or ISSO for more detail or updated information
- *Monitor and Analyze (post-assessment):* wants to know how to show updates fix the POA&Ms and communicate info to system owner, keep them happy

**OSCAL Interactions:**

- Component Definition:
- System security plan:
- Assessment plan:
- Assessment results:
- Plan of actions & milestones:

## Conceptual Steps

### OSCAL Supports Assessments, That's Not Enough?

![A common high-level workflow](https://mermaid.ink/img/pako:eNp9kj1vgzAQQP_KyUOWplW7MkSK0o5VkFhZXHyAJWzTOzsoifLfayA0qaBhQnDv3edZFE6hSATjd0Bb4LuWFUmTW4jPzpnWWbQ-JXfQCul5s3nKjuzRfNhKW0RKgLBByQi7NEM66ALh7eUVigkdTSO07ywS9BKYW2J-9gwWO-Dh5z05BcJSBQpZV5YfYEuUNm2DJlY4gbwG5Yowfuq0r29NMKyAQoP8WD70l0BLyHde-A_aMiOziwSHL6MjkGUpSKsA-2nHbUDpCOQQZn5nOWF_FdLK5njCuWMBCr52pE_aVvuy1IWWza0EwtbRlGkeOGuWYh7sJm7IPKnS_Xb1Odv_8g31khEYFEUtbYXXAYq1MEhGahUP9dwLc-HruLtcJPFVYSlD43OR20sMDa2SHj-U9o5EUsqGcS1k8C472kIkngJOQddjv0ZdfgAWxRXr)

1. Component providers explain how their software and services meet security and compliance goals of a security program
2. Catalogs explain security and compliance goals of a security program, all its systems
3. A SSP and components explain the implementers' description of how they meet those
4. An assessment plan explains how an assessor performs individual tests of an info system for details of all these goals
5. An assessment result explains the result of these individuals tests

What's missing? There is concrete linkage between 1, 2, and 3 to prepare for an audit in 4 and 5 to determine system worthiness before an audit. 

TBD, insert concept diagram here about rules (#1058) begets rule results (#1059) and then we can formulate the Exchange API (#1060) given the previous two are complete.

## User Scenarios

**TODO: Add possible use cases around creating new rules in SSP. Is it prudent? AJ posits countering with equivalent rules in the SSP diverging from org/vendor component. Dave posits false positive resolution/analysis.**

### Cloud Service Provider, Component Producer with Automated Tests

1. As a cloud service provider that provides OSCAL components, in order to communicate different ways to configure Openshift/Kubernetes for different information security programs, I would like to map security test metadata about OpenSCAP checks into a component, and optionally link them to specific items in control implementations for said customers.
1. As a cloud service provider that provides OSCAL components, in order to communicate different ways to configure Openshift/Kubernetes for different information security programs, I would like to map security test metadata from my Compliance-as-Code and Infrastructure-as-Code pipelines into a component, and optionally link them to specific items in control implementations for applicable systems built and monitored by those pipelines.

### System Engineer & Automated Security Tools

As a system owner that maintains an OSCAL SSP for my information system, in order to communicate the specific way I configure Openshift/Kubernetes for different information security programs, I would like to map security test metadata about OpenSCAP checks into a components within my SSP, linking them to specific items in control implementations for said customers.

### Agency security officials setting agency standards (architect)

As the agency DevSecOps Lead for my Chief Information Security Officer, to best instruct system engineers developing and operation our agency's information systems, I would like to use OSCAL rules to map organizational requirements around the encryption of system communications (in the RMF 800-53r5 Secure Communications control family) to concrete automated tests of our HTTPS endpoints for implementing required algorithms and conformant TLS implementations.

### Division officials setting divsion standards (architect)

As the Information System Security Officer for all systems in my division, to best instruct system engineers developing and operating our information systems, I want to use OSCALs rules to map organizational securit requirements around configuration management to concreted automated tests for properly tagging systems and services with the correct division security tags in AWS.


## Defining and using rules and tests in the OSCAL models

The following are potential capabilities that can be integrated into OSCAL over time, with a rough priority order in which the OSCAL model development may occur.

### Catalog

- **Priority 3:** Define and suggest rules and test that can be used to test and evaluate contols.

### Profile

- **Priority 3:** Define and suggest rules and test that can be used to test and evaluate contols defined in a baseline.


### Component Definition

- **Priority 1:** Define and suggest rules and test that can be used to test and evaluate contols related to a component.

### System Security Plan

- **Priority 1:** Define and/or identify rules and test that are recommended for use in testing and evaluating the information system. Rules and tests can be sourced from components in component definitions used, from baseline profiles, or even a catalog if present.

### Assessment Plan

- **Priority 2:** Select rules and test that can be used to determine if assessment objectives are met. Using rules sourced directly from the assessor and/or using the rules defined in the component definitions and/or SSP from the system developer or operations engineer.

### Assessment Results

- **Priority 2:** Provide results from executing tests as evidence, and from evaluating evidence as findings. Identify the rules that have been satisified, and defeciencies in meeting rules that have not been completely satisfied.

### Plan of Action and Milestones

- **Priority 2:** Identify the rules and tests that can be executed and (re)evaluated to determine if the POA&M item has been addressed. This can be based on rule and test information from the assessment plan and assessment results, or can be used to communicate a new set of rules and/or tests that can be used in resolving the POA&M item.
