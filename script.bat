@echo off
setlocal enabledelayedexpansion
COLOR 0A
if (%1)==(0) goto skipme
if (%1) neq () goto adbi
echo -------------------------------------------------------------------------- >> APK-System-Pull.log
echo ^|%date% -- %time%^| >> APK-System-Pull.log
echo -------------------------------------------------------------------------- >> APK-System-Pull.log
Script 0 2>> APK-System-Pull.log

:error

:skipme
cd "%~dp0"
mode con:cols=140 lines=50
:skipme2
cls
ECHO ***************************************************************************************
ECHO *                                  APK System PULL                                    *
ECHO ***************************************************************************************
ECHO *                    Written By Gerald Wayne Baggett Jr {Raziel23x                    *
ECHO ***************************************************************************************
ECHO *                           Website: http://apkmultitool.com                          *
ECHO ***************************************************************************************
ECHO *           Empowering you to Do Your BEST where ever the path may lead you           *
ECHO ***************************************************************************************


PAUSE
:MAINMENU

cd "%~dp0"
set menunr=MULTIMENU
cls
ECHO ***************************************************************************************
ECHO *                                  APK System PULL                                    *
ECHO ***************************************************************************************
ECHO * 0. DATA PULL                                                                        *
ECHO *    Make sure Debugging is enabled on your phone                                     *
ECHO *    This dumps the ~/Data/ folder extract to %~dp0DataPull\                            *
ECHO *    This is not for "backups" but for development use.                               *
ECHO ***************************************************************************************
ECHO * 1. SYSTEM PULL                                                                      *
ECHO *    Make sure Debugging is enabled on your phone                                     *
ECHO *    This dumps the ~/system/ folder extract to %~dp0SystemPull\                      *
ECHO *    This is not for "backups" but for development use.                               *
ECHO ***************************************************************************************
ECHO * 00.  Quit                                                                           *
ECHO ***************************************************************************************
SET /P menunr=Please make your decision:
IF %menunr%==0 (goto datapull)
IF %menunr%==1 (goto systempull)
IF %menunr%==00 (goto quit)

:WHAT
ECHO ***************************************************************************************
ECHO *       You went crazy and entered something that wasnt part of the menu options      *
ECHO ***************************************************************************************
PAUSE
goto MAINMENU

:adbi
mode con:cols=48 lines=8
echo Waiting for device
"%~dp0other\adb.exe" wait-for-device
set count=0

:datapull
echo.Make sure Debugging is enabled on your phone
echo.This dumps the ~/DATA/ folder extract to %~dp0DataPull\
echo.This is not for "backups" but for development use.
pause
echo. Waiting for device...
tools\adb kill-server
tools\adb wait-for-device
echo. Device found.
	
tools\adb pull data %~dp0DataPull\
pause
echo. Data pull complete Killing ADB
tools\adb kill-server
echo. ADB KILLED NOW Returning to main menu
pause
goto MAINMENU


:systempull
echo.Make sure Debugging is enabled on your phone
echo.This dumps the ~/system/ folder extract to %~dp0SystemPull\
echo.This is not for "backups" but for development use.
pause
echo. Waiting for device...
tools\adb kill-server
tools\adb wait-for-device
echo. Device found.
	
tools\adb pull system %~dp0SystemPull\
pause
echo. System pull complete Killing ADB
tools\adb kill-server
echo. ADB KILLED NOW Returning to main menu
pause
goto MAINMENU

:quit
exit