# OSCAL Controls
In OSCAL, a control is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures," but most are considerably more complicated. Here's an example of a control from NIST Special Publication (SP) 800-53 Revision 4:

![800-53Rev4AC1](/docs/graphics/NIST-SP-800-53-Rev4-AC1.png "NIST SP 800-53 Rev 4 AC-1")

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. In contrast to this prose-based control, a similar control from the Cloud Security Alliance (CSA) Cloud Controls Matrix (CCM) on user access policies and procedures (control ID number IAM-02) is defined in 53 components within a spreadsheet. Here are the first three components of IAM-02:

![CSA-CCM-IAM02](/docs/graphics/CSA-CCM-IAM02.png "CSA CCM IAM-02")

Comparing these three components with the NIST SP 800-53 example shows obvious differences. The NIST SP 800-53 control has a title, and the CSA CCM control has a "Control Domain". These serve a similar purpose, but one is hierarchical (multiple levels of domains) and the other is not. The "Control" component of the NIST SP 800-53 control and the "Updated Control Specification" component of the CSA CCM control both define the nature of the control, but NIST SP 800-53 does so in a more structured format, breaking the text into several lettered and numbered pieces, while the CSA CCM control is a plain narrative with bullets. Other components of the two controls vary even more, with each control including information that the other doesn't.

OSCAL is designed to take disparate control definitions from different sources and express them in a standardized way using its control element.

## The OSCAL control element
Each OSCAL control element defines a single security or privacy control. A control element may contain the following:
* Identifier for the control (mandatory)
* Title for the control (optional)
* References (optional)
* Subcontrols (optional). An OSCAL subcontrol is very similar to an OSCAL control in its composition, but a subcontrol always extends a control and is dependent on that control. 
* Control components (optional). An OSCAL control-components element can contain properties, hypertext links, control parameters, and other content.

The example below shows a partial draft of how the AC1 control from NIST SP 800-53 can be rendered in OSCAL via XML.

![800-53Rev4AC1OSCAL](/docs/graphics/NIST-SP-800-53-AC1-in-OSCAL-XML.png "NIST SP 800-53 Rev 4 AC-1 in OSCAL XML")

TBD talk about what's in the graphic. Focus on the content being represented more than the XML itself. 
