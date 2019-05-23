#!/bin/bash
# determines the OSCAL directory path
if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

# sets the CI-CD directory
CIDIR=$OSCALDIR/build/ci-cd

bash $CIDIR/validate-metaschema.sh || ("Failed to validate Metaschema" && exit 1)
bash $CIDIR/generate-schema.sh || ("Failed to generate schema files" && exit 2)
bash $CIDIR/validate-content.sh || ("Failed to validate content" && exit 3)
bash $CIDIR/generate-content-converters.sh || ("Failed to generate content converters" && exit 4)
bash $CIDIR/copy-and-convert-content.sh || ("Failed to convert content" && exit 5)
bash $CIDIR/roundTripXML.sh || ("Failed to test XML->JSON->XML round-trips" && exit 6)
