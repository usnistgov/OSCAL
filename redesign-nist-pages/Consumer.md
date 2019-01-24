# OSCAL for Consumers

We are excited that you want to learn more about the OSCAL project! OSCAL is setting out to automate and simplify meeting compliance and regulatory requirements. The OSCAL community is a collaborative environment of professionals that contribute to the project goals and objectives. The community is setting out to develop a “standard of standards” that normalizes the representation of system security controls and corresponding information. 

The project focus is to improve security assessment efficiency, accuracy and consistency. The community agrees that the language must be well defined and easy to use for both human and machine-readable formats. The consumers audience includes those that implement, review and maintain the security posture of a system. 

Once the standards are defined, tools that use the OSCAL information will be developed in partnership with commercial vendors. The tools that use OSCAL information must be inter-operable and use the information consistently. Partnerships are important to the success of the project. Through project partnerships, an emphasis is to demonstrate the value for developers to adopt OSCAL so tools are available for organizations to build, customize, and use the information.

The roadmap is used to visually display the plan and progress of the project. The project has worked to define and develop the catalog and profile layer examples. The project is now working to define and develop the implementation layer.

![OSCAL Roadmap](imgs/oscal-components.png)

The foundation of OSCAL are the catalog and profile layers.
The catalog layer is a set of security control definitions. Examples include the hundreds of controls in NIST SP 800-53, the 100+ controls in ISO 27002, and the practices in COBIT 5. Examples are available for the catalog layer within the GitHub repository.
The profile layer is a set of security requirements; also called a baseline or overlay. Examples include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements. The work performed with the profile layer was to represent the profile in a standardized format that can be expressed in multiple ways (XML, YAML, JSON, etc.). Work was also performed to permit a profile to include controls from more than one catalog. This work permits an agency to set up a single profile that references controls from several catalogs.

Control is another term associated with the foundation of the project. The control is a safeguard or countermeasure designed to satisfy a set of defined security requirements. [based on NIST SP 800-53 definition]. Models for representing a security control catalog in a common OSCAL format are developed. The control catalog is a collection of controls. 
The implementation and assessment layers focus on defining and developing methods to assess the controls.

The implementation layer defines how each profile item is implemented for a given system component. An example of the implementation layer is a machine-readable system security plan in OSCAL format. The implementation layer will also support transforms from a machine-readable to human-readable version.
The assessment layer describes how the system assessment is to be performed. The assessment results layer records the finding of the assessment.
