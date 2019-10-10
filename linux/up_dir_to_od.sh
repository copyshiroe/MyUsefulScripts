!/bin/bash
path="/download/"
oddir="od:/inbox/"
IFS=$'\n'
for folder in [ ${path}* ];do
    if [ -d "{$folder}" ];then
        onedrivecmd put "{$folder}" ${oddir}
        #echo $folder
    fi
done
