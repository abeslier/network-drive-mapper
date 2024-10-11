@echo off

set "domainname="
set "ip="
set "sharename[0]="
set "devicename[0]="
set "sharename[0]="

set /p "username=username: "
set /p "password=password: "
cls

net use * /delete /y > nul
net use /persistent:yes > nul

setlocal enabledelayedexpansion
for /l %%i in (0,1,1) do (
    echo !devicename[%%i]! \\%ip%\!sharename[%%i]!
    net use !devicename[%%i]! \\%ip%\!sharename[%%i]! %password% /user:%domainname%\%username% > nul
)
setlocal disabledelayedexpansion

::net use

pause
