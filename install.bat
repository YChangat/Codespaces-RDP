@echo off
echo Installing Google Chrome ...
cd /d %~dp0
powershell -Command "Start-Process 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile 'chrome_installer.exe' -Wait"
start /wait chrome_installer.exe /silent /install
echo Installation completed successfully !

