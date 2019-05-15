#!/bin/bash

# Setup script environment

# Get location of this script and set the OSCAL directory as a relative path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OSCALDIR=$(cd "$DIR/../.."; pwd)


