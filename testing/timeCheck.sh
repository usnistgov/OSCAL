# tests the timestamp for the metaschema to the profile schema xsd
python timeStampValidation.py ../schema/metaschema/oscal-profile-metaschema.xml ../schema/xml/oscal-profile-schema.xsd

# tests the timestamp for the metaschema to the catalog schema xsd
python timeStampValidation.py ../schema/metaschema/oscal-catalog-metaschema.xml ../schema/xml/oscal-catalog-schema.xsd

# tests the timestamp for the metaschema to the profile schema json
python timeStampValidation.py ../schema/metaschema/oscal-profile-metaschema.xml ../schema/json/oscal-profile-schema.json

# tests the timestamp for the metaschema to the catalog schema json
python timeStampValidation.py ../schema/metaschema/oscal-catalog-metaschema.xml ../schema/json/oscal-catalog-schema.json

# tests the timestamp for the NIST 800-53 rev 4 catalog to the json version of it
python timeStampValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_catalog.xml ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_catalog.json

# tests the timestamp for the NIST 800-53 rev 4 LOW baseline to the json version of it
python timeStampValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_LOW-baseline_profile.xml ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_LOW-baseline_profile.json

# tests the timestamp for the NIST 800-53 rev 4 MODERATE baseline to the json version of it
python timeStampValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_MODERATE-baseline_profile.xml ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_MODERATE-baseline_profile.json

# tests the timestamp for the NIST 800-53 rev 4 HIGH baseline to the json version of it
python timeStampValidation.py ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_HIGH-baseline_profile.xml ../content/nist.gov/SP800-53/rev4/NIST_SP-800-53_rev4_HIGH-baseline_profile.json

# tests the timestamp for the FedRAMP LOW baseline to the json version of it
python timeStampValidation.py ../content/fedramp.gov/FedRAMP_LOW-baseline_profile.xml ../content/fedramp.gov/FedRAMP_LOW-baseline_profile.json

# tests the timestamp for the FedRAMP MODERATE baseline to the json version of it
python timeStampValidation.py ../content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.xml ../content/fedramp.gov/FedRAMP_MODERATE-baseline_profile.json

# tests the timestamp for the FedRAMP LOW baseline to the json version of it
python timeStampValidation.py ../content/fedramp.gov/FedRAMP_HIGH-baseline_profile.xml ../content/fedramp.gov/FedRAMP_HIGH-baseline_profile.json