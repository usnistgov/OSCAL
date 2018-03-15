# Profile Usage Scenarios

The following are a set of usage scenarios that describe typical uses for an OSCAL Profile. These scenarios can be used to test the implementation of the OSCAL Profile model.

## Basic Profile Creation from a Catalog of Controls

As an OSCAL Profile author, I want to define a baseline of controls and subcontrols that support a specific information system impact level.

When creating this new Profile I want to be able to:

- Identify a set of controls and subcontrols (e.g., control enhancements) by identifier or by a match pattern.

  Example: [SP 800-53 rev 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r4.pdf) Appendix D

- Specify an optional priority for implementation (e.g., P1=implement first, P2=implement after P1, etc.)

  Example: [SP 800-53 rev 4](https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-53r4.pdf) Appendix D

## Customization of another Profile

As an OSCAL Profile author, I want to define a baseline of controls and subcontrols that support a specific information system impact level. This new baseline is created by customizing an existing referenced OSCAL Profile.

When creating this new Profile I want to be able to:

- Identify a set of controls and subcontrols (e.g., control enhancements) by identifier or by a match pattern from the underlying Profile to include and/or exclude.

- Identify a set of controls and subcontrols (e.g., control enhancements) by identifier or by a match pattern from an underlying Catalog to add to this profile. These controls and subcontrols will typically be absent in the referenced underlying Profile.

- Adjust a parameter property. The specific parameter being adjusted is identified using the parameter identifier defined in a control or subcontrol from an underlying catalog. This catalog may be directly referenced by this profile, or may be an underlying Catalog indirectly referenced by a Profile referenced in this Profile. The one or more of the following types of adjustments may be made:
  - Set an adjusted parameter label that defines (in words) the expected value(s) for a parameter.
  - Set an actual value for the parameter.
  - Cite a source (href and textual label) for this change.

  Example: [FedRAMP Low Baseline](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Low_Security_Controls.xlsx)
  Example: [DISA Cloud SRG](https://iasecontent.disa.mil/cloud/SRG/index.html#AppendixD-CSPAssessmentParameterValuesforPA) Appendix D

- Add or remove specific requirements in a referenced control or subcontrol.

  Example: [FedRAMP Low Baseline](https://www.fedramp.gov/assets/resources/documents/FedRAMP_Low_Security_Controls.xlsx)
  Example: [DISA Cloud SRG](https://iasecontent.disa.mil/cloud/SRG/index.html#AppendixD-CSPAssessmentParameterValuesforPA) Appendix D

As an OSCAL profile consumer, I want to be able to identify the delta between the referenced Profile and the new Profile. Specifically, I need to be able to:

- Determine what controls are selected from the underlying Profile and what additional controls have been added from an underlying Catalog.
- Identify what requirements have been added or removed from an underlying control or subcontrol.
