REM 输出压缩包类型为 .7z .rar .zip 的所有的文件名到形如20190225_012533.txt的文件里
echo off
set YYYYmmdd=%date:~0,4%%date:~5,2%%date:~8,2% 
set hhmiss=%time:~0,2%%time:~3,2%%time:~6,2%
set hhmiss=%hhmiss: =0%
set "filename=%YYYYmmdd%%hhmiss%.txt"
set filename=%filename: =_%
for %%i in (*.7z* *.rar* *.zip*) do (echo %%i)>> %filename%