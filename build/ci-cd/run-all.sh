#!/bin/bash
# determines the OSCAL directory path
if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

# sets the CI-CD directory
CIDIR=$OSCALDIR/build/ci-cd

# defaults
PERFORM_VALIDATION=YES
PERFORM_GENERATION=YES
PERFORM_CONVERSION=YES

WORKING_DIR="$OSCALDIR"

# Process arguments
OTHER_ARGS=()
while [ $# -gt 0 ]; do
    arg="$1"
    case "$arg" in
        -v|--validate)
        PERFORM_VALIDATION=YES
        shift # argument
        ;;
        --no-validate)
        PERFORM_VALIDATION=NO
        shift # argument
        ;;
        -g|--generate)
        PERFORM_GENERATION=YES
        shift # argument
        ;;
        --no-generate)
        PERFORM_GENERATION=NO
        shift # argument
        ;;
        -c|--convert)
        PERFORM_CONVERSION=YES
        shift # argument
        ;;
        --no-convert)
        PERFORM_CONVERSION=NO
        shift # argument
        ;;
        -d|--working-dir)
        WORKING_DIR="$2"
        shift # argument
        shift # value
        ;;
        *)    # unknown option
        OTHER_ARGS+=("$1") # save the arg
        shift # past argument
        ;;
    esac
done

# restore remaining arguments
set -- "$OTHER_ARGS[@]}"

# get absolute path
WORKING_DIR=$(realpath "$WORKING_DIR")

echo PERFORM VALIDATION = "${PERFORM_VALIDATION}"
echo PERFORM GENERATION = "${PERFORM_GENERATION}"
echo PERFORM CONVERSION = "${PERFORM_CONVERSION}"
echo WORKING DIR        = "${WORKING_DIR}"

# runs all of the scripts to test locally
[[ "$PERFORM_VALIDATION" == "YES" ]] && ("$CIDIR/validate-metaschema.sh" "$WORKING_DIR" "$@" || ("Failed to validate Metaschema" && exit 1) )
[[ "$PERFORM_GENERATION" == "YES" ]] && ("$CIDIR/generate-schema.sh" "$WORKING_DIR" "$@" || ("Failed to generate schema files" && exit 2) )
[[ "$PERFORM_VALIDATION" == "YES" ]] && ("$CIDIR/validate-content.sh" "$WORKING_DIR" "$@" || ("Failed to validate content" && exit 3) )
[[ "$PERFORM_GENERATION" == "YES" ]] && ("$CIDIR/generate-content-converters.sh" "$WORKING_DIR" "$@" || ("Failed to generate content converters" && exit 4) )
[[ "$PERFORM_CONVERSION" == "YES" ]] && ("$CIDIR/copy-and-convert-content.sh" "$WORKING_DIR" "$@" || ("Failed to convert content" && exit 5) )
[[ "$PERFORM_VALIDATION" == "YES" ]] && ("$CIDIR/validate-round-trips.sh" "$WORKING_DIR" "$@" || ("Failed to validate XML->JSON->XML round-trips" && exit 6) )
