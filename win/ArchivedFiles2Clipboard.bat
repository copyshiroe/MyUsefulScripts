REM 复制压缩包类型为  .7z .rar .zip 的所有的文件名到剪切板
for %%i in (*.7z* *.rar* *.zip*) do (echo %%i)>>benzilist.txt
clip < benzilist.txt
del benzilist.txt