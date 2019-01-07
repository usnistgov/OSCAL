# Overview Content
## What is OSCAL?

NIST is leading a project to develop a standard assessment that may be applied to a system to increase its security posture. The project is the Open Security Controls Assessment Language (OSCAL). The OSCAL project is focused on challenges centered around security controls and security controls assessment. Security controls and profiles are represented in proprietary ways and are expressed in prose format rather than being machine readable. The current environment leads to imprecise implementation, differences in interpretation and requires manual effort to implement the controls. A fundamental element of the project is to move the security control and profile from a text-based approach to a standardized automated format. This moves the implementation of security to a machine-based approach rather than a manual-based approach.

Multiple information system components, the hosting environment and the necessity to meet multiple regulatory requirements contribute to the complexity of security assessment. The security of systems needs to be checked against a number of requirements, owners and done simultaneously and continuously to provide value to system stakeholders.

Providing a complete assessment is complex and due to that complexity, assessments are largely a manual process.

Streamlining and standardizing security assessment decreases assessment-related labor, provides the ability to assess system security continuously, provides the capability to assess system compliance against multiple sets of requirements simultaneously.

### Overview Hyperlinks

#### Why OSCAL?

We are excited that you want to learn more about OSCAL. OSCAL is a collaborative environment of professionals that make up the project community. The community is setting out to develop a “standard of standards” that normalizes the representation of system security controls and corresponding information. The focus is to improve security assessment efficiency, accuracy and consistency. The community agrees that the language must be well defined and easy to use for both human and machine-readable formats.

Once the standards are defined, tools that use the OSCAL information will be developed in partnership with commercial vendors. The tools that use OSCAL information must be inter-operable and use the information consistently. Partnerships are important to the success of the project. Through project partnerships, an emphasis is to demonstrate the value for developers to adopt OSCAL so tools are available for organizations to build, customize, and use the information <framework>.

#### OSCAL Concepts

The terms associated with the project are important to understand. Three terms encompass the foundation for the project. Those terms are: Catalog, Profile and Control.

The foundation of OSCAL are the catalog and profile layers.

The catalog layer is a set of security control definitions. Examples include the hundreds of controls in NIST SP 800-53, the 100+ controls in ISO 27002, and the practices in COBIT 5. Examples are available for the catalog layer within the GitHub repository.

The profile layer is a set of security requirements; also called a baseline or overlay. Examples include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements.

Control is another term associated with the foundation of the project. The control is a safeguard or countermeasure designed to satisfy a set of defined security requirements. [based on NIST SP 800-53 definition]. Models for representing a security control catalog in a common OSCAL format are developed. The control catalog is a collection of controls.

The project is standardizing the terminology used among the various catalogs.

 #### How is OSCAL Used?

The intended audience for OSCAL consists of producers and consumers.

The producers include those producing catalogs, profiles and tools using the OSCAL format. Additional details for producers include:

 - Catalog maintainers publish catalogs into OSCAL format (e.g., NIST, ISO, ISACA).

- Standard profile maintainers maintain profiles in OSCAL format used by many organizations consuming OSCAL catalogs (for example, NIST, FedRAMP).

- Custom profile maintainers develop new profiles or customize existing profiles for organization-specific use (for example, cloud service providers, integrators).

- Tool vendors create tools that use OSCAL to support risk assessment, continuous monitoring, compliance reporting, and other purposes.

The consumers include those that implement, review and maintain the security posture of a system. A sample of consumers include: operations personnel, security and privacy personnel, auditors/assessors, policy personnel and system owners.

##### Discussion Item/Note: Creation of a "Getting Started with OSCAL" using a Fact Sheet format. Usually a PDF document.

##### Note:  Create a 2 page "fact sheet" usually in PDF format that would summarize the information. Markdown/text on the page tends to be cumbersome for users to digest and navigate. PDF documentation requires maintenance and may not be a solution NIST wants to implement.
