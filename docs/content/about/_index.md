---
title: More about OSCAL
heading: Learn more about OSCAL
menu:
  primary:
    name: About
    weight: 10
toc:
  enabled: true
aliases:
  - /learnmore/
  - /learnmore/challenges/
  - /about/challenges/
  - /learnmore/goals/
  - /about/goals/
---

## Our Vision

NIST and the community will maintain a set of OSCAL models for organizations and service providers to facilitate seamless, continuous security assessment by exchanging information about system implementation and analysis without vendor lock-in. ​

Community engagement and collaboration will mature OSCAL models faster and drive the broadest international adoption possible in public and private sectors.

## What is OSCAL?

NIST is developing the Open Security Controls Assessment Language (OSCAL) as a standardized, data-centric framework that can be applied to an information system for documenting and assessing its security controls. Today, security controls and control baselines are represented in proprietary formats, requiring data conversion and manual effort to describe their implementation. An important goal of OSCAL is to move the security controls and control baselines from a text-based and manual approach (using word processors or spreadsheets) to a set of standardized and machine-readable formats. With systems security information represented in OSCAL, security professionals will be able to automate security assessment, auditing, and continuous monitoring processes.

<!-- markdownlint-disable MD026 -->
## Why OSCAL?
<!-- markdownlint-enable MD026 -->

There are a number of complicating factors contributing to the challenges faced by information system security professionals today.

* Multiple regulatory standards and frameworks, which change over time;
* Regulatory standards and frameworks overlap in scope and can often conflict or be difficult to manage together; and
* Information systems are increasing in size and complexity.

To address information security and privacy risks, the implementation of selected controls needs to be verified and shown to be effective. To provide assurance of a system's security and privacy posture, the control implementation of a system must be both correctly described, assessed, and authorized. These tasks are resource-intensive, and often challenging to perform within budget constraints given the complexity of the problem.

The standardized formats provided by the OSCAL project help to streamline and standardize the processes of documenting, implementing and assessing security controls. The automation enabled by the OSCAL formats will reduce complexity, decrease implementation costs, and enable the simultaneous, continuous assessment of a system's security against multiple sets of requirements. Additionally, paperwork will be significantly reduced.

## Challenges Addressed

OSCAL addresses a number of challenges around security controls and security control assessment.

### Control Information Lacks Standardization

The core challenge, and one of the primary reasons for creating OSCAL, is that concepts like security controls and profiles are represented today largely in proprietary ways. In many cases they are written in prose documents that are imprecise, lead to differences in interpretation, and are not machine-readable; meaning that the prose instructions require someone to manually implement the control in information systems in order for the tool to use the information.

### Assessing Control Implementations Across Multiple Components

Organizations are also struggling with information systems that have many different components. Some components require the use of different profiles per component; this is commonly the case with cloud environments. Also, systems can be multi-tenant or have mixed ownership of components (often referred to as shared responsibility). Information system owners need to be able to assess the security of these systems against their specific requirements and to simultaneously provide these views to their stakeholders.

### Supporting Multiple Regulatory Frameworks Simultaneously

In addition, there are situations where a single system needs to support multiple regulatory frameworks. For example, the U.S. Department of Veterans Affairs is a federal agency operating with multiple sets of regulatory frameworks together: the Federal Information Security Modernization Act (FISMA); the NIST Cybersecurity Risk Management Framework; requirements relating to the Health Insurance Portability and Accountability Act (HIPAA); and others relating to secure credit card transactions based on the Payment Card Industry Data Security Standard (PCI DSS). This situation can be complicated.

### Documentation Reviews and Control Assessments are Largely Manual Processes

Because the definition and assessment of all these security controls is so complex, it is largely a manual process today. The OSCAL project seeks to change this situation by offering standardized representations for controls and their implementation in a system, which can be used by both humans and machines for development, analysis, and reporting. We need formats that can be generated by machines for communicating with other machines, but can also be easily reformatted so humans can read the information. By standardizing the representation of this information with a well-defined specification, OSCAL information is interoperable. The goal is to keep OSCAL as simple as possible while enabling extensive automation in vendor tools.

## Project Goals

The OSCAL project is working to address the following goals.

### Decrease Paperwork

Drive a large decrease in the paperwork burden for both information security professionals and vendors.

- Normalize the representation of security control catalogs, regulatory frameworks, and system information using precise, machine-readable formats.
- Allow the sharing of control implementation information across communities.

### Improve System Security Assessments

Improve the efficiency, timeliness, accuracy, and consistency of system security assessments.

- Assess a system's security control implementation against several sets of requirements simultaneously and ensure traceability between the requirements.
- Enable assessments to be performed consistently, regardless of system type.

### Enable Continuous Assessment

Allow a system's security state to be assessed more often, ideally continuously, driving continuous assurance.

- Drive a large decrease in assessment-related labor, decreasing assessment and authorization time.
- Support the assessment of control implementation effectiveness based on data collected using a continuous monitoring capability.

## Design Principles

To address these goals, the OSCAL project is guided by the following design principles.

### Interoperable Data Formats

Produce a set of interoperable, extensible, machine-readable formats through a community-focused effort that supports a broad range of control-based risk management processes.

- Provide XML-, JSON-, and YAML-based formats that allow for lossless translations between XML, JSON, and YAML representations.
- Provide a common means to identify and version shared resources.
- Standardize the expression of assessment artifacts, driving crowd-sourced development and improvement across profile and implementation layers.

### Be Relevant Now, Enable a Better Future

Align OSCAL models with current, practical information, and support advanced structures that provide for greater automation and verification.

- Ensure security controls, implementation, and assessment processes have full traceability to the selected control baseline and across system boundaries for interconnected systems and common control providers.
- Provide a path for early adoption and ongoing evolution around how OSCAL will be used.