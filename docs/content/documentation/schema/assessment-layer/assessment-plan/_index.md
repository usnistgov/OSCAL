---
title: Assessment Plan Model
heading: "OSCAL Assessment Layer: Assessment Plan Model"
description: XML and JSON format documentation for the OSCAL Assessment Plan model, which is part of the OSCAL Assessment layer. These formats model the planning of a periodic or continuous assessment.
weight: 60
aliases:
  - /documentation/schema/assessment-plan/
---

The OSCAL [Assessment Plan model](/documentation/schema/assessment-layer/assessment-plan/) is part of the [OSCAL Assessment Layer](/documentation/schema/assessment-layer/). It defines structured, machine-readable XML, JSON, and YAML representations of the information contained within an assessment plan. 

This model is typically used by anyone planning to perform assessment or continuous monitoring activities on a system to determine the degree to which that system complies with one or more frameworks.

This model allows an assessor to express all details associated with a classic "snapshot in time" assessment, including the scope of the assessment, schedule, intended activities, and the rules of engagement. It also allows organizations to specify clear continuous monitoring parameters, such as frequency and method of monitoring, as well as responsible monitoring roles. 

An OSCAL assessment plan is always defined in the context of a specific system, and must always be associated with an OSCAL [System Security Plan (SSP)](/documentation/schema/implementation-layer/system-security-plan/).

The current version of this model was created based on the information requirements of a [FedRAMP Security Assessment Plan](https://www.fedramp.gov/assets/resources/templates/FedRAMP-Annual-SAP-Template.docx), and was expanded to include continuous monitoring capabilities. 
It was designed to use identical syntax to the [assessment results model](/documentation/schema/assessment-results-layer/assessment-results/), for overlapping assemblies (Objectives, Assessment Subject, Assets, and Assessment Activities). 
