if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [[ -z "$SCHEMATRON_HOME" ]]; then
    echo "SCHEMATRON_HOME is not set or is empty. Please set SCHEMATRON_HOME to indicate the location of the schematron skeleton. The schematron skeleton can be cloned using git clone https://github.com/Schematron/schematron <schematron_home_dir>"
fi

SCHEMATRON_DIR="$SCHEMATRON_HOME/trunk/schematron/code"

build_schematron() {
    local schematron="$1"
    local compiled_schematron="$2"

    # iso_dsdl_include.xsl
    xsl_transform "$SCHEMATRON_DIR/iso_dsdl_include.xsl" "$schematron" "" | \
    # iso_abstract_expand.xsl
    xsl_transform "$SCHEMATRON_DIR/iso_abstract_expand.xsl" "-" "" | \
    # iso_svrl_for_xslt2.xsl
    xsl_transform "$SCHEMATRON_DIR/iso_svrl_for_xslt2.xsl" "-" "$compiled_schematron" "generate-paths=true diagnose=true allow-foreign=true"
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
        printf 'Generating compiled Schematron failed for '%s'\n' "$schematron"
        return 1
    fi
    return 0
}

validate_with_schematron() {
    local compiled_schematron="$1"
    local source_file="$2"
    local svrl_result="$3"

    # generate the SVRL result
    xsl_transform "$compiled_schematron" "$source_file" "$svrl_result"
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
        printf 'Processing Schematron '%s' failed for target file '%s'.\n' "$ompiled_schematron" "$source_file"
        return 3
    fi
    # check if the SVRL result contains errors
    if grep --quiet "failed-assert" "$svrl_result"; then
        printf "The file '%s' has the following Schematron errors:\n" "$source_file"
        # display the errors
        cat "$svrl_result"
        return 1
    else
        printf "File '%s' passed Schematron validation.\n" "$source_file"
    fi
}

