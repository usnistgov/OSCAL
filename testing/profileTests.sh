# tests the FedRAMP High profile
python xmlValidation.py ../content/fedramp.gov/FedRAMP_HIGH-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd

# tests the FedRAMP Low Profile
python xmlValidation.py ../content/fedramp.gov/FedRAMP_LOW-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd

# tests the FedRAMP Moderate Profile
python xmlValidation.py ../content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd

#test the NIST 800-53 rev4 High baseline profile
python xmlValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_HIGH-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd

#test the NIST 800-53 rev4 Moderate baseline profile
python xmlValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd

#test the NIST 800-53 rev4 Low baseline profile
python xmlValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_LOW-baseline_profile.xml ../schema/xml/oscal-profile-schema.xsd