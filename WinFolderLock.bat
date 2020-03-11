@ECHO OFF
title #TheDarkRoot (WinFolderLock)
color 1a
Echo ษออออออออออออออออออออออป
Echo บ }}} #TheDarkRoot {{{ บ
Echo ศออออออออออออออออออออออผ
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
Echo    ษอออออออป
Echo    บ Error บ
Echo    ศอออออออผ
Echo.
goto CONFIRM1
:LOCK
ren WinFolder  "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
color 1a
Echo.
Echo    ษอออออออออออออออออออป
Echo    บ * Folder Lock: On บ
Echo    ศอออออออออออออออออออผ
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
Echo    ษออออออออออออออออออออป
Echo    บ * Folder Lock: Off บ
Echo    ศออออออออออออออออออออผ
goto End
:FAIL
Echo
Echo    ษออออออออออออออออออป
Echo    บ * Don't Password บ
Echo    ศออออออออออออออออออผ
goto End
:MDWinFolder
md WinFolder
Echo    ษอออออออออออออออออป
Echo    บ * Create Folder บ
Echo    ศอออออออออออออออออผ
goto End
:End