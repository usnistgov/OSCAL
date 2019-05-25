#!/bin/bash
# determines the OSCAL directory path
if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

# sets the CI-CD directory
CIDIR=$OSCALDIR/build/ci-cd

# runs all of the scripts to test locally
bash $CIDIR/validate-metaschema.sh
bash $CIDIR/generate-schema.sh
bash $CIDIR/validate-content.sh
bash $CIDIR/generate-content-converters.sh
bash $CIDIR/copy-and-convert-content.sh
bash $CIDIR/roundTripXML.sh
