#!/bin/bash

export HUGO_ARGS="--enableGitInfo=false --verbose --minify --bind 0.0.0.0"
export OSCAL_WORKING_PATH="${OSCAL_WORKING_PATH:-/oscal}"

"${OSCAL_WORKING_PATH}/build/ci-cd/generate-model-documentation.sh" -w "${OSCAL_WORKING_PATH}" 

if [ $retval -gt 0 ]; then
  echo "Generating model docs failed with error ${retval}, not running test site, review logs"
  exit 1
fi

"${OSCAL_WORKING_PATH}/build/ci-cd/generate-specification-documentation.sh" -w "${OSCAL_WORKING_PATH}" 

retval=$?

if [ $retval -gt 0 ]; then
  echo "Generating spec docs failed with error ${retval}, not running test site, review logs"
  exit 1
fi

(cd "${OSCAL_WORKING_PATH}/docs" && hugo server $HUGO_ARGS)
