#!/bin/bash

if [[ -z "$OSCALDIR" ]]; then
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
    source "$DIR/common-environment.sh"
fi

source $OSCALDIR/build/ci-cd/saxon-init.sh
source $OSCALDIR/build/ci-cd/init-validate-json.sh

if [ -z "$1" ]; then
  working_dir="$OSCALDIR"
else
  working_dir="$1"
fi
echo "${P_INFO}Working in '${P_END}${working_dir}${P_INFO}'.${P_END}"

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
      dest_dir=${dest%/*} # remove filename
      echo "${P_INFO}Copying '$file' to '$dest'.${P_END}"
      mkdir -p "$dest_dir"
      cp "$file" "$dest"

      IFS=","
      for altformat in "$converttoformats"; do
        newpath="${file/$OSCALDIR\/src\//}" # strip off src
        newpath="${newpath/\/$format\///$altformat/}" # change path from old to new format dir
        newpath="${newpath%.*}" # strip extension

        dest="$working_dir/${newpath}-min.${altformat}"
        converter="$working_dir/$altformat/convert/oscal_${model}_${format}-to-${altformat}-converter.xsl"

        echo "${P_INFO}Generating ${altformat^^} file '$dest' from '$file' using converter '$converter'.${P_END}"
        xsl_transform "$converter" "$file" "$dest"
        cmd_exitcode=$?
        if [ $cmd_exitcode -ne 0 ]; then
          echo "${P_ERROR}Content conversion to ${altformat^^} failed for '$file'.${P_END}"
          exitcode=1
        fi

        # Format specific post-processing
        case $altformat in
        json)
          # translate path names, starting first with the xml directory, then the filename
          # cat  NIST_SP-800-53_rev4_LOW-baseline_profile.json | perl -lpe 's/(\"(?:(?!xml)[^\/]+\/)*)xml\//\1json/' | perl -lpe 's/(\"(?:[^\/]+\/)*.+(?=\.xml\"))\.xml\"/\1.json\"/'
          perl -pi -e 's,\\/,/,g' ${dest}
          perl -pi -e 's,(application/oscal\.[a-z]+\+)xml",\1json",g' ${dest}
          perl -pi -e 's,/xml/,/json/,g' ${dest}
          perl -pi -e 's,("(?:[^"/]+/)*[^"]+(?=\.xml"))\.xml",\1.json",g' ${dest}
             
#          cp "${dest}.tmp" "${dest}"

          # validate generated file
          schema="$working_dir/json/schema/oscal_${model}_schema.json"
          result=$(validate_json "$schema" "$dest")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo "${P_ERROR}${result}${P_END}"
            echo "${P_ERROR}Validation of '${dest}' failed.${P_END}"
            exitcode=1
          fi

          # produce pretty JSON
          dest_pretty="$working_dir/${newpath}.${altformat}"
          jq . "$dest" > "$dest_pretty"
          result=$(validate_json "$schema" "$dest_pretty")
          cmd_exitcode=$?
          if [ $cmd_exitcode -ne 0 ]; then
            echo "${P_ERROR}${result}${P_END}"
            echo "${P_ERROR}Validation of '${dest_pretty}' failed.${P_END}"
            exitcode=1
          fi

          # produce yaml
          newpath="${newpath/\/json\///yaml/}" # change path 
          dest_pretty="$working_dir/${newpath}.yaml"
          dest_pretty_dir=${dest_pretty%/*} # remove filename
          mkdir -p "$dest_pretty_dir"
          prettyjson --nocolor=1 --indent=2 --inline-arrays=1 "$dest" > "$dest_pretty"
          ;;
        esac

      done
    done
  fi
done < "$OSCALDIR/build/ci-cd/config/content"

shopt -u nullglob
shopt -u globstar

exit $exitcode
