#!/bin/bash
#usage:
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :
IFS=$'\n'
path="/download/"
cmpstr="galleryinfo.txt"
od="od:inbox/unread"
echo -e "\n[ ${time} ] /t ${0} run start" >>${path}rod.log
for folder in [ ${path}* ];do
    if [ -d "${folder}" ];then
        #echo "${folder}"
        tmp=$(find "${folder}" -name "galleryinfo.txt")
        #echo "$tmp"
        if [[ "${folder}/${cmpstr}" == "$tmp" ]];then
            #echo "${folder}"
            
            zip -rm "${folder}.zip" "$folder" 
            echo -e "------------------------\n" >>${path}rod.log
            rclone move -v "${folder}.zip" "${od}" --transfers=1 --log-file="${path}rod.log"
            echo -e "------------------------\n" >>${path}rod.log
            
        fi
    fi
done
time=$(date "+%Y/%m/%d %H:%M:%S")
echo -e "\n[ ${time} ] /t ${0} run finish" >>${path}rod.log
echo -e "------------------------------------------------\n" >>${path}rod.log
