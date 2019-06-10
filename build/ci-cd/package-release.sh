#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir="$1"
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

archive_dir="${working_dir}/archive"
mkdir -p "$archive_dir"

exitcode=0
shopt -s nullglob
shopt -s globstar
while IFS="|" read -r path  || [[ -n "$path" ]]; do
  shopt -s extglob
  [[ "$path" =~ ^[[:space:]]*# ]] && continue
  # remove leading space
  path="${path##+([[:space:]])}"
  # remove trailing space
  path="${path%%+([[:space:]])}"
  shopt -u extglob

  if [[ ! -z "$path" ]]; then
    files_to_process="$OSCALDIR"/"$path"
    IFS= # disable word splitting    
    for file in $files_to_process
    do
      src="$OSCALDIR/$file"
      dest="${archive_dir}/${file/$OSCALDIR\//}"
      dest_dir=${dest%/*} # remove filename

      echo "${P_INFO}Copying '$file' to '$dest'.${P_END}"
      mkdir -p "$dest_dir"
      cp "$file" "$dest"
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/release-content"
shopt -u nullglob
shopt -u globstar

exit $exitcode
