---
title: Use Cases
description: OSCAL supports a number of use cases.
weight: 70
aliases:
  - /learnmore/scenarios/
  - /learnmore/casestudies/
  - /learnmore/case-studies/
---

OSCAL supports a number of use cases, some of which are described below.

## Managing Multiple Regulatory Frameworks

The work being performed by the OSCAL development team to document catalogs that then map to multiple regulatory frameworks will simplify the risk management burden to maintain multiple security plans or to maintain the mapping to multiple regulator frameworks within a single security plan.

As an example, a federal agency may need to meet the requirements of the Federal Information Security Modernization Act (FISMA) and follow the NIST Risk Management Framework guidance. If the agency also maintains health records and must comply with the Health Insurance Portability and Accountability Act (HIPAA) and meet the security and privacy requirements. Moreover, if the agency provides healthcare services where payments are collected, then those transactions must comply with the Payment Card Industry Data Security Standard (PCI DSS). The security controls and requirements associated with thse three separate frameworks increase the complexity of implementing, assessing and operating such systems, which can result in increased costs for the agency to maintain the security documentation of systems operating within its portfolio.

The scenario for the sample federal agency highlights the need to simplify the complexity for agencies required to meet multiple regulatory frameworks, while conducting proper risk management practices. The OSCAL project is considering this scenario as we are developing the OSCAL models. The foundational elements of the OSCAL control, catalog, and profile models permit selection of security controls from multiple catalogs and the creation of a single profile that an agency may use to manage risks and maintain the system’s security posture as required by the three regulatory frameworks. OSCAL abstracts away the complexity of managing multiple frameworks, allowing cyber security professionals to focus on managing security and privacy risks while maintaining the security posture of their systems.

The project will continue to expand support for additional security catalogs over time to maximize the utility of the OSCAL.

## Machine-Readable System Security Plans (SSPs)

To meet the requirements of different regulatory frameworks and to perform good risk management, cyber security professionals often need to document a system’s implementation and to continuously assess the effectiveness of the implemented security and privacy controls in order to authorize its use during the entire system’s life cycle.  This effort is resource intensive; especially in scenarios where multiple regulatory frameworks and control catalogs apply to the system and its control implementation.  In addition, control implementation documentation is not standardized, varies widely between agencies, and is stored in a collection of Word documents, Excel files, and other formats that are difficult to manage as cyber security risks and control implementations change.

OSCAL is designed to provide a standardized format that reduces or eliminates this paper-based process, by transitioning documentation to a highly normalized, machine-readable format.  This approach has multiple benefits:

1. data between plans is consistent in both format and mapping to requirements and controls from multiple regulatory frameworks, when applicable,
1. data is machine readable and can be exposed to other security tools to provide additional automation, and
1. data consistency and standardization allows for innovation in the commercial tooling to provide further automation of assessment and accreditation processes.

The OSCAL team continues to enhance the OSCAL formats and to test these formats against real data.  The OSCAL formats are being continuously improved and enhanced as they are tested and issues are identified.  The end result will be a robust set of [standardized formats](/documentation/schema/implementation-layer/) that greatly simplify the way security plans are created, and managed; and how technical security controls are implemented and assessed for a system.

### General Services Administration (GSA) Federal Risk and Authorization Management Program (FedRAMP)

An example of how OSCAL can be used to document a system's implementation is the General Services Administration (GSA) Federal Risk and Authorization Management Program (FedRAMP). NIST and FedRAMP have been working together to ensure that OSCAL meets FedRAMP's needs.

According to [FedRAMP](https://www.fedramp.gov/FedRAMP-moves-to-automate-the-authorization-process/), OSCAL will offer a number of benefits to streamlining and automating components of the authorization process:

> - **Cloud Service Providers (CSPs)** will be able to create their System Security Plans (SSPs) more rapidly and accurately, validating much of their content before submission to the government for review.
> - **Third Party Assessment Organizations (3PAOs)** will be able to automate the planning, execution, and reporting of cloud assessment activities.
> - **Agencies** will be able to expedite their reviews of the FedRAMP security authorization packages.
> - **The FedRAMP Program Management Office (PMO)** expects to be able to build tooling to further reduce the cost and improve the quality of security reviews.

FedRAMP is [organizing automation resources on GitHub](https://github.com/GSA/fedramp-automation) to support OSCAL use.

#### In the News

<a href="https://gcn.com/articles/2018/06/14/fedramp-updates.aspx" data-proofer-ignore="yes">Government Computer News Story - FedRAMP Updates</a>

"FedRAMP officials want to make it easier for agencies to get cloud service providers [authorized]. The National Institute of Standards and Technology’s Open Security Controls Assessment Language, which speeds up the security controls assessment process through standardization and automation, will be available for testing by the end of [the 2019] fiscal year", Matt Goodrich said at the June 13th, 2018 Advanced Technology Academic Research Center (ATARC) Federal Cloud and Data Center Summit. He was FedRAMP Director at this time.

OSCAL enables automation of FedRAMP’s security control assessments, and tracking of associated risks.

“We think OSCAL will really help agencies transform the way that they are doing their work by making sure that they can use whatever tool that they want to use and automate whatever they can in the process to do their authorizations,” Goodrich said.

“Agencies can partner with vendors for authorizations so vendors don’t need to have a third-party assessor or independent auditor,” Goodrich said. It allows agencies to "bring in new and innovative products from small businesses in a way that is cost affordable," he said.

## Self-Describing Software and Containers

### Docker - Automating Compliance for Highly Regulated Industries with Docker Enterprise Edition and OSCAL

[Docker Blog](https://blog.docker.com/2018/05/automating-compliance-docker-ee-oscal/)

"Highly-regulated industries like financial services, insurance, and government have their own set of complex and challenging regulatory IT requirements that must be constantly maintained. For this reason, the introduction of new technology can sometimes be difficult. [Docker Enterprise Edition](https://blog.docker.com/2018/04/announcing-docker-enterprise-edition-2-0/) provides these types of organization with both a secure platform on which containers are the foundation for building compliant applications and a workflow for operational governance at scale."

"To address these requirements, Docker has collaborated with the National Institute of Standards and Technology (NIST), and today, we are excited to announce that Docker is fully embracing the Open Security Controls Assessment Language (OSCAL) standard and committing to its future development."

Docker has continued to collaborate with the OSCAL team on the development of OSCAL.