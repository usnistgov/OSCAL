if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi
source "$OSCALDIR/build/ci-cd/include/saxon-init.sh"

if [[ -z "$SCHEMATRON_HOME" ]]; then
    echo "${P_ERROR}SCHEMATRON_HOME is not set or is empty.${P_END} ${P_INFO}Please set SCHEMATRON_HOME to indicate the location of the schematron skeleton. The schematron skeleton can be cloned using git clone https://github.com/Schematron/schematron <schematron_home_dir>.${P_END}"
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
        echo "${P_ERROR}Generating compiled Schematron failed for '$schematron'${P_END}"
        return 1
    fi
    return 0
}

validate_with_schematron() {
    local compiled_schematron="$1"; shift
    local source_file="$1"; shift
    local svrl_result="$1"; shift
    local extra_params=($@)

    set -- "${compiled_schematron}"

    if [ ! -z "$source_file" ]; then
      set -- "$@" "${source_file}"
    fi

    if [ ! -z "$svrl_result" ]; then
      set -- "$@" "${svrl_result}"
    fi

    # generate the SVRL result
    xsl_transform "$@" "${extra_params[@]}"
    cmd_exitcode=$?
    if [ $cmd_exitcode -ne 0 ]; then
        echo "Processing Schematron '$compiled_schematron' failed for target file '$source_file'"
        return 3
    fi

    # check if the SVRL result contains errors
    if [ ! -z "$svrl_result" ]; then
      if grep --quiet "failed-assert" "$svrl_result"; then
        echo "The file '$source_file' has the following Schematron errors:"

        # display the errors
        xsl_transform "$OSCALDIR/build/ci-cd/svrl-to-plaintext.xsl" "$svrl_result"
        echo ""
        return 1
      else
        echo "File '$source_file' passed Schematron validation."
      fi
    fi
}
