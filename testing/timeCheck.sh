#import config
#!/bin/bash
source testingConfig.sh

# tests the timestamp for the metaschema to the profile schema xsd
python timeStampValidation.py $varProfileMetaSchema $varProfileSchema

# tests the timestamp for the metaschema to the catalog schema xsd
python timeStampValidation.py $varCatalogMetaSchema $varCatalogSchema

# tests the timestamp for the metaschema to the profile schema json
python timeStampValidation.py $varProfileMetaSchema $varProfileJSONSchema

# tests the timestamp for the metaschema to the catalog schema json
python timeStampValidation.py $varCatalogMetaSchema $varCatalogJSONSchema

# tests the timestamp for the NIST 800-53 rev 4 catalog to the json version of it
python timeStampValidation.py $var80053Rev4CatalogXML $var80053Rev4CatalogJSON

# tests the timestamp for the NIST 800-53 rev 4 LOW baseline to the json version of it
python timeStampValidation.py $var80053Rev4ProfileLow $var80053Rev4ProfileLowJSON

# tests the timestamp for the NIST 800-53 rev 4 MODERATE baseline to the json version of it
python timeStampValidation.py $var80053Rev4ProfileModerate $var80053Rev4ProfileModerateJSON

# tests the timestamp for the NIST 800-53 rev 4 HIGH baseline to the json version of it
python timeStampValidation.py $var80053Rev4ProfileHigh $var80053Rev4ProfileHighJSON

# tests the timestamp for the FedRAMP LOW baseline to the json version of it
python timeStampValidation.py $varFedRAMPProfileLow $varFedRAMPProfileLowJSON

# tests the timestamp for the FedRAMP MODERATE baseline to the json version of it
python timeStampValidation.py $varFedRAMPProfileModerate $varFedRAMPProfileModerateJSON

# tests the timestamp for the FedRAMP LOW baseline to the json version of it
python timeStampValidation.py $varFedRAMPProfileHigh $varFedRAMPProfileHighJSON
