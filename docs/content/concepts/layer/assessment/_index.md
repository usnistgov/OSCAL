---
title: Assessment Layer
heading: "OSCAL Assessment Layer"
suppresstopiclist: true
weight: 40
sidenav:
  activerenderdepth: 2
  inactiverenderdepth: 2
toc:
  enabled: true
aliases:
  - /documentation/schema/assessment-layer/
  - /documentation/schema/assessment-results-layer/
---

The OSCAL assessment layer provides models for describing how an assessment is planned, performed, and how the results of assessment activities are reported.

The OSCAL assessment layer consists of the following models.

## Assessment Plan Model

The **[Assessment Plan model](assessment-plan/)** represents information related to the __planning__ of a periodic or continuous assessment of a specific system.

## Assessment Results Model

The **[Assessment Results model](assessment-results/)** represents information related to the __findings__ of a periodic or continuous assessment of a specific system.

## Plan of Action and Milestones Model

The **[Plan of Action and Milestones (POA&M) model](poam/)** represents the known risks for a specific system, as well as the identified deviations, remediation plan, and disposition status of each risk.

The Assessment Results and POA&M models are designed to enable easy flow of risk information from the results to the POA&M. These models are intended to be used in the context of a specific system. The assessment results are further intended to be used in the context of a specific assessment plan.
