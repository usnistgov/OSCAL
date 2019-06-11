#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

if [[ -z "$SAXON_HOME" ]]; then
    if [[ -z "$SAXON_VERSION" ]]; then
        echo "${P_ERROR}SAXON_VERSION is not set or is empty.${P_END} ${P_INFO}Please set SAXON_VERSION to indicate the library version${P_END}"
    fi
    SAXON_HOME=~/.m2/repository/net/sf/saxon/Saxon-HE/$SAXON_VERSION
fi

# ( set -o posix ; set )

xsl_transform() {
    local stylesheet="$1"; shift
    local source_file="$1"; shift
    local output_file="$1"; shift
    local extra_params=($@)
    
    local classpath=$(JARS=("$SAXON_HOME"/*.jar); IFS=:; echo "${JARS[*]}")

    set -- "-warnings:silent" "-xsl:${stylesheet}"
    
    if [ ! -z "$output_file" ]; then
      set -- "$@" "-o:${output_file}"
    fi
    
    if [ ! -z "$source_file" ]; then
      set -- "$@" "-s:${source_file}"
    fi

    java -cp "$classpath" net.sf.saxon.Transform "$@" "${extra_params[@]}"

    if [ "$?" -ne 0 ]; then
        echo "${P_ERROR}Error running Saxon.${P_END}"
        return 3
    fi
    return 0
}
