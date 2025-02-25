@echo off
echo Installing Google Chrome ...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/latest/chrome_installer.exe', 'chrome_installer.exe')"
start /wait chrome_installer.exe /silent /install
del /f /q chrome_installer.exe
echo Installation completed successfully!
