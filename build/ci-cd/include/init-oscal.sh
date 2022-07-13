#!/bin/bash

# Setup script environment
if [ -z ${OSCAL_SCRIPT_INIT+x} ]; then

  # Get location of this script and set the OSCAL directory as a relative path
  OSCALDIR="$(cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)/../../.."; pwd)"
  WORKING_DIR="${OSCALDIR}"

  source "$OSCALDIR/build/metaschema/scripts/include/common-environment.sh"

  OSCAL_SCRIPT_INIT=true
fi
