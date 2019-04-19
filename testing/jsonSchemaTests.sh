# validate the NIST 800-53 rev JSON catalog against its schema
python jsonSchemaValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_catalog.json ../schema/json/oscal-catalog-schema.json

# validate the NIST 800-53 rev LOW baseline JSON against its schema
python jsonSchemaValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_LOW-baseline_profile.json ../schema/json/oscal-profile-schema.json

# validate the NIST 800-53 rev MODERATE baseline JSON against its schema
python jsonSchemaValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_MODERATE-baseline_profile.json ../schema/json/oscal-profile-schema.json

# validate the NIST 800-53 rev HIGH baseline JSON against its schema
python jsonSchemaValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_HIGH-baseline_profile.json ../schema/json/oscal-profile-schema.json

# validate the FedRAMP LOW baseline JSON against its schema
python jsonSchemaValidation.py ../content/fedramp.gov/FedRAMP_LOW-baseline_profile.json ../schema/json/oscal-profile-schema.json

# validate the FedRAMP MODERATE baseline JSON against its schema
python jsonSchemaValidation.py ../content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.json ../schema/json/oscal-profile-schema.json

# validate the FedRAMP HIGH baseline JSON against its schema
python jsonSchemaValidation.py ../content/fedramp.gov/FedRAMP_HIGH-baseline_profile.json ../schema/json/oscal-profile-schema.json