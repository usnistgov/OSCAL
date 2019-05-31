#!/bin/bash

# Setup script environment

# Get location of this script and set the OSCAL directory as a relative path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OSCALDIR=$(cd "$DIR/../.."; pwd)

#setup print colors
P_ERROR=$'\e[1;31m'
P_OK=$'\e[1;32m'
P_WARN=$'\e[1;33m'
P_INFO=$'\e[1m'
P_END=$'\e[0m'
