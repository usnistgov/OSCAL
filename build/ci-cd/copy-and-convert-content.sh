#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [[ -z "$1" ]]; then
  working_dir=$OSCALDIR
else
  working_dir=$1
fi

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format model converttoformats || [[ -n "$path" ]]; do
  shopt -s extglob
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  converttoformats="${converttoformats%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR"/"$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      dest="$working_dir/${file/$OSCALDIR\/src\//}"
      dest_dir=${dest%/*}
      echo "${P_INFO}Copying '$file' to '$dest'.${P_END}"
      mkdir -p "$dest_dir"
      cp "$file" "$dest"

      IFS=","
      for altformat in "$converttoformats"; do
        newpath="${file/$OSCALDIR\/src\//}"
        newpath="${newpath/\/$format\///$altformat/}"
        newpath="${newpath%.$format}.$altformat"
        dest="$working_dir/$newpath"
        converter="$working_dir/$altformat/convert/oscal_${model}_${format}-to-${altformat}-converter.xsl"

        echo "${P_INFO}Generating ${altformat^^} file '$dest' from '$file' using converter '$converter'.${P_END}"
        xsl_transform "$converter" "$file" "$dest"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo "${P_ERROR}Content conversion to ${altformat^^} failed for '$file'.${P_END}"
          exitcode=1
        fi
        # TODO: validate generated file
      done
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"
shopt -u nullglob
shopt -u globstar

exit $exitcode
