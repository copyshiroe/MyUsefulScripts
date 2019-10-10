#!/bin/bash
#usage: scriptname "%F" "%N"
path="/download/"
IFS=$'\n'
date>>${path}rod.log
echo "$1">>${path}rod.log
echo "$2">>${path}rod.log
od="od:inbox/"
if [ -d ${1} ];then
    new=${od}${2}
    rclone mkdir "${new}"
    rclone move -v "${1}" "${new}" --transfers=1 "rod.log" 2>&1
else
    rclone move -v "${1}" "${od}" --transfers=1 "rod.log" 2>&1
fi
echo -e "------------------------------------------------\n" >>rod.log
