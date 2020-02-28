
path="/download/"
time=$(date "+%Y/%m/%d %H:%M:%S")
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -en "$0" "$0" "$@" || :


IFS=$'\n'
cmpstr="galleryinfo.txt"
od="od:inbox/unread"
cd ${path}

for folder in [ ${path}* ];do
    if [ -d "${folder}" ];then
        #echo "${folder}"
        tmp=$(find "${folder}" -name "galleryinfo.txt")
        #echo "$tmp"
        if [[ "${folder}/${cmpstr}" == "$tmp" ]];then
#        folder=$(basename "${folder}")
        echo ${folder}    
        fi
    fi
done
