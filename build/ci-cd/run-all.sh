#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

CIDIR=$OSCALDIR/build/ci-cd

bash $CIDIR/validate-metaschema.sh
bash $CIDIR/generate-schema.sh
bash $CIDIR/generate-content-converters.sh
bash $CIDIR/copy-and-convert-content.sh
