# OSCAL Controls
In OSCAL, a control is a safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. Although this is based on the NIST Special Publication (SP) 800-53 definition of "control", its meaning has been broadened to encompass safeguards and countermeasures regardless of the level of detail used to define them and the types of information their definitions contain.

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
