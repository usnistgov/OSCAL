# The relationship between the OSCAL catalog and profile models

To understand the relationship between the OSCAL catalog and profile models, consider the trivial conceptual example in the figure below. This example represents the NIST SP 800-53 low baseline. The catalog defines the possible security controls within the scope of NIST SP 800-53. The profile indicates which security controls from the catalog are required to be compliant with the low baseline. Using OSCAL formats for the catalog and profile makes the mappings between the catalog and the profile explicit and machine readable. 

![trivial_example](/docs/graphics/profile-catalog-mapping-trivial-example.png "Trivial Example of Profile and Catalog Mapping")

OSCAL provides a standarized, machine-readable profile with clear semantics. OSCAL allows profiles to be generated using the same interoperable format regardless of the underlying catalogs that are being used, like ISO 27001/2 and COBIT 5. 
