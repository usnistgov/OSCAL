import jsonschema
import simplejson as json
import sys
from printColors import bcolors

# get the file names from the command line arguments
filename1 = sys.argv[1]
filename2 = sys.argv[2]

# json schema validation
print(bcolors.OKBLUE + 'JSON Schema Check Running' + bcolors.ENDC)

# get the stats for the file
try:
    with open(filename1, 'r') as f:
        json_data = f.read()
    jsonFile = json.loads(json_data)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: 1) File: ' + filename1 + bcolors.ENDC)
    sys.exit(0)
try:
    with open(filename2, 'r') as f:
        schema_data = f.read()
    jsonSchema = json.loads(schema_data)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: 1) File: ' + filename2 + bcolors.ENDC)
    sys.exit(0)

# validate the data against the schema
try:
    jsonschema.validate(jsonFile, jsonSchema)
    print(bcolors.OKGREEN + 'SUCCESS: Schema validation passed for: 1) File: ' + filename1 + bcolors.ENDC)
except jsonschema.exceptions.ValidationError as error:
    print(bcolors.FAIL + 'ERROR: Validation failed for: 1) File: ' + filename1 + '. First error displayed below: ' + bcolors.ENDC)
    print(error)
except:
    print(bcolors.FAIL + 'ERROR: Unable to perform the validation for: 1) File: ' + filename1 + bcolors.ENDC)