@echo off

@echo off
color 5c
echo -
echo [OTH HOST] Deletando cache ...
echo -
rd /s /q "cache"
timeout 2
test&cls
color 0c  
echo ------------------------
echo  OTH HOST - BRASIL
echo ------------------------
echo   tt
timeout 7

pause
start /high ..\build\FXServer.exe +exec server.cfg
exit