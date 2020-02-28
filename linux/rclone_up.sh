!/bin/bash
#usage: scriptname "%F" "%N"
path="/download/other/"
IFS=$'\n'
date>>${path}qod.log
echo "$1">>${path}qod.log
echo "$2">>${path}qod.log
od="od:inbox/"
if [ -d ${1} ];then
    new=${od}${2}
   # rclone mkdir "${new}"
    rclone move -v -P "${1}" "${new}" --transfers=1 --log-file="${path}qod.log"
else
    rclone move -v -P "${1}" "${od}" --transfers=1 --log-file="${path}qod.log"
fi
echo -e "------------------------------------------------\n" >>${path}qod.log
