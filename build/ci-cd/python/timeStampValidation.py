import os
import platform
import sys
from datetime import datetime
from printColors import bcolors

# get the file names from the command line arguments
filename1 = sys.argv[1]
filename2 = sys.argv[2]

# time check
print(bcolors.OKBLUE + 'Timestamp Check Running' +bcolors.ENDC)

# get the stats for the file
try:
    stat1 = os.stat(filename1)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: 1) File: ' + filename1 + bcolors.ENDC)
    sys.exit(0)
try:
    stat2 = os.stat(filename2)
except:
    print(bcolors.FAIL + 'ERROR: Unable to read file or file does not exist: 1) File: ' + filename2 + bcolors.ENDC)
    sys.exit(0)

try:
    # get the date created 
    print('Filename 1 timestamp: ' + datetime.fromtimestamp(stat1.st_birthtime).strftime('%Y-%m-%d %H:%M:%S:%f'))
    print('Filename 2 timestamp: ' + datetime.fromtimestamp(stat2.st_birthtime).strftime('%Y-%m-%d %H:%M:%S:%f'))
except AttributeError:
    # if not available, get the date last updated
    print('Filename 1 timestamp: ' + datetime.fromtimestamp(stat1.st_mtime).strftime('%Y-%m-%d %H:%M:%S:%f'))
    print('Filename 2 timestamp: ' + datetime.fromtimestamp(stat2.st_mtime).strftime('%Y-%m-%d %H:%M:%S:%f'))

# compare the timestamps (1 <= 2)
if stat2.st_mtime >= stat1.st_mtime:
    print(bcolors.OKGREEN + 'SUCCESS: Time check passed for: 1) File 1: ' + filename1 + ', 2) File 2: ' + filename2 + bcolors.ENDC)
else:
    print(bcolors.FAIL + 'ERROR: Time check failed for: 1) File 1: ' + filename1 + ', 2) File 2: ' + filename2 + bcolors.ENDC)