@Echo Off
title #TheDarkRoot (WinFolderLock)
color 1a
Echo ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo º }}} #TheDarkRoot {{{ º
Echo ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
Echo.
Echo Information:
Echo }}} This program is encoded by #TheDarkRoot.
Echo  * Supported Windows Systems: 7 / 8 / 8.1 / 10
Echo  - Start as administrator.
Echo  - If you do not enter a password within 60 seconds, the computer shuts down.
Echo  - Press a key to approve operations.
Echo.
Echo  - Press a key to run the program...
Echo.
pause >nul
:: BatchGotAdmin (Run as Admin code starts)
REM --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
Echo  # Requesting administrative privileges...
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
Echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
Echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
CD /D "%~dp0"
:: BatchGotAdmin (Run as Admin code ends)
:: Your codes should start from the following line
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST WinFolder  goto MDWinFolder
:CONFIRM
Echo  * Folder Lock: "L" "l"
Echo.
set/p "cho=>"
if %cho%==L goto LOCK
if %cho%==l goto LOCK
if %cho%==Lock goto LOCK
if %cho%==lock goto LOCK
if %cho%==LOCK goto LOCK
Echo.
Color 0c
Echo    ÉÍÍÍÍÍÍÍ»
Echo    º Error º
Echo    ÈÍÍÍÍÍÍÍ¼
Echo.
goto CONFIRM1
:LOCK
ren WinFolder  "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
color 1a
Echo.
Echo    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo    º * Folder Lock: On º
Echo    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
goto End
:UNLOCK
color 0c
Shutdown -s -t 60 -c "WinFolder"
Echo.
Echo.
Echo.
Echo  * Password:
Echo.
set/p "pass=>"
if NOT %pass%== Psswrd goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" WinFolder
shutdown -a
color 1a
Echo.
Echo    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo    º * Folder Lock: Off º
Echo    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
goto End
:FAIL
Echo
Echo    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo    º * Don't Password º
Echo    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
goto End
:MDWinFolder
md WinFolder
Echo    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
Echo    º * Create Folder º
Echo    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
goto End
:End
