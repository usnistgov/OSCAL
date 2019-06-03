#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

CIDIR=$OSCALDIR/build/ci-cd

bash $CIDIR/validate-metaschema.sh || ("Failed to validate Metaschema" && exit 1)
bash $CIDIR/generate-schema.sh || ("Failed to generate schema files" && exit 2)
bash $CIDIR/generate-content-converters.sh || ("Failed to generate content converters" && exit 3)
bash $CIDIR/copy-and-convert-content.sh || ("Failed to convert content" && exit 4)
