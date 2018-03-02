# Documentation for creators and maintainers of OSCAL tools and content

## Terminology

Before discussing OSCAL, it is important to define three key OSCAL terms:
 * *Control*: A safeguard or countermeasure designed to satisfy a set of defined security and/or privacy requirements. While this is based on the NIST Special Publication (SP) 800-53 definition of "control", in the context of OSCAL it refers to a similar kind of requirement from a control catalog. 
 * *Catalog*: A set of security control definitions. Examples include the hundreds of controls in NIST SP 800-53 Revision 4 Appendix F, the 100+ controls in ISO 27002, and the practices in COBIT 5. 
 * *Profile*: A set of security requirements, where meeting each requirement necessitates implementing one or more security controls. Also called a baseline or overlay. Examples include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements.

## Creator and Maintainer Types

The initial OSCAL work encompasses the catalog and profile concepts. There are several types of users who should benefit from OSCAL catalogs and profiles. They include the following producers of OSCAL catalogs, profiles, and/or tools:
 * *Catalog maintainers*: publishing catalogs into OSCAL format (e.g., NIST, ISO, ISACA)
 * *Standard profile maintainers*: profiles in OSCAL format used by many organizations consuming OSCAL catalogs (e.g., NIST, FedRAMP)
 * *Custom profile maintainers*: developing new profiles or customizing existing profiles for organization-specific use (e.g., cloud service providers, integrators)
 * *Tool vendors*: creating tools that use OSCAL to support risk assessment, continuous monitoring, compliance reporting, and other purposes
 
## OSCAL components and high-level architecture

The plans for OSCAL involve seven components, as depicted in the following diagram:

![OSCAL layers](/docs/graphics/oscal-layers.png "OSCAL Layer Diagram")

Starting from the bottom on the left, the OSCAL layers are:
 * *Catalog*: In addition to defining a set of security controls, may also define objectives and methods for assessing the controls (e.g., NIST SP 800-53A). Combining assessment objectives and methods with security controls has been done because some control catalog formats, such as COBIT 5, address assessment information directly. Others have it separately, like 800-53A. Including assessment objectives within the OSCAL catalog model simplifies the entire OSCAL operational model.
 * *Profile*: The profile format will allow for selecting security controls using a number of different mechanisms as well as tailoring those controls (e.g., assigning parameter values, modifying requirements). A profile can include controls from more than one catalog, so an organization could have a single profile that references controls from several catalogs.
 * *Implementation*: Defines how each profile item is implemented for a given system component. This can represent a machine-readable system security plan in OSCAL format. It will also support transforms from the machine-readable form to a human-readable version.
 * *Assessment*: Describes how the system assessment is to be performed.
 * *Assessment Results*: Records the findings of the assessment.
 
OSCAL will also integrate with:  
 * *Metrics*: Defines metrics and measurements for understanding the effectiveness of the system’s security. 
 * *Mechanism*: Describes methods used to monitor the system’s current security state (e.g., Security Content Automation Protocol (SCAP)). 
 
These are the current definitions for each component. As the project progresses, these definitions may evolve. They are included here to indicate the overall body of work for OSCAL and not the finalized details of each component.   

TBD: Add in the Profile-Catalog-Relationship.md material that explains the relationship between profiles and catalogs.

TBD: Add OSCAL examples. Slides 14 through 18 in the OSCAL Overview presentation illustrate how prose becomes OSCAL.

TBD: Point readers to the catalog page

TBD: Point readers to the OSCAL document model and tagging specification (docs/schema/oscal-tag-library.md)

TBD: Add pointers to schemas and Schematron files

TBD: Are there multiple audiences within implementers that will want distinct subsets of information? Or will different people need different combinations of information?
