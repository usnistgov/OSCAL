#!/bin/bash

# Setup script environment
if [ -z ${METASCHEMA_SCRIPT_INIT+x} ]; then

  # Get location of this script and set the OSCAL directory as a relative path
  DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
  OSCALDIR=$(cd "$DIR/../../.."; pwd)
  WORKING_DIR="${OSCALDIR}"

  source "$OSCALDIR/build/metaschema/scripts/include/common-environment.sh"
fi

