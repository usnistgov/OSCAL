#import config
#!/bin/bash
source testingConfig.sh

# validate the NIST 800-53 rev JSON catalog against its schema
python jsonSchemaValidation.py $var80053Rev4CatalogJSON $varCatalogJSONSchema

# validate the NIST 800-53 rev LOW baseline JSON against its schema
python jsonSchemaValidation.py $var80053Rev4ProfileLowJSON $varProfileJSONSchema

# validate the NIST 800-53 rev MODERATE baseline JSON against its schema
python jsonSchemaValidation.py $var80053Rev4ProfileModerateJSON $varProfileJSONSchema

# validate the NIST 800-53 rev HIGH baseline JSON against its schema
python jsonSchemaValidation.py $var80053Rev4ProfileHighJSON $varProfileJSONSchema

# validate the FedRAMP LOW baseline JSON against its schema
python jsonSchemaValidation.py $varFedRAMPProfileLowJSON $varProfileJSONSchema

# validate the FedRAMP MODERATE baseline JSON against its schema
python jsonSchemaValidation.py $varFedRAMPProfileModerateJSON $varProfileJSONSchema

# validate the FedRAMP HIGH baseline JSON against its schema
python jsonSchemaValidation.py $varFedRAMPProfileHighJSON $varProfileJSONSchema