import jsonschema
import simplejson as json
import sys
from printColors import bcolors

# get the file names from the command line arguments
jsonFilename = sys.argv[1]
jsonSchemaFilename = sys.argv[2]

# json schema validation
print(bcolors.OKBLUE + 'JSON Schema Check Running' + bcolors.ENDC)

# get the stats for the file
try:
    with open(jsonFilename, 'r') as f:
        json_data = f.read()
    jsonFile = json.loads(json_data)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: File: ' + jsonFilename + bcolors.ENDC)
    sys.exit(0)
try:
    with open(jsonSchemaFilename, 'r') as f:
        schema_data = f.read()
    jsonSchema = json.loads(schema_data)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: File: ' + jsonSchemaFilename + bcolors.ENDC)
    sys.exit(0)

# validate the data against the schema
try:
    v = jsonschema.Draft7Validator(jsonSchema)
    isValid = True
    for error in sorted(v.iter_errors(jsonFile), key=str):
        isValid = False
        print(bcolors.FAIL + error.message + bcolors.ENDC)

    if isValid:
      print(bcolors.OKGREEN + 'SUCCESS: Schema validation passed for: File: ' + jsonFilename + '.' + bcolors.ENDC)
    else:
      print(bcolors.FAIL + 'ERROR: Validation failed for: File: ' + jsonFilename + '.' + bcolors.ENDC)
    
except jsonschema.exceptions.ValidationError as error:
    print(bcolors.FAIL + 'ERROR: Validation failed for: File: ' + jsonFilename + '. First error displayed below: ' + bcolors.ENDC)
    print(error)
except Exception as error:
    print(bcolors.FAIL + 'ERROR: Unable to perform the validation for: File: ' + jsonFilename + '. Reason: ' + str(error) + bcolors.ENDC)
