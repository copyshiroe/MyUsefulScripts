#!/bin/bash
# 压缩当前目录下的所有文件夹为zip压缩包
for folder in *;do
    if [ -d "$folder" ];then
        zip -rm "${folder}.zip" "$folder"
    fi
done 
