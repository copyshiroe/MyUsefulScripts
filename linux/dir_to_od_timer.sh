#!/bin/bash
IFS=$'\n'
path="/download/"
cmpstr="galleryinfo.txt"
time=$(date "+%Y/%m/%d %H:%M:%S")
echo -e "\n[ ${time} ]  ${0} run start" >>${path}rod.log
for folder in [ ${path}* ];do
    if [ -d "${folder}" ];then
        #echo "${folder}"
        tmp=$(find "${folder}" -name "galleryinfo.txt")
        #echo "$tmp"
        if [[ "${folder}/${cmpstr}" == "$tmp" ]];then
            #echo "${folder}"
            new=$(basename ${folder})
            #echo "${new}"
            od="od:inbox/"${new}
            #rclone mkdir "${od}"
            rclone move "${folder}" "${od}" --delete-empty-src-dirs --transfers=5 
#--log-file="${path}rod.log"
           # rmdir "${folder}"
        fi
    fi
done
${time}=$(date "+%Y/%m/%d %H:%M:%S")
echo -e "\n[ ${time} ]  ${0} run finish" >>${path}rod.log
echo -e "---------------------------------------------------------------------------------\n" >>${path}rod.log
