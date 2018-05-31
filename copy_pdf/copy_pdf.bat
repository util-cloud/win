@echo off
for /f "tokens=1 delims=*" %%i in (chm_file_list.txt) do xcopy "%%i" "E:\chm_skeleon%%~pi"
pause
