#!/bin/bash

# Setup script environment

# Get location of this script and set the OSCAL directory as a relative path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OSCALDIR=$(cd "$DIR/../.."; pwd)

## Setup color codes
# check if stdout is a terminal...
export TERM=${TERM:-dumb}
colorize=0
if [ -t 1 ]; then
  # does the terminal support colors?
  ncolors=$(tput colors)
  if [ -n "$ncolors" ] && [ $ncolors -ge 8 ]; then
    colorize=1
  fi
fi

if [ $colorize -eq 1 ]; then
    #setup print colors
    P_ERROR=$(tput setaf 1)$(tput bold)
    P_OK=$(tput setaf 2)$(tput bold)
    P_WARN=$(tput setaf 3)$(tput bold)
    P_INFO=$(tput bold)
    P_END=$(tput sgr0)
else
    P_ERROR=""
    P_OK=""
    P_WARN=""
    P_INFO=""
    P_END=""
fi