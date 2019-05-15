# imports
from lxml import etree
from StringIO import StringIO
import sys
from printColors import bcolors

# get the file names from the command line arguments
filename_xml = sys.argv[1]
filename_xsd = sys.argv[2]

# open and read schema file
with open(filename_xsd, 'r') as schema_file:
    schema_to_check = schema_file.read()

# open and read xml file
with open(filename_xml, 'r') as xml_file:
    xml_to_check = xml_file.read()

# parse the document
xmlschema_doc = etree.parse(StringIO(schema_to_check))

# error checking for schema load
try:
    xmlschema = etree.XMLSchema(xmlschema_doc)
except etree.XMLSchemaParseError as e: 
    print (e)
    exit(1)

# parse xml
print(bcolors.OKBLUE + 'XML Validation Test Running' +bcolors.ENDC)
try:
    doc = etree.parse(StringIO(xml_to_check))
    print(bcolors.OKGREEN + 'File: ' + filename_xml + ', Schema: ' + filename_xsd + bcolors.ENDC)
    print(bcolors.OKGREEN + 'SUCCESS: XML well formed, syntax ok.' + bcolors.ENDC)

# check for file IO error
except IOError:
    print(bcolors.FAIL + 'File: ' + filename_xml + ', Schema: ' + filename_xsd+ bcolors.ENDC)
    print(bcolors.FAIL + 'ERROR: Invalid File' + bcolors.ENDC)

# check for XML syntax errors
except etree.XMLSyntaxError as err:
    print(bcolors.FAIL + 'File: ' + filename_xml + ', Schema: ' + filename_xsd + bcolors.ENDC)
    print(bcolors.FAIL + 'ERROR: XML Syntax Error, see error_syntax.log'+ bcolors.ENDC)
    with open('error_syntax.log', 'w') as error_log_file:
        error_log_file.write(str(err.error_log))
    quit()

except:
    print('ERROR: Unknown error, exiting.')
    quit()

# validate against schema
print(bcolors.OKBLUE + 'XSD Validation Test Running' +bcolors.ENDC)
try:
    xmlschema.assertValid(doc)
    print(bcolors.OKGREEN + 'File: ' + filename_xml + ', Schema: ' + filename_xsd + bcolors.ENDC)
    print(bcolors.OKGREEN + 'SUCCESS: XML valid, schema validation ok.' + bcolors.ENDC)

except etree.DocumentInvalid as err:
    print(bcolors.FAIL + 'File: ' + filename_xml + ', Schema: ' + filename_xsd + filename_xsd + bcolors.ENDC)
    print(bcolors.FAIL + 'ERROR: Schema validation error, see error_schema.log' + bcolors.ENDC)
    with open('error_schema.log', 'w') as error_log_file:
        error_log_file.write(str(err.error_log))
    print(err.error_log)
    quit()

except:
    print('Unknown error, exiting.')
    quit()