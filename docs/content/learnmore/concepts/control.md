---
title: Control
description: An exploration of the "*control*" concept used in OSCAL.
weight: 10
aliases:
  - /docs/control/
  - /learnmore/architecture/control/
---

In OSCAL, a control is:

> A description of a safeguard or countermeasure designed to satisfy a set of defined security requirements that may be implemented in a system to manage a security or privacy risk.

The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures", but most are considerably more complicated. The following example of a control is from NIST Special Publication (SP) 800-53 Revision 4:

![SP 800-53 Rev4 AC1](../NIST-SP-800-53-Rev4-AC1.png)

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. In contrast, the next control is from ISO 27002 on access control policy. It is even more detailed, with an identifier ("9.1.1"), a title ("Access control policy"), control text, lengthy implementation guidance, and other information (additional advice on access control policy).

![ISO 27002 Control 9.1.1](../ISO-27002-Control-9.1.1.png)

Comparing the ISO 27002 and NIST SP 800-53 examples show obvious differences. NIST SP 800-53 includes several components, such as references, control enhancements, and priority that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002 because it provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using its control element.
