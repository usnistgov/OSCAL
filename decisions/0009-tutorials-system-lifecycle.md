# : Design simplified system lifecycle for example system in tutorials

Date: 10/31/2023

## Status

Proposed

## Context

We wish to reduce friction encountered by community members learning security automation with OSCAL through tutorials produced by the OSCAL team.
A series of OSCAL security automation tutorials would need to be centered around and driven by some system lifecycle, such as the implied lifecycle in NIST 800-37 Risk Management Framework or ISO/IEC 27005.
However, adopting a complex real-world lifecycle in the tutorials would have several disadvantages:

- Complex system lifecycles add overhead that may not be relevant to the tutorial at hand.
- Endorsing a particular lifecycle may incorrectly signal to the reader that OSCAL can only be used with that lifecycle.
- The use of a real-world lifecycle could invite disagreement over the particulars of the lifecycle that are not relevant to the tutorials.

Summarized, the lifecycle should serve the tutorials and not the other way around.

*Note: this ADR was created as part of a work item for [OSCAL#1893](https://github.com/usnistgov/OSCAL/issues/1893).*

## Decision

The NIST OSCAL team should use a simplified lifecycle in its tutorials.
The lifecycle will focus on the security automation.

This document will only contain minimally-viable details of the lifecycle.

### Proposed Lifecycle

The proposed lifecycle will be evocative of a stripped-down RMF or ISO 27005 SDLC, discarding and simplifying steps that are not immediately relevant to a tutorial.

The individual tutorials may include asides on how a given process maps to other processes such as RMF.

|RISK MGMT | Select | Implement | Assess |
| --- | --- | --- | --- |
| DEVELOPMENT |	Design | Develop | Test |

The proposed lifecycle collapses "prepare", "categorize", and "select" into ***design***, renames "implement" into ***develop***, collapses "assess" and "authorize" into ***test***, and removes "monitor".

The steps of the RMF are all important and deserve individual consideration, but are not the subject of the tutorials.

## Consequences

This decision will affect tutorials written in the future, particularly tutorials surrounding the fictional [example system](https://github.com/usnistgov/OSCAL/issues/1892).
