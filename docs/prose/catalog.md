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

OSCAL enables the definition of frameworks. A *framework* is basically selecting one or more OSCAL controls from one or more OSCAL catalogs. A framework allows an organization to specify which controls from which catalogs are relevant for a particular situation, environment, etc. For example, an organization using OSCAL to check certain controls on a system that is subject to both NIST SP 800-53 and ISO 27002 could define a single framework that specifies just the necessary controls from those two catalogs. Specifying a subset of controls from catalogs is also known as creating an overlay or customizing a catalog. Similar to how a catalog may use sections to organize its content, a framework may define components, each of which references one or more controls. 

# The OSCAL Model

## The Catalog Object


Members:

* Declaration
* Group
* Control
* sub-control

## The Declarations Object



## The OSCAL &lt;control> element
Each OSCAL *&lt;control> element* defines a single security or privacy control. A &lt;control> element may contain the following:

* Identifier for the control (mandatory)
* Title for the control (optional). This is specified using the &lt;title> element.
* References (optional). These are specified using the &lt;references> and &lt;ref> elements.
* Subcontrols (optional). An OSCAL *&lt;subcontrol>* is very similar to an OSCAL &lt;control> in its composition. A &lt;subcontrol> is an enhancement to a &lt;control>; it extends a &lt;control> and is dependent on that &lt;control>. 
* Control components (optional). An OSCAL *&lt;component>* element can contain properties, hypertext links, control parameters, and other content.

The example below shows the first portion of how the AC1 control from NIST SP 800-53 can be rendered in OSCAL via XML within the &lt;control> element. Here's a high-level explanation of this example:

* The control class is "SP800-53". TBD: explain what this means, or skip it?
* The control id is "ac.1". This is not the "AC-1" identifier specified in NIST SP 800-53; instead, this is an OSCAL-internal identifier. TBD: is that correct? do the class and id work together so that the identifier is unique within the class?
* The *&lt;param> elements* define values (parameters) for the control that OSCAL users can specify. For example, the first parameter, "ac-1_a", is for specifying "organization-defined personnel or roles". The &lt;param> elements are referenced by statements (explained below).
* The *&lt;prop> elements* specify properties, in this case the control name ("AC-1"), priority ("P1"), and baseline impact ("LOW", "MODERATE", and "HIGH").
* The *&lt;part> element* defines a statement. The statement is the control text itself. As the example shows, the statement is defined in several pieces, with each discrete piece of the statement handled separately and assigned its own identifier. Some pieces reference parameter IDs (param-id) to bring in those user-defined values, while others simply contain chunks of the control's text. This modular approach to defining the control text enables granular treatment of each part of the control. For example, an auditor would find it easy to indicate which portions of the control an organization has implemented and which portions it has not.

### Bindings

* [XML](xml/catalog.md#control)
* JSON
