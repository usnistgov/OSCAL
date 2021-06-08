---
title: Use Cases
description: OSCAL supports a number of use cases.
weight: 70
toc:
  enabled: true
aliases:
  - /learnmore/scenarios/
  - /learnmore/casestudies/
  - /learnmore/case-studies/
  - /learnmore/use-cases/
---

OSCAL supports a number of use cases, some of which are described below.

## Managing Multiple Regulatory Frameworks

The work being performed by the OSCAL development team to document catalogs that then map to multiple regulatory frameworks will simplify the risk management burden to maintain multiple security plans or to maintain the mapping to multiple regulator frameworks within a single security plan.

As an example, a federal agency may need to meet the requirements of the Federal Information Security Modernization Act (FISMA) and follow the NIST Risk Management Framework guidance. If the agency also maintains health records and must comply with the Health Insurance Portability and Accountability Act (HIPAA) and meet the security and privacy requirements. Moreover, if the agency provides healthcare services where payments are collected, then those transactions must comply with the Payment Card Industry Data Security Standard (PCI DSS). The security controls and requirements associated with these three separate frameworks increase the complexity of implementing, assessing and operating such systems, which can result in increased costs for the agency to maintain the security documentation of systems operating within its portfolio.

The scenario for the sample federal agency highlights the need to simplify the complexity for agencies required to meet multiple regulatory frameworks, while conducting proper risk management practices. The OSCAL project is considering this scenario as we are developing the OSCAL models. The foundational elements of the OSCAL control, catalog, and profile models permit selection of security controls from multiple catalogs and the creation of a single profile that an agency may use to manage risks and maintain the system’s security posture as required by the three regulatory frameworks. OSCAL abstracts away the complexity of managing multiple frameworks, allowing cyber security professionals to focus on managing security and privacy risks while maintaining the security posture of their systems.

The project will continue to expand support for additional security catalogs over time to maximize the utility of the OSCAL.

## Machine-Readable System Security Plans (SSPs)

To meet the requirements of different regulatory frameworks and to perform good risk management, cyber security professionals often need to document a system’s implementation and to continuously assess the effectiveness of the implemented security and privacy controls in order to authorize its use during the entire system’s life cycle. This effort is resource intensive; especially in scenarios where multiple regulatory frameworks and control catalogs apply to the system and its control implementation. In addition, control implementation documentation is not standardized, varies widely between agencies, and is stored in a collection of Word documents, Excel files, and other formats that are difficult to manage as cyber security risks and control implementations change over time.

OSCAL is designed to provide a standardized format that reduces or eliminates this paper-based process, by transitioning documentation to a highly normalized, machine-readable format. This approach has multiple benefits:

1. Data between plans is consistent in both format and mapping to requirements and controls from multiple regulatory frameworks, when applicable,
1. Data is machine-readable and can be exposed to other security tools to provide additional automation, and
1. Data consistency and standardization support innovation in commercial and open-source tooling to provide further automation of assessment and accreditation processes.

By representing system information using the OSCAL [system security plan model](/concepts/layer/implementation/ssp/), this data can be analyzed using automated processes, streamlining the review and assessment process. The management systems that are used to manage the security and privacy controls implemented in the system can be integrated to provide up-to-date system information using this model. Human-oriented documentation can be easily generated from the OSCAL data. This results in a more usable information set over what is provided using Word and Excel files alone.

The OSCAL team continues to enhance the OSCAL formats and to test these formats against real data.  The OSCAL formats are being continuously improved and enhanced as they are tested and issues are identified.  The end result will be a robust set of [standardized formats](/concepts/layer/implementation/) that greatly simplify the way security plans are created, and managed; and how technical security controls are implemented and assessed for a system.

### General Services Administration (GSA) Federal Risk and Authorization Management Program (FedRAMP)

An example of how OSCAL can be used to document a system's implementation is the General Services Administration (GSA) Federal Risk and Authorization Management Program (FedRAMP). NIST and FedRAMP have been working together to ensure that OSCAL meets FedRAMP's needs.

According to [FedRAMP](https://www.fedramp.gov/FedRAMP-moves-to-automate-the-authorization-process/), OSCAL will offer a number of benefits to streamlining and automating components of the authorization process:

> - **Cloud Service Providers (CSPs)** will be able to create their System Security Plans (SSPs) more rapidly and accurately, validating much of their content before submission to the government for review.
> - **Third Party Assessment Organizations (3PAOs)** will be able to automate the planning, execution, and reporting of cloud assessment activities.
> - **Agencies** will be able to expedite their reviews of the FedRAMP security authorization packages.
> - **The FedRAMP Program Management Office (PMO)** expects to be able to build tooling to further reduce the cost and improve the quality of security reviews.

FedRAMP is [organizing automation resources on GitHub](https://github.com/GSA/fedramp-automation) to support OSCAL use.

## Self-Describing Software and Containers

Another model provided by the OSCAL [implementation layer](/concepts/layer/implementation/) is the [component definition model](/concepts/layer/implementation/component-definition/). This model allows for the control implementation of a software application, virtual machine, or container to be documented and shared by consumers of that resource. This allows the documentation of the controls supported by the application, virtual machine, or container to be bundled and distributed along with the software. System architects and security and privacy managers can use this information as a starting point for documenting the control implementation of a system that uses these applications, virtual machines, or containers.

## Self-Describing Policies, Processes, and Procedures

Similar to the previous use case, the [component definition model](/concepts/layer/implementation/component-definition/) can also be used to describe the set of controls that are addressed by a given policy, process, or procedure. This allows authors of these artifacts to define how a given policy, process, or procedure implements security or privacy controls in a way that can be shared along with the artifact. This implementation information can be used System architects and security and privacy managers as a starting point for documenting the control implementation of a system that uses these policies, processes, or procedures.
