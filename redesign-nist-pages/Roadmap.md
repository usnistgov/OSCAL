# Navigate OSCAL

The OSCAL roadmap provides a means to navigate the plan and progress of the project. The community has worked to define and develop the catalog and profile layer examples. The focus is now to define and develop the implementation layer. The assessment and assessment results layers will follow.

![OSCAL Roadmap](imgs/oscal-components.png)


##### Note: May want to update the graphic with brighter colors and try to simply/streamline text.

> The foundation of OSCAL are the catalog and profile layers.

The catalog layer is a set of security control definitions. Examples include the hundreds of controls in NIST SP 800-53, the 100+ controls in ISO 27002, and the practices in COBIT 5. Examples are available for the catalog layer within the GitHub repository.

The profile layer is a set of security requirements; also called a baseline or overlay. Examples include the control baselines in NIST SP 800-53, the FedRAMP baselines, and the PCI DSS requirements. The work performed with the profile layer was to represent the profile in a standardized format that can be expressed in multiple ways (XML, YAML, JSON, etc.). Work was also performed to permit a profile to include controls from more than one catalog. This work permits an agency to set up a single profile that references controls from several catalogs.

Control is another term associated with the foundation of the project. The control is a safeguard or countermeasure designed to satisfy a set of defined security requirements. [based on NIST SP 800-53 definition]. Models for representing a security control catalog in a common OSCAL format are developed. The control catalog is a collection of controls.

The implementation and assessment layers focus on defining and developing methods to assess the controls.

The implementation layer defines how each profile item is implemented for a given system component.

An example of the implementation layer is a machine-readable system security plan in OSCAL format. The implementation layer will also translate the machine-readable system security plan to a human-readable version.

The assessment layer will model performing an assessment so that the data can be used to drive an assessment. The assessment results layer will use the OSCAL format to represent the finding of the assessment.
