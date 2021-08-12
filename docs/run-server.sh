#!/bin/bash

/oscal/build/ci-cd/generate-specification-documentation.sh
cd /docs
hugo server --enableGitInfo=false -v --debug --minify --bind 0.0.0.0