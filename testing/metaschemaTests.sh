# validates the OSCAL catalog metaschema against the master metaschema
python xmlValidation.py ../schema/metaschema/oscal-catalog-metaschema.xml ../build/metaschema/lib/metaschema.xsd

# validates the OSCAL profile metaschema against the master metaschema
python xmlValidation.py ../schema/metaschema/oscal-profile-metaschema.xml ../build/metaschema/lib/metaschema.xsd

# validates the OSCAL metadata metaschema against the master metaschema
python xmlValidation.py ../schema/metaschema/oscal-metadata-metaschema.xml ../build/metaschema/lib/metaschema.xsd

# validates the OSCAL ssp metaschema against the master metaschema
python xmlValidation.py ../schema/metaschema/oscal-ssp-metaschema.xml ../build/metaschema/lib/metaschema.xsd