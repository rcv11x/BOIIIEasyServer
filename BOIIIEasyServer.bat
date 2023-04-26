:: Created by rec0veryyy
:: If you want to contribute to improve the script you can do it in: https://github.com/rec0veryyy/BOIIIEasyServer

@echo off
title "BOIIIEasyServer v0.1"

set CurrentPath=%cd%
set T7ServerConfigUrl="https://codeload.github.com/Dss0/t7-server-config/zip/refs/heads/main"
set SteamcmdFile=steamcmd.zip
set SteamcmdUrl="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"

:menu
cls
echo.
echo /////////////////////////////////////////////////////////////////////
echo //
echo //  1) Install BOIII server in:
echo //     \__ %CurrentPath%\BOIII
echo //
echo //  2) Coming soon
echo //  0) exit
echo //
echo /////////////////////////////////////////////////////////////////////
echo.
set /p option=">> "

if %option% == 1 goto opt1
if %option% == 2 goto opt2
if %option% == 0 goto exitScript

:: Error message, validation when an out-of-range option is selected
echo.
echo ( Option "%option%" is not valid )
echo.
pause
echo.
goto menu

:opt1
cls
echo.
echo Installing Steamcmd...
timeout 5 > nul
curl -s %SteamcmdUrl% -o %SteamcmdFile%
tar -xf %SteamcmdFile%
del %SteamcmdFile%
mkdir steamcmd BOIII
move steamcmd.exe steamcmd
cd steamcmd
cls
echo.
echo Downloading Black Ops 3 Server from Steamcmd...
timeout 5 > nul
steamcmd +force_install_dir ..\BOIII +login anonymous +app_update 545990 validate +quit
cd ..
cls
echo Downloading BOIII Server files from https://github.com/Dss0/t7-server-config
timeout 5 > nul
cd BOIII\UnrankedServer
curl -s %T7ServerConfigUrl% -o main.zip
tar -xf main.zip
xcopy /s /e t7-server-config-main\*.*
rmdir /s /q t7-server-config-main
del main.zip
echo.
cls
echo.
echo.///////////////////////////////////////////////////////////////////////////
echo //
echo //   Server Installed in: %CurrentPath%\BOIII\UnrankedServer
echo //       
echo //   Now you can edit your server in the path: UnrankedServer\zone
echo //    - For MP: server.cfg
echo //    - For ZM: server_zm.cfg
echo //   
echo //   Visit the Github wiki to configure your server: 
echo //               \__ https://github.com/rec0veryyy/BOIIIEasyServer/wiki
echo.
echo You can close the script ;)
echo.
cd %CurrentPath%
pause
goto menu


:exitScript
exit