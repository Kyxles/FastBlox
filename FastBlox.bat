@echo off
chcp 65001 >nul
title FastBlox - Optimize Roblox the correct way!
cls
color 4

:main
echo ███████╗ █████╗ ███████╗████████╗██████╗ ██╗      ██████╗ ██╗  ██╗
echo ██╔════╝██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██║     ██╔═══██╗╚██╗██╔╝
echo █████╗  ███████║███████╗   ██║   ██████╔╝██║     ██║   ██║ ╚███╔╝ 
echo ██╔══╝  ██╔══██║╚════██║   ██║   ██╔══██╗██║     ██║   ██║ ██╔██╗ 
echo ██║     ██║  ██║███████║   ██║   ██████╔╝███████╗╚██████╔╝██╔╝ ██╗
echo ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
echo ------------------------------------------------------------------
echo                      Welcome to FastBlox!                          
echo ------------------------------------------------------------------
echo.
echo Please choose one of the options below:
echo (1) Optimize
echo (2) Credits
echo (3) Exit
set /p main=Choice: 

if "%main%"=="1" goto optimize
if "%main%"=="2" goto credits
if "%main%"=="3" exit

:optimize
for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/Kyxles/FastBlox/main/ClientSettings/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: FastBlox installation completed!
) else (
    echo Failed to download ClientAppSettings.json
    echo.
    echo ERROR: FastBlox installation failed!
)
pause
cls
goto main

:credits
cls
echo  ██████╗██████╗ ███████╗██████╗ ██╗████████╗███████╗
echo ██╔════╝██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝
echo ██║     ██████╔╝█████╗  ██║  ██║██║   ██║   ███████╗
echo ██║     ██╔══██╗██╔══╝  ██║  ██║██║   ██║   ╚════██║
echo ╚██████╗██║  ██║███████╗██████╔╝██║   ██║   ███████║
echo  ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚══════╝
echo.
echo Kyxles/zylo - Maintaining. Developing FastBlox (github.com/Kyxles)
echo Flxne - Developer of RCO, Inspired me to make FastBlox, HUGE Shoutout (github.com/Flxne)
pause
cls
goto main