:: Created by rec0veryyy
:: If you want to contribute to improve the script you can do it in: https://github.com/rec0veryyy/BOIIIEasyServer
:: Wiki: https://github.com/rec0veryyy/BOIIIEasyServer


:: Choose a path where you want to install boiii server
:: Example: set "BOIIIServerInstallPath=C:\Users\Administrador\Documents\servidor bo3"
set "BOIIIServerInstallPath="

:: Choose a path where you want to install steamcmd
set "SteamcmdInstallPath="


:: Do not modify these lines!! ::
set "CurrentPath=%cd%"
set "T7ServerConfigUrl=https://codeload.github.com/Dss0/t7-server-config/zip/refs/heads/main"
set "SteamcmdFile=steamcmd.zip"
set "SteamcmdUrl=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set "TempPath=C:\temp_boiii"
set "ScriptWikiUrl=https://github.com/rec0veryyy/BOIIIEasyServer/wiki/Create-your-server" 
set "version=0.3"

@echo off
title "BOIIIEasyServer v%version%"

:menu
cls
:::  ____        _ _ _   ______                 _____                          
::: |  _ \      (_|_|_) |  ____|               / ____|                         
::: | |_) | ___  _ _ _  | |__   __ _ ___ _   _| (___   ___ _ ____   _____ _ __ 
::: |  _ < / _ \| | | | |  __| / _` / __| | | |\___ \ / _ \ '__\ \ / / _ \ '__|
::: | |_) | (_) | | | | | |___| (_| \__ \ |_| |____) |  __/ |   \ V /  __/ |   
::: |____/ \___/|_|_|_| |______\__,_|___/\__, |_____/ \___|_|    \_/ \___|_|   
:::                                       __/ |                                
:::                                      |___/                                                

for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo.
echo /////////////////////////////////////////////////////////////////////
echo //
echo //  [!] Welcome %username%!
echo //
echo //  1) Install dedicated BOIII server
echo //  2) Install steamcmd
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
echo // INSTALLATION // 
echo.
echo.
echo [!] The server is going to be installed at: %BOIIIServerInstallPath%
echo [!] Press (y) to confirm or (n) to exit to the menu.
echo.   
set /p install_opt=">> "

if "%install_opt%" == "y" goto install_server
if "%install_opt%" == "Y" goto install_server
if "%install_opt%" == "n" goto menu
if "%install_opt%" == "N" goto menu
if "%install_opt%" == "" goto opt1

echo.
echo ( Option "%install_opt%" is not valid )
echo.
pause
echo.
goto opt1


:install_server

if not defined BOIIIServerInstallPath (
    echo.
    echo [ERROR] BOIIIServerInstallPath variable is not defined!, please set a valid directory path
    echo.
    pause
    goto opt1
) else if not exist "%BOIIIServerInstallPath%" (
    echo.
    echo [ERROR] The directory specified in BOIIIServerInstallPath does not exist or is invalid!
    echo [ERROR] Please provide a valid directory path or update the variable in the script.
    echo.
    pause
    goto opt1
) else if exist "%BOIIIServerInstallPath%\UnrankedServer" (
	echo.
    echo [Error] the server is already installed on the path: %BOIIIServerInstallPath%\UnrankedServer
    echo.
    pause
    goto opt1
) else (
	cls
	echo.
	mkdir "%BOIIIServerInstallPath%\UnrankedServer"
	mkdir "%TempPath%"
	cd /d "%TempPath%"
	curl -s "%SteamcmdUrl%" -o "%SteamcmdFile%"
	tar -xf "%SteamcmdFile%"
	del "%SteamcmdFile%"
	mkdir steamcmd BOIIITemp
	move steamcmd.exe steamcmd
	cd steamcmd
	cls
	echo.
	echo [!] Downloading Black Ops 3 Server from Steamcmd...
	timeout 5 > nul
	steamcmd +force_install_dir ..\BOIIITemp +login anonymous +app_update 545990 validate +quit
	cd ..
	cls
	echo [!] Moving data to the current directory
	echo. 
	timeout 5 > nul
	cd /d "%BOIIIServerInstallPath%\UnrankedServer"
	xcopy /s /e "%TempPath%\BOIIITemp\UnrankedServer\*.*" "%BOIIIServerInstallPath%\UnrankedServer"
	rmdir /s /q "%TempPath%"
	mkdir mods usermaps
	cls
	echo [!] Downloading BOIII Server files from https://github.com/Dss0/t7-server-config
	timeout 5 > nul
	curl -s "%T7ServerConfigUrl%" -o main.zip
	tar -xf main.zip
	xcopy /s /e t7-server-config-main\*.*
	rmdir /s /q t7-server-config-main
	del main.zip README.md
	cls
	echo.
	echo.///////////////////////////////////////////////////////////////////////////////////
	echo //
	echo //   Server Installed in: %BOIIIServerInstallPath%\UnrankedServer
	echo //       
	echo //   Visit the Github wiki to configure your server: 
	echo //               \__ https://github.com/rec0veryyy/BOIIIEasyServer/wiki
	echo //
	echo //
	echo //                   You can close the script ;)
	echo //////////////////////////////////////////////////////////////////////////////////
	echo.
	start iexplore %ScriptWikiUrl%
	cd %CurrentPath%
	pause
	goto menu
)

:opt2
cls
echo // STEAMCMD INSTALLATION // 
echo.
echo.
echo [!] Steamcmd is to be installed on: %SteamcmdInstallPath%\steamcmd
echo [!] Press (y) to confirm or (n) to exit to the menu.
echo.   
set /p install_steamcmd_opt=">> "

if "%install_steamcmd_opt%" == "y" goto install_steamcmd
if "%install_steamcmd_opt%" == "Y" goto install_steamcmd
if "%install_steamcmd_opt%" == "n" goto menu
if "%install_steamcmd_opt%" == "N" goto menu
if "%install_steamcmd_opt%" == "" goto opt2

echo.
echo ( Option "%install_steamcmd_opt%" is not valid )
echo.
pause
echo.
goto opt2

:install_steamcmd
if not defined SteamcmdInstallPath (
    echo.
    echo [ERROR] SteamcmdInstallPath variable is not defined!, please set a valid directory path
    echo.
    pause
    goto opt2
) else if not exist "%SteamcmdInstallPath%" (
    echo.
    echo [ERROR] The directory specified in SteamcmdInstallPath does not exist or is invalid!
    echo [ERROR] Please provide a valid directory path or update the variable in the script.
    echo.
    pause
    goto opt2
) else if exist "%SteamcmdInstallPath%\steamcmd" (
	echo.
    echo [Error] Steamcmd is already installed in that path: %SteamcmdInstallPath%\steamcmd
    echo.
    pause
    goto opt2
) else (
	echo [!] Installing Steamcmd...
	timeout 5 > nul
	cd /d "%SteamcmdInstallPath%"
	mkdir steamcmd
	cd steamcmd
	curl -s "%SteamcmdUrl%" -o "%SteamcmdFile%"
	tar -xf "%SteamcmdFile%"
	del "%SteamcmdFile%"
	steamcmd +quit
	::move steamcmd.exe steamcmd
	cls
	echo.
	echo //////////////////////////////////////////////////////////////////////////////////////////////
	echo //
	echo //  Steamcmd has been installed successfully
	echo //  You can open steamcmd from: %SteamcmdInstallPath%\steamcmd\steamcmd.exe
	echo //
	echo //////////////////////////////////////////////////////////////////////////////////////////////
	cd "%CurrentPath%"
	pause
	goto menu
)

:exitScript
exit