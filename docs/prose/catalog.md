---
title: OSCAL Controls and Catalogs

language_tabs: # must be one of https://git.io/vQNgJ
  - xml
  - json

toc_footers:
  - <a href='#'>GitHub Repo</a>
  - <a href='#'>NIST.gov</a>

includes:

search: true
---
# Introduction to OSCAL Controls and Catalogs
TBD: Expand this. This is an introduction to the concepts of OSCAL controls and catalogs.

## OSCAL Controls
In OSCAL, a *control* is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures," but most are considerably more complicated. Here's an example of a control from [NIST Special Publication (SP) 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4):

![800-53Rev4AC1](/docs/graphics/NIST-SP-800-53-Rev4-AC1.png "NIST SP 800-53 Rev 4 AC-1")

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. Now look at a similar excerpt of [ISO 27002](https://www.iso.org/standard/54533.html) on access control policy. It is even more detailed, with an identifier ("9.1.1"), a title ("Access control policy"), control text, lengthy implementation guidance, and other information (additional advice on access control policy).

![ISO27002911](/docs/graphics/ISO-27002-Control-9.1.1.png "ISO 27002 Control 9.1.1")

Comparing the ISO 27002 and NIST SP 800-53 examples show obvious differences. NIST SP 800-53 includes several components, such as references, control enhancements, and priority, that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002's, because ISO 27002 provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using its control element.

## OSCAL Catalogs
An *OSCAL catalog* is a set of closely related OSCAL controls. The catalog for [NIST Special Publication (SP) 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4) defines all NIST SP 800-53 controls. There would be a separate catalog for the controls from [ISO 27002](https://www.iso.org/standard/54533.html). An OSCAL catalog may simply define controls, or it may also organize those controls. *Sections* can be defined to partition a catalog, with each section containing one or more references to controls or control groups. A *group* references related controls or control groups.

OSCAL enables the definition of frameworks. A *framework* is basically selecting one or more OSCAL controls from one or more OSCAL catalogs. A framework allows an organization to specify which controls from which catalogs are relevant for a particular situation, environment, etc. For example, an organization using OSCAL to check certain controls on a system that is subject to both NIST SP 800-53 and ISO 27002 could define a single framework that specifies just the necessary controls from those two catalogs. Specifying a subset of controls from catalogs is also known as creating an overlay or customizing a catalog. Similar to how a catalog may use sections to organize its content, a framework may define *components*, each of which references one or more controls. 

# The OSCAL Model

## The Catalog Object


Members:

* Declaration
* Group
* Control
* sub-control

## The Declarations Object



## OSCAL Controls
Each OSCAL control defines a single security or privacy control. An OSCAL control may contain the following:

* Identifier for the control
* Title for the control
* References 
* Subcontrols (enhancements to the control that are dependent on it) 
* Control components, which can contain properties, hypertext links, parameters, and other content.

### Bindings

* [XML](xml/catalog.md#control)
* JSON
