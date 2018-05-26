@echo off  
title 禁止危险端口##  
cls  
::code by Sunward    
sc query PolicyAgent|find /i "PolicyAgent"  
if %errorlevel% == 1 (  
  sc create PolicyAgent binpath= "%windir%\system32\lsass.exe" type= share start= auto displayname= "IPSEC Services" depend= RPCSS/IPSec  
)  
sc config PolicyAgent start= auto  
sc start PolicyAgent Services  
ipseccmd  -w REG -p "SUNWARD" -o -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block TCP/135" -f *+0:135:TCP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block TCP/139" -f *+0:139:TCP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block TCP/445" -f *+0:445:TCP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block TCP/1443" -f *+0:1443:TCP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block TCP/1444" -f *+0:1444:TCP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block UDP/135" -f *+0:135:UDP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block UDP/139" -f *+0:139:UDP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block UDP/445" -f *+0:445:UDP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block UDP/1443" -f *+0:1443:UDP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -r "Block UDP/1444" -f *+0:1444:UDP -n BLOCK -x >nul  
ipseccmd  -w REG -p "SUNWARD" -x >nul  
cls  
@echo 端口屏蔽完成！  
ping 127.0.0.1 -n 5 1>nul
