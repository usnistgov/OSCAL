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
# OSCAL Controls and Catalogs
This is an introduction to the concepts of OSCAL controls and catalogs.

## OSCAL Controls
In OSCAL, a *control* is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures," but most are considerably more complicated. Here's an example of a control from [NIST Special Publication (SP) 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4):

![800-53Rev4AC1](/docs/graphics/NIST-SP-800-53-Rev4-AC1.png "NIST SP 800-53 Rev 4 AC-1")

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. Now look at a similar excerpt of [ISO 27002](https://www.iso.org/standard/54533.html) on access control policy. It is even more detailed, with an identifier ("9.1.1"), a title ("Access control policy"), control text, lengthy implementation guidance, and other information (additional advice on access control policy).

![ISO27002911](/docs/graphics/ISO-27002-Control-9.1.1.png "ISO 27002 Control 9.1.1")

Comparing the ISO 27002 and NIST SP 800-53 examples show obvious differences. NIST SP 800-53 includes several components, such as references, control enhancements, and priority, that ISO 27002 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27002's, because ISO 27002 provides those details in its implementation guidance instead of the control text. There are other differences in terminology as well, such as NIST SP 800-53 using the term "supplemental guidance" for roughly what ISO 27002 calls "other information".

OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using its control element.

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
* The &lt;param> elements define values (parameters) for the control that OSCAL users can specify. For example, the first parameter, "ac-1_a", is for specifying "organization-defined personnel or roles". The &lt;param> elements are referenced by statements (explained below).
* The &lt;prop> elements specify properties, in this case the control name ("AC-1"), priority ("P1"), and baseline impact ("LOW", "MODERATE", and "HIGH").
* The &lt;part> element defines a statement. The statement is the control text itself. As the example shows, the statement is defined in several pieces, with each discrete piece of the statement handled separately and assigned its own identifier. Some pieces reference parameter IDs (param-id) to bring in those user-defined values, while others simply contain chunks of the control's text. This modular approach to defining the control text enables granular treatment of each part of the control. For example, an auditor would find it easy to indicate which portions of the control an organization has implemented and which portions it has not.

```xml
      <control class="SP800-53" id="ac.1">
         <title>ACCESS CONTROL POLICY AND PROCEDURES</title>
         <param id="ac-1_a">
            <desc>organization-defined personnel or roles</desc>
            <value>organization-defined personnel or roles</value>
         </param>
         <param id="ac-1_b">
            <desc>organization-defined frequency</desc>
            <value>organization-defined frequency</value>
         </param>
         <param id="ac-1_c">
            <desc>organization-defined frequency</desc>
            <value>organization-defined frequency</value>
         </param>
         <prop class="name">AC-1</prop>
         <prop class="priority">P1</prop>
         <prop class="baseline-impact">LOW</prop>
         <prop class="baseline-impact">MODERATE</prop>
         <prop class="baseline-impact">HIGH</prop>
         <part class="statement">
            <p class="description">The organization:</p>
            <part class="item" id="smm_ac-1a.">
               <prop class="name">AC-1a.</prop>
               <p class="description">Develops, documents, and disseminates to <insert param-id="ac-1_a"/>:</p>
               <part class="item" id="sms_ac-1a.1.">
                  <prop class="name">AC-1a.1.</prop>
                  <p class="description">An access control policy that addresses purpose, scope, roles, responsibilities, management commitment, coordination among organizational entities, and compliance; and</p>
               </part>
               <part class="item" id="sms_ac-1a.2.">
                  <prop class="name">AC-1a.2.</prop>
                  <p class="description">Procedures to facilitate the implementation of the access control policy and associated access controls; and</p>
               </part>
            </part>
            <part class="item" id="smm_ac-1b.">
               <prop class="name">AC-1b.</prop>
               <p class="description">Reviews and updates the current:</p>
               <part class="item" id="sms_ac-1b.1.">
                  <prop class="name">AC-1b.1.</prop>
                  <p class="description">Access control policy <insert param-id="ac-1_b"/>; and</p>
               </part>
               <part class="item" id="sms_ac-1b.2.">
                  <prop class="name">AC-1b.2.</prop>
                  <p class="description">Access control procedures <insert param-id="ac-1_c"/>.</p>
               </part>
            </part>
         </part>
```

The second part of the example continues where the previous one ended. This example contains the supplemental guidance. Note that unlike the control text in the previous example, which had a highly structured OSCAL XML representation, the supplemental guidance is a simple paragraph. There is no need to structure it because it is meant as background information for a person to read and would not be part of automation.

```xml
         <part class="guidance">
            <p>This control addresses the establishment of policy and procedures for the effective implementation of selected security controls and control enhancements in the AC family. Policy and procedures reflect applicable federal laws, Executive Orders, directives, regulations, policies, standards, and guidance. Security program policies and procedures at the organization level may make the need for system-specific policies and procedures unnecessary. The policy can be included as part of the general information security policy for organizations or conversely, can be represented by multiple policies reflecting the complex nature of certain organizations. The procedures can be established for the security program in general and for particular information systems, if needed. The organizational risk management strategy is a key factor in establishing policy and procedures.</p>
            <link href="#pm.9"/>
         </part>
```

The final part of the example contains the references. These contain hyperlinks to additional sources of information for the control.

```xml
         <references>
            <ref>
                <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-12">NIST Special Publication 800-12</citation>
            </ref>
            <ref>
                <citation href="http://csrc.nist.gov/publications/PubsSPs.html#800-100">NIST Special Publication 800-100</citation>
            </ref>
         </references>
      </control>
```

The following shows a brief excerpt of ISO 27002 represented in OSCAL XML. This excerpt contains the definition of control 9.1.1, with text strings replaced with X's and truncated for brevity. Comparing this control definition to the OSCAL XML version of NIST SP 800-53 AC-1, you can see the same elements are used: control class and id, title, number, description, guidance, and information. Both controls are represented using the same structure.

```xml
         <control class="iso-27002" id="c9-1-1">
            <title>Access control policy</title>
            <prop class="number">9.1.1</prop>
            <part class="description">
               <p>XX XXXXXX.</p>
            </part>
            <part class="guidance">
               <p>XXXXXX.</p>
               <p>XXXXXX.</p>
               <p>XXX:</p>
               <ol>
                  <li>XXXXXXXX;</li>
                  <li>XXXXXXXX (XXX <a href="#g8-2">8.2</a>);</li>
                  <li>XXXXXXXXXXX;</li>
                  <li>XXXXXXXXXXXX (XXX <a href="#c9-2-1">9.2.1</a> XXX <a href="#c9-2-2">9.2.2</a>);</li>
                  <li>XXXXXXXXXXXX (XXX <a href="#c9-2-5">9.2.5</a>);</li>
                  <li>XXXXXXX (XXX <a href="#c9-2-6">9.2.6</a>);</li>
                  <li>XXXXXXXXX;</li>
                  <li>XXXXX (XXX <a href="#c9-2-3">9.2.3</a>).</li>
               </ol>
            </part>
            <part class="information">
               <p>XXXX:</p>
               <ol>
                  <li>XXXXXXXXXXXX”;</li>
                  <li>XXXXXXX (XXX <a href="#c8-2-2">8.2.2</a>) XXXX;</li>
                  <li>XXXXXXX;</li>
                  <li>XXXXX.</li>
               </ol>
               <p>XXXXXX (XXX <a href="#g9-2">9.2</a>, <a href="#g9-3">9.3</a>, <a href="#g9-4">9.4</a>) XXX (XXX <a href="#c6-1-1">6.1.1</a>, <a href="#g9-3">9.3</a>).</p>
               <p>XXXX.</p>
               <p>XXX:</p>
               <ol>
                  <li>XXXX-XX-XXXX: XXX);</li>
                  <li>XXXX-XX-XXX: XXX.</li>
               </ol>
            </part>
```
## OSCAL Catalogs
An OSCAL catalog is a set of closely related OSCAL controls. The &lt;catalog> element for [NIST Special Publication (SP) 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4) defines one &lt;control> element for each NIST SP 800-53 control. There would be a separate &lt;catalog> element for defining the &lt;control> elements for [ISO 27002](https://www.iso.org/standard/54533.html).

An OSCAL &lt;catalog> element may use additional elements to structure its contents. The &lt;section> element partitions a catalog or the contents of another &lt;section> element within the catalog. A &lt;section> element contains one or more references to controls or control groups. A &lt;group> element references related controls or control groups. Groups may be titled and have their own properties, statements, parameters, references, etc., which are inherited by all members of the group.

OSCAL enables the definition of frameworks. A framework is basically selecting one or more OSCAL controls from one or more OSCAL catalogs. A framework allows an organization to specify which controls from which catalogs are relevant for a particular situation, environment, etc. For example, an organization using OSCAL to check certain controls on a system that is subject to both NIST SP 800-53 and ISO 27002 could define a single framework that specifies just the necessary controls from those two catalogs. Specifying a subset of controls from catalogs is also known as creating an overlay or customizing a catalog.

In OSCAL, the &lt;framework> element is used to define a formal framework. OSCAL also offers the &lt;worksheet> element, which is used to define an informal, ad hoc framework. The expectation is that the &lt;framework> element will be used when a standards organization or other formal body wants to define a published framework, while the &lt;worksheet> element will be used by organizations creating frameworks for their own use.

A &lt;framework> element or &lt;worksheet> element may contain &lt;component> elements. A component references one or more controls. This provides a way to organize the contents of a framework.
