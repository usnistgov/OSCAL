#!/bin/bash

if [[ ! -v OSCALDIR ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read path format type converttoformats || [ -n "$path" ]; do
  [[ "$path" =~ ^[[:space:]]*# ]] && continue

  if [ -n "$path" ]; then
    files_to_process="$OSCALDIR/$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      printf 'file: %s\n' "$file"
      printf 'format: %s\n' "$format"
      printf 'type: %s\n' "$type"
      printf 'convert-to: %s\n' "$converttoformats"

      dest="${file/$OSCALDIR\/src\//}"
      dest_dir=${dest%/*}
      mkdir -p "$dest_dir"
      cp "$file" "$dest"

      IFS=","
      for altformat in "$converttoformats"; do
        newpath="${file/$OSCALDIR\/src\//}"
        newpath="${newpath/\/$format\///$altformat/}"
        newpath="${newpath%.$format}.$altformat"
        dest="$newpath"
        converter="$format/convert/oscal-$type-$format-to-$altformat-converter.xsl"
        xsl_transform "$converter" "$file" "$dest"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          printf 'Content conversion to %s failed for %s\n' "$altformat" "$file"
          exitcode=1
        fi
      done
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"
shopt -u nullglob
shopt -u globstar

exit $exitcode
