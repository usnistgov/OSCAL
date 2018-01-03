# OSCAL Controls
In OSCAL, a control is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. The definitions of controls vary greatly from one standard or guideline to another in terms of the level of detail and the types of information the definitions include. A control definition may be as simple as, "The organization has an access control policy and procedures," but most are considerably more complicated. Here's an example of a control from NIST Special Publication (SP) 800-53 Revision 4:

![800-53Rev4AC1](/docs/graphics/NIST-SP-800-53-Rev4-AC1.png "NIST SP 800-53 Rev 4 AC-1")

This control has seven high-level components, including a security control identifier ("AC-1"), a title ("ACCESS CONTROL POLICY AND PROCEDURES"), the control itself, supplemental guidance, control enhancements, references, and a priority and baseline allocation. In contrast to this prose-based control, a similar control from the Cloud Security Alliance (CSA) Cloud Controls Matrix (CCM) on user access policies and procedures (control ID number IAM-02) is defined in 53 components within a spreadsheet. Here are the first three components of IAM-02:

![CSA-CCM-IAM02](/docs/graphics/CSA-CCM-IAM02.png "CSA CCM IAM-02")

Comparing these three components with the NIST SP 800-53 example shows significant differences. The NIST SP 800-53 control has a title, and the CSA CCM control has a "Control Domain" which serves a similar purpose. The "Control" element of the NIST SP 800-53 control and the "Updated Control Specification" element of the CSA CCM control both define the nature of the control, but NIST SP 800-53 does so in a more structured format, breaking the text into several lettered and numbered pieces, while the CSA CCM control is a narrative with bullets.

*** pick up here ***

TBD: Show prose examples of an 800-53 control and a related control from another catalog. Illustrate the differences in the controls themselves and the terminology used for the parts of their definitions.

TBD: Use the prose examples to illustrate what a subcontrol is. A subcontrol is very similar to a control in its composition, but a subcontrol always extends a control and is dependent on that control. 

TBD: Should we remove any references to elements, attributes, etc. and make the narrative abstract? Talk about what an OSCAL control includes instead of what an OSCAL control element includes? Talk about content instead of its format, structure, etc.?

## The control element
Each control element defines a single security or privacy control. A control element may contain the following:
* A title (optional) for the control
* Subcontrols and/or control components (both optional)
* References (optional)
* Unique identifier for the control (mandatory) (unique only within the catalog?)
* optionalClass (?) (mandatory?)

## The subcontrol element
contains a control extension, enhancement, or associated or dependent control object. Similar composition to the control element, except it may not contain subcontrol elements.

## The control-components element
Each control-components element TBD. It may contain any number of the following:
* prop. A property is a value with a name attributed to the containing control, subcontrol, component, part, or group.
* anyKindofPart. This contains any number of part elements. Each part is a partition, piece or section of a control, subcontrol, component, or part.
* link. A link is a line or paragraph containing a hypertext link.
* param. This is a parameter setting to be propagated to points of insertion.
