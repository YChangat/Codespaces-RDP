@echo off
echo Installing Google Chrome ...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/latest/chrome_installer.exe', 'chrome_installer.exe')"
start /wait chrome_installer.exe /silent /install
del /f /q chrome_installer.exe
echo Installing Playit gg ...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-windows-x86_64-signed.msi', 'playit-windows-x86_64-signed.msi')"
start /wait msiexec /i playit-windows-x86_64-signed.msi /quiet /norestart
del /f /q playit-windows-x86_64-signed.msi
echo Installation completed successfully!
pause
