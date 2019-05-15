#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

if [[ ! -v SAXON_HOME ]] || [[ -z "$SAXON_HOME" ]]; then
    if [[ ! -v SAXON_VERSION ]]; then
        echo "SAXON_VERSION is not set. Please set SAXON_VERSION to indicate the library version"
    elif [[ -z "$SAXON_VERSION" ]]; then
        echo "SAXON_VERSION is set to the empty string"
    fi
    SAXON_HOME=~/.m2/repository/net/sf/saxon/Saxon-HE/$SAXON_VERSION
fi
SAXON_MAIN="net.sf.saxon.Transform"

# Saxon CL documented here: http://www.saxonica.com/documentation9.8/using-xsl/commandline.html

# ( set -o posix ; set )

xml_validate() {
    local source_file="$1"
    local catalog="$2"
    local report_file="$3"
    local extra_params="$4"
    local classpath=""
    for jar in ${SAXON_HOME}/*.jar; do
        classpath=${jar}:${classpath}
    done
    if [ "${output_file}" != "" ]; then
        java -cp ${classpath} com.saxonica.Validate \
            ${extra_params} -s:"${source_file}" -catalog:"${catalog}" -report:"${report_file}"
    else
        java -cp ${classpath} com.saxonica.Validate \
            ${extra_params} -s:"${source_file}" -catalog:"${catalog}"
    fi

    if [ "$?" -ne 0 ]; then
        echo "Error running Saxon"
        return 3
    fi
    return 0
}

xsl_transform() {
    local stylesheet="$1"
    local source_file="$2"
    local output_file="$3"
    local extra_params="$4"
    local classpath=""
    for jar in ${SAXON_HOME}/*.jar; do
        classpath=${jar}:${classpath}
    done
    if [ "${output_file}" != "" ]; then
        java -cp ${classpath} net.sf.saxon.Transform \
            ${extra_params} -warnings:silent -o:"${output_file}" -s:"${source_file}" "${stylesheet}"
    else
        java -cp ${classpath} net.sf.saxon.Transform \
            ${extra_params} -warnings:silent -s:"${source_file}" "${stylesheet}"
    fi

    if [ "$?" -ne 0 ]; then
        echo "Error running Saxon"
        return 3
    fi
    return 0
}
