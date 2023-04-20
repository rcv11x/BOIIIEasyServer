@echo off
title "Create Easy Server for BOIII v0.1"

set current_path=%cd%
set t7_server_config_url="https://codeload.github.com/Dss0/t7-server-config/zip/refs/heads/main"
set steamcmd_file=steamcmd.zip
set steamcmd_url="https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"

:menu
cls
echo.
echo +===========================================+
echo +
echo +  1) Install BOIII server in:
echo +     \__ %cd%\BOIII
echo +
echo +  2) Coming soon
echo +  3) exit
echo +
echo +===========================================+
echo.
set /p option=">> "

if %option% == 1 goto opt1
if %option% == 2 goto opt2
if %option% == 3 goto exitScript

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo. Option "%option%" is not valid
echo.
pause
echo.
goto menu

:opt1
cls
echo.
echo Installing Steamcmd...
timeout 4 > nul
curl -s %steamcmd_url% -o %current_path%\%steamcmd_file%
tar -xf %steamcmd_file%
del %steamcmd_file%
mkdir steamcmd BOIII
move steamcmd.exe %current_path%\steamcmd
cd steamcmd
cls
echo.
echo Downloading Black Ops 3 Server from Steamcmd...
timeout 4 > nul
steamcmd +force_install_dir ..\BOIII +login anonymous +app_update 545990 validate +quit
cls
cd %current_path%\BOIII
cls
echo Downloading BOIII Server files from https://github.com/Dss0/t7-server-config
timeout 4> nul
curl -s %t7_server_config_url% -o %current_path%\BOIII\UnrankedServer\main.zip
cd %current_path%\BOIII\UnrankedServer
tar -xf %current_path%\BOIII\UnrankedServer\main.zip
xcopy /s /e %current_path%\BOIII\UnrankedServer\t7-server-config-main\*.* %current_path%\BOIII\UnrankedServer
rmdir /s /q t7-server-config-main
del main.zip
echo.
cls
echo.
echo.
echo Server Installed! - Close Script
cd %current_path%
pause
goto menu



:exitScript
exit