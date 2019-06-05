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
SAXON_MAIN="net.sf.saxon.Transform"

# Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

# ( set -o posix ; set )

xsl_transform() {
    local stylesheet="$1"; shift
    local source_file="$1"; shift
    local output_file="$1"; shift
    local extra_params=($@)
    
    local classpath=$(JARS=("$SAXON_HOME"/*.jar); IFS=:; echo "${JARS[*]}")

    if [[ ! -z "$output_file" ]]; then
        java -cp "$classpath" net.sf.saxon.Transform \
            "-warnings:silent" "-o:${output_file}" "-s:${source_file}" "-xsl:${stylesheet}" "${extra_params[@]}"
    else
        java -cp "$classpath" net.sf.saxon.Transform \
            "-warnings:silent" "-s:${source_file}" "-xsl:${stylesheet}" "${extra_params[@]}"
    fi

    if [ "$?" -ne 0 ]; then
        echo "${P_ERROR}Error running Saxon.${P_END}"
        return 3
    fi
    return 0
}
