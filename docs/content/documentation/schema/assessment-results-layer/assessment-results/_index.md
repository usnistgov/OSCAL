---
title: Assessment Results Model
heading: "OSCAL Assessment Layer: Assessment Results Model"
description: XML and JSON format documentation for the OSCAL Assessment Results model, which is part of the OSCAL Assessment Results layer. These formats model the findings of a periodic or continuous assessment.
weight: 65
aliases:
  - /documentation/schema/assessment-results/
---

The OSCAL [Assessment Results model](/documentation/schema/assessment-results-layer/assessment-results/) is part of the [OSCAL Assessment Results Layer](/documentation/schema/assessment-results-layer/). It defines structured, machine-readable XML, JSON, and YAML representations of the information contained within an assessment report.

This model is typically used by anyone performing assessment or continuous monitoring activities on a system to determine the degree to which that system complies with one or more frameworks.

This model allows an assessor to express all details associated with a classic "snapshot in time" assessment, including the scope of the assessment, times and dates of activities, actual assessment activities performed, as well as any observations, findings, and identified risks. It also allows organizations to report continuous assessment information. 

OSCAL assessment results are always defined in the context of an assessment plan, and must always be associated with an OSCAL [Assessment Plan (SSP)](/documentation/schema/assessment-layer/assessment-plan/). OSCAL assessment results are associated with a specific system via the OSCAL assessment plan.

The current version of this model was created based on the information requirements of a [FedRAMP Security Assessment Report](https://www.fedramp.gov/assets/resources/templates/FedRAMP-Annual-SAR-Template.docx), and was expanded to include continuous assessment capabilities. 
It was designed to use identical syntax to the [assessment plan model](/documentation/schema/assessment-layer/assessment-plan/), for overlapping assemblies (Objectives, Assessment Subject, Assets, and Assessment Activities). It was also designed to use identical syntax to the [Plan of Action and Milestones (POA&M)](/documentation/schema/assessment-results-layer/poam/), for Result/Risks. 


