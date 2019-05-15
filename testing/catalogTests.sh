#import config
#!/bin/bash
source testingConfig.sh

# tests the NIST 800-53_rev4 catalog
python xmlValidation.py $var80053Rev4CatalogXML $varCatalogSchema
