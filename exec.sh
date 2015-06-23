#!/bin/bash

readonly BLACK_LIST=./blacklist.txt

function search_emdivi() {
  local _filename="$1"

  while read line ; do

    #skip blank line
    local result="$(echo "${line}" | tr -d "\r" | tr -d "\n")"

    #skip comments
    if [ "$(echo "${result}" | egrep "^#" | wc -l)" -gt 0 ] || [ "${result}" == "" ]
    then
      continue
    fi

    netstat -an | grep "${result}"

  done < "${_filename}"

  return 0
}

search_emdivi "${BLACK_LIST}"
