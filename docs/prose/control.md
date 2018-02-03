---
title: OSCAL Controls

language_tabs: # must be one of https://git.io/vQNgJ
  - xml
  - json

toc_footers:
  - <a href='#'>GitHub Repo</a>
  - <a href='#'>NIST.gov</a>

includes:

search: true
---
# OSCAL Controls
In OSCAL, a control is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures," but most are considerably more complicated. Here's an example of a control from [NIST Special Publication (SP) 800-53 Revision 4](https://doi.org/10.6028/NIST.SP.800-53r4):

![800-53Rev4AC1](/docs/graphics/NIST-SP-800-53-Rev4-AC1.png "NIST SP 800-53 Rev 4 AC-1")

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. Now look at a similar excerpt of [ISO 27001](https://www.iso.org/isoiec-27001-information-security.html) on access control policy (control objective number A.9.1.1). It is comparatively simple, with only an identifier ("A.9.1.1"), a title ("Access control policy"), and the control itself.

![ISO27001A91](/docs/graphics/ISO-27001-Control-A9.png "ISO 27001 Control Objective A.9.1.1")

Comparing the ISO 27001 and NIST SP 800-53 examples show obvious differences. NIST SP 800-53 includes several components, such as references, control enhancements, and priority, that ISO 27001 does not. NIST SP 800-53's statement of the control itself is also much more detailed and specific than ISO 27001's. Also, NIST SP 800-53 states its control in a structured format, breaking the text into several lettered and numbered pieces, while the ISO 27001 control is a single short statement. A final noteworthy distinction is that the security control identifier from NIST SP 800-53 and the control objective number from ISO 27001 both serve the same purpose--providing a unique identifier for a control. Someone who is not familiar with both standards might not assume that these two terms really mean the same thing.

OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using its control element.

## The OSCAL control element
Each OSCAL control element defines a single security or privacy control. A control element may contain the following:

* Identifier for the control (mandatory)
* Title for the control (optional)
* References (optional)
* Subcontrols (optional). An OSCAL subcontrol is very similar to an OSCAL control in its composition, but a subcontrol always extends a control and is dependent on that control. 
* Control components (optional). An OSCAL control-components element can contain properties, hypertext links, control parameters, and other content.

The example below shows a partial draft of how the AC1 control from NIST SP 800-53 can be rendered in OSCAL via XML within the control element. More details on the components of this example are provided below.

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

TBD explain the following:

* What the control class and control id are
* What a param is and how it is used
* What the name property is
* What the priority and baseline-impact properties are
* What the statement property is, including how it uses the item property


