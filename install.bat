@echo off
echo Installing Google Chrome ...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://dl.google.com/chrome/install/latest/chrome_installer.exe', 'chrome_installer.exe')"
start /wait chrome_installer.exe /silent /install
del /f /q chrome_installer.exe
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://objects.githubusercontent.com/github-production-release-asset-2e65be/445695426/6f14ea3a-35cb-46a5-aa51-b64a8c059e43?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=releaseassetproduction%2F20250225%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20250225T110751Z&X-Amz-Expires=300&X-Amz-Signature=46ff86c0440c76897bdf1c9eb99c678a780683886175b02b2b62bd160395f842&X-Amz-SignedHeaders=host&response-content-disposition=attachment%3B%20filename%3Dplayit-windows-x86_64-signed.msi&response-content-type=application%2Foctet-stream', 'playit-windows-x86_64-signed.msi')"
start /wait playit-windows-x86_64-signed.msi /silent /install
del /f /q playit-windows-x86_64-signed.msi
echo Installation completed successfully!
